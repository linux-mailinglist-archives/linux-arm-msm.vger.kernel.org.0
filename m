Return-Path: <linux-arm-msm+bounces-27460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B2F9424F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 05:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98BC528582F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 03:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF4A38DDB;
	Wed, 31 Jul 2024 03:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDtIXjGa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9002938384;
	Wed, 31 Jul 2024 03:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722396022; cv=none; b=NOMOM/UpwGWWv/Izmcktn3WguoZfeOQ9CwkWOlnv+M7WMZWiCIvuNvFsV7dWwt5slN+uHqLmgrUxIUPrMO0skBLOzvyg0sAHoWYgRt3UD5sFBOxNkF9vTQhYJKgtjbRWED2R18xPpUjYK6ruNpPhAKtmT6CD92WP2zyUQSCUT6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722396022; c=relaxed/simple;
	bh=l4kFtoXdJr9ur3nAP4W4KhaI/C9Gx9Cp4LlaQ8DBOIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nH816B6Z2G9eNoZQi3jOEePXu78ihESc5lCpdr23hbDG9FJUgmxBsVLY8zH0+sGg9ifTlJ5ZfLdF/y4bJ3uMcgzfkhVFuSwXVQRaiHHpUUC5M3JL1OuYgwtQaMk+JexVEuVUirIfnEk2FGm091Z0dx/SF7TDV4sDpWA/9675YSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDtIXjGa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9764DC4AF13;
	Wed, 31 Jul 2024 03:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722396022;
	bh=l4kFtoXdJr9ur3nAP4W4KhaI/C9Gx9Cp4LlaQ8DBOIk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HDtIXjGauZrBNtoh2eDI6uBlikrSAXiKlK+onm/u1p13w9vK9VX3vVXLmWDhJ8mIe
	 tCOkIKKS1p19BEOE1Bgv1DxGf8SMG8JohZC46+epMikg+f84r4iPsR2n0rsn2tDzd8
	 d9Y8swyCDEEDetoWSYnpe6Av/9iUVpGcbQGU3fECVprhEjqlx2JWvvpZzwyoD8e+2V
	 ZSWSSThfZvdBfmUL7Keq62ERCJRHgcrn8mqhxTJXQRuVUd6KnvWE08WA+YL330Vvyo
	 V2vrKlAvhi1nHANF90acZjfFDoIg2GmxhH6my81LxlqnZXfp9raGD+6OipnywXIfVw
	 R9TCnViY+uijQ==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 30 Jul 2024 20:24:42 -0700
Subject: [PATCH v2 5/7] arm64: dts: qcom: sc8180x: Add USB MP controller
 and phys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240730-sc8180x-usb-mp-v2-5-a7dc4265b553@quicinc.com>
References: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
In-Reply-To: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5562;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=buN4fCsUGDHAd4BIC1FvVObS9IpS1N7IGsh07AQrffo=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmqa6HI7Sef6aegKTSMZsG480MiNTqSWdA2JIxX
 83sko0mFnCJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZqmuhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXvug//U3I2yx0cTAfeBoyeMqntc5boXjbV2kF85rWkuoi
 vbQb9cEy8S36DLzu8bjkfFbDfUK9oRJGK7/n8sPAVXwUcl3Of9LpwHIGb5nneL2S1x5kpkeZqjA
 iY2AsPV1WTSwAlqDeqTwE2a9Rk3+wlxKZiJoY6LXrMNuI3/4l8gzq+gQpMXMb3xzn+zTjdXqfpX
 H5OlJJ8TAT06dxhbdKsUngt0ZeTfTX2h/D8tNrqe3wNoNCTALjXUzsRJcnzWMI3TSvOCivqCGH0
 tytUfQfakEZqxbbk6Q8U98mQ3FzbASoFqFK23v1IV88oA/2Y5jcroY1cvMr6DkoQ/VoeTnxKdqH
 4kdQCWpbwDsMpOrnMNO/kucUOqheytJj8I7Az6Jig8Sj3N8iahUNBWfzpNg8wFAevbq70/WTYDU
 OwiDTrOw6LPMtrv20ZWXEJ6tVIMa7DXjHkiTrp8AKnS1pZW4ZKZ6q763J+orln2cOReMyPtPLi4
 tCrqX0IhtTTkhzblpFK3SmwwuS+lbs21iFDF0W2pDvyMorXUdAAMHd5bL6ZsovDwPPM1qAc+9wd
 ntZ1NBRvqig8gsYLdO9aFWD8Bedf8n3P8eWkcoNsJtidjSUwj5oOXhRGp4ZB6FRi+9VR2dTgqB7
 2XWmXayX7vdNLKw54lj+xyjbO7KEtgHUiVI4r7ZZ/PNI=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The SC8180X platform comes with a multiport DWC3 controller with two
