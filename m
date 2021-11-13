Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB22F44F0D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 03:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235634AbhKMCnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 21:43:09 -0500
Received: from linux.microsoft.com ([13.77.154.182]:54532 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235574AbhKMCnH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 21:43:07 -0500
Received: from thelio.attlocal.net (107-203-255-60.lightspeed.sntcca.sbcglobal.net [107.203.255.60])
        by linux.microsoft.com (Postfix) with ESMTPSA id 54ACA20C3638;
        Fri, 12 Nov 2021 18:40:15 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 54ACA20C3638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1636771215;
        bh=rbWTKRbxNhaiYskQa8luGLJM7RFUguOycyjgY4AjFJw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V3GzOPZU7RqSMIldBa+nokhp8Ow3EVzWgh90dTQetKT5k+/bZ1od7aDW72IPmG+RN
         lUlWcTuMm88nE0PqKcCloLQs40gVqqg8JhxGfIIT67GTXfULSHUsA+4NDwPcxjOA8k
         MEaKyMo+jhpr7c/dQRs1gB9xdB5QWTIX0i6CJwkM=
From:   Katherine Perez <kaperez@linux.microsoft.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 4/4] arm64: dts: qcom: sm8150: display support for Microsoft Surface Duo
Date:   Fri, 12 Nov 2021 18:39:55 -0800
Message-Id: <20211113023955.105989-5-kaperez@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211113023955.105989-1-kaperez@linux.microsoft.com>
References: <20211113023955.105989-1-kaperez@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for display to Microsoft Surface Duo.

Signed-off-by: Katherine Perez <kaperez@linux.microsoft.com>
---
 .../dts/qcom/sm8150-microsoft-surface-duo.dts | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
index 5901c28e6696..721f76b1b30c 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
@@ -270,6 +270,8 @@ vdda_hv_ebi1:
 		vdda_hv_ebi2:
 		vdda_hv_ebi3:
 		vdda_hv_refgen0:
+		vdda_mipi_dsi0_1p2:
+		vdda_mipi_dsi1_1p2:
 		vdda_qlink_hv_ck:
 		vreg_l3c_1p2: ldo3 {
 			regulator-min-microvolt = <1200000>;
@@ -359,6 +361,26 @@ vreg_l6f_2p85: ldo6 {
 	};
 };
 
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vdda_mipi_dsi0_1p2>;
+};
+
+&dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vdda_dsi_0_pll_0p9>;
+};
+
+&dsi1 {
+	status = "okay";
+	vdda-supply = <&vdda_mipi_dsi1_1p2>;
+};
+
+&dsi1_phy {
+	status = "okay";
+	vdds-supply = <&vdda_dsi_1_pll_0p9>;
+};
+
 &i2c1 {
 	status = "okay";
 	clock-frequency = <400000>;
@@ -430,6 +452,10 @@ &i2c19 {
 	/* MAX34417 @ 0x1e */
 };
 
+&mdss {
+	status = "okay";
+};
+
 &pon {
 	pwrkey {
 		status = "okay";
-- 
2.31.1

