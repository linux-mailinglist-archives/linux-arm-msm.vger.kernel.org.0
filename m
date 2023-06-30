Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6BFE7436F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 10:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbjF3IW7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 04:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232487AbjF3IWw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 04:22:52 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5101997
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:22:50 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-541f4ee6f89so1041288eaf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688113370; x=1690705370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrjvdZSqXKi+MzhLUYpp9EjIDqVatd4GVNSMEpyYnzM=;
        b=PdGrOZqUNMIVKYpcRnI1Ytu67Raaza2ub+psac8z5niLZHd2m5wyzOmmcbo/pO3O6h
         qV8w16EUvJlFRvNNukwqIOlqbR69Ge2v8dZHWpzc+DN+i+difQSy6iE12cqKfpXpW7dn
         RzMOVfC2fyibUvZM9Roq3f+TTTk8j9Fa/q7sF5wNwi7Ba+ghmfw0urFR7w1Ck5XJhSC7
         cgMfB3MkBOXiVzDUG87AmxeVa22EukJv82RP5pv8VPQrzdze4oYHoNXJDiV9eG8XoDMV
         TiGYn3dU51siFrNvOnHeAHG5ovbHZFuO+zLNJ76RqUGt7ZuD2r3GY9IY4gYhkrIWIiNF
         M65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688113370; x=1690705370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrjvdZSqXKi+MzhLUYpp9EjIDqVatd4GVNSMEpyYnzM=;
        b=APGMisru13DAxjr3o1iz+Ry9lje0V587Uq7Fb8QKDflfSlmVlGJgOz4E/rfn6wHSCb
         dv1s6I17O7EJNjHDcIAkcf9xEpDVDNoVWUi4Y/Yeck0nvYnEG0yH5LnlLWob5v/7+iR2
         Ut2jnpO+jB56YaDnvqwLxaV5bUMMV9kANN/Lp8XNvgJNt3Z0EFCP15zCYgsHvypn49oW
         tYzSC3ZaXzojUF7fI+JZQzelVq0HowRrQVZ3IjNeV7vl3tzfH5xvUsnpmD+eYh+Sd/wF
         RtYT7ep6lryqekqm0DA1CTDLEGbb2ej+fcTvempnnC/TcVkSN6cLNeq5uQ3v2QmDho3A
         9YJw==
X-Gm-Message-State: AC+VfDzvxpSgPvh5p29lwcoq+IVK3FCDzQ5QWxNysuJBKcPOnzc0b1HO
        NtC9W7CgX9gIaKpOOy6IpeTX4A==
X-Google-Smtp-Source: ACHHUZ7fv25b4NqzS5nc52ICPAzmMdZpfzr3JEQ4jnDQJ4zoGPvq4G3o8jHq+fcAkq8br6tNfjMUmA==
X-Received: by 2002:a05:6808:138c:b0:3a1:e128:ccfc with SMTP id c12-20020a056808138c00b003a1e128ccfcmr2248034oiw.36.1688113370162;
        Fri, 30 Jun 2023 01:22:50 -0700 (PDT)
Received: from localhost.localdomain ([223.233.68.54])
        by smtp.gmail.com with ESMTPSA id a16-20020aa780d0000000b00666e2dac482sm9462967pfn.124.2023.06.30.01.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:22:49 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     devicetree@vger.kernel.org, dmaengine@vger.kernel.org
Cc:     vkoul@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, agross@kernel.org,
        konrad.dybcio@linaro.org, conor+dt@kernel.org, robh+dt@kernel.org,
        Rob Herring <robh@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v9 1/2] dt-bindings: dma: Add support for SM6115 and QCM2290 SoCs
Date:   Fri, 30 Jun 2023 13:52:29 +0530
Message-Id: <20230630082230.2264698-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230630082230.2264698-1-bhupesh.sharma@linaro.org>
References: <20230630082230.2264698-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add new compatible for BAM DMA engine version v1.7.4 which is
found on Qualcomm SM6115 and QCM2290 SoCs. Since its very similar
to v1.7.0 used on SM8150 like SoCs, mark the comptible scheme
accordingly.

While at it, also update qcom,bam-dma bindings to add comments
which describe the BAM DMA versions used in SM8150 and SM8250 SoCs.
This provides an easy reference for identifying the actual BAM DMA
version available on Qualcomm SoCs.

Acked-by: Rob Herring <robh@kernel.org>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/dma/qcom,bam-dma.yaml | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index f1ddcf672261..c663b6102f50 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -15,13 +15,19 @@ allOf:
 
 properties:
   compatible:
-    enum:
-        # APQ8064, IPQ8064 and MSM8960
-      - qcom,bam-v1.3.0
-        # MSM8974, APQ8074 and APQ8084
-      - qcom,bam-v1.4.0
-        # MSM8916 and SDM845
-      - qcom,bam-v1.7.0
+    oneOf:
+      - enum:
+          # APQ8064, IPQ8064 and MSM8960
+          - qcom,bam-v1.3.0
+          # MSM8974, APQ8074 and APQ8084
+          - qcom,bam-v1.4.0
+          # MSM8916, SDM630
+          - qcom,bam-v1.7.0
+      - items:
+          - enum:
+              # SDM845, SM6115, SM8150, SM8250 and QCM2290
+              - qcom,bam-v1.7.4
+          - const: qcom,bam-v1.7.0
 
   clocks:
     maxItems: 1
-- 
2.38.1

