Return-Path: <linux-arm-msm+bounces-102520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AEHOzPj12kVUQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 19:34:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 340673CE2AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 19:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A05233014934
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 17:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8908D3E3165;
	Thu,  9 Apr 2026 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8C39kya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BB83CBE8B;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775756056; cv=none; b=HhQpCp6izO5Gp3flHmxYhq/AaTGeSvV/EkE061sdADdHi+qF+eMRJNxwAHB7oyLFLUpZZwzmLUq5KQxRXd/OcEX8H5Wnv1T9GXH962lg6OFLAWECB2lHV3YVjAvFO/UUgtmLzDsMxtu/JqTH0r8JcL0dddWOSniwxa48jLY0lf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775756056; c=relaxed/simple;
	bh=FkZrOYd4SIthvtaubjUizQIoOvRP4US5d2YU8l/XfTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QDjhbamqQudJuVtEHD+obV4c7KrtiKmJuHtVuCkujO/fTDoNpt9yMiLG/0njw4snZqHi31Uj/EzjfUsVhgdsamMjjq9SQ3nlSQHckXcWhutHB5kdqgWMJATBNhHbbBtWW3K9r5jtqAkuGkLOmTZtNYO+SEy5aT91QVuNdfbNCJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8C39kya; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94FDCC2BCAF;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775756055;
	bh=FkZrOYd4SIthvtaubjUizQIoOvRP4US5d2YU8l/XfTc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c8C39kyaN7AObs4Mvha5j6Y13B8byb5Zta8I1oGL9Oz+Vl3JoLx0h8hOnqwl6T3rj
	 Z1ueQKP1wV2QrDTcXlFwq7P2aaM7gV3+cO6nDPEtu4p9Jy1EBKYAd7IxFo1tn6GFrq
	 9lbQAKPOulqQY45AuuU6+cG9CKDlnyE0/Pq6m+njgSPUJgEfPXP0O9+WC87/GwVCfd
	 RrR79vaZSd3eLjMRbcgirA6BLIIdYSoF0AdFh1kOJQoWfJIW2hQd9oYnPZDrKN+eYI
	 BgkzSn2N/61MrClGzRD2OmkBAN+NNxWk8twBLslfberRP3JRAzcQropmTR9TIJDOOB
	 WRDK3AqD6HJow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8425CF364AB;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 09 Apr 2026 23:04:13 +0530
Subject: [PATCH v3 2/5] net: qrtr: ns: Limit the maximum number of lookups
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-qrtr-fix-v3-2-00a8a5ff2b51@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2866;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=IhZvm8cwMMv2YMLHez1GlQYA3ZymEM0NuV9RTHrTenE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp1+MV6OOS+sE0Q6zOPdpJZF2nE6VonDdOb+TxP
 hrY1Ji3OLWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCadfjFQAKCRBVnxHm/pHO
 9WXLB/9S7FKGRYTtolf8iR5ePF1KEB2WQk1Qpp5SGBNW/iXpRv9hyvuz3I62myAwFIa3S0sLKB/
 OYTpOcNZUA45tWNTYDmK53WCvPzdzW9K9AAMdGY4uO3ie/n/BI+5jV1DSB92aio+96tyCwPrhqk
 LGc5CP1E/4PQP3XyDDMky2+B046uh2RG8PWddHTJZPrxnZj2O3xV+njwNhHBeIKGKWENWSGTZbf
 LvAYfaRTqrWeHlhsCUybfJhjDRpxzsTMbrryTAqL6mbZU1acXjnViczU/1l3Y7rs1S4PdDhOFAm
 4QdcXmZ6Ug6MSqfAzjv8EcT0SxWnAKIYDGV60JHvKTYxlkEm
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102520-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 340673CE2AF
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



