Return-Path: <linux-arm-msm+bounces-27459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5418F9424EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 05:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E82C285EAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 03:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56CF2E3FE;
	Wed, 31 Jul 2024 03:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIm3GHBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8313B2941C;
	Wed, 31 Jul 2024 03:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722396021; cv=none; b=t8I+DTy2teskNEP3bjbCnDhQMjSnCjEgaeNT0WZTsRuRuN7s8k+nE/MIgFoJOw3neufk2OAdWZEO9LK+xS9daAyrMvk3u6prg+TRm/4+qENwbi9iPU4CMo9McGLMhFou1q9ANiR9eW4GtOr7vB1dnWnEAneV2+pI+oW8BgkD79M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722396021; c=relaxed/simple;
	bh=vpJrewGNY4xVpLM1vrZibScLHwld8Jyhp1cdNs6Q5BY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjjGIOaZ9f0y6PRVcaPKXqAUklQtswK+mbq9TnoXUTESI3QpIU1FCt3eSggkTh3f2xKXtokRnLM0FvkX365N+8bnLYowZaVRMPzw/+SXsH7NYLV9rGpm2TemQp7PtUDk6mcobB15BP0ZVEE0jgatx5E+be6XXlwosotXsLBBNc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIm3GHBI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B832C4AF0A;
	Wed, 31 Jul 2024 03:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722396021;
	bh=vpJrewGNY4xVpLM1vrZibScLHwld8Jyhp1cdNs6Q5BY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SIm3GHBIjVDEvrR9WoiHvJH2F8lVW/P2hwOc+If8QsURnsWEGdqhbls+ukUMgVgpt
	 0UOyqzZZ/XTF+ZU7kKEMWPNYhedSaVYMG6+OK6pdppE5z6mm/T24unO3HXNn8RyIhF
	 kyX8N3VOr0N7pysCvuNvdMtvaQeufdGZGZRGXWyTue3qYIiebvAG+GtTixXRoHoGcF
	 yHyT0L0glrZswaUYmz/SymzwgD6waOJl9zm1S0dz/uOmCAuffdHhl7L5Nygby3H9F7
	 5ulY/8u1tsYx2y56B/K6r3c/yZ7wsKbyGq4uW1kwYBggB3itnu2c3YsSf8bg/xWL+c
	 lMxZH3dry/V8g==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 30 Jul 2024 20:24:41 -0700
Subject: [PATCH v2 4/7] arm64: dts: qcom: sc8180x: Align USB nodes with
 binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240730-sc8180x-usb-mp-v2-4-a7dc4265b553@quicinc.com>
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
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2371;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=XPwQdA5nL7O/yrREuJldPg4SfUnfP4lidjcu3KK9HHQ=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmqa6HgwEqF5T/V3Ucqavekmzkgm4MsC1nGEo2s
 YBdOXy7alSJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZqmuhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWtoBAAgqgOjnEoIHl3qWcLwc9cT4hTibGCoVh8dkiyv6o
 DLse/9bILbsLEYQsPECI+opxRgQ5FmJDkts5Zdv99gmPA63NTqdPiVHnouEqNk6lEBrS1w3CMFX
 mpuF546QO0QGW7uE64+dxEcf1PTHYiSdcOu2gqSbJdBEMiW/myY3soDOKnplIWJofviQIdvUaJl
 Y08Esu18MmAA1G9YNclsy6pNdsTHWvZypGuCU988UfdwYp8Dy/OGKGzZdQEL6Ohtk4l65KzZUUn
 02SQX7HUaxmtT8W91AL1DdWsjPoooMcyUnOW7GHHrANLTssTa/cyObvxG92N2fSu5uN/AyXwT7f
 RkyRRwBaAiX6YQAAw3/BcMBXoMmTaAUex14VKPaufUbicO9LTG+XsvwRHLAzx5WqQn7+zN+fHSG
 VBdSIDQGcTA4VX0RMBGUTWLW7uFrEBRyjOa7feYcgqMxyCWAzwlrOXXjMFTEjEKRXrtAmmSbaPe
 tIXW+YSasx0yG4LvtO3WFep66aWXqXIWlsSTSA+bY6/UE5lanQZdyKmC1boj5UbQoqkg9MhjUqG
 VIRx0AYpGzKW64cy9KA/NxWGoSCrFWBfiEAmcOMOGkQ63G0ko9NmJVp3B9+tobvmxLKcIqCXy5f
 7Oxrtm5mFTB1dbSSa00RE1gVZNYonk5iTbVw+uLjLg/U=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

Add the pwr_event interrupt and rearrange the order of the other
interrupts to match the binding.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 6e707d993aeb..23ef8dc239f7 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2625,14 +2625,16 @@ gem_noc: interconnect@9680000 {
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
@@ -2714,12 +2716,17 @@ usb_sec: usb@a8f8800 {
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
2.45.2


