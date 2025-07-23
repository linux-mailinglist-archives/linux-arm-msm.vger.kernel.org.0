Return-Path: <linux-arm-msm+bounces-66403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDA0B0FD7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 01:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 115301CC389C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 23:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3422927FB01;
	Wed, 23 Jul 2025 23:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="lsLp7gBD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC05277818;
	Wed, 23 Jul 2025 23:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753313081; cv=none; b=TFztan+Jm/bCQIiCK811hSk24kXn7CSiE8OPb5kUjpzJaQJv4MzPJUgxZPZInoVghQeXCRLEK89jNIXh0v4dvNkTpXV3vIkJ93kMC52mKUoUJE5adKIofJFEkcGmGrO6HVc+SgcWmKDjMsvyGTdiiX76pMTuhAcL101wq/oRhTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753313081; c=relaxed/simple;
	bh=394k02VWPLr5d4b6jlCL5bkCKmE8dxlNZWjV9Ybv4os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BtVcYTeDRO/Y4tRjngTYD7FYb0QIv5JqzCfjW5mc3yUW0ZRQYi72l3uws2yrEbTg0vV6bgSN7dqttLHCNAZ5tBG7JBP3zgNAZBZ0lJMgBjQwZCeYpHkA7B3dY82VLgtRVq0YmOyAIdsbonSaRJKMIwWVyzu3doqKrfNv7TjTxeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=lsLp7gBD; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753313067; bh=394k02VWPLr5d4b6jlCL5bkCKmE8dxlNZWjV9Ybv4os=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lsLp7gBDcpqrNvLeYJWixYFOiO1uG3De+1m+UKcgOcwHmxNpdtbdawWX3Jn87LZMg
	 aEAMmTiSYQizUVp4cAKXU5M7oKjt1I5YJJVXN0AdO2YwI6Zvt3TAHqgudxbQVVA838
	 zOK6PrC+cO+GwNU9scWSsbeW5VpvNsyCMbaOw83w=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id D34BB148A06B;
	Thu, 24 Jul 2025 01:24:26 +0200 (CEST)
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
Subject: [PATCH v3 08/11] net: qrtr: allow socket endpoint binding
Date: Thu, 24 Jul 2025 01:24:05 +0200
Message-ID: <b523ece3e16dc4c8a9acf740aba5270227a2a2b8.1753313000.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1753312999.git.ionic@ionic.de>
References: <cover.1753312999.git.ionic@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Kenzior <denkenz@gmail.com>

Introduce the ability to bind a QIPCRTR family socket to a specific
endpoint.  When a socket is bound, only messages from the bound
endpoint can be received, and any messages sent from the socket are
by default directed to the bound endpoint.  Clients can bind a socket
by using the setsockopt system call with the QRTR_BIND_ENDPOINT option
set to the desired endpoint binding.

A previously set binding can be reset by setting QRTR_BIND_ENDPOINT
option to zero.  This behavior matches that of SO_BINDTOIFINDEX.

This functionality is useful for clients that need to communicate
with a specific device (i.e. endpoint), such as a PCIe-based 5G modem,
and are not interested in messages from other endpoints / nodes.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>

---

v3:
  - rebase against current master
  - Link to v2: https://msgid.link/c914eae5bd8d4a3924cc3c00c1dd5810024678f5.1752947108.git.ionic@ionic.de

v2:
  - rebase against current master
  - use WRITE_ONCE() to write value in qrtr_setsockopt() and READ_ONCE()
    to read it in qrtr_getsockopt() as per review comment
  - Link to v1: https://msgid.link/20241018181842.1368394-8-denkenz@gmail.com
---
 include/uapi/linux/qrtr.h |  1 +
 net/qrtr/af_qrtr.c        | 54 ++++++++++++++++++++++++++++-----------
 2 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/include/uapi/linux/qrtr.h b/include/uapi/linux/qrtr.h
