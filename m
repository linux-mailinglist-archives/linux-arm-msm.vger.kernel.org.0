Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 437B35273A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 21:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234832AbiENTB4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 15:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234839AbiENTBx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 15:01:53 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A0428736
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:51 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id l19so13824380ljb.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mfq8artsCmgPridHwXtCTWz4VD26jC/9nXCO2mqCNlk=;
        b=SVND50poq7YQONLFiDb5cM2XhT/ZQkEdBvG2GtV/4ZiG+IuDQNABzUURZiAfczlZTq
         17gUDyf2b11ycm8hXMzEtxqtsNR/N5724+yMc/t7cvYV0/wkvMGtmKl4HjCIw4Juzo7N
         NSI/vway7z9Nwro+3IAYm6pC2XntNcFpwADQfjepOOpcW7/OzDuwz7slbbCpaVBsMLrj
         DY+37fb/EeI3FtagCaV08xOYyff4TASIed3uScTXOFSgU3bK5NSmBe57QCKrX8ppkmsh
         gKMF1y1Fj94uxJxak/c80fWO5VQKBc8wARggQMLsN9JF5kcay9MZoWCkhag3F85LpSeH
         5SQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mfq8artsCmgPridHwXtCTWz4VD26jC/9nXCO2mqCNlk=;
        b=GY758wu654u2UkNHeZ2F4JUgber04MZEQ+pLcDUYTGeOE06mAnY9YTdUEeFyht6+UK
         pZGQ8Bc7d79g2YdX/SXEh5vhU5WDl7Zm8WKb1SAQL1LrcC5WV6RBDdST77HNsRf72FDn
         vYrhb/ajtK9NI4JbjSM3LNJwtB5LKQzn2m4wzBUsU/UvZHHNTTfWlP8JzdoVFvhl9CZx
         G723//mFiCIuH0/nJIilIHoUzKmjbyMNK+tQkacWL5lpzZu+O9Fr/dI2fYIBVz2SSmKF
         ZzzGP8AFuolQC6zY7OKUX7NKFIGMCL5WpBDp3+XGo5yRuox4SGUcGJOP5K0XwaQ6uJeA
         TDdQ==
X-Gm-Message-State: AOAM532ZPAW+N0O13e8Dd7Pg1hb+zIrGWAAlFfTiJ2lC82cnku9QawMJ
        6nR1ll8EjpR4YL6+AGB6JcOgbw==
X-Google-Smtp-Source: ABdhPJxc+5UTXQnFqw3XaC45qAyTen7ilR/T+JX+VH3dgAa3XYgTKx45jwzrzkJA5vvtLydcX0vKXg==
X-Received: by 2002:a2e:b98b:0:b0:24f:1b64:a7b7 with SMTP id p11-20020a2eb98b000000b0024f1b64a7b7mr6459964ljp.331.1652554909931;
        Sat, 14 May 2022 12:01:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([93.92.200.201])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b0047255d210f4sm787427lfg.35.2022.05.14.12.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 12:01:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 12/12] dt-bindings: arm: qcom: document sda660 SoC and ifc6560 board
Date:   Sat, 14 May 2022 22:01:38 +0300
Message-Id: <20220514190138.3179964-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
References: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
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

Add binding documentation for the Inforce IFC6560 board which uses
Snapdragon SDA660.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 129cdd246223..ac4ee0f874ea 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -41,6 +41,7 @@ description: |
         sa8155p
         sc7180
         sc7280
+        sda660
         sdm630
         sdm632
         sdm660
@@ -225,6 +226,11 @@ properties:
               - google,senor
           - const: qcom,sc7280
 
+      - items:
+          - enum:
+              - inforce,ifc6560
+          - const: qcom,sda660
+
       - items:
           - enum:
               - fairphone,fp3
-- 
2.35.1

