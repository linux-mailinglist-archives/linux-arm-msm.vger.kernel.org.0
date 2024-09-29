Return-Path: <linux-arm-msm+bounces-32719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 740E3989522
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 13:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A54801C21CE1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 11:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3095C175D32;
	Sun, 29 Sep 2024 11:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cg5eMu9n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E85184D;
	Sun, 29 Sep 2024 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727609340; cv=none; b=pqC20I3ubwsVhOQ4/i4BZBcKojvCko3TCmeR+T5uFUMsi0sxN73CwhyWx/CGaXIa52bSG1jy1+oJksyukBaP2oqN5Lw4c/swZ3V+OVzLxeMVqjwRlpFDO11CHcUzoTRkrHYcagQ/CLFsxkyXUgGDTV0YPpyHjJvTLnNkjdHcL5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727609340; c=relaxed/simple;
	bh=JNAZCyEX3BhFghe9HffmUqq42YsWRLM8vP+pVw0J1V4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BKGnjIr8Z/HjoTZCr9ayw2RoFopsKm4Ww3g3f0UT5deu64I1TA7v3N5CzU6587e67wviOBv2hvMG7bbtFdFND2055cIzvzxjh/NNkcYEbELXXl5KbSxtMo9KLNYFfLUo7YDWHqsYunfulK96gXGoDgsBS/95+RxjEEwaBAbomSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cg5eMu9n; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e09f67bc39so2739155a91.1;
        Sun, 29 Sep 2024 04:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727609338; x=1728214138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nmcZ8drbPqDbSDvVJmNI9ULgwGp9QCTBmDyVE02exxo=;
        b=cg5eMu9nMhE0V5HwjwelIG4zvwDrLFnlbFKgPN+aZWERUPYb9D2x5zC2vVOKnDw+NB
         u5PSIIn+m6LRkPa7ZFAm+hhYORvzkN1tfc+YYFeHnf9eGfJcBXLDAdAj7QTfDStcPoEK
         mZ1ETDczX3j9+7xEICGtlNjY4Nk69ja+LxjRaPwmKPnrTmfMxvXi/64m4vDKSERv2d1q
         JpLoQPItwEERM342tn9s1wV690lIDhy+Nrsr0D5kzW4rTBdGOL0u989CEX5qtVR/AbPN
         vU1Lqki33WLorKwCYgKNUskxukr0KvOMBPPybdf8Ab8Pc9YCgvf3Ex9EgMBhoTdGHcrH
         7tPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727609338; x=1728214138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmcZ8drbPqDbSDvVJmNI9ULgwGp9QCTBmDyVE02exxo=;
        b=jrN7x166vWhoRHUd92yPOQ3uqHy1d4VA2rcFGvuwAh35usoV3GC+er82kD1wQmOq2m
         wkLYNkuCR6TZs/Ztlr9qAbL1AAccacyBdPJFodFj2hrV5/sexJk01xbFTu+4BexHUbvq
         L16BGtlrF6QFXLSjZRp72tEcwy9fyriw0k/haKYJWiDrb/vxsUoJg9DJO3J0j7DvTFUV
         LjTJ2/Ehau2uvWsUzN+0vMReqQ0Get5xbneZp53D3hXZLUdflZuOkcIocAjcBMBS0KgX
         4LxSi1G5lXvGAM332IaZ+TmhvmVFOvhi75ydE9OHzVOAlrcIl5hFmbK+OssnLwFTTkue
         V+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW71BG2hdHALPPX9sOnnHBeQc8bz3peEMxIprUerSy2G4E3LjFul6h0uP7/mLNsOrafgPT5ij4uGXpv8sur@vger.kernel.org, AJvYcCWG3KVKr/6pmaaFdII4xMfrGYbupu5psNpv4pTBH2DGu2p3j5TfBy8WvyayHCPYTnal2vh62e6VuoyZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzM1+qki2zU5TgaQ+U3mgEFWDf+Me1eko6HOCV1iFeas7ZjNdB/
	0dAwsYOZ0GYnBtwxTPGle6KRVW3p130185uMdT866f3eTREmj2tJo+FnyjT6
X-Google-Smtp-Source: AGHT+IHToVi7fP3sKigb3Ul64vS2bGtFIww0i14w9Y2XzwbcL0+NM/t4kyPzNbnA6BrR+jtfEyAo5g==
X-Received: by 2002:a17:90a:69e4:b0:2c9:81fd:4c27 with SMTP id 98e67ed59e1d1-2e0b89e218fmr10588352a91.14.1727609337810;
        Sun, 29 Sep 2024 04:28:57 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e11638e859sm893650a91.8.2024.09.29.04.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 04:28:57 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add qca6390-pmu node
Date: Sun, 29 Sep 2024 19:29:06 +0800
Message-ID: <20240929112908.99612-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add qca6390-pmu node, which is used to manage power supply sequence for wifi and
bluetooth on sm8250 soc based devices.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 3596dd328c31..ebea283f56ea 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -97,6 +97,67 @@ key-vol-up {
 		};
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s6a_0p95>;
+		vddrfa0p95-supply = <&vreg_s6a_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p35>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p35>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
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
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
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
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -701,6 +762,22 @@ &slpi {
 
 &tlmm {
 	gpio-reserved-ranges = <40 4>;
+
+	bt_en_state: bt-default-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-up;
+	};
+
+	wlan_en_state: wlan-default-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-up;
+	};
 };
 
 &usb_1 {
-- 
2.46.0


