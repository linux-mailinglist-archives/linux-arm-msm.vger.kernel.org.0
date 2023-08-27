Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E78D7789D62
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 13:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjH0LvL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 07:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjH0Lum (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 07:50:42 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D63A191
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:38 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-500b66f8b27so468511e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137036; x=1693741836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ca1lCqRiuB+dn4eD6wRvmXrlOFXjwi+eXsVfOaPlfrY=;
        b=fDoOejcfzbwe19CsC5cIGnRJDuUADqOk57Xiavi4d1himlAQR99YeRzVY5y99S43Ln
         dvvS4bUmAgjviEi1KwLy0qXZOE5zvLB1OE6E1vwOPnNGa3+6WuN1GUvLmNGdYatnHiuk
         aLwRh9GBMRdt1bL4MDJrL82Ketk/yJ9TFJzlJU5qr3oHZwIa6tdvl+4jmf4dckRT+72V
         9ndmMJYJqBWyidMqRYesB8qsSzBiNY5h8i/E0AITIfbEJp0IddVCRzCS3j79BnbtPYKv
         b2lwOUBP6zxFlaBhOrnBEV2pHG/ZFTa3mwVHf2pXqJYfoWHOhVTrGuGksofwfegzLlJc
         ViVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137036; x=1693741836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ca1lCqRiuB+dn4eD6wRvmXrlOFXjwi+eXsVfOaPlfrY=;
        b=NIg2mnjACq3oyyI7E1ScvijwtAWnq2BC2vQEHTZQI712lvWF3wrj8W1mecO7tMknZ5
         PjkqKofjo9rm6cm+3heFQardWkwpjCyIs5XGL+vNLGIG9ZiWAbEWFvDEQ/q3mDlpBPBP
         dqwsLc9BpfcmI49Ggut41QY+6jaD/jCoHJbOnUFFLe6Vfb7QRPvY/FF+bLH9mqwG0/Fg
         v6f9qJ2/at20zTzoupY5fqRaL4ZcoOZv7wFVlHbSoSkqqFJQIw7zfDRvtEe+mYhpa3Hf
         WT64QSP58k07mZE2Cr6Sz0RvG8zhpNkyc7rhaCBB2zgRSp+Gq+A7HszlnWsQIQTZ9Vtn
         1Sdw==
X-Gm-Message-State: AOJu0YzXomCN+43zBqwsXoB5hDDfeV+T9BrpokiT7qD5sf0NuCBR5GL2
        8CABGe2SZBAnXDaK2Q4PxEHMSA==
X-Google-Smtp-Source: AGHT+IFyZIPVYeMBLN7zioe1bDA719mHlp3XKfCKpKDpxPRm40Vc0kjyn/3jpYKnN+AZ2sv3SNTXzQ==
X-Received: by 2002:a19:520b:0:b0:4f8:71cc:2b6e with SMTP id m11-20020a19520b000000b004f871cc2b6emr14940588lfb.33.1693137036363;
        Sun, 27 Aug 2023 04:50:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 02/23] dt-bindings: soc: qcom: qcom,saw2: define optional regulator node
Date:   Sun, 27 Aug 2023 14:50:12 +0300
Message-Id: <20230827115033.935089-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SAW2 device can optionally provide a voltage regulator supplying the
CPU core, cluster or L2 cache. Change the boolean 'regulator' property
into a proper regulator description. This breaks schema compatibility
for the sake of properly describing the regulator.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,saw2.yaml   | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
index 84b3f01d590c..a2d871ba8c45 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
@@ -47,7 +47,7 @@ properties:
     minItems: 1
 
   regulator:
-    type: boolean
+    $ref: /schemas/regulator/regulator.yaml#
     description: Indicates that this SPM device acts as a regulator device
       device for the core (CPU or Cache) the SPM is attached to.
 
@@ -96,4 +96,17 @@ examples:
         reg = <0x17912000 0x1000>;
     };
 
+  - |
+    /*
+     * Example 3: SAW2 with the bundled regulator definition.
+     */
+    power-manager@2089000 {
+        compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
+        reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
+
+        regulator {
+            regulator-min-microvolt = <850000>;
+            regulator-max-microvolt = <1300000>;
+        };
+    };
 ...
-- 
2.39.2

