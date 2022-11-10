Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6BD624355
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 14:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbiKJNfa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 08:35:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbiKJNf2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 08:35:28 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C529CDF94
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 05:35:27 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id d3so1182830ljl.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 05:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X3pEWPACClIQY3/paQHJjNw2VtpoudfeFxBlbc9fm0M=;
        b=hZtgk+XqtQAv+XWLfm84wxLLD2mPgWzuTTgp8Q0gOl8kIZxpQ9re6jZSm2PXIKKGqx
         c31ha8v+rxkThYcBDq5FWVw4hy6UJyI3akUrMqkCTR2vsXYsbRF8RNm5VJneNYRuicyl
         VsH2HgHOPW6W2Wc58pc70r82T9XnpuHae4jendFqDSRr8eKqniKHDJa21hi1rt3+R0+D
         0G+AGf5nVyUzXegkHB9zkPSzgunEFp7vQd3e+4xTIJgxSbRq8AgvHoldrA4gtZPbNCqe
         56XD4jn2HTi4jP9H1TX+bfVYbY9YtNcf4TgJiVhz3viswLTMR+vcaaFLlR62CclV1Y13
         xhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3pEWPACClIQY3/paQHJjNw2VtpoudfeFxBlbc9fm0M=;
        b=Rm/vHCXWKHYUi0mxhHzDocZSWEHVpQourtCy7vV7vVfA4Nb+eHNHjQwApumKJL8llR
         pVTF1fOpdwu8WQQhruN6hqVazI7awR59Bqgca4axweNhxcYhmXm4WlVMCesDSQL1keii
         cuj2tU5qjIBJ0cZFM4Q0wHnyBAvtQWPJrT7lGlcbblX0CWPH6/CbewqbqkyjCk22GLNx
         QqHbQ3K0039ClY6IMSQsfzvKURxCktx1r7p51EZ7qA3Pc186AW9WdU3vZ1P14hE0mVUY
         vW7cczb+hbAyPFOYy4giKvdi9oINgYcaP3sMg0u+yaGGn4xrL3xByvRKF6Eig9/RAQhh
         bnmg==
X-Gm-Message-State: ACrzQf2e/9zxBhUtG4dM+QIgAnJt1KtOQkJ2zlduWXNa0wb9oo4qmAg6
        quuF4dDqM6RIaiXmb0nVlcyVlw==
X-Google-Smtp-Source: AMsMyM7ZsAaCoMRKyH64gFWu9/lw3JKr1YbEwgIWT7QSSmLf+YECbGSbvB+NikQpWYTycsz3LoJzmA==
X-Received: by 2002:a2e:a0d0:0:b0:261:d86f:3cde with SMTP id f16-20020a2ea0d0000000b00261d86f3cdemr9308321ljm.86.1668087326182;
        Thu, 10 Nov 2022 05:35:26 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id q14-20020a0565123a8e00b004ad5f5c2b28sm2752576lfu.119.2022.11.10.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 05:35:25 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: qcom,wsa883x: Use correct SD_N polarity
Date:   Thu, 10 Nov 2022 14:35:11 +0100
Message-Id: <20221110133512.478831-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use correct polarity in example and powerdown-gpios description.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch.
---
 Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
index 6113f65f2990..99f9c10bbc83 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -23,7 +23,7 @@ properties:
     maxItems: 1
 
   powerdown-gpios:
-    description: GPIO spec for Powerdown/Shutdown line to use
+    description: GPIO spec for Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
   vdd-supply:
@@ -47,6 +47,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+
     soundwire-controller@3250000 {
         #address-cells = <2>;
         #size-cells = <0>;
@@ -55,7 +57,7 @@ examples:
         speaker@0,1 {
             compatible = "sdw10217020200";
             reg = <0 1>;
-            powerdown-gpios = <&tlmm 1 0>;
+            powerdown-gpios = <&tlmm 1 GPIO_ACTIVE_LOW>;
             vdd-supply = <&vreg_s10b_1p8>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
@@ -64,7 +66,7 @@ examples:
         speaker@0,2 {
             compatible = "sdw10217020200";
             reg = <0 2>;
-            powerdown-gpios = <&tlmm 89 0>;
+            powerdown-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
             vdd-supply = <&vreg_s10b_1p8>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
-- 
2.34.1

