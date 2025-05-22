Return-Path: <linux-arm-msm+bounces-59081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968ABAC126C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5762B7B6DF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 17:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951C129B22F;
	Thu, 22 May 2025 17:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CsWuQ84c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ACD299A99
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935670; cv=none; b=f/MV6xWZR/lq94KgcXuT6h6VjtJsF52oNCZLsQcbbipM0r1PU592Yftr9OrNO2vL0Tn73PrXVzHpUaYZR7jDmKAYRQhC+7TABi9y/QQ17jbBmb1ISMiyzWkVoZaPayt4jbkl4UDbb7a2IXubCkYc3Mo9HmBoLh6oCYYbvRm48SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935670; c=relaxed/simple;
	bh=EF0Txa2E6g80yBz56jixImeQIXixC4cSFq9Wqfav4qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ExNI80OHiGCMSzhQUwNPiWQKeUxo0mTJ36vtOq+aqo4uC0aYYC7mSRbSkDIAXwYvgOPpIwRPVHbLraut27M7tmlmkyLJxsH8IdY1/ctjGcHWiX3e9OjwjiBW35d3xtWLjk9UKvSBIVioJ0gq6BFG+tfe5FkcZ3p/MHzxAuCbKZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CsWuQ84c; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442ea341570so58670925e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 10:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935662; x=1748540462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSKONdq/LRZBB0/Tar6YckqSuT9fW2OMb4wVHmcSlMg=;
        b=CsWuQ84ctYrXWkfT3VKacjfb+cz9bQguI8OGmlxjUwSVAt5pkGPRNKsmWo0qKazrHj
         CBFQl8m9bfSryYE0uvF4er7S5ESZTP3gW8R6QF+G5LnhAi2BGM7K7lL4UkZecLmWIpeo
         7Q/e+XDgx30p8GCSA0WB7X8d491m6WLR9kNSYAGI7BEJqIwbDKwTgWIlRCeH1TxCWSK8
         5+1Gk3bYCDuixkqV89ZveLg1nIVlzsas2RYqF4YTnAQgiAYoCisyLTzDXDrtvTFgNBi1
         HHakswsX6vhB/m/q2MFCAlHCcPd8ja9eHojAUgthyPsSUPeQy2/u4qz20KULSEufpQp6
         HaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935662; x=1748540462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSKONdq/LRZBB0/Tar6YckqSuT9fW2OMb4wVHmcSlMg=;
        b=UUftk43mPHDg7lfSVP8EJCFBUDM8Erzoxqao0z6ifj2xz29QTRTXOBklNItmqsHPxX
         ZVMOlbK3iSW6CyGqnQQxO4tZ2yDPy6M8VX6LWtnKTnx7V7pNTUf6xgRE4RcdMa5GUPhW
         qYO0Zpx1JalZyR01zXOkDGD0Ay/qpTyL97oRVQr/EdIPducDpMBotzQWezR8WE60qFzG
         E/2fgR8V3IrMJ6g69+CXSO3d0Hm3ilSVp2kdGU251Qiu/uw5aulLm3sHLczSPO6PJpFc
         lsa0jV8OWcBpnqybsmkcKeLThNOTZCEN1fStBc20RSctnG71qZGp84y7LYok1QklVud3
         vrZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz+i8vDsTl8N4HDFdCvAfXZdcQdcBBUdIysV6yXwwEKHCpRWY/yBkTOxHoaKybuHU96JBT3w/fg/2vgJNU@vger.kernel.org
X-Gm-Message-State: AOJu0YzaB4WM7klXStsur4kxYJ5Qc9p+fZUgwbOzK60eK2jxV6dWyWGQ
	JEpVrplKp142O0quoq2uscXjhaSGw7sns9qGEMwHz/gUBX1lK0xzKhL2lJD3lRbxUDI=
X-Gm-Gg: ASbGncvD0VAuEHd14uh4j04iATU5/OA7upYNglXJbilF0uVRcka+yyHwYXY7+Vriel9
	nyn3DK0LO8CV5gY3Q4f4QG/yA0QoNuQdsWPR+0ytzcnsUdkJ9guePpp9RNNhzaE5PsF4MKTL084
	Y4lvZE3v0fpy9sE5MSsZIB7DUd1+qg6QkWeb5R22/E+BZHEWxVa+YVCrbSO7gHF5o7mHiu9OYv8
	SXU23piMCTlWDHEIzGi5C7a5IjSAYKhoMJ95JReYoNGXI+cWw/C7OHBMRKAhoGGZ1TBmSEuwDaT
	1j9Ob47TEzgq89EYHpsH45Pi3yS0z061PKBmLyZzWeMJpCLXB9GqLuV1zzk=
X-Google-Smtp-Source: AGHT+IHqUeUbs3UgAn5G8xl8EZQsvryeTJbiD/7EFpSfTreACpiyaTGdYjoU9MtSvLPoOEHwhxp2CA==
X-Received: by 2002:a05:600c:3d8e:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-442ff032801mr230410625e9.24.1747935661795;
        Thu, 22 May 2025 10:41:01 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:41:01 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:57 +0100
Subject: [PATCH v3 07/12] arm64: dts: qcom: sm6115: add LPASS devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-7-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock controllers
are required to support audio playback and audio capture on sm6115 and
its derivatives.

Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>
Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 132 +++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index c8865779173eca65f9e94535b5339f590d4b1410..045887ae215b0965ffc098fd31fd18ac1ad90b7b 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -2689,6 +2689,138 @@ funnel_apss1_in: endpoint {
 			};
 		};
 
+		rxmacro: codec@a600000 {
+			compatible = "qcom,sm6115-lpass-rx-macro";
+			reg = <0x0 0xa600000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			assigned-clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+					  <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			assigned-clock-rates = <22579200>,
+					       <22579200>;
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr1: soundwire@a610000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a610000 0x0 0x2000>;
+			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+
+			resets = <&lpass_audiocc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			label = "RX";
+			qcom,din-ports = <0>;
+			qcom,dout-ports = <5>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		txmacro: codec@a620000 {
+			compatible = "qcom,sm6115-lpass-tx-macro";
+			reg = <0x0 0x0a620000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			assigned-clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+					  <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			assigned-clock-rates = <19200000>,
+					       <19200000>;
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_audiocc: clock-controller@a6a9000 {
+			compatible = "qcom,sm6115-lpassaudiocc";
+			reg = <0x0 0x0a6a9000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
+		vamacro: codec@a730000 {
+			compatible = "qcom,sm6115-lpass-va-macro", "qcom,sm8450-lpass-va-macro";
+			reg = <0x0 0x0a730000 0x0 0x1000>;
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "dcodec",
+				      "npl";
+			assigned-clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+					  <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			assigned-clock-rates = <19200000>,
+					       <19200000>;
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		swr0: soundwire@a740000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a740000 0x0 0x2000>;
+			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&txmacro>;
+			clock-names = "iface";
+
+			resets = <&lpasscc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			label = "VA_TX";
+			qcom,din-ports = <3>;
+			qcom,dout-ports = <0>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x02 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		lpasscc: clock-controller@a7ec000 {
+			compatible = "qcom,sm6115-lpasscc";
+			reg = <0x0 0x0a7ec000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		remoteproc_adsp: remoteproc@a400000 {
 			compatible = "qcom,sm6115-adsp-pas";
 			reg = <0x0 0x0a400000 0x0 0x4040>;

-- 
2.47.2


