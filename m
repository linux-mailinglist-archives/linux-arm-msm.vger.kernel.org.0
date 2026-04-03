Return-Path: <linux-arm-msm+bounces-101681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IvlNavmz2kS1gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:11:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 388B03961C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D517C30125E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 16:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14163CBE98;
	Fri,  3 Apr 2026 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sbzDHC7c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7BB3C7E0C;
	Fri,  3 Apr 2026 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775232380; cv=none; b=Ku/QKUeJDUieZCQxi0WK3OB5xPJjiVc21kUyJzIiBb0dlLuPwvGAUKFHsNSsGEklGRFT/V1VVe2wlBfQrY09vY0eKFUg5CMgCkwW4wIqD/Cw72gBp6yCXdDHgclhGZeS+r74WyF1yU2XZc++ZFMvbKvgfifMklVsC5Xy+6AuodM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775232380; c=relaxed/simple;
	bh=FkZrOYd4SIthvtaubjUizQIoOvRP4US5d2YU8l/XfTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pipo9KfILgM0KsFcBMEbLRaYOaFa/ttUWEAIHd1/5smYf0qdBPkwAuPwS/3iD1UGvdeXpRhpSXWzBFQTZYOkDpRcvKT+YJRcTyiDlz8kB8FWxntvRm0Qs1zH0wQFRBERx7zksHIfegY6c4tD8euMnEDxhnx6S2sfL6Z6O6bPJXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sbzDHC7c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5193EC2BCB2;
	Fri,  3 Apr 2026 16:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775232380;
	bh=FkZrOYd4SIthvtaubjUizQIoOvRP4US5d2YU8l/XfTc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sbzDHC7cUVgUiah7oXzjamvOfAgIIvT2zgiFChY087D74QjDQZ9HH5HF7t3xgF4Pe
	 KeJ061xYs3zPvodfGOGpJKRPeU9tFkMya4yI484BPXK7ijdcaWxBW+NvD0b+5U8/zH
	 wcPYV93Ch8pKWlTq/39fXXLmvjIHYJJ/YfQAlXiy9/wsjIwy2bUJv9Qvmh8SCW8VbN
	 oWx2vgr6QVCoXu+jCd8NhgekmrcfnU3TJOzdLI+B5V2SCSSTMuLzNx/MCS/YSD8Aq2
	 cSaaVx4uqOIqGa3H+EnLcFsKHE6bBuJq+JE5lZO8ljc+DCbZBVnOfpJsOinv8RiI25
	 JZJWyMaDt/IIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4822DE85380;
	Fri,  3 Apr 2026 16:06:20 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Fri, 03 Apr 2026 21:36:05 +0530
Subject: [PATCH v2 2/5] net: qrtr: ns: Limit the maximum number of lookups
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-qrtr-fix-v2-2-f88a14859c63@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2866;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=IhZvm8cwMMv2YMLHez1GlQYA3ZymEM0NuV9RTHrTenE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpz+V5NSoe88Fs+mn/8xIznK2nO1RPvTIemSAHh
 hlrrMj89m+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCac/leQAKCRBVnxHm/pHO
 9bumB/4qjJ2HMIYIEweuwJYY42DD+Ry/JD69DMQ8cTXFoUTuJK4PACvPqQSeio5PNtKN8y63Fz/
 n8VE/iC3xcpd+14dc+gdNPPRqPBvSmox46f0FC0TbkwhRzUkKubwR0ZhxcyQARrkigykzPEF8Xp
 LmIh1h8IDr0nndYq5UwJrVZi416v07OrSJH4innrm7Mw+uVauBill9zLG4vJT3gBvJYM5q2oJ/k
 jnLLw6suZd+nj1Jlkf2rdsRggSssnT+raxPemEUtjnQgw6MyI9D65zMf+iIqF+JfrLKjK8XVy03
 Gy8ppHl41AAwJ4UC7gmoVtCC/Bd+fnbqlqbtJ5kYDzvGX+r4
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101681-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 388B03961C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Current code does no bound checking on the number of lookups a client can
perform. Though the code restricts the lookups to local clients, there is
still a possibility of a malicious local client sending a flood of
NEW_LOOKUP messages over the same socket.

Fix this issue by limiting the maximum number of lookups to 64 globally.
Since the nameserver allows only atmost one local observer, this global
lookup count will ensure that the lookups stay within the limit.

Note that, limit of 64 is chosen based on the current platform
requirements. If requirement changes in the future, this limit can be
increased.

Cc: stable@vger.kernel.org
Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 net/qrtr/ns.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index 63cb5861d87a..5b08d4d4840a 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -22,6 +22,7 @@ static struct {
 	struct socket *sock;
 	struct sockaddr_qrtr bcast_sq;
 	struct list_head lookups;
+	u32 lookup_count;
 	struct workqueue_struct *workqueue;
 	struct work_struct work;
 	int local_node;
@@ -70,10 +71,11 @@ struct qrtr_node {
 	u32 server_count;
 };
 
-/* Max server limit is chosen based on the current platform requirements. If the
- * requirement changes in the future, this value can be increased.
+/* Max server, lookup limits are chosen based on the current platform requirements.
+ * If the requirement changes in the future, these values can be increased.
  */
 #define QRTR_NS_MAX_SERVERS 256
+#define QRTR_NS_MAX_LOOKUPS 64
 
 static struct qrtr_node *node_get(unsigned int node_id)
 {
@@ -433,6 +435,7 @@ static int ctrl_cmd_del_client(struct sockaddr_qrtr *from,
 
 		list_del(&lookup->li);
 		kfree(lookup);
+		qrtr_ns.lookup_count--;
 	}
 
 	/* Remove the server belonging to this port but don't broadcast
@@ -550,6 +553,11 @@ static int ctrl_cmd_new_lookup(struct sockaddr_qrtr *from,
 	if (from->sq_node != qrtr_ns.local_node)
 		return -EINVAL;
 
+	if (qrtr_ns.lookup_count >= QRTR_NS_MAX_LOOKUPS) {
+		pr_err_ratelimited("QRTR client node exceeds max lookup limit!\n");
+		return -ENOSPC;
+	}
+
 	lookup = kzalloc_obj(*lookup);
 	if (!lookup)
 		return -ENOMEM;
@@ -558,6 +566,7 @@ static int ctrl_cmd_new_lookup(struct sockaddr_qrtr *from,
 	lookup->service = service;
 	lookup->instance = instance;
 	list_add_tail(&lookup->li, &qrtr_ns.lookups);
+	qrtr_ns.lookup_count++;
 
 	memset(&filter, 0, sizeof(filter));
 	filter.service = service;
@@ -598,6 +607,7 @@ static void ctrl_cmd_del_lookup(struct sockaddr_qrtr *from,
 
 		list_del(&lookup->li);
 		kfree(lookup);
+		qrtr_ns.lookup_count--;
 	}
 }
 

-- 
2.51.0



