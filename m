Return-Path: <linux-arm-msm+bounces-76581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99391BC8360
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 79F744F742F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFC92D7DEB;
	Thu,  9 Oct 2025 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcyBtmJy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8E52D5922
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000957; cv=none; b=EuSDWBnuCaZHHdSKVVB4j/H3L3SqgI2QdepKTx2Kuuq7e+9uLCrv0kH/IDV43qhYjY5r+dEm6n41jpcqBsaBo/PBqdzDCobN/DGqbin7SH5u3TTAmgNX2S8oWyeF7gVhRwTSk+vr5twumy6FFLwGOnpB1AZkCkA4DYpap2w9tjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000957; c=relaxed/simple;
	bh=G1zpfekdSZiJev6eJRsTbPMg2jybnP7AgkcQCvR2kig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BtDiZhfgOqS5+SNlftSszEHyBWdk7dZxkJpSqhweM7OFFfXgiYkyEYKVI2CNIra1D/K2cF4s/gN21PB9QJ0QI9cg8cuQd4PMzYta+wD0p9ZiMhtetyiddoIyStcBgjQqnCySnq5wzNYwq2Mk423lZJsDCbb5CHOLSed2SU6WMhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcyBtmJy; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso726857f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760000954; x=1760605754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4BUoKX4aVGGfhuI/7/g8Joz07QJoCyb8Bx4xh94QPeQ=;
        b=TcyBtmJyxtf2puvw6sLHoJqgWDItSaLKf2/GtLPpgh7ITbk7k6tJ13tDx84zIxhxKo
         foUtHfJ0+kjxb+jueHNnZLxq8wcDlgqQNoiQfmnMdG2CncKwRRrsQGNyYbX4m7q0BQTe
         dPEpcVp6IJxV5N2aRGiLTQLlE4qH3iqMtRAy4nyO2aBlsM0N1Ek6htn6LznJrYoU8pdS
         S5G/4IWnJR7nA5PWO9b9/n7/PgUO8XjZMY0iJLQMHuMW97A4dg7PRMqcKYgN4EwAefMd
         dH80l0vHD0ZyDlMf0Ok9bTeBQEXVK6t2Vg1Hzx3b46TQCSlu5vYBj8y0wqREgv6gBcRD
         ImRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000954; x=1760605754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BUoKX4aVGGfhuI/7/g8Joz07QJoCyb8Bx4xh94QPeQ=;
        b=Ja/6i5o4eJ58BscFhMENH0Eq4nIeNuUZJXQFEshV8F2gYoo69Hv0zkDz7bu0S6iX/x
         v+sH0TiaWnvmLcjUGpmtAanEt8rpQsvG+4VzdEt9TK/Tdl/jf3ImGpYPIGnLyUNko4PD
         bNqiJSuXOLmFmYkgb+nCcPTM/kBPSXECqvrb9ezlHuj4uEI5NvrG4/S4tFHlgs9D9+jS
         IJWTSJUHA76BI+NxsvARuaPb2CiFr/yfpuiMt6a7gdYc2ZPp4p2wG9roKl6KoqrFYp1t
         0nOCyLC/LFj86zpk/Hu/YHlcOcOzItqrlZOgIjCONwPbTAB2TFLBfboxu0SLRV8eOZaa
         3nPA==
X-Forwarded-Encrypted: i=1; AJvYcCW0W/NAAoA/Gy7H9ne/GxX5+ZQX6SfwrZMejCwjstmriAA20uymZlPUuKKsQckmxo+nu+TyGBY8Eb+hVl6G@vger.kernel.org
X-Gm-Message-State: AOJu0YyZZTDn+RglHxfhTWUtsSa8iiG3VslW7UfbN+mqnH3IW3dL6hql
	7tXV44bpICK6BedsNrqQ5+EhxPe0KUAm7h7TyWfpMZKDKEIgNjpNk6Y/
X-Gm-Gg: ASbGncvXg970CKBIEMelcs/ecOotNWU6e3z87f2y70/z7pdDRTV8XnoQcODedt7+jJ1
	dFw09+T8AiQiQvKgDHgE1rjcIwI7C5vNOIJC+ve+Z0XHa58y1kFf85ExKHAI632x2z1byDFNovc
	K/FUK23X91rsrO5xiNBTFXyQkcyyrpgbgQIi4FkYskWWoedtnCFlICxRrlBMJDLX5sxioQCNNmA
	G1e/nhdjGn0y3MSLkuWeIRWfLObfFbePD0hoE4Otc1+XdDQJUstjmSdmH6G2wqyEzmqHxSHJFcz
	V5dAPL5jNqe9T7pyRyjAoRRe0P9rbzobTKWIu242qMg8R2X8vt17Qa0eb8hN9ChDdpJDH+MgO52
	dW4R9aoqSsV2WCTt3ahTRg5b35sXHazc3NNsAahmXS4j0sQ==
X-Google-Smtp-Source: AGHT+IFyY+f5ZToAadYUxQOq+QbU8cB77hd8FOC3v5od7uiITs2vrOIfXoY6winsFAgzx+4BRB+/Ag==
X-Received: by 2002:a5d:5889:0:b0:400:4507:474 with SMTP id ffacd0b85a97d-4266e7d66e6mr3748282f8f.18.1760000953958;
        Thu, 09 Oct 2025 02:09:13 -0700 (PDT)
Received: from T15.. ([46.175.113.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e970esm33802278f8f.35.2025.10.09.02.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:09:13 -0700 (PDT)
From: Wojciech Slenska <wojciech.slenska@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Wojciech Slenska <wojciech.slenska@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qcm2290: Add uart1 and uart5 nodes
Date: Thu,  9 Oct 2025 11:08:58 +0200
Message-ID: <20251009090858.32911-1-wojciech.slenska@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes to support uart1 and uart5.

Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 48 +++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 746c49d6e0fd..ffb194be7b01 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -552,6 +552,13 @@ qup_uart0_default: qup-uart0-default-state {
 				bias-disable;
 			};
 
+			qup_uart1_default: qup-uart1-default-state {
+				pins = "gpio4", "gpio5", "gpio69", "gpio70";
+				function = "qup1";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart3_default: qup-uart3-default-state {
 				pins = "gpio8", "gpio9", "gpio10", "gpio11";
 				function = "qup3";
@@ -566,6 +573,13 @@ qup_uart4_default: qup-uart4-default-state {
 				bias-disable;
 			};
 
+			qup_uart5_default: qup-uart5-default-state {
+				pins = "gpio14", "gpio15", "gpio16", "gpio17";
+				function = "qup5";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio22", "gpio23";
 				function = "cci_i2c";
@@ -1197,6 +1211,23 @@ &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 				status = "disabled";
 			};
 
+			uart1: serial@4a84000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a84000 0x0 0x4000>;
+				interrupts = <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart1_default>;
+				pinctrl-names = "default";
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				status = "disabled";
+			};
+
 			i2c2: i2c@4a88000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x04a88000 0x0 0x4000>;
@@ -1418,6 +1449,23 @@ &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 				#size-cells = <0>;
 				status = "disabled";
 			};
+
+			uart5: serial@4a94000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a94000 0x0 0x4000>;
+				interrupts = <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart5_default>;
+				pinctrl-names = "default";
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				status = "disabled";
+			};
 		};
 
 		usb: usb@4ef8800 {
-- 
2.43.0


