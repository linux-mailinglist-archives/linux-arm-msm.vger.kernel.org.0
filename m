Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F09915FFA6F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 16:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiJOOFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Oct 2022 10:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiJOOFY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Oct 2022 10:05:24 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D7462E6A6
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 07:05:22 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id a18so4241391qko.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 07:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYgNOPB2ou2QU09N065JCjsFs4GUgDaOF6Ag64S/wVc=;
        b=Ud/w3bMWnByY+ubVBteDK8+NuzzWFrNAMvoeQTFka+kW068kMHwt16riEPTZwjz2Yd
         Qb7XPXqLamRfrc5ra6AuhRYROt34DAkztH3jp9lRjUNuHadeikIj+pLRsXZTLLBsklXH
         SQ/Wbfp2gdCLzixYOWDHc9YUqZPP1QUnf9oIyAPAQ1U5ZAGQM3SpzQA63R0u++Z1MbJn
         +fec0HaXmt5VvK+m3HgFOyj0lGtPZHmZkxmS/km4KMbRfwcmdKNw7hVAIW25v9cHoA/2
         JYmFtEys8Vv5vgRoZee4OBlEIIMSBBL9dJKIxPwYR3T/FUxXMo6gIaJdWfSiRdoU7HTq
         ojBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYgNOPB2ou2QU09N065JCjsFs4GUgDaOF6Ag64S/wVc=;
        b=6aDWE8ac5UpaDMPormDEdhmnrEVOn0xywq+0n6a1b5CpFcTAZLewfjfb+6T9Ua4rGh
         9n2Y9H0eQkOQvayFj4pMtuV7Kye8dN4WM5myfAcbbNO5WX/r3JG5FJGkiw77M4vLkrnZ
         wYC2fbIrMVMxpSENu6mMUtn3i/CrJzVm6oXMK0rAROe0AdtN8LT+OkfqMz7KWzACTkuv
         RcKpb5fdLTN+tYl0WyhXw4cXi/mch3/zC2wVsoSUT/+H5Disk3ttO/mfeBRm8wv7lf+A
         S29DwfxFWHBW8pHuyza3v9xToD2hGmfeV4wL8uBQa/2zhYqPsp/n9KpNTxjb8oN2bSNw
         gFnQ==
X-Gm-Message-State: ACrzQf1OhXYTY0mLpfASjyQg9pSDPEm5d0VpmtKDQEq/YN6IvvJQdyLy
        v9iwTuKeUpt43pffFP5aS+sLpw==
X-Google-Smtp-Source: AMsMyM597iUAERus57y/4z0u3KllGvTg1CsFwXlRz55k1tmxlrzEkj0TbsPXwJHScNGMW1oUOPXpmA==
X-Received: by 2002:a05:620a:298a:b0:6ce:7aa7:f01f with SMTP id r10-20020a05620a298a00b006ce7aa7f01fmr1834266qkp.611.1665842721806;
        Sat, 15 Oct 2022 07:05:21 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:161:5720:79e9:9739])
        by smtp.gmail.com with ESMTPSA id s21-20020a05620a29d500b006bb78d095c5sm4958022qkp.79.2022.10.15.07.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Oct 2022 07:05:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/5] dmaengine: qcom: gpi: document preferred SM6350 binding
Date:   Sat, 15 Oct 2022 10:04:44 -0400
Message-Id: <20221015140447.55221-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015140447.55221-1-krzysztof.kozlowski@linaro.org>
References: <20221015140447.55221-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Devices with ee offset of 0x10000 should rather bind with SM6350
compatible, so the list will not unnecessarily grow for compatible
devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/dma/qcom/gpi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index f8e19e6e6117..061add832295 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -2286,13 +2286,14 @@ static int gpi_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id gpi_of_match[] = {
-	{ .compatible = "qcom,sc7280-gpi-dma", .data = (void *)0x10000 },
 	{ .compatible = "qcom,sdm845-gpi-dma", .data = (void *)0x0 },
 	{ .compatible = "qcom,sm6350-gpi-dma", .data = (void *)0x10000 },
 	/*
-	 * Deprecated, devices with ee_offset = 0 should use sdm845-gpi-dma as
-	 * fallback and not need their own entries here.
+	 * Do not grow the list for compatible devices. Instead use
+	 * qcom,sdm845-gpi-dma (for ee_offset = 0x0) or qcom,sm6350-gpi-dma
+	 * (for ee_offset = 0x10000).
 	 */
+	{ .compatible = "qcom,sc7280-gpi-dma", .data = (void *)0x10000 },
 	{ .compatible = "qcom,sm8150-gpi-dma", .data = (void *)0x0 },
 	{ .compatible = "qcom,sm8250-gpi-dma", .data = (void *)0x0 },
 	{ .compatible = "qcom,sm8350-gpi-dma", .data = (void *)0x10000 },
-- 
2.34.1

