Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9068341BDA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 05:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244135AbhI2DpE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 23:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244065AbhI2Doz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 23:44:55 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D74EC06174E
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:15 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id lb1-20020a17090b4a4100b001993f863df2so805939pjb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RfV6xJ9gwtv5FhoxCV9JP4TEXzUvWIIkaP1YNfoiplg=;
        b=wpJ5HoKtpFs+iztnsiR4mWzmw36GU9OYGvPvr9QgRWowZZxip+C9HVnFoM6KSzl245
         g3mucI2eAKIVABi1s5H4Jy9SvOwiPON17exNpY9lR1XD5g0T5CzNlzLiS1gKB6eRoI/9
         idyIbU5JFX6W7d7hk/ptHc6T6XukfYDx9VEgjo62dQfXazQHHB1BP27tDpzLPLYqQ8mO
         S+yCJ7ba8o3PGqjnwbA2enXyAQd2SERgJLn2DDK2OobF549VA1AcBF7kiXnhF1fTunEd
         ZK+cA4vsxrdU2ml7G9N4lMeFb2IpQULMzqrF6EsIGFBz8MFZmTU3TfXC3k3KWJOQa7xQ
         kPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RfV6xJ9gwtv5FhoxCV9JP4TEXzUvWIIkaP1YNfoiplg=;
        b=lvpbgjfylYpSaLJtmgLO+1BSkuJq+qFPhEjs/r9DZnIuVC6J37cj8QHAyMzOkySAVT
         BPcckPFuxaVW8IWaX+/DnCeNaWQnDNC3/vSp4AravBd+lD09XG6U3UpxuyKHqHVG81RO
         ax10f8cUNvhL4s48d9W9MkIk5781jXqg/Xyo8aootDsFeO7VC7uSZxqyQO1LBxdHJYLh
         NGq2JnNL5zR4Xvd7zrKgX7Zpxabjm5ADvKtDIYc2RRxC7wlikIjzv6sEnszlOy+Kgoh5
         2fQsVCcwygvYXvkZi+2lqb2AMGoLWFuGrSSC41vUrgsqBgQbrSag3o88C/i/3hXwwKu7
         uaTw==
X-Gm-Message-State: AOAM5325d+l+5AiBj7os3p2LtljfToLjbAk4CrqdvhvESw7BLI1yY/yy
        DFjzGe+KIvk6tCR88rwEW50dmg==
X-Google-Smtp-Source: ABdhPJyOd3SyfWouTohLQdCuN0kH34e5bXbhbXtQZjP5y4vD5gwzgaMG2hFWYc+xKxlbKeUZ5pNDEw==
X-Received: by 2002:a17:90a:9912:: with SMTP id b18mr4016034pjp.46.1632886994693;
        Tue, 28 Sep 2021 20:43:14 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id b7sm533032pfb.20.2021.09.28.20.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 20:43:14 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 04/10] arm64: dts: qcom: Correct QMP PHY child node name
Date:   Wed, 29 Sep 2021 11:42:47 +0800
Message-Id: <20210929034253.24570-5-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210929034253.24570-1-shawn.guo@linaro.org>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Many child nodes of QMP PHY are named without following bindings schema
and causing dtbs_check warnings like below.

phy@1c06000: 'lane@1c06800' does not match any of the regexes: '^phy@[0-9a-f]+$'
        arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dt.yaml
        arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml
        arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dt.yaml
        arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml
        arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dt.yaml
        arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dt.yaml

Correct them to fix the warnings.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi |  2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi |  4 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 10 +++++-----
 arch/arm64/boot/dts/qcom/msm8998.dtsi |  6 +++---
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 10 +++++-----
 arch/arm64/boot/dts/qcom/sm8150.dtsi  |  6 +++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 10 +++++-----
 arch/arm64/boot/dts/qcom/sm8350.dtsi  |  2 +-
 8 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index d2fe58e0eb7a..4583e2953e78 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -401,7 +401,7 @@
 			reset-names = "phy",
 				      "common";
 
