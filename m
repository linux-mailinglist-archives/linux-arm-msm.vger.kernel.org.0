Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE5BF67E0CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 10:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbjA0Jx2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 04:53:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbjA0Jx0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 04:53:26 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA873EC59
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 01:53:24 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so5028355wmb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 01:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OGUhnK/cIg+ekKmyen5G5CF7U2Ieu3W2D35IpEoPTMY=;
        b=VKHMCHOZYo4uArEjHAA+MQ2Q5Wq7njH/E/bx8ADtL0Mm9SQYPhO3dyiJZr+Q0GlySu
         d0JQygO5AFrhAGLaXYQLX8lucI2CAm2VwfM6sKMEqt4ubt6AprXjc0zNmAhvC4oqYA3D
         5TNMoxdbK3pgJrUro4s29B0R/QDMIfuC4TdZbMY848D6rzVqK7RsBe8/waAarheG56Lp
         8CX5PxYaayIHXq3OOixh1E2JF9z5i7CsSx+4IrT95BDMzTbGhZBQetogxeuvgTWaO611
         RfM9LYWuqxp/3y9Kf9J6+88px3s+uDRp6LszcWN/1zjO6oTbv9Jn2csHHrAHtwLtAW11
         rDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGUhnK/cIg+ekKmyen5G5CF7U2Ieu3W2D35IpEoPTMY=;
        b=4aQg6KbObbv9C80FvkP9wxp8COSeqTvrFGm2AZEu/qj0YQTS/RUDl4ZZ4KVrDKTSzp
         8u8Lk9L/goRIAcDJx49SHTwmafJvQUIJlJELFKfFUoVOA4CKfVufmGZa7ajSQA8W3PQG
         cU5czXKNtGUcmNq5h9zAzrzd/H6fScfu2q3ceJqJmnGX11t9z69MYM0g6SgwmYtG3+Gt
         BMn0KY2cf6QpjCKrootsUmsHhHoGqfX3ykV35TvUsDpsXXoFiUBAmU1s67fcYTvh0N8Z
         bPDtwaQKfztiMkrVCuCFwttpNCf18+wY/JiklVyG3fkLc23f2fIxtLEtswfneF2blQTD
         N4kg==
X-Gm-Message-State: AFqh2kode+DMhD74VKAUMugVQQYAoNAPQwj3+9k4NCM0Fz5geDqu1HQq
        SIWCAxjznNWYwA8WX5ccK96CFQ==
X-Google-Smtp-Source: AMrXdXuRIR7jpQo5yzc3jm3fvCPYayLF9WLJeVOMJtgy2I2ffB/qPZretd2vGMGhhU5SxMCD6xaSmQ==
X-Received: by 2002:a05:600c:601c:b0:3d9:ee01:60a4 with SMTP id az28-20020a05600c601c00b003d9ee0160a4mr39903046wmb.1.1674813203316;
        Fri, 27 Jan 2023 01:53:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c1d0400b003db2e3f2c7csm15703315wms.0.2023.01.27.01.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 01:53:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: qcom: use "okay" for status
Date:   Fri, 27 Jan 2023 10:53:19 +0100
Message-Id: <20230127095319.64560-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

"okay" over "ok" is preferred:

  serial@f991f000: status:0: 'ok' is not one of ['okay', 'disabled', 'reserved']

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts | 2 +-
 arch/arm/boot/dts/qcom-sdx55-t55.dts              | 6 +++---
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts  | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts b/arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts
index 6a082ad4418a..288cacd5d1fa 100644
--- a/arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts
+++ b/arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts
@@ -20,5 +20,5 @@ chosen {
 };
 
 &blsp1_uart3 {
-	status = "ok";
+	status = "okay";
 };
diff --git a/arch/arm/boot/dts/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom-sdx55-t55.dts
index 61ac5f54cd57..ccf2b8b42b16 100644
--- a/arch/arm/boot/dts/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-t55.dts
@@ -233,7 +233,7 @@ ldo16 {
 };
 
 &blsp1_uart3 {
-	status = "ok";
+	status = "okay";
 };
 
 &ipa {
@@ -243,11 +243,11 @@ &ipa {
 };
 
 &qpic_bam {
-	status = "ok";
+	status = "okay";
 };
 
 &qpic_nand {
-	status = "ok";
+	status = "okay";
 
 	nand@0 {
 		reg = <0>;
diff --git a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
index c9c1f7da1261..db7b3d5b0bd0 100644
--- a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
@@ -233,7 +233,7 @@ ldo16 {
 };
 
 &blsp1_uart3 {
-	status = "ok";
+	status = "okay";
 };
 
 &ipa {
@@ -258,11 +258,11 @@ &pcie_ep {
 };
 
 &qpic_bam {
-	status = "ok";
+	status = "okay";
 };
 
 &qpic_nand {
-	status = "ok";
+	status = "okay";
 
 	nand@0 {
 		reg = <0>;
-- 
2.34.1

