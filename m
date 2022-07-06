Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2833568DF6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 17:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234286AbiGFPtn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 11:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234673AbiGFPtN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 11:49:13 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF362A972
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 08:43:46 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id h23so27753924ejj.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 08:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ZiwW8PC/OyQgDbemNjA0vIiOSGE6+7Sanjl1wB06Yc=;
        b=G2xQ16Fpf5TNmTddSC3B778dZTMDYhxqo5eDBGM5tQzWJVI/411CC2UkiI6mZ7gTie
         HV+7P7ua4gdGKVv0vOZ63Zin6Z3F01xLezO2UDRxOycoRwpOvgXZpNyum7MietB3ue33
         pUS0/ltnvj1U7h4O5scfT9H6J6tAgbZE9juRsBQ9GlVap2O4JIpbERgMIgAllS3SBwhG
         D6ZogQNvIQpLCl1OQBz7T+iY4Njm0/gpy4adJYa7QaQHj13JpZ45RXfeuQEBHZSBxBV7
         tGEELjur+G5vuo1B1H5uP6ZeCE/F3ylyZWCkUzCl6PwV/ocNYHRuPwHj6JReKbK34Lqm
         eFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ZiwW8PC/OyQgDbemNjA0vIiOSGE6+7Sanjl1wB06Yc=;
        b=OToGDO87z0oQEbp0+oJGsq0gf4fymnc6UgwAqfL9wiNyFb04UqUQ8QnROCIHnM5j7f
         7BYVBNZ65pMkvs6K8GUtv2DVCteXmv76s/KQ3/HgNKjszg2QabqMD3xItSnj4a3ITR6U
         K+MkTwJx99lN07mIVPBu0V19qrF64dew22kcMTyjJO+apxV+l8sDDCa/F0KKwwxc2hJT
         RClBhtqrGihXeZTX3Cu8X1WezaSYSpgKUDoaKIVjLhaCosdxuYJ9AfnU/HpIXFXqHN23
         9lQA+oeX6sqRN4Aq0PenCZP47TtjtOkZ7/GJ89B+M1/S1RTVRhhfk6XyblOfg+wXIzJ/
         izfw==
X-Gm-Message-State: AJIora8427XmmFeHaWoH9wa9p+Ru1Dzt1JaW94QFj1l/BD/jRIYmGC19
        bCJv2AO/6sKKhvoQI1k//EILYw==
X-Google-Smtp-Source: AGRyM1sRjmcWer7WSx6Qk16ynViNQPkGix+jMhpsSCkSW9A3rlA+6/uJO6f4Tz8MTClaWrQQLOuqgw==
X-Received: by 2002:a17:907:7dac:b0:722:3352:ac05 with SMTP id oz44-20020a1709077dac00b007223352ac05mr39629252ejc.421.1657122226173;
        Wed, 06 Jul 2022 08:43:46 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id fi18-20020a056402551200b0043a43fcde13sm7711033edb.13.2022.07.06.08.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 08:43:45 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jonathan@marek.ca,
        robert.foss@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v8 3/5] dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
Date:   Wed,  6 Jul 2022 17:43:35 +0200
Message-Id: <20220706154337.2026269-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706154337.2026269-1-robert.foss@linaro.org>
References: <20220706154337.2026269-1-robert.foss@linaro.org>
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

From: Jonathan Marek <jonathan@marek.ca>

Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
bindings. Update the documentation with the new compatible.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---

Changes since v2
 - Add SoB - Bjorn

Changes since v3
 - Separate from qcom,dispcc-sm8x50
 - Remove clock-names
 - Make example sm8350 based
 - Changed author to me due to size of changes

Changes since v4
 - Add RB - Rob

Changes since v5
 - Reverted split from dispcc-sm8250
 - Re-added tags from v3


 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml       | 6 ++++--
 include/dt-bindings/clock/qcom,dispcc-sm8350.h              | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 31497677e8de..7a8d375e055e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -4,18 +4,19 @@
 $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250
+title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250/SM8350
 
 maintainers:
   - Jonathan Marek <jonathan@marek.ca>
 
 description: |
   Qualcomm display clock control module which supports the clocks, resets and
-  power domains on SM8150 and SM8250.
+  power domains on SM8150/SM8250/SM8350.
 
   See also:
     dt-bindings/clock/qcom,dispcc-sm8150.h
     dt-bindings/clock/qcom,dispcc-sm8250.h
+    dt-bindings/clock/qcom,dispcc-sm8350.h
 
 properties:
   compatible:
@@ -23,6 +24,7 @@ properties:
       - qcom,sc8180x-dispcc
       - qcom,sm8150-dispcc
       - qcom,sm8250-dispcc
+      - qcom,sm8350-dispcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8350.h b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
new file mode 120000
index 000000000000..0312b4544acb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
@@ -0,0 +1 @@
+qcom,dispcc-sm8250.h
\ No newline at end of file
-- 
2.34.1

