Return-Path: <linux-arm-msm+bounces-10906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A925853393
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 15:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEF7D1C27C52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 14:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E7A58AC5;
	Tue, 13 Feb 2024 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMBuLfPC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6160658113
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707835891; cv=none; b=juyNbvT2L1TqMNQQBVbXJsa9YGz2B1/UBPtqzXa4pf19qtcAIQfmMwI1aC3Uf4ToeZE7pWSeyfxaMKP/+qtL5YpCrZKa0fpi08YFKDgLwyLzVImeQHSsZnS2OrgwNzpnBKYY3a5JA6QmCRB+ZzAQbVvleSyrtmiShmTf1BL00MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707835891; c=relaxed/simple;
	bh=M2rkKG2fl0V2003FoGFp6mtRsRnlP2F6TnRxdEzicH8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Oq7gurC4BAWlzl5m/P6Ay3TdB+ncDavV8BGAeIHM3E9NH9ZTsEsRAhgw1IZ/CphCUY0QDUOM0BfK2N8l66gOPvQb55boLMz3CJKVyFSAZuUwv5JazpYKldP893yqEnWIxOCX4cH+0pi/xosZmivg0Rj4Dw0rWHTDqmfmgIMBavE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMBuLfPC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-411c93e6bfaso3731465e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 06:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707835888; x=1708440688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KFlMfUZMSlOfch0mB1P3taYHEI/b1w64s+BJxO17GOg=;
        b=mMBuLfPCHOFT/JjAz9B9CKhwhA3zuGMIsva+wqu3S9RdJgXYxS5ONvholypoNpC0g2
         ENRqOe9yxDELKpXlcvDI0QEfWvo9z5wkuhvMNagiWIxrgfTiUPuaTuizMRBa0vWrqQlZ
         qWMSmKScZvqDom7IrBSVoJ/PCN2btLK0zXsYeFdBoTfpCAvuDDm79JSwN+tZOkFKKuFC
         6mIFRbT58iz8so8tPr7/jbKFuE9nfN3sSnBe9sEdxvjD6LwpkkhL9yOehhWQrPYelsrb
         wqj5hUcFVKI0Em+HXnpoiNW2doy3s7ht02QIOp5lGKx4/whnbWTalJtoNld44clCYw13
         qfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707835888; x=1708440688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFlMfUZMSlOfch0mB1P3taYHEI/b1w64s+BJxO17GOg=;
        b=gVGHZOZ/Q/PzkCdHW96sbo8yXtfY8D8qb1YYsh1mUnxDaLNdFSSatdgkoCNa/6w5Ye
         MT84VyEOnumy1CLd7XH2ToOP3KLVIRH9L0KqB948pF9sKRstGNu/Ryxx7ZVLVxpJKuS+
         cyBPUft1NXr3ATDfzCqOBn31KnGI75H3ylDkPerriuwB/INq6+3GoH/BIbiwsmgJHxNV
         OEHTY8Vm8f2RnbwfhlVylopLsKOtu8ZdvmyavCvpwkP9WkRMJfXFBIZpRej2S+b0PtHK
         rWA6M81DdgWeoX9/uaARDtN+kZ/F0OVq46vXlqfv7/ho/POAoBxLdjEBsR9HR+8J5nCE
         P7cQ==
X-Gm-Message-State: AOJu0YydwuXpMhC2vK6sgp1KhaWMyqBhQBXIV8j/H7TP9gYqQb3pM+BI
	/GCdHDPJPIOfEe+LgXIMj3UoR+6Z4NwF1j/Dy0/H5zfkX4BGuhJoLonCjYkNt5M=
X-Google-Smtp-Source: AGHT+IG7qbipOzfN0GaAKzzavKUQTnUDhjMQ8mE2aW71G2tRyaOsLmMsazKoTmXP900rS8DjCIe4qw==
X-Received: by 2002:a5d:5247:0:b0:33b:1b4f:e54 with SMTP id k7-20020a5d5247000000b0033b1b4f0e54mr6814020wrc.34.1707835887638;
        Tue, 13 Feb 2024 06:51:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURT1OpikHg+Iljo6ODVooY8sSqzP43xAH77xi2vJGOyuN1W1G/UIZYH9vDN2lNEhXv/rzOkarthZjMHy438yeHepcnNASSou1pOM+R+l2FuZpYZpDM7GvNsEl1pojhvM8RIYpkRDzFGwLcz97MrnqZKVVJQtQCnt82SVoF3jdNSmdvHcm2wwqlwnlKLrXzVl9lohfCZBwibn/JYxzQv8e/QoRqh4dvGdNbHwaOsrgSjd4mZwrtj/5G2ghiGyX8V+qbOXeFCdR2Jk3KpFVhyEdb6UEl/CFXjLd0apQ3ufmZH0080uHrfroODZYPJA==
