Return-Path: <linux-arm-msm+bounces-102522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAOGC2rj12kVUQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 19:35:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC163CE324
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 19:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43865302812A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 17:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88253E3C54;
	Thu,  9 Apr 2026 17:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TM1vo6yM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BD03DA5A9;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775756056; cv=none; b=HFdp6QCT/J3iKn9OBeJXbxaD34TZWXmlWiXCKl1SH3aMUpYW7WG7qe0B5zTzf1WiG0cYy1EAA4rK2lDdVPJ9Xcu3atI77ZG4JOXKi33qXRNeQtO8+4l4Q9pyY7aW8F8GFczk5SJrA/emrIa6i1a/p4nDeUM+dsR7JUccVB8EgDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775756056; c=relaxed/simple;
	bh=N2UehBHwD0b+vXSAniQeYmjabyJSqrbaO6Ihq79PUqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MB80SW/VxD8r4EMTXNlU/givhU4INrtkdI1vTE+5usU4zusW+B+LKqzdsLEU/m8wRNrMjKVa/1guMK635PdJc5sbal1pKRSudvJaKYngyBVCLHAVYmOZZpI3Pcoe93lMQHpkLg++lOOxtOU4IwZwcIOAAD8Xr+45Jx8SZ6AiZ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TM1vo6yM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEBB6C2BCB8;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775756055;
	bh=N2UehBHwD0b+vXSAniQeYmjabyJSqrbaO6Ihq79PUqk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TM1vo6yMBmYlwaV09HmXkFIhYUlGg8werx667FxcV3ieXu4HCLHcgMJ1GSXQ1hKgV
	 SpLh6wM5TC4po8GAVGEWda0fR+ddl8OLRHdNaOWIaZbWFQzOiM+v+mJ9N6Mif5HffF
	 vNVEJFgjvS1m8RhBmgXppRFvfdx1hHPuov/1AKCB1/BdVYP41bcPMJesxRli6j1ePD
	 TdRJ6HgjVRnM+qzyggj7DwIPOiQChECVQRNU23EVkV2iI0DRSo+od9qPdhO42NHu7A
	 eIHWndf70OKFzyGz8k4uxkX5IX2WAufbhxWdQyerLhHZUS1pcHKQ9/S1rb1lWa+zkX
	 fK7tSiPKgvgNA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E20F364AB;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 09 Apr 2026 23:04:16 +0530
Subject: [PATCH v3 5/5] net: qrtr: ns: Fix use-after-free in driver
 remove()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-qrtr-fix-v3-5-00a8a5ff2b51@oss.qualcomm.com>
References: <20260409-qrtr-fix-v3-0-00a8a5ff2b51@oss.qualcomm.com>
In-Reply-To: <20260409-qrtr-fix-v3-0-00a8a5ff2b51@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2278;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=V/lNXK246ObIRyadcl4o0mX29UnERYEL429gbGnbvt4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp1+MVFmkz3GrDM1VqrwI42KBiIO7BWLpIpODKV
 oobcMdu7pWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCadfjFQAKCRBVnxHm/pHO
 9bIeB/9ukjNf14yQzyuXLftfQliy2vooFgxNwaNzjdTiAARnXiRD+7S7cZpIGbe5ESd5uCHrbo5
 29tR2KpOjgkcgImZiPFVLg+gKmdczsj4USWqRFhCutPfaFIMpiKGa147FzqXkRt8UkbsNLrGtVI
 pjj8hLUT21okm3/YKKxvwDOfSsdB+P7KUH8NbMAntUekbw1M8o+JKwdCkEWjOtR3NPcaLaYpY73
 uIsc+5/IYdBLzOUOoBKxr0Kva6M0lBTlDEwxApY7HejF+P4j/eqbi+jN33FPVAq+GxSDfSRKoig
 Qiq9yIX5Lm7ah6lCe/7g/6/OhMGUkGZZfYMdVReK8VVI3PkC
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102522-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 9FC163CE324
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

Note that it is also required to ensure that the RX threads are completed
before destroying the workqueue, because the threads could be using the
qrtr_ns_data_ready() callback.

Cc: stable@vger.kernel.org
Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 net/qrtr/ns.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index c0418764470b..b3f9bbcf9ab9 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -25,6 +25,7 @@ static struct {
 	u32 lookup_count;
 	struct workqueue_struct *workqueue;
 	struct work_struct work;
+	void (*saved_data_ready)(struct sock *sk);
 	int local_node;
 } qrtr_ns;
 
@@ -757,6 +758,7 @@ int qrtr_ns_init(void)
 		goto err_sock;
 	}
 
+	qrtr_ns.saved_data_ready = qrtr_ns.sock->sk->sk_data_ready;
 	qrtr_ns.sock->sk->sk_data_ready = qrtr_ns_data_ready;
 
 	sq.sq_port = QRTR_PORT_CTRL;
@@ -797,6 +799,10 @@ int qrtr_ns_init(void)
 	return 0;
 
 err_wq:
+	write_lock_bh(&qrtr_ns.sock->sk->sk_callback_lock);
+	qrtr_ns.sock->sk->sk_data_ready = qrtr_ns.saved_data_ready;
+	write_unlock_bh(&qrtr_ns.sock->sk->sk_callback_lock);
+
 	destroy_workqueue(qrtr_ns.workqueue);
 err_sock:
 	sock_release(qrtr_ns.sock);
@@ -806,7 +812,12 @@ EXPORT_SYMBOL_GPL(qrtr_ns_init);
 
 void qrtr_ns_remove(void)
 {
+	write_lock_bh(&qrtr_ns.sock->sk->sk_callback_lock);
+	qrtr_ns.sock->sk->sk_data_ready = qrtr_ns.saved_data_ready;
+	write_unlock_bh(&qrtr_ns.sock->sk->sk_callback_lock);
+
 	cancel_work_sync(&qrtr_ns.work);
+	synchronize_net();
 	destroy_workqueue(qrtr_ns.workqueue);
 
 	/* sock_release() expects the two references that were put during

-- 
2.51.0



