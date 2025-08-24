Return-Path: <linux-arm-msm+bounces-70516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DC1B32D99
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 07:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 007E6447B9F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 05:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6591DC198;
	Sun, 24 Aug 2025 05:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUgqWm6K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2BE11712;
	Sun, 24 Aug 2025 05:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756012808; cv=none; b=jBEBIUEWZw+kJrq4OjP60UXTIOWc8iQ6JoaYZ2iBAHHfzThhhIHjDTInPqwnL7yqiKxLikAiWQESDRkDX2hj8BpwNw9wN3L1TPBQd94qGL77uz+VOuRE+80AdwmRYjzNsQ8PGV1wbdrBrk5NXAfH8wiUJO0m5yDqPOtiF/Hp4hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756012808; c=relaxed/simple;
	bh=Zy9nACsdco9FHFGpfjTzW0aax4B3y8/I8Tgjk7vLaZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mur+hEOnt0afx3kSHADlE0f1r1TkNtOlJB7z54zQOIgY37O7wcSQ+LcLFVPJK/m1HvcBeYFVVomUIRnUipTQ1ObL3YsYw1ERttJxfxlQ+EJsuQfWtYmJeRxX7sNBJ6LM9b9qMKU07oEpb6OrSwAty71cPWanSW7j2Fv2VUzJgds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUgqWm6K; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2460757107bso29303795ad.2;
        Sat, 23 Aug 2025 22:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756012805; x=1756617605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WMa9NLGsGsKeOmVS0KTSJlVt0G2hDe1o9aIKXMT8C4s=;
        b=KUgqWm6KhY/KkwOOWFeWZO68JQK4EAvIbKkNW4pNBYB3cyUjHePpovd2A2bkXECMv1
         XxghJrFOnNTsV/X/0wVQSmxv53toc3cV/E96fhwo/Su2OR6jzEYzCYeXBo5qo1zsetKN
         59oKuyyjWgfmyZyCh1vLPR/9rLuqrAEa7QTIqu+vpm9tkT7nXpRuhhx47BUFtSZVPmF5
         W6WdAUVdnEw3I046wFXzBonGB0msv4Za8+WDKLm/F7shC4ZKu7uAKIfreiBXs+4m6Jlr
         s6jC6JHcvvHalOw7qH83f7R/L0WhgtbrfQAC6lV+AsDG/a/o9slTymG1XYegEGYjcYmf
         1o9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756012805; x=1756617605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMa9NLGsGsKeOmVS0KTSJlVt0G2hDe1o9aIKXMT8C4s=;
        b=ltf5ededcynR8PMeJGPVc50RxUsOwq6DhKIacoC1Zar1syKu0R28xhWj5K+ry5q8nf
         GESADnMFT77BjzBhFc7mlKsuq4jJZ8tBbrFoy7ltTx2+Vazqx8aZX8xT5K0r1auFLTAG
         PhaZztT+V8T+cSonRoy75FdQyVvBxtHbZKIcnNqTrCf4S+dr8Hjj3zCNL9sFBA1shB2i
         qpa3irL2tekK5nqlSUbjsBb+J2AUubxAjGi8FmPjdzN6nmrxnhnL0VNt+iFzKHbyLBq+
         agXlLCXkqSHspub/KtxgtiwujiUQJ2gSAKQqhoAZFeouUjBcZ52KcUqvouF4TkkP8aIj
         uIjg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3QMSPtoxalHxtptHBnnmwavJkVV8m9mDjqGuJih3SENeVh8YegXk+bknauuwGCRlIeLstiY8HTFHOi83@vger.kernel.org, AJvYcCWiMrDYIJMU/j66cZr/3NHH6HCYoJZesk8zLcjiUjqOWWk441P7YH3fQdIigvqcngjl/p2AO+pZ3zr0@vger.kernel.org
X-Gm-Message-State: AOJu0YyVnCLwj4cIX+QeEqyHj4/i8FLKCrJRe9r0TJ7xgCs+/OocYKDQ
	6wRBdUdKI/OEsZqVFqd46n9v6wsttThjE+Mn1PNhlQ+BkMU3FbKCJqn56A/n/zNa0FE=
X-Gm-Gg: ASbGncv6OwZ/m0wruU9YgAj9t/jfCjdsShodk1b+AufaluZ77xPy8zox1glu0IUq+9V
	Yy3wEy7r6YFxf8/5R2hmH2Z0xdki+gojqE2SmqUUJuV1qSqg93LP3pWT+OB4HdANcK6VsP6K4Ce
	ZS0IHP9+QTMeMJDGoFqcgROzLnOIo/ThgYR8eT6kj0QU70N7+z23iRg7qUARqRBaqogQg7E2Xrn
	60GH1TWfmgxpZfJOvCo5iDWMkC/r4r1P3y5F6lJFWrehnLLguHduK5YlrF0CoM7aBHdWFs+VD5O
	6fC4onkoDrIdUjbOR9dXDMu/J8P7geWeoLrXiJUShyd7ML2LkpKnUuNE0DvIR8lP6fqbbAXC6S8
	mG5FXSOtWWIp32YukFkB3eQ==
X-Google-Smtp-Source: AGHT+IEzm4prwQMgAjWyEBE6bQLznWltiIF0fEwBiWf6P2L+75HVlhVXPUP+mrosQN9yEXFSNCNIxg==
X-Received: by 2002:a17:902:c952:b0:245:f7f3:6759 with SMTP id d9443c01a7336-2462ef1571cmr105800095ad.50.1756012805360;
        Sat, 23 Aug 2025 22:20:05 -0700 (PDT)
