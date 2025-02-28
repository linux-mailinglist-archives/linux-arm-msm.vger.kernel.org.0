Return-Path: <linux-arm-msm+bounces-49777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC94AA48DBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 02:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91FF33B5AED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 01:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E49C13C690;
	Fri, 28 Feb 2025 01:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKurHkeV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF935336D;
	Fri, 28 Feb 2025 01:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740705420; cv=none; b=Ej+rMS2poF+lJ5oE7YfDF/aNhOTCRZK1LGd+pueaBTMvM9HUtgc7WYjBPs+K7+qqkzPmStSfuobdDe9EG5tGFJeQMQCIoSU3x67n7dwKaVnmnkXBTKNc7Q6tCcDs6SBOkVM78jZwdaJYbhGAwF27ZcjvqkhaGT2zLkPR/usLbv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740705420; c=relaxed/simple;
	bh=KywNclbsx3P1rJZTmU++OH7jkZjbxeigp9oH5w5rysg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhQ5pki8fMDKVDUvdYkeOwTTsLas2fYV/PGPeDs3xn+Qd52CNpGt+EQit5tbapQvZ91AVlVvEmbqEapkNFLI//iXRXgKVf5txvOenOGnuxtxKi80qylafNRpRlwuJBdZPCnDGlNO1ug9jQbieJFYiO9Wz2QHK5Zk8dQJPbts40s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKurHkeV; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2234daaf269so42646065ad.3;
        Thu, 27 Feb 2025 17:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740705418; x=1741310218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GHTOGjiLPCGSG61gisxg7Kq1mqgAY6NAuijWlAQ0cg=;
        b=OKurHkeVZ5vletYieok9y5eDYFsI6yV82rkohd8OuV0vAgJ7SdNERNrxxMTfGQzJXe
         PSv9RuJIiLNelbw4oNxpcnYedftQ8bJxxV9VMGjxXFHKYh1d76pBZkn1HpSa18REcDbS
         Q2F6FHkI61iA3j4O935Rayncnz63OTY5yfJzz8b2mEgmXjxNJvj6xAuUGcl4Ww/q8++o
         UGpn/FhjasFac3mE4CPvHyyKkmGZsUVN3IsXay4B0jb4mQaoiRboxwPa2ULM1IP9A1C6
         5qML74SKTnhhPFpsSkwXa5lEtx0MopNPX1nfotSH6EQQn5T1zxfW1q1rNcDbNnwg/5gf
         FboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740705418; x=1741310218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GHTOGjiLPCGSG61gisxg7Kq1mqgAY6NAuijWlAQ0cg=;
        b=BT6xRM3LAmB2T4yq7v2myeq6GDX86gX5nSIfCyDsjNlstW4PCYXsSo+5uTfVlNA+KA
         BEJEd42s5EE5Y4mlzDJkuFWjZ9XjW7VSo/cXoJ9nTl4v8quk1VHrTo4LmKnKakdjaw9Z
         7CoxRMeytiMnYT4vEHhEvp8cCj1V0xdy3ISIjgUr3a3M3k5FgGE1IRRzOxDSn1l/STkq
         4s/OTgUrRHtrtgJMAmj9Vv8t8r95MjkItpu+cpCFsdHiTFYS+Sybo7zdhy3AyxOl0yyb
         0T5YAvahk07F7YbQOYlLWdaqSbKnSpA0xcljEeh5dyofF79IL5HvU2XvigDtCY8wDTUI
         ccDw==
X-Forwarded-Encrypted: i=1; AJvYcCWfLdcRwyGIIw+UzcwIwHCP32mk75ehv0/WPDnwpi6JJZ4kw0QijrcL8abnv2tOzcG0sH0sbiynIFVjY7w0@vger.kernel.org, AJvYcCXzmUBvA9HNeUvr4oViEfIp8yDW2OqlK9SBsOsRuyGSsGpRhkM6sn4xNgb+GQqwYqr24BZ0lI53XW8Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxOcgByj1yORyf/Zk+x5S+vSEMNlEU6YW3cpAG0EY7RYXdrhssu
	gMNRwozrZ8E5B826HhslOmSRSWenv0NzhTwlRBMBxUB+PHiIT6kG
