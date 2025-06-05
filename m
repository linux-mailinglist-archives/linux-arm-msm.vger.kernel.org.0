Return-Path: <linux-arm-msm+bounces-60271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0687AACE95E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 07:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14376189679C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 05:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC601C4A20;
	Thu,  5 Jun 2025 05:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6qRKP0q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D99143748;
	Thu,  5 Jun 2025 05:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749102150; cv=none; b=MHcGF5mLXWWQLIGBoDPxacOjh2gqrVWK1O/fj3RWlHQ/Yh7x30kWPgsAf29GUIRC/489wuqd+vKYSiUnef5Pg0IHzDXYIBadIsrSu3jM0eOx61IsOYDCCLjjQwmobkug9UwDugXypJ0pzKdbdfYQZ+iu0T2CupKRuVZaY8Xun1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749102150; c=relaxed/simple;
	bh=X0y//244IcVVvTsWhfk0S4rqcPTMLP52+OwILkbFL8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ea/VaNH56/8RVfO12Kfd8XAtFNMF0jIWYUrM6mY4h5ma4QlsOL9sMJgwiiFqESnufPAPmkdwe2egvtFF03ZEiKfK73ct9145uic4/5T1RS8wkYGCESgLEL+FMkG8ecIe7zOW8ISbewrP0Wsm1pZmIHPKct9h/rjmayOpL0NpqpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6qRKP0q; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2350fc2591dso5076145ad.1;
        Wed, 04 Jun 2025 22:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749102147; x=1749706947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=anP5W6fw320yDkAAyVm5897/IbGfmYVQQj7SpOyp4mo=;
        b=b6qRKP0qYjkIz7CBusQF5P1fUkApuPibCbk2norDITz2XfOpK+hmI4oEigNaINFFp1
         aZyjcgIBgvt+l5mZYpOX3zf/e166vYJ369U24W9ob0BwJ50wMK9FwDF96YKbHQJqEyMO
         gpbi8vR8q0VhJIdCxycZ6jCYH8pbNP5sNmatGBrJ61H4hAO4LUzP+lCnNxBrTGuPdKb/
         BfbNxOU77gn3twxW4J6lNGWsgiQd689IB6ta4xnNa6Jcbcp8wyqlbyJV4ENP99xeVP4r
         PFNV9eleKJHd9ai3dsLayFbBJ6k9cVVvFYOAZH+6RJ2tPPaGk5AWYL3Tkr5C91h1+Kao
         cheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749102147; x=1749706947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anP5W6fw320yDkAAyVm5897/IbGfmYVQQj7SpOyp4mo=;
        b=JuNikvqrhymNLIjtraNYcX6vQHRyE1XYhISKQrTQ8JHgORZCdtrzUBJL3qX0DNKrJP
         qVklZLfDVGQJyWKVAYTsQO6scd8PjMxxqxrUfaAdMMiESAFEpvoD26ZZbkSWiRaF1BEH
         6CpBZCWE0oUzRzQ5RrNp6282sgAHlTb1enoVJWZHmRQCz5tkSOHJHNamBfApYzTL0jnK
         X+2Y1yD/NORum4mE10YmtW70B/JQ3/f5mYNzl37ICiREG2vmpAj8Tv8Fb+CZDtobgQUn
         QOIY4ySl3UTcah9BeKmuF6ukcr/GShO+ULKoqvWEAqZ4PCGdgtapijdcqXHCV3d7DJdB
         j8aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd1wr3CjX8JD/8ze/8ty6bVRPFcZVg0GtvDxGxjRvln8Btqk8A+zYkGIWJh6h8OnTKJbWOiCC4Q5lv2M6b+w==@vger.kernel.org, AJvYcCVgO7ETQG6PpOHYjbI+yWEr9jQaqogHk+x8Jcx/+U+RZWkxriVRolHbcfj3jqoxyxIOpL4Aw3Ju2u0xpiJj@vger.kernel.org, AJvYcCX2P7Aig5TKa4m93MiGMIe3HURgwRd+Auocf3tWbcRxWZCfo5bubKh5pMi3Jmj+cfNrIuGXeApd+c+P@vger.kernel.org
