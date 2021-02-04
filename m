Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9BD930F942
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 18:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238286AbhBDRMr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 12:12:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:57126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238342AbhBDRMG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 12:12:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F37764F70;
        Thu,  4 Feb 2021 17:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612458571;
        bh=rVkFqKiMv651OhiZuuMPdxsM2ChvMEUmeWBZTKPpj9E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=omlHFt+6EED+KLr0pZ0VvVb5LnhbPQzSvA9aSqO+hDrhnA2KCIVQ1XCCdXAbwJVij
         SZjD16oHgyMDaoq8LR33y6UAo4kiijU3pQhoYInwBw6z7SZWkVDsa20PRFU1Y7jxun
         uIg01cRVxLv71J47FM0EGVuXV6EGCK+kUo5Z+XaXIj0G8TKhFsGbtwXn2TIDavltBa
         3QQ3nbkSIQ8jr340wQTJiO8bN0QMBXUnNAHSUPnOSm+xiIcDf6sNgXl3elinaxI9zR
         Mm04FOSoxThSIA1BKdUgCYnVag0nBokIYS80rdVZSirrZoU+Z/nOTfX0BtkW/U6iWH
         VGbcIezau8RKw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: qcom: sm8350-mtp: enable UFS nodes
Date:   Thu,  4 Feb 2021 22:39:06 +0530
Message-Id: <20210204170907.63545-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210204170907.63545-1-vkoul@kernel.org>
References: <20210204170907.63545-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enabled the UFS node found in SM8350-MTP platform, also add the
regulators associated with UFS HC and UFS phy to these nodes.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
index a2baa1ad3752..2675afbbd75e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8350.dtsi"
 
@@ -249,6 +250,26 @@ &uart2 {
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	status = "okay";
+
+	reset-gpios = <&tlmm 203 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l7b_2p96>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l9b_1p2>;
+	vccq-max-microamp = <900000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l5b_0p88>;
+	vdda-max-microamp = <91600>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+	vdda-pll-max-microamp = <19000>;
+};
+
 &usb_1 {
 	status = "okay";
 };
-- 
2.26.2

