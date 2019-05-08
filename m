Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD72170C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 08:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbfEHGHN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 02:07:13 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34798 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfEHGGv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 02:06:51 -0400
Received: by mail-pl1-f196.google.com with SMTP id w7so366697plz.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2019 23:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5IgbbTEWxx9612vWZb+A6P+LPisYaMkTp+oYoBjVljQ=;
        b=L/bxrM+JHPq69ydLVroJHc6ezcUZtRdVhf8h5c+uTnt5DKqt1RUtVh2oS3D7/r5B1H
         KFjM/EMJ6gZqR6GRjMPALRLwQc5h9sCopFUYQj2XRNFTvy/tHj17VkppsfdskI8iBq/C
         i2AQmfR0Rzrmzsy89Hwwf7wbo2TpP9hHNyA9qzzxhnFAYeV1ouBVauOx40r/6+IPTt2A
         LJMMBerTq6n4+jaAmbXexhvnKYmVU660ABRSAUngUJE5/rC8cpU7TZP0zLDNFPXHoDEX
         +nT4FJF9HEls18UXmV60PR/kQDqAUNkmKPkOVG6RFCO1IovVSjRfTyIHXQVZbCROmuPR
         63WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5IgbbTEWxx9612vWZb+A6P+LPisYaMkTp+oYoBjVljQ=;
        b=Y2DPKjR8npL96Q526npPZ2Ubq46JzCrasCsfKTlI84c7NwzO11Mky3MxnUIspqE5Yf
         xvkkhKZRLw1279khO2BUKkHI0MqoatuybUgIVj1wWdFjr5CgSPdXDFd2e9zHFUL8/X3W
         q3z6J6hgKllUCdpw3ka/DkGqcDgBU+MozpXn2vll8xseNAwjb6b1PpF5AGxOSS5AOn2P
         LIL/uW9VMGgt9/kZm5ZiJP3kirIsVYEAxvGlreNe8JSly0em0fg4Jki7v7BzCRBfW9Jq
         eCCN1nW6m+NWOER/9C0UpOys9r15k9YHW6U0MAYeYnRx62nWezB6ZMGDbeD0Np/kfKtf
         WQbA==
X-Gm-Message-State: APjAAAX+L2TBod0UVIx6GuGiNsfu1m8I0fRNY9sYotJ+x7hQ7PsvOlZt
        VwSoZ0Rzl0tqW1sECknUvWXiJw==
X-Google-Smtp-Source: APXvYqzirKWJWRFKigN/+Jt0kptk8S4fO8R/Xem8kaKS4wCakNCSQ7AknQt7apF4ilmyLh3Md8GR3w==
X-Received: by 2002:a17:902:8ec6:: with SMTP id x6mr43914309plo.123.1557295610614;
        Tue, 07 May 2019 23:06:50 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t5sm2756130pgn.80.2019.05.07.23.06.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 23:06:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "David S. Miller" <davem@davemloft.net>,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/5] net: qrtr: Migrate node lookup tree to spinlock
Date:   Tue,  7 May 2019 23:06:41 -0700
Message-Id: <20190508060643.30936-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190508060643.30936-1-bjorn.andersson@linaro.org>
References: <20190508060643.30936-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move operations on the qrtr_nodes radix tree under a separate spinlock
and make the qrtr_nodes tree GFP_ATOMIC, to allow operation from atomic
context in a subsequent patch.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 net/qrtr/qrtr.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/net/qrtr/qrtr.c b/net/qrtr/qrtr.c
index 62abd622618d..9075751028a2 100644
--- a/net/qrtr/qrtr.c
+++ b/net/qrtr/qrtr.c
@@ -16,6 +16,7 @@
 #include <linux/qrtr.h>
 #include <linux/termios.h>	/* For TIOCINQ/OUTQ */
 #include <linux/numa.h>
+#include <linux/spinlock.h>
 #include <linux/wait.h>
 
 #include <net/sock.h>
@@ -106,10 +107,11 @@ static inline struct qrtr_sock *qrtr_sk(struct sock *sk)
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
@@ -171,10 +173,13 @@ static void __qrtr_node_release(struct kref *kref)
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
@@ -340,11 +345,12 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
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
@@ -356,13 +362,15 @@ static struct qrtr_node *qrtr_node_lookup(unsigned int nid)
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
2.18.0

