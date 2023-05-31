Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3897173C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 04:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbjEaCeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 22:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234020AbjEaCeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 22:34:23 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3105B121
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 19:34:22 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f4f89f71b8so3931762e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 19:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685500460; x=1688092460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiroO27hS4AZF+snBjK2iCZGd/3jX9bw1tCwVqyDokg=;
        b=XlbRAOlax2dK/r2MchCBetZikQwygH9eSzmWMxHfqbN6KumsfD1leZXZ7TDZWWj/BH
         vQGl+WteKDwhsSfo7eTXJO9TdrZqe7o4VpS6xqo+m8jdLsT+zhB2h+2ZBIe6yjesqRG1
         549FNnoprHmEUIMmhSWmsvH1glsKlHV44Ybpw5l3DDjnOUXs+EPeCLPibP9foWwWGp5B
         digZArNm1KZziV3Qi/vSfH5xZEhZizgCHruXk2LgBGxrOwVgH8mnYUI95R4SW5LaOuFz
         7ei5Ye+G54c0lXzneJABlNEdQi6PKRg6nFOrQL20cIrnvHXS+TMkeaTyhWWn+pmHt+z2
         aFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500460; x=1688092460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiroO27hS4AZF+snBjK2iCZGd/3jX9bw1tCwVqyDokg=;
        b=XLpVo5wwr1UOgHAMKwoNjiVnOw4R2NVG9y9Xmf1pPD5Eqhb5/WmMVGNwDwRXsPduOh
         h5N5hBGrzJIMN5ugncAGhZmU9SnBVJZKFCN9LXL8HJjF0aCOyWnjZ/1pneBVAaxQ+Rok
         CVvODApaDcZU+3jnUnhdnC6Vp73QyI9IxlAD5VYyzme7uLXJEKrGlOwZ4g78bqDn27wm
         yDO3BtD33zXRD/UarAgaflqIK8rgJXHjtjq1ClyissG7BIUXQq16WE5FeNEVLbTE+tWK
         EZnm9SxDpFYtS+N7g/LZHVY34yOwkhiES3pH1hfE5X347zArj3YVlFejwY32h29Jvnup
         0BVQ==
X-Gm-Message-State: AC+VfDy6fuGfqRM89Q4oiHjWp6esa5Im1K+wRNxurMixC3VIRk9Qy+aK
        ROXlqCfPaqPsxGMIr/mYpkI75g==
X-Google-Smtp-Source: ACHHUZ5792iM1xkv/Kc8I4WtZ/u5rKvtECN+8vbsEcyecYmb/5ll0OaJc/Phd981qbr0NIaOGczkXA==
X-Received: by 2002:ac2:5a48:0:b0:4ef:ff42:b13 with SMTP id r8-20020ac25a48000000b004efff420b13mr1630696lfn.65.1685500460592;
        Tue, 30 May 2023 19:34:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004f3787d8006sm524096lfd.128.2023.05.30.19.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 4/5] dt-bindings: phy: qcom,msm8996-qmp-usb3-phy: drop legacy bindings
Date:   Wed, 31 May 2023 05:34:14 +0300
Message-Id: <20230531023415.1209301-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531023415.1209301-1-dmitry.baryshkov@linaro.org>
References: <20230531023415.1209301-1-dmitry.baryshkov@linaro.org>
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

The qcom,msm8996-qmp-usb3-phy.yaml defines bindings for several PHYs
which predate USB -> USB+DP migration. Now as sm8150 has been migrated,
drop the legacy bindings completely. No device trees use them anymore.
Newer USB+DP bindings should use combo bindings from the beginning.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qcom,msm8996-qmp-usb3-phy.yaml        | 80 -------------------
 1 file changed, 80 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
index 4c96dab5b9e3..827109d37041 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
@@ -23,25 +23,16 @@ properties:
       - qcom,ipq8074-qmp-usb3-phy
       - qcom,msm8996-qmp-usb3-phy
       - qcom,msm8998-qmp-usb3-phy
-      - qcom,sc7180-qmp-usb3-phy
-      - qcom,sc8180x-qmp-usb3-phy
-      - qcom,sdm845-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sdx55-qmp-usb3-uni-phy
       - qcom,sdx65-qmp-usb3-uni-phy
-      - qcom,sm8150-qmp-usb3-phy
       - qcom,sm8150-qmp-usb3-uni-phy
-      - qcom,sm8250-qmp-usb3-phy
       - qcom,sm8250-qmp-usb3-uni-phy
-      - qcom,sm8350-qmp-usb3-phy
       - qcom,sm8350-qmp-usb3-uni-phy
-      - qcom,sm8450-qmp-usb3-phy
 
   reg:
-    minItems: 1
     items:
       - description: serdes
-      - description: DP_COM
 
   "#address-cells":
     enum: [ 1, 2 ]
@@ -126,28 +117,6 @@ required:
 additionalProperties: false
 
 allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sc7180-qmp-usb3-phy
-    then:
-      properties:
-        clocks:
-          maxItems: 4
-        clock-names:
-          items:
-            - const: aux
-            - const: cfg_ahb
-            - const: ref
-            - const: com_aux
-        resets:
-          maxItems: 1
-        reset-names:
-          items:
-            - const: phy
-
   - if:
       properties:
         compatible:
@@ -202,7 +171,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sm8150-qmp-usb3-phy
               - qcom,sm8150-qmp-usb3-uni-phy
               - qcom,sm8250-qmp-usb3-uni-phy
               - qcom,sm8350-qmp-usb3-uni-phy
@@ -223,51 +191,6 @@ allOf:
             - const: phy
             - const: common
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sm8250-qmp-usb3-phy
-              - qcom,sm8350-qmp-usb3-phy
-    then:
-      properties:
-        clocks:
-          maxItems: 3
-        clock-names:
-          items:
-            - const: aux
-            - const: ref_clk_src
-            - const: com_aux
-        resets:
-          maxItems: 2
-        reset-names:
-          items:
-            - const: phy
-            - const: common
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sdm845-qmp-usb3-phy
-              - qcom,sm8150-qmp-usb3-phy
-              - qcom,sm8350-qmp-usb3-phy
-              - qcom,sm8450-qmp-usb3-phy
-    then:
-      patternProperties:
-        "^phy@[0-9a-f]+$":
-          properties:
-            reg:
-              items:
-                - description: TX lane 1
-                - description: RX lane 1
-                - description: PCS
-                - description: TX lane 2
-                - description: RX lane 2
-                - description: PCS_MISC
-
   - if:
       properties:
         compatible:
@@ -293,12 +216,9 @@ allOf:
             enum:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
-              - qcom,sc7180-qmp-usb3-phy
-              - qcom,sc8180x-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy
               - qcom,sm8150-qmp-usb3-uni-phy
-              - qcom,sm8250-qmp-usb3-phy
     then:
       patternProperties:
         "^phy@[0-9a-f]+$":
-- 
2.39.2

