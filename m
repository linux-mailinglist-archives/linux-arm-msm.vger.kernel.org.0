Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBF8D4FEAB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 01:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbiDLXbp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 19:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbiDLXbU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 19:31:20 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9B94160C35
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 15:28:37 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-e2fa360f6dso248133fac.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 15:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kt6hVezA4Ogh+PUM8JOZYwYjeiXqtSjEWHLo3rQRGl8=;
        b=rsrmN9GV2IuXGuywIbghXo04lZLtLq4A5BKYi11L5WMpei/I566zW/OwMuSj8sIspk
         h7JOTTAhevGgnMeH1vcnsGwCLaXOZGgt7nsmf2OKd6lhsmLkhUIPY98904dc1jZiNxTe
         e6QH2lMeq7jk8bdiNjXZIje95okyFWz3TzE/jLCy/hIAiXVOTdxhGjF0QYYFWv4HqDjA
         jtdkXHjQDKtWdF1buIm3Y9ezgu+i7x1PX1/Du2Rk67FNhzt+bujjUXvaq60d0Ep9QfO9
         NLHm++jtQ5HBWjwRNL23gzouVMgDCfcWdWNS7QrKPZQvBG/IVjc45xK/ifjt7AcppnUs
         LGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kt6hVezA4Ogh+PUM8JOZYwYjeiXqtSjEWHLo3rQRGl8=;
        b=TazRmXendezTKqw5CgCYho1SSBlcRrBw6H8xXk4DqULMRW+AkpYKkzT1fNjSVrKhEP
         UWmwIQ5DKjF7wH1G8m0redd6wO/3x8mk+XfpuqtEswARrJGOwVrKsrCyRv1OH3YF80wN
         l6c+Z58u1uDTOP6bF02gg8JBCiMB5eZ76E7Bb830vYdJEQLeo9TYLkxRXNp/usZphOy3
         HcE69kzIyJawXSla4eOQ36xPfAZDscvSAUdyAoIaxsIwMvmcKzNiaoOUzKtTcODeKii8
         VBQcWrsyKhl+Q3VVZjWVq1zoBRTyZMpa+H+gIfBxBY8cAYSBzuZfo5p6Wzpvp6L/oy9F
         +LwA==
X-Gm-Message-State: AOAM5332uHs/6dzqjTsExLn/Q+UTq3a8gAP2FAUa+ndltLSQDY5y0WES
        ibgqqok0R3CVyu6b1x9B0IWSeWyaBdpCz1Bp
X-Google-Smtp-Source: ABdhPJzDXnuMXj8lsWFh9MLTAE6t9BXfQ7i8D5Ywu7RnBrVjybChs3FdEk4GVHksS5/5SqXipery7g==
X-Received: by 2002:a05:6871:1d4:b0:de:6122:2bbb with SMTP id q20-20020a05687101d400b000de61222bbbmr2978500oad.210.1649798865016;
        Tue, 12 Apr 2022 14:27:45 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id r8-20020a05683001c800b005cdadc2a837sm13831278ota.70.2022.04.12.14.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:27:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: qcom: gpi: Add SM8350 support
Date:   Tue, 12 Apr 2022 14:29:59 -0700
Message-Id: <20220412212959.2385085-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SM8350 platform does, like the SM8450, provide a set of GPI
controllers with an ee-offset of 0x10000. Add this to the driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

This depends on the ee-offset series previously posted by Vinod:
https://lore.kernel.org/all/20220406132508.1029348-1-vkoul@kernel.org/

 drivers/dma/qcom/gpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 0b402d923eae..d8fad6a77560 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -2289,6 +2289,7 @@ static const struct of_device_id gpi_of_match[] = {
 	{ .compatible = "qcom,sdm845-gpi-dma", .data = (void *)0x0 },
 	{ .compatible = "qcom,sm8150-gpi-dma", .data = (void *)0x0 },
 	{ .compatible = "qcom,sm8250-gpi-dma", .data = (void *)0x0 },
+	{ .compatible = "qcom,sm8350-gpi-dma", .data = (void *)0x10000 },
 	{ .compatible = "qcom,sm8450-gpi-dma", .data = (void *)0x10000 },
 	{ },
 };
-- 
2.35.1

