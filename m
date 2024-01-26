Return-Path: <linux-arm-msm+bounces-8416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BB683D927
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 12:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EF9BB392E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 10:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DE967E77;
	Fri, 26 Jan 2024 09:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eW9AakYd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0006772A
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706261935; cv=none; b=AMRiQ3PNIl6qsWb13PsClZeYGar82IsMtSHjqh5dzOZqOa1iPMBPT9zRTOFa9PLneTKA3vdflKOk74Sqsw2xdPEHqR0hdA3IeTBQ4kCMrytW53aZDDozp8RxXJZiXp69DJKmGt3w3GO+h/XDfLu4TTGzDogv9KqewxT2aUTaxnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706261935; c=relaxed/simple;
	bh=4449UScTTEGM5kZZoyLU0xXEQfqky887G2FwqhxVQzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DGPZjzjEL34S+2/sKRF+p/SXeBA7rmMnpgOdV7OJlczAcYULsP8QymZEsOXpW/76dBXHnZaMpvEiD7UmpGbxFbDQ6ozl3XSlPb171o6lz65/paMgeiqw1MqRRCs4u2wVfzPtgLU93cwdl7e0FDnD1RvPhDvI+4ANchO1noTh4ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eW9AakYd; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3510d79ae9so232166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 01:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706261932; x=1706866732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SU0QZ/C9JHR+wXOt/l6AbaKKe/yMkJBOBv7GjvM4hjc=;
        b=eW9AakYdTKT4609RZDcSM1M0Xa3J0LC/FpbOSBR4vnaiVhX6jiWI/w204mhAdS3TBJ
         y4M8p1tvfHJGHDmilB9oFC06IKzsBUL8A21ZKem1bpOKhDxHL4Ps500o8UWVEEjRoz+Y
         dXgxHYVP7C/AolMsMBrK1fglf5QkNxikG50mXfLvACW7xBHfeH7MlycpyUUoIVIc4FP9
         lqEVGac6aXG+fN9l64WdHeiRCQfEZPpH31ITkiWOBwCn6j/nXmhXRzaGOelr/VomeB/Y
         L9uXQS25oD4fktz3H1+KHSbA8T5X83A/WRycYzLgnYJ3CSCnvyn7UlUH3797zf18caR4
         T9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706261932; x=1706866732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SU0QZ/C9JHR+wXOt/l6AbaKKe/yMkJBOBv7GjvM4hjc=;
        b=GGZAIv0om8hLgoJQ/Ac82csD9k4vsTM5w345MVmhkJ01WYTCWxS4yhAbm2TYaEvaoh
         UFbfNG5ErbZAe5tc8gaLJ35CAhI0jUMV5PaDV7cWeqerGermOEQ3v3lPtlYiWsX8ulom
         H1ts9ErUlqCfyiKLFAe2nmAS+ccMgx71OR5yoHH/DGUNZzRQB2KS5jK8qsOdE4VUwRIQ
         IOllDh6uVStbKGBekzc0wJg6FdP6xDcozDBhSK9GRRQp7Y/eYuqTHy8Nbs4xvEYr8Uhe
         8Ntc4S/O4LNvQ18Hg4lIDWy9IKVAlmz5vGnwZ7l4LoI5tdp0oDJJATJOZd088cyqOdF/
         DAHQ==
X-Gm-Message-State: AOJu0YwWjI6PFes+MqgkMGfEFWx20A24TudyDyM+1ZFeP0zAbOccsXK+
	5CLRtK3YJGMsUWKYRBwMQjs+RizVqC3WacHKv70T7ELwIBCeZNbr5uImrML9xN0=
X-Google-Smtp-Source: AGHT+IF6WMg+EQloM2Nfov3qxjumSbvSzaj+mwT9SUnJkZPl3YgID/ABrmbwxei7lFTdWWGOQbpXDw==
X-Received: by 2002:a17:906:1d0b:b0:a31:5b30:6f54 with SMTP id n11-20020a1709061d0b00b00a315b306f54mr617313ejh.30.1706261932364;
        Fri, 26 Jan 2024 01:38:52 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id se27-20020a170906ce5b00b00a349318ea10sm426768ejb.199.2024.01.26.01.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 01:38:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 26 Jan 2024 10:38:35 +0100
Subject: [PATCH v2 6/7] arm64: dts: qcom: sm8650: describe all PCI MSI
 interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-b4-dt-bindings-pci-qcom-split-dts-v2-6-0bb067f73adb@linaro.org>
References: <20240126-b4-dt-bindings-pci-qcom-split-dts-v2-0-0bb067f73adb@linaro.org>
In-Reply-To: <20240126-b4-dt-bindings-pci-qcom-split-dts-v2-0-0bb067f73adb@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2346;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4449UScTTEGM5kZZoyLU0xXEQfqky887G2FwqhxVQzY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBls32f/HouX2kiquOsLRlva4BDb/H0zwhQPUv+g
 DtS/w6Fy8GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZbN9nwAKCRDBN2bmhouD
 1x0gD/4xWYzaMlIWsbSjIZFH2QFtUcEdZ6Jl4q6NfuOEe//uDaFv5ZSx/ofkrgyeQ1yT4sdK/+I
 8W+HdiiXZVgTrf6puCN+M3JNTFHUM78i9LoPAAZLcFzo3h81T0CjwNj7eYqc0TUKC93HfVOmKUM
 90srCof7cDHSgU4aan3GBV/prIsPiAHRuY24c8x3gwiFdY7p+OdKnC8gUkM04tbJeaLlVE2v0Gy
 e3Kz3uLr9kPo8HBc/UvgrQZhMhcQDnIu52owgO7Pg1NBB7HjUQEuESVeqNIWPlKPZyibSR6s2/J
 zaZeonVSARkXCbqAYDssH/Bl+HBjlG+wyFfuM/hFGlmPaBDE6HAAb8u8/wx9bFFOrWhP7qiwt0F
 lj3qe214ui8kfLb8G7YKw+6Dv3ex8gD701bLMEZyUi5UK5NmB6aE67WZgetAeGwpkX+Ed0c3bdJ
 /iPypfDVtEYk6welMZhWaVmpVu3EowtqPBtuc5C+JJMA+mp5CC+ch9IV2cTGkJFnhVOU8FiDSk5
 tvJGh0Q0kDjWzuFOmtXKKMPNtDzZ+zg6gQWRrZwhdclc5NoWoMnahqdM5O8QLVH7W531H2WH3jm
 CadJ8K4RCv9BV1RiEaEua55bwrepvcclZXewzFltArLZzwQBgojW0FjDptH6SkN2Vc8IZn3/xiN
 rKKcap3pxsxEYGg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Each group of MSI interrupts is mapped to the separate host interrupt.
Describe each of interrupts in the device tree for PCIe hosts.  Not
tested on hardware.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 2df77123a8c7..942e602bfc97 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2213,8 +2213,22 @@ pcie0: pci@1c00000 {
 			      <0 0x60100000 0 0x100000>;
 			reg-names = "parf", "dbi", "elbi", "atu", "config";
 
-			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7";
 
 			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
@@ -2317,8 +2331,22 @@ pcie1: pci@1c08000 {
 				    "atu",
 				    "config";
 
-			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7";
 
 			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,

-- 
2.34.1


