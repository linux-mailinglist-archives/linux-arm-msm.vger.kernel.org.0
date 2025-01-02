Return-Path: <linux-arm-msm+bounces-43793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F38A9FFBC3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 17:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCC7D7A1509
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 16:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E55188587;
	Thu,  2 Jan 2025 16:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hFshTgGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8EC16F0E8
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jan 2025 16:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835663; cv=none; b=ixDKl2h6SuoYj/DbfvSAMuQG53fyRuxN5OF4rhk1NFufR67NAWFkfo3f9SEt933bZyIFojtxvefLLxxW32qz8oOQotBzep7Db7TkvZ+sxn3tZDqYTpKXJPLuJt5YORJJaVSH3MkfAfQhI8Y91kOU6Z8Z/0kXDsIgK6z3o2ROkj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835663; c=relaxed/simple;
	bh=fjvzO6KffOj9sfc5EIby2AXHfhoZiX0qQfPWKO/dzKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OrLr4hYpSsHsTfCHmDIoHyMWd0S9Hgit5arLlSQJICh74H3OCu/IpvM2xVbDZe7FJo8Mul+y+gEJcfiz2ElCxbx6etec6QrbtTmvupZsKL3efgN+jS3hxjNNNffeHHw56wqrEQPVYIXdrO/dLE0eIt+cnQ00RROKCiUu/REXlck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hFshTgGR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4363ae65100so119814935e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2025 08:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735835656; x=1736440456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPzOhMrUaAX5ZkaDgmyUGAbRthcflOScBviLrrbA1DU=;
        b=hFshTgGRcRKITxUUmhtqBHds8gy5Ktmj7tQV494NcnBcolQgK4MqYCqg8ON5TyIILk
         Ths0a3lyDwAogG3y5xY4f/UcDHCle6fKaJVyA1Hf42jDxXfZTR4Ifjy/Xi5u+1f5FoRV
         ppCRWmSfmpfpwCuNItTaBT5H+J6+uUmwKz6X+uFhOtd/K7DlUDvwV0qvruRacpgP4Xcg
         E4AWAlDIzYWtJTc5DuOLpU+pEMKu6r1C/uq7/4t/a9TZRoFl6Z+LPKoxIBB2qjGw6NdP
         bZnUPF4nVxu0azaYZOlJV0EgXoFaR6Oq+vT4uqeuHpq+Ju7iKN8dkPtz/UupXV4vfThF
         XNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735835656; x=1736440456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPzOhMrUaAX5ZkaDgmyUGAbRthcflOScBviLrrbA1DU=;
        b=fGCbDm3idS55pLe4N44zs1bgkT7vl7GUh8QpCXjKwBngohdMSSCwYwzO1eTaJG+lOU
         D9zmK0+UwQGtHrgI4UAo+rdnZhwKtp/qqG1Nn7nuu4dbyhLdyyHRqsL50ZaFptqX9BVq
         AgFfMKzIVg55IuYxZfHVr/Tg+INsF3Q0is0wMmdcGleI4fG7YvOO1LNG+sp1vIbV3TI+
         A33G+UhOxpD3fYcCgbdqgu/Q2br0jTDoSdoSPqlMyQXQKfbIQRoXA8TbUZRRx96skCz4
         hS/wrxxN52x8RsRP4a40EByaK9RsJBVjyEsGrAWez1QgTHOmyXBe3CjbJymBP1pauu4g
         FkLg==
X-Forwarded-Encrypted: i=1; AJvYcCU3BGI0Faj3OFgI4jSasJhutQRc1Aai30AgnpxS52091YPTLCzDRry00DFr30hjZdwS4vPjxHa0HsDWrZwE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+G5Gq1CV8q6IHk/BLD67MvFd7bdYzXNHhmaFBJa6BRpm/rvgi
	yZaItcAR26X7QuhD2/zKyxtpgZngLWin72W6Q0rvKEi5nZSgD4Q++eoUhdOUd0A=
X-Gm-Gg: ASbGncvPGA2G4Vlw6X8M8wznxPBGDYk7YslQW0bpFrkdPJEI9wA/Yr42eFMGm49IsYo
	LQsngnIYLSD++HszRMDbxdegfjyh20bPXQEUnyA69qgDCYa5AbwPvl2amD+dx11gYfIfhWeQ4Cz
	KQrXXCYApT7mHipQZIRyKgwaEDcFaW8pXWe04wInrG4Uk27BdiD0XMrNvgyrMFqTQ0tiu/RWYWZ
	GCorGsMC0cArXo5lYWlcFaP2CX0lvMy9ZZPBb08Beqb+m5wlw5xczCSiYVn6Aml/A==
X-Google-Smtp-Source: AGHT+IHzGfi8JqgrtJkJCqsaRzgZmxPWRir2HsTiv6pOD1D/PSO5j8J0EGMa87PX9JhMa12ajsfr7w==
X-Received: by 2002:a05:600c:4586:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-43668a3a3c4mr357327115e9.21.1735835655821;
        Thu, 02 Jan 2025 08:34:15 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b295sm499265665e9.33.2025.01.02.08.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 08:34:15 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 02 Jan 2025 16:32:10 +0000
Subject: [PATCH v3 5/6] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-5-cb66d55d20cc@linaro.org>
References: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
In-Reply-To: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-1b0d6

Add in 2 CCI busses. One bus has two CCI bus master pinouts:
cci_i2c_scl0 = gpio101
cci_i2c_sda0 = gpio102
cci_i2c_scl1 = gpio103
cci_i2c_sda1 = gpio104

A second bus has a single CCI bus master pinout:
cci_i2c_scl2 = gpio105
cci_i2c_sda2 = gpio106

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 150 +++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 5c7b0c048d41a4ba3d74bbf77216ad09b652ed30..97ebf5596dfc3caa920ef85722ca8afd49cd3c24 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4648,6 +4648,84 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
@@ -5271,6 +5349,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235","gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235","gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio0", "gpio1";

-- 
2.45.2


