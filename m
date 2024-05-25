Return-Path: <linux-arm-msm+bounces-20462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D321C8CF0CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EA74281782
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 18:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D7812BF24;
	Sat, 25 May 2024 17:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKxe4zYF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D3112BF14;
	Sat, 25 May 2024 17:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659957; cv=none; b=cgludtrOA7HWyG5FMChsgrU0s4TwcMLJqZ72lzKz1DYFTDdyvAqSsK4G109B0oxKf21ccVc6XbdkuA55t7tDi9rmSJzftno28QkA7uoMx3wYoiMgaOmtkIUpZN6Jr0440ZGB+AvF6qXwyvkAAVKibe6GaE1uxUXpa9PO1mnT5ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659957; c=relaxed/simple;
	bh=o4kiKhxOwZs1Pl6joEEPNnwVtYuLg7fy0zk+ZBo5jEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pr1le4qRsPwbWdf7L1KLltbKxF0ZbbepNepp0pAm+wPpREH6sElQNmTgx/WuR7C8J2g0TTwBNp4Zo9DnDEskqJjOskXTPBamBfA1Voj35TtB4wPlId9ly9FVrpfA0ilSSf5uyCAk3/1mgXatZHFBI22UfWLtmqLO8EMJ8JIoSR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKxe4zYF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB09C4AF0F;
	Sat, 25 May 2024 17:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659957;
	bh=o4kiKhxOwZs1Pl6joEEPNnwVtYuLg7fy0zk+ZBo5jEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NKxe4zYFCCM18q8ezxq5LJm8ltvq9pVyC+UFQ54t0Gy0AYKXPaYt2sgYq9SMk+BOG
	 fgC/iwzOYTjunK9p7YGl1xoMnXOkm3glEfie8UIHXjCnbv9iEcuRjr/MMHlzLuTMhs
	 yYgyci4SDd/jyU1TAGuyn8N8vB2tWBmmvN0pyqDq8zLR6Zmuwdkdm2+3abEMqj4jkA
	 1HeBsrRF5/BCxz70eCT/jBH057BzaQySLbebrl9Yd1QjERLm8io9XoUh8SYzIP/njv
	 8nYbWflp74GnXk77AvOi5pyqWG7ghAwF/cU2VJRZRW+4FKUEa3F6Ofidsa9VDY5Ftd
	 qV+a/U+mhRLLw==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 11:03:59 -0700
Subject: [PATCH 06/10] arm64: dts: qcom: sc8180x-pmics: Add second PMC8180
 GPIO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-usb-mp-v1-6-60a904392438@quicinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=Fz7ILqf97xUvsYbsDXAR0+z9Xlwkl6S2Ykmd3P7Brak=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUigMTRCju33i/vPFcthH2BUPrpcbaeiyCTtom
 b7DoTuGRkKJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIoDBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcX0PRAA1Ad557RN9sy4ojGO8VytMOeFuvBiPoYLB6mqF+/
 j24eHnPnr7vewgEWItHxNaxwF3ToG1WaTQb5B8KiXX6bus2T0H3XG/ypjVBG1hfNciXtGx5bomR
 e8YY4wc2zjBudbNwD1KgsXVVpVO4em7BpkGGtRlYYht8bgIUFM6AHbpShovwqcbVjQJz+qLFtVa
 DM6QyWmDqoPf0SV9EI08bx3AehOUAPwOJt48yl/IBPdnYM4DQ24P2G/fMxyDsgCz93TYzccV3VB
 4NVTRgPjz1cCRGYJMnQgEn/svDOTJrO1I8BYvedv8PL/2lmx3Y0UPPav3iAtHh125KYnq2pKWar
 oZ7KEWjn8qO56VURK6m6Y0avvzBqA4R7dx/nGGywQSLJ9AaHFXjwkKByNQjO4LHbBQKD16r0R7Y
 IlUHiP7H5PIhOpetEV1uq7NUm7z0jOPjSBfYV5Pr6wviO027GixTZhJPCWcP8/Da886tSmMfg5H
 +U1k0wyUCO+7QXi+ZLvNXOLOYdS/Ni6qgfEn12yOWXNcnXiJf74gs72JOZL0ZEf3CtKydmizQMi
 618YU3mOS1PdSQPJdIDVvk+MekE8A3KIih4hpSXO7YnVNa88Vzx1OSF4yjT5MpE48JhukZHcytl
 1QK9WdYaYNBBaMraanRHO0/jkPPWr1VMgtEnuvGkG/Gk=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The SC8180X comes with two PMC8180 PMICs, with the GPIO block being used
to control VBUS supply of the second USB multiport port.

Rename the GPIO controller in the first PMC8180 to match the schematics
and define this second controller.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
index ddc84282f142..95656b5ed481 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
@@ -141,11 +141,11 @@ rtc@6000 {
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
 		};
 
-		pmc8180_gpios: gpio@c000 {
+		pmc8180_1_gpios: gpio@c000 {
 			compatible = "qcom,pmc8180-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
-			gpio-ranges = <&pmc8180_gpios 0 0 10>;
+			gpio-ranges = <&pmc8180_1_gpios 0 0 10>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -200,11 +200,21 @@ pmic@6 {
 		#size-cells = <0>;
 	};
 
-	pmic@8 {
+	pmc8180_2: pmic@8 {
 		compatible = "qcom,pm8150", "qcom,spmi-pmic";
 		reg = <0x8 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pmc8180_2_gpios: gpio@c000 {
+			compatible = "qcom,pmc8180-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			gpio-ranges = <&pmc8180_2_gpios 0 0 10>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	pmic@a {

-- 
2.43.0