X-Gm-Message-State: AOJu0YxSYw4+dOFdFQCKILD3F7Vnl1sx14OENL7tCOrPAWtyxLC8SkOs
	pZoZ9EJzGWAH5bDuBRQvNMkr48z8d5kywmVMxXe0wrwP0fln8VK02OF3
X-Gm-Gg: ASbGncvhaby2Ekl1HKzAHbDRe3u8VYCyKx8NyEvf4zyAwGgBoihdJBZbkuWdLJ/L77/
	1iYMH6nh3Y50ibspB5CS1uos/bohqNCSwRmwSBEvlc1LhxvFib3Nb4kGGroV9gP/kq+pJ+gEA61
	CRx5UuOEMWXDs4fx/rshyG5fBz9sCqrAtFWgqFDNE2kGp0oXyGNfPw2afbnDuUpqCwmZSVMT1BU
	TqPPprQoZ4EDyc99VrppuJGHGAmBNOASv7MwDiYBPszRz0XdxgZcE8IjuxCBM+0sXzjmsTabX65
	BCAdiEgSeixfCF08cw3reEJZ7P92IhupAuvIOD9pbqVj7CF/lVyZPbiKKQNm
X-Google-Smtp-Source: AGHT+IFCRmkaMSnG2reBq/Mk6gUiWv+HC+u8ZSYfXBxUTCY1h97OzxQazuFRIY4xJjJP6MiBUBuGqA==
X-Received: by 2002:a17:902:f54a:b0:231:c9bb:6106 with SMTP id d9443c01a7336-235f153ac77mr29654275ad.9.1749102147146;
        Wed, 04 Jun 2025 22:42:27 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd8cf0sm112609215ad.155.2025.06.04.22.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:42:26 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Add GPI DMA configuration
Date: Thu,  5 Jun 2025 13:42:07 +0800
Message-ID: <20250605054208.402581-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SPI on SC8280XP requires DMA (GSI) mode to function properly. Without it,
SPI controllers fall back to FIFO mode, which causes:

[    0.901296] geni_spi 898000.spi: error -ENODEV: Failed to get tx DMA ch
[    0.901305] geni_spi 898000.spi: FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode
...
[   45.605974] goodix-spi-hid spi0.0: SPI transfer timed out
[   45.605988] geni_spi 898000.spi: Can't set CS when prev xfer running
[   46.621555] spi_master spi0: failed to transfer one message from queue
[   46.621568] spi_master spi0: noqueue transfer failed
[   46.621577] goodix-spi-hid spi0.0: spi transfer error: -110
[   46.621585] goodix-spi-hid spi0.0: probe with driver goodix-spi-hid failed with error -110

Therefore, add GPI DMA controller nodes for qup{0,1,2}, and add DMA
channels for SPI and I2C, UART is excluded for now, as it does not
yet support this mode.

Note that, since there is no public schematic, this configuration
is derived from Windows drivers. The drivers do not expose any DMA
channel mask information, so all available channels are enabled.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 368 +++++++++++++++++++++++++
 1 file changed, 368 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 87555a119..ff93ef837 100644
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
@@ -912,6 +913,32 @@ gpu_speed_bin: gpu-speed-bin@18b {
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
+
+			status = "disabled";
+		};
+
 		qup2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x008c0000 0 0x2000>;
