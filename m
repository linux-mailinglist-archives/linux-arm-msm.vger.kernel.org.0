Return-Path: <linux-arm-msm+bounces-66920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD23B140A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 18:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F49D167B61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3D427A444;
	Mon, 28 Jul 2025 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="gULdd0XN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19CF2777E5;
	Mon, 28 Jul 2025 16:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753721151; cv=none; b=dNMBpGGBZo7fNkhsRq7b13+KMOqf63Y7cftFGbO75KqAETsoENagOUoTmmLa8oc6ju3Isanl16UdKG63iT1+dfMKs0fYiV8ko/TM/gmF816N4tfS6FjaeOCkmyAsqqayORHHuGOxxmkQyGABdhJ6j7U7ldq4OVgoKElZBsnqVEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753721151; c=relaxed/simple;
	bh=sRagXtAjFHraUlfzUojvn06V/iNinnpjcwDbfzALuaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+nmOxNgIb4LBKMYAw9sauTK6cE+B1QOPPhQB1cj96wxM311v/Z7YDefE+UzzwUidedL8DBfcaC/kpoL516AyqVhFaL/nK44hBZeHgSgv6n2Y9AiB3dcubNMdCliem6NLRQwdVQwv9qKcMmH8/LifPJqjwivT+sNWhZjNagbpY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=gULdd0XN; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753721138; bh=sRagXtAjFHraUlfzUojvn06V/iNinnpjcwDbfzALuaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gULdd0XNljbkpbfUJNDkAizzup+KoOxrUfoMnneHveMU2jcPgDqok6pNDSe4CAhUf
	 XntwKYcd67pv4EOvkCsoqjTPKurEj15Xq6RWuui/phXrBeRFDjScoxOAdR0u9qW10t
	 SpUPI6XBFtpv6FB3EioyQ2WE073WFFsZdYOenCOw=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id AD94C1488DAC;
	Mon, 28 Jul 2025 18:45:38 +0200 (CEST)
From: Mihai Moldovan <ionic@ionic.de>
To: linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Denis Kenzior <denkenz@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v4 07/11] net: qrtr: Allow sendmsg to target an endpoint
Date: Mon, 28 Jul 2025 18:45:24 +0200
Message-ID: <a30dffc70b84ef33009ac3cd2e5a941fd3cff48f.1753720935.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1753720934.git.ionic@ionic.de>
References: <cover.1753720934.git.ionic@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Kenzior <denkenz@gmail.com>

Allow QIPCRTR family sockets to include QRTR_ENDPOINT auxiliary data
as part of the sendmsg system call.  By including this parameter, the
client can ask the kernel to route the message to a given endpoint, in
situations where multiple endpoints with conflicting node identifier
sets exist in the system.

For legacy clients, or clients that do not include QRTR_ENDPOINT data,
the endpoint is looked up, as before, by only using the node identifier
of the destination qrtr socket address.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>

---

v4:
  - no changes
  - Link to v3: https://msgid.link/4b812aeb566819045dfca401bd06656ea612a4ec.1753312999.git.ionic@ionic.de

v3:
  - rebase against current master
  - port [endpoint ID|node ID] key usage in qrtr_node_lookup() to the generic
    solution already established for the [node ID|port number] usage
  - Link to v2: https://msgid.link/fc510e5f0bae7e2d2cc5c0349ee7c166840b9154.1752947108.git.ionic@ionic.de

v2:
  - rebase against current master
  - no action on review comment regarding initializing out_endpoint_id,
    since that's rightfully already being done
  - Link to v1: https://msgid.link/20241018181842.1368394-7-denkenz@gmail.com
---
 net/qrtr/af_qrtr.c | 89 ++++++++++++++++++++++++++++++++++------------
 net/qrtr/qrtr.h    |  2 ++
 2 files changed, 68 insertions(+), 23 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 8ddaebbd76d2..fa88a8ed4d8c 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -106,6 +106,36 @@ static inline struct qrtr_sock *qrtr_sk(struct sock *sk)
 	return container_of(sk, struct qrtr_sock, sk);
 }
 
+int qrtr_msg_get_endpoint(struct msghdr *msg, u32 *out_endpoint_id)
+{
+	struct cmsghdr *cmsg;
+	u32 endpoint_id = 0;
+
+	for_each_cmsghdr(cmsg, msg) {
+		if (!CMSG_OK(msg, cmsg))
+			return -EINVAL;
+
+		if (cmsg->cmsg_level != SOL_QRTR)
+			continue;
+
+		if (cmsg->cmsg_type != QRTR_ENDPOINT)
+			return -EINVAL;
+
+		if (cmsg->cmsg_len < CMSG_LEN(sizeof(u32)))
+			return -EINVAL;
+
+		/* Endpoint ids start at 1 */
+		endpoint_id = *(u32 *)CMSG_DATA(cmsg);
+		if (!endpoint_id)
+			return -EINVAL;
+	}
+
+	if (out_endpoint_id)
+		*out_endpoint_id = endpoint_id;
+
+	return 0;
+}
+
 static unsigned int qrtr_local_nid = 1;
 
 /* for node ids */
