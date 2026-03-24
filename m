Return-Path: <linux-arm-msm+bounces-99573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI0tJGpGwmnvbAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:08:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E41304595
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61B20301CC5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 08:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60078359A8C;
	Tue, 24 Mar 2026 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ffhy3Yce"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6EF3624A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 08:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339650; cv=none; b=kY0OL30nA8RwSsZW0Ud1aorIEHiCOKkEuEQ6gQ9fZRISwuyGWuID9aoEl0USlD0D/mKSoFTQJIJPk3xb4w39Psb0FToI+J0jesOztN4YqGOtmpcFVAJR4B3+x1B7LkyD47P3NrLYHYCQSr2PjNTZtum79rRoWXHuy6EXQlZVflM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339650; c=relaxed/simple;
	bh=ZvmDtRtwLXF4NN4xJBAcY7RYMs7JzpNX/mz4Gt1djL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LnWkg23STCH1hnil07XjYOGyhnK3uVtvGfirmhGxIczPdNimoXp+uTwlPSOruCGyLkNqPJDIaSM1FHurwmnhfr1LkY1BPjztMvG1RqcYdvab0rgJXZD9pzPDgCLJqjvNzy7iBjYcO7jXNpLWFxEmLxcdvIr0kPG0lzmQFwMJS8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ffhy3Yce; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774339628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F7Fbu8GvqOu3EypjsQLM9k82uQKOXpR7x4RhsQ7hJIU=;
	b=Ffhy3Ycem3McJUcsmBWjJdd3jeQEFVP18QFrYPu92V6d07hpGd/zZAPCRs0KuDtJVljLk9
	l4k7epMAQrMHEiDPiMewKfHqN7UVF/danxp/zgPClGMw861/6pAuBabk9iWLH/zvlTtPIA
	TSxF/7LaMF+OoTmZ0FWrwpG0qu9BxPY=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@shopee.com>,
	syzbot+006987d1be3586e13555@syzkaller.appspotmail.com,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v1] net: qrtr: replace qrtr_tx_flow radix_tree with xarray to fix memory leak
Date: Tue, 24 Mar 2026 16:06:44 +0800
Message-ID: <20260324080645.290197-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99573-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiayuan.chen@linux.dev,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,006987d1be3586e13555];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,appspotmail.com:email,shopee.com:email]
X-Rspamd-Queue-Id: B3E41304595
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jiayuan Chen <jiayuan.chen@shopee.com>

__radix_tree_create() allocates and links intermediate nodes into the
tree one by one. If a subsequent allocation fails, the already-linked
nodes remain in the tree with no corresponding leaf entry. These orphaned
internal nodes are never reclaimed because radix_tree_for_each_slot()
only visits slots containing leaf values.

The radix_tree API is deprecated in favor of xarray. As suggested by
Matthew Wilcox, migrate qrtr_tx_flow from radix_tree to xarray instead
of fixing the radix_tree itself [1]. xarray properly handles cleanup of
internal nodes — xa_destroy() frees all internal xarray nodes when the
qrtr_node is released, preventing the leak.

[1] https://lore.kernel.org/all/20260225071623.41275-1-jiayuan.chen@linux.dev/T/
Reported-by: syzbot+006987d1be3586e13555@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/000000000000bfba3a060bf4ffcf@google.com/T/
Fixes: 5fdeb0d372ab ("net: qrtr: Implement outgoing flow control")
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
---
 net/qrtr/af_qrtr.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 55fd2dd37588..d77e9c8212da 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -118,7 +118,7 @@ static DEFINE_XARRAY_ALLOC(qrtr_ports);
  * @ep: endpoint
  * @ref: reference count for node
  * @nid: node id
- * @qrtr_tx_flow: tree of qrtr_tx_flow, keyed by node << 32 | port
+ * @qrtr_tx_flow: xarray of qrtr_tx_flow, keyed by node << 32 | port
  * @qrtr_tx_lock: lock for qrtr_tx_flow inserts
  * @rx_queue: receive queue
  * @item: list item for broadcast list
