Return-Path: <linux-arm-msm+bounces-73531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AF0B57584
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B97901AA0905
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC922FB610;
	Mon, 15 Sep 2025 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t0vNi0dT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F682FAC15
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757930792; cv=none; b=U+AfGKeM96znXTdYmBQUVQj+OzkaTPdifrFltw38c+zK8B6mEkZG7rsQPLx/M8yUa12zZh7BubU8B/oxdMHuIwhvRQ6kWQ88nnescy6VU/QBrZGlVXrsHyadRCC1tkvINnBD2128hVwuUOccpyk9sArKIn5/KurtWdAVXxWT1wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757930792; c=relaxed/simple;
	bh=+ShsOxehK3vPfQPw/3o19HKvX/iAMIQV9RlAhLMzWts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EW4q4WyCSGK25pPaus8e4SSNCsNPpTrB7DZQIN9LH/Von4ScFrd7K2KmyfNK1BovwNkG5i40lF71Tu62tjWhUZ0tkdcytP4Q21IcnXA86X3U0MuFJFkF8+ymr0jygSlZyhT0HM/DR7QY/SuuacKou94nzIy9jWTR903bosKtbLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t0vNi0dT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45dec026c78so40882945e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757930789; x=1758535589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2ZKUn+jq389hHmKRqBQRwd4GDWbmAFrDZJ0P/TID0k=;
        b=t0vNi0dTSvUT0p9EF92DxaFhINnHfNh91WVXQcv/ZaRKcoxtyKNb270nxMKPAI9CVE
         6J8ZNk3CDAocxOp0YNkPzDb9GkRXc89m7DSVofrdcMyRA4l3PIHqGsXlNHIgMZFF6MJf
         g8OgpX7DrthrCm/HR0k39SDroEV8mBodJRA1Yi9OjCZBShJKQOnFXkKz3i42az9O7GLh
         P7rSG8nfC+uaE3iiCuILHv5ngDyHB+Emfn017RYrskYkVurl0v+GyH58zyHy/UJ3ybOO
         KW2sluPge0wW2uVs92QF5ISYDS3c7n1OfbKJKEib+ywRkpdhvnagJqL2JV2QlV0Mzb4Z
         dAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757930789; x=1758535589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2ZKUn+jq389hHmKRqBQRwd4GDWbmAFrDZJ0P/TID0k=;
        b=qEl+VpHsbPtKfjkauYHKZb/uOuyEqTxrZZlwr0ALNy/yZNUXkXjC0RgouIgVDJgdka
         2G9IBOCOhpmLZ3xGGxVOR3FfWjBAcHqPAVUDClQT9QhG92KKKO0ZjqkNp+3d2fdj6et4
         +CRmcksRkUHd3fSaixntf4YAdR30EzemMNCzlWEjiR7BKFuOt52hoRLdxZfpxXVkZyFq
         lAuJib9DKRGLUYSIXMl5EKQINth4ffjmToftlWDWLk/SNobIRFl/TGpv0R6AQiK1p6GR
         0jhthwrwD2Kg2o09SEwVJYlCjaYyB+5WZK66TkpDNJiBaCfghvRKUSYG2yAwrFfraxLy
         EbOA==
X-Forwarded-Encrypted: i=1; AJvYcCVHNnDrfR8LH29wzHHW9G7R7XmQxwVpgnV2xCwkN/7aZTRKTtDFroUm0qS6vkc7FfGiwmUxihYb+WPy8jxs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/8yB/WQm9RiqRUK+eJ/ViowB9ZQlLrx8QZHrjK+E3igjw+b4O
	/qDIqm8GOAAKsyUityTU2U8x1QXqK5IP1K/ZqL91C3w5Q5W4S8efyCR64rjwWqz1/l0=
X-Gm-Gg: ASbGncu+EyHOMq+7GR4xAZvf2vw8i+q+MCthJT2uTZX+Hdu4l0yRQh9lXukEkAox3pq
	UI3+rw2JD1gaoh1+U3OO4Ujeyl5RHePUMXCJjDKWp0nWGYChpjpoIn1QaHxJeCZmwlEemtBS1XY
	dtbzd/Hwy5tJe4qvJDQUZ7NU35P9r9eo4ODRYwBWw0R7c/Rg/MQ8plpUP0gbcuIw9LciK1+nPA3
	VBNDvafxh/6YSx/s7E8jgCG4UkYDvno90C8qohgfRMLIpAgEw8lpOb5hkro3swyvGguDLrT0fnU
	auloZPgcWFHHXsJ6Wd/Qad88ghXux992g/gsQaOZ8Y7KytLQazci9qYamObTnfufDMYcD/Y3EJJ
	huH1XL6RJYv+/qzRD4D0tD0gtqkLwdcOQ3yFVdsJYUrzsTQ==
X-Google-Smtp-Source: AGHT+IFHeDqwo3IJZLE9ouwCOgN9pOpAvjMVBWaO9LQYeV0ooL5G9kS3F+W9S5ouSFSHfB9iUA813g==
X-Received: by 2002:a05:6000:4203:b0:3ea:63d:44c6 with SMTP id ffacd0b85a97d-3ea063d4b22mr3522864f8f.35.1757930788783;
        Mon, 15 Sep 2025 03:06:28 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:eee1:5042:e713:2e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd4cdsm17209127f8f.37.2025.09.15.03.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:06:28 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Sep 2025 12:06:13 +0200
Subject: [PATCH v2 2/9] arm64: dts: qcom: x1e80100: Add IRIS video codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-x1e-iris-dt-v2-2-1f928de08fd4@linaro.org>
References: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
In-Reply-To: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Anthony Ruhier <aruhier@mailbox.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>
X-Mailer: b4 0.14.2

Add the IRIS video codec to accelerate video decoding/encoding. Copied
mostly from sm8550.dtsi, only the opp-table is slightly different for X1E.
For opp-240000000, we need to vote for a higher OPP on one of the power
domains, because the voltage requirements for the PLL and the derived
clocks differ (sm8550.dtsi has the same).

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Inspiron 14p
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
Tested-by: Anthony Ruhier <aruhier@mailbox.org> # Lenovo Slim 7x
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 87 ++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index ba602eddfb54616ad38205570bc56a1f0e62c023..a6305077f150d59ef8fdbd13fe3ba03d43646c91 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5234,6 +5234,93 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,x1e80100-iris", "qcom,sm8550-iris";
+
+			reg = <0 0x0aa00000 0 0xf0000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "bus";
+
+			iommus = <&apps_smmu 0x1940 0>,
+				 <&apps_smmu 0x1947 0>;
+			dma-coherent;
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable on boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-192000000 {
+					opp-hz = /bits/ 64 <192000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-481000000 {
+					opp-hz = /bits/ 64 <481000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,x1e80100-videocc";
 			reg = <0 0x0aaf0000 0 0x10000>;

-- 
2.50.1


