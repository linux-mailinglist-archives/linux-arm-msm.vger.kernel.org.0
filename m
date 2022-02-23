Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47AEA4C0AA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 04:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237422AbiBWDol (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 22:44:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbiBWDok (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 22:44:40 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C6BB606D8
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 19:44:13 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id w16-20020a056830281000b005ad480e8dd5so9543585otu.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 19:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1cHDW5RUUyNmE9gCTFJFCIDcotOQWpizv8XZqucavco=;
        b=PQuuKWbRymj1GpDSMBPB97c3vG3n94NvkjICYWR8/tEFtEs5VpHWMMswkSvLReHbvw
         PgASX/SAndR0laYmeziouM8hHgvSahCUL3IF0psMWLWGi8vd+DUvgmgv4kM+w6Q7lqrE
         Mj4fEnDoj+F6S5LdkUtsAPpfv2GVo+cD5lLq+3ZQ9UdxFIKRFLrexg2QXyI/JnEAsyW2
         NdDHj+94zFj26Fr2BWZdr7OdVpKuSLQUhhxHeOzUhDPkWLmXIzgWt1fQzLyu+meYG84g
         ayfUYwmfvQ0tp7JoxkFWq9SZzgrZAraPEOX4COL8CIwuDC8inIZ8J+YqySCGw1k98GpO
         CTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1cHDW5RUUyNmE9gCTFJFCIDcotOQWpizv8XZqucavco=;
        b=JSX0rzgumuXMEtkGlMqL1M7xPHVhB2qaHqT5kRtSGRrBBwGGHiPh87wWTwxmFU4chm
         U18xIiyIpJY7H5uwn8clDQMr+leNusOPzCT3EQEMM3F996c7+6zTf0ZcqNpqtSvrHRf7
         vBuwvPa5duAv42gHKLxMNkrNdJgGVIHmnwWehsh5XjFkez64RQTxHfsi9o/zTfOQ5nPp
         i/xF0xrDV11gEwnM38H78c6tUslb0E7/NKKyEddXxkuEfEv78QpRU45pEV8FVu8poAlA
         HR7l9VTMabpt9JcPgUYvQM95R+rCGczzNU+GUpCuSI5J1dIIlTle/9+tEQxfdpCl55vs
         dXXw==
X-Gm-Message-State: AOAM531jH3XwK0ZPuZxwN9nknceynuZIFtAm6+PlC/JzbsLgk7e0R8vu
        ImjqF2kjDLHQ0CrH17gurW71vhX/hRrcxw==
X-Google-Smtp-Source: ABdhPJzDnK/fNmE1i9MA/5k+F+RWareX1DjVjHvQ5QpI2TwBvJhwkKQygA+4v9c1RsYzzy1aw+MzlQ==
X-Received: by 2002:a9d:67d3:0:b0:5ad:147a:7ff9 with SMTP id c19-20020a9d67d3000000b005ad147a7ff9mr9333208otn.37.1645587852796;
        Tue, 22 Feb 2022 19:44:12 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id f38sm6124552otf.22.2022.02.22.19.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 19:44:12 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: qcom: Document sa8540p, sc8180x and sc8280xp
Date:   Tue, 22 Feb 2022 19:46:13 -0800
Message-Id: <20220223034613.3725242-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
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

Add compatibles for the sa8540p automotive, as well as sc8180x and
sc8280xp compute platforms. Also add compatibles for the ADP devboard,
the Lenovo Flex 5G, Microsoft Surface Pro X and the sc8280xp QRD.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/arm/qcom.yaml         | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index e8b1606bc849..1042f71300af 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -39,8 +39,11 @@ description: |
         msm8994
         msm8996
         sa8155p
+        sa8540p
         sc7180
         sc7280
+        sc8180x
+        sc8280xp
         sdm630
         sdm660
         sdm845
@@ -224,6 +227,18 @@ properties:
               - google,senor
           - const: qcom,sc7280
 
+      - items:
+          - enum:
+              - qcom,sc8180x-primus
+              - lenovo,flex-5g
+              - microsoft,surface-prox
+          - const: qcom,sc8180x
+
+      - items:
+          - enum:
+              - qcom,sc8280xp-qrd
+          - const: qcom,sc8280xp
+
       - items:
           - enum:
               - xiaomi,lavender
@@ -252,6 +267,11 @@ properties:
               - qcom,sa8155p-adp
           - const: qcom,sa8155p
 
+      - items:
+          - enum:
+              - qcom,sa8540p-adp
+          - const: qcom,sa8540p
+
       - items:
           - enum:
               - fairphone,fp4
-- 
2.33.1

