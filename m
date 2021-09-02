Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFFF3FE8E5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 07:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236202AbhIBFuu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 01:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbhIBFut (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 01:50:49 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E98C061575
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Sep 2021 22:49:51 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id r13so765444pff.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Sep 2021 22:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=GJcVRSPYsYY/LVX5IvVL1ncAiddPO4CIgy+W/xjZOwM=;
        b=PaNl5JlV04wgvO6JrnI06GOAJwX2/3VxXaDLvDsNNAtCVwf3oj5FPExvEfTYsQgzco
         CbFJ2jQS7sCJWLHLNpjI56bRyofcEjdY4MKDGLkNyh5DV/eYymwImJNdyzZgv38/eI9n
         U+dWvvLhQFPkrI8cRPK655HhMNpsmDmfJ6y1MiQdwK1hd4vSwQvfpvXdVPNg4A9ndiTz
         z6ZgQIJkjg24tW1At+ONDT/d9M0JYZ5OP6sf/edKu/qbom/cUFj98OVylB4M4tyUk9ZP
         ojd0lWyZhqFl0AcukW+0N7yOQcdTd0mwaeg6K6vxLxl1oirTs45Ke4PUfGl15sLMo0d6
         17xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GJcVRSPYsYY/LVX5IvVL1ncAiddPO4CIgy+W/xjZOwM=;
        b=dumy/Nc7tv6D5WTxHWME1tKfO2lgKI2P4G3w1dUqmMZw/PGMyOHSysLR7kVHTTrkV/
         gB6A5WAfW6ZdDvfIqgbvi38WyKgZIBmylwcy3dNJJVNJgyFnEFj7i/b8rxjzPclopuTF
         pJO+O4OkwcK22Zh8rQiNcHRsgtxpFtTV4kISUiaJH3Alb8Tm4jONRckWjHeI2xCO9GJm
         7Yy5Csbh8H3N2210F44kTavyKzNl32yaZfbvOHAIwSs8CsRTscmqUr8pD7C8jHY3s4Ei
         /LawamyguCNMm8uGaKfdYfGsQO8ij1gGC/wW9/huZA+iXyVjI/qGvGP/BhxlMUE3ZBIE
         q19A==
X-Gm-Message-State: AOAM53345GGCGgEEkyoPPQ4Td6L/wbPfSrnjTMO0q6e/9+5BwCvAuVKW
        4eR4T7QRIwlGtoIloq3R0zcpBA==
X-Google-Smtp-Source: ABdhPJxEcsQBJuktIo2u1FWS+/SZENG+MSjrNfJK17DGoOfxrf80qsnDFbjWuqt9y39cuN2LA/SFMg==
X-Received: by 2002:a63:4b53:: with SMTP id k19mr1556891pgl.3.1630561791502;
        Wed, 01 Sep 2021 22:49:51 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t15sm935830pgi.80.2021.09.01.22.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 22:49:50 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2] interconnect: qcom: sdm660: Correct NOC_QOS_PRIORITY shift and mask
Date:   Thu,  2 Sep 2021 13:49:15 +0800
Message-Id: <20210902054915.28689-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The NOC_QOS_PRIORITY shift and mask do not match what vendor kernel
defines [1].  Correct them per vendor kernel.  As the result of
NOC_QOS_PRIORITY_P0_SHIFT being 0, the definition can be dropped and
regmap_update_bits() call on P0 can be simplified a bit.

[1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/soc/qcom/msm_bus/msm_bus_noc_adhoc.c?h=LA.UM.8.2.r1-04800-sdm660.0#n37

Fixes: f80a1d414328 ("interconnect: qcom: Add SDM660 interconnect provider driver")
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes for v2:
- Follow Angelo's suggestion to drop NOC_QOS_PRIORITY_P0_SHIFT.

 drivers/interconnect/qcom/sdm660.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/interconnect/qcom/sdm660.c b/drivers/interconnect/qcom/sdm660.c
index 6fd8e9800218..fb23a5b780a4 100644
--- a/drivers/interconnect/qcom/sdm660.c
+++ b/drivers/interconnect/qcom/sdm660.c
@@ -44,9 +44,9 @@
 #define NOC_PERM_MODE_BYPASS		(1 << NOC_QOS_MODE_BYPASS)
 
 #define NOC_QOS_PRIORITYn_ADDR(n)	(0x8 + (n * 0x1000))
-#define NOC_QOS_PRIORITY_MASK		0xf
+#define NOC_QOS_PRIORITY_P1_MASK	0xc
+#define NOC_QOS_PRIORITY_P0_MASK	0x3
 #define NOC_QOS_PRIORITY_P1_SHIFT	0x2
-#define NOC_QOS_PRIORITY_P0_SHIFT	0x3
 
 #define NOC_QOS_MODEn_ADDR(n)		(0xc + (n * 0x1000))
 #define NOC_QOS_MODEn_MASK		0x3
@@ -634,13 +634,12 @@ static int qcom_icc_noc_set_qos_priority(struct regmap *rmap,
 	/* Must be updated one at a time, P1 first, P0 last */
 	val = qos->areq_prio << NOC_QOS_PRIORITY_P1_SHIFT;
 	rc = regmap_update_bits(rmap, NOC_QOS_PRIORITYn_ADDR(qos->qos_port),
-				NOC_QOS_PRIORITY_MASK, val);
+				NOC_QOS_PRIORITY_P1_MASK, val);
 	if (rc)
 		return rc;
 
-	val = qos->prio_level << NOC_QOS_PRIORITY_P0_SHIFT;
 	return regmap_update_bits(rmap, NOC_QOS_PRIORITYn_ADDR(qos->qos_port),
-				  NOC_QOS_PRIORITY_MASK, val);
+				  NOC_QOS_PRIORITY_P0_MASK, qos->prio_level);
 }
 
 static int qcom_icc_set_noc_qos(struct icc_node *src, u64 max_bw)
-- 
2.17.1

