Return-Path: <linux-arm-msm+bounces-21761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9458FCE96
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 15:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 446F31C22ADC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5685419CD03;
	Wed,  5 Jun 2024 12:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oqV2Tbkv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82D9194A7B
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 12:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717590467; cv=none; b=hxh0ZlQ9MsqpjSKZ9W19xvHJfxkoUg6GnfNeztlGW7LZfFbUExN1s+vaMe5GaPSJH0/j69+BWLVKUa0tj2nySgPUXFUmPYHZzxSho+zlur58K90n0pa3je0kvn13WSqN7YvZj8lG9PX5OCTt1+l5gGwkjIEtD7MvYkEiACI20tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717590467; c=relaxed/simple;
	bh=p6R6BK8vUCMsaPsnwA8T5bLaXPsSUxJIi8/GR6rTPJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3b/K5+p5itnulOkmw8u/t0+AjrPK2901xEbvH7YfCh2foUPkntNfb32VjaKxrpKDpc2Vy1wMxqOOSzCsgVPVm7jYRMBlDIbOBXpQ2pDkKBQpLVyHbNFxKuMN7RKkkpwsDYaEB0k6vFQaRjLj7nmLSsTMt/d1Mmn8gfP0NPdJAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oqV2Tbkv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35dc7d0387cso7033884f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 05:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717590464; x=1718195264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n64LePo88loVGt5G6hmnonh7PwOJsheuFMWeQMJUfyY=;
        b=oqV2TbkvmA8zbPiyj77hwy288pF2F2Hr//wSQ7FxJKmBKy5E7GSHx2GD35Rz1ue03W
         YVnHkpw13cyAEE0n8x0IChUiyxhFtz57LovHsTQnKzx3NRvnZ4RgPpewgvSTy1+YXor/
         Wa4D4pxbUmfl3vyPesTYQqP9vkRxryeYUfLqevqXCkNtXcyDBShqRYjx9nwcYEW5Sl90
         wbFQJpIFTkHRs36OhBUDDHw3Td/lruev8u79yZkuIYKrz3bhWlsf7ttCUj2M1k8bwd2C
         Y9gUhcHc5BKoc/+QM1e3pitQU7R98cKx8ZIihxOtdMW6UzKYEBIPBj1+79EJdjt2Bwdj
         rRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717590464; x=1718195264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n64LePo88loVGt5G6hmnonh7PwOJsheuFMWeQMJUfyY=;
        b=q7l2nBNkTYxjqWHxJdaT24WgQvyd5Wogns90izApgZDAsacXRjj6UGvltnUu5ZCb82
         ZUxbDCMGh9rYH0mx9juF9bbdMQtgQ9HPeqTsjRShgdfuVoOTPkIWB7gp3nSTDBXm4dxg
         AAPRfGyPx3xGjHuJ6Q07liLRXdTip9l741DFArLv96MvulpoJ+H9+wkyfBDoI899nQPa
         gfCBr5jJ3Ov+zvD9JV7Ro8/jgGiWCb+fjq2E3u1y+IqQ6QNwfMW1vcNsFDWhrC/ZCMJP
         nHdzVdQt+IGPrXg1kOFQ0bugiEjk2alJECIoFu47//F1r82yEPkAcVe68OlQ7FH0bjKv
         TOug==
X-Gm-Message-State: AOJu0Yy+dAW79J8d87lCUCS3+bKsa0B2VhZ8eJWfsVDw3Ikp1aW5n5j0
	TzUX/IlugPE9JFdvreVs6/jWAGoIth7Pfn6Osz7//z/JUQVrCjfVrRIKCfD3Slw=
X-Google-Smtp-Source: AGHT+IFcetx+rlr15VvdINgnB63zjSwbE+aNcPg9rG2u4zqwofMQPP1wJrpoLz+kRk6INtnkZw0FRA==
X-Received: by 2002:adf:f406:0:b0:35e:de33:9349 with SMTP id ffacd0b85a97d-35ede3396e2mr1928925f8f.9.1717590464251;
        Wed, 05 Jun 2024 05:27:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:d3dd:423:e1eb:d88b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04cac3esm14383619f8f.39.2024.06.05.05.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 05:27:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v9 3/4] arm64: dts: qcom: sm8650-hdk: add the Wifi node
Date: Wed,  5 Jun 2024 14:27:28 +0200
Message-ID: <20240605122729.24283-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605122729.24283-1-brgl@bgdev.pl>
References: <20240605122729.24283-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Neil Armstrong <neil.armstrong@linaro.org>

Describe the ath12k WLAN on-board the WCN7850 module present on the
board.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 89 +++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 182864a3b6bd..4ad352b360b9 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -266,6 +266,71 @@ wcd939x: audio-codec {
 
 		#sound-dai-cells = <1>;
 	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en>;
+
+		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		/*
+		 * TODO Add bt-enable-gpios once the Bluetooth driver is
+		 * converted to using the power sequencer.
+		 */
+
+		vdd-supply = <&vreg_s4i_0p85>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddio1p2-supply = <&vreg_l3c_1p2>;
+		vddaon-supply = <&vreg_s2c_0p8>;
+		vdddig-supply = <&vreg_s3c_0p9>;
+		vddrfa1p2-supply = <&vreg_s1c_1p2>;
+		vddrfa1p8-supply = <&vreg_s6c_1p8>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -893,6 +958,23 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1i_0p88>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
@@ -1153,6 +1235,13 @@ wcd_default: wcd-reset-n-active-state {
 		bias-disable;
 		output-low;
 	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
 };
 
 &uart14 {
-- 
2.40.1


