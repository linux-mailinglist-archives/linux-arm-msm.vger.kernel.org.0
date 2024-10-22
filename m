Return-Path: <linux-arm-msm+bounces-35486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 818209ABA47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 01:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F329F1F222D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 23:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B391CEE9D;
	Tue, 22 Oct 2024 23:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O8uqpfVq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208661BD50D;
	Tue, 22 Oct 2024 23:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729641504; cv=none; b=YutaM1DLRHb0/BjlFxoNWzm8alowMwLrO75hSGviaW7fNlnjju+QYMGxzgLpe0vljTLJp7XIShMwHeIMTxg211dW1ejppKqa8a8qUa7e9CJk48+CdZAm3eBWbmanNK7h994CDnX6aUQ0yuh2MMmFCS0iAudfga2uBfhqpGr/huA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729641504; c=relaxed/simple;
	bh=hSGNsERuXpOnj5mD1JvsJFKgJ7F+L+49oiKUk4AO4fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bwD46IQ1n5uKyXaw0H/aH7+MIQMhPOkauBOG8IDK9NamkE7zGf+Sk2JW5PnQEm4j0XaZW1lGzuB97MAEXZiSzf3TMnO3xD/MMDeYrOt/pFu+WsXc2+Jz6qjyI4qo0/1nh0nLM4Yt4nJaiiyJM30lxOI6JNL2xZGOxUmSwUGt/1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O8uqpfVq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLa3s6025442;
	Tue, 22 Oct 2024 23:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8BhHv7AKGfqd/X1TNPoDzozZI272RDnDgnhCY3+4Qbg=; b=O8uqpfVqW19+2KBi
	ZOMG1/bBKHGewzK+7wlCt5k+Y64imnErPqIU1CgW2FbV2VpdOpexvIzeXUWVK4mI
	P0fyfI7069pZNLg/BaELCnI/OKKhFWGFWAqfPIvdf01v+SRulhMKFH9DAoT/2+Kg
	k6SjwfNW550b9OLEZiLcg2QEwLpWcVVKJ+tssWg0CZPLGQq43Bq0yptjPcZ93NPC
	oIyqFWNCRHmDV7JdnUxoEcLEL0ZgKxLnbBU5hJOMeYB31C1MkEVmCfE5zNen0vxY
	gHk/V5qhr1/+N7A4QSWD+ErXURLBSGJWkgPo1WSPP7QQfy77PaxGbLp3tG6RVhac
	6iCEnA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em4088xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 23:58:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MNw9Qe025711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 23:58:09 GMT
Received: from [10.110.103.186] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 16:58:08 -0700
Message-ID: <e4fe74c7-6c37-4bab-96bf-a62727dcd468@quicinc.com>
Date: Tue, 22 Oct 2024 16:58:08 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 06/10] net: qrtr: Allow sendmsg to target an
 endpoint
To: Denis Kenzior <denkenz@gmail.com>, <netdev@vger.kernel.org>
CC: Marcel Holtmann <marcel@holtmann.org>, Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241018181842.1368394-1-denkenz@gmail.com>
 <20241018181842.1368394-7-denkenz@gmail.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20241018181842.1368394-7-denkenz@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bJVsf1lranxjBNZVbI16qRrXMuOEVjWP
X-Proofpoint-GUID: bJVsf1lranxjBNZVbI16qRrXMuOEVjWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220155



