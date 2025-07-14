Return-Path: <linux-arm-msm+bounces-64827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56787B040AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 316FE173B68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2064255222;
	Mon, 14 Jul 2025 13:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UrcSWrPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F92825524D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752501324; cv=none; b=UJ0bYXsq0N5sR8pDVVoJBax+FzcFK4Egn63Li74pwBfUT/fPbNM1HQUTL8oK8EItYPx6bODHlL+aY/GfSpf9UJ4ar7gkq6OzkRSSjnvW15/mkttuL80tRV1x0wz5vwDt6ArHaiLCUQQFhKxKkuWIM7qtRHP0DIX1fiyUjCWv+aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752501324; c=relaxed/simple;
	bh=o9rUzX9v9qgXDQ3i6rSoF6AnIUbO5gzqz1WzYADRyG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uFonVrn9LvstUNreOgtQp5QiRhiIgqLG/XCatTiX+gxyN6VMU5L09Z7t5LZNUh5XD/5Xo97EB+9ZczV9ZwwaUkKedCh8mxDDRgsnKgfg1fksAaQhfCppEC1OV+IL+PguXdFPMR3kFwY9yhPE1e3gHoLGcn+y90nySWO0/YY96HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UrcSWrPb; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso634170f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752501321; x=1753106121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oym9Tt+cySSct5QJHwCxmAN8snN3O4CX4rTALRaPP78=;
        b=UrcSWrPb+jMKU48CjQra75iw+YpedVJ9O85cl2ZgcPgHbndgIRPwhDLbSHDGZG/oJ2
         16QqS6tTDIFeSUCSZ56kNNOP+c6h8BW7oISo75rFIIiSGAHIRnfn6XEJgrQkF5eGrhRa
         sO9aaHzhygmz8jBKy8e1iNe4fNJxrbRG3Ht8nyO0nAGCX1cPpGSy5EDidDnI6wtEh0xo
         /ZDZLaBdFFpYLlXNNUIeUgaoMHwQ7VqZcJyml3gHCVnlqPfj4IxqGDX1r7N+S6pDJTSS
         t+BH0vAs3/H4OMFmIMgCaEX51dS7zqP12QBlnq13LWnsoVz/auwmDcSqkHkNG3W8Up76
         RDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752501321; x=1753106121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oym9Tt+cySSct5QJHwCxmAN8snN3O4CX4rTALRaPP78=;
        b=LNBKt3t5Gs/e4BAwvX74VAZ+B9tFVPp2xj/Rw4sZEqf1yGW5US1yZLPDJqPQj/51Pz
         kQFXA1rV4DPPkIi62kOKkO4seyck8vlQqSr4/hG5/5EVJR5Z077YqW0wTcAdiSzvgC8B
         kwHBqCNdnci7h9pjs69wWTsW/1AydYyg5LYDp5BX/aisRcnlKDtMCXZtHEvo5fDMkMKi
         8WgiNhKRG8Dk/6dy86g/ObBDdVdNElglq4cdlKjQtcAM+0wRhng3lfH7Z1Ls6PY/m6me
         r+1Qg9dloF435H6Tc1m5krdlYkVv+w6gW0LRKBxEUiq4D1kbwNkQg08/h3Y7+0X8a7h+
         SuSQ==
X-Gm-Message-State: AOJu0YxAUJak+bocCzvdecZ7MTqXFpy2GSQwDAS/I9NUjbX5jlIqnldH
	rJv11XBNZ37Qq5q7vPRkVPWmCPJEvJmuY8Z+kYFhmC4NmL3ZNC0nY2iyWHPpEFuqv7M=
X-Gm-Gg: ASbGncu+hOrUJaXRjdti1a+CBRouzwMTPuq1UabEMczPPMyoy66aI6TvqrcmvCXKMuW
	3l0W7/kxGSV/HjBUKj56cK1574e0DeTqQS49mM1R5jKJt306H0EutNuURJ9rbcvIuGK4Y/HvnrS
	eMCBl7GK9+4vtFIxRrlEW3DXA62TmBbf8u85WkicVZ/o36f4Zy1c0uZ41YBc3IIQ+ML6LjmyAH6
	6fhRo4/4NGXltqvwPyDtye/UqvNj3hptGzrVf16rQZ7OAnT3ZGUkVWkCqlDI3AqDSNCfX2OQrJd
	qlY6bxgPWIkHcxK4jTIyxHn7YOqjGlUTHUtbraZSow9HA/JMf161CuJd4NDVtpyKhu2OCqA/iJ9
	5WabOKfUkKfsYbknmg4nhvMSdffHNJjkNn/Jh
