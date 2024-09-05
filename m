Return-Path: <linux-arm-msm+bounces-30973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA2296DEC6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 17:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53D59B21FAF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 15:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E468319FA87;
	Thu,  5 Sep 2024 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yICNg+aS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8586119DF4D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725551231; cv=none; b=bIZtL59i0GFnaQrqUOucvPVbLoXyxUS8QkcrVkXjYICevL1h/4FALPHpl0mDFkfWokMAaFAc7bhsGxSDm4VWc+bsH9JfvnfTihByvOyNyAxUvbtGwfcJXOMhxG4QM3aoHgNv3/Hjsm72nMBulOhqwrP4goVTFO3D1syKs2QQNlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725551231; c=relaxed/simple;
	bh=SFT/nJann8rdxn/hILPvcvxlt3qsUAXfXZOBk6RXjX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R503Z11X6dztpy+QQeLgQUhSzhBKXJyX5g9mkoQ9QqgWggckaFPddxRAvMNneFZwEqVqO10/HHmsiiIupVWzp83O2PM/onj4+d3DvyDhAUqD3RsF8+jf2IqMsbtZhe/O8TrJu2neTt9sQqqmBqYDXvuxJiORSAjEqOSL83zR1Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yICNg+aS; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c24648e280so119328a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725551227; x=1726156027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PSApTwt9HBMwZ0hJw81jWIbJ3SNzZJFU5zBwsWl9ew=;
        b=yICNg+aSlGEh3c1uy3/jGv4NWr93gDJYv5JYu275zPgj5+30khiR1IixuDGXKOuCk3
         GXxa7m1WgIUWGtyg9dyye8zLfPYuHGzIltd/s48zkUZC7fQkSmZFB04pR5d3v5bskyo6
         giHg4vHYZ/8hf4QVTbVB02FfmZce4MSz830OPYmuoQVBbAoviKpfSAqjEyFCIN7p4usx
         teuxz3xMQ7eLDdP2oKMnJIFKP+TGkipihzyJM8Bprwb9mTquUxBMX3ozKa7k3PwYE89W
         ra8wGpxU6Wv+Tc/vEsFjQQ820OIthqFzD01LH4MtekHWKXBr5LobmxkeO6r/wcKgy5hq
         lDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725551227; x=1726156027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PSApTwt9HBMwZ0hJw81jWIbJ3SNzZJFU5zBwsWl9ew=;
        b=KoyxQ/lkSEZjVd12KyNTXpUOaqy0GWlJ0r5xEGPgZ0e1dVrY9Jw2K7TrHdCw0M8a+H
         gugYhGSAoI1It0bOgKKL/x6WFjsMmlSXCEj5MFNY4/W4OGg0WXBJq5DkzQ/qqRZLqvHp
         OGomFqjL+xuRlE3B5qOxu9sJYgKiZRuZBz6k8ACo6ehk865a0SrF2CwjRiC+m5b7UxZc
         D6A/VDN7zrk5uY9nAGlwXhI1UlR5b04YlBMdDh5NwGTCGDA0LcfBnuEl4xmHK9LOaO2Y
         j0tSEijDhDZN4kSCYYMEY6A4fcZ5VUNynIKOJSDT45I4k/hHZH/VVKBayc+OSEncr1l7
         mifA==
X-Gm-Message-State: AOJu0YyezEfnX1FT7IWGjSeHgNrmbIrSbkme4lpbW/KeC66GI7PciKu1
	bPNbsroINOURHJLACrBsrQOgmn/+jGbKXT5bau6YKiGtk8E2nnGrop2USq5322Y=
X-Google-Smtp-Source: AGHT+IHmmE7fHUT4oEOiZXKUEfMAjqSXd/+PJZyxfO25tQtfbXizk4Tc3RIFSo7mbayDr2KU8gLITQ==
X-Received: by 2002:a05:6402:51c8:b0:5c2:6850:7b2 with SMTP id 4fb4d7f45d1cf-5c268500a02mr4358053a12.6.1725551226833;
        Thu, 05 Sep 2024 08:47:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc6a5a94sm1416858a12.90.2024.09.05.08.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 08:47:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 05 Sep 2024 17:46:53 +0200