ports, each connected to a pair of HighSpeed and QMP SuperSpeed PHYs.

Describe these blocks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 152 ++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 23ef8dc239f7..0e9429684dd9 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2507,6 +2507,34 @@ usb_sec_hsphy: phy@88e3000 {
 			status = "disabled";
 		};
 
+		usb_mp_hsphy0: phy@88e4000 {
+			compatible = "qcom,sc8180x-usb-hs-phy",
+				     "qcom,usb-snps-hs-7nm-phy";
+			reg = <0 0x088e4000 0 0x400>;
+			#phy-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_MP0_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_mp_hsphy1: phy@88e5000 {
+			compatible = "qcom,sc8180x-usb-hs-phy",
+				     "qcom,usb-snps-hs-7nm-phy";
+			reg = <0 0x088e5000 0 0x400>;
+			#phy-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_MP1_BCR>;
+
+			status = "disabled";
+		};
+
 		usb_prim_qmpphy: phy@88e8000 {
 			compatible = "qcom,sc8180x-qmp-usb3-dp-phy";
 			reg = <0 0x088e8000 0 0x3000>;
@@ -2555,6 +2583,60 @@ port@2 {
 			};
 		};
 
+		usb_mp_qmpphy0: phy@88eb000 {
+			compatible = "qcom,sc8180x-qmp-usb3-uni-phy";
+			reg = <0 0x088eb000 0 0x1000>;
+
+			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+
+			resets = <&gcc GCC_USB3_UNIPHY_MP0_BCR>,
+				 <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>;
+			reset-names = "phy", "phy_phy";
+
+			power-domains = <&gcc USB30_MP_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "usb2_phy0_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_mp_qmpphy1: phy@88ec000 {
+			compatible = "qcom,sc8180x-qmp-usb3-uni-phy";
+			reg = <0 0x088ec000 0 0x1000>;
+
+			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_PIPE_1_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+
+			resets = <&gcc GCC_USB3_UNIPHY_MP1_BCR>,
+				 <&gcc GCC_USB3UNIPHY_PHY_MP1_BCR>;
+			reset-names = "phy", "phy_phy";
+
+			power-domains = <&gcc USB30_MP_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "usb2_phy1_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		usb_sec_qmpphy: phy@88ee000 {
 			compatible = "qcom,sc8180x-qmp-usb3-dp-phy";
 			reg = <0 0x088ed000 0 0x3000>;
@@ -2622,6 +2704,76 @@ gem_noc: interconnect@9680000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		usb_mp: usb@a4f8800 {
+			compatible = "qcom,sc8180x-dwc3-mp", "qcom,dwc3";
+			reg = <0 0x0a4f8800 0 0x400>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			dma-ranges;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
+				 <&gcc GCC_USB30_MP_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>,
+				 <&gcc GCC_USB30_MP_SLEEP_CLK>,
+				 <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB3_SEC_CLKREF_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "xo";
+
+			interconnects = <&aggre1_noc MASTER_USB3_2 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3_2 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			assigned-clocks = <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_MP_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 59 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 46 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 71 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 68 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 7 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 30 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event_1", "pwr_event_2",
+					  "hs_phy_1",	 "hs_phy_2",
+					  "dp_hs_phy_1", "dm_hs_phy_1",
+					  "dp_hs_phy_2", "dm_hs_phy_2",
+					  "ss_phy_1",	 "ss_phy_2";
+
+			power-domains = <&gcc USB30_MP_GDSC>;
+
+			resets = <&gcc GCC_USB30_MP_BCR>;
+
+			status = "disabled";
+
+			usb_mp_dwc3: usb@a400000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x0a400000 0 0xcd00>;
+				interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0x60 0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				phys = <&usb_mp_hsphy0>,
+				       <&usb_mp_qmpphy0>,
+				       <&usb_mp_hsphy1>,
+				       <&usb_mp_qmpphy1>;
+				phy-names = "usb2-0",
+					    "usb3-0",
+					    "usb2-1",
+					    "usb3-1";
+				dr_mode = "host";
+			};
+		};
+
 		usb_prim: usb@a6f8800 {
 			compatible = "qcom,sc8180x-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;

-- 
2.45.2


