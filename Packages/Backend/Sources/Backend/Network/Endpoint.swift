import Foundation

public enum Endpoint {
    case subreddit(name: String, sort: String?)
    case searchSubreddit
    case comments(name: String, id: String)
    case accessToken
    case me, mineSubscriptions
    
    func path() -> String {
        switch self {
        case let .subreddit(name, sort):
            if name == "top" || name == "best" || name == "new" || name == "rising" || name == "hot" {
                return name
            } else if let sort = sort {
                return "r/\(name)/\(sort)"
            } else {
                return "r/\(name)"
            }
        case .searchSubreddit:
            return "api/search_subreddits"
        case let .comments(name, id):
            return "r/\(name)/comments/\(id)"
        case .accessToken:
            return "api/v1/access_token"
        case .me:
            return "api/v1/me"
        case .mineSubscriptions:
            return "subreddits/mine/subscriber"
        }
    }
}