Subject: [PATCH 1/4] ARM: dts: qcom: drop underscore in node names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-dts-cleanup-v1-1-f4c5f7b2c8c2@linaro.org>
References: <20240905-dts-cleanup-v1-0-f4c5f7b2c8c2@linaro.org>
In-Reply-To: <20240905-dts-cleanup-v1-0-f4c5f7b2c8c2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11169;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=SFT/nJann8rdxn/hILPvcvxlt3qsUAXfXZOBk6RXjX0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm2dJzKUMtNzURO1+0Zh03pjYeVzrKma3tRIBxI
 UAokJUXYtaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZtnScwAKCRDBN2bmhouD
 1wrJD/sGbKFeuqZfbbU7W/uY9pvaPR5JKbHoFdhHhoSYLs8A2fxnWqlEyKbWrHsHOQUsNoEHRAx
 l0dZfz2g8TFPd9UTCf49irzniTPQ3srumVHHEr2Cb94g1JWNUNompexhnsn6ciqEoqiQn4u2AIY
 1TICmDwLT+feTKeVt7oNPjRjnOyYeT75Ipget3wBed0vEy+M8Mf32EULjKBycTAM+e18gsie8EF
 yibGsV2afT/VFClVwyFY5komADw347FPbz4K/pjRJvnh5Vw+2pJg26QACb5jDSK+WUOBj0TPnI0
 rJJMde6wcf+U/hOTo2kVoLm71jWoUEdZhGdwQzM29JR+A86l2YBtbR/O+0pOpA/Gex/fEsEGDeN
 UcYnUdsZqXWcrwtgPpOLpn/MZ1SqLZsN+GvGQl+TVCLEsiIpVse0cQO7f7OiHviKzFP7rBTnbY+
 TOW6DJ56pOnTxd2Kczl+fCvPCZM/BO9ZHDvgByy+ZrKl0rg3smITaKyB91AODJD2fS4dVB8IR5E
 RNGAcACdDyrSJaNbPBcZNlBEzy3sDpVhsY8KSU2zN7eMjgMH2ezYVRh3P8/b7EOYgE2TVdvd36s
 Ga6RtL2DGvm8apvvHDeQ+kUhzz5DGK6mdj7+iqN9i26DQjdiLYvm19uuiYOCu8saWK8btqWwNZo
 xhC2bYTPWSsm4uA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Underscores should not be used in node names (dtc with W=2 warns about
them), so replace them with hyphens.  Use also generic name for
avago,apds9930 node, because generic naming is favored by Devicetree
spec.

