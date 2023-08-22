Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFEF783D83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 12:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234568AbjHVKEP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 06:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234574AbjHVKEM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 06:04:12 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866F11BD
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 03:04:08 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bf1876ef69so5086535ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 03:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20221208.gappssmtp.com; s=20221208; t=1692698648; x=1693303448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8X3waPAKHlpCl+pK9hisGLdUs7EAYfwszmOvPAOJD0=;
        b=Ws3fuHgfzcZ3fjKbsogzPFrwvX0b17H4kb0v8wLH1AB6zNaTUO2i39EfHqzuTksDTU
         a/qHDVT2SJSeiC/F0ishOZDMilZUDXTfy1OjoVpj2unff6wx5c8h1w/WKXcpZFbCLnMh
         48PMBGedOKKVi9FN5DBvmYtewITsd4+3a/goG9dWoSXkX4RsLujnQTqInkQNprRZEa6o
         9QGGOw3rwF8T0QUeEufK41PdYK0PEIFfEKnABTNWgRdrD3FD6j0K2NWeVjpcDotqcAib
         f4WGkfMX9H+BaMyc9HfnXprwQ063QmYflAzwJSReHuZLZ1K/CEX1cjcN2BFRI3n61Ici
         y4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692698648; x=1693303448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8X3waPAKHlpCl+pK9hisGLdUs7EAYfwszmOvPAOJD0=;
        b=Lm1QdlYP8PbSx8GJEBnP7qKmzVFIdj2H2xHHBO8auV0956T58w/Z07iaJ4WaeJF9Ph
         OvfUGoFCzlKuq+6GVEJO+AHwMoo1FCxCEHtoBWvt32fwYgz0o9Ljg5ByYlsNbxGZ1lk3
         rNqrxRJApGOmj+9J2n2CE+/GE/6ff+6dULp5xAf6WMaR9FCCCXmRyRiVDIdyVEnBGeoM
         eahjAGeQQUu+8E/vUdL6vG0qt+5DUx/B4Z4aZPJGjtLk4GUqnaY6VdPVAOCzvlwCdPs+
         60+Aqmn6jGmCn6Y1Tg2YjDXc2fc2vW575Uttq+2+isN9mgk+2mcAi27eJff2dsoqGUcO
         hjYg==
X-Gm-Message-State: AOJu0Yz4PybaLUFCbA+Fmx6oEjjD13iBQ284zLdjFl/4E1ZGxq2WyU2v
        CrxvYRO0qZAd/4zT4FEwqH2E0Q==
X-Google-Smtp-Source: AGHT+IECSEhMrAbLhwPqCav6Xq1z19ktz4h3qZs9o83/Suyo+AoFJjBYbkm8wRQ+rZzSyMgMlCOg0A==
X-Received: by 2002:a17:902:cecc:b0:1bb:d7d4:e2b with SMTP id d12-20020a170902cecc00b001bbd7d40e2bmr10323836plg.0.1692698647879;
        Tue, 22 Aug 2023 03:04:07 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id jc9-20020a17090325c900b001bbb22652a4sm8663176plb.226.2023.08.22.03.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 03:04:07 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: add sc7180-lazor board bindings
Date:   Tue, 22 Aug 2023 18:03:57 +0800
Message-Id: <20230822180054.v5.1.I26e017b00a341e7a5a2e94a83596923713408817@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822100359.124282-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20230822100359.124282-1-sheng-liang.pan@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce more sc7180-lazor sku and board version configuration,
add no-eSIM SKU 10 for Lazor, no-eSIM SKU 15 and 18 for Limozeen,
add new board version 10 for audio codec ALC5682i-VS.

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- correct corresponding of new board and new sku

Changes in v2:
- add new entry rev9 with Parade bridge chip
- correct newly create dts files
 .../devicetree/bindings/arm/qcom.yaml         | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 450f616774e0..3da04223b03f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -470,6 +470,11 @@ properties:
           - const: google,lazor-rev8
           - const: qcom,sc7180
 
+      - description: Acer Chromebook Spin 513 (rev9)
+        items:
+          - const: google,lazor-rev9
+          - const: qcom,sc7180
+
       - description: Acer Chromebook Spin 513 (newest rev)
         items:
           - const: google,lazor
@@ -491,6 +496,11 @@ properties:
           - const: google,lazor-rev8-sku2
           - const: qcom,sc7180
 
+      - description: Acer Chromebook Spin 513 with KB Backlight (rev9)
+        items:
+          - const: google,lazor-rev9-sku2
+          - const: qcom,sc7180
+
       - description: Acer Chromebook Spin 513 with KB Backlight (newest rev)
         items:
           - const: google,lazor-sku2
@@ -512,9 +522,16 @@ properties:
           - const: google,lazor-rev8-sku0
           - const: qcom,sc7180
 
+      - description: Acer Chromebook Spin 513 with LTE (rev9)
+        items:
+          - const: google,lazor-rev9-sku0
+          - const: google,lazor-rev9-sku10
+          - const: qcom,sc7180
+
       - description: Acer Chromebook Spin 513 with LTE (newest rev)
         items:
           - const: google,lazor-sku0
+          - const: google,lazor-sku10
           - const: qcom,sc7180
 
       - description: Acer Chromebook 511 (rev4 - rev8)
@@ -526,9 +543,16 @@ properties:
           - const: google,lazor-rev8-sku4
           - const: qcom,sc7180
 
+      - description: Acer Chromebook 511 (rev9)
+        items:
+          - const: google,lazor-rev9-sku4
+          - const: google,lazor-rev9-sku15
+          - const: qcom,sc7180
+
       - description: Acer Chromebook 511 (newest rev)
         items:
           - const: google,lazor-sku4
+          - const: google,lazor-sku15
           - const: qcom,sc7180
 
       - description: Acer Chromebook 511 without Touchscreen (rev4)
@@ -545,9 +569,16 @@ properties:
           - const: google,lazor-rev8-sku6
           - const: qcom,sc7180
 
+      - description: Acer Chromebook 511 without Touchscreen (rev9)
+        items:
+          - const: google,lazor-rev9-sku6
+          - const: google,lazor-rev9-sku18
+          - const: qcom,sc7180
+
       - description: Acer Chromebook 511 without Touchscreen (newest rev)
         items:
           - const: google,lazor-sku6
+          - const: google,lazor-sku18
           - const: qcom,sc7180
 
       - description: Google Mrbland with AUO panel (rev0)
-- 
2.34.1

