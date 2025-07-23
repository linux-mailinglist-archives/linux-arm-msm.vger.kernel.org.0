Return-Path: <linux-arm-msm+bounces-66399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C2FB0FD67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 01:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA5DF1CC37E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 23:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212EE2777EC;
	Wed, 23 Jul 2025 23:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="To/cMw0T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933CF21ABC1;
	Wed, 23 Jul 2025 23:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753313077; cv=none; b=rzELoMysdlGsnURnL/ZjVb86vPl8QguqeNwhQmmpVuVvKq4SUmMsmTb5A6eUfa3elErVxRahqQZCpyOJonauxnKCuX9tp5d7AHOaJUEr1z3lSJ5EisSnB0R9kN2vOFfg5XXo9xqRIBHTN9NMlFqJh0En4VKn1emELm65cq71sDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753313077; c=relaxed/simple;
	bh=5m5Z7rnKJd9uHLf9I9bz0+5lkNs2dSsbxUlOE5rVAfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rWuoPt5rkQY887LoAt3uvSkSIcp1aXuEdLDeVcrM1VyaadoYn+UlzPpMXZjA3t1szBxOqut9pwar1JnV7rIQzSbV/AZBVa6xZ2jW7BLh3l6HFI6pPIOcGSC1jnE5kM6AkEyV/K+3AByXnlUCRn/8yMQ5atj9zMGgiHU+B2S+pZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=To/cMw0T; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753313065; bh=5m5Z7rnKJd9uHLf9I9bz0+5lkNs2dSsbxUlOE5rVAfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=To/cMw0Tp4+lg4kNUW5D03D5h/Tq9c9quCrWg3/Spdj/gjWUEVvBtoYpQlogI917s
	 92eZ/ZPjo8wz4b0eZj4zqmVqK7SUurZb0xVZKvBNmt3KosJLkyFYMgSg9Ewuo1VpC/
	 ebYm0brp7rB+jmrt/979Jxf+IGTsKOB/JSgE0Jfk=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id A3CBC1488DA1;
	Thu, 24 Jul 2025 01:24:25 +0200 (CEST)
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
Subject: [PATCH v3 03/11] net: qrtr: fit node ID + port number combination into unsigned long
Date: Thu, 24 Jul 2025 01:24:00 +0200
Message-ID: <c60cc5f238873f72ef6f49582fb87ae7122853d5.1753312999.git.ionic@ionic.de>
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


