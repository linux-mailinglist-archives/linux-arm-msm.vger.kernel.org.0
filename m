Return-Path: <linux-arm-msm+bounces-49601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D852A473C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ABAB3A7178
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 03:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD1D1E834E;
	Thu, 27 Feb 2025 03:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCH95Ooc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6931E5207;
	Thu, 27 Feb 2025 03:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740628248; cv=none; b=pb1ZKY+R/4Vgthg0dEPYm57/qUGBSat7RmX1pCiNFsZF/7sUVsbnjkKEXLnnLAHiO5K83WpjrHxdzq91ksopuKlPUzUQVL7NQTsM7LCidu79AN+pbHvEhfGxgC6U4AAgkoSUg+FMRjU1FJ7HDGoEol9HLz+enpZ4Xz4xKWq1BAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740628248; c=relaxed/simple;
	bh=fGBjzynimp9j0d+9jry7P0MopbHd4J99afpMGkgey3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6V1G8NaNXGAsINz2BaKm3nFEiKuT39YkrG7SHCrf/YV91LmASUC+ktNwnwGukki716PS54FxQeINJVyX+gf3Fzk71r9zvMx/eWuHrWnRADf5fKd4LBgj8tZDlMXIaSlqGiRnIxUtMjcBff1I87iDyyj/4lW5SSc70VogOwA5us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCH95Ooc; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so1071857a91.1;
        Wed, 26 Feb 2025 19:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740628246; x=1741233046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlnWEUGEm+n8LXRH39PLrCyuuT/vjzyZwYtaczDLRAk=;
        b=DCH95OoceYYF/DAfL7AxOcIY6EMyV09ZRDo+TkJSMMg/qcGS39QQ/OjPLbgBIgEshn
         TnUNVo74lH2t7R1mONX97XxZcPEqDZAHc1q0qyKrjuPoQHY9w72AOyyP/Xb7+gXAG4oK
         ufgbZCbWhZh1w0Fw/pbcfZ/4vt7jDqMbCjkfWjLIbMJaEdciu8W58rszAdjf0SscWyzp
         bcLyO/xG6d1h17APKShovPr3lEuiXikQtUnCyPFSFcCWXFTnAzhMJxD060iVvYu+ayy3
         hNdEYoqacmRrYhgijK6MI8ov7KfnKYj9RZ92NGf0LemBS0ZpC/9Wrlap+mPLjfW9asAF
         VFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740628246; x=1741233046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlnWEUGEm+n8LXRH39PLrCyuuT/vjzyZwYtaczDLRAk=;
        b=VDXr3jWG2MixzNligotxUK1q1VuKe40DH+40IXq36+fGST8B45kfpONQtZNnxhLRM7
         VC2ZgtFKBMFdBiNC9RKzMRuS0Z66RVPjzZDacVfzuV/Uy12/WBR41u0lm6hpHdkEZyU3
         9jgN0ithiUAO1wULiMPcaJ1zhaVt921G7DEUGBJq8m8Oupyih5ncfxi5z5YQg3fCF41V
         fJ8aesVoZ8SX9FJF+5AnMJfL0J415dW56xy8d1O6FmpnhU+nhPLUjBwMl17gbKLgnnVr
         ayiqxYHBnfJl1YiZe9STaF1ViMqiVHPlriYjTSl/wGqwV3umouoPfPrNoClqJMY10k0g
         xlOA==
X-Forwarded-Encrypted: i=1; AJvYcCVVYgqdFuPqAr3STgdJCp8ySfPDN/WTEfggQnJhODlTJ06iQU1dQ7RFwfcOih48fvXAxb/MWw6jG7VW3SRX@vger.kernel.org, AJvYcCW50FHlLvAKiWO3WOqZcZnOwYx2BM/W3Cb4cMSdozigbuoehGjMdi2pzQ8Jqja9z11SJNCy+wyncNMm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy77yF3cxPQtrRv8iD1O/4ZETOqyCG331pUhlpdRgd1qOuYvqU1
	CkjgBSRsQ6dRWpQCSxnDvpvyDiH6jD7KgByEMkiiwF2Fb6kD/4CP
