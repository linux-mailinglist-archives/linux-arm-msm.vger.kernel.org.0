Return-Path: <linux-arm-msm+bounces-23256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 385F390F61B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3612284032
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FDC158206;
	Wed, 19 Jun 2024 18:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OPTzWKX2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5531155C8E
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 18:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718821999; cv=none; b=BpPPQg9+UBYR1FHUwRmLokr67ErfaYdDyYZezCwEfoIGydMj2Im7+gjINeZVuAH9lHFfoVA+GKgXm1ycEy1wUnJ10iL+WMm3UPi/EPnJr8vifuiZ8leygyqOlKiWpuDpWlexmAaUnPGjx1/3hmEZVumqqIMp5ZhLiv9udzbftXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718821999; c=relaxed/simple;
	bh=FZ77DKJQLPlRB8mq+NiU18f5u05yUQmArgFqy62bcoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bAmXkToI82Sj2CFMtg8DXJtySuceicOJS3gMBqq6REj2kuIXVoAo2oTon2F8tOdRhc9i2GHjPcAjF8VqqFOOoXkt9tDNplDWYvZ4dz1rMuNYRMe9ptakL6GONzn+lPB15A0lqoazbVWioW12e4Cn4g9ePNeAAYg4xd62Oz9jhdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OPTzWKX2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-361b376236fso51239f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 11:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718821994; x=1719426794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2GHqs74mJ5xGiEUvIO8OhVobQ7cQuM93CETCGeNoIE=;
        b=OPTzWKX29sSNYPjgQ+BFKZ36oTIBp/fBZuemauGlxYsCtEQYkV2Y0HdUABFYZTT0bv
         aooO4zw6NJ9EB7PC6kmd25KWozv/4IKvao39R0bWmyQcAFBHM/ctNX6WBEbFX8eYLAL/
         tddwv8gmC0TDxTex/IH5zt3/f27+WdB8aEQM9lKmffYoA2S7tIcuykKaTYYnes0VL1SU
         rcDhgPNgOuInpD7HPJcOl5JWc0dBkeFqDKlhYk0AeYjv8LkZz0DHRcBwyVYeJNspdjPL
         /LtS2h87GGvnXBlY6vNl8XE1E0aOdNf96i5/qZDSwgO17LbLHXqYJPBfn11x7iC6On1R
         RJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718821994; x=1719426794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2GHqs74mJ5xGiEUvIO8OhVobQ7cQuM93CETCGeNoIE=;
        b=w/FbhtWvLZ0sbuso/+Dwbqojeh1VvxGJwh+FYM0y18qc+EmMyWN4WaDUKdg3DZtKx7
         j32SRfVjIzDLR+myYA9aD+UC9ssjxLcyJWQMvl2DZO/QW5DEc0aIUBsV4rp5x/9UQAL7
         J92/MtX/bfyExAuYsSTvbOcUyjFCJIlcSyc53X9dMioYB2jWlXrZitRTZjiJvW2rDpvg
         iuAXM8/1UMDUb7F4Nujd9M/n1X3pBPh9udeUUc5gQValEAii/AO9gNbr/fGPYV6ssKgP
         T0J9LXPhaoZtTAxMDpnKZUc2x3l6IneGN1DaQv+OtBlAxnr9CLe0AoQuptbw8d+s3z1+
         wq7w==
X-Gm-Message-State: AOJu0YwhPypGz1eQ1LFhbSVP40Jc11tGH6lJOWVBuuOaZOYbCpZwOvCu
	0/zYwpJefjbYsQ4WqgEFf0CQ3U2y5gFK1oD6SrIFz0m2xX0wPnYjazFS6LhI7FTtighOCDKVxuM
	q
X-Google-Smtp-Source: AGHT+IE/1Ws/vvNuwnjmxI2v+e4fG7PcWw0bDOZ6r+L5P6FxIbV17+ZFfmsSJ8pbpexhO98kFDZRgQ==
X-Received: by 2002:a05:6000:235:b0:362:40cd:1bc with SMTP id ffacd0b85a97d-363178982camr2394620f8f.24.1718821993933;
        Wed, 19 Jun 2024 11:33:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36262f77ad9sm4603238f8f.109.2024.06.19.11.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 11:33:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: move common parts for sa8775p-ride variants into a .dtsi
