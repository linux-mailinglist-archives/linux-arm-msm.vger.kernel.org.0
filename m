Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1AFB482C75
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jan 2022 18:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbiABRuE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jan 2022 12:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiABRuE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jan 2022 12:50:04 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5348C061761
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jan 2022 09:50:03 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id v7so65746547wrv.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jan 2022 09:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f/23sp1iBvoUiVjjVi++1/pRdYTmKhtlANlkSerXd08=;
        b=tYKARDaQ5u5adV9zC7q44A7IL73nAsobcLzJ8JMaKVcNyLtyjGibbCRSWpujUXqThw
         +VcCvaMo0jZ/h5spYLzvrnhQO+UXFaPckLhBp0whjINWIaUOWLfHi+89jz73xg07UJxn
         vPNryvEOAQCaJdkNNGe1RFLFLT0ReeDzhcDJ3tuSlG2eKYDeQUgukqhqa7gtMMuFZiwz
         NV1IWdtiCdty6X3nUjThkzLK+Of2EGEnePa07rGol/l0Fr0/+TyqxxPC6jZfF1TJfZ4U
         eJ1PlGctGSpSD3k8tsJyDxgg2WalOJ48ueqrTo7P5jQ3az+/jC1sCK6oyhIJtdbxeaxD
         rH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f/23sp1iBvoUiVjjVi++1/pRdYTmKhtlANlkSerXd08=;
        b=x53/cE2y0lGbPMdh9FXDAHwu+czxwOBSGENCFONW7g7Su+JttkieydHGx5ysQqvo81
         C7P7xg+fMru2iFlWm4K1Te1K2XLW5NqJ49WIxjT6dkxxSJtaorpVJk9SCl+yG4rV96rX
         0M6WzozL3HdQeyJIaJ59Ze5sCCBGAe14pOKWCDDCvMU3T5EE/Am5jCpWsvZoHgoFrnT1
         3tLihC2WfdCKmYOL+cFOgK/R+xLiKb9q58AqRkKRMe4PQQSIoNBjUTpZHFQT6Y1b0WDk
         cHaHMwYA6xZ8+hF5CQEn36E87tah3RNtCZpYeQw8Tuh9uPSnOjoantea1RsEGtusk9Tp
         XH4w==
X-Gm-Message-State: AOAM531EYnfyZ8O4NY0aI+T2bnSgUgl2WBLwii+40TZonmIJWRbOtPY1
        YvEjTrJz/vqoqzEIKxbnkwUCnBUi09C8cQ==
X-Google-Smtp-Source: ABdhPJyDfDza2tpMfD0SPFAiUn84iJf8jMGv78xiZPbuRdqDLQnnBAgVWBkAQSuxqp5jIfrq77yFrg==
X-Received: by 2002:a5d:5255:: with SMTP id k21mr37623129wrc.381.1641145802034;
        Sun, 02 Jan 2022 09:50:02 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o10sm23539488wmq.31.2022.01.02.09.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 09:50:01 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        mani@kernel.org, miquel.raynal@bootlin.com, architt@codeaurora.org,
        bbrezillon@kernel.org, absahu@codeaurora.org
Cc:     baruch@tkos.co.il, bryan.odonoghue@linaro.org
Subject: [PATCH] mtd: rawnand: qcom: Fix clock sequencing in qcom_nandc_probe()
Date:   Sun,  2 Jan 2022 17:52:06 +0000
Message-Id: <20220102175206.3960-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
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

