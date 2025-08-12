Return-Path: <linux-arm-msm+bounces-68612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A74FB21A53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8CDC6815A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E442DA758;
	Tue, 12 Aug 2025 01:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="MUrzVPFX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F043E2D94B0;
	Tue, 12 Aug 2025 01:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754963151; cv=none; b=FyPI14Qfaxb/UyLgkSbucSgMXcVjv45dPhWyR2j3ao1LmKlDeg8bqYC5cJzZejCYRJCTTBw5D/LHObWm3Y3B//t4ZYNkS/JwgS4NHaF1breP5pfm/FwxqlJPC5cAJf6FPAvNMKTiwTKunopd6nXTsgpE/QuLCEkNIRLG0t1wBZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754963151; c=relaxed/simple;
	bh=XJW6FhYoL6IDU6yznKWkzoG/IsU++GEp4qB0PSbUliw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YaVXdgr75/LenYPgyfTWtutgoJihNy0EMiMarD/zXgC2fXzlaWp3C/g1Pj5pLSqXJD0s6MP+1ovuTgsFzycznxssI55qE9CN79nF+MfsUnOtH1HS4dMDLjObSeoAjxlW+oKQLAu2KoGoXywvdtrZzyPTSwXezPC7qhBIN20L+vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=MUrzVPFX; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1754962549; bh=XJW6FhYoL6IDU6yznKWkzoG/IsU++GEp4qB0PSbUliw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MUrzVPFXwunXZT26t0qdZlWcUCxWraT4ufU2TvkTIlIprMch10CVt8lFKWVXkBpYm
	 p8A9fj4D3iXwC0cm+HwroQ29qUldBlDw+0iJcn6Uwi4JumulNzpUjOiwnQDJrk6TDo
	 9KgvspxcC9VAgwl/VKi3BHEsUDVP35i/x+S6Bwew=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id D344C1488DA2;
	Tue, 12 Aug 2025 03:35:48 +0200 (CEST)
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
Subject: [PATCH v5 03/11] net: qrtr: fit node ID + port number combination into unsigned long
Date: Tue, 12 Aug 2025 03:35:29 +0200
Message-ID: <d924086c0a1c25923ad8837867befb0acc157184.1754962437.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1754962436.git.ionic@ionic.de>
References: <cover.1754962436.git.ionic@ionic.de>
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
the port number to the lower 32 bits of the unsigned long value to
create a key.

Unfortunately, since both node IDs and port numbers are defined as u32,
this will overflow on platforms where sizeof(unsigned long) < 8 (which
are most 32 bit platforms) and essentially just drop the node ID part.

To fix this, build the key in a generic way, using half of the unsigned
long space for the node ID and the other half for the port number.

This will be transparent to platforms where sizeof(unsigned long) >= 8
and fix overflow issues otherwise.

The caveat, of course, is that, for platforms where
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
v5:
  - fix typos in commit message
  - Link to v4: https://msgid.link/bd59711a31a2189bb4963a70e51a3dbff86b3a87.1753720934.git.ionic@ionic.de

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