On 10/18/2024 11:18 AM, Denis Kenzior wrote:
> Allow QIPCRTR family sockets to include QRTR_ENDPOINT auxiliary data
> as part of the sendmsg system call.  By including this parameter, the
> client can ask the kernel to route the message to a given endpoint, in
> situations where multiple endpoints with conflicting node identifier
> sets exist in the system.
> 
> For legacy clients, or clients that do not include QRTR_ENDPOINT data,
> the endpoint is looked up, as before, by only using the node identifier
> of the destination qrtr socket address.
> 
> Signed-off-by: Denis Kenzior <denkenz@gmail.com>
> Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
> Reviewed-by: Andy Gross <agross@kernel.org>
> ---
>   net/qrtr/af_qrtr.c | 80 +++++++++++++++++++++++++++++++++-------------
>   net/qrtr/qrtr.h    |  2 ++
>   2 files changed, 60 insertions(+), 22 deletions(-)
> 
> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index 568ccb1d8574..23749a0b0c15 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -106,6 +106,36 @@ static inline struct qrtr_sock *qrtr_sk(struct sock *sk)
>   	return container_of(sk, struct qrtr_sock, sk);
>   }
>   
> +int qrtr_msg_get_endpoint(struct msghdr *msg, u32 *out_endpoint_id)
> +{
> +	struct cmsghdr *cmsg;
> +	u32 endpoint_id = 0;
> +
> +	for_each_cmsghdr(cmsg, msg) {
> +		if (!CMSG_OK(msg, cmsg))
> +			return -EINVAL;
> +
> +		if (cmsg->cmsg_level != SOL_QRTR)
> +			continue;
> +
> +		if (cmsg->cmsg_type != QRTR_ENDPOINT)
> +			return -EINVAL;
> +
> +		if (cmsg->cmsg_len < CMSG_LEN(sizeof(u32)))
> +			return -EINVAL;
> +
> +		/* Endpoint ids start at 1 */
> +		endpoint_id = *(u32 *)CMSG_DATA(cmsg);
> +		if (!endpoint_id)
> +			return -EINVAL;
> +	}
> +
> +	if (out_endpoint_id)
> +		*out_endpoint_id = endpoint_id;

In the case when there is no cmsg attached to the msg. Would it be safer 
to assign out_endpoint_id to 0 before returning?

I see that in qrtr_sendmsg() there is a risk of using msg_endpoint_id 
without it being initialized or assigned a value in this function.

> +
> +	return 0;
> +}
> +
>   static unsigned int qrtr_local_nid = 1;
>   
>   /* for node ids */
> @@ -404,14 +434,16 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
>    *
>    * callers must release with qrtr_node_release()
>    */
> -static struct qrtr_node *qrtr_node_lookup(unsigned int nid)
> +static struct qrtr_node *qrtr_node_lookup(unsigned int endpoint_id,
> +					  unsigned int nid)
>   {
>   	struct qrtr_node *node;
>   	unsigned long flags;
> +	unsigned long key = (unsigned long)endpoint_id << 32 | nid;
>   
>   	mutex_lock(&qrtr_node_lock);
>   	spin_lock_irqsave(&qrtr_nodes_lock, flags);
> -	node = radix_tree_lookup(&qrtr_nodes, nid);
> +	node = radix_tree_lookup(&qrtr_nodes, key);
>   	node = qrtr_node_acquire(node);
>   	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
>   	mutex_unlock(&qrtr_node_lock);
> @@ -953,6 +985,7 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
>   	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
>   	struct sock *sk = sock->sk;
>   	struct qrtr_node *node;
> +	u32 msg_endpoint_id;
>   	u32 endpoint_id = qrtr_local_nid;
>   	struct sk_buff *skb;
>   	size_t plen;
> @@ -965,46 +998,48 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
>   	if (len > 65535)
>   		return -EMSGSIZE;
>   
> +	rc = qrtr_msg_get_endpoint(msg, &msg_endpoint_id);
> +	if (rc < 0)
> +		return rc;
> +
>   	lock_sock(sk);
>   
>   	if (addr) {
> -		if (msg->msg_namelen < sizeof(*addr)) {
> -			release_sock(sk);
> -			return -EINVAL;
> -		}
> +		rc = -EINVAL;
>   
> -		if (addr->sq_family != AF_QIPCRTR) {
> -			release_sock(sk);
> -			return -EINVAL;
> -		}
> +		if (msg->msg_namelen < sizeof(*addr))
> +			goto release_sock;
> +
> +		if (addr->sq_family != AF_QIPCRTR)
> +			goto release_sock;
>   
>   		rc = qrtr_autobind(sock);
> -		if (rc) {
> -			release_sock(sk);
> -			return rc;
> -		}
> +		if (rc)
> +			goto release_sock;
>   	} else if (sk->sk_state == TCP_ESTABLISHED) {
>   		addr = &ipc->peer;
>   	} else {
> -		release_sock(sk);
> -		return -ENOTCONN;
> +		rc = -ENOTCONN;
> +		goto release_sock;
>   	}
>   
>   	node = NULL;
>   	if (addr->sq_node == QRTR_NODE_BCAST) {
>   		if (addr->sq_port != QRTR_PORT_CTRL &&
>   		    qrtr_local_nid != QRTR_NODE_BCAST) {
> -			release_sock(sk);
> -			return -ENOTCONN;
> +			rc = -ENOTCONN;
> +			goto release_sock;
>   		}
>   		enqueue_fn = qrtr_bcast_enqueue;
>   	} else if (addr->sq_node == ipc->us.sq_node) {
>   		enqueue_fn = qrtr_local_enqueue;
>   	} else {
> -		node = qrtr_node_lookup(addr->sq_node);
> +		endpoint_id = msg_endpoint_id;
> +
> +		node = qrtr_node_lookup(endpoint_id, addr->sq_node);
>   		if (!node) {
> -			release_sock(sk);
> -			return -ECONNRESET;
> +			rc = endpoint_id ? -ENXIO : -ECONNRESET;
> +			goto release_sock;
>   		}
>   		enqueue_fn = qrtr_node_enqueue;
>   	}
> @@ -1043,6 +1078,7 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
>   
>   out_node:
>   	qrtr_node_release(node);
> +release_sock:
>   	release_sock(sk);
>   
>   	return rc;
> @@ -1057,7 +1093,7 @@ static int qrtr_send_resume_tx(struct qrtr_cb *cb)
>   	struct sk_buff *skb;
>   	int ret;
>   
> -	node = qrtr_node_lookup(remote.sq_node);
> +	node = qrtr_node_lookup(cb->endpoint_id, remote.sq_node);
>   	if (!node)
>   		return -EINVAL;
>   
> diff --git a/net/qrtr/qrtr.h b/net/qrtr/qrtr.h
> index 11b897af05e6..22fcecbf8de2 100644
> --- a/net/qrtr/qrtr.h
> +++ b/net/qrtr/qrtr.h
> @@ -34,4 +34,6 @@ int qrtr_ns_init(void);
>   
>   void qrtr_ns_remove(void);
>   
> +int qrtr_msg_get_endpoint(struct msghdr *msg, u32 *out_endpoint_id);
> +
>   #endif