@@ -456,14 +486,23 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
  *
  * callers must release with qrtr_node_release()
  */
-static struct qrtr_node *qrtr_node_lookup(unsigned int nid)
+static struct qrtr_node *qrtr_node_lookup(unsigned int endpoint_id,
+					  unsigned int nid)
 {
-	struct qrtr_node *node;
+	struct qrtr_node *node = NULL;
 	unsigned long flags;
+	unsigned long key = 0;
+
+	if (endpoint_id > QRTR_INDEX_HALF_UNSIGNED_MAX ||
+	    nid > QRTR_INDEX_HALF_UNSIGNED_MAX)
+		return node;
+
+	key = ((unsigned long)(endpoint_id) << QRTR_INDEX_HALF_BITS) |
+	      ((unsigned long)(nid) & QRTR_INDEX_HALF_UNSIGNED_MAX);
 
 	mutex_lock(&qrtr_node_lock);
 	spin_lock_irqsave(&qrtr_nodes_lock, flags);
-	node = radix_tree_lookup(&qrtr_nodes, nid);
+	node = radix_tree_lookup(&qrtr_nodes, key);
 	node = qrtr_node_acquire(node);
 	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
 	mutex_unlock(&qrtr_node_lock);
@@ -1028,6 +1067,7 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
 	struct sock *sk = sock->sk;
 	struct qrtr_node *node;
+	u32 msg_endpoint_id;
 	u32 endpoint_id = qrtr_local_nid;
 	struct sk_buff *skb;
 	size_t plen;
@@ -1040,46 +1080,48 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	if (len > 65535)
 		return -EMSGSIZE;
 
+	rc = qrtr_msg_get_endpoint(msg, &msg_endpoint_id);
+	if (rc < 0)
+		return rc;
+
 	lock_sock(sk);
 
 	if (addr) {
-		if (msg->msg_namelen < sizeof(*addr)) {
-			release_sock(sk);
-			return -EINVAL;
-		}
+		rc = -EINVAL;
 
-		if (addr->sq_family != AF_QIPCRTR) {
-			release_sock(sk);
-			return -EINVAL;
-		}
+		if (msg->msg_namelen < sizeof(*addr))
+			goto release_sock;
+
+		if (addr->sq_family != AF_QIPCRTR)
+			goto release_sock;
 
 		rc = qrtr_autobind(sock);
-		if (rc) {
-			release_sock(sk);
-			return rc;
-		}
+		if (rc)
+			goto release_sock;
 	} else if (sk->sk_state == TCP_ESTABLISHED) {
 		addr = &ipc->peer;
 	} else {
-		release_sock(sk);
-		return -ENOTCONN;
+		rc = -ENOTCONN;
+		goto release_sock;
 	}
 
 	node = NULL;
 	if (addr->sq_node == QRTR_NODE_BCAST) {
 		if (addr->sq_port != QRTR_PORT_CTRL &&
 		    qrtr_local_nid != QRTR_NODE_BCAST) {
-			release_sock(sk);
-			return -ENOTCONN;
+			rc = -ENOTCONN;
+			goto release_sock;
 		}
 		enqueue_fn = qrtr_bcast_enqueue;
 	} else if (addr->sq_node == ipc->us.sq_node) {
 		enqueue_fn = qrtr_local_enqueue;
 	} else {
-		node = qrtr_node_lookup(addr->sq_node);
+		endpoint_id = msg_endpoint_id;
+
+		node = qrtr_node_lookup(endpoint_id, addr->sq_node);
 		if (!node) {
-			release_sock(sk);
-			return -ECONNRESET;
+			rc = endpoint_id ? -ENXIO : -ECONNRESET;
+			goto release_sock;
 		}
 		enqueue_fn = qrtr_node_enqueue;
 	}
@@ -1118,6 +1160,7 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 
 out_node:
 	qrtr_node_release(node);
+release_sock:
 	release_sock(sk);
 
 	return rc;
@@ -1132,7 +1175,7 @@ static int qrtr_send_resume_tx(struct qrtr_cb *cb)
 	struct sk_buff *skb;
 	int ret;
 
-	node = qrtr_node_lookup(remote.sq_node);
+	node = qrtr_node_lookup(cb->endpoint_id, remote.sq_node);
 	if (!node)
 		return -EINVAL;
 
diff --git a/net/qrtr/qrtr.h b/net/qrtr/qrtr.h
index 11b897af05e6..22fcecbf8de2 100644
--- a/net/qrtr/qrtr.h
+++ b/net/qrtr/qrtr.h
@@ -34,4 +34,6 @@ int qrtr_ns_init(void);
 
 void qrtr_ns_remove(void);
 
+int qrtr_msg_get_endpoint(struct msghdr *msg, u32 *out_endpoint_id);
+
 #endif
-- 
2.50.0


