Return-Path: <linux-arm-msm+bounces-66914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FCDB14091
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 18:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9EFB163F5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DFF273D6E;
	Mon, 28 Jul 2025 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="oy2Minc6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80407212B28;
	Mon, 28 Jul 2025 16:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753721148; cv=none; b=SmJqbMpNx32n6vrOfjAnhjvEIY7yzPxuTffgkuPDg9pgzENdyoqhtRoqpmN84De+LdqhjNnR+2gEu3AaZYegtu/CjzoDRxDvDMlH+1Oo3yIYPuygZUfhlbnRoC2/D1oWHr8mvT3Hi6+f1vmhOOCjJBIoXKgtN18SQNHJm10kx9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753721148; c=relaxed/simple;
	bh=5JwOdTLpR46JSYq6kgfw5nuNpNhQ+yZNQsJFt8Vs68E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=suMuMnjzXTVuZ8BjePVu9H/rgLCqbmJy92t8coF9bgOumtiqhUlR5V2C+izlFmMS/UJ86o4B3kfdRo/mAl+vbZ0nmOS9LKqIalMNHLrn72ZKXTaAPOa5cMVt/etLgQ1dXVDrM+6EMLr8x2rxI/vlW+oXx32RVvPVjCgyMzOW2JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=oy2Minc6; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753721137; bh=5JwOdTLpR46JSYq6kgfw5nuNpNhQ+yZNQsJFt8Vs68E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oy2Minc6jq4y2jrzyZhwFh8d1wL8Ire1NkcohBZMBEqX/rItb6IddVKPxvU1wi/Gx
	 CwA/aiacsOEinY8iNhiOys7qd+svl7F7FnXB3Yk7UQMgXDxq6Q895KCbhdbSVJqhjf
	 qaP1SBswf45TKOEIomK+e6gD0OhUA4mo3Sr/FKGU=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id BC9A6148841E;
	Mon, 28 Jul 2025 18:45:37 +0200 (CEST)
From: Mihai Moldovan <ionic@ionic.de>
To: linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v4 03/11] net: qrtr: fit node ID + port number combination into unsigned long
Date: Mon, 28 Jul 2025 18:45:20 +0200
Message-ID: <bd59711a31a2189bb4963a70e51a3dbff86b3a87.1753720934.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1753720934.git.ionic@ionic.de>
References: <cover.1753720934.git.ionic@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The flow control implementation uses a radix tree to store node ID and
port number combinations and the key length is hardcoded to unsigned
long.

The original implementation shifted the node ID up by 32 bits and added
the port number to the lower 64 bits of the unsigned long value to
create a key.

Unfortunately, since both node IDs and port numbers are defined as u32,
this will overflow on platforms where sizeof(unsigned long) < 8 (which
are most 32 bit platforms) and essentially just drop the node ID part.

To fix this, build the key in a generic way, using half of the unsigned
long space for the node ID and the other half for the port number.

This will be transparent to platforms where sizeof(unsigned long) >= 8
and fix overflow issues otherwise.

The caveat, of course. is that, for platforms where
sizeof(unsigned long) < 8, the supported amount of node IDs and port
numbers will be severely limited - to half of sizeof(unsigned long),
which typically will be 16 bits. Needless to say, we have to check if
both values fit into this limit.

This limitation is probably not going to be an issue in real-world
scenarios, but if it turns out to be one after all, we could switch from
a radix tree implementation to an XArray implementation.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Fixes: 5fdeb0d372ab ("net: qrtr: Implement outgoing flow control")

---
v4:
  - no changes
  - Link to v3: https://msgid.link/c60cc5f238873f72ef6f49582fb87ae7122853d5.1753312999.git.ionic@ionic.de

v3:
  - introduce commit
---
 net/qrtr/af_qrtr.c | 76 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 11 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index be275871fb2a..1cb13242e41b 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -117,13 +117,33 @@ static u32 next_endpoint_id;
 /* local port allocation management */
 static DEFINE_XARRAY_ALLOC(qrtr_ports);
 
