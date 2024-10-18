Return-Path: <linux-arm-msm+bounces-34995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 018799A45AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 795621F22916
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242922076B8;
	Fri, 18 Oct 2024 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XS22+Iaq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE0020697D;
	Fri, 18 Oct 2024 18:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729275625; cv=none; b=qFZ7+07uapnEx8pEzQbngKwZSps1NQgdIGlTYWNARkvcRZquIMCIsL2/hkNt7VsoZnNHCbrBTVfV9KRsrheaBlY/hBdCHlT40hsNYu5JOSDfEATKpR92A5vP6nmTu7kRfNPBO7GcghrjdVpYXrme7LSQw3Ml1n5YHBgVQGfzavU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729275625; c=relaxed/simple;
	bh=Jqk9t6WqUxgOSLlvZ3OiYUOtfU662Z01mQkIZRFbT5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBCuRthCuKH1rQ5lXLOBUNeZ1i6WV0OSvWLGLMKd4KSGHAbN9LB6X4yCRGz2lJIZEVVS6kY/Oh9T0Up+hbGYlxXTjNUA4fRNRcwmYANwgoMgZ2yzeQYwBQ6QwGB/I54l17gxhMEfZcW3IcSt9aQrtdBHY5MmtlSIhKcOvF8c5z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XS22+Iaq; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5eb6abc6342so1478258eaf.0;
        Fri, 18 Oct 2024 11:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729275622; x=1729880422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTMpYIXHYNCs7bSRCpbxFRGF6reME+eyLPM7z+f7+Fc=;
        b=XS22+IaqqXUujk3Gitl8xsdZ67QD4MDiUcNzDDHvOzNGCPcnbX+0AY5xLKjMK+0+8s
         wljLMblcQoUmiDeZwoqb13GgQmsqyw2rOlCKamwdfFMCl0pvA2ExgbgIThnFQvnOIXy2
         xDui7pNzJi774cID7xctFUt5LnScCb/TYSpyh1hWp7qdOg3W8AuQLvQ6OGvDZ2ooUMCm
         3H8IWV/4cdi4E7q3CD3ZGk817lcKRZf0ttnht81MFwomUnlSEZcjgtVu4rVWl0CyqBwF
         JMzLySzHSr+WEX59qKCL1iACJzsijguUpQS+m4b8Emzp4eSigiGDGw0NFbYjLDNkb4nR
         PkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729275622; x=1729880422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTMpYIXHYNCs7bSRCpbxFRGF6reME+eyLPM7z+f7+Fc=;
        b=hmvZ7QTQ2FBNR2Nl5ztico4SCLk3YxQG8S+qUJvoGE5UK7+DoR1sBsJBIV/0xfJsbZ
         DPC6IlDB6P1ataGX3HOGn9gClPEUoQlnfnSzGg4SvQhQvUbLI1Ud3OGDwhmCyRb/OSrM
         KFRZTfvuy+UhDkyI31WTOEfnClQfz/o3qR8/+lCsfToWfOJGgEjAV0zDllSpG/ZBhc9t
         5VC1hbY3er5dmfJ2UQ3LAcpwyJb3P3w5Ox4wDIc3KGy6dP90VeZE2vaElzv1y/z8B9Dd
         UH0oD37jBtVjQ9suYDn+QdMuGfI61yhsK3UvhxFOuWNFBtpt/NEpN/a0bjSoZUPUTSc7
         h6kA==
X-Forwarded-Encrypted: i=1; AJvYcCVDmqriWoef0YpXoyq0Bqa7DtZE+JeqQib/6doVyYmotVDTeMHExL8Me2GrbTDAO9TXifmS/mi4ccVeU2UO@vger.kernel.org, AJvYcCVTCfaoWWe2iVSUdUoo2FKy0VnAEM+L5dRJwamMBIPiUEYBowfDy811mieOQ6a6rS25bIqjgELcefzV8KRZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5vo/S+hnmjkPZWPQFkC2G/m2PelcUlJ3oOrWnv4UOsXp0hRIH
	RVGH2XChZYFKk8Q5WHaVwe5eRXR3lsfNxujNvzCOlFWdYS6CflNZImEgRw==
X-Google-Smtp-Source: AGHT+IHrr5ctvzud0yteza2a9cQOrgEySRGHiYN8KdAn2gGnVum2L6yeh0XMgP24bYfrrwCWYJSZMw==
X-Received: by 2002:a05:6820:1ac5:b0:5e3:b361:e457 with SMTP id 006d021491bc7-5eb8b378a7fmr2949706eaf.1.1729275622139;
        Fri, 18 Oct 2024 11:20:22 -0700 (PDT)
