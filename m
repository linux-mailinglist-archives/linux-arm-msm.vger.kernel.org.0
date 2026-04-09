Return-Path: <linux-arm-msm+bounces-102517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEURATbj12kVUQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 19:34:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD093CE2BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 19:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECA573027D91
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 17:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D473DEAD2;
	Thu,  9 Apr 2026 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eExgDLIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A7838B121;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775756055; cv=none; b=I/Kb0LLy6OYPvcF2JDsK7D67XRfWtDjZKNTvsnoHpwWt2XGOUFkqpxDhQqHGdX+53rZjCrvYOg4tHELIw9JBtWg1eGJmmQhwMbmilPnG1E3zBVMuvUEAD4gvIT8TWNvf2owtpzzRFkzSz/aNl/yoNGUOS4OGG7GKK9CkywuRSyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775756055; c=relaxed/simple;
	bh=Ia3tPnC56tz9K91w3AqY0ZvMpakxHnNBSGZqH3L/LfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mKZvxoR9IUrALarMU/Ae793oVFBYvUWf3qZdRjmL6r+MY6zNoGy4+m1C/KyDA+7CppZeiYpAB/sTASBtB7HBgaJLeiy/2Vx60xYpaIhkXBAID9mngqzuhDgDctSBTAl/P/xGRWItA+4QY82u6xITfrCGDzomtTT7Zg/uH8UQk1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eExgDLIf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 876CDC19424;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775756055;
	bh=Ia3tPnC56tz9K91w3AqY0ZvMpakxHnNBSGZqH3L/LfI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eExgDLIfd+wK52tVCt5LiJvOafwVIQGLoqEwAMpcSxDyIirRhgyamjpb8AepoxF6c
	 4oIQmHBJbT26hvrw+d8YDQ+8/fXRd24Kq9xyFQMwGszxjm+ulzqu07BEtbKJc1FVyi
	 DT3QAvkOjR7pppcdVyuEgopryhplfzSQIKNvZnnekfdzk7sMt4m/nrmiNLIvNZt4uc
	 JFAecc1sNNEBcayE+uanTOQ46XSKC08y+3/EDu/8Lu6HImfQjwgU6V7xQNa1e259rQ
	 AWpNYEV8VKo7iamOK1r2kGkY6Pnd/U+2GCIce0EuH5e0VAk4wEQARkKwwgbHK65DIW
	 hRIYdz8vlPGyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F45F364A8;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 09 Apr 2026 23:04:12 +0530
Subject: [PATCH v3 1/5] net: qrtr: ns: Limit the maximum server
 registration per node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-qrtr-fix-v3-1-00a8a5ff2b51@oss.qualcomm.com>
References: <20260409-qrtr-fix-v3-0-00a8a5ff2b51@oss.qualcomm.com>
In-Reply-To: <20260409-qrtr-fix-v3-0-00a8a5ff2b51@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Yiming Qian <yimingqian591@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3040;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=d3riliJXlMknVS54Ov71SzRRhSiv88e/lnkbjutnErI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp1+MVcXh+sRzaqvD63YwBp28P4ftfPfsLheiHb
 LUTZbvABhOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCadfjFQAKCRBVnxHm/pHO
 9e50CACDAAC/duutxEw5WR7Rgnxv7rlmz6FkTIkBMA5bPOvogpnk56+qjp6ucuuxfwq3qaw3Hbg
 EO8dNGfLd4uASOWqTKROS4SPbQMLQTo86ySM/lITXO5Xad/CbB0SrIolF/O/Ov05HAqQyjovg13
 PGuCfntmx8mTguW5a0HoOkvC5Mx9FJdkbmlCpMAn6Xa9NI38i+AgsJ1r80tbfxh7P1RB2I3YyFM
 otYELlbc0Im99x/maHYWK8hU1tr4DyouBaAZbuEDzqFPSJIt2RGGUti5dgdon/4dJJB+Y2N//X4
 8n/2ojGnAIfkJkTOGjJpOkoZST+ovOmAy4wG9Q8uC0RStmu5
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102517-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6DD093CE2BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Current code does no bound checking on the number of servers added per
node. A malicious client can flood NEW_SERVER messages and exhaust memory.

Fix this issue by limiting the maximum number of server registrations to
256 per node. If the NEW_SERVER message is received for an old port, then
don't restrict it as it will get replaced. While at it, also rate limit
the error messages in the failure path of qrtr_ns_worker().

Note that the limit of 256 is chosen based on the current platform
requirements. If requirement changes in the future, this limit can be
increased.

Cc: stable@vger.kernel.org
Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Reported-by: Yiming Qian <yimingqian591@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 net/qrtr/ns.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index 3203b2220860..63cb5861d87a 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -67,8 +67,14 @@ struct qrtr_server {
 struct qrtr_node {
 	unsigned int id;
 	struct xarray servers;
+	u32 server_count;
 };
 
+/* Max server limit is chosen based on the current platform requirements. If the
+ * requirement changes in the future, this value can be increased.
+ */
+#define QRTR_NS_MAX_SERVERS 256
+
 static struct qrtr_node *node_get(unsigned int node_id)
 {
 	struct qrtr_node *node;
@@ -229,6 +235,17 @@ static struct qrtr_server *server_add(unsigned int service,
 	if (!service || !port)
 		return NULL;
 
+	node = node_get(node_id);
+	if (!node)
+		return NULL;
+
+	/* Make sure the new servers per port are capped at the maximum value */
+	old = xa_load(&node->servers, port);
+	if (!old && node->server_count >= QRTR_NS_MAX_SERVERS) {
+		pr_err_ratelimited("QRTR client node %u exceeds max server limit!\n", node_id);
+		return NULL;
+	}
+
 	srv = kzalloc_obj(*srv);
 	if (!srv)
 		return NULL;
@@ -238,10 +255,6 @@ static struct qrtr_server *server_add(unsigned int service,
 	srv->node = node_id;
 	srv->port = port;
 
-	node = node_get(node_id);
-	if (!node)
-		goto err;
-
 	/* Delete the old server on the same port */
 	old = xa_store(&node->servers, port, srv, GFP_KERNEL);
 	if (old) {
@@ -252,6 +265,8 @@ static struct qrtr_server *server_add(unsigned int service,
 		} else {
 			kfree(old);
 		}
+	} else {
+		node->server_count++;
 	}
 
 	trace_qrtr_ns_server_add(srv->service, srv->instance,
@@ -292,6 +307,7 @@ static int server_del(struct qrtr_node *node, unsigned int port, bool bcast)
 	}
 
 	kfree(srv);
+	node->server_count--;
 
 	return 0;
 }
@@ -670,7 +686,7 @@ static void qrtr_ns_worker(struct work_struct *work)
 		}
 
 		if (ret < 0)
-			pr_err("failed while handling packet from %d:%d",
+			pr_err_ratelimited("failed while handling packet from %d:%d",
 			       sq.sq_node, sq.sq_port);
 	}
 

-- 
2.51.0



