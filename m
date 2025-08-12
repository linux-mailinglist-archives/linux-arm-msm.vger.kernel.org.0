Return-Path: <linux-arm-msm+bounces-68615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9D7B21A5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE73D681994
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3829F2E2F09;
	Tue, 12 Aug 2025 01:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="B4qbk/+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFDB2D97BD;
	Tue, 12 Aug 2025 01:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754963152; cv=none; b=rnhidiLPBOJQXV3XAxrOsvsvTEtW35IFe72p2eKEMTMrHUVRhov1BWZKSrKLe3I67YJobLwaL8Rhg/vK7nuGM87AhcrR42F271jK9YUrEVv4kLsQQS1hXpFqJpH7uHOEK7N3qeIfdVv2dH4ugmUbqJOldlMSC3otAmhkx6UhB4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754963152; c=relaxed/simple;
	bh=zURby7dEjdNCu4Fhh7pmi3qrsPWqU1XAnEunWXqrDeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zt1htKxXK4/A50oiVMefLpRNKcw9Hh/yOOf8XAOmrN2BEo/nKofuxDdiXYzgFlu+GyrjKfOA6589V3lu8lYEuB0fvWNHERPIWR9F9KfhYyCQ15+BP8op1SmGw7QNv6x1hbWgswMDJvsuZ3utqTXQDIfn1If3F7k+j2e1tcsK7bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=B4qbk/+0; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1754962548; bh=zURby7dEjdNCu4Fhh7pmi3qrsPWqU1XAnEunWXqrDeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B4qbk/+0KUKC/gD88ehLoCX+76Fs6YLgjLfV4/tCMeAjB5fplV8j9aQwwWG9I3ziO
	 6YfOjHAu3fi9zZJEaKsb7iP3fDh7DhV7VlWTiDe77D1+E78pWs/Y+WxUzJWTF+oUhO
	 l9nB9wO9SIHP04E3fyjfdydJxwl48npECbLdCWcw=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 9080F1488512;
	Tue, 12 Aug 2025 03:35:48 +0200 (CEST)
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
Subject: [PATCH v5 02/11] net: qrtr: allocate and track endpoint ids
Date: Tue, 12 Aug 2025 03:35:28 +0200
Message-ID: <38b7a0038d4ae7ca155d205d713ab5dfc702f407.1754962437.git.ionic@ionic.de>
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

From: Denis Kenzior <denkenz@gmail.com>

Currently, QRTR endpoints are tracked solely by their pointer value,
which is sufficient as they are not exposed to user space and it is
assumed that each endpoint has a unique set of node identifiers
associated with it.  However, this assumption does not hold when
multiple devices of the same type are connected to the system.  For
example, multiple PCIe based 5G modems.  Such a setup results in
multiple endpoints with confliciting node identifiers.

To enable support for such scenarios, introduce the ability to track
and assign unique identifiers to QRTR endpoints. These identifiers
can then be exposed to user space, allowing for userspace clients to
identify which endpoint sent a given message, or to direct a message
to a specific endpoint.

A simple allocation strategy is used based on xa_alloc_cyclic.  Remote
endpoint ids start at 'qrtr_local_nid' + 1.  Since qrtr_local_nid is
currently always set to 1 and never changed, node identifiers start at
'1' for the local endpoint and 2..INT_MAX for remote endpoints.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>

---
v5:
  - no changes
  - Link to v4: https://msgid.link/347e1fb6aba96b3ef63634b21a20f36453a3bcac.1753720934.git.ionic@ionic.de

v4:
  - no changes
  - Link to v3: https://msgid.link/10b228a30c4416201fa90a10e75ddf05935dc3ec.1753312999.git.ionic@ionic.de

v3:
  - rebase against current master
  - Link to v2: https://msgid.link/86ef12964a23c9331be16961a5f9c6ec857aa56c.1752947108.git.ionic@ionic.de