@@ -129,7 +129,7 @@ struct qrtr_node {
 	struct kref ref;
 	unsigned int nid;
 
-	struct radix_tree_root qrtr_tx_flow;
+	struct xarray qrtr_tx_flow;
 	struct mutex qrtr_tx_lock; /* for qrtr_tx_flow */
 
 	struct sk_buff_head rx_queue;
@@ -172,6 +172,7 @@ static void __qrtr_node_release(struct kref *kref)
 	struct qrtr_tx_flow *flow;
 	unsigned long flags;
 	void __rcu **slot;
+	unsigned long index;
 
 	spin_lock_irqsave(&qrtr_nodes_lock, flags);
 	/* If the node is a bridge for other nodes, there are possibly
@@ -189,11 +190,9 @@ static void __qrtr_node_release(struct kref *kref)
 	skb_queue_purge(&node->rx_queue);
 
 	/* Free tx flow counters */
-	radix_tree_for_each_slot(slot, &node->qrtr_tx_flow, &iter, 0) {
-		flow = *slot;
-		radix_tree_iter_delete(&node->qrtr_tx_flow, &iter, slot);
+	xa_for_each(&node->qrtr_tx_flow, index, flow)
 		kfree(flow);
-	}
+	xa_destroy(&node->qrtr_tx_flow);
 	kfree(node);
 }
 
@@ -228,9 +227,7 @@ static void qrtr_tx_resume(struct qrtr_node *node, struct sk_buff *skb)
 
 	key = remote_node << 32 | remote_port;
 
-	rcu_read_lock();
-	flow = radix_tree_lookup(&node->qrtr_tx_flow, key);
-	rcu_read_unlock();
+	flow = xa_load(&node->qrtr_tx_flow, key);
 	if (flow) {
 		spin_lock(&flow->resume_tx.lock);
 		flow->pending = 0;
@@ -269,12 +266,13 @@ static int qrtr_tx_wait(struct qrtr_node *node, int dest_node, int dest_port,
 		return 0;
 
 	mutex_lock(&node->qrtr_tx_lock);
-	flow = radix_tree_lookup(&node->qrtr_tx_flow, key);
+	flow = xa_load(&node->qrtr_tx_flow, key);
 	if (!flow) {
 		flow = kzalloc_obj(*flow);
 		if (flow) {
 			init_waitqueue_head(&flow->resume_tx);
-			if (radix_tree_insert(&node->qrtr_tx_flow, key, flow)) {
+			if (xa_err(xa_store(&node->qrtr_tx_flow, key, flow,
+					    GFP_KERNEL))) {
 				kfree(flow);
 				flow = NULL;
 			}
@@ -326,9 +324,7 @@ static void qrtr_tx_flow_failed(struct qrtr_node *node, int dest_node,
 	unsigned long key = (u64)dest_node << 32 | dest_port;
 	struct qrtr_tx_flow *flow;
 
-	rcu_read_lock();
-	flow = radix_tree_lookup(&node->qrtr_tx_flow, key);
-	rcu_read_unlock();
+	flow = xa_load(&node->qrtr_tx_flow, key);
 	if (flow) {
 		spin_lock_irq(&flow->resume_tx.lock);
 		flow->tx_failed = 1;
@@ -599,7 +595,7 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
 	node->nid = QRTR_EP_NID_AUTO;
 	node->ep = ep;
 
-	INIT_RADIX_TREE(&node->qrtr_tx_flow, GFP_KERNEL);
+	xa_init(&node->qrtr_tx_flow);
 	mutex_init(&node->qrtr_tx_lock);
 
 	qrtr_node_assign(node, nid);
@@ -627,6 +623,7 @@ void qrtr_endpoint_unregister(struct qrtr_endpoint *ep)
 	struct qrtr_tx_flow *flow;
 	struct sk_buff *skb;
 	unsigned long flags;
+	unsigned long index;
 	void __rcu **slot;
 
 	mutex_lock(&node->ep_lock);
@@ -649,10 +646,8 @@ void qrtr_endpoint_unregister(struct qrtr_endpoint *ep)
 
 	/* Wake up any transmitters waiting for resume-tx from the node */
 	mutex_lock(&node->qrtr_tx_lock);
-	radix_tree_for_each_slot(slot, &node->qrtr_tx_flow, &iter, 0) {
-		flow = *slot;
+	xa_for_each(&node->qrtr_tx_flow, index, flow)
 		wake_up_interruptible_all(&flow->resume_tx);
-	}
 	mutex_unlock(&node->qrtr_tx_lock);
 
 	qrtr_node_release(node);
-- 
2.43.0


