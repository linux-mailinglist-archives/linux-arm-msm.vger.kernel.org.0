Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E3A6450E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 02:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiLGBWj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 20:22:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiLGBWh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 20:22:37 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7B6388E
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 17:22:35 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id a7so19184692ljq.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 17:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH5onZ6G5nHVXUuxsOV7O5x3nmGGqIdn9uYRWyyU+hw=;
        b=WNrT5KLXbERejtLzT8j1Ao2VR0MLAbAVxeNQkaTbSGugvL2IwxD/vmDEgvPMFCLfja
         ouWj1QHDyweIhAPDrwQJHF3Oh/IHD7nzpQG+dwqjr3C2Y85xa5Qf+tOcSlFIW5gadFaU
         GRmjSOJg2dtVnLCHM5YBrtoqLd1Hrak1Yi5lzLV+TJckpkda2ZmLRBJVr9SEVDHaXGKr
         kHoc4000Swrhb9mBMaBZKr/ODxv6Ysr1/hNhyUi9oQwSw2U/SdvgJur3PtXd+Get1uCG
         18tIsZiBbto+k3GXloCpiSrg4PZfF0gZ+43Cd3UazM0vjivGfQqfT4oeY8wbOvFRnlcW
         nx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vH5onZ6G5nHVXUuxsOV7O5x3nmGGqIdn9uYRWyyU+hw=;
        b=4nzqAEEYGN9sqivePiWBBduefo7Lw3BNYsNyDaFzcetCieSdMYY2cTMOxMG4N2hE1s
         KOk2btaBfmhrf3lH2lBwmXQFrc5KSp/nGoAcZglLM2VUhZaB3TGA8ksOz8vJO7wWR2bk
         SIAXO3cOS1slUiWRZ0Gz5bA1G/rrrJVHDQcM0gHkr5Ba3fcpN35A6BoYJEJew5S+yRn+
         A9MTyYOES1VJgWJpFnvwOjF9Q3T98s0ChmZpFdzdqFOwZdrWVkUqgCTXIIVwrG27b59n
         w6/iEJmkLzznHbzvqqCfbZiJ2TASmsg1TAqjbHmDGaSSmapEuPKd2ZuPMR6LLC11DOc5
         V40A==
X-Gm-Message-State: ANoB5pmCl/ySEN56g/JfWGRUP0PLL6dkseGx+rlB+/CB8JHMVKX+CPm4
        OC/rAkO1cWgjdwri3At1cvfx6A==
X-Google-Smtp-Source: AA0mqf6fi1hiXU+A0Yc+BiCcoTZA2YFsEyBBDgmcmynInrGxQJgqsmpk4jKnnLuIioTyOSNsMR/JkA==
X-Received: by 2002:a2e:a9a0:0:b0:278:f1a5:a365 with SMTP id x32-20020a2ea9a0000000b00278f1a5a365mr26649093ljq.29.1670376153857;
        Tue, 06 Dec 2022 17:22:33 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 17:22:33 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 02/11] dt-bindings: display/msm: *mdss.yaml: split required properties clauses
Date:   Wed,  7 Dec 2022 03:22:22 +0200
Message-Id: <20221207012231.112059-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
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

Require only properties declared in given schema, which makes the code a
bit more readable and easy to follow.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 1 -
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml     | 3 +++
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml     | 3 +++
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml      | 3 +++
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml      | 3 +++
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml      | 3 +++
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml      | 3 +++
 7 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index 27d7242657b2..59f17ac898aa 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -70,7 +70,6 @@ properties:
       - description: MDSS_CORE reset
 
 required:
-  - compatible
   - reg
   - reg-names
   - power-domains
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index cf52ff77a41a..fc6969c9c52e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -55,6 +55,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-10nm-8998
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index d6f043a4b08d..0c2f9755125e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -61,6 +61,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-14nm-2290
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 13e396d61a51..fb835a4d9114 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -67,6 +67,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-10nm
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index a3de1744ba11..a4e3ada2affc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -74,6 +74,9 @@ patternProperties:
           - qcom,sc7280-dsi-phy-7nm
           - qcom,sc7280-edp-phy
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index 31ca6f99fc22..2a0960bf3052 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -59,6 +59,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-10nm
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
index 0d3be5386b3f..d752fd022ac5 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
@@ -63,6 +63,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-7nm
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.1

