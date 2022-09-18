Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADF335BBC7C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Sep 2022 10:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiIRILr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Sep 2022 04:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiIRILp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Sep 2022 04:11:45 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4C11F2DA
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Sep 2022 01:11:35 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id fv3so25004696pjb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Sep 2022 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=cIRY+VRqALb4vEHaHBDDtY15l5f9Vz43K52fRmFtiwU=;
        b=XbzktqWZbBO3vuz+FO9itbrCAcsxrsZEGIJxnBkuxQwBM5NecKenUNbzxMTDF7CCJa
         6h+q1l1nihH1IbhCZgdmvKM7CAIqMysiDln3BPCt5Ec85bwAWxXssgKiH+TlVo5N9dGo
         FFouc0fcuNeRBmXBVGZEe/I5Zdf2BPLSx4scJ7Xr6PdfVasDVj/6WJ7SvxEfadKf6yQx
         eFDc/c7QX0w4X+H5icD50QFhZQ4RcIDYJ6Bk/vQJk66f5jTekDLG7lCQWReFfeGWjtig
         f9M2MgOv3jZmq2l8bLdSkm4zl74Jw7qTPRVISG3lger/zuvzOPdli6zOAQb0C2dAhi/U
         Ck1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=cIRY+VRqALb4vEHaHBDDtY15l5f9Vz43K52fRmFtiwU=;
        b=t8P12GdQbQPUOiLPLxJ3qau0XPc68ev12J7P4jT3ebTgs5RRdwvrRqmdgsoe7kY/+D
         AY947lRZbT9Qcl2c0JIW2tPU+CHNGuCD3QjiS+nSIWXepsS86P9lkuBnExMlE9dX2Ow+
         cjjnA/8Oo0Jw30kdCpVsUNLNbeKfpAsX+G005CJ++mEQiRR9jsEiG2KyiCFsSSsUSmaq
         axWSFwWEwKEgTzVxonQqQPHydUv6C4AEOtZGGb4LzjQ2LHjUg+RbsBT1megpzJhcSjgq
         lQh8UdvmuRfWrWjbFSlX4xR1YejIzPKxpXyXw3vodUHhip9OR1HdQtWg7HQbKqnxIhoL
         8gmg==
X-Gm-Message-State: ACrzQf3OcIYbNAjxOkVFacVysPbo5iR7WaHwg6jzl5S2zLMp+X8u3VLP
        b/CmDS/JbYUycQZmMT8lkxpOimDAstoGTg==
X-Google-Smtp-Source: AMsMyM5XOWO0tuvHPZ8b2m/5XqlmKf32SySgNDZrfYEsflHmGqkiSGI/l9ZZ5xllTHmfulUj7TeZkQ==
X-Received: by 2002:a17:90b:4b03:b0:202:a7e1:2c9a with SMTP id lx3-20020a17090b4b0300b00202a7e12c9amr13544715pjb.195.1663488694587;
        Sun, 18 Sep 2022 01:11:34 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:6535:ca5f:67d1:670d:e188])
        by smtp.gmail.com with ESMTPSA id n17-20020a170902e55100b001752cb111e0sm18244781plf.69.2022.09.18.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 01:11:34 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, agross@kernel.org, dmaengine@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        andersson@kernel.org, krzysztof.kozlowski@linaro.org
Subject: [PATCH] dt-bindings: dma: Make minor fixes to qcom,bam-dma binding doc
Date:   Sun, 18 Sep 2022 13:41:19 +0530
Message-Id: <20220918081119.295364-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.37.1
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

As a user recently noted, the qcom,bam-dma binding document
describes the BAM DMA node incorrectly. Fix the same by making
it consistent with the node present inside 'qcom-msm8974' dts
file.

While at it also make two minor cleanups:
 - mention Bjorn's new email ID in the document, and
 - add SDM845 in the comment line for the SoCs on which
   qcom,bam-v1.7.0 version is supported.

Fixes: 4f46cc1b88b3 ("dt-bindings: dma: Convert Qualcomm BAM DMA binding to json format")
Cc: konrad.dybcio@somainline.org
Cc: robh+dt@kernel.org
Cc: andersson@kernel.org
Cc: krzysztof.kozlowski@linaro.org
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 9bf3a1b164f1..003098caf709 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -8,7 +8,7 @@ title: Qualcomm Technologies Inc BAM DMA controller
 
 maintainers:
   - Andy Gross <agross@kernel.org>
-  - Bjorn Andersson <bjorn.andersson@linaro.org>
+  - Bjorn Andersson <andersson@kernel.org>
 
 allOf:
   - $ref: "dma-controller.yaml#"
@@ -20,7 +20,7 @@ properties:
       - qcom,bam-v1.3.0
         # MSM8974, APQ8074 and APQ8084
       - qcom,bam-v1.4.0
-        # MSM8916
+        # MSM8916 and SDM845
       - qcom,bam-v1.7.0
 
   clocks:
@@ -90,8 +90,8 @@ examples:
 
     dma-controller@f9944000 {
         compatible = "qcom,bam-v1.4.0";
-        reg = <0xf9944000 0x15000>;
-        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+        reg = <0xf9944000 0x19000>;
+        interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&gcc GCC_BLSP2_AHB_CLK>;
         clock-names = "bam_clk";
         #dma-cells = <1>;
-- 
2.37.1

