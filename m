Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04E1F198BDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 07:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgCaFoT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 01:44:19 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42508 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgCaFoS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 01:44:18 -0400
Received: by mail-pl1-f196.google.com with SMTP id e1so7694668plt.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 22:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N4IUn+zEFF1zRvN63cSTLc53ybOJPdE+M6SeOuQVJFY=;
        b=cp2ttPFfl77zeAImHigfmcnGAELpJoIKqKGcWmF0fpIrK5cg5G6y+KTu6OtQzN8hdj
         3B4Vnts/pgwBE4lZo6aC4qOJZJfZjQ7h7Z+Oqh8NSFBxFJd3oFaGq3IiEaR6F4IaqWrs
         5Uo93uWeuXk80DcZlRQiIAhr+14pZ8gvxXJmL9Ht9xbcIXaXf7EcNy5j/8/+TNs9GlTf
         jcz0un0bJ+00UeBlSGv+NIYBaNAN2h7UDRRxok7n51NfQBySDVCLcF1fPE0z8ZQg4Xsq
         +haIRqH8Xvvs3nt/JwaitQ3HUENVY8+buEOzOIv31vHUZPi7o7m8KRtcpK22AX/o7lJ+
         11tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N4IUn+zEFF1zRvN63cSTLc53ybOJPdE+M6SeOuQVJFY=;
        b=LA7ZCUAMVnodM3HP7XLLK6SzJ9RPiXQ2kv3eSUwQ3yzmEmhj6hbkgEnD9zzn9j9VcP
         9nYDXsMv1Sj1kidE+ckfjBl0/AQWweA3ym1KXbeBmeRgNdBNugFVLBoqA7p4eYxADsJe
         LSKTzc7079+WjEuJ2tP1bCzKUwY2/wkPNhV5eUtzV7m2sbY6WoBy8HaOx97q+7E3yDUj
         1p8ztqLXLeInXAVvW6bxpGUqOtnOzpKSyAF4B8B4e+UZ4MGtkUllw8tstzGSyZyHarkh
         78flobvliOxlf15ZjaVCvtsLW+ekjsBxor7AARWMNClmBA+00Tc6yYDsBDjCpae31yvd
         emYg==
X-Gm-Message-State: AGi0PuZjI2YrYWhAtQbNV43K/Pa5UnQfDQ68veBE9s9wOSqyn4Bv3NNo
        D1JtR5K8m5RA9Ud7u3fECWC6Ew==
X-Google-Smtp-Source: APiQypIPs/YGZ7X+wTzInoLrTlRem2xO9is6PoolBoTlMmuFE+R66oCvyuHlgFpFX2enoeAG5+xhNg==
X-Received: by 2002:a17:90a:2710:: with SMTP id o16mr2021872pje.110.1585633457334;
        Mon, 30 Mar 2020 22:44:17 -0700 (PDT)
Received: from localhost ([45.127.44.10])
        by smtp.gmail.com with ESMTPSA id z12sm12026239pfj.144.2020.03.30.22.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 22:44:16 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, sibis@codeaurora.org,
        swboyd@chromium.org, dianders@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: sc7180: Fix cpu compatible
Date:   Tue, 31 Mar 2020 11:14:07 +0530
Message-Id: <baa90ee4bfe7f91c391252fa9049cea673fd7327.1585633235.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <18123f08bf1e60f6f7356c53f355884883b0897f.1585633235.git.amit.kucheria@linaro.org>
References: <18123f08bf1e60f6f7356c53f355884883b0897f.1585633235.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

"arm,armv8" compatible should only be used for software models. Replace
it with the real cpu type.

Fixes: 90db71e480708 ("arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc")
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>
---
Changes since v1:
- Added fixes tag
- Added acks

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 8011c5fe2a31a..a01dfefd90bea 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -83,7 +83,7 @@
 
 		CPU0: cpu@0 {
 			device_type = "cpu";
-			compatible = "arm,armv8";
+			compatible = "qcom,kryo468";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
@@ -100,7 +100,7 @@
 
 		CPU1: cpu@100 {
 			device_type = "cpu";
-			compatible = "arm,armv8";
+			compatible = "qcom,kryo468";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			next-level-cache = <&L2_100>;
@@ -114,7 +114,7 @@
 
 		CPU2: cpu@200 {
 			device_type = "cpu";
-			compatible = "arm,armv8";
+			compatible = "qcom,kryo468";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
 			next-level-cache = <&L2_200>;
@@ -128,7 +128,7 @@
 
 		CPU3: cpu@300 {
 			device_type = "cpu";
-			compatible = "arm,armv8";
+			compatible = "qcom,kryo468";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
 			next-level-cache = <&L2_300>;
@@ -142,7 +142,7 @@
 
 		CPU4: cpu@400 {
 			device_type = "cpu";
-			compatible = "arm,armv8";
+			compatible = "qcom,kryo468";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
 			next-level-cache = <&L2_400>;
@@ -156,7 +156,7 @@
 
 		CPU5: cpu@500 {
 			device_type = "cpu";
-			compatible = "arm,armv8";
+			compatible = "qcom,kryo468";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
 			next-level-cache = <&L2_500>;
@@ -170,7 +170,7 @@
 
 		CPU6: cpu@600 {
 			device_type = "cpu";
-			compatible = "arm,armv8";
+			compatible = "qcom,kryo468";
 			reg = <0x0 0x600>;
 			enable-method = "psci";
 			next-level-cache = <&L2_600>;
@@ -184,7 +184,7 @@
 
 		CPU7: cpu@700 {
 			device_type = "cpu";
-			compatible = "arm,armv8";
+			compatible = "qcom,kryo468";
 			reg = <0x0 0x700>;
 			enable-method = "psci";
 			next-level-cache = <&L2_700>;
-- 
2.20.1

