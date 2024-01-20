eksctl create cluster --name Three-Tier-K8s-EKS-Cluster --region eu-west-1 --node-type t2.medium --nodes-min 2 --nodes-max 2
aws eks update-kubeconfig --region eu-west-1 --name Three-Tier-K8s-EKS-Cluster


aws iam create-policy --policy-name AWSLoadBalancerControllerIAMPolicy --policy-document file://iam_policy.json


eksctl utils associate-iam-oidc-provider --region eu-west-1 --cluster Three-Tier-K8s-EKS-Cluster --approve


eksctl create iamserviceaccount --cluster=Three-Tier-K8s-EKS-Cluster --namespace=kube-system --name=aws-load-balancer-controller --role-name AmazonEKSLoadBalancerControllerRole --attach-policy-arn=arn:aws:iam::211125466016:policy/AWSLoadBalancerControllerIAMPolicy --approve --region=eu-west-1