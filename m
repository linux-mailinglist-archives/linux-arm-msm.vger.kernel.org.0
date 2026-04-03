Return-Path: <linux-arm-msm+bounces-101686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM2LIOzmz2nW1gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:12:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B8139622B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6679230AEC09
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 16:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEBA3CE48D;
	Fri,  3 Apr 2026 16:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQPiLmjo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0313CCFAA;
	Fri,  3 Apr 2026 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775232380; cv=none; b=UAwGuLtF057Q5M3jlylYWM4eWRQ2QluDZaXl3NYtnUZ9ea3Y8lvqLtFLWWGQl4SqaqiptmsbPAw5+kwb8IeSa7wyY8hagAxWcKBaHccCAJvY6NGgvxKDD02AXwtSWS//EyWxoZaoIgNJRzjOXuqVFK2ukDbtg0RVVzZjAE/0hNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775232380; c=relaxed/simple;
	bh=RckRdf53GDiyrrla3oj4hAD/DNKxx6grhyOozCqDgGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lnj9C+dmss+4W4wgvC+1LD0Q5IB+vwgvO+egbZNUlPTxinEF/tSgruQ5Nnv46zDtCFBcfj/esBoj4cNO3GHhSVbfPHznQDnZEdfKkaTIerELpICSgRyQmDq8iuBBQivYb+skbSLEH9xX1/pMuxBRGaP+qPHqK/qEe3k7uhqB/zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQPiLmjo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CD30C2BCB1;
	Fri,  3 Apr 2026 16:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775232380;
	bh=RckRdf53GDiyrrla3oj4hAD/DNKxx6grhyOozCqDgGk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eQPiLmjouzXSU4RKCt1QNDmyKpx6hGTo4t0e+rtTzqN2lbZ8alZMfGnrOumHoVbNc
	 AKLrexeniymhQyKbQvw+MvLqtur7bsHJSu9FRTMo0X4etpXrJSx4hlqZQQy/6fZtIZ
	 5KMjwE3hxm0b7pHCiH35miUVEV7qXWAjo2j8tO3J3QLkJGUpND6bF19D7ZRROlVN5N
	 gpmxC3OV5U9wFOcIw49oMjZATlQfi0RvRJYOrG4LbEuZ3W+xg2s0eG0tFib2Y2/0ZY
	 L45nBgFpeVYSVf44lOsT2DeiHL5SAoXf7fluo6pEp1kYFcMxZts+2XCIj8q3mBogTe
	 thur9XTGihwvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842ACE8537A;
	Fri,  3 Apr 2026 16:06:20 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Fri, 03 Apr 2026 21:36:08 +0530
Subject: [PATCH v2 5/5] net: qrtr: ns: Fix use-after-free in driver
 remove()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-qrtr-fix-v2-5-f88a14859c63@oss.qualcomm.com>
References: <20260403-qrtr-fix-v2-0-f88a14859c63@oss.qualcomm.com>
In-Reply-To: <20260403-qrtr-fix-v2-0-f88a14859c63@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=EKnJBPyE8K/Uxe3dMOqp6oAHc724HrgGM2UtRYAxcbE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpz+V58HcsafAzCiDUq93S+ISP2Pv+dqaFAy7vX
 VMZ11JAjSWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCac/leQAKCRBVnxHm/pHO
 9fZRB/0WRME4UaAPVOxxBfAFS6wZkqdpCyfphwoctFAR7hmeHtgnPcSfuhFz5NvDeBGfpMX4GwZ
 R2omrFgpOYXH7q+Zzu9nkqY9hFzL1kQSDhqHVVA1mHvvFTaMkH1rxk6F8hDGANaQwsXbpJxm4ks
 BvvFNB+pmoh+dhddW8cCNLB6Q7feta3EKULMgJQoqxlZOjSqwW39sVybhMQvJjxq5QQT6/H1mYQ
 wz2sLHbGI2KJ2y5gxq2P2RnsEFz8NDuWGjFG5xZFwCtB+4DKjvkT0OGTE8a1OUZJ5JNpXSruUyH
 Ui06PAMD8c+pZGhTPQDU1Obul5IXePJYBlp0rahYZYCa1RM9
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101686-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C5B8139622B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

In the remove callback, if a packet arrives after destroy_workqueue() is
called, but before sock_release(), the qrtr_ns_data_ready() callback will
try to queue the work, causing use-after-free issue.

Fix this issue by saving the default 'sk_data_ready' callback during
qrtr_ns_init() and use it to replace the qrtr_ns_data_ready() callback at
the start of remove(). This ensures that even if a packet arrives after
destroy_workqueue(), the work struct will not be dereferenced.

Cc: stable@vger.kernel.org
Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 net/qrtr/ns.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index dfb5dad9473c..c62d79e03d64 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -25,6 +25,7 @@ static struct {
 	u32 lookup_count;
 	struct workqueue_struct *workqueue;
 	struct work_struct work;
+	void (*saved_data_ready)(struct sock *sk);
 	int local_node;
 } qrtr_ns;
 
@@ -754,6 +755,7 @@ int qrtr_ns_init(void)
 		goto err_sock;
 	}
 
+	qrtr_ns.saved_data_ready = qrtr_ns.sock->sk->sk_data_ready;
 	qrtr_ns.sock->sk->sk_data_ready = qrtr_ns_data_ready;
 
 	sq.sq_port = QRTR_PORT_CTRL;
@@ -803,6 +805,10 @@ EXPORT_SYMBOL_GPL(qrtr_ns_init);
 
 void qrtr_ns_remove(void)
 {
+	write_lock_bh(&qrtr_ns.sock->sk->sk_callback_lock);
+	qrtr_ns.sock->sk->sk_data_ready = qrtr_ns.saved_data_ready;
+	write_unlock_bh(&qrtr_ns.sock->sk->sk_callback_lock);
+
 	cancel_work_sync(&qrtr_ns.work);
 	destroy_workqueue(qrtr_ns.workqueue);
 

-- 
2.51.0