Date: Wed, 19 Jun 2024 20:32:53 +0200
Message-ID: <20240619183255.34107-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619183255.34107-1-brgl@bgdev.pl>
References: <20240619183255.34107-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to support multiple revisions of the sa8775p-ride board, create
a .dtsi containing the common parts and split out the ethernet bits into
the actual board file as they will change in revision 3.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts  | 841 +--------------------
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 817 ++++++++++++++++++++
 2 files changed, 839 insertions(+), 819 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 26ad05bd3b3f..af9f232ba3d5 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -5,835 +5,38 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-
-#include "sa8775p.dtsi"
-#include "sa8775p-pmics.dtsi"
-
-/ {
-	model = "Qualcomm SA8775P Ride";
-	compatible = "qcom,sa8775p-ride", "qcom,sa8775p";
-
-	aliases {
-		ethernet0 = &ethernet0;
-		ethernet1 = &ethernet1;
-		i2c11 = &i2c11;
-		i2c18 = &i2c18;
-		serial0 = &uart10;
-		serial1 = &uart12;
-		serial2 = &uart17;
-		spi16 = &spi16;
-		ufshc1 = &ufs_mem_hc;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-};
-
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pmm8654au-rpmh-regulators";
-		qcom,pmic-id = "a";
-
-		vreg_s4a: smps4 {
-			regulator-name = "vreg_s4a";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1816000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s5a: smps5 {
-			regulator-name = "vreg_s5a";
-			regulator-min-microvolt = <1850000>;
-			regulator-max-microvolt = <1996000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s9a: smps9 {
-			regulator-name = "vreg_s9a";
-			regulator-min-microvolt = <535000>;
-			regulator-max-microvolt = <1120000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4a: ldo4 {
-			regulator-name = "vreg_l4a";
-			regulator-min-microvolt = <788000>;
-			regulator-max-microvolt = <1050000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l5a: ldo5 {
-			regulator-name = "vreg_l5a";
-			regulator-min-microvolt = <870000>;
-			regulator-max-microvolt = <950000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l6a: ldo6 {
-			regulator-name = "vreg_l6a";
-			regulator-min-microvolt = <870000>;
-			regulator-max-microvolt = <970000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7a: ldo7 {
-			regulator-name = "vreg_l7a";
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <950000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8a: ldo8 {
-			regulator-name = "vreg_l8a";
-			regulator-min-microvolt = <2504000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9a: ldo9 {
-			regulator-name = "vreg_l9a";
-			regulator-min-microvolt = <2970000>;
-			regulator-max-microvolt = <3544000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-1 {
-		compatible = "qcom,pmm8654au-rpmh-regulators";
-		qcom,pmic-id = "c";
-
-		vreg_l1c: ldo1 {
-			regulator-name = "vreg_l1c";
-			regulator-min-microvolt = <1140000>;
-			regulator-max-microvolt = <1260000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c: ldo2 {
-			regulator-name = "vreg_l2c";
-			regulator-min-microvolt = <900000>;
-			regulator-max-microvolt = <1100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3c: ldo3 {
-			regulator-name = "vreg_l3c";
-			regulator-min-microvolt = <1100000>;
-			regulator-max-microvolt = <1300000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4c: ldo4 {
-			regulator-name = "vreg_l4c";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			/*
-			 * FIXME: This should have regulator-allow-set-load but
-			 * we're getting an over-current fault from the PMIC
-			 * when switching to LPM.
-			 */
-		};
-
-		vreg_l5c: ldo5 {
-			regulator-name = "vreg_l5c";
-			regulator-min-microvolt = <1100000>;
-			regulator-max-microvolt = <1300000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l6c: ldo6 {
-			regulator-name = "vreg_l6c";
-			regulator-min-microvolt = <1620000>;
-			regulator-max-microvolt = <1980000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7c: ldo7 {
-			regulator-name = "vreg_l7c";
-			regulator-min-microvolt = <1620000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8c: ldo8 {
-			regulator-name = "vreg_l8c";
-			regulator-min-microvolt = <2400000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9c: ldo9 {
-			regulator-name = "vreg_l9c";
-			regulator-min-microvolt = <1650000>;
-			regulator-max-microvolt = <2700000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-2 {
-		compatible = "qcom,pmm8654au-rpmh-regulators";
-		qcom,pmic-id = "e";
-
-		vreg_s4e: smps4 {
-			regulator-name = "vreg_s4e";
-			regulator-min-microvolt = <970000>;
-			regulator-max-microvolt = <1520000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s7e: smps7 {
-			regulator-name = "vreg_s7e";
-			regulator-min-microvolt = <1010000>;
-			regulator-max-microvolt = <1170000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s9e: smps9 {
-			regulator-name = "vreg_s9e";
-			regulator-min-microvolt = <300000>;
-			regulator-max-microvolt = <570000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l6e: ldo6 {
-			regulator-name = "vreg_l6e";
-			regulator-min-microvolt = <1280000>;
-			regulator-max-microvolt = <1450000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8e: ldo8 {
-			regulator-name = "vreg_l8e";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1950000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-};
+#include "sa8775p-ride.dtsi"
 
 &ethernet0 {
 	phy-mode = "sgmii";
-	phy-handle = <&sgmii_phy0>;
-
-	pinctrl-0 = <&ethernet0_default>;
-	pinctrl-names = "default";
-
-	snps,mtl-rx-config = <&mtl_rx_setup>;
-	snps,mtl-tx-config = <&mtl_tx_setup>;
-	snps,ps-speed = <1000>;
-
-	status = "okay";
-
-	mdio {
-		compatible = "snps,dwmac-mdio";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		sgmii_phy0: phy@8 {
-			compatible = "ethernet-phy-id0141.0dd4";
-			reg = <0x8>;
-			device_type = "ethernet-phy";
-			interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
-			reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <11000>;
-			reset-deassert-us = <70000>;
-		};
-
-		sgmii_phy1: phy@a {
-			compatible = "ethernet-phy-id0141.0dd4";
-			reg = <0xa>;
-			device_type = "ethernet-phy";
-			interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
-			reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <11000>;
-			reset-deassert-us = <70000>;
-		};
-	};
-
-	mtl_rx_setup: rx-queues-config {
-		snps,rx-queues-to-use = <4>;
-		snps,rx-sched-sp;
-
-		queue0 {
-			snps,dcb-algorithm;
-			snps,map-to-dma-channel = <0x0>;
-			snps,route-up;
-			snps,priority = <0x1>;
-		};
-
-		queue1 {
-			snps,dcb-algorithm;
-			snps,map-to-dma-channel = <0x1>;
-			snps,route-ptp;
-		};
-
-		queue2 {
-			snps,avb-algorithm;
-			snps,map-to-dma-channel = <0x2>;
-			snps,route-avcp;
-		};
-
-		queue3 {
-			snps,avb-algorithm;
-			snps,map-to-dma-channel = <0x3>;
-			snps,priority = <0xc>;
-		};
-	};
-
-	mtl_tx_setup: tx-queues-config {
-		snps,tx-queues-to-use = <4>;
-		snps,tx-sched-sp;
-
-		queue0 {
-			snps,dcb-algorithm;
-		};
-
-		queue1 {
-			snps,dcb-algorithm;
-		};
-
-		queue2 {
-			snps,avb-algorithm;
-			snps,send_slope = <0x1000>;
-			snps,idle_slope = <0x1000>;
-			snps,high_credit = <0x3e800>;
-			snps,low_credit = <0xffc18000>;
-		};
-
-		queue3 {
-			snps,avb-algorithm;
-			snps,send_slope = <0x1000>;
-			snps,idle_slope = <0x1000>;
-			snps,high_credit = <0x3e800>;
-			snps,low_credit = <0xffc18000>;
-		};
-	};
 };
 
 &ethernet1 {
 	phy-mode = "sgmii";
-	phy-handle = <&sgmii_phy1>;
+};
 
-	snps,mtl-rx-config = <&mtl_rx_setup1>;
-	snps,mtl-tx-config = <&mtl_tx_setup1>;
-	snps,ps-speed = <1000>;
+&mdio {
+	compatible = "snps,dwmac-mdio";
+	#address-cells = <1>;
+	#size-cells = <0>;
 
-	status = "okay";
-
-	mtl_rx_setup1: rx-queues-config {
-		snps,rx-queues-to-use = <4>;
-		snps,rx-sched-sp;
-
-		queue0 {
-			snps,dcb-algorithm;
-			snps,map-to-dma-channel = <0x0>;
-			snps,route-up;
-			snps,priority = <0x1>;
-		};
-
-		queue1 {
-			snps,dcb-algorithm;
-			snps,map-to-dma-channel = <0x1>;
-			snps,route-ptp;
-		};
-
-		queue2 {
-			snps,avb-algorithm;
-			snps,map-to-dma-channel = <0x2>;
-			snps,route-avcp;
-		};
-
-		queue3 {
-			snps,avb-algorithm;
-			snps,map-to-dma-channel = <0x3>;
-			snps,priority = <0xc>;
-		};
+	sgmii_phy0: phy@8 {
+		compatible = "ethernet-phy-id0141.0dd4";
+		reg = <0x8>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
 	};
 
-	mtl_tx_setup1: tx-queues-config {
-		snps,tx-queues-to-use = <4>;
-		snps,tx-sched-sp;
-
-		queue0 {
-			snps,dcb-algorithm;
-		};
-
-		queue1 {
-			snps,dcb-algorithm;
-		};
-
-		queue2 {
-			snps,avb-algorithm;
-			snps,send_slope = <0x1000>;
-			snps,idle_slope = <0x1000>;
-			snps,high_credit = <0x3e800>;
-			snps,low_credit = <0xffc18000>;
-		};
-
-		queue3 {
-			snps,avb-algorithm;
-			snps,send_slope = <0x1000>;
-			snps,idle_slope = <0x1000>;
-			snps,high_credit = <0x3e800>;
-			snps,low_credit = <0xffc18000>;
-		};
+	sgmii_phy1: phy@a {
+		compatible = "ethernet-phy-id0141.0dd4";
+		reg = <0xa>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
 	};
 };
-
-&i2c11 {
-	clock-frequency = <400000>;
-	pinctrl-0 = <&qup_i2c11_default>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&i2c18 {
-	clock-frequency = <400000>;
-	pinctrl-0 = <&qup_i2c18_default>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&pmm8654au_0_gpios {
-	gpio-line-names = "DS_EN",
-			  "POFF_COMPLETE",
-			  "UFS0_VER_ID",
-			  "FAST_POFF",
-			  "DBU1_PON_DONE",
-			  "AOSS_SLEEP",
-			  "CAM_DES0_EN",
-			  "CAM_DES1_EN",
-			  "CAM_DES2_EN",
-			  "CAM_DES3_EN",
-			  "UEFI",
-			  "ANALOG_PON_OPT";
-};
-
-&pmm8654au_0_pon_resin {
-	linux,code = <KEY_VOLUMEDOWN>;
-	status = "okay";
-};
-
-&pmm8654au_1_gpios {
-	gpio-line-names = "PMIC_C_ID0",
-			  "PMIC_C_ID1",
-			  "UFS1_VER_ID",
-			  "IPA_PWR",
-			  "",
-			  "WLAN_DBU4_EN",
-			  "WLAN_EN",
-			  "BT_EN",
-			  "USB2_PWR_EN",
-			  "USB2_FAULT";
-
-	usb2_en_state: usb2-en-state {
-		pins = "gpio9";
-		function = "normal";
-		output-high;
-		power-source = <0>;
-	};
-};
-
-&pmm8654au_2_gpios {
-	gpio-line-names = "PMIC_E_ID0",
-			  "PMIC_E_ID1",
-			  "USB0_PWR_EN",
-			  "USB0_FAULT",
-			  "SENSOR_IRQ_1",
-			  "SENSOR_IRQ_2",
-			  "SENSOR_RST",
-			  "SGMIIO0_RST",
-			  "SGMIIO1_RST",
-			  "USB1_PWR_ENABLE",
-			  "USB1_FAULT",
-			  "VMON_SPX8";
-
-	usb0_en_state: usb0-en-state {
-		pins = "gpio3";
-		function = "normal";
-		output-high;
-		power-source = <0>;
-	};
-
-	usb1_en_state: usb1-en-state {
-		pins = "gpio10";
-		function = "normal";
-		output-high;
-		power-source = <0>;
-	};
-};
-
-&pmm8654au_3_gpios {
-	gpio-line-names = "PMIC_G_ID0",
-			  "PMIC_G_ID1",
-			  "GNSS_RST",
-			  "GNSS_EN",
-			  "GNSS_BOOT_MODE";
-};
-
-&qupv3_id_1 {
-	status = "okay";
-};
-
-&qupv3_id_2 {
-	status = "okay";
-};
-
-&serdes0 {
-	phy-supply = <&vreg_l5a>;
-	status = "okay";
-};
-
-&serdes1 {
-	phy-supply = <&vreg_l5a>;
-	status = "okay";
-};
-
-&sleep_clk {
-	clock-frequency = <32764>;
-};
-
-&spi16 {
-	pinctrl-0 = <&qup_spi16_default>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&tlmm {
-	ethernet0_default: ethernet0-default-state {
-		ethernet0_mdc: ethernet0-mdc-pins {
-			pins = "gpio8";
-			function = "emac0_mdc";
-			drive-strength = <16>;
-			bias-pull-up;
-		};
-
-		ethernet0_mdio: ethernet0-mdio-pins {
-			pins = "gpio9";
-			function = "emac0_mdio";
-			drive-strength = <16>;
-			bias-pull-up;
-		};
-	};
-
-	qup_uart10_default: qup-uart10-state {
-		pins = "gpio46", "gpio47";
-		function = "qup1_se3";
-	};
-
-	qup_spi16_default: qup-spi16-state {
-		pins = "gpio86", "gpio87", "gpio88", "gpio89";
-		function = "qup2_se2";
-		drive-strength = <6>;
-		bias-disable;
-	};
-
-	qup_i2c11_default: qup-i2c11-state {
-		pins = "gpio48", "gpio49";
-		function = "qup1_se4";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	qup_i2c18_default: qup-i2c18-state {
-		pins = "gpio95", "gpio96";
-		function = "qup2_se4";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	qup_uart12_default: qup-uart12-state {
-		qup_uart12_cts: qup-uart12-cts-pins {
-			pins = "gpio52";
-			function = "qup1_se5";
-			bias-disable;
-		};
-
-		qup_uart12_rts: qup-uart12-rts-pins {
-			pins = "gpio53";
-			function = "qup1_se5";
-			bias-pull-down;
-		};
-
-		qup_uart12_tx: qup-uart12-tx-pins {
-			pins = "gpio54";
-			function = "qup1_se5";
-			bias-pull-up;
-		};
-
-		qup_uart12_rx: qup-uart12-rx-pins {
-			pins = "gpio55";
-			function = "qup1_se5";
-			bias-pull-down;
-		};
-	};
-
-	qup_uart17_default: qup-uart17-state {
-		qup_uart17_cts: qup-uart17-cts-pins {
-			pins = "gpio91";
-			function = "qup2_se3";
-			bias-disable;
-		};
-
-		qup_uart17_rts: qup0-uart17-rts-pins {
-			pins = "gpio92";
-			function = "qup2_se3";
-			bias-pull-down;
-		};
-
-		qup_uart17_tx: qup0-uart17-tx-pins {
-			pins = "gpio93";
-			function = "qup2_se3";
-			bias-pull-up;
-		};
-
-		qup_uart17_rx: qup0-uart17-rx-pins {
-			pins = "gpio94";
-			function = "qup2_se3";
-			bias-pull-down;
-		};
-	};
-
-	pcie0_default_state: pcie0-default-state {
-		perst-pins {
-			pins = "gpio2";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
-
-		clkreq-pins {
-			pins = "gpio1";
-			function = "pcie0_clkreq";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		wake-pins {
-			pins = "gpio0";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie1_default_state: pcie1-default-state {
-		perst-pins {
-			pins = "gpio4";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
-
-		clkreq-pins {
-			pins = "gpio3";
-			function = "pcie1_clkreq";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		wake-pins {
-			pins = "gpio5";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-};
-
-&pcie0 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie0_default_state>;
-
-	status = "okay";
-};
-
-&pcie1 {
-	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie1_default_state>;
-
-	status = "okay";
-};
-
-&pcie0_phy {
-	vdda-phy-supply = <&vreg_l5a>;
-	vdda-pll-supply = <&vreg_l1c>;
-
-	status = "okay";
-};
-
-&pcie1_phy {
-	vdda-phy-supply = <&vreg_l5a>;
-	vdda-pll-supply = <&vreg_l1c>;
-
-	status = "okay";
-};
-
-&uart10 {
-	compatible = "qcom,geni-debug-uart";
-	pinctrl-0 = <&qup_uart10_default>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&uart12 {
-	pinctrl-0 = <&qup_uart12_default>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&uart17 {
-	pinctrl-0 = <&qup_uart17_default>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&ufs_mem_hc {
-	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
-	vcc-supply = <&vreg_l8a>;
-	vcc-max-microamp = <1100000>;
-	vccq-supply = <&vreg_l4c>;
-	vccq-max-microamp = <1200000>;
-
-	status = "okay";
-};
-
-&ufs_mem_phy {
-	vdda-phy-supply = <&vreg_l4a>;
-	vdda-pll-supply = <&vreg_l1c>;
-
-	status = "okay";
-};
-
-&usb_0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_en_state>;
-
-	status = "okay";
-};
-
-&usb_0_dwc3 {
-	dr_mode = "peripheral";
-};
-
-&usb_0_hsphy {
-	vdda-pll-supply = <&vreg_l7a>;
-	vdda18-supply = <&vreg_l6c>;
-	vdda33-supply = <&vreg_l9a>;
-
-	status = "okay";
-};
-
-&usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l1c>;
-	vdda-pll-supply = <&vreg_l7a>;
-
-	status = "okay";
-};
-
-&usb_1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb1_en_state>;
-
-	status = "okay";
-};
-
-&usb_1_dwc3 {
-	dr_mode = "host";
-};
-
-&usb_1_hsphy {
-	vdda-pll-supply = <&vreg_l7a>;
-	vdda18-supply = <&vreg_l6c>;
-	vdda33-supply = <&vreg_l9a>;
-
-	status = "okay";
-};
-
-&usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l1c>;
-	vdda-pll-supply = <&vreg_l7a>;
-
-	status = "okay";
-};
-
-&usb_2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb2_en_state>;
-
-	status = "okay";
-};
-
-&usb_2_dwc3 {
-	dr_mode = "host";
-};
-
-&usb_2_hsphy {
-	vdda-pll-supply = <&vreg_l7a>;
-	vdda18-supply = <&vreg_l6c>;
-	vdda33-supply = <&vreg_l9a>;
-
-	status = "okay";
-};
-
-&xo_board_clk {
-	clock-frequency = <38400000>;
-};
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
new file mode 100644
index 000000000000..9fa023ed2340
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -0,0 +1,817 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "sa8775p.dtsi"
+#include "sa8775p-pmics.dtsi"
+
+/ {
+	model = "Qualcomm SA8775P Ride";
+	compatible = "qcom,sa8775p-ride", "qcom,sa8775p";
+
+	aliases {
+		ethernet0 = &ethernet0;
+		ethernet1 = &ethernet1;
+		i2c11 = &i2c11;
+		i2c18 = &i2c18;
+		serial0 = &uart10;
+		serial1 = &uart12;
+		serial2 = &uart17;
+		spi16 = &spi16;
+		ufshc1 = &ufs_mem_hc;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1816000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5a: smps5 {
+			regulator-name = "vreg_s5a";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1996000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9a: smps9 {
+			regulator-name = "vreg_s9a";
+			regulator-min-microvolt = <535000>;
+			regulator-max-microvolt = <1120000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4a: ldo4 {
+			regulator-name = "vreg_l4a";
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-name = "vreg_l6a";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-name = "vreg_l9a";
+			regulator-min-microvolt = <2970000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c: ldo3 {
+			regulator-name = "vreg_l3c";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			/*
+			 * FIXME: This should have regulator-allow-set-load but
+			 * we're getting an over-current fault from the PMIC
+			 * when switching to LPM.
+			 */
+		};
+
+		vreg_l5c: ldo5 {
+			regulator-name = "vreg_l5c";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c: ldo6 {
+			regulator-name = "vreg_l6c";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c: ldo7 {
+			regulator-name = "vreg_l7c";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c: ldo9 {
+			regulator-name = "vreg_l9c";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vreg_s4e: smps4 {
+			regulator-name = "vreg_s4e";
+			regulator-min-microvolt = <970000>;
+			regulator-max-microvolt = <1520000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7e: smps7 {
+			regulator-name = "vreg_s7e";
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1170000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9e: smps9 {
+			regulator-name = "vreg_s9e";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6e: ldo6 {
+			regulator-name = "vreg_l6e";
+			regulator-min-microvolt = <1280000>;
+			regulator-max-microvolt = <1450000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8e: ldo8 {
+			regulator-name = "vreg_l8e";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&ethernet0 {
+	phy-handle = <&sgmii_phy0>;
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,ps-speed = <1000>;
+
+	status = "okay";
+
+	mdio: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+		snps,tx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&ethernet1 {
+	phy-handle = <&sgmii_phy1>;
+
+	snps,mtl-rx-config = <&mtl_rx_setup1>;
+	snps,mtl-tx-config = <&mtl_tx_setup1>;
+	snps,ps-speed = <1000>;
+
+	status = "okay";
+
+	mtl_rx_setup1: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup1: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+		snps,tx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&i2c11 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&qup_i2c11_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c18 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&qup_i2c18_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pmm8654au_0_gpios {
+	gpio-line-names = "DS_EN",
+			  "POFF_COMPLETE",
+			  "UFS0_VER_ID",
+			  "FAST_POFF",
+			  "DBU1_PON_DONE",
+			  "AOSS_SLEEP",
+			  "CAM_DES0_EN",
+			  "CAM_DES1_EN",
+			  "CAM_DES2_EN",
+			  "CAM_DES3_EN",
+			  "UEFI",
+			  "ANALOG_PON_OPT";
+};
+
+&pmm8654au_0_pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&pmm8654au_1_gpios {
+	gpio-line-names = "PMIC_C_ID0",
+			  "PMIC_C_ID1",
+			  "UFS1_VER_ID",
+			  "IPA_PWR",
+			  "",
+			  "WLAN_DBU4_EN",
+			  "WLAN_EN",
+			  "BT_EN",
+			  "USB2_PWR_EN",
+			  "USB2_FAULT";
+
+	usb2_en_state: usb2-en-state {
+		pins = "gpio9";
+		function = "normal";
+		output-high;
+		power-source = <0>;
+	};
+};
+
+&pmm8654au_2_gpios {
+	gpio-line-names = "PMIC_E_ID0",
+			  "PMIC_E_ID1",
+			  "USB0_PWR_EN",
+			  "USB0_FAULT",
+			  "SENSOR_IRQ_1",
+			  "SENSOR_IRQ_2",
+			  "SENSOR_RST",
+			  "SGMIIO0_RST",
+			  "SGMIIO1_RST",
+			  "USB1_PWR_ENABLE",
+			  "USB1_FAULT",
+			  "VMON_SPX8";
+
+	usb0_en_state: usb0-en-state {
+		pins = "gpio3";
+		function = "normal";
+		output-high;
+		power-source = <0>;
+	};
+
+	usb1_en_state: usb1-en-state {
+		pins = "gpio10";
+		function = "normal";
+		output-high;
+		power-source = <0>;
+	};
+};
+
+&pmm8654au_3_gpios {
+	gpio-line-names = "PMIC_G_ID0",
+			  "PMIC_G_ID1",
+			  "GNSS_RST",
+			  "GNSS_EN",
+			  "GNSS_BOOT_MODE";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&qupv3_id_2 {
+	status = "okay";
+};
+
+&serdes0 {
+	phy-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
+&serdes1 {
+	phy-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32764>;
+};
+
+&spi16 {
+	pinctrl-0 = <&qup_spi16_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	qup_uart10_default: qup-uart10-state {
+		pins = "gpio46", "gpio47";
+		function = "qup1_se3";
+	};
+
+	qup_spi16_default: qup-spi16-state {
+		pins = "gpio86", "gpio87", "gpio88", "gpio89";
+		function = "qup2_se2";
+		drive-strength = <6>;
+		bias-disable;
+	};
+
+	qup_i2c11_default: qup-i2c11-state {
+		pins = "gpio48", "gpio49";
+		function = "qup1_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c18_default: qup-i2c18-state {
+		pins = "gpio95", "gpio96";
+		function = "qup2_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_uart12_default: qup-uart12-state {
+		qup_uart12_cts: qup-uart12-cts-pins {
+			pins = "gpio52";
+			function = "qup1_se5";
+			bias-disable;
+		};
+
+		qup_uart12_rts: qup-uart12-rts-pins {
+			pins = "gpio53";
+			function = "qup1_se5";
+			bias-pull-down;
+		};
+
+		qup_uart12_tx: qup-uart12-tx-pins {
+			pins = "gpio54";
+			function = "qup1_se5";
+			bias-pull-up;
+		};
+
+		qup_uart12_rx: qup-uart12-rx-pins {
+			pins = "gpio55";
+			function = "qup1_se5";
+			bias-pull-down;
+		};
+	};
+
+	qup_uart17_default: qup-uart17-state {
+		qup_uart17_cts: qup-uart17-cts-pins {
+			pins = "gpio91";
+			function = "qup2_se3";
+			bias-disable;
+		};
+
+		qup_uart17_rts: qup0-uart17-rts-pins {
+			pins = "gpio92";
+			function = "qup2_se3";
+			bias-pull-down;
+		};
+
+		qup_uart17_tx: qup0-uart17-tx-pins {
+			pins = "gpio93";
+			function = "qup2_se3";
+			bias-pull-up;
+		};
+
+		qup_uart17_rx: qup0-uart17-rx-pins {
+			pins = "gpio94";
+			function = "qup2_se3";
+			bias-pull-down;
+		};
+	};
+
+	pcie0_default_state: pcie0-default-state {
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		perst-pins {
+			pins = "gpio4";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		clkreq-pins {
+			pins = "gpio3";
+			function = "pcie1_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio5";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&pcie0 {
+	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_default_state>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_default_state>;
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&uart10 {
+	compatible = "qcom,geni-debug-uart";
+	pinctrl-0 = <&qup_uart10_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart12 {
+	pinctrl-0 = <&qup_uart12_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart17 {
+	pinctrl-0 = <&qup_uart17_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l8a>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l4c>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&usb_0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_en_state>;
+
+	status = "okay";
+};
+
+&usb_0_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_0_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb1_en_state>;
+
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb2_en_state>;
+
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};
-- 
2.43.0