X-Gm-Gg: ASbGncvt7FWWsv8Eo81qvvYbY2M3PJyi/IWok1VaWNZtuTZCz2tE1Opj3kTMDnitK9e
	gpXdaRUinYkZcp/bktvyHJvanzICuUudH9e6hsYTMOt47RKYYaJZfU/Ovw5TVvARLR/wUHpFo1l
	zrgXZajFgEIirTqmnG5S/4SbaXU9e8EbnednMIH4a5a//Sp2ZD6kA3lxqdotQ3svGVaQ61vbu1g
	f24h61pHiRL9e0zk1hJ0N6Lb4IWYvJ54yBQDjl/NwWAyUjC8d6RjDCQnjC1gB/yLAukKpK8KmPw
	cy2jkKtkLlA5c3WqnJhk/Yp1+rI=
X-Google-Smtp-Source: AGHT+IFB6xo01FXHSFc8agESkVZNPDhrrbeoRS3r08zqprHiCJDck21sFGdss2t6B9WfyLFzXyy5Jg==
X-Received: by 2002:a05:6a00:2ea1:b0:732:6248:ff73 with SMTP id d2e1a72fcca58-734ac33c21emr2813685b3a.3.1740705418211;
        Thu, 27 Feb 2025 17:16:58 -0800 (PST)
Received: from [127.0.1.1] ([2601:644:8501:1640:aece:4d21:7e89:e9e0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe4ce55sm2535901b3a.68.2025.02.27.17.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 17:16:57 -0800 (PST)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Thu, 27 Feb 2025 17:16:55 -0800
Subject: [PATCH v4 2/2] ARM: dts: qcom: msm8960: Add thermal sensor (tsens)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-expressatt-tsens-v4-2-d70afa5a1fd0@gmail.com>
References: <20250227-expressatt-tsens-v4-0-d70afa5a1fd0@gmail.com>
In-Reply-To: <20250227-expressatt-tsens-v4-0-d70afa5a1fd0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wctrl@proton.me, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740705413; l=2968;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=KywNclbsx3P1rJZTmU++OH7jkZjbxeigp9oH5w5rysg=;
 b=IeVjVAEvAAlwRI4+LXMPWSlwaASEf8U7cAq1FzPOWa56tZ9kIx6aglz/LylDN6lh4AbYQxd8X
 I+tn57zWdFcDswLx5LSgPDGnXprV0+v4fdQTv1FKM+hkQlx9h+gdjz8
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Add support for the thermal sensor (tsens) on the MSM8960 by copying and
modifying the relevant nodes from the APQ8064 dtsi. These changes enable
thermal management.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 71 +++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 865fe7cc39511d7cb9ec5c4b12100404f77e2989..be4a60119e1d85e02080a7aaf18b1e9f1176e56e 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -52,6 +52,48 @@ memory@80000000 {
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
+
+				cpu_crit0: trip1 {
+					temperature = <95000>;
+					hysteresis = <10000>;
+					type = "critical";
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
+
+				cpu_crit1: trip1 {
+					temperature = <95000>;
+					hysteresis = <10000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	cpu-pmu {
 		compatible = "qcom,krait-pmu";
 		interrupts = <GIC_PPI 10 0x304>;
@@ -115,6 +157,21 @@ timer@200a000 {
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
@@ -127,7 +184,7 @@ msmgpio: pinctrl@800000 {
 		};
 
 		gcc: clock-controller@900000 {
-			compatible = "qcom,gcc-msm8960";
+			compatible = "qcom,gcc-msm8960", "syscon";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
@@ -135,6 +192,18 @@ gcc: clock-controller@900000 {
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