@@ -939,6 +966,12 @@ i2c16: i2c@880000 {
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
 
@@ -955,6 +988,12 @@ spi16: spi@880000 {
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
 
@@ -971,6 +1010,12 @@ i2c17: i2c@884000 {
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
 
@@ -987,6 +1032,12 @@ spi17: spi@884000 {
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
 
@@ -1017,6 +1068,12 @@ i2c18: i2c@888000 {
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
 
@@ -1033,6 +1090,12 @@ spi18: spi@888000 {
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
 
@@ -1067,6 +1130,12 @@ i2c19: i2c@88c000 {
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
 
@@ -1083,6 +1152,12 @@ spi19: spi@88c000 {
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
 
@@ -1099,6 +1174,12 @@ i2c20: i2c@890000 {
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
 
@@ -1115,6 +1196,12 @@ spi20: spi@890000 {
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
 
@@ -1131,6 +1218,12 @@ i2c21: i2c@894000 {
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
 
@@ -1147,6 +1240,12 @@ spi21: spi@894000 {
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
 
@@ -1163,6 +1262,12 @@ i2c22: i2c@898000 {
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
 
@@ -1179,6 +1284,12 @@ spi22: spi@898000 {
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
 
@@ -1195,6 +1306,12 @@ i2c23: i2c@89c000 {
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
 
@@ -1211,10 +1328,43 @@ spi23: spi@89c000 {
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
 
+		gpi_dma0: dma-controller@900000  {
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
+				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <13>;
+			dma-channel-mask = <0x1fff>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0x576 0x0>;
+
+			status = "disabled";
+		};
+
 		qup0: geniqup@9c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x009c0000 0 0x6000>;
@@ -1242,6 +1392,12 @@ i2c0: i2c@980000 {
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
 
@@ -1258,6 +1414,12 @@ spi0: spi@980000 {
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
 
@@ -1274,6 +1436,12 @@ i2c1: i2c@984000 {
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
 
@@ -1290,6 +1458,12 @@ spi1: spi@984000 {
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
 
@@ -1306,6 +1480,12 @@ i2c2: i2c@988000 {
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
 
@@ -1322,6 +1502,12 @@ spi2: spi@988000 {
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
 
@@ -1352,6 +1538,12 @@ i2c3: i2c@98c000 {
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
 
@@ -1368,6 +1560,12 @@ spi3: spi@98c000 {
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
 
@@ -1384,6 +1582,12 @@ i2c4: i2c@990000 {
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
 
@@ -1400,6 +1604,12 @@ spi4: spi@990000 {
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
 
@@ -1416,6 +1626,12 @@ i2c5: i2c@994000 {
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
 
@@ -1432,6 +1648,12 @@ spi5: spi@994000 {
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
 
@@ -1448,6 +1670,12 @@ i2c6: i2c@998000 {
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
 
@@ -1464,6 +1692,12 @@ spi6: spi@998000 {
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
 
@@ -1480,6 +1714,12 @@ i2c7: i2c@99c000 {
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
 
@@ -1496,10 +1736,42 @@ spi7: spi@99c000 {
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
+
+			status = "disabled";
+		};
+
 		qup1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x00ac0000 0 0x6000>;
@@ -1527,6 +1799,12 @@ i2c8: i2c@a80000 {
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
 
@@ -1543,6 +1821,12 @@ spi8: spi@a80000 {
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
 
@@ -1559,6 +1843,12 @@ i2c9: i2c@a84000 {
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
 
@@ -1575,6 +1865,12 @@ spi9: spi@a84000 {
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
 
@@ -1591,6 +1887,12 @@ i2c10: i2c@a88000 {
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
 
@@ -1607,6 +1909,12 @@ spi10: spi@a88000 {
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
 
@@ -1623,6 +1931,12 @@ i2c11: i2c@a8c000 {
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
 
@@ -1639,6 +1953,12 @@ spi11: spi@a8c000 {
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
 
@@ -1655,6 +1975,12 @@ i2c12: i2c@a90000 {
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
 
@@ -1671,6 +1997,12 @@ spi12: spi@a90000 {
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
 
@@ -1687,6 +2019,12 @@ i2c13: i2c@a94000 {
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
 
@@ -1703,6 +2041,12 @@ spi13: spi@a94000 {
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
 
@@ -1719,6 +2063,12 @@ i2c14: i2c@a98000 {
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
 
@@ -1735,6 +2085,12 @@ spi14: spi@a98000 {
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
 
@@ -1751,6 +2107,12 @@ i2c15: i2c@a9c000 {
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
 
@@ -1767,6 +2129,12 @@ spi15: spi@a9c000 {
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
2.49.0


