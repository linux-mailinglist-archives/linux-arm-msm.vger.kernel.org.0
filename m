Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEB951B5E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 04:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238705AbiEEC3H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 22:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239225AbiEEC3C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 22:29:02 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD5713E8B
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 19:25:23 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id s18-20020a056830149200b006063fef3e17so2102389otq.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 19:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZnOPF3kLhHT3pxdKoIqWPDrlgDNrphBIZSYl1LKV7/E=;
        b=h3XafBA9PBkuQAjrCrgRBCJG7dJ9r8Wyr1WFUR+DZ3eG1CLuz/vNVR/xV1Zw41mIcJ
         vyk3Is9Kar5imsw6/27d0pFe9d4f2wihmY2UxUMqPkbSQRXRdtSqIjJ6AJ614woTZebC
         EMplROjmHKR909eDzE7JZCuj6HIWe2jn790pVe5Z/WTmJU9ZEuNS0kgMawHgy6a3p/DJ
         UO0IhIuscS3nTExHPIxT9Yzaa7z01a6qSdrN2vqwc9eLiSmCkS8tQqdpEqF+0RRx3MaI
         B5wDocKlrBG/mAcrZKj448GFEL1CBvKbWc0RQyTnlEjfu+bhc944LDwKR15H8i2FncC+
         H8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZnOPF3kLhHT3pxdKoIqWPDrlgDNrphBIZSYl1LKV7/E=;
        b=19wiazEMftlaMevn97Pc6mIacJ8UxC78ygZkPQ6mLmfYUXcgrqSN9btsjiHO/kfQLq
         VEdUmPJ65kzLWqKVXY+Wg+oN+iJs7fo7ro+zt8l/Yk0mg8P6L4qAd6s97j9GvcDCLxKI
         UA2GdEH6U6e5C4NYACEYE62zDDoSaxyVXOe94GNb9om3vIIIJ8F5e7wsTBZLVoaUI5dG
         V+0p46YPdPAXCO45y4Bmam6tUGf8nE/i2HXI93JTodKoNbLXcLAHkHXKvlGiwXYbqKDy
         cU9ovgVm01l+5YH8zvdDoaTfkGKu2CIajSRoFikPCpToYEvT5yXTSzz1r5dgbSzyF5+l
         kVZg==
X-Gm-Message-State: AOAM533yFa1/PnMdD1skW13KHRjv//zO9BfsmVBNb/2Jov4XA4BwYvp9
        O2ijdkAT+RmKkeVdd8dNDW9p1A==
X-Google-Smtp-Source: ABdhPJxr7DPoEo0JhEqWplRnP7W48zurVXt3Hkf+tiR1UiNBjBXrClNBz+VgcsjNfFHCaFV+88976Q==
X-Received: by 2002:a05:6830:2648:b0:605:8d5c:3ca with SMTP id f8-20020a056830264800b006058d5c03camr8563258otu.331.1651717523150;
        Wed, 04 May 2022 19:25:23 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n8-20020a0568080a0800b00325cda1ff8csm238296oij.11.2022.05.04.19.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 19:25:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: qcom: Add LPG to pm8916, pm8994, pmi8994 and pmi8998
Date:   Wed,  4 May 2022 19:27:03 -0700
Message-Id: <20220505022706.1692554-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505022706.1692554-1-bjorn.andersson@linaro.org>
References: <20220505022706.1692554-1-bjorn.andersson@linaro.org>
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

Add PWM/LPG nodes to the PMICs currently supported by the binding.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8916.dtsi  |  8 ++++++++
 arch/arm64/boot/dts/qcom/pm8994.dtsi  | 10 ++++++++++
 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 11 ++++++++++-
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index d58902432812..99bf8387bfb6 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -125,6 +125,14 @@ pm8916_1: pmic@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8916_pwm: pwm {
+			compatible = "qcom,pm8916-pwm";
+
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
+
 		pm8916_vib: vibrator@c000 {
 			compatible = "qcom,pm8916-vib";
 			reg = <0xc000>;
diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
index 5ab46117d737..ab342397fcd8 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -135,6 +135,16 @@ pmic@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8994_lpg: lpg {
+			compatible = "qcom,pm8994-lpg";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
+
 		pm8994_spmi_regulators: regulators {
 			compatible = "qcom,pm8994-regulators";
 		};
diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index 6e7c252568e6..b1b50c99ada2 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -27,6 +27,16 @@ pmic@3 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmi8994_lpg: lpg {
+			compatible = "qcom,pmi8994-lpg";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
+
 		pmi8994_spmi_regulators: regulators {
 			compatible = "qcom,pmi8994-regulators";
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index 0fef5f113f05..7af106683f8d 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -42,6 +42,16 @@ lab: lab {
 			};
 		};
 
+		pmi8998_lpg: lpg {
+			compatible = "qcom,pmi8998-lpg";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
+
 		pmi8998_wled: leds@d800 {
 			compatible = "qcom,pmi8998-wled";
 			reg = <0xd800 0xd900>;
@@ -52,6 +62,5 @@ pmi8998_wled: leds@d800 {
 
 			status = "disabled";
 		};
-
 	};
 };
-- 
2.35.1

