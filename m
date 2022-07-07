Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11EF0569C9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 10:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234249AbiGGIEq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 04:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235069AbiGGIEn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 04:04:43 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A362A3138C
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 01:04:42 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id o7so654685lfq.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 01:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/f9p62fMS99xM7mHr2HHjGLpTbZceR2Zn1lLek1ud1w=;
        b=qcCCSCFt2Fd3xS6h0fNJd8tshWFUhAnilR0zaFXiYC+2gr9VkWb1raxklvKrDw6hlY
         dAPVWf/k1xdeharGHf7BNCouDaAdRErvrpC2wTWIp6eRyFwEw//K9DvEr9pXrm0eMM98
         ajJNzpUIKBBSa0ITyfQfshw1WcAKt3vIi5Iax3LvgTHmzFgkdoxJKuUkFoeK4sIVaHo0
         izNTxua9Yuk1XQBqYn8WrDw7bG2XIqfdtUZ/i4qew913Lmc2Jx2aOkPasA5aYuaylm4v
         1mgTkBoxM9t1sI9y+fK8lLdFgxcZ25BvWviYXcOot4tFhtkMJRA14QfEYhmkmt0Pvvfz
         u1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/f9p62fMS99xM7mHr2HHjGLpTbZceR2Zn1lLek1ud1w=;
        b=FeJjImhBIY0N10eapBOG5weYVIwXwhKrPoFpm1IlsU7ggy1Wgjt28G8HrD3P7oNVBO
         RxK6bXEkQYEjpwPZD79FdettzytiwkX461LZnG2kQXx1VLbhHfBD3R7HIuPMdpqWzb4R
         vBheNyYD2hxeaQU+AeyfMUnvUMxcZHjBe6wOyLJqX2VaaaVFQD6/RxW4YQ5QO0Hw/DF9
         oFzl5DCzo4Y2O2EOOf5ywCcM7ZUAyFPsP6lWcxIGNbXSnh0vRXmHEABFCK4PGz2GqmKR
         ApkAM6BFqQ7AITx6k5OaZ8MfPWsuPWv8EZaqAaZ6PChNDTUEBV2MsOK/i5zRJDTY0GmZ
         DS3A==
X-Gm-Message-State: AJIora8K+5SaVyMtJynDqfaLWR80/KVYZJNzNzDw+PsduCzNfD+rh55r
        UrZhjz/hhBU4RUJ2u91PaYAEs6R/2aG6cBAT
X-Google-Smtp-Source: AGRyM1uyxLr6utQh6WzGkS/o4ElVNUkS91rxr9fiBUrexVoQfiiRTZ7YoxUejt5fjwk0KqBV2M5Tag==
X-Received: by 2002:a05:6512:169f:b0:482:f605:c19c with SMTP id bu31-20020a056512169f00b00482f605c19cmr10449081lfb.592.1657181079425;
        Thu, 07 Jul 2022 01:04:39 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b0047b0f2d7650sm6697187lfr.271.2022.07.07.01.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 01:04:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] dt-bindings: mmc: sdhci-msm: fix reg-names entries
Date:   Thu,  7 Jul 2022 09:51:47 +0200
Message-Id: <20220707075151.67335-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220707075151.67335-1-krzysztof.kozlowski@linaro.org>
References: <20220707075151.67335-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bindings before conversion to DT schema expected reg-names without
"_mem" suffix.  This was used by older DTS files and by the MSM SDHCI
driver.

Reported-by: Douglas Anderson <dianders@chromium.org>
Fixes: edfbf8c307ff ("dt-bindings: mmc: sdhci-msm: Fix issues in yaml bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mmc/sdhci-msm.yaml    | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 31a3ce208e1a..10707c4f7184 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -59,22 +59,22 @@ properties:
     maxItems: 4
     oneOf:
       - items:
-          - const: hc_mem
+          - const: hc
       - items:
-          - const: hc_mem
-          - const: core_mem
+          - const: hc
+          - const: core
       - items:
-          - const: hc_mem
-          - const: cqe_mem
+          - const: hc
+          - const: cqhci
       - items:
-          - const: hc_mem
-          - const: cqe_mem
-          - const: ice_mem
+          - const: hc
+          - const: cqhci
+          - const: ice
       - items:
-          - const: hc_mem
-          - const: core_mem
-          - const: cqe_mem
-          - const: ice_mem
+          - const: hc
+          - const: core
+          - const: cqhci
+          - const: ice
 
   clocks:
     minItems: 3
-- 
2.34.1