X-Google-Smtp-Source: AGHT+IFsyLCf9kaPtzAmTh5iAuGGJ+hmN0z9UqP2S11iaGtLo6qvSEpqYfdNc6Tsa9m/a2+3H2tCfA==
X-Received: by 2002:a05:6000:2285:b0:3a4:ec9c:fb58 with SMTP id ffacd0b85a97d-3b5f18e7c75mr3637675f8f.9.1752501321410;
        Mon, 14 Jul 2025 06:55:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5037fa0sm172291575e9.7.2025.07.14.06.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:55:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 14 Jul 2025 15:55:14 +0200
Subject: [PATCH RFC 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-b4-sm8750-iris-dts-v1-1-93629b246d2e@linaro.org>
References: <20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org>
In-Reply-To: <20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4638;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=o9rUzX9v9qgXDQ3i6rSoF6AnIUbO5gzqz1WzYADRyG0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBodQxEUFVMVg6H4k1G74O5CE5ifCHPkG5K1eRcI
 /TeafzEjISJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHUMRAAKCRDBN2bmhouD
 1+ztD/0XOHAC3YFOT9rAuQZrCKGYlLOqhCMwgEYc/sZOj5iyG2ZPqqzLMDqkYCjMjIbLr1ibBf2
 EKNXAIjDPTcHpZWF6F5Qkcdm1hsuD9g4QajiHi3WCy31WzUgbNw91Zt6V1Pj9NRNQd3V0KSKwsy
 bKfsZLfeFY57c5rIrNtoa3bxAStPAi0QzgR4S1RwFK66qEZx60D4pZB2ktGYp7XeOpS3X4qh6N8
 BsjAwrtsE9BgFdl30a2I28iEcafjXtPJRSNGjZRKkUcM+gmMKJ8+ej52CHIiMf62hOfSUddDfaX
 WVxsjO7QuNlEBhIHmXFIEBkbxdM1sBCam6T+VzqUIIg/Iacelb8iIRSOGRuN42XutsAPg4srWKK
 2Z/3nK2dgJFyy4znS+WoPRQOaoctaoUe49XLBxARhrQy+FetRtxcVq24Q1DAeOUAMqKGaBi3AI7
 7WzbOAplrRWxNSNT5TdLDqNX59D1tAYbgH9MM6j9kyfCwaJkbTxbtSaLVTmLzAf1Fq3xxRqfsNM
 VwQt5u517wID9VaJU0gFTLUHS5aN0AUUgKb2lJZ3cOa79eQqXr4RmynANSmjWs5pIRVSYPIixqe
 PIkxtkqrjiMqDwIKPfTwjkeHpHLRPqH3epkbM7h8+Ss5zqrISuZT8ZXHJoBbBqJ+BdRTfP0+dCQ
 UnrAAGmzJdV5JDQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add Iris video codec to SM8750 SoC, which comes with significantly
different powering up sequence than previous SM8650, thus different
clocks and resets.  For consistency keep existing clock and clock-names
naming, so the list shares common part.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

qcom,sm8750-videocc bindings and clock headers dependency (will fail
build):
https://lore.kernel.org/all/20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com/

qcom,sm8750-iris bindings:
https://lore.kernel.org/r/20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 112 +++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 4643705021c6ca095a16d8d7cc3adac920b21e82..b569f1dc347ec70f04ca9b1d19d8c0913dd02900 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
+#include <dt-bindings/clock/qcom,sm8750-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -2581,6 +2582,117 @@ data-pins {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sm8750-iris";
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core",
+				      "iface1",
+				      "core_freerun",
+				      "vcodec0_core_freerun";
+
+			dma-coherent;
+			iommus = <&apps_smmu 0x1940 0>,
+				 <&apps_smmu 0x1947 0>;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+			reset-names = "bus0",
+				      "bus1",
+				      "core",
+				      "vcodec0_core";
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable in boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-420000000 {
+					opp-hz = /bits/ 64 <420000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-630000000 {
+					opp-hz = /bits/ 64 <630000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,sm8750-videocc";
+			reg = <0x0 0x0aaf0000 0x0 0x10000>;
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;

-- 
2.43.0