+/* The radix tree API uses fixed unsigned long keys and we will have to make
+ * do with that.
+ * These keys are often a combination of node IDs (currently u32) and
+ * port numbers (also currently u32).
+ * Using the high 32 bits for the node ID and the low 32 bits for the
+ * port number will work fine to create keys on platforms where unsigned long
+ * is 64 bits wide, but obviously is not be possible on platforms where
+ * unsigned long is smaller.
+ * Virtually split up unsigned long in half and assign the upper bits to
+ * node IDs and the lower bits to the port number, however big that may be.
+ */
+#define QRTR_INDEX_HALF_BITS (RADIX_TREE_INDEX_BITS >> 1)
+
+#define QRTR_INDEX_HALF_UNSIGNED_MAX ((~(unsigned long)(0)) >> QRTR_INDEX_HALF_BITS)
+#define QRTR_INDEX_HALF_UNSIGNED_MIN ((unsigned long)(0))
+
+#define QRTR_INDEX_HALF_SIGNED_MAX ((long)(QRTR_INDEX_HALF_UNSIGNED_MAX) >> 1)
+#define QRTR_INDEX_HALF_SIGNED_MIN ((long)(-1) - QRTR_INDEX_HALF_SIGNED_MAX)
+
 /**
  * struct qrtr_node - endpoint node
  * @ep_lock: lock for endpoint management and callbacks
  * @ep: endpoint
  * @ref: reference count for node
  * @nid: node id
- * @qrtr_tx_flow: tree of qrtr_tx_flow, keyed by node << 32 | port
+ * @qrtr_tx_flow: tree of qrtr_tx_flow, keyed by
+ *                node << QRTR_INDEX_HALF_BITS | port
  * @qrtr_tx_lock: lock for qrtr_tx_flow inserts
  * @rx_queue: receive queue
  * @item: list item for broadcast list
@@ -222,16 +242,23 @@ static void qrtr_node_release(struct qrtr_node *node)
  * qrtr_tx_resume() - reset flow control counter
  * @node:	qrtr_node that the QRTR_TYPE_RESUME_TX packet arrived on
  * @skb:	resume_tx packet
+ *
+ * Return: 0 on success; negative error code on failure
  */
-static void qrtr_tx_resume(struct qrtr_node *node, struct sk_buff *skb)
+static int qrtr_tx_resume(struct qrtr_node *node, struct sk_buff *skb)
 {
 	struct qrtr_ctrl_pkt *pkt = (struct qrtr_ctrl_pkt *)skb->data;
 	u64 remote_node = le32_to_cpu(pkt->client.node);
 	u32 remote_port = le32_to_cpu(pkt->client.port);
 	struct qrtr_tx_flow *flow;
-	unsigned long key;
+	unsigned long key = 0;
 
-	key = remote_node << 32 | remote_port;
+	if (remote_node > QRTR_INDEX_HALF_UNSIGNED_MAX ||
+	    remote_port > QRTR_INDEX_HALF_UNSIGNED_MAX)
+		return -EINVAL;
+
+	key = ((unsigned long)(remote_node) << QRTR_INDEX_HALF_BITS) |
+	      ((unsigned long)(remote_port) & QRTR_INDEX_HALF_UNSIGNED_MAX);
 
 	rcu_read_lock();
 	flow = radix_tree_lookup(&node->qrtr_tx_flow, key);
@@ -244,6 +271,8 @@ static void qrtr_tx_resume(struct qrtr_node *node, struct sk_buff *skb)
 	}
 
 	consume_skb(skb);