-			pcie_phy0: lane@84200 {
+			pcie_phy0: phy@84200 {
 				reg = <0x0 0x84200 0x0 0x16c>, /* Serdes Tx */
 				      <0x0 0x84400 0x0 0x200>, /* Serdes Rx */
 				      <0x0 0x84800 0x0 0x4f4>; /* PCS: Lane0, COM, PCIE */
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 0c7dbdc861c1..2e4e1399e276 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -105,7 +105,7 @@
 			reset-names = "phy","common";
 			status = "disabled";
 
-			usb1_ssphy: lane@58200 {
+			usb1_ssphy: phy@58200 {
 				reg = <0x00058200 0x130>,       /* Tx */
 				      <0x00058400 0x200>,     /* Rx */
 				      <0x00058800 0x1f8>,     /* PCS  */
@@ -148,7 +148,7 @@
 			reset-names = "phy","common";
 			status = "disabled";
 
-			usb0_ssphy: lane@78200 {
+			usb0_ssphy: phy@78200 {
 				reg = <0x00078200 0x130>,       /* Tx */
 				      <0x00078400 0x200>,     /* Rx */
 				      <0x00078800 0x1f8>,     /* PCS  */
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index a190ed891a62..a0bf3af47350 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -597,7 +597,7 @@
 			reset-names = "phy", "common", "cfg";
 			status = "disabled";
 
-			pciephy_0: lane@35000 {
+			pciephy_0: phy@35000 {
 				reg = <0x00035000 0x130>,
 				      <0x00035200 0x200>,
 				      <0x00035400 0x1dc>;
@@ -611,7 +611,7 @@
 				reset-names = "lane0";
 			};
 
-			pciephy_1: lane@36000 {
+			pciephy_1: phy@36000 {
 				reg = <0x00036000 0x130>,
 				      <0x00036200 0x200>,
 				      <0x00036400 0x1dc>;
@@ -624,7 +624,7 @@
 				reset-names = "lane1";
 			};
 
-			pciephy_2: lane@37000 {
+			pciephy_2: phy@37000 {
 				reg = <0x00037000 0x130>,
 				      <0x00037200 0x200>,
 				      <0x00037400 0x1dc>;
@@ -1746,7 +1746,7 @@
 			reset-names = "ufsphy";
 			status = "disabled";
 
-			ufsphy_lane: lanes@627400 {
+			ufsphy_lane: phy@627400 {
 				reg = <0x627400 0x12c>,
 				      <0x627600 0x200>,
 				      <0x627c00 0x1b4>;
@@ -2600,7 +2600,7 @@
 			reset-names = "phy", "common";
 			status = "disabled";
 
-			ssusb_phy_0: lane@7410200 {
+			ssusb_phy_0: phy@7410200 {
 				reg = <0x07410200 0x200>,
 				      <0x07410400 0x130>,
 				      <0x07410600 0x1a8>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f3bd1197d65e..512003e833b4 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -990,7 +990,7 @@
 			vdda-phy-supply = <&vreg_l1a_0p875>;
 			vdda-pll-supply = <&vreg_l2a_1p2>;
 
-			pciephy: lane@1c06800 {
+			pciephy: phy@1c06800 {
 				reg = <0x01c06200 0x128>, <0x01c06400 0x1fc>, <0x01c06800 0x20c>;
 				#phy-cells = <0>;
 
@@ -1062,7 +1062,7 @@
 			reset-names = "ufsphy";
 			resets = <&ufshc 0>;
 
-			ufsphy_lanes: lanes@1da7400 {
+			ufsphy_lanes: phy@1da7400 {
 				reg = <0x01da7400 0x128>,
 				      <0x01da7600 0x1fc>,
 				      <0x01da7c00 0x1dc>,
@@ -1994,7 +1994,7 @@
 				 <&gcc GCC_USB3PHY_PHY_BCR>;
 			reset-names = "phy", "common";
 
-			usb1_ssphy: lane@c010200 {
+			usb1_ssphy: phy@c010200 {
 				reg = <0xc010200 0x128>,
 				      <0xc010400 0x200>,
 				      <0xc010c00 0x20c>,
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 6d7172e6f4c3..ac775189a2e4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2059,7 +2059,7 @@
 
 			status = "disabled";
 
-			pcie0_lane: lanes@1c06200 {
+			pcie0_lane: phy@1c06200 {
 				reg = <0 0x01c06200 0 0x128>,
 				      <0 0x01c06400 0 0x1fc>,
 				      <0 0x01c06800 0 0x218>,
@@ -2169,7 +2169,7 @@
 
 			status = "disabled";
 
-			pcie1_lane: lanes@1c06200 {
+			pcie1_lane: phy@1c06200 {
 				reg = <0 0x01c0a800 0 0x800>,
 				      <0 0x01c0a800 0 0x800>,
 				      <0 0x01c0b800 0 0x400>;
@@ -2297,7 +2297,7 @@
 			reset-names = "ufsphy";
 			status = "disabled";
 
-			ufs_mem_phy_lanes: lanes@1d87400 {
+			ufs_mem_phy_lanes: phy@1d87400 {
 				reg = <0 0x01d87400 0 0x108>,
 				      <0 0x01d87600 0 0x1e0>,
 				      <0 0x01d87c00 0 0x1dc>,
@@ -3694,7 +3694,7 @@
 				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
 			reset-names = "phy", "common";
 
-			usb_1_ssphy: lanes@88e9200 {
+			usb_1_ssphy: phy@88e9200 {
 				reg = <0 0x088e9200 0 0x128>,
 				      <0 0x088e9400 0 0x200>,
 				      <0 0x088e9c00 0 0x218>,
@@ -3727,7 +3727,7 @@
 				 <&gcc GCC_USB3_PHY_SEC_BCR>;
 			reset-names = "phy", "common";
 
-			usb_2_ssphy: lane@88eb200 {
+			usb_2_ssphy: phy@88eb200 {
 				reg = <0 0x088eb200 0 0x128>,
 				      <0 0x088eb400 0 0x1fc>,
 				      <0 0x088eb800 0 0x218>,
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index ef0232c2cf45..4e943e4a93c4 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1692,7 +1692,7 @@
 			reset-names = "ufsphy";
 			status = "disabled";
 
-			ufs_mem_phy_lanes: lanes@1d87400 {
+			ufs_mem_phy_lanes: phy@1d87400 {
 				reg = <0 0x01d87400 0 0x108>,
 				      <0 0x01d87600 0 0x1e0>,
 				      <0 0x01d87c00 0 0x1dc>,
@@ -3010,7 +3010,7 @@
 				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
 			reset-names = "phy", "common";
 
-			usb_1_ssphy: lanes@88e9200 {
+			usb_1_ssphy: phy@88e9200 {
 				reg = <0 0x088e9200 0 0x200>,
 				      <0 0x088e9400 0 0x200>,
 				      <0 0x088e9c00 0 0x218>,
@@ -3043,7 +3043,7 @@
 				 <&gcc GCC_USB3_PHY_SEC_BCR>;
 			reset-names = "phy", "common";
 
-			usb_2_ssphy: lane@88eb200 {
+			usb_2_ssphy: phy@88eb200 {
 				reg = <0 0x088eb200 0 0x200>,
 				      <0 0x088eb400 0 0x200>,
 				      <0 0x088eb800 0 0x800>,
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 8c15d9fed08f..d5b76ec7b11f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1463,7 +1463,7 @@
 
 			status = "disabled";
 
-			pcie0_lane: lanes@1c06200 {
+			pcie0_lane: phy@1c06200 {
 				reg = <0 0x1c06200 0 0x170>, /* tx */
 				      <0 0x1c06400 0 0x200>, /* rx */
 				      <0 0x1c06800 0 0x1f0>, /* pcs */
@@ -1567,7 +1567,7 @@
 
 			status = "disabled";
 
-			pcie1_lane: lanes@1c0e200 {
+			pcie1_lane: phy@1c0e200 {
 				reg = <0 0x1c0e200 0 0x170>, /* tx0 */
 				      <0 0x1c0e400 0 0x200>, /* rx0 */
 				      <0 0x1c0ea00 0 0x1f0>, /* pcs */
@@ -1673,7 +1673,7 @@
 
 			status = "disabled";
 
-			pcie2_lane: lanes@1c16200 {
+			pcie2_lane: phy@1c16200 {
 				reg = <0 0x1c16200 0 0x170>, /* tx0 */
 				      <0 0x1c16400 0 0x200>, /* rx0 */
 				      <0 0x1c16a00 0 0x1f0>, /* pcs */
@@ -1750,7 +1750,7 @@
 			reset-names = "ufsphy";
 			status = "disabled";
 
-			ufs_mem_phy_lanes: lanes@1d87400 {
+			ufs_mem_phy_lanes: phy@1d87400 {
 				reg = <0 0x01d87400 0 0x108>,
 				      <0 0x01d87600 0 0x1e0>,
 				      <0 0x01d87c00 0 0x1dc>,
@@ -2330,7 +2330,7 @@
 				 <&gcc GCC_USB3_PHY_SEC_BCR>;
 			reset-names = "phy", "common";
 
-			usb_2_ssphy: lanes@88eb200 {
+			usb_2_ssphy: phy@88eb200 {
 				reg = <0 0x088eb200 0 0x200>,
 				      <0 0x088eb400 0 0x200>,
 				      <0 0x088eb800 0 0x800>;
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 9c44e62a9cd9..b19a3619e56b 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1080,7 +1080,7 @@
 			reset-names = "ufsphy";
 			status = "disabled";
 
-			ufs_mem_phy_lanes: lanes@1d87400 {
+			ufs_mem_phy_lanes: phy@1d87400 {
 				reg = <0 0x01d87400 0 0x108>,
 				      <0 0x01d87600 0 0x1e0>,
 				      <0 0x01d87c00 0 0x1dc>,
-- 
2.17.1