Received: from krzk-bin.. ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id bs25-20020a056000071900b0033b406bc689sm9806957wrb.75.2024.02.13.06.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:51:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: replace underscores in node names
Date: Tue, 13 Feb 2024 15:51:24 +0100
Message-Id: <20240213145124.342514-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Underscores should not be used in node names (dtc with W=2 warns about
them), so replace them with hyphens.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  2 +-
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |  2 +-
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     |  2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  4 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  4 ++--
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  2 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |  2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  4 ++--
 arch/arm64/boot/dts/qcom/sm6115.dtsi               | 14 +++++++-------
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 +++++-----
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  6 +++---
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  4 ++--
 15 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 48c8601ff7b7..dd45975682b2 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -2472,7 +2472,7 @@ gpu_alert0: trip-point0 {
 					type = "passive";
 				};
 
-				gpu_crit: gpu_crit {
+				gpu_crit: gpu-crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";
diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index cbc84459a5ae..10cd244dea4f 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -377,7 +377,7 @@ &blsp1_uart2 {
 &blsp2_i2c1 {
 	status = "okay";
 
-	sideinteraction: ad7147_captouch@2c {
+	sideinteraction: touch@2c {
 		compatible = "ad,ad7147_captouch";
 		reg = <0x2c>;
 
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 9dbde79f26a2..0163d41f95f8 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -79,7 +79,7 @@ ramoops@1fe00000 {
 			pmsg-size = <0x80000>;
 		};
 
-		fb_region: fb_region@40000000 {
+		fb_region: fb@40000000 {
 			reg = <0 0x40000000 0 0x1000000>;
 			no-map;
 		};
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 8295bf1b219d..695e541832ad 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -233,7 +233,7 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		dfps_data_mem: dfps_data_mem@3400000 {
+		dfps_data_mem: dfps-data@3400000 {
 			reg = <0 0x03400000 0 0x1000>;
 			no-map;
 		};
@@ -243,7 +243,7 @@ cont_splash_mem: memory@3401000 {
 			no-map;
 		};
 
-		smem_mem: smem_region@6a00000 {
+		smem_mem: smem@6a00000 {
 			reg = <0 0x06a00000 0 0x200000>;
 			no-map;
 		};
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index a691913b78a0..f034985d2747 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -782,12 +782,12 @@ qfprom@74000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			qusb2p_hstx_trim: hstx_trim@24e {
+			qusb2p_hstx_trim: hstx-trim@24e {
 				reg = <0x24e 0x2>;
 				bits = <5 4>;
 			};
 
-			qusb2s_hstx_trim: hstx_trim@24f {
+			qusb2s_hstx_trim: hstx-trim@24f {
 				reg = <0x24f 0x1>;
 				bits = <1 4>;
 			};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index acf145d1d97c..66ca7bb7eb58 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -115,7 +115,7 @@ qtee_mem: qtee@c1300000 {
 			no-map;
 		};
 
-		trusted_apps_mem: trusted_apps@c1800000 {
+		trusted_apps_mem: trusted-apps@c1800000 {
 			reg = <0x0 0xc1800000 0x0 0x1c00000>;
 			no-map;
 		};
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 8bb7d13d85f6..30657d6fd539 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -110,7 +110,7 @@ qtee_mem: qtee@c1300000 {
 			no-map;
 		};
 
-		trusted_apps_mem: trusted_apps@c1800000 {
+		trusted_apps_mem: trusted-apps@c1800000 {
 			reg = <0x0 0xc1800000 0x0 0x1c00000>;
 			no-map;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index ed2e54988daf..2b481e20ae38 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -817,7 +817,7 @@ qusb2p_hstx_trim: hstx-trim-primary@25b {
 				bits = <1 3>;
 			};
 
-			gpu_speed_bin: gpu_speed_bin@1d2 {
+			gpu_speed_bin: gpu-speed-bin@1d2 {
 				reg = <0x1d2 0x2>;
 				bits = <5 8>;
 			};
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 581818676a4c..2f2e32a5ebd7 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -980,7 +980,7 @@ qfprom: efuse@784000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			gpu_speed_bin: gpu_speed_bin@1e9 {
+			gpu_speed_bin: gpu-speed-bin@1e9 {
 				reg = <0x1e9 0x2>;
 				bits = <5 8>;
 			};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index fbb8655653fb..486ce175e6bc 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -60,7 +60,7 @@ key-vol-up {
 	};
 
 	reserved-memory {
-		framebuffer_region@9d400000 {
+		framebuffer@9d400000 {
 			reg = <0x0 0x9d400000 0x0 (1080 * 2160 * 4)>;
 			no-map;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d655bf5bdb96..df0152a1279d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5579,7 +5579,7 @@ cluster0_alert0: trip-point0 {
 					hysteresis = <2000>;
 					type = "hot";
 				};
-				cluster0_crit: cluster0_crit {
+				cluster0_crit: cluster0-crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -5599,7 +5599,7 @@ cluster1_alert0: trip-point0 {
 					hysteresis = <2000>;
 					type = "hot";
 				};
-				cluster1_crit: cluster1_crit {
+				cluster1_crit: cluster1-crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index c944be23866d..6cd86a833234 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -3106,7 +3106,7 @@ cpu4_alert1: trip-point1 {
 					type = "passive";
 				};
 
-				cpu4_crit: cpu_crit {
+				cpu4_crit: cpu-crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "critical";
@@ -3132,7 +3132,7 @@ cpu5_alert1: trip-point1 {
 					type = "passive";
 				};
 
-				cpu5_crit: cpu_crit {
+				cpu5_crit: cpu-crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "critical";
@@ -3158,7 +3158,7 @@ cpu6_alert1: trip-point1 {
 					type = "passive";
 				};
 
-				cpu6_crit: cpu_crit {
+				cpu6_crit: cpu-crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "critical";
@@ -3184,7 +3184,7 @@ cpu7_alert1: trip-point1 {
 					type = "passive";
 				};
 
-				cpu7_crit: cpu_crit {
+				cpu7_crit: cpu-crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "critical";
@@ -3210,7 +3210,7 @@ cpu45_alert1: trip-point1 {
 					type = "passive";
 				};
 
-				cpu45_crit: cpu_crit {
+				cpu45_crit: cpu-crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "critical";
@@ -3236,7 +3236,7 @@ cpu67_alert1: trip-point1 {
 					type = "passive";
 				};
 
-				cpu67_crit: cpu_crit {
+				cpu67_crit: cpu-crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "critical";
@@ -3262,7 +3262,7 @@ cpu0123_alert1: trip-point1 {
 					type = "passive";
 				};
 
-				cpu0123_crit: cpu_crit {
+				cpu0123_crit: cpu-crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "critical";
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index eb1acea2631b..e393bf6eea75 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -967,7 +967,7 @@ qfprom: efuse@784000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			gpu_speed_bin: gpu_speed_bin@133 {
+			gpu_speed_bin: gpu-speed-bin@133 {
 				reg = <0x133 0x1>;
 				bits = <5 3>;
 			};
@@ -2463,7 +2463,7 @@ qup_i2c6_default: qup-i2c6-default-state {
 				bias-disable;
 			};
 
-			qup_spi6_default: qup-spi6_default-state {
+			qup_spi6_default: qup-spi6-default-state {
 				pins = "gpio4", "gpio5", "gpio6", "gpio7";
 				function = "qup6";
 				drive-strength = <6>;
@@ -2477,7 +2477,7 @@ qup_i2c7_default: qup-i2c7-default-state {
 				bias-disable;
 			};
 
-			qup_spi7_default: qup-spi7_default-state {
+			qup_spi7_default: qup-spi7-default-state {
 				pins = "gpio98", "gpio99", "gpio100", "gpio101";
 				function = "qup7";
 				drive-strength = <6>;
@@ -5110,7 +5110,7 @@ cluster0_alert0: trip-point0 {
 					hysteresis = <2000>;
 					type = "hot";
 				};
-				cluster0_crit: cluster0_crit {
+				cluster0_crit: cluster0-crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -5130,7 +5130,7 @@ cluster1_alert0: trip-point0 {
 					hysteresis = <2000>;
 					type = "hot";
 				};
-				cluster1_crit: cluster1_crit {
+				cluster1_crit: cluster1-crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f3c70b87efad..39bd8f0eba1e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -975,7 +975,7 @@ qfprom: efuse@784000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			gpu_speed_bin: gpu_speed_bin@19b {
+			gpu_speed_bin: gpu-speed-bin@19b {
 				reg = <0x19b 0x1>;
 				bits = <5 3>;
 			};
@@ -6798,7 +6798,7 @@ cluster0_alert0: trip-point0 {
 					hysteresis = <2000>;
 					type = "hot";
 				};
-				cluster0_crit: cluster0_crit {
+				cluster0_crit: cluster0-crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -6818,7 +6818,7 @@ cluster1_alert0: trip-point0 {
 					hysteresis = <2000>;
 					type = "hot";
 				};
-				cluster1_crit: cluster1_crit {
+				cluster1_crit: cluster1-crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 65d425f56583..a5e7dbbd8c6c 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -4192,7 +4192,7 @@ cluster0_alert0: trip-point0 {
 					hysteresis = <2000>;
 					type = "hot";
 				};
-				cluster0_crit: cluster0_crit {
+				cluster0_crit: cluster0-crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -4212,7 +4212,7 @@ cluster1_alert0: trip-point0 {
 					hysteresis = <2000>;
 					type = "hot";
 				};
-				cluster1_crit: cluster1_crit {
+				cluster1_crit: cluster1-crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
-- 
2.34.1


