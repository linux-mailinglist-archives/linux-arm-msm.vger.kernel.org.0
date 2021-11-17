Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 463C7453DC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 02:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhKQBiX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 20:38:23 -0500
Received: from linux.microsoft.com ([13.77.154.182]:33862 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231916AbhKQBiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 20:38:22 -0500
Received: from thelio.attlocal.net (107-203-255-60.lightspeed.sntcca.sbcglobal.net [107.203.255.60])
        by linux.microsoft.com (Postfix) with ESMTPSA id 2AF7E20C634D;
        Tue, 16 Nov 2021 17:35:24 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2AF7E20C634D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1637112924;
        bh=DZkZygZsNbm4yhyqYJBFOjarSjiO0M4rZLNpUdPdo4Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mUnc1/QQ8N3OHsBl2w/F+BCTBzNOiAoxAltBDKfQxgdpG3zEvXHAc/PqCdRzTCN6G
         XbCovQmK9UuUT7G6YUktq+GB0SNddSfe+eCu6vPndBXBkPv/hJde2EO2EZCXrrraG0
         /I28h8XmIwSfYjzey1WnY+QI6XkDgTWkFfaCubVA=
From:   Katherine Perez <kaperez@linux.microsoft.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: qcom: sm8150: display support for Microsoft Surface Duo
Date:   Tue, 16 Nov 2021 17:35:16 -0800
Message-Id: <20211117013516.4111383-5-kaperez@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117013516.4111383-1-kaperez@linux.microsoft.com>
References: <20211117013516.4111383-1-kaperez@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for display to Microsoft Surface Duo.

Signed-off-by: Katherine Perez <kaperez@linux.microsoft.com>
---

Changes in v3:
	- Update dsi nodes to match mdss_dsi*

 .../dts/qcom/sm8150-microsoft-surface-duo.dts | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
index 5901c28e6696..6135a820037b 100644
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

+&mdss_dsi0 {
+	status = "okay";
+	vdda-supply = <&vdda_mipi_dsi0_1p2>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vdda_dsi_0_pll_0p9>;
+};
+
+&mdss_dsi1 {
+	status = "okay";
+	vdda-supply = <&vdda_mipi_dsi1_1p2>;
+};
+
+&mdss_dsi1_phy {
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