Received: from nuvole ([2408:8448:5e23:e352:c16:1ab4:27ca:d3f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466877a008sm35559395ad.29.2025.08.23.22.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 22:20:05 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 1/1] arm64: dts: qcom: sc8280xp: Describe GPI DMA controller nodes
Date: Sun, 24 Aug 2025 13:18:54 +0800
Message-ID: <20250824051854.9307-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SPI on SC8280XP requires DMA (GSI) mode to function properly. Without
it, SPI controllers fall back to FIFO mode, which causes:

[    0.901296] geni_spi 898000.spi: error -ENODEV: Failed to get tx DMA ch
[    0.901305] geni_spi 898000.spi: FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode
...
[   45.605974] goodix-spi-hid spi0.0: SPI transfer timed out
[   45.605988] geni_spi 898000.spi: Can't set CS when prev xfer running
[   46.621555] spi_master spi0: failed to transfer one message from queue
[   46.621568] spi_master spi0: noqueue transfer failed
[   46.621577] goodix-spi-hid spi0.0: spi transfer error: -110
[   46.621585] goodix-spi-hid spi0.0: probe with driver goodix-spi-hid failed with error -110

Therefore, describe GPI DMA controller nodes for qup{0,1,2}, and
describe DMA channels for SPI and I2C, UART is excluded for now, as
it does not yet support this mode.

Note that, since there is no public schematic, this is derived from
Windows drivers. The drivers do not expose any DMA channel mask
information, so all available channels are enabled.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 361 +++++++++++++++++++++++++
 1 file changed, 361 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 87555a119d..423a812588 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -912,6 +913,30 @@ gpu_speed_bin: gpu-speed-bin@18b {
 			};
 		};
 
+		gpi_dma2: dma-controller@800000 {
+			compatible = "qcom,sc8280xp-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00800000 0 0x60000>;
+
+			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0xb6 0x0>;
+		};
+
 		qup2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x008c0000 0 0x2000>;
@@ -939,6 +964,12 @@ i2c16: i2c@880000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -955,6 +986,12 @@ spi16: spi@880000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -971,6 +1008,12 @@ i2c17: i2c@884000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -987,6 +1030,12 @@ spi17: spi@884000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1017,6 +1066,12 @@ i2c18: i2c@888000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1033,6 +1088,12 @@ spi18: spi@888000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1067,6 +1128,12 @@ i2c19: i2c@88c000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1083,6 +1150,12 @@ spi19: spi@88c000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1099,6 +1172,12 @@ i2c20: i2c@890000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1115,6 +1194,12 @@ spi20: spi@890000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1131,6 +1216,12 @@ i2c21: i2c@894000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1147,6 +1238,12 @@ spi21: spi@894000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1163,6 +1260,12 @@ i2c22: i2c@898000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1179,6 +1282,12 @@ spi22: spi@898000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1195,6 +1304,12 @@ i2c23: i2c@89c000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 7 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 7 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1211,10 +1326,40 @@ spi23: spi@89c000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 7 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 		};
 
+		gpi_dma0: dma-controller@900000 {
+			compatible = "qcom,sc8280xp-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00900000 0 0x60000>;
+
+			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0x576 0x0>;
+		};
+
 		qup0: geniqup@9c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x009c0000 0 0x6000>;
@@ -1242,6 +1387,12 @@ i2c0: i2c@980000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1258,6 +1409,12 @@ spi0: spi@980000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1274,6 +1431,12 @@ i2c1: i2c@984000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1290,6 +1453,12 @@ spi1: spi@984000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1306,6 +1475,12 @@ i2c2: i2c@988000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1322,6 +1497,12 @@ spi2: spi@988000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1352,6 +1533,12 @@ i2c3: i2c@98c000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1368,6 +1555,12 @@ spi3: spi@98c000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1384,6 +1577,12 @@ i2c4: i2c@990000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1400,6 +1599,12 @@ spi4: spi@990000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1416,6 +1621,12 @@ i2c5: i2c@994000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1432,6 +1643,12 @@ spi5: spi@994000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1448,6 +1665,12 @@ i2c6: i2c@998000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1464,6 +1687,12 @@ spi6: spi@998000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1480,6 +1709,12 @@ i2c7: i2c@99c000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1496,10 +1731,40 @@ spi7: spi@99c000 {
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma0 0 7 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 7 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 		};
 
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,sc8280xp-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00a00000 0 0x60000>;
+
+			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0x96 0x0>;
+		};
+
 		qup1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x00ac0000 0 0x6000>;
@@ -1527,6 +1792,12 @@ i2c8: i2c@a80000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1543,6 +1814,12 @@ spi8: spi@a80000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1559,6 +1836,12 @@ i2c9: i2c@a84000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1575,6 +1858,12 @@ spi9: spi@a84000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1591,6 +1880,12 @@ i2c10: i2c@a88000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1607,6 +1902,12 @@ spi10: spi@a88000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1623,6 +1924,12 @@ i2c11: i2c@a8c000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1639,6 +1946,12 @@ spi11: spi@a8c000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1655,6 +1968,12 @@ i2c12: i2c@a90000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1671,6 +1990,12 @@ spi12: spi@a90000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1687,6 +2012,12 @@ i2c13: i2c@a94000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1703,6 +2034,12 @@ spi13: spi@a94000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1719,6 +2056,12 @@ i2c14: i2c@a98000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1735,6 +2078,12 @@ spi14: spi@a98000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1751,6 +2100,12 @@ i2c15: i2c@a9c000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 
@@ -1767,6 +2122,12 @@ spi15: spi@a9c000 {
 				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
+
+				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
 				status = "disabled";
 			};
 		};
-- 
2.50.1