X-Gm-Gg: ASbGncsTndtUpENZWK/OkRyW9nl63Ud+8GonRPteKLoPUtG41xA3rjrFO9lvSYVFllw
	nLtsuMJzVPmxzbCd0ewIy+XCaqP+B2dIr5bNeJs29k4DG80ECTipaYZrDEibFjhgZLfZJEoV/4c
	MXy90Gj8Bl47+Ga3rOD10ztCnuvqf4dgywqHYa7sZj8lIpg6KrTnZHBvD0dnDMR7taDYIDgGZfu
	Gqb4i9wxbEMReP/dTvgV0Uql10HgmzIIhsOQozKkGR8BYXaJW3sWuGsNLSkXrybpobVmNqsSjUZ
	tVC7pLRudMiTCv2d1Wt4bgYVL9c=
X-Google-Smtp-Source: AGHT+IHXiwbRiZOVAnvaABIIc3cDY6mT/UH7yyLYc0onq2XWwyYJWlZZ8KOTGedk4icAmJDVize5ig==
X-Received: by 2002:a17:90b:3141:b0:2fe:a292:793 with SMTP id 98e67ed59e1d1-2fea29208a0mr2244182a91.21.1740628246034;
        Wed, 26 Feb 2025 19:50:46 -0800 (PST)
Received: from [127.0.1.1] ([2601:644:8501:1640:6614:eaf8:94e4:479f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea67a7ddesm411530a91.27.2025.02.26.19.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 19:50:45 -0800 (PST)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Wed, 26 Feb 2025 19:50:42 -0800
Subject: [PATCH v3 2/2] ARM: dts: qcom: msm8960: Add tsens
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-expressatt-tsens-v3-2-bbf898dbec52@gmail.com>
References: <20250226-expressatt-tsens-v3-0-bbf898dbec52@gmail.com>
In-Reply-To: <20250226-expressatt-tsens-v3-0-bbf898dbec52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wctrl@proton.me, 
 Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740628242; l=2820;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=fGBjzynimp9j0d+9jry7P0MopbHd4J99afpMGkgey3I=;
 b=w+GypfDFUJeS+SyNIJuQG58/ZbG/9xlj2x0gbap9tyRAc6CJYzU4LoQDM+hlPjbBdl4JEmDAZ
 YoRKeRfMr7EDC19wQbNbyKAUVK3bXi/BCt8sB7GFP4MfqOy5ra3NbDS
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Copy tsens node from apq8064 and adjust these values:
- thermal-zones
  - adjust thermal-sensors
  - delete coefficients
  - trips
    - copy temperature and hystersis from downstream
    - delete cpu_crit
- qfprom
  - adjust compatible
- gcc
  - add syscon to compatible
  - tsens
    - change qcom,sensors to 5

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 59 +++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 865fe7cc39511d7cb9ec5c4b12100404f77e2989..155d6aba61e390dabca6b72160543b5aa134b219 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -52,6 +52,36 @@ memory@80000000 {
 		reg = <0x80000000 0>;
 	};
 
+	thermal-zones {
+		cpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 0>;
+
+			trips {
+				cpu_alert0: trip0 {
+					temperature = <60000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 1>;
+
+			trips {
+				cpu_alert1: trip0 {
+					temperature = <60000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	cpu-pmu {
 		compatible = "qcom,krait-pmu";
 		interrupts = <GIC_PPI 10 0x304>;
@@ -115,6 +145,21 @@ timer@200a000 {
 			cpu-offset = <0x80000>;
 		};
 
+		qfprom: efuse@700000 {
+			compatible = "qcom,msm8960-qfprom", "qcom,qfprom";
+			reg = <0x00700000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			tsens_calib: calib@404 {
+				reg = <0x404 0x10>;
+			};
+
+			tsens_backup: backup-calib@414 {
+				reg = <0x414 0x10>;
+			};
+		};
+
 		msmgpio: pinctrl@800000 {
 			compatible = "qcom,msm8960-pinctrl";
 			gpio-controller;
@@ -127,7 +172,7 @@ msmgpio: pinctrl@800000 {
 		};
 
 		gcc: clock-controller@900000 {
-			compatible = "qcom,gcc-msm8960";
+			compatible = "qcom,gcc-msm8960", "syscon";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
@@ -135,6 +180,18 @@ gcc: clock-controller@900000 {
 				 <&pxo_board>,
 				 <&lcc PLL4>;
 			clock-names = "cxo", "pxo", "pll4";
+
+			tsens: thermal-sensor {
+				compatible = "qcom,msm8960-tsens";
+
+				nvmem-cells = <&tsens_calib>, <&tsens_backup>;
+				nvmem-cell-names = "calib", "calib_backup";
+				interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "uplow";
+
+				#qcom,sensors = <5>;
+				#thermal-sensor-cells = <1>;
+			};
 		};
 
 		lcc: clock-controller@28000000 {

-- 
2.45.2


