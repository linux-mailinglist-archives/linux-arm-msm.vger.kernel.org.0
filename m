Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3ECE482D98
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jan 2022 04:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiACDBL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jan 2022 22:01:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiACDBK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jan 2022 22:01:10 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95EFCC061761
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jan 2022 19:01:10 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id o3so9154685wrh.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jan 2022 19:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f/23sp1iBvoUiVjjVi++1/pRdYTmKhtlANlkSerXd08=;
        b=DerPVSiRTyAmcw+c3wNyWOUveWjaeSeWQbISCGTOmlLtnHgSZ6dPLTl4tjHPVh46x8
         lXxww8s9V2qHt3e+UGTGACJFjapchh17MBcLWV810s8qaavG5a7a7a4cbc+VkcT8GjYy
         1XhLfiGnOU9Wx/ahden2LvW0GGh7uAWCapqWM7OrPauoyqPEHuKboG+NcYqjEdh/oC7g
         5ocDTgATAybN7Ya2YxVtI88y+I6X0xAQK8CjEYAnDh5CqBu0HuC9S5fKjpJzoXQd56JT
         XcG0EvkZpyjDQYQ8xxlZzA8ZyukWXgrcHUnjNbZ1uT4k2LD4DHFvX7hcpE0Vyb6i0ebR
         iI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f/23sp1iBvoUiVjjVi++1/pRdYTmKhtlANlkSerXd08=;
        b=woNWDTpoesMHn/8Ht5obv14S4BwPIbEN/8MFEUggoSd4oY1kV0FU6iucJzEs39/8BQ
         UJBncAmJ+bgVyl8S2AKcAtwp5LqVZIk5AmeZn9YDjlpfmDySH0MGKzPcclAVndMWuLWa
         ziqxUbvO0rvbmV1FeZFoixEGI9y7ylGZ+9qo4LsvSeHzEVU4XnGtDOBXh5OPIvkp7wDI
         Eavr1h/rExXns3pMUwoxi+OKoUJ1hzRjgGN1XzIaLRHnm+10aCCMDqJTMoUaUB04HDp7
         mEhnlcZSw2QL67jSHZDIrhOE40h92bvJZHfA+QPABeYOAu3RMHxZTWJctyNRIkWf8Bhf
         q/Cw==
X-Gm-Message-State: AOAM533ZHg5Wg6P4JZgf9+c+IaiIUyDDYb5aGl1RotUQSxt4pgTEaM0k
        /GfaFZf9CE8jBFirTOYH9P2EAnfapSmzRg==
X-Google-Smtp-Source: ABdhPJxrnsqjm+lHytj9AGsJzo4p0rOgX1tPIYgePIAHUdICjerX9+4ADRb6XODxmI5k/0bHpQuynQ==
X-Received: by 2002:adf:9d8c:: with SMTP id p12mr36533639wre.622.1641178868914;
        Sun, 02 Jan 2022 19:01:08 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p11sm38095667wru.99.2022.01.02.19.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 19:01:08 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        mani@kernel.org, miquel.raynal@bootlin.com, architt@codeaurora.org,
        bbrezillon@kernel.org, absahu@codeaurora.org
Cc:     baruch@tkos.co.il, bryan.odonoghue@linaro.org
Subject: [PATCH v2 1/2] mtd: rawnand: qcom: Fix clock sequencing in qcom_nandc_probe()
Date:   Mon,  3 Jan 2022 03:03:15 +0000
Message-Id: <20220103030316.58301-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
References: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Interacting with a NAND chip on an IPQ6018 I found that the qcomsmem NAND
partition parser was returning -EPROBE_DEFER waiting for the main smem
driver to load.

This caused the board to reset. Playing about with the probe() function
shows that the problem lies in the core clock being switched off before the
nandc_unalloc() routine has completed.

If we look at how qcom_nandc_remove() tears down allocated resources we see
the expected order is

qcom_nandc_unalloc(nandc);

clk_disable_unprepare(nandc->aon_clk);
clk_disable_unprepare(nandc->core_clk);

dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
		   DMA_BIDIRECTIONAL, 0);

Tweaking probe() to both bring up and tear-down in that order removes the
reset if we end up deferring elsewhere.

Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 04e6f7b267064..0f41a9a421575 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
  */
-
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/bitops.h>
@@ -3063,10 +3062,6 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (dma_mapping_error(dev, nandc->base_dma))
 		return -ENXIO;
 
-	ret = qcom_nandc_alloc(nandc);
-	if (ret)
-		goto err_nandc_alloc;
-
 	ret = clk_prepare_enable(nandc->core_clk);
 	if (ret)
 		goto err_core_clk;
@@ -3075,6 +3070,10 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_aon_clk;
 
+	ret = qcom_nandc_alloc(nandc);
+	if (ret)
+		goto err_nandc_alloc;
+
 	ret = qcom_nandc_setup(nandc);
 	if (ret)
 		goto err_setup;
@@ -3086,15 +3085,14 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	return 0;
 
 err_setup:
+	qcom_nandc_unalloc(nandc);
+err_nandc_alloc:
 	clk_disable_unprepare(nandc->aon_clk);
 err_aon_clk:
 	clk_disable_unprepare(nandc->core_clk);
 err_core_clk:
-	qcom_nandc_unalloc(nandc);
-err_nandc_alloc:
 	dma_unmap_resource(dev, res->start, resource_size(res),
 			   DMA_BIDIRECTIONAL, 0);
-
 	return ret;
 }
 
-- 
2.33.0

