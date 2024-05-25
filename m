Return-Path: <linux-arm-msm+bounces-20463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A27348CF0D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 057F6B21C88
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 18:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B728A12DD85;
	Sat, 25 May 2024 17:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wke20qqM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875D712C819;
	Sat, 25 May 2024 17:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659958; cv=none; b=FQChkd5ZdJ1bvh1Gz43N+nKh5iHiJll37BVH30gqdgbn8vejDGevSNg38Rqfwm8NjFLhFQTFeEwufWf0cJsXb/A9Wxvtb/KomitWhpeJ5krBUZjnfrpuftAtLNdIzTSdcMKXgPcChpO3CaDq0ILr2v8dQPDPfQO+ZG7Q9e7Hs58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659958; c=relaxed/simple;
	bh=k2Zrv/KzpO8todlcSye5iZdki24cp3kSkjj42zD5Afw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWdDoPcwbLV6Ldi2FnNQ1sMtVA6ungPMJZGXznoHDaPuznsteHogN4Jj1I7u6oA/xLU2E/bLHRyEd+QYPhvMh9bnPMeNrY/YMdlMIzMESNRyA4F5a3dSLzm9VCM8CVZEgIu1Eo5zDnL7PHZASB64PYpUxYr7cE0FH3L0QpF6AsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wke20qqM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E51BC4AF12;
	Sat, 25 May 2024 17:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659958;
	bh=k2Zrv/KzpO8todlcSye5iZdki24cp3kSkjj42zD5Afw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wke20qqMekGOA2zzhzgisOSD+FWiYq9uR/7meyG0Ywc9KdVHp7wGNDQr0mAulBX53
	 lE2tpWox2g247DLH8Vr5cbVLDgSA7Qag+R5iAixar66emxL7kdlch8N/23mI8HLIJS
	 Nx0jeLoMg06p69omqiJroFAdzvhkHY1/WeM2j+jk2XoKH2M2obaErPUq1NmQNUTVaF
	 gKO9GvHsCswT/PpBPrAEKTd1Wk/1K+8jzqVbRNtpSwvKtBskV9G1CI9bQ4hrhTlG39
	 rcswIY1ITHE+xzaYFGEzLWM8nVAgpKTa/vHG3OO3KNXFdMtwXjPmssD6D4hCX6ANG6
	 r/CSPOkOeLeHg==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 11:04:00 -0700
Subject: [PATCH 07/10] arm64: dts: qcom: sc8180x: Align USB nodes with
 binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-usb-mp-v1-7-60a904392438@quicinc.com>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
In-Reply-To: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2316;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=YF0b2S8RermZ7DOy6SglxA1mcPt1MWrQ6lnKCRwbj0A=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUigMgQMBXUlGaner4t231riNoisxNP5xQ/tcw
 wgnDp6XSTKJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIoDBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXNiQ/+Ndkh5jz0DWSWYmKm3qdD5coLzti8YsUlSD1JfS8
 SWjs8oZFArhy64bRns30/EdOKAhimPnB4/SiRHM6GdxdZDbAje3eJknqIE/UFhBQmQlo/zrZ2xw
 CWIzr4ij4tIvPUx+GZ0rjIPU0E7SEgDq2XeDUXV954Rpu7HhuQWNmLdeN3Xc8DXW1Z0i5QRo7Qn
 v+08XnBw/RSKf1DVkGtz+oatEPPHBPZmNOLHbMaq9V0AoXmXcT2/KgQ+WElZK0u7AZbymjkj9FM
 O14Bx5gRma697iKioMwRQv894Wbo9ylQD8wnolrpQ5U3A+4UkvmvstRu63x994zrqHh5gOQtz1q
 WJzBNqURDLFxiAmKH8FjYbeh73z3L4+8OzOED8Lqa6OWClexc1bKC72zTkN2W9TdtUb+s2EBhU/
 UN/B0xx1TqheMLpmCqMaLqD7yUkA4vCs624AfgahN3ZdJNlmqrqciPAcTT3DVTWY/0Mfp854Gdf
 CjuSzwJ06ySPlLfCDGaDbHvFS+3w0b7Voqg2MOeyJxbThwnyMmmFM5sMFuYqxxx/yCljcjy5kBW
 5KGA+NYPxZSvqOZxJt/OwKjM60514j9N4pkvll/AiWXVWek1LUFYd2bP6G7FFd6dsfutpLLIh9S
 AxtJFw+fgIeWa7IvwT2+VnogbcVg3F0qr6LTnRIROuk4=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

Add the pwr_event interrupt and rearrange the order of the other
interrupts to match the binding.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 067712310560..9ef3fa40e1d8 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2665,14 +2665,16 @@ gem_noc: interconnect@9680000 {
 		usb_prim: usb@a6f8800 {
 			compatible = "qcom,sc8180x-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
-			interrupts-extended = <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
-					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
-					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>;
-			interrupt-names = "hs_phy_irq",
-					  "ss_phy_irq",
+					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
-					  "dp_hs_phy_irq";
+					  "ss_phy_irq";
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -2739,12 +2741,17 @@ usb_sec: usb@a8f8800 {
 				      "xo";
 			resets = <&gcc GCC_USB30_SEC_BCR>;
 			power-domains = <&gcc USB30_SEC_GDSC>;
-			interrupts-extended = <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
-					      <&pdc 40 IRQ_TYPE_LEVEL_HIGH>,
+
+			interrupts-extended = <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
-					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>;
-			interrupt-names = "hs_phy_irq", "ss_phy_irq",
-					  "dm_hs_phy_irq", "dp_hs_phy_irq";
+					      <&pdc 40 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
 
 			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
 					  <&gcc GCC_USB30_SEC_MASTER_CLK>;

-- 
2.43.0