Functional impact checked with comparing before/after DTBs with dtx_diff
and fdtdump.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  2 +-
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi           | 58 +++++++++++-----------
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  2 +-
 .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    |  2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 56 ++++++++++-----------
 5 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index ac7494ed633e..1bc935d90085 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -675,7 +675,7 @@ qfprom: efuse@700000 {
 			tsens_calib: calib@404 {
 				reg = <0x404 0x10>;
 			};
-			tsens_backup: backup_calib@414 {
+			tsens_backup: backup-calib@414 {
 				reg = <0x414 0x10>;
 			};
 		};
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
index 014e6c5ee889..40dbbf8655f0 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
@@ -17,7 +17,7 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
-		smem_mem: smem_region@fa00000 {
+		smem_mem: smem-region@fa00000 {
 			reg = <0xfa00000 0x200000>;
 			no-map;
 		};
@@ -311,7 +311,7 @@ tsens_s9_p1: s9-p1@d8 {
 				bits = <0 6>;
 			};
 
-			tsens_s10_p1: s10_p1@d8 {
+			tsens_s10_p1: s10-p1@d8 {
 				reg = <0xd8 0x2>;
 				bits = <6 6>;
 			};
@@ -371,137 +371,137 @@ tsens_s9_p2: s9-p2@e1 {
 				bits = <4 6>;
 			};
 
-			tsens_s10_p2: s10_p2@e2 {
+			tsens_s10_p2: s10-p2@e2 {
 				reg = <0xe2 0x2>;
 				bits = <2 6>;
 			};
 
-			tsens_s5_p2_backup: s5-p2_backup@e3 {
+			tsens_s5_p2_backup: s5-p2-backup@e3 {
 				reg = <0xe3 0x2>;
 				bits = <0 6>;
 			};
 
-			tsens_mode_backup: mode_backup@e3 {
+			tsens_mode_backup: mode-backup@e3 {
 				reg = <0xe3 0x1>;
 				bits = <6 2>;
 			};
 
-			tsens_s6_p2_backup: s6-p2_backup@e4 {
+			tsens_s6_p2_backup: s6-p2-backup@e4 {
 				reg = <0xe4 0x1>;
 				bits = <0 6>;
 			};
 
-			tsens_s7_p2_backup: s7-p2_backup@e4 {
+			tsens_s7_p2_backup: s7-p2-backup@e4 {
 				reg = <0xe4 0x2>;
 				bits = <6 6>;
 			};
 
-			tsens_s8_p2_backup: s8-p2_backup@e5 {
+			tsens_s8_p2_backup: s8-p2-backup@e5 {
 				reg = <0xe5 0x2>;
 				bits = <4 6>;
 			};
 
-			tsens_s9_p2_backup: s9-p2_backup@e6 {
+			tsens_s9_p2_backup: s9-p2-backup@e6 {
 				reg = <0xe6 0x2>;
 				bits = <2 6>;
 			};
 
-			tsens_s10_p2_backup: s10_p2_backup@e7 {
+			tsens_s10_p2_backup: s10-p2-backup@e7 {
 				reg = <0xe7 0x1>;
 				bits = <0 6>;
 			};
 
-			tsens_base1_backup: base1_backup@440 {
+			tsens_base1_backup: base1-backup@440 {
 				reg = <0x440 0x1>;
 				bits = <0 8>;
 			};
 
-			tsens_s0_p1_backup: s0-p1_backup@441 {
+			tsens_s0_p1_backup: s0-p1-backup@441 {
 				reg = <0x441 0x1>;
 				bits = <0 6>;
 			};
 
-			tsens_s1_p1_backup: s1-p1_backup@442 {
+			tsens_s1_p1_backup: s1-p1-backup@442 {
 				reg = <0x441 0x2>;
 				bits = <6 6>;
 			};
 
-			tsens_s2_p1_backup: s2-p1_backup@442 {
+			tsens_s2_p1_backup: s2-p1-backup@442 {
 				reg = <0x442 0x2>;
 				bits = <4 6>;
 			};
 
-			tsens_s3_p1_backup: s3-p1_backup@443 {
+			tsens_s3_p1_backup: s3-p1-backup@443 {
 				reg = <0x443 0x1>;
 				bits = <2 6>;
 			};
 
-			tsens_s4_p1_backup: s4-p1_backup@444 {
+			tsens_s4_p1_backup: s4-p1-backup@444 {
 				reg = <0x444 0x1>;
 				bits = <0 6>;
 			};
 
-			tsens_s5_p1_backup: s5-p1_backup@444 {
+			tsens_s5_p1_backup: s5-p1-backup@444 {
 				reg = <0x444 0x2>;
 				bits = <6 6>;
 			};
 
-			tsens_s6_p1_backup: s6-p1_backup@445 {
+			tsens_s6_p1_backup: s6-p1-backup@445 {
 				reg = <0x445 0x2>;
 				bits = <4 6>;
 			};
 
-			tsens_s7_p1_backup: s7-p1_backup@446 {
+			tsens_s7_p1_backup: s7-p1-backup@446 {
 				reg = <0x446 0x1>;
 				bits = <2 6>;
 			};
 
-			tsens_use_backup: use_backup@447 {
+			tsens_use_backup: use-backup@447 {
 				reg = <0x447 0x1>;
 				bits = <5 3>;
 			};
 
-			tsens_s8_p1_backup: s8-p1_backup@448 {
+			tsens_s8_p1_backup: s8-p1-backup@448 {
 				reg = <0x448 0x1>;
 				bits = <0 6>;
 			};
 
-			tsens_s9_p1_backup: s9-p1_backup@448 {
+			tsens_s9_p1_backup: s9-p1-backup@448 {
 				reg = <0x448 0x2>;
 				bits = <6 6>;
 			};
 
-			tsens_s10_p1_backup: s10_p1_backup@449 {
+			tsens_s10_p1_backup: s10-p1-backup@449 {
 				reg = <0x449 0x2>;
 				bits = <4 6>;
 			};
 
-			tsens_base2_backup: base2_backup@44a {
+			tsens_base2_backup: base2-backup@44a {
 				reg = <0x44a 0x2>;
 				bits = <2 8>;
 			};
 
-			tsens_s0_p2_backup: s0-p2_backup@44b {
+			tsens_s0_p2_backup: s0-p2-backup@44b {
 				reg = <0x44b 0x3>;
 				bits = <2 6>;
 			};
 
-			tsens_s1_p2_backup: s1-p2_backup@44c {
+			tsens_s1_p2_backup: s1-p2-backup@44c {
 				reg = <0x44c 0x1>;
 				bits = <0 6>;
 			};
 
-			tsens_s2_p2_backup: s2-p2_backup@44c {
+			tsens_s2_p2_backup: s2-p2-backup@44c {
 				reg = <0x44c 0x2>;
 				bits = <6 6>;
 			};
 
-			tsens_s3_p2_backup: s3-p2_backup@44d {
+			tsens_s3_p2_backup: s3-p2-backup@44d {
 				reg = <0x44d 0x2>;
 				bits = <4 6>;
 			};
 
-			tsens_s4_p2_backup: s4-p2_backup@44e {
+			tsens_s4_p2_backup: s4-p2-backup@44e {
 				reg = <0x44e 0x1>;
 				bits = <2 6>;
 			};
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index 759a59c2bdbc..0f02f59c282a 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -383,7 +383,7 @@ speedbin_efuse: speedbin@c0 {
 			tsens_calib: calib@400 {
 				reg = <0x400 0xb>;
 			};
-			tsens_calib_backup: calib_backup@410 {
+			tsens_calib_backup: calib-backup@410 {
 				reg = <0x410 0xb>;
 			};
 		};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
index fdb6e22986cf..261044fdfee8 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -167,7 +167,7 @@ &blsp1_i2c3 {
 	status = "okay";
 	clock-frequency = <100000>;
 
-	avago_apds993@39 {
+	sensor@39 {
 		compatible = "avago,apds9930";
 		reg = <0x39>;
 		interrupts-extended = <&tlmm 61 IRQ_TYPE_EDGE_FALLING>;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 1bd87170252d..742d2104b4fe 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -1299,7 +1299,7 @@ tsens_s9_p1: s9-p1@d8 {
 				bits = <0 6>;
 			};
 
-			tsens_s10_p1: s10_p1@d8 {
+			tsens_s10_p1: s10-p1@d8 {
 				reg = <0xd8 0x2>;
 				bits = <6 6>;
 			};
@@ -1359,137 +1359,137 @@ tsens_s9_p2: s9-p2@e1 {
 				bits = <4 6>;
 			};
 
-			tsens_s10_p2: s10_p2@e2 {
+			tsens_s10_p2: s10-p2@e2 {
 				reg = <0xe2 0x2>;
 				bits = <2 6>;
 			};
 
-			tsens_s5_p2_backup: s5-p2_backup@e3 {
+			tsens_s5_p2_backup: s5-p2-backup@e3 {
 				reg = <0xe3 0x2>;
 				bits = <0 6>;
 			};
 
-			tsens_mode_backup: mode_backup@e3 {
+			tsens_mode_backup: mode-backup@e3 {
 				reg = <0xe3 0x1>;
 				bits = <6 2>;
 			};
 
-			tsens_s6_p2_backup: s6-p2_backup@e4 {
+			tsens_s6_p2_backup: s6-p2-backup@e4 {
 				reg = <0xe4 0x1>;
 				bits = <0 6>;
 			};
 
-			tsens_s7_p2_backup: s7-p2_backup@e4 {
+			tsens_s7_p2_backup: s7-p2-backup@e4 {
 				reg = <0xe4 0x2>;
 				bits = <6 6>;
 			};
 
-			tsens_s8_p2_backup: s8-p2_backup@e5 {
+			tsens_s8_p2_backup: s8-p2-backup@e5 {
 				reg = <0xe5 0x2>;
 				bits = <4 6>;
 			};
 
-			tsens_s9_p2_backup: s9-p2_backup@e6 {
+			tsens_s9_p2_backup: s9-p2-backup@e6 {
 				reg = <0xe6 0x2>;
 				bits = <2 6>;
 			};
 
-			tsens_s10_p2_backup: s10_p2_backup@e7 {
+			tsens_s10_p2_backup: s10-p2-backup@e7 {
 				reg = <0xe7 0x1>;
 				bits = <0 6>;
 			};
 
-			tsens_base1_backup: base1_backup@440 {
+			tsens_base1_backup: base1-backup@440 {
 				reg = <0x440 0x1>;
 				bits = <0 8>;
 			};
 
-			tsens_s0_p1_backup: s0-p1_backup@441 {
+			tsens_s0_p1_backup: s0-p1-backup@441 {
 				reg = <0x441 0x1>;
 				bits = <0 6>;
 			};
 
-			tsens_s1_p1_backup: s1-p1_backup@442 {
+			tsens_s1_p1_backup: s1-p1-backup@442 {
 				reg = <0x441 0x2>;
 				bits = <6 6>;
 			};
 
-			tsens_s2_p1_backup: s2-p1_backup@442 {
+			tsens_s2_p1_backup: s2-p1-backup@442 {
 				reg = <0x442 0x2>;
 				bits = <4 6>;
 			};
 
-			tsens_s3_p1_backup: s3-p1_backup@443 {
+			tsens_s3_p1_backup: s3-p1-backup@443 {
 				reg = <0x443 0x1>;
 				bits = <2 6>;
 			};
 
-			tsens_s4_p1_backup: s4-p1_backup@444 {
+			tsens_s4_p1_backup: s4-p1-backup@444 {
 				reg = <0x444 0x1>;
 				bits = <0 6>;
 			};
 
-			tsens_s5_p1_backup: s5-p1_backup@444 {
+			tsens_s5_p1_backup: s5-p1-backup@444 {
 				reg = <0x444 0x2>;
 				bits = <6 6>;
 			};
 
-			tsens_s6_p1_backup: s6-p1_backup@445 {
+			tsens_s6_p1_backup: s6-p1-backup@445 {
 				reg = <0x445 0x2>;
 				bits = <4 6>;
 			};
 
-			tsens_s7_p1_backup: s7-p1_backup@446 {
+			tsens_s7_p1_backup: s7-p1-backup@446 {
 				reg = <0x446 0x1>;
 				bits = <2 6>;
 			};
 
-			tsens_use_backup: use_backup@447 {
+			tsens_use_backup: use-backup@447 {
 				reg = <0x447 0x1>;
 				bits = <5 3>;
 			};
 
-			tsens_s8_p1_backup: s8-p1_backup@448 {
+			tsens_s8_p1_backup: s8-p1-backup@448 {
 				reg = <0x448 0x1>;
 				bits = <0 6>;
 			};
 
-			tsens_s9_p1_backup: s9-p1_backup@448 {
+			tsens_s9_p1_backup: s9-p1-backup@448 {
 				reg = <0x448 0x2>;
 				bits = <6 6>;
 			};
 
-			tsens_s10_p1_backup: s10_p1_backup@449 {
+			tsens_s10_p1_backup: s10-p1-backup@449 {
 				reg = <0x449 0x2>;
 				bits = <4 6>;
 			};
 
-			tsens_base2_backup: base2_backup@44a {
+			tsens_base2_backup: base2-backup@44a {
 				reg = <0x44a 0x2>;
 				bits = <2 8>;
 			};
 
-			tsens_s0_p2_backup: s0-p2_backup@44b {
+			tsens_s0_p2_backup: s0-p2-backup@44b {
 				reg = <0x44b 0x3>;
 				bits = <2 6>;
 			};
 
-			tsens_s1_p2_backup: s1-p2_backup@44c {
+			tsens_s1_p2_backup: s1-p2-backup@44c {
 				reg = <0x44c 0x1>;
 				bits = <0 6>;
 			};
 
-			tsens_s2_p2_backup: s2-p2_backup@44c {
+			tsens_s2_p2_backup: s2-p2-backup@44c {
 				reg = <0x44c 0x2>;
 				bits = <6 6>;
 			};
 
-			tsens_s3_p2_backup: s3-p2_backup@44d {
+			tsens_s3_p2_backup: s3-p2-backup@44d {
 				reg = <0x44d 0x2>;
 				bits = <4 6>;
 			};
 
-			tsens_s4_p2_backup: s4-p2_backup@44e {
+			tsens_s4_p2_backup: s4-p2-backup@44e {
 				reg = <0x44e 0x1>;
 				bits = <2 6>;
 			};

-- 
2.43.0


