Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22D4C190526
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 06:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbgCXF3L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 01:29:11 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41266 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgCXF3L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 01:29:11 -0400
Received: by mail-pg1-f196.google.com with SMTP id b1so8451104pgm.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 22:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GksRJuQygj8iEw4+FLEhSTTKNuAXjcLxWomfet7/TQc=;
        b=AeJERwRSpJgnUUI1sktI8LwnrhuSGSz3vYH1BFGxcVqWMRFulqPzEU+WQgIDtowBid
         DY0kGUla4Ru00rBlZA6ZdZE8lKd1/wJoWuf0lfY+cj2pDSnteABWfDjOZQsvKM+QFXa3
         sMkhhNfGBHxaoBmA97f4vTJUIS1/CiwlZbeWU+TAt0eAlf/M7HCTuKV4oURSn8ECY4sC
         iX3F68HmPtaSvXgjFbClRcp4WaMOa4pIhb2bRBGX1JuaJ2bryB0/Lnge5pkrunV1IAMe
         3x+OLXURB5P9kmJSJkyX2vCL4/RwyaFE97vy31wFojuM9pWgkikB1TK966do/hubMOas
         w5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GksRJuQygj8iEw4+FLEhSTTKNuAXjcLxWomfet7/TQc=;
        b=Zdm7+TxWjOzRQ6E+QqwCOObD18VCsNI1HIm51PEXnkphEh8U3afrgfnrs/1MgAy74+
         Y/zanPp6oX9ewIk9ebU6VDRxfzpcAghWrt3azeUraGev648QK/4bopPBUi7Iusnk/bm8
         Ou40qv+A/2Xrbql7px+aPflZQiDMXpmu8I5uH1jQOzs7ZUFyr6qivX7gaU+fdPI6PrDM
         vj4BnATXj336cIKWvz+fFYPbn4AQ5r6FITkugGT9LiMH5iOPZAC0+gQ3vs06sAE18t53
         t8Rw8meEFOYBmcfvUkeAm8ELZGL/T6hZBAt7f+PB9dkn+RdsH8K6DDn0DtDkFw1y+Gqz
         CAiQ==
X-Gm-Message-State: ANhLgQ3jtBg/nFng5ifUYeEVs0qSAaaG6CYG3eQxcmbEhL6Hqfgk6Aj7
        CaAqZKBC+FjJSLHDX9uBcjtkiA==
X-Google-Smtp-Source: ADFU+vvQ57kvoZi+N9uQpIwZoXOTeauhh9IYgweVQ3UD9AqMO2B6kX+AF3DFoI0AvOUD007/H1wUOw==
X-Received: by 2002:a62:4e4c:: with SMTP id c73mr28422516pfb.254.1585027750135;
        Mon, 23 Mar 2020 22:29:10 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j14sm2795413pgk.74.2020.03.23.22.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 22:29:09 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v5 1/4] remoteproc: Traverse rproc_list under RCU read lock
Date:   Mon, 23 Mar 2020 22:29:01 -0700
Message-Id: <20200324052904.738594-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200324052904.738594-1-bjorn.andersson@linaro.org>
References: <20200324052904.738594-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to be able to traverse the mostly read-only rproc_list without
locking during panic migrate traversal to be done under rcu_read_lock().

Mutual exclusion for modifications of the list continues to be handled
by the rproc_list_mutex and a synchronization point is added before
releasing objects that are popped from the list.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Added rculist include
- Picked up Mathieu's r-b

 drivers/remoteproc/remoteproc_core.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index a9ac1d01e09b..7ee976ee2044 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -26,6 +26,7 @@
 #include <linux/string.h>
 #include <linux/debugfs.h>
 #include <linux/devcoredump.h>
+#include <linux/rculist.h>
 #include <linux/remoteproc.h>
 #include <linux/iommu.h>
 #include <linux/idr.h>
@@ -1868,8 +1869,8 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
 	if (!np)
 		return NULL;
 
-	mutex_lock(&rproc_list_mutex);
-	list_for_each_entry(r, &rproc_list, node) {
+	rcu_read_lock();
+	list_for_each_entry_rcu(r, &rproc_list, node) {
 		if (r->dev.parent && r->dev.parent->of_node == np) {
 			/* prevent underlying implementation from being removed */
 			if (!try_module_get(r->dev.parent->driver->owner)) {
@@ -1882,7 +1883,7 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
 			break;
 		}
 	}
-	mutex_unlock(&rproc_list_mutex);
+	rcu_read_unlock();
 
 	of_node_put(np);
 
@@ -1939,7 +1940,7 @@ int rproc_add(struct rproc *rproc)
 
 	/* expose to rproc_get_by_phandle users */
 	mutex_lock(&rproc_list_mutex);
-	list_add(&rproc->node, &rproc_list);
+	list_add_rcu(&rproc->node, &rproc_list);
 	mutex_unlock(&rproc_list_mutex);
 
 	return 0;
@@ -2156,9 +2157,12 @@ int rproc_del(struct rproc *rproc)
 
 	/* the rproc is downref'ed as soon as it's removed from the klist */
 	mutex_lock(&rproc_list_mutex);
-	list_del(&rproc->node);
+	list_del_rcu(&rproc->node);
 	mutex_unlock(&rproc_list_mutex);
 
+	/* Ensure that no readers of rproc_list are still active */
+	synchronize_rcu();
+
 	device_del(&rproc->dev);
 
 	return 0;
-- 
2.24.0

