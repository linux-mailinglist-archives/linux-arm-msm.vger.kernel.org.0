Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65FDD629811
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 13:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237426AbiKOMEH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 07:04:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238173AbiKOMDg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 07:03:36 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC08622526
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:03:02 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j16so24023548lfe.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaNhfP/nOLQ48+6TzTDF7R1fJQ8t4XkKM7Atq6L3Heg=;
        b=HhMszbCidv1BjEeyqH+iNPff0dj/tzcenSFpriNx7CLV7PYZcTWKIBiTzXwk/EFCsp
         EjH4nFNH23GhDS2LQpa3VgHid3bsULTh7Lg4AZsAVoniu2iAB4ZDu9+CrqsqZznzVlFE
         CRp9DQL9qlF57NJCWaOva57ewkY5k6csI80ofKF31GymsI4VipYOkKmDKjuxSDm2i4FR
         G3SpZ5cnGmwUzEcn9jaf103ccLQUdiZeW/w9yT/O3+ZC3ACpYIWi58VtTYFPDlM0tBX7
         KZ9XcDCMr4qMVYILY3MAuaL4Ml5s1bzPlIJhg0hOK6rZcWbZoCFVQ1vuakZtLCsbp5UE
         kM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zaNhfP/nOLQ48+6TzTDF7R1fJQ8t4XkKM7Atq6L3Heg=;
        b=mVoPV3bEWWNeZUzdYtNsT6A+1a371AfvNF902u/4dCI5q4X6hDeHwYKwcHYWIyVeq3
         Yl3ViVMxpi+futqEyJ47JHul1vud6aoMVj2/veLIuUw67Goz2ojz+M2XdN4q4pphtdYl
         OwwygqdJ//nx6kod79mC3+ydNO3Hw0qOcCyojTodfb3cEwJJ1Mfg2YLrOqzQPuU5tSBi
         pIdfI6MgzchLOQIyZKms5zczvBelBQ+984m6EriQmREAOnD/sNEtnu96vqswjHyNqkUP
         Ai5E2g5Pq3YuR6iPi7DBEQtcTsLsIXJGi926lsAgYkOBVGucp1+sGHy9wFLDAv/tnyyS
         X1rQ==
X-Gm-Message-State: ANoB5pmRCZ2+JdIWk81QwQ79KwvyDFCVgRx+4U4glnpd6zCp+kStKnqR
        4w5+tlMZzkNIDKbaM5p+wF4Txg==
X-Google-Smtp-Source: AA0mqf64kKT0ofbo54DaUnDY+YBs9l9fHXVwodgpsd+Yh1/Ebzr2T12keDq5/AyUp3Ez7jpQaMZxUQ==
X-Received: by 2002:ac2:4f15:0:b0:4ad:23ac:94ef with SMTP id k21-20020ac24f15000000b004ad23ac94efmr5961832lfr.510.1668513781099;
        Tue, 15 Nov 2022 04:03:01 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:03:00 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        quic_srivasam@quicinc.com, quic_plai@quicinc.com
Subject: [PATCH v2 11/11] ASoC: dt-bindings: qcom,q6apm: Add SM8450 bedais node
Date:   Tue, 15 Nov 2022 13:02:35 +0100
Message-Id: <20221115120235.167812-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
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

On SM8450 and SC8280XP, the Q6APM is a bit different:
1. It is used as a platform DAI link, so it needs #sound-dai-cells.
2. It has two DAI children, so add new "bedais" node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
---
 .../devicetree/bindings/sound/qcom,q6apm.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
index 7acb832aa557..cd434e8268ce 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
@@ -18,14 +18,24 @@ properties:
     enum:
       - qcom,q6apm
 
+  bedais:
+    type: object
+    $ref: /schemas/sound/qcom,q6apm-lpass-dais.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP audio ports
+
   dais:
     type: object
     $ref: /schemas/sound/qcom,q6apm-dai.yaml#
     unevaluatedProperties: false
     description: Qualcomm DSP audio ports
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
+  - bedais
   - dais
 
 unevaluatedProperties: false
@@ -41,11 +51,17 @@ examples:
         service@1 {
             reg = <GPR_APM_MODULE_IID>;
             compatible = "qcom,q6apm";
+            #sound-dai-cells = <0>;
             qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
 
             dais {
                 compatible = "qcom,q6apm-dais";
                 iommus = <&apps_smmu 0x1801 0x0>;
             };
+
+            bedais {
+                compatible = "qcom,q6apm-lpass-dais";
+                #sound-dai-cells = <1>;
+            };
         };
     };
-- 
2.34.1