v2:
  - rebase against current master
  - Link to v1: https://msgid.link/20241018181842.1368394-3-denkenz@gmail.com
---
 net/qrtr/af_qrtr.c | 24 ++++++++++++++++++++++++
 net/qrtr/qrtr.h    |  1 +
 2 files changed, 25 insertions(+)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 00c51cf693f3..be275871fb2a 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -22,6 +22,7 @@
 #define QRTR_MAX_EPH_SOCKET 0x7fff
 #define QRTR_EPH_PORT_RANGE \
 		XA_LIMIT(QRTR_MIN_EPH_SOCKET, QRTR_MAX_EPH_SOCKET)
+#define QRTR_ENDPOINT_RANGE XA_LIMIT(qrtr_local_nid + 1, INT_MAX)
 
 #define QRTR_PORT_CTRL_LEGACY 0xffff
 
@@ -109,6 +110,10 @@ static LIST_HEAD(qrtr_all_nodes);
 /* lock for qrtr_all_nodes and node reference */
 static DEFINE_MUTEX(qrtr_node_lock);
 
+/* endpoint id allocation management */
+static DEFINE_XARRAY_ALLOC(qrtr_endpoints);
+static u32 next_endpoint_id;
+
 /* local port allocation management */
 static DEFINE_XARRAY_ALLOC(qrtr_ports);
 
@@ -585,6 +590,8 @@ static struct sk_buff *qrtr_alloc_ctrl_packet(struct qrtr_ctrl_pkt **pkt,
 int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
 {
 	struct qrtr_node *node;
+	u32 endpoint_id;
+	int rc;
 
 	if (!ep || !ep->xmit)
 		return -EINVAL;
@@ -593,6 +600,13 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
 	if (!node)
 		return -ENOMEM;
 
+	rc = xa_alloc_cyclic(&qrtr_endpoints, &endpoint_id, NULL,
+			     QRTR_ENDPOINT_RANGE, &next_endpoint_id,
+			     GFP_KERNEL);
+
+	if (rc < 0)
+		goto free_node;
+
 	kref_init(&node->ref);
 	mutex_init(&node->ep_lock);
 	skb_queue_head_init(&node->rx_queue);
@@ -608,8 +622,12 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
 	list_add(&node->item, &qrtr_all_nodes);
 	mutex_unlock(&qrtr_node_lock);
 	ep->node = node;
+	ep->id = endpoint_id;
 
 	return 0;
+free_node:
+	kfree(node);
+	return rc;
 }
 EXPORT_SYMBOL_GPL(qrtr_endpoint_register);
 
@@ -628,8 +646,10 @@ void qrtr_endpoint_unregister(struct qrtr_endpoint *ep)
 	struct sk_buff *skb;
 	unsigned long flags;
 	void __rcu **slot;
+	u32 endpoint_id;
 
 	mutex_lock(&node->ep_lock);
+	endpoint_id = node->ep->id;
 	node->ep = NULL;
 	mutex_unlock(&node->ep_lock);
 
@@ -656,6 +676,10 @@ void qrtr_endpoint_unregister(struct qrtr_endpoint *ep)
 	mutex_unlock(&node->qrtr_tx_lock);
 
 	qrtr_node_release(node);
+
+	xa_erase(&qrtr_endpoints, endpoint_id);
+
+	ep->id = 0;
 	ep->node = NULL;
 }
 EXPORT_SYMBOL_GPL(qrtr_endpoint_unregister);
diff --git a/net/qrtr/qrtr.h b/net/qrtr/qrtr.h
index 3f2d28696062..11b897af05e6 100644
--- a/net/qrtr/qrtr.h
+++ b/net/qrtr/qrtr.h
@@ -21,6 +21,7 @@ struct qrtr_endpoint {
 	int (*xmit)(struct qrtr_endpoint *ep, struct sk_buff *skb);
 	/* private: not for endpoint use */
 	struct qrtr_node *node;
+	u32 id;
 };
 
 int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid);
-- 
2.50.0


