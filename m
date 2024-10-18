Return-Path: <linux-arm-msm+bounces-34997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2030C9A45B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF7EA285C0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4E120C00A;
	Fri, 18 Oct 2024 18:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aW+h6HfU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6593A20969D;
	Fri, 18 Oct 2024 18:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729275629; cv=none; b=KlMm75/82e85FzwMJaIMpH/Z7kdGKWg4s9O0mOqPkA8M5+lMTIyJJTZn6Ogts70lj46BJh3CMtJAWgN0jY7lJKAxx7NQZz/dUaxnyS5kG3LwglaxkQ5ogfWjwZLsBKk1ySkL5Xh1B795LTAMWukaNqMdCQ86uKTfPStnN/UB8Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729275629; c=relaxed/simple;
	bh=3XACKo/pFuD+zNXmFPGHbf4kk7ld46ZIOgUe2iuHHBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SzvgrTTUJxP1sAwgRe0VNtQpgkKF/d6tEqPhvY2gbr9GNzdc1YqtKVjRp66R1mTT27j1Evw0EPs4dubE+c0ZACBeItI8kfXf+Qlyd18IqazEYyTJ/owGf+8Wbc6zjRaO7i+wPYrlKUL+Zmu4td6pmwLBoMdqxCfeVL+k5sw2K6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aW+h6HfU; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5eb70a772ccso1195294eaf.0;
        Fri, 18 Oct 2024 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729275626; x=1729880426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndKcW9vvldcHXXks3zBgM3lQGpSUMPL+gKrZxYgEdL4=;
        b=aW+h6HfUukK+MwsF2Rkbua3GUm6VAEZKyty2jst41Jjj9mzTV/oyPi1/Bm1FULzWRv
         zYh8RRmWU52m4q3/TqjqbpGni0DY1V8kQmc5xLAMAXWQLt7V00BcD9d3U1aaHhIsoKaw
         ZX3SI0OoL9VpHOnAjCWGm4LedRCQjNto6HPhYZx3bcg6GT3Kj9ny9mQZbP1Tb6F5Bnaj
         C0HOLZ4I/SZ9MBc6L2QIY0jP/dkE5SMFH6rFfAL15hkuO8le3sKG/gZ9n26MBF9f3rla
         pfxbsQWdMugOQYKU77+GJq5UZBp7tBI4tLvEDvFcnlN1QBybLm50Mta+1Sf4dqJ6ol6p
         In+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729275626; x=1729880426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndKcW9vvldcHXXks3zBgM3lQGpSUMPL+gKrZxYgEdL4=;
        b=gchnV7IGvPfHNbsDkmgaDQFDVNo43ZvGD0ifGNtG9l71230Y/4/afXvPeMyRJtmTky
         PrACX8ueXLbpG/jtgLbQ2H8ZKD+QXhKorWA2NJBAPR0gPiM88WSt5viF4rK+/H3pHntJ
         0Jp98W02jRnVPUySYagv+fV6UxviofV1mgx+q7j9fNRPPeCYmC7wagqmmhDyn72vFjkX
         EAn++5Y0cocpPaLbTXi9yGTRLCM7uqrgNC7HTVvSuCk1P0Toa45xNf6aaV2ALcPiqkwR
         XqCGuINN8bPAy1M5Rr4S3MG5na3gEJSfCV5nVOGH+8uOOCiQoDXRCg1pDR2Rs2IHGSzB
         RjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoXqBk9xhycRehwqR07++fAxkN5o+RfaGSDVaB3g4e+i5KCOtRAeFJNJDOo6MxaBESg908KgluburXYkBq@vger.kernel.org, AJvYcCVfqYKA6GVeJp4cRC7fbl/zEBcui+/MxAtombYBwJitAXtvDx/VjOclRuBifhM0ctRQf3CrI+djs8igoNpF@vger.kernel.org
X-Gm-Message-State: AOJu0YxhdnFdpKGl/eL2MrNfOyD8CNQwhpKTr8amiwEfjVwf1PYzUD4J
	edvnZ97jUWOb+t5+c3b2/LOv3lDkEt0mLBZ4PqbSsGIJ8/Nwzcw4TAKXrg==
X-Google-Smtp-Source: AGHT+IHOOMjMq52wLrdAP+g4LwRWu1SqN7ru4viQIFijEXQNfxYMvFv0Wz4XN7fg+mnLor72B1cwQQ==
X-Received: by 2002:a05:6820:610:b0:5eb:7e7c:5303 with SMTP id 006d021491bc7-5eb8b3a7aa3mr2374335eaf.2.1729275626329;
        Fri, 18 Oct 2024 11:20:26 -0700 (PDT)
Received: from localhost.localdomain (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5eb8aa2f668sm340542eaf.44.2024.10.18.11.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 11:20:25 -0700 (PDT)
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
Subject: [RFC PATCH v1 07/10] net: qrtr: allow socket endpoint binding
Date: Fri, 18 Oct 2024 13:18:25 -0500
Message-ID: <20241018181842.1368394-8-denkenz@gmail.com>
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
index 23749a0b0c15..b2f9c25ba8f8 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -98,6 +98,7 @@ struct qrtr_sock {
 	struct sockaddr_qrtr us;
 	struct sockaddr_qrtr peer;
 	unsigned long flags;
+	u32 bound_endpoint;
 };
 
 static inline struct qrtr_sock *qrtr_sk(struct sock *sk)
@@ -587,9 +588,13 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
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
@@ -928,29 +933,41 @@ static int qrtr_local_enqueue(struct qrtr_node *node, struct sk_buff *skb,
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
@@ -1034,7 +1051,8 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	} else if (addr->sq_node == ipc->us.sq_node) {
 		enqueue_fn = qrtr_local_enqueue;
 	} else {
-		endpoint_id = msg_endpoint_id;
+		endpoint_id = msg_endpoint_id ?
+			      msg_endpoint_id : ipc->bound_endpoint;
 
 		node = qrtr_node_lookup(endpoint_id, addr->sq_node);
 		if (!node) {
@@ -1313,6 +1331,9 @@ static int qrtr_setsockopt(struct socket *sock, int level, int optname,
 	case QRTR_REPORT_ENDPOINT:
 		assign_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags, val);
 		break;
+	case QRTR_BIND_ENDPOINT:
+		ipc->bound_endpoint = val;
+		break;
 	default:
 		rc = -ENOPROTOOPT;
 	}
@@ -1346,6 +1367,9 @@ static int qrtr_getsockopt(struct socket *sock, int level, int optname,
 	case QRTR_REPORT_ENDPOINT:
 		val = test_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags);
 		break;
+	case QRTR_BIND_ENDPOINT:
+		val = ipc->bound_endpoint;
+		break;
 	default:
 		rc = -ENOPROTOOPT;
 	}
-- 
2.45.2