+
+	return 0;
 }
 
 /**
@@ -264,11 +293,20 @@ static void qrtr_tx_resume(struct qrtr_node *node, struct sk_buff *skb)
 static int qrtr_tx_wait(struct qrtr_node *node, int dest_node, int dest_port,
 			int type)
 {
-	unsigned long key = (u64)dest_node << 32 | dest_port;
+	unsigned long key = 0;
 	struct qrtr_tx_flow *flow;
 	int confirm_rx = 0;
 	int ret;
 
+	if (dest_node < QRTR_INDEX_HALF_SIGNED_MIN ||
+	    dest_node > QRTR_INDEX_HALF_SIGNED_MAX ||
+	    dest_port < QRTR_INDEX_HALF_SIGNED_MIN ||
+	    dest_port > QRTR_INDEX_HALF_SIGNED_MAX)
+		return -EINVAL;
+
+	key = ((unsigned long)(dest_node) << QRTR_INDEX_HALF_BITS) |
+	      ((unsigned long)(dest_port) & QRTR_INDEX_HALF_UNSIGNED_MAX);
+
 	/* Never set confirm_rx on non-data packets */
 	if (type != QRTR_TYPE_DATA)
 		return 0;
@@ -324,13 +362,24 @@ static int qrtr_tx_wait(struct qrtr_node *node, int dest_node, int dest_port,
  * message associated with the dropped confirm_rx message.
  * Work around this by marking the flow as having a failed transmission and
  * cause the next transmission attempt to be sent with the confirm_rx.
+ *
+ * Return: 0 on success; negative error code on failure
  */
-static void qrtr_tx_flow_failed(struct qrtr_node *node, int dest_node,
-				int dest_port)
+static int qrtr_tx_flow_failed(struct qrtr_node *node, int dest_node,
+			       int dest_port)
 {
-	unsigned long key = (u64)dest_node << 32 | dest_port;
+	unsigned long key = 0;
 	struct qrtr_tx_flow *flow;
 
+	if (dest_node < QRTR_INDEX_HALF_SIGNED_MIN ||
+	    dest_node > QRTR_INDEX_HALF_SIGNED_MAX ||
+	    dest_port < QRTR_INDEX_HALF_SIGNED_MIN ||
+	    dest_port > QRTR_INDEX_HALF_SIGNED_MAX)
+		return -EINVAL;
+
+	key = ((unsigned long)(dest_node) << QRTR_INDEX_HALF_BITS) |
+	      ((unsigned long)(dest_port) & QRTR_INDEX_HALF_UNSIGNED_MAX);
+
 	rcu_read_lock();
 	flow = radix_tree_lookup(&node->qrtr_tx_flow, key);
 	rcu_read_unlock();
@@ -339,6 +388,8 @@ static void qrtr_tx_flow_failed(struct qrtr_node *node, int dest_node,
 		flow->tx_failed = 1;
 		spin_unlock_irq(&flow->resume_tx.lock);
 	}
+
+	return 0;
 }
 
 /* Pass an outgoing packet socket buffer to the endpoint driver. */
@@ -386,7 +437,7 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 	/* Need to ensure that a subsequent message carries the otherwise lost
 	 * confirm_rx flag if we dropped this one */
 	if (rc && confirm_rx)
-		qrtr_tx_flow_failed(node, to->sq_node, to->sq_port);
+		rc = qrtr_tx_flow_failed(node, to->sq_node, to->sq_port);
 
 	return rc;
 }
@@ -448,6 +499,7 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 	size_t size;
 	unsigned int ver;
 	size_t hdrlen;
+	int ret = -EINVAL;
 
 	if (len == 0 || len & 3)
 		return -EINVAL;
@@ -530,7 +582,9 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 	}
 
 	if (cb->type == QRTR_TYPE_RESUME_TX) {
-		qrtr_tx_resume(node, skb);
+		ret = qrtr_tx_resume(node, skb);
+		if (ret)
+			goto err;
 	} else {
 		ipc = qrtr_port_lookup(cb->dst_port);
 		if (!ipc)
@@ -548,7 +602,7 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 
 err:
 	kfree_skb(skb);
-	return -EINVAL;
+	return ret;
 
 }
 EXPORT_SYMBOL_GPL(qrtr_endpoint_post);
-- 
2.50.0


