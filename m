Return-Path: <linux-arm-msm+bounces-34994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE3C9A45AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFE801C21A07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0FF206978;
	Fri, 18 Oct 2024 18:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtdn81k8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B23E204943;
	Fri, 18 Oct 2024 18:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729275623; cv=none; b=Modh/xsDkuBVP/Q1B51nza+6xJ6Z+769t8IBKMYQ42P8u/M+LnafWGQ/JjazXtBWdWaIqdiTEPB1gLNp5BUpXxV2oH2IQaYe8NMFoxkDs8Oh/HNQZw6XDce0rBrRHi/d1wKt/ev0UfzgNVl5RTr7IB/4kbjoJQyYFbCmYXBX6HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729275623; c=relaxed/simple;
	bh=42N8FciEStj25u9SRmfxdwezJlhIErqX4t77tU6oh/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmwLid2HB9p5ufhhQUCmvXYseK6QQ2fuULJph3BnCXz6ghsyDVxXkBOfmCmLgMqY86LxUGJb8pusgVMXRHitbb3TY5TODmlVlzAzNG8eJ70osWvthaS53DnEmbeXcsoQRgNUZjjKw52IO0s8Ru8dC9usMAZvBflzSmtIA8fQISI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtdn81k8; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5eb5be68c7dso1290680eaf.0;
        Fri, 18 Oct 2024 11:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729275620; x=1729880420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZczAMi2hDqPWVMrpvbf8BFefPSLZzPya8/DNabzq6mw=;
        b=mtdn81k82N53/fDnGZrJGi95VvRNwqXNNznQNiBgB1HBBxgtARUzIWPbgoWwhpSjPk
         Y7ouaopXunrDacwdelRFmlcVmIOBNC7yDyfBp6FjzufoNGBMflCDUsfBMViP7r3Ifs/F
         H00QVnzbaTR4YhsdEg8qxPaACz0ssQsymOmDKMmlQ8J2KdjD1oLsuoJ6z7QebmRnRrVC
         3kr3yEaQQlpftoWgdTuuwjKWLLs5vRA8yglo6bvtoUyaI5AoG6aawiJHkhdvBt9+H/aw
         cP/0/zpUSWJ8/yL0a1B4TTr6GVmIMwqRrCEs0q3iI4Y26VCcOwo9itOUudOAXmT2Ec4/
         Tgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729275620; x=1729880420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZczAMi2hDqPWVMrpvbf8BFefPSLZzPya8/DNabzq6mw=;
        b=Nn8b29u0Ie32XAh7W6EBtS1fSrigTi3MAxXwawDXyF/2vHCJj9SNZlzJ6sII3TkkTd
         AGC1PD4YKIa7wSj3M9I41AmOSzducBGsXibD0VH/OkvtdEs3skr03sxhLyiOIsceXfTi
         9objk3bxauafYN8uWXB8srQ+iM+SOxugb9vW8ZzznkMfD9WNjj1+XPaZBys8Nb6SRGSn
         nKhoE1cosbtYIBM1wP65KGhBFk9/sfLfXDiZO6qHU8n+ed1RFQFKJN9JxexaDwP3ZGSr
         01IQ+nKjcIOKZ9p2TeFZU2VSd2N+VG/I/MvcbS49d/L94EmV+apJLgzk9M8P6GPPtaTw
         k3qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqWDPMC/RMmfVYldxZwfZQO0FyE8sMpMmo8yCeqpqViqMA4iIi4NsN9FNY//j34rFHLMZpnfGAGJtYapau@vger.kernel.org, AJvYcCXA726n6+Ou8Or18cO7I/Gmk/vmBV3D7190LRkAMYgTR1AkP9fA0os0Ggux1BAFR1t2JIwkAY9etiXfiDpr@vger.kernel.org
X-Gm-Message-State: AOJu0YyWnzzVGtAt55xBCgqiNswt2A9ojHuwBImgnPnz+Z6NLSujh2qi
	jpU6i19nLUdzHFUl0M8IsCJyr0PH5/W/3sexdYJpYW8EGWwuVadEUGRexA==
X-Google-Smtp-Source: AGHT+IECMyRQDXwQa1ChpcsRURplDsYElR0Gfmuwtu0DhTGmjYpZKuJZIRc6M7V2ub+V0BTGdcM9XA==
X-Received: by 2002:a05:6820:151a:b0:5e5:d0c8:8030 with SMTP id 006d021491bc7-5eb8b551749mr3017383eaf.3.1729275620066;
        Fri, 18 Oct 2024 11:20:20 -0700 (PDT)
Received: from localhost.localdomain (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5eb8aa2f668sm340542eaf.44.2024.10.18.11.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 11:20:19 -0700 (PDT)
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
	Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Gabriel Krisman Bertazi <krisman@suse.de>,
	Mina Almasry <almasrymina@google.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v1 04/10] net: qrtr: Report sender endpoint in aux data
Date: Fri, 18 Oct 2024 13:18:22 -0500
Message-ID: <20241018181842.1368394-5-denkenz@gmail.com>
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

Introduce support for reporting the remote endpoint that generated a
given QRTR message to clients using AF_QIPCRTR family sockets. This is
achieved by including QRTR_ENDPOINT auxiliary data, which carries the
endpoint identifier of the message sender.  To receive this auxiliary
data, clients must explicitly opt-in by using setsockopt with the
QRTR_REPORT_ENDPOINT option enabled.

