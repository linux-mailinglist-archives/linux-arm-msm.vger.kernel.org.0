Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4319A5E6C57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 21:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbiIVT5N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 15:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbiIVT5F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 15:57:05 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EC610CA4B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 12:57:03 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id g20so11067415ljg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 12:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zD648AnsuV0PNiCjTIvr+q3p3sIkDKW3NTFtNUlGeBg=;
        b=NLkJyVqJH5PHydsaDMfohBL/rDEj4hQP/eS5pxOdbwSeOHGaHr7GWHX327hfIuR17X
         Xs310I0ctd//b/q2bcspL3ZiAqJC/vFOjF6rhVSmk1Cx5Ggd/2BeSfX/bqlgMOWBiGox
         LwqLoO3pjLXVfkflnucbrznBcqvzrfEpIVHRCCfCp4Emv55sHI6rskhqLueBb7u0FoRP
         5Ayp644KhLuUvKy1v4Lvs1vNpLqX96VZqKmwwTnJvrxo0a0yeMyYwKLJs6z7ftKKy/Ze
         M+UNgRvIWMjAl0zR0cRpR/c27Prbi5kuINjVItbZHPVS7lNZW6oovfs6C3mK9pwmq/wL
         oyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zD648AnsuV0PNiCjTIvr+q3p3sIkDKW3NTFtNUlGeBg=;
        b=LhmwsepeAOIV+EFlp4IRTIEuFXXFcigsbsxjElkMuoMlZnTkRya6w7rvYLkTEWGEXb
         eFiM3Qo+vMISAzyC5uq1D+1vRNByKxPAr/iyaV+SeRB8gsSy+qD2vEQ/SxW+eCP4zJoI
         KYycdGtSj4c3QUtEG1HeRWk2Z6J9Ejam1SHtTvP8xFRryzZd7tzHUlePhjfpTiPJw9cR
         10dZMX//XX1N4dO2Fcbm97NJRYIxaVQmeJRQFOtROIMXYq4jLJmCGMJZzp3sciY2mwHc
         yAO0q/SDxdMAE4NR5z0d6Xwa/vxH50abs9YczLn+oZRPwCuB+n2so1mPSavWH4dO0cfE
         ui5A==
X-Gm-Message-State: ACrzQf153E6sZrFDpE4WZO4CS6bGBgIgM9xdWkDPmeZawqNxirI3+BNT
        8+4br4w+/H601PapMhB9H6Kcag==
X-Google-Smtp-Source: AMsMyM6i8uqoZ2S0G5yCRtm8dCuh5z0/aMF6W0SFCfZR4Ul6B7E+Q1XRywvLoAJoZtWPTvCVA8H4sg==
X-Received: by 2002:a05:651c:a0c:b0:26c:4f22:27ea with SMTP id k12-20020a05651c0a0c00b0026c4f2227eamr1682369ljq.281.1663876621506;
        Thu, 22 Sep 2022 12:57:01 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x15-20020a19e00f000000b00498fc3d4d15sm1079375lfg.190.2022.09.22.12.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 12:57:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 04/12] dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: fix matching pin config
Date:   Thu, 22 Sep 2022 21:56:43 +0200
Message-Id: <20220922195651.345369-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
References: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
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

The LPASS pin controller follows generic pin-controller bindings, so
just like TLMM, should have subnodes with '-state' and '-pins'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../qcom,sc8280xp-lpass-lpi-pinctrl.yaml      | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
index fb3ad6c0d80e..26e93e2c8c42 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
@@ -43,9 +43,17 @@ properties:
   gpio-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sc8280xp-lpass-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sc8280xp-lpass-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sc8280xp-lpass-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -130,4 +138,21 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         gpio-ranges = <&lpi_tlmm 0 0 18>;
+
+        dmic01-state {
+            dmic01-clk-pins {
+                pins = "gpio16";
+                function = "dmic1_clk";
+            };
+
+            dmic01-clk-sleep-pins {
+                pins = "gpio16";
+                function = "dmic1_clk";
+            };
+        };
+
+        tx-swr-data-sleep-state {
+            pins = "gpio0", "gpio1";
+            function = "swr_tx_data";
+        };
     };
-- 
2.34.1

