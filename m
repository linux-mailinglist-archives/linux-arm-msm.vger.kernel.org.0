Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A9D79CCE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 12:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbjILKE7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Sep 2023 06:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233736AbjILKE4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Sep 2023 06:04:56 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C16710DB
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 03:04:51 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9a63b2793ecso689782266b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694513090; x=1695117890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBaJ5OsgfXs2kkcWusba2RO2Avkk4yo/xOTdTxq4iI8=;
        b=vWJJpDxy/4NEynNIdaJOXGXNcmrmjTFVV/dPa2Ebcv2jvU1bEBf9Zqk1g6P1csmUhP
         pEcDtPvOWBFZ9k/6wDf+1O2BWspCZuf5/zP+UPvCPeyyGPCiRMhTW19LBBXJt/ZtPfEA
         viFn1lBHEV/xnBBIsdBPHfK5w9ltyjkBJ0eAvE+IVKDijyauf3y0vptiVMlrbMrtIXoe
         NNLLySEYRsX9/o4ryEndUaIsBgD4bNOQNSKf6RfmQjzCkXxK46KR/jkQBU7O+FEOzFBQ
         wSyjk+6jqHhCOsRJFWniC98wyPuNWEuBjJRZRT5Sozz4IvB5ZNoiAaRQVyieuQEm2PRI
         +ZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694513090; x=1695117890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBaJ5OsgfXs2kkcWusba2RO2Avkk4yo/xOTdTxq4iI8=;
        b=uUNUaZoGU49eDsTgGbRrvzOER7jGg5Rf6d1MknvY6siO2/vmARsHT8AZin0R1JH02X
         1y9jZTr/q9qhCbWt+IIKrm1ZJhwZ8paqiDntvnXGLvoANMX0OCX9X2VljCgplC70G/hd
         vMhTZ3p9QYr1oQUiUgaH5ggiD2y0kSL3nlwn4MTLQoqK3sCU05el6ITtufNQ+KYlv0eZ
         e0JKKpxDvKQHslRuu8m2VultHv0j4J2UMke9fb3+akSii3YEu/kbVNA0KfPLqXLOjoB3
         7pj1/aCbObCgk4YqMoACT3A1+zF3oIN7jf4Ty8oj4XWT7owFtVYzC1n7LKbeftX3KNgj
         Jlzw==
X-Gm-Message-State: AOJu0YxedQ79N6iArloBQ2POkm5lW1oerDAK0mk9R7c1b0vqBbmr9WyY
        ptEWhhTBzKpBiDJZh28pTtZ3/Q==
X-Google-Smtp-Source: AGHT+IE4LAvEmNCCVoXvt3XAFXhM5Mpn2quo2m/5P3cfpKZcxGQvFaRprrP23r/6yaZ7ma3Exgo1Vg==
X-Received: by 2002:a17:907:77c1:b0:99c:75f7:19c1 with SMTP id kz1-20020a17090777c100b0099c75f719c1mr10281192ejc.39.1694513089988;
        Tue, 12 Sep 2023 03:04:49 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id s3-20020a170906060300b0099ce188be7fsm6592053ejb.3.2023.09.12.03.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 03:04:49 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 12 Sep 2023 12:04:43 +0200
Subject: [PATCH v4 01/10] dt-bindings: display/msm/gmu: Add Adreno 7[34]0
 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v4-1-8b3e402795c1@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694513085; l=2826;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HNK2SS799OXNh7iy5vESf+h2uwh6BGHa1r43G7UvIKE=;
 b=+aNhNRKwvuwrMdhWRTbxNVQkwFcWZURLyBD2mwRyP/wVP/eXlh+1jqsekzIPBXb7Jrz+oB2AW
 9yvuwejWMdsBoppcj4wodblH7P/o/r0eUQ6Pxz7OycwtF0+lEdiYMWk
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GMU on the A7xx series is pretty much the same as on the A6xx parts.
It's now "smarter", needs a bit less register writes and controls more
things (like inter-frame power collapse) mostly internally (instead of
us having to write to G[PM]U_[CG]X registers from APPS)

The only difference worth mentioning is the now-required DEMET clock,
which is strictly required for things like asserting reset lines, not
turning it on results in GMU not being fully functional (all OOB requests
would fail and HFI would hang after the first submitted OOB).

Describe the A730 and A740 GMU.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 40 +++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 5fc4106110ad..20ddb89a4500 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -21,7 +21,7 @@ properties:
   compatible:
     oneOf:
       - items:
-          - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-gmu-[67][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
       - const: qcom,adreno-gmu-wrapper
 
@@ -213,6 +213,44 @@ allOf:
             - const: axi
             - const: memnoc
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-gmu-730.1
+              - qcom,adreno-gmu-740.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+            - description: GPUSS DEMET clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: hub
+            - const: demet
+
   - if:
       properties:
         compatible:

-- 
2.42.0

