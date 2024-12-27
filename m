Return-Path: <linux-arm-msm+bounces-43503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 068799FD4C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 14:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0D78166622
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 13:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14DF1F5415;
	Fri, 27 Dec 2024 13:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Upcjw2Fo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456351F4268
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Dec 2024 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735305144; cv=none; b=MEaNX7d/FY2htsDIGvxLo6lz4ZkSkymERc5qFosJYNlxdG+GbKRlhbdy/JpQKl8s007FF4iM7Jr+HbP3KUn/pEteymd6FNpK08WMghCq7Zd4clOVan9gUkofBDrbxuz1jqiD9Ayk8xheBTEN08JTG24cHWvRFoH9k2eSGyQpxZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735305144; c=relaxed/simple;
	bh=p4HYePqAqwwVtUBADv0DA89SPllLPOl+WT/xy3tWauE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aKEwNY1u8FTORsSGGPXutNnDpA025PJBIF9OsordD49wAvFMn7XZc6Zq+eoz9N2nOEIhKQypx174wxG6WT8WHmjEr1WEi2JhhmCNDkLCwIRdg9q/AgM7RUP3FX+HpFMl3WKaqasEqPuqm40e/GBiq3WDQ56Po9OZoIpzse6TjRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Upcjw2Fo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3863703258fso4813822f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Dec 2024 05:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735305140; x=1735909940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZrCP587FB1TKo2UDQRRUVx0pxQFB2lu1DaIs5nyxaLA=;
        b=Upcjw2Fo0T5UEQsgBISbJC3Th5/0YjW5dvgf+euxfU5kGFMQatbMuP9ARaVPbmfmbp
         2Mkqm3Mi5wLh3+qekm2AotklUgTeLyiNmJfZViJFyZ57zVwBDp5O+taumoFnLudRiEnf
         8ir81hMEHQ8K8X+/LDZ272Wz4Z7OwIeiyLRdsX+jJjoN20rFA6eNf+41CNQ5P5fqmchW
         CBmOO4X1Q2IWymWizQQnh/WlgZpDjv10k2yfEqC6CfgNxphQrFPE77j0yru/OW/Xh5uM
         2HR3ba5rlrCU4o4R/Z6LwUwk7c2U1jP+oWcrZ/vR/MYTv8ps9Kf9usd7QKWz5eHmYdog
         eahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735305140; x=1735909940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrCP587FB1TKo2UDQRRUVx0pxQFB2lu1DaIs5nyxaLA=;
        b=vmXjhhWPynLH2bzgF1XDUpKAhZoOpJiEQpQ+9AkdtXTntdmVawawQxCVFr+M/9AspB
         KAc0SmOFJ7Kk5OmXmeuyp7L98014E+e1/yvFYSXBnzU34FHJG/gWeHeZCWuacROgWLsy
         v7qv+JVCKr2GjI2KuEdjyR5/m/0tS1zMqvWx0FM+F55uIP6UObSeoqswZscPmBB2k2j+
         hacBq1Jd52Ax+lmJAPNsu3gix+ROjFgvyboR8lSVkQyAxRw1SlrxwWPJTZXNSnDg+cki
         HEhYNiJ3pUT58P7zxWQ/6/PHfHzG6vucJqWWvdf4xAWk0zBPtACIjk9jveJ8mszQbvoy
         xp8w==
X-Forwarded-Encrypted: i=1; AJvYcCXTElMnD9Jf0vjYMvZGd+saqYl4IsjLkQCs+IUfOZiNw2r+qDToGMgk+2RuFqh9HR3V9COq9lFXSNuyECLS@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ7tRlngZS/f4FYiCn9rf3MwrplPoZtZTo+Bc345XkTkyk+yfz
	4lJ6sIKorT/eiqBp39PlJtLL/mymQda+zZ9fPlgBg4Af/ihTMhw7kFhpWw4ftkM=
X-Gm-Gg: ASbGnctnu1hCHIeqZ9KWoaeeBI6zvqv4mp6A4R0HH2tRU5dsZHQizVkRhbD2r8/fw7y
	9WBwsuPp5OAWSJAt+ULRDDVf/w01KAKjF6F+iowELV/QJVc6xrAU3hk0wA+rCTjHnV0Xf87/Rn9
	2BUqM+j0dCuutv1R1GfuI+85aEa0L0E/oqE76nSSChQfYLA5HKDiRjqUXjGbofAER319yL3XLyi
	e4OdzoPePUh2sIPAptfkZqvQiYenqY+HSyCeD2ErK5F7xKTUu2puy3ZOnCsED+sNw==
X-Google-Smtp-Source: AGHT+IE+HU/jbA5GjePTDF+VWLPnPi6jNH082VPpiSJACriUcH1qnRDSCQQKWm/8AkRqdbpX5Y30Qw==
X-Received: by 2002:a5d:6d8e:0:b0:386:3958:2ec5 with SMTP id ffacd0b85a97d-38a1a2749f8mr27109062f8f.28.1735305140548;
        Fri, 27 Dec 2024 05:12:20 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c42sm298899425e9.9.2024.12.27.05.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:12:20 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 27 Dec 2024 13:11:38 +0000
Subject: [PATCH v2 5/6] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-5-06fdd5a7d5bb@linaro.org>
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6

Add in 2 CCI busses. One bus has two CCI bus master pinouts:
cci_i2c_scl0 = gpio101
cci_i2c_sda0 = gpio102
cci_i2c_scl1 = gpio103
cci_i2c_sda1 = gpio104

A second bus has a single CCI bus master pinout:
cci_i2c_scl2 = gpio105
cci_i2c_sda2 = gpio106

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 150 +++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 5119cf64b461eb517e9306869ad0ec1b2cae629e..cc174a021e4c7b3f6578f44691eb70592975f8e8 100644
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
@@ -5272,6 +5350,78 @@ tlmm: pinctrl@f100000 {
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