Implementation of getsockopt and setsockopt is provided.  An additional
level 'SOL_QRTR' is added to socket.h for use by AF_QIPCRTR family
sockets.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
---
 include/linux/socket.h    |  1 +
 include/uapi/linux/qrtr.h |  6 +++
 net/qrtr/af_qrtr.c        | 87 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index d18cc47e89bd..7491884340cf 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -386,6 +386,7 @@ struct ucred {
 #define SOL_MCTP	285
 #define SOL_SMC		286
 #define SOL_VSOCK	287
+#define SOL_QRTR	288
 
 /* IPX options */
 #define IPX_TYPE	1
diff --git a/include/uapi/linux/qrtr.h b/include/uapi/linux/qrtr.h
index f7e2fb3d752b..6d0911984a05 100644
--- a/include/uapi/linux/qrtr.h
+++ b/include/uapi/linux/qrtr.h
@@ -46,4 +46,10 @@ struct qrtr_ctrl_pkt {
 	};
 } __packed;
 
+/* setsockopt / getsockopt */
+#define QRTR_REPORT_ENDPOINT 1
+
+/* CMSG */
+#define QRTR_ENDPOINT 1
+
 #endif /* _LINUX_QRTR_H */
diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index e83d491a8da9..cb7bd1c71e6d 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -26,6 +26,10 @@
 
 #define QRTR_PORT_CTRL_LEGACY 0xffff
 
+enum {
+	QRTR_F_REPORT_ENDPOINT,
+};
+
 /**
  * struct qrtr_hdr_v1 - (I|R)PCrouter packet header version 1
  * @version: protocol version
@@ -79,6 +83,7 @@ struct qrtr_cb {
 	u32 src_port;
 	u32 dst_node;
 	u32 dst_port;
+	u32 endpoint_id;
 
 	u8 type;
 	u8 confirm_rx;
@@ -92,6 +97,7 @@ struct qrtr_sock {
 	struct sock sk;
 	struct sockaddr_qrtr us;
 	struct sockaddr_qrtr peer;
+	unsigned long flags;
 };
 
 static inline struct qrtr_sock *qrtr_sk(struct sock *sk)
@@ -513,6 +519,8 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 	if (cb->dst_port == QRTR_PORT_CTRL_LEGACY)
 		cb->dst_port = QRTR_PORT_CTRL;
 
+	cb->endpoint_id = ep->id;
+
 	if (!size || len != ALIGN(size, 4) + hdrlen)
 		goto err;
 
@@ -1064,6 +1072,7 @@ static int qrtr_recvmsg(struct socket *sock, struct msghdr *msg,
 			size_t size, int flags)
 {
 	DECLARE_SOCKADDR(struct sockaddr_qrtr *, addr, msg->msg_name);
+	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
 	struct sock *sk = sock->sk;
 	struct sk_buff *skb;
 	struct qrtr_cb *cb;
@@ -1089,6 +1098,10 @@ static int qrtr_recvmsg(struct socket *sock, struct msghdr *msg,
 		msg->msg_flags |= MSG_TRUNC;
 	}
 
+	if (cb->endpoint_id && test_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags))
+		put_cmsg(msg, SOL_QRTR, QRTR_ENDPOINT,
+			 sizeof(cb->endpoint_id), &cb->endpoint_id);
+
 	rc = skb_copy_datagram_msg(skb, 0, msg, copied);
 	if (rc < 0)
 		goto out;
@@ -1234,6 +1247,78 @@ static int qrtr_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 	return rc;
 }
 
+static int qrtr_setsockopt(struct socket *sock, int level, int optname,
+			   sockptr_t optval, unsigned int optlen)
+{
+	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
+	struct sock *sk = sock->sk;
+	unsigned int val = 0;
+	int rc = 0;
+
+	if (level != SOL_QRTR)
+		return -ENOPROTOOPT;
+
+	if (optlen >= sizeof(val) &&
+	    copy_from_sockptr(&val, optval, sizeof(val)))
+		return -EFAULT;
+
+	lock_sock(sk);
+
+	switch (optname) {
+	case QRTR_REPORT_ENDPOINT:
+		assign_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags, val);
+		break;
+	default:
+		rc = -ENOPROTOOPT;
+	}
+
+	release_sock(sk);
+
+	return rc;
+}
+
+static int qrtr_getsockopt(struct socket *sock, int level, int optname,
+			   char __user *optval, int __user *optlen)
+{
+	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
+	struct sock *sk = sock->sk;
+	unsigned int val;
+	int len;
+	int rc = 0;
+
+	if (level != SOL_QRTR)
+		return -ENOPROTOOPT;
+
+	if (get_user(len, optlen))
+		return -EFAULT;
+
+	if (len < sizeof(val))
+		return -EINVAL;
+
+	lock_sock(sk);
+
+	switch (optname) {
+	case QRTR_REPORT_ENDPOINT:
+		val = test_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags);
+		break;
+	default:
+		rc = -ENOPROTOOPT;
+	}
+
+	release_sock(sk);
+
+	if (rc)
+		return rc;
+
+	len = sizeof(int);
+
+	if (put_user(len, optlen) ||
+	    copy_to_user(optval, &val, len))
+		rc = -EFAULT;
+
+	return rc;
+}
+
 static int qrtr_release(struct socket *sock)
 {
 	struct sock *sk = sock->sk;
@@ -1281,6 +1366,8 @@ static const struct proto_ops qrtr_proto_ops = {
 	.shutdown	= sock_no_shutdown,
 	.release	= qrtr_release,
 	.mmap		= sock_no_mmap,
+	.setsockopt	= qrtr_setsockopt,
+	.getsockopt	= qrtr_getsockopt,
 };
 
 static struct proto qrtr_proto = {
-- 
2.45.2