Received: from localhost.localdomain (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5eb8aa2f668sm340542eaf.44.2024.10.18.11.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 11:20:21 -0700 (PDT)
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
Subject: [RFC PATCH v1 05/10] net: qrtr: Report endpoint for locally generated messages
Date: Fri, 18 Oct 2024 13:18:23 -0500
Message-ID: <20241018181842.1368394-6-denkenz@gmail.com>
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

For messages generated by the local endpoint destined
to the local endpoint, report the local endpoint identifier.  Same
QRTR_ENDPOINT auxiliary data and QRTR_REPORT_ENDPOINT socket option
semantics apply as for messages generated by remote endpoints.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
---
 net/qrtr/af_qrtr.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index cb7bd1c71e6d..568ccb1d8574 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -163,9 +163,11 @@ struct qrtr_tx_flow {
 #define QRTR_TX_FLOW_LOW	5
 
 static int qrtr_local_enqueue(struct qrtr_node *node, struct sk_buff *skb,
+			      u32 endpoint_id,
 			      int type, struct sockaddr_qrtr *from,
 			      struct sockaddr_qrtr *to);
 static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
+			      u32 endpoint_id,
 			      int type, struct sockaddr_qrtr *from,
 			      struct sockaddr_qrtr *to);
 static struct qrtr_sock *qrtr_port_lookup(int port);
@@ -349,6 +351,7 @@ static void qrtr_tx_flow_failed(struct qrtr_node *node, int dest_node,
 
 /* Pass an outgoing packet socket buffer to the endpoint driver. */
 static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
+			     u32 endpoint_id,
 			     int type, struct sockaddr_qrtr *from,
 			     struct sockaddr_qrtr *to)
 {
@@ -678,7 +681,8 @@ void qrtr_endpoint_unregister(struct qrtr_endpoint *ep)
 		skb = qrtr_alloc_ctrl_packet(&pkt, GFP_ATOMIC);
 		if (skb) {
 			pkt->cmd = cpu_to_le32(QRTR_TYPE_BYE);
-			qrtr_local_enqueue(NULL, skb, QRTR_TYPE_BYE, &src, &dst);
+			qrtr_local_enqueue(NULL, skb, endpoint_id,
+					   QRTR_TYPE_BYE, &src, &dst);
 		}
 	}
 	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
@@ -745,8 +749,8 @@ static void qrtr_port_remove(struct qrtr_sock *ipc)
 		pkt->client.port = cpu_to_le32(ipc->us.sq_port);
 
 		skb_set_owner_w(skb, &ipc->sk);
-		qrtr_bcast_enqueue(NULL, skb, QRTR_TYPE_DEL_CLIENT, &ipc->us,
-				   &to);
+		qrtr_bcast_enqueue(NULL, skb, qrtr_local_nid,
+				   QRTR_TYPE_DEL_CLIENT, &ipc->us, &to);
 	}
 
 	if (port == QRTR_PORT_CTRL)
@@ -886,6 +890,7 @@ static int qrtr_bind(struct socket *sock, struct sockaddr *saddr, int len)
 
 /* Queue packet to local peer socket. */
 static int qrtr_local_enqueue(struct qrtr_node *node, struct sk_buff *skb,
+			      u32 endpoint_id,
 			      int type, struct sockaddr_qrtr *from,
 			      struct sockaddr_qrtr *to)
 {
@@ -903,6 +908,7 @@ static int qrtr_local_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 	cb = (struct qrtr_cb *)skb->cb;
 	cb->src_node = from->sq_node;
 	cb->src_port = from->sq_port;
+	cb->endpoint_id = endpoint_id;
 
 	if (sock_queue_rcv_skb(&ipc->sk, skb)) {
 		qrtr_port_put(ipc);
@@ -917,6 +923,7 @@ static int qrtr_local_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 
 /* Queue packet for broadcast. */
 static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
+			      u32 endpoint_id,
 			      int type, struct sockaddr_qrtr *from,
 			      struct sockaddr_qrtr *to)
 {
@@ -928,11 +935,11 @@ static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 		if (!skbn)
 			break;
 		skb_set_owner_w(skbn, skb->sk);
-		qrtr_node_enqueue(node, skbn, type, from, to);
+		qrtr_node_enqueue(node, skbn, endpoint_id, type, from, to);
 	}
 	mutex_unlock(&qrtr_node_lock);
 
-	qrtr_local_enqueue(NULL, skb, type, from, to);
+	qrtr_local_enqueue(NULL, skb, endpoint_id, type, from, to);
 
 	return 0;
 }
@@ -940,12 +947,13 @@ static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 {
 	DECLARE_SOCKADDR(struct sockaddr_qrtr *, addr, msg->msg_name);
-	int (*enqueue_fn)(struct qrtr_node *, struct sk_buff *, int,
+	int (*enqueue_fn)(struct qrtr_node *, struct sk_buff *, u32, int,
 			  struct sockaddr_qrtr *, struct sockaddr_qrtr *);
 	__le32 qrtr_type = cpu_to_le32(QRTR_TYPE_DATA);
 	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
 	struct sock *sk = sock->sk;
 	struct qrtr_node *node;
+	u32 endpoint_id = qrtr_local_nid;
 	struct sk_buff *skb;
 	size_t plen;
 	u32 type;
@@ -1029,7 +1037,7 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	}
 
 	type = le32_to_cpu(qrtr_type);
-	rc = enqueue_fn(node, skb, type, &ipc->us, addr);
+	rc = enqueue_fn(node, skb, endpoint_id, type, &ipc->us, addr);
 	if (rc >= 0)
 		rc = len;
 
@@ -1061,7 +1069,8 @@ static int qrtr_send_resume_tx(struct qrtr_cb *cb)
 	pkt->client.node = cpu_to_le32(cb->dst_node);
 	pkt->client.port = cpu_to_le32(cb->dst_port);
 
-	ret = qrtr_node_enqueue(node, skb, QRTR_TYPE_RESUME_TX, &local, &remote);
+	ret = qrtr_node_enqueue(node, skb, cb->endpoint_id,
+				QRTR_TYPE_RESUME_TX, &local, &remote);
 
 	qrtr_node_release(node);
 
-- 
2.45.2


