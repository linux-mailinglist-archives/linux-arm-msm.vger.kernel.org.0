Return-Path: <linux-arm-msm+bounces-102519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIhoOSbj12kVUQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 19:34:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E43CE29A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 19:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0D5B301491A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 17:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB503E1D1D;
	Thu,  9 Apr 2026 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGAkYqJq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13463CB2E6;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775756056; cv=none; b=QmKZhu9RbsMx2AGYGBONtsSdYSwiCflvjRUL9C2y2FKOOnl2sU19J7ww5wPSh7py+8kSU5/k5zueMu28SJsVVKWct7EssC6co3qe/nb8rhRAJV7lwW8SQYuDISzW37Tx67nH0CbF+paDfgdeczKNZXWJP9q1dkYbJOohIncVPlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775756056; c=relaxed/simple;
	bh=BHh+d7/Sb5UOlzv7Cvr4u0mLHw6JKjDkoYi8T5hayBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UAsd5aooLiF/FJi9GW2Y+J9JwDzfLnu0foeJAaCqFMTFyvX5h0BDt5w72tLx2ABbnutSY9/YV8wCNZhMMOiuBhC9tMqfWeeOQzNI6RX+tpbS5JIx0y+UX1lHiv4YueMS4ewjwZu+FCWeTVhKa6PKpNsckM0vuN84gzNsTMiLZsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGAkYqJq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F4BBC2BCB2;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775756055;
	bh=BHh+d7/Sb5UOlzv7Cvr4u0mLHw6JKjDkoYi8T5hayBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QGAkYqJq4a724iYzgqfkkLJr2JvL43bRUs0fk4+g/eLwUgKwMPITjJROJx7Nh6Kz0
	 6n/QclVjv64OyBadDFWgZ8IfNqi3SEgBxFfMZq53EvExFPWHu1n3IMb5eyfM4T8q7G
	 yZ/37rtYs9FPkJpp//53GiAzVA+eC5xVC4nr6ZfgbDz2m1Q4m42RrfbZc2OsWGXoEz
	 o1Va3+6cES25khjcDIs4WnQQJwWKfAjSSmY3rwcDKHr30KmHcUjy0xiiI1eiNprH+r
	 14UNZjH+Y9XNoyjyFyvqleflwG+liQNKqb5pLmPJFM6dN4H9WlBeg2BikigaQNpiqJ
	 uhxYC6BTNLQRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94060F364A6;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 09 Apr 2026 23:04:14 +0530
Subject: [PATCH v3 3/5] net: qrtr: ns: Free the node during ctrl_cmd_bye()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-qrtr-fix-v3-3-00a8a5ff2b51@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1941;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hpdkeym1qdOfTUQpvcFhEQaJ9E/0TNA+gVCrKHkmuGc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp1+MV1Scrz7Ru2f3Zgr16UT/xdCYro5A7okqoa
 SKNH13jIp6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCadfjFQAKCRBVnxHm/pHO
 9fwTB/4pCyuDCwNyuUrR8VcPom9D2zdQ/CtJIadItu625PSyjcL4WhMbCSugzcdXRhaGH407x8o
 wN4kXNfUS2QyRgyDn3Qqdx+TPiaLOezWSkWOUZKZGwrIJzoNx3QysRH+e5jwWZAwyyA1+DXRm6s
 6lNa7EEfBhO+Zj9jqAlzIHUhWobkVkbWsK9L/GePhVxq1QduJgLLQwH+qtiIRXUSwfdj+j0ad4z
 u//jo8qEPlKRvUbteSwwVw+Efvtq2CcFiXHDruPUqg2bueQVRaLLpar4mmNOuDGnzmVlRz6QrN6
 +rww7B7ImX3XPDJj3aOpLRV7u0UMYd9OpVU5QqZpzjY7qXPb
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
	TAGGED_FROM(0.00)[bounces-102519-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
X-Rspamd-Queue-Id: D49E43CE29A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

A node sends the BYE packet when it is about to go down. So the nameserver
should advertise the removal of the node to all remote and local observers
and free the node finally. But currently, the nameserver doesn't free the
node memory even after processing the BYE packet. This causes the node
memory to leak.

Hence, remove the node from Xarray list and free the node memory during
both success and failure case of ctrl_cmd_bye().

Cc: stable@vger.kernel.org
Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 net/qrtr/ns.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index 5b08d4d4840a..1b9a90240a68 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -359,7 +359,7 @@ static int ctrl_cmd_bye(struct sockaddr_qrtr *from)
 	struct qrtr_node *node;
 	unsigned long index;
 	struct kvec iv;
-	int ret;
+	int ret = 0;
 
 	iv.iov_base = &pkt;
 	iv.iov_len = sizeof(pkt);
@@ -374,8 +374,10 @@ static int ctrl_cmd_bye(struct sockaddr_qrtr *from)
 
 	/* Advertise the removal of this client to all local servers */
 	local_node = node_get(qrtr_ns.local_node);
-	if (!local_node)
-		return 0;
+	if (!local_node) {
+		ret = 0;
+		goto delete_node;
+	}
 
 	memset(&pkt, 0, sizeof(pkt));
 	pkt.cmd = cpu_to_le32(QRTR_TYPE_BYE);
@@ -392,10 +394,18 @@ static int ctrl_cmd_bye(struct sockaddr_qrtr *from)
 		ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
 		if (ret < 0 && ret != -ENODEV) {
 			pr_err("failed to send bye cmd\n");
-			return ret;
+			goto delete_node;
 		}
 	}
-	return 0;
+
+	/* Ignore -ENODEV */
+	ret = 0;
+
+delete_node:
+	xa_erase(&nodes, from->sq_node);
+	kfree(node);
+
+	return ret;
 }
 
 static int ctrl_cmd_del_client(struct sockaddr_qrtr *from,

-- 
2.51.0



