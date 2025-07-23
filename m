Return-Path: <linux-arm-msm+bounces-66396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E181FB0FD5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 01:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81FA3AA07E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 23:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95A22749C5;
	Wed, 23 Jul 2025 23:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="Ywx9292b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9347F272E45;
	Wed, 23 Jul 2025 23:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753313076; cv=none; b=XKiOKaIUxbX9Ml9/+frKvU6Wy2JAxQZo0QpCSWpe3sUQ5NLig3yRylJDwv1oiWJcAtdJa0HDh/B8xxYLhS44Ie4zQus2eNMswaQCf45Raok07GPpauinZmr0kENTd0ogxQUXYwqNoFShTrAn0lIjBKkGMCpMbiHdXbKUgENhdEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753313076; c=relaxed/simple;
	bh=+4u1MaJK1A+Rad0L9jVZEAMiiByl3JNhcrjLJAWEh9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwN/PrIF1CaXbiPCi7DTLX8VtBEoFxTuNof4lQ4TmWfBliAWBvRAntrbCcn9sQiAxToP69idwZHkjHAc/ZczBVoi7MhmTVml70famw/vMptY6iBWu2HC6/zR9WXLXIMzS1GmcENB3fjs9CVFYP+LQ8VnPcZe1lqxX0dCrnt3FjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=Ywx9292b; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753313066; bh=+4u1MaJK1A+Rad0L9jVZEAMiiByl3JNhcrjLJAWEh9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ywx9292b66+0MVWomL/PFKYWGzVwocr1dPLFpjP/DEhP6v6FvYzc1ASDgMcaC4/fE
	 nMuJDboyt2g6h6h/gnAY2mi5XngBOCC9xb5FhGpRqaqX3aSnw7cOl0o5z6zJHP01jX
	 w8zjwzDXmg8Tsu1rYIinX5pmhhqqNd9hVXfBVdkw=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id D9A861488F7B;
	Thu, 24 Jul 2025 01:24:25 +0200 (CEST)
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
Subject: [PATCH v3 04/11] net: qrtr: support identical node ids
Date: Thu, 24 Jul 2025 01:24:01 +0200
Message-ID: <8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1753312999.git.ionic@ionic.de>
References: <cover.1753312999.git.ionic@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Kenzior <denkenz@gmail.com>

Add support for tracking multiple endpoints that may have conflicting
node identifiers. This is achieved by using both the node and endpoint
identifiers as the key inside the radix_tree data structure.

For backward compatibility with existing clients, the previous key
schema (node identifier only) is preserved. However, this schema will
only support the first endpoint/node combination.  This is acceptable
for legacy clients as support for multiple endpoints with conflicting
node identifiers was not previously possible.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>

---

v3:
  - rebase against current master
  - port usage of [endpoint ID|node ID] key usage to the generic
    solution already established for the [node ID|port number] usage
  - Link to v2: https://msgid.link/4d0fe1eab4b38fb85e2ec53c07289bc0843611a2.1752947108.git.ionic@ionic.de

v2:
  - rebase against current master
  - no action on review comment regarding integer overflow on 32 bit
    long platforms (thus far)
  - Link to v1: https://msgid.link/20241018181842.1368394-4-denkenz@gmail.com
---
 net/qrtr/af_qrtr.c | 50 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 1cb13242e41b..d6efd7f2eddf 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -119,14 +119,15 @@ static DEFINE_XARRAY_ALLOC(qrtr_ports);
 
 /* The radix tree API uses fixed unsigned long keys and we will have to make
  * do with that.
- * These keys are often a combination of node IDs (currently u32) and
- * port numbers (also currently u32).
- * Using the high 32 bits for the node ID and the low 32 bits for the
- * port number will work fine to create keys on platforms where unsigned long
- * is 64 bits wide, but obviously is not be possible on platforms where
- * unsigned long is smaller.
+ * These keys are often a combination of node IDs and port numbers or
+ * endpoint IDs and node IDs (all currently u32).
+ * Using the high 32 bits for the node/endpoint ID and the low 32 bits for the
+ * port number/node ID will work fine to create keys on platforms where
+ * unsigned long is 64 bits wide, but obviously is not be possible on
+ * platforms where unsigned long is smaller.
  * Virtually split up unsigned long in half and assign the upper bits to
- * node IDs and the lower bits to the port number, however big that may be.
+ * node/endpoint IDs and the lower bits to the port number/node ID, however
+ * big that may be.
  */
 #define QRTR_INDEX_HALF_BITS (RADIX_TREE_INDEX_BITS >> 1)
 
@@ -465,19 +466,36 @@ static struct qrtr_node *qrtr_node_lookup(unsigned int nid)
  *
  * This is mostly useful for automatic node id assignment, based on
  * the source id in the incoming packet.
+ *
+ * Return: 0 on success; negative error code on failure
  */
-static void qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
+static int qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
 {
 	unsigned long flags;
+	unsigned long key;
 
 	if (nid == QRTR_EP_NID_AUTO)
-		return;
+		return 0;
 
 	spin_lock_irqsave(&qrtr_nodes_lock, flags);
-	radix_tree_insert(&qrtr_nodes, nid, node);
+
+	if (node->ep->id > QRTR_INDEX_HALF_UNSIGNED_MAX ||
+	    nid > QRTR_INDEX_HALF_UNSIGNED_MAX)
+		return -EINVAL;
+
+	/* Always insert with the endpoint_id + node_id */
+	key = ((unsigned long)(node->ep->id) << QRTR_INDEX_HALF_BITS) |
+	      ((unsigned long)(nid) & QRTR_INDEX_HALF_UNSIGNED_MAX);
+	radix_tree_insert(&qrtr_nodes, key, node);
+
+	if (!radix_tree_lookup(&qrtr_nodes, nid))
+		radix_tree_insert(&qrtr_nodes, nid, node);
+
 	if (node->nid == QRTR_EP_NID_AUTO)
 		node->nid = nid;
 	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
+
+	return 0;
 }
 
 /**
@@ -571,14 +589,18 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 
 	skb_put_data(skb, data + hdrlen, size);
 
-	qrtr_node_assign(node, cb->src_node);
+	ret = qrtr_node_assign(node, cb->src_node);
+	if (ret)
+		goto err;
 
 	if (cb->type == QRTR_TYPE_NEW_SERVER) {
 		/* Remote node endpoint can bridge other distant nodes */
 		const struct qrtr_ctrl_pkt *pkt;
 
 		pkt = data + hdrlen;
-		qrtr_node_assign(node, le32_to_cpu(pkt->server.node));
+		ret = qrtr_node_assign(node, le32_to_cpu(pkt->server.node));
+		if (ret)
+			goto err;
 	}
 
 	if (cb->type == QRTR_TYPE_RESUME_TX) {
@@ -670,7 +692,9 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
 	INIT_RADIX_TREE(&node->qrtr_tx_flow, GFP_KERNEL);
 	mutex_init(&node->qrtr_tx_lock);
 
-	qrtr_node_assign(node, nid);
+	rc = qrtr_node_assign(node, nid);
+	if (rc < 0)
+		goto free_node;
 
 	mutex_lock(&qrtr_node_lock);
 	list_add(&node->item, &qrtr_all_nodes);
-- 
2.50.0


