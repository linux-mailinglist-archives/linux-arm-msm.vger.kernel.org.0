Return-Path: <linux-arm-msm+bounces-102521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJBCLUzj12kVUQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 19:35:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F8E3CE300
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 19:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B387302DF60
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 17:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A623E2777;
	Thu,  9 Apr 2026 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3wbfSa2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED733CFF4D;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775756056; cv=none; b=HJn2GZp7jcdcXllGy1TKB3LFR0omHc2BY8vywsLQIq82xjI+tpeGVAdT60/s6IER/YontU8gkUhIqyBYZ+fDK9uF+68PZQMqjBG0mxRuPMpUiRiRbmI1Iwn8LTCHftkFxn37YAe73bL+4HJ3TPGlS6z+3MH8psm+eYwmgXEBHw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775756056; c=relaxed/simple;
	bh=jAsDVJQ8oQe6T+jEbjyp6AmnCBcgc0szzgwGRqjH3gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iF/7Ppfhg4ImiL7gXiJrO8v7iZHNpA/BHctXliBEQkpQPH6Wsm4e+Vt7nFYg9QQqN9B0iMmp7FGj1ZwlWXOXo8RzDKhy2ymKYDfj7GSBVrY7RBRJzohreX7NTz75BLBh28uh6L/81MJMQdjzHqxGZf2zpJRnA6bN1c8qXK0V+Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3wbfSa2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACED1C116C6;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775756055;
	bh=jAsDVJQ8oQe6T+jEbjyp6AmnCBcgc0szzgwGRqjH3gw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A3wbfSa2bhg26atLrWC6YMom5uCnH1XBSRiwqkXXJiluM2a8XwobrjEe7n+lM4EjG
	 B54FMYcGZe7/BUDi6k8LoQtYlVm7geRq40tFa7ySZ1vpoPm7Jjv3iR/X8rUsBQJRzI
	 IxnP1vH87afSlojXO3q0fCUKu6Oqp7EakJPgAxmiaC8q2ndlkVZ/j/jqo+b7Ansi7S
	 YKIvTzpgauHHltz7LmuSOs9uoJT6IrKmRjO5M1LqJLheHKfAd5gmGrF6FOUYdzjZTk
	 QPKaIqiecEDqtmPzF/C6cRvm6uWNzV1jcD0mc+7W4tzPYfrSq+iJIxbwDTgb+bK2u6
	 iAXPXTXAi3cYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B5EF364A8;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 09 Apr 2026 23:04:15 +0530
Subject: [PATCH v3 4/5] net: qrtr: ns: Limit the total number of nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-qrtr-fix-v3-4-00a8a5ff2b51@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=8Z7zm8D//7k5Avg5HWQBlF08Jj61fVMYPl3P8cP1MWk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp1+MV1XPr83Nla9ublSdPz04N4bvw4OBEX49ZU
 D74mOz5HwSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCadfjFQAKCRBVnxHm/pHO
 9dUWB/9k0KOKftyg7XvdSKNaFZ9Hd6d+D3IDBh3mV8Tqizh6fQceyo+ck4NbE4/Df0Dr2H+v0W7
 S13eMeZa/shDshMU+AdEo7hMOZRjMPP/4BS4FUC7rPmt2bNfpfgAISo9boKhZb84Wiendde/f0A
 Zq6njJo4mL9fOWsKJoKjwBZ3cUCqUad2GBjCY9al9/h/kVTfLngNIWAZxy1If/iDtb1ctA/MqUI
 lbz3+se9aOTH/0MGw4HG9z3toFap7ogLxSspG5Z10VFt86va8EjBylaDHUso9IRyjeRaJ8XtmYG
 DJQrVyG+QkiESiYWIwWBstMcREpyNoFlrO0iZxw+sID622Kp
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102521-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 45F8E3CE300
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Currently, the nameserver doesn't limit the number of nodes it handles.
This can be an attack vector if a malicious client starts registering
random nodes, leading to memory exhaustion.

Hence, limit the maximum number of nodes to 64. Note that, limit of 64 is
chosen based on the current platform requirements. If requirement changes
in the future, this limit can be increased.

Cc: stable@vger.kernel.org
Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 net/qrtr/ns.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index 1b9a90240a68..c0418764470b 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -71,12 +71,16 @@ struct qrtr_node {
 	u32 server_count;
 };
 
-/* Max server, lookup limits are chosen based on the current platform requirements.
- * If the requirement changes in the future, these values can be increased.
+/* Max nodes, server, lookup limits are chosen based on the current platform
+ * requirements. If the requirement changes in the future, these values can be
+ * increased.
  */
+#define QRTR_NS_MAX_NODES   64
 #define QRTR_NS_MAX_SERVERS 256
 #define QRTR_NS_MAX_LOOKUPS 64
 
+static u8 node_count;
+
 static struct qrtr_node *node_get(unsigned int node_id)
 {
 	struct qrtr_node *node;
@@ -85,6 +89,11 @@ static struct qrtr_node *node_get(unsigned int node_id)
 	if (node)
 		return node;
 
+	if (node_count >= QRTR_NS_MAX_NODES) {
+		pr_err_ratelimited("QRTR clients exceed max node limit!\n");
+		return NULL;
+	}
+
 	/* If node didn't exist, allocate and insert it to the tree */
 	node = kzalloc_obj(*node);
 	if (!node)
@@ -98,6 +107,8 @@ static struct qrtr_node *node_get(unsigned int node_id)
 		return NULL;
 	}
 
+	node_count++;
+
 	return node;
 }
 
@@ -404,6 +415,7 @@ static int ctrl_cmd_bye(struct sockaddr_qrtr *from)
 delete_node:
 	xa_erase(&nodes, from->sq_node);
 	kfree(node);
+	node_count--;
 
 	return ret;
 }

-- 
2.51.0



