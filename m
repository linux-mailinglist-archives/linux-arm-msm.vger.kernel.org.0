Return-Path: <linux-arm-msm+bounces-65745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0817B0B182
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 20:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46FF3AA08FF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 18:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF1B286D45;
	Sat, 19 Jul 2025 18:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="pDoMf1F0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF81622128B;
	Sat, 19 Jul 2025 18:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752951583; cv=none; b=ZJCfqcRRZCV1k/TLREmNamnydMVk2jtv8KQV+cN0navBhQKJ5+O4Xe7khvG6bMRKTuShGz/iUByLg67rz3c7t7js9ZmJc1ir9WfJZoJj7qqZGIv2fjITVV1W2t1y6QriQQ8+igsxoUI8BRNhIOQrsMXO+BBwmvWEvlEnS6XPWco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752951583; c=relaxed/simple;
	bh=yrAXa18SYdKavpPK/s+Yc9dv9kkaVhECsf86LYmJprY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjL4tkd+1SobGDNnVGMrxVGypp6yiA3IyUuobDD0f1tZtJy/OySg1e/S1tZI7IQPEAtCPu8j77gKhWZwWQLPQ/Vqp54dcT2aVOqdqxLJr36WFQG3HX6I1+GsHVHJ8qOn3BBkrIbJU2Dv4WNGwqy8tnOyDbHNpvL4rk6QH5euzI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=pDoMf1F0; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1752951577; bh=yrAXa18SYdKavpPK/s+Yc9dv9kkaVhECsf86LYmJprY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pDoMf1F04a+npryIp6GZVDUDE6INUH2h7K7CC6dEfYtlI7lgvOTSkT4IPwDqPkrvT
	 HnsLJ9ynqapYapYdPWI7n8xw2V/mlPztg1g+KUS0tiVga47dRrnML7bG2NceQlq+ir
	 mrRWw+jJ39GE6+jXZ0QrX/hPpKu03s6BRc8eLi/w=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 73B141488410;
	Sat, 19 Jul 2025 20:59:37 +0200 (CEST)
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
Subject: [PATCH v2 03/10] net: qrtr: support identical node ids
Date: Sat, 19 Jul 2025 20:59:23 +0200
Message-ID: <4d0fe1eab4b38fb85e2ec53c07289bc0843611a2.1752947108.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1752947108.git.ionic@ionic.de>
References: <cover.1752947108.git.ionic@ionic.de>
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

v2:
  - rebase against current master
  - no action on review comment regarding integer overflow on 32 bit
    long platforms (thus far)
---
 net/qrtr/af_qrtr.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index be275871fb2a..e83d491a8da9 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -418,12 +418,20 @@ static struct qrtr_node *qrtr_node_lookup(unsigned int nid)
 static void qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
 {
 	unsigned long flags;
+	unsigned long key;
 
 	if (nid == QRTR_EP_NID_AUTO)
 		return;
 
 	spin_lock_irqsave(&qrtr_nodes_lock, flags);
-	radix_tree_insert(&qrtr_nodes, nid, node);
+
+	/* Always insert with the endpoint_id + node_id */
+	key = (unsigned long)node->ep->id << 32 | nid;
+	radix_tree_insert(&qrtr_nodes, key, node);
+
+	if (!radix_tree_lookup(&qrtr_nodes, nid))
+		radix_tree_insert(&qrtr_nodes, nid, node);
+
 	if (node->nid == QRTR_EP_NID_AUTO)
 		node->nid = nid;
 	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
-- 
2.50.0


