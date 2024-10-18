Return-Path: <linux-arm-msm+bounces-34996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F266B9A45B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB53A285B2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F72209665;
	Fri, 18 Oct 2024 18:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/93fNoT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2942D2076CF;
	Fri, 18 Oct 2024 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729275627; cv=none; b=MWJbA5VQurhohevaos/So+9ydKAane8r/JSSmWlR8Zmb6Bhhb47Bcd9P286y1uri1pNEPI4+66cmqP093/ux/A0Q68Pe08KS1B2EoP2LpLJX104eB6vUyeDU8Ot4+XxW2i8lOEpC6C5pbd5MCJeFK7txGslKTa0iFvgd7L14nTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729275627; c=relaxed/simple;
	bh=l4xxKg5YrJjM3W6imiFvX7Q+9nShLoDvCIMCu1xX1Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqo/O1o7ioRVTphu1jKpDZwuMS7U+e7n+2dhKQqA/8TXXK+rFJabAW/ew4zaub4bBClYhWtjibbcFzGKvo0moad041Ea9vbQqn/jm/mJLkuLoDwb06AEZpCjUHSo8yrdz20mTQS5rBt9x4wfDGfJ5AaNcine63ZakdwWd63N+ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/93fNoT; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5e7ff0f41caso1506359eaf.1;
        Fri, 18 Oct 2024 11:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729275624; x=1729880424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QStOGvOLdX3PrWtPehm1QP6E2mFCaI3TK2ezOt9+AZc=;
        b=k/93fNoTBmYeTlXDN9LN/bI+dcdtO9jjKSmtBCYqoOfDj15mFV/nfgN2pv1kFXawuh
         j/lFQiRuKK9EnyfQu2+B3rdbNN3egPAvD99TNZfdR4Cm+hKwSUZjw0Mir6YZGWPSfevx
         spLNzqRnB+J+niafAhKpg0qs6EdeEkixILiR3r/T/9Pj8XFI5RKmWXgu+b0LzN01r8XS
         zT+4Wv77kPXfrxnBn8bb1OHxPzrqUWlGJSM2TEvKraHvhnO7OGoEj3kPU/HMew1BG1dN
         E0vpK8fDpwsHxLqYDKGvHjlVsegV3NXskRyUs9CrQycuicyYeIgNZfXfouflUyAd1ffR
         cndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729275624; x=1729880424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QStOGvOLdX3PrWtPehm1QP6E2mFCaI3TK2ezOt9+AZc=;
        b=xAvsl7Cz8818f3Og0IeJPxAfCO042GxvBmkwNofXjS046BKmSfiOSem9TK2ajUAjXg
         +2vt6B9sZj7BJcErODf1z9z+Zm+VBGeC1YzWQyGn/HP7TVGVkUHBh6OqyBOquv+OdBGV
         fLt5Fqdus91Pt2+ah9x9Mg3SPMzrTxRQEAFSLCQCcjhAbVrdKyBorJFG8c5QqFy+ksvS
         Q0/UfLo7m+R9TFq3e/H3C+U2mGfWwyU7fVx25XiIFcRfk9q5UmsVi8ehb1cO/5w5/oyo
         NZoO531M2OTVqRhHWVoBcKbjXOtOyFj6fJvezKNeJvOY7UAWPMwJgsmMrXU9CDhpCfXM
         jsGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRUnXPkQ47uHl7UFtapbv2qep+pogs6NnC53N3HO0iTBfKXnIRVRKOkFuuWV0AdlGJAL2iFwd1ywAQ7wjJ@vger.kernel.org, AJvYcCXqC9Kh++zIvJISfxd1xhY2CANivRe+HZOb6vAxLKi2oogKIAH7RjdsaoEX480GkMhJ839cHykMRFTKp9z7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywka7SrV6J+8pDjhAamgCCQikWvDkHusBCcfX/r+Q7b84jIUvLh
	U00tVUpHBbeSltrsrFnuHYqAU/Rvobdn0sbato/pu5hEo9CpVo5mivJ3sQ==
X-Google-Smtp-Source: AGHT+IFAk9Gg0hEqUNkR1emXEUhU6U7WuiIXXdl5U5vD2KGKOyVTjw/EU2bJN3n6U3M7C7WvcK7+gA==
X-Received: by 2002:a05:6820:820:b0:5d6:ab0:b9a6 with SMTP id 006d021491bc7-5eb8c95ce67mr2181096eaf.4.1729275624105;
        Fri, 18 Oct 2024 11:20:24 -0700 (PDT)
Received: from localhost.localdomain (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5eb8aa2f668sm340542eaf.44.2024.10.18.11.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 11:20:23 -0700 (PDT)
From: Denis Kenzior <denkenz@gmail.com>
To: netdev@vger.kernel.org
Cc: denkenz@gmail.com,
	Marcel Holtmann <marcel@holtmann.org>,
	Andy Gross <agross@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 06/10] net: qrtr: Allow sendmsg to target an endpoint
Date: Fri, 18 Oct 2024 13:18:24 -0500
Message-ID: <20241018181842.1368394-7-denkenz@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018181842.1368394-1-denkenz@gmail.com>
References: <20241018181842.1368394-1-denkenz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 net/qrtr/af_qrtr.c | 80 +++++++++++++++++++++++++++++++++-------------
 net/qrtr/qrtr.h    |  2 ++
 2 files changed, 60 insertions(+), 22 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 568ccb1d8574..23749a0b0c15 100644
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
@@ -404,14 +434,16 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
  *
  * callers must release with qrtr_node_release()
  */
-static struct qrtr_node *qrtr_node_lookup(unsigned int nid)
+static struct qrtr_node *qrtr_node_lookup(unsigned int endpoint_id,
+					  unsigned int nid)
 {
 	struct qrtr_node *node;
 	unsigned long flags;
+	unsigned long key = (unsigned long)endpoint_id << 32 | nid;
 
 	mutex_lock(&qrtr_node_lock);
 	spin_lock_irqsave(&qrtr_nodes_lock, flags);
-	node = radix_tree_lookup(&qrtr_nodes, nid);
+	node = radix_tree_lookup(&qrtr_nodes, key);
 	node = qrtr_node_acquire(node);
 	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
 	mutex_unlock(&qrtr_node_lock);
@@ -953,6 +985,7 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
 	struct sock *sk = sock->sk;
 	struct qrtr_node *node;
+	u32 msg_endpoint_id;
 	u32 endpoint_id = qrtr_local_nid;
 	struct sk_buff *skb;
 	size_t plen;
@@ -965,46 +998,48 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
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
@@ -1043,6 +1078,7 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 
 out_node:
 	qrtr_node_release(node);
+release_sock:
 	release_sock(sk);
 
 	return rc;
@@ -1057,7 +1093,7 @@ static int qrtr_send_resume_tx(struct qrtr_cb *cb)
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
2.45.2


