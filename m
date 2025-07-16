Return-Path: <linux-arm-msm+bounces-65260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A37B077BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 16:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 420C34E7221
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF5C225785;
	Wed, 16 Jul 2025 14:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b="pynUwKXm";
	dkim=permerror (0-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b="I4mVNBA0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.adomerle.pw (mail.adomerle.pw [185.125.100.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F29C223DF9;
	Wed, 16 Jul 2025 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.100.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752675268; cv=none; b=tsHWBgJptXTTM5gDPiwy+ofmc8MzRHCmkbOXFmoVhvnvD+j1VwI/ER3FbylIk018702T8R2J1lZztJUwtrDmrL22HH5jd3s8PBouqTTih6GaV3IgxPKCKmZqzevEzlS/QaoxgTidYQRO85GNgkwjCqdYNf8HuQPhziqCEsxuSlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752675268; c=relaxed/simple;
	bh=5X+8WBJw50zH8D1hsjx8xBvVLDthannaM07S5982LnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CvVrLK1ZfUjlWEIQXxzF4xZTkSulm95aAsLohPUO7Uq9UElpx65PZ3wA3mxwS6WhE2DikzfJe1wobz8ZN/05/tRu4eWmSp3qRr9/sdoAorMMt3qTgyJFGyttZ3KCuXwixsUVwkSBZZqGAICE5PcjF4P1lNhW+4PkYx8RMZoQewc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adomerle.pw; spf=pass smtp.mailfrom=adomerle.pw; dkim=pass (2048-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b=pynUwKXm; dkim=permerror (0-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b=I4mVNBA0; arc=none smtp.client-ip=185.125.100.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adomerle.pw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adomerle.pw
DKIM-Signature: v=1; a=rsa-sha256; s=202506r; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1752675257; bh=1x6s/1mHyUizETlrU/CFMpu
	FVZL86A/ukb1jTEaTW0A=; b=pynUwKXmp6O24uUTM9F68A825Hvoyfb9dC320rC5ndxq1sbpVb
	J75eS5IEMTQfvBsOa2t5Y5bqFuroi2YRIF3Fy7VnR2TRfydXpeMqhl9vzsyaJoz0S9Zi5QW37c+
	1DXsWvVKT1fzvgAH7CvWQSSaB2nqq39L/a1DwHHvxCfEEZCiiMPE5+6uokL/u6p7AlEed6WKxri
	gEDiPGdu+5dQI9ssrLpvTEi7L//2STFpvdzfeJ+eoDdMuFqKn5FPeMvEC2k5P6C1YVKjN0nPsM0
	wPvHw8V6HDkN7Gq4y7cNpSQoQ+CniofU0/0k6bbFVoEw9NlT3SDAykm/5plenHkBzfw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202506e; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1752675257; bh=1x6s/1mHyUizETlrU/CFMpu
	FVZL86A/ukb1jTEaTW0A=; b=I4mVNBA0W4FC1T3cqJjyPS7ZZGKWI41RF433Eh8w05ctLH8kbQ
	YiMidKcnuHOi160dpKRad29f2wBDukKKeEAw==;
From: Arseniy Velikanov <me@adomerle.pw>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luka Panio <lukapanio@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Arseniy Velikanov <me@adomerle.pw>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop nonexistent pm8009 pmic
Date: Wed, 16 Jul 2025 18:10:39 +0400
Message-ID: <20250716141041.24507-1-me@adomerle.pw>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PM8009 was erroneously added since this device doesn't actually have it.
It triggers a big critical error at boot, so we're drop it.

Fixes: 264beb3cbd0d ("arm64: dts: qcom: sm8250-xiaomi-pipa: Add initial device tree")
Reviewed-by: Luka Panio <lukapanio@gmail.com>
Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
---
 .../boot/dts/qcom/sm8250-xiaomi-pipa.dts      | 58 -------------------
 1 file changed, 58 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
index 668078ea4f04..a4c8b778ae46 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
@@ -12,7 +12,6 @@
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
 #include "pm8150l.dtsi"
-#include "pm8009.dtsi"
 
 /*
  * Delete following upstream (sm8250.dtsi) reserved
@@ -406,63 +405,6 @@ vreg_l11c_3p0: ldo11 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
-
-	regulators-2 {
-		compatible = "qcom,pm8009-rpmh-regulators";
-		qcom,pmic-id = "f";
-
-		vdd-s1-supply = <&vph_pwr>;
-		vdd-s2-supply = <&vreg_bob>;
-		vdd-l2-supply = <&vreg_s8c_1p35>;
-		vdd-l5-l6-supply = <&vreg_bob>;
-		vdd-l7-supply = <&vreg_s4a_1p8>;
-
-		vreg_s1f_1p2: smps1 {
-			regulator-name = "vreg_s1f_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1300000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s2f_0p5: smps2 {
-			regulator-name = "vreg_s2f_0p5";
-			regulator-min-microvolt = <512000>;
-			regulator-max-microvolt = <1100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		/* L1 is unused. */
-
-		vreg_l2f_1p3: ldo2 {
-			regulator-name = "vreg_l2f_1p3";
-			regulator-min-microvolt = <1056000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		/* L3 & L4 are unused. */
-
-		vreg_l5f_2p8: ldo5 {
-			regulator-name = "vreg_l5f_2p85";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l6f_2p8: ldo6 {
-			regulator-name = "vreg_l6f_2p8";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7f_1p8: ldo7 {
-			regulator-name = "vreg_l7f_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
 };
 
 &cdsp {
-- 
2.50.0


