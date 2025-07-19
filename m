Return-Path: <linux-arm-msm+bounces-65746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BAAB0B186
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 21:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1203AAA0689
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 18:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673B62877E3;
	Sat, 19 Jul 2025 18:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="Jmoe6XTG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286B7221550;
	Sat, 19 Jul 2025 18:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752951583; cv=none; b=KpZNU7jE60SwIOIEoqA/rqNzdYjKHtoj+6uPArT96qEYPC8dR5E9jScMXldLgazIzKzpP3nc+rvY8m6xw9MlPIv6mHBcDqlklJciO5K/OayiosUWB7gaBPBjXXSlwx5eslEzBq14uv3BRLWIXDR+zjfdTY2lD7Inh37S/rVYBK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752951583; c=relaxed/simple;
	bh=c8xHN0dJeICdHNNBi4K98mIfFvI2rouUTFHLCx+gi9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2Axh+mouvK9jYBZW40wKO0k1EznT49cWIVz0p52q03Oyol3QrA+4QgxSAP1lZ87th33WzBzBI7qNmUIBDVcszw+E3zhP38RlUAnn+7/zVf71Bcu9URMe3BRH9rDChygVGkNEo5ZpClWlwERWNwPdspPnCDlu3yXBOpXy/dozyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=Jmoe6XTG; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1752951577; bh=c8xHN0dJeICdHNNBi4K98mIfFvI2rouUTFHLCx+gi9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jmoe6XTGHdR9/dbK3LzqED7wEUmmfJmcS/sS7uVK18bYWJl3dI6xWAttxM3Sg4A0c
	 3sjzI+aJhyG+XbVxgW/S+VLcV+KuM5+MBgvKGeW1SJY6eboQSTKgrP2oJ6I9WHlwCZ
	 2JXDNjow8V0Nsf3HSC9NbUzNxPhb/0DBk1YOgTXs=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id AE1061488422;
	Sat, 19 Jul 2025 20:59:37 +0200 (CEST)
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
Subject: [PATCH v2 04/10] net: qrtr: Report sender endpoint in aux data
Date: Sat, 19 Jul 2025 20:59:24 +0200
Message-ID: <8dc0c9f99f617db348af5b176bb03b4c11ac9138.1752947108.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1752947108.git.ionic@ionic.de>
References: <cover.1752947108.git.ionic@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Kenzior <denkenz@gmail.com>

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
Signed-off-by: Mihai Moldovan <ionic@ionic.de>

---

v2:
  - rebase against current master
  - dropped socket locking in qrtr_setsockopt() and qrtr_getsockopt() as
    per review comment
---
 include/linux/socket.h    |  1 +
 include/uapi/linux/qrtr.h |  6 +++
 net/qrtr/af_qrtr.c        | 78 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index 3b262487ec06..0698a11bb2e2 100644
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
index e83d491a8da9..f11c04e0494f 100644
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
@@ -1234,6 +1247,69 @@ static int qrtr_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 	return rc;
 }
 
+static int qrtr_setsockopt(struct socket *sock, int level, int optname,
+			   sockptr_t optval, unsigned int optlen)
+{
+	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
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
+	switch (optname) {
+	case QRTR_REPORT_ENDPOINT:
+		assign_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags, val);
+		break;
+	default:
+		rc = -ENOPROTOOPT;
+	}
+
+	return rc;
+}
+
+static int qrtr_getsockopt(struct socket *sock, int level, int optname,
+			   char __user *optval, int __user *optlen)
+{
+	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
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
+	switch (optname) {
+	case QRTR_REPORT_ENDPOINT:
+		val = test_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags);
+		break;
+	default:
+		rc = -ENOPROTOOPT;
+	}
+
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
@@ -1281,6 +1357,8 @@ static const struct proto_ops qrtr_proto_ops = {
 	.shutdown	= sock_no_shutdown,
 	.release	= qrtr_release,
 	.mmap		= sock_no_mmap,
+	.setsockopt	= qrtr_setsockopt,
+	.getsockopt	= qrtr_getsockopt,
 };
 
 static struct proto qrtr_proto = {
-- 
2.50.0


