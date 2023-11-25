Return-Path: <linux-arm-msm+bounces-1975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE20B7F8B8A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 15:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFD411C20DBE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 14:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFE714A86;
	Sat, 25 Nov 2023 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P76PbfWa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0413310E7
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 06:18:15 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a049d19b63bso390931366b.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 06:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700921893; x=1701526693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YptWvF1sLLHvvXfICRwlDYacILHWf1Qs1ovKRND9MmY=;
        b=P76PbfWa9SxbzUBQSdu+ni9PJL6e/0b+4CXLCXyPGaH0RUA0cvfOBIaVmOA0lfaDBJ
         vVG2/5kZhA983v0CN13nRwiR1lq8agjh1HSgnzVb/VIbrP/5GQbVa27uI8HSOThTVyP7
         e/A9l0fEtdilOG0KCMT5j6wFgkE9gRiaAwTkZXzBT3LvYiElodFbITp0MV9evITnQIly
         LPbk/X4/J3y53bhOYF7d/8MiPtcuSpySnItVSgBDPd1OHSCXIfT3ABsVCX9z8v0Cyx+1
         ERWJjqOVHixwvkG2Gs8aODyTlTIKQCzRZtM3ZljMZ3D/vVNROeLGCC+OpQnm3bTVEmoY
         5yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700921893; x=1701526693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YptWvF1sLLHvvXfICRwlDYacILHWf1Qs1ovKRND9MmY=;
        b=br5FWW1/ze8sbhOE3kDArBPE6hEobzxors16XjPrHmqgFxjZHN97V8fq2GMKxTnSb3
         nmiCgUVDQ23x11PLm5/ZblSjFT3MrqYdlDbR8iHP3+uCaLtEkZfrN7xUBkgHIl71t2G/
         TCDvZKdpoLEXK4rttfZ5+T61j72uZTXLSTg0KaaHcQpb8HOA5Mf7aSBAvMMFbc8Pqgd7
         3nx3qN/hqU4WDBFxOpDlY3kxQQQAM2JM4W8yVG3zjqxuBWNSFSsud6fiJkm2ZWCRd+vb
         8TonbGYtIAxrgV1FN/QApP4G7dtZbj3pJ2Rt7XvVxi9v0KZIec4+9hrQe99/1p+yaFLJ
         C0Lw==
X-Gm-Message-State: AOJu0YwnyTkJ5TLtTa+URiEiPfREPgWdChm7LOSAd7dJDoyLLiOocy6n
	dt6XqLGupmBo1vL3H9b8tluAv/kjogFAD6wrVZM=
X-Google-Smtp-Source: AGHT+IEveIKy8lS1XIRID2ri9B1I/5i3oOMUuCvPc3WfqFNEUFa6T6wVRX6iLxNL8g8XxcnkIOK5Vw==
X-Received: by 2002:a17:906:5195:b0:a03:9a89:5aaf with SMTP id y21-20020a170906519500b00a039a895aafmr4262215ejk.6.1700921893233;
        Sat, 25 Nov 2023 06:18:13 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id 19-20020a170906319300b00992b8d56f3asm3500345ejy.105.2023.11.25.06.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 06:18:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 15:17:39 +0100
Subject: [PATCH 11/12] arm64: dts: qcom: qrb2210-rb1: Enable CAN bus
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v1-11-11d71b12b058@linaro.org>
References: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700921858; l=1186;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=JMbrDi2bxn7DXN0vpomcpuwaGp6goPBlt7d60Jxny0w=;
 b=Ow4Ll9242Yv5Y/KsoduODHlhgumTpa99uBnKCbAyWQYNOkJS+/6FFM3xsPWfMjhds1Cgj/BkR
 MwrWiH7RB7lDoCaSaSob+BAKLUxzTFGSFHjKebDh3bFYbzY/x1JMPJx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Enable the Microchip mcp2518fd hosted on the SPI5 bus.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index ac6584164058..ac597eb3fe9d 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -23,6 +23,14 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	clocks {
+		clk40M: can-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <40000000>;
+			#clock-cells = <0>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		label = "gpio-keys";
@@ -449,6 +457,20 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&spi5 {
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&clk40M>;
+		spi-max-frequency = <10000000>;
+		vdd-supply = <&vdc_5v>;
+		xceiver-supply = <&vdc_5v>;
+	};
+};
+
 &tlmm {
 	lt9611_rst_pin: lt9611-rst-state {
 		pins = "gpio41";

-- 
2.43.0