index 6d0911984a05..0a8667b049c3 100644
--- a/include/uapi/linux/qrtr.h
+++ b/include/uapi/linux/qrtr.h
@@ -48,6 +48,7 @@ struct qrtr_ctrl_pkt {
 
 /* setsockopt / getsockopt */
 #define QRTR_REPORT_ENDPOINT 1
+#define QRTR_BIND_ENDPOINT 2
 
 /* CMSG */
 #define QRTR_ENDPOINT 1
diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index cd311ac045c2..fa22a27ec5d2 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -98,6 +98,7 @@ struct qrtr_sock {
 	struct sockaddr_qrtr us;
 	struct sockaddr_qrtr peer;
 	unsigned long flags;
+	u32 bound_endpoint;
 };
 
 static inline struct qrtr_sock *qrtr_sk(struct sock *sk)
@@ -662,9 +663,13 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 		if (!ipc)
 			goto err;
 
-		if (sock_queue_rcv_skb(&ipc->sk, skb)) {
-			qrtr_port_put(ipc);
-			goto err;
+		/* Sockets bound to an endpoint only rx from that endpoint */
+		if (!ipc->bound_endpoint ||
+		    ipc->bound_endpoint == cb->endpoint_id) {
+			if (sock_queue_rcv_skb(&ipc->sk, skb)) {
+				qrtr_port_put(ipc);
+				goto err;
+			}
 		}
 
 		qrtr_port_put(ipc);
@@ -1005,29 +1010,41 @@ static int qrtr_local_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 {
 	struct qrtr_sock *ipc;
 	struct qrtr_cb *cb;
+	int ret = -ENODEV;
 
 	ipc = qrtr_port_lookup(to->sq_port);
-	if (!ipc || &ipc->sk == skb->sk) { /* do not send to self */
-		if (ipc)
-			qrtr_port_put(ipc);
-		kfree_skb(skb);
-		return -ENODEV;
-	}
+	if (!ipc)
+		goto done;
+
+	if (&ipc->sk == skb->sk) /* do not send to self */
+		goto done;
+
+	/*
+	 * Filter out unwanted packets that are not on behalf of the bound
+	 * endpoint.  Certain special packets (such as an empty NEW_SERVER
+	 * packet that serves as a sentinel value) always go through.
+	 */
+	if (endpoint_id && ipc->bound_endpoint &&
+	    ipc->bound_endpoint != endpoint_id)
+		goto done;
 
 	cb = (struct qrtr_cb *)skb->cb;
 	cb->src_node = from->sq_node;
 	cb->src_port = from->sq_port;
 	cb->endpoint_id = endpoint_id;
 
-	if (sock_queue_rcv_skb(&ipc->sk, skb)) {
-		qrtr_port_put(ipc);
-		kfree_skb(skb);
-		return -ENOSPC;
-	}
+	ret = -ENOSPC;
+	if (sock_queue_rcv_skb(&ipc->sk, skb))
+		goto done;
 
 	qrtr_port_put(ipc);
 
 	return 0;
+done:
+	if (ipc)
+		qrtr_port_put(ipc);
+	kfree_skb(skb);
+	return ret;
 }
 
 /* Queue packet for broadcast. */
@@ -1113,7 +1130,8 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	} else if (addr->sq_node == ipc->us.sq_node) {
 		enqueue_fn = qrtr_local_enqueue;
 	} else {
-		endpoint_id = msg_endpoint_id;
+		endpoint_id = msg_endpoint_id ?
+			      msg_endpoint_id : ipc->bound_endpoint;
 
 		node = qrtr_node_lookup(endpoint_id, addr->sq_node);
 		if (!node) {
@@ -1389,6 +1407,9 @@ static int qrtr_setsockopt(struct socket *sock, int level, int optname,
 	case QRTR_REPORT_ENDPOINT:
 		assign_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags, val);
 		break;
+	case QRTR_BIND_ENDPOINT:
+		WRITE_ONCE(ipc->bound_endpoint, val);
+		break;
 	default:
 		rc = -ENOPROTOOPT;
 	}
@@ -1417,6 +1438,9 @@ static int qrtr_getsockopt(struct socket *sock, int level, int optname,
 	case QRTR_REPORT_ENDPOINT:
 		val = test_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags);
 		break;
+	case QRTR_BIND_ENDPOINT:
+		val = READ_ONCE(ipc->bound_endpoint);
+		break;
 	default:
 		rc = -ENOPROTOOPT;
 	}
-- 
2.50.0


