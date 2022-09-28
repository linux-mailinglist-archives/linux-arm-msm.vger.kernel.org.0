Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009805ED162
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 02:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbiI1AFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 20:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbiI1AFX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 20:05:23 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3155A8B5
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 17:05:22 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id d12-20020a05600c3acc00b003b4c12e47f3so130637wms.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 17:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=i+LNVuSF1Re6e4nCwgEmOGiRH6D3+8n1rNYLab04rvk=;
        b=ajHwWX4PVi+69gCWiQGQZae8hGActxH2nOnBZoPuqxxHOMwHo6rQxR1IpEa4Djshxe
         NvjjOUrNGfcSAi1UvfUbhuMDVUguHEEXpC7q9I5jO0l17o6CoLqvLKPfm3AdxD1a3I3p
         aCmqfoRp9m1Ojimm2J2TpH1ZhEqH1JNquDrhZIOzqq0anAF17s5jHZzx3CT0E4yikrvp
         ssMioiZpbOLRrsoTx84NEUmFcGlMjzNOOFY720frI8wlF3MAzh4VSxYVm9HG/GOzcHa7
         7KUhctQfaLkCoi7EimMuM8JOoP/Np2YzjeDYOuI0hgryhw3RycLl/TlW209JhbA33sb4
         T43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=i+LNVuSF1Re6e4nCwgEmOGiRH6D3+8n1rNYLab04rvk=;
        b=hw9mOivJ2+4/cKG6ahJXPmpu8RoeMFDP2rBLQRcfT52rUTq1HGE2oV0ouThI5s1r3V
         aiCdgYG03YZ6ykwnTJb8OW0qucKXCT7krSjT3Dj47m25r5s+Akh7juusl5HunrUAgp7T
         OKSqUS2La9NFTvJ2OVygQz0j6UGh2OgUOPva3q/B+NP2SHgOAFhh/O5AiPLXPCSW6Gaf
         16JZ6DWbiI7aG1QCrlSMV8/hkMZhrg2khzVFh0OfYJDrconSkb8DNKE1I8pBA60ExY4m
         r5rIlJLbUqMIdFbtcFkbfsaOhb9vmZs91hQ3YPi3mZCH5XcyvOPy56Xq0MVEhNg5IoWJ
         bGSw==
X-Gm-Message-State: ACrzQf2cV7/ygZ3GxVPCeNpugUq6nAGtUOOzeVYOU69Wac19uiaF9XNW
        I9RONylO9hWyY3Nqliq2ziM1mQ==
X-Google-Smtp-Source: AMsMyM6nQ6LFLYJuZdkZHKJnOlh3gE8Zpm3XmDDdte8jsy8GqLWOoKmQssWthyDXS1ELXZHwQ5oZ1w==
X-Received: by 2002:a05:600c:2d05:b0:3b4:7788:9944 with SMTP id x5-20020a05600c2d0500b003b477889944mr4647416wmf.57.1664323520964;
        Tue, 27 Sep 2022 17:05:20 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f10-20020adff58a000000b002285f73f11dsm3365997wro.81.2022.09.27.17.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 17:05:20 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/1] dt-bindings: mfd: qcom,spmi-pmic: Drop PWM reg dependency
Date:   Wed, 28 Sep 2022 01:05:17 +0100
Message-Id: <20220928000517.228382-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928000517.228382-1-bryan.odonoghue@linaro.org>
References: <20220928000517.228382-1-bryan.odonoghue@linaro.org>
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

The PWM node is not a separate device and is expected to be part of parent
SPMI PMIC node, thus it obtains the address space from the parent. One IO
address in "reg" is also not correct description because LPG block maps to
several regions.

Fixes: 3f5117be9584 ("dt-bindings: mfd: convert to yaml Qualcomm SPMI PMIC")
Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 65cbc6dee545e..2a5bafe0660a0 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -92,6 +92,10 @@ properties:
     type: object
     $ref: /schemas/regulator/regulator.yaml#
 
+  pwm:
+    type: object
+    $ref: /schemas/leds/leds-qcom-lpg.yaml#
+
 patternProperties:
   "^adc@[0-9a-f]+$":
     type: object
@@ -117,10 +121,6 @@ patternProperties:
     type: object
     $ref: /schemas/power/reset/qcom,pon.yaml#
 
-  "pwm@[0-9a-f]+$":
-    type: object
-    $ref: /schemas/leds/leds-qcom-lpg.yaml#
-
   "^rtc@[0-9a-f]+$":
     type: object
     $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#
-- 
2.37.3

