Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7068A131F7C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 06:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbgAGFsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 00:48:01 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43145 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727346AbgAGFsA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 00:48:00 -0500
Received: by mail-pf1-f195.google.com with SMTP id x6so26939078pfo.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 21:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QW14bafe1w8Z5IsyZLv1Y8P7MJNChniS4xfMck61RNI=;
        b=tEHba60/tybGmDlgdPXzF2TruzOu2iEQ9ugQVOp5WB0v395QQnbEdhtpbaACGOUFwb
         za10LlwHCSYWYD5qlkNBxX5iD6JNOogVUTa41FNh02kEx/DhC6N8+HEZfLwemmDIvRGy
         g3erNafOcTy2V0L8jn3kGstv2U/yTTdTT1DguKnp7Ysv441QwCi+lRmKUBT4+M5qRTAa
         msZ27QfzryxDLuMS7Gr45ZM+gmheVdEt7ycl93kMW78Q1iOXayzzfCHOmPBPJ1o08aC2
         St/LH/VIZ5NVzFQuzjzCIzYWlL+12pSGeu+OexMVB/5WpFn5WrzjPV9G43Zga7LUgfvY
         fdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QW14bafe1w8Z5IsyZLv1Y8P7MJNChniS4xfMck61RNI=;
        b=cHQ0XpQMbQFlZggfmiPybKvZObdVJqSANAsFIerv7CjyN2P3sbjknSDem8Bmu/AoRs
         l9c1K4xQX7gw1XtKoNegPWRf7mYjzGcx4miFrmPFxVs2EeQp/t+PZjtF7/0JEZmDnOT6
         aYCOHnTYgn3ZJ/AjpypriktcktmE7NMbNRijkR1SvsN8GpkwMNZ+b0vIk/D9crTT9EDr
         7Wy3PCTuwF8lzxM0iVBSbzp6sOEM7YagYTpfvFsQlSqG0I+Pes48C/8BqwEKzV4mz5pK
         WUlE9IBJR0dREsATGTtcKdMvUDMmN3XjZvGKO0Bo0i8yFbKCft1p7uHMDlOLWXZ9L8XC
         nqBg==
X-Gm-Message-State: APjAAAXomRg+TCi7l4GUJbpAMofG+RBVZ7VMuKr0bqXT6nBSWk8izE3X
        fKv3gpctZvCnQser9o8WK7VDlA==
X-Google-Smtp-Source: APXvYqw/+U4ygJC5AbBpmPBwWDHDT7tPaXhtragdnFqBE7IpGe9OU+YV0CPMvBULpHy1yI9vuxRNJg==
X-Received: by 2002:aa7:96b0:: with SMTP id g16mr108180089pfk.99.1578376080279;
        Mon, 06 Jan 2020 21:48:00 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k21sm67129177pfa.63.2020.01.06.21.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 21:47:59 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 3/5] net: qrtr: Migrate node lookup tree to spinlock
Date:   Mon,  6 Jan 2020 21:47:11 -0800
Message-Id: <20200107054713.3909260-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200107054713.3909260-1-bjorn.andersson@linaro.org>
References: <20200107054713.3909260-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move operations on the qrtr_nodes radix tree under a separate spinlock
and make the qrtr_nodes tree GFP_ATOMIC, to allow operation from atomic
context in a subsequent patch.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 net/qrtr/qrtr.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/net/qrtr/qrtr.c b/net/qrtr/qrtr.c
index a6da5fa2a9b5..c2bbfa7ec6e2 100644
--- a/net/qrtr/qrtr.c
+++ b/net/qrtr/qrtr.c
@@ -8,6 +8,7 @@
 #include <linux/qrtr.h>
 #include <linux/termios.h>	/* For TIOCINQ/OUTQ */
 #include <linux/numa.h>
+#include <linux/spinlock.h>
 #include <linux/wait.h>
 
 #include <net/sock.h>
@@ -98,10 +99,11 @@ static inline struct qrtr_sock *qrtr_sk(struct sock *sk)
 static unsigned int qrtr_local_nid = NUMA_NO_NODE;
 
 /* for node ids */
-static RADIX_TREE(qrtr_nodes, GFP_KERNEL);
+static RADIX_TREE(qrtr_nodes, GFP_ATOMIC);
+static DEFINE_SPINLOCK(qrtr_nodes_lock);
 /* broadcast list */
 static LIST_HEAD(qrtr_all_nodes);
-/* lock for qrtr_nodes, qrtr_all_nodes and node reference */
+/* lock for qrtr_all_nodes and node reference */
 static DEFINE_MUTEX(qrtr_node_lock);
 
 /* local port allocation management */
@@ -165,10 +167,13 @@ static void __qrtr_node_release(struct kref *kref)
 {
 	struct radix_tree_iter iter;
 	struct qrtr_node *node = container_of(kref, struct qrtr_node, ref);
+	unsigned long flags;
 	void __rcu **slot;
 
+	spin_lock_irqsave(&qrtr_nodes_lock, flags);
 	if (node->nid != QRTR_EP_NID_AUTO)
 		radix_tree_delete(&qrtr_nodes, node->nid);
+	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
 
 	list_del(&node->item);
 	mutex_unlock(&qrtr_node_lock);
@@ -372,11 +377,12 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 static struct qrtr_node *qrtr_node_lookup(unsigned int nid)
 {
 	struct qrtr_node *node;
+	unsigned long flags;
 
-	mutex_lock(&qrtr_node_lock);
+	spin_lock_irqsave(&qrtr_nodes_lock, flags);
 	node = radix_tree_lookup(&qrtr_nodes, nid);
 	node = qrtr_node_acquire(node);
-	mutex_unlock(&qrtr_node_lock);
+	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
 
 	return node;
 }
@@ -388,13 +394,15 @@ static struct qrtr_node *qrtr_node_lookup(unsigned int nid)
  */
 static void qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
 {
+	unsigned long flags;
+
 	if (node->nid != QRTR_EP_NID_AUTO || nid == QRTR_EP_NID_AUTO)
 		return;
 
-	mutex_lock(&qrtr_node_lock);
+	spin_lock_irqsave(&qrtr_nodes_lock, flags);
 	radix_tree_insert(&qrtr_nodes, nid, node);
 	node->nid = nid;
-	mutex_unlock(&qrtr_node_lock);
+	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
 }
 
 /**
-- 
2.24.0

