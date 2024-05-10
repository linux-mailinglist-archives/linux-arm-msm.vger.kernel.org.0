Return-Path: <linux-arm-msm+bounces-19682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4E98C2476
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4F8C288E6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD941181B8C;
	Fri, 10 May 2024 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IKAEE2D8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0C8181312
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342419; cv=none; b=vF5O14o/AEOQqExJyovG2QZPhHRYi+RrRZcxVCmfvBlgJem4ucj7t6NQIb2reWBoW0umCA0oTy0A9O3GFnPwP8HTNWefzc1hfHT/HTw9ap2VFSFInd91siZs1DCt+5puH461d1sl3EW+8Oqml+D2AErEyzuViVx0e7XNN757LKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342419; c=relaxed/simple;
	bh=RpnPX6L5xT+g4Ua7kreea8uTdb2RCBo6JonTQuVdkhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I63vvhoEi4OH+od4SJxwXG9gLD7nK6XyIwHq/8w46KHnXG/sD9ykW0ET1KRlKRGFc+e01JFBKlhXS7rhNjHMxE9/iN599MNiGYBdr2XLZXlaI9afCgTersCLtHhPyGkU9BPoNHpuSmj1PAZi2rIfLomWhzScAxxXPCZjIRoQYMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IKAEE2D8; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59cc765c29so433352666b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342416; x=1715947216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVSziX7FJBjNCJO0YzAuPmmm9IFVtBI4omoARShpTks=;
        b=IKAEE2D8kWcOjv3Takcf5ZopJC1fPcR/zB0RSoFzCDwEX3ZoAdIYBo2/JbPXhFX6y7
         JHCYFPk8rA5juvgQgtyDWn7hUNUqHoPptEZ4t/m0jOVSz//rd65xmoOvSAuAGLYK+8NK
         MyxjfgDEx/Wkf2cj1JvQHxXzKuvyyS8xG5Prsdft4HqAtRdwQ+xkpwT1IyAX+1rWELoa
         QkYI01TKcEKgWMrNT8zqCfgKesyGGghSisa1n0OyuzEj5hyzjojjyeCTu1c+p0muyB5y
         /n/Te3Z8NhoBmxUiUC/H3S9L8SDxPKTPu+7UAsUlF5QRJjnmLdJ2ognOGt/jht0LRdGM
         2QKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342416; x=1715947216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVSziX7FJBjNCJO0YzAuPmmm9IFVtBI4omoARShpTks=;
        b=PNBMEU6dmDuBUpSwVBIVI0xIo/76EyEyEQ/IBj5L8aMpNSjk7SC7TkuwY7qEQtcS3g
         6XDxscseqOR94D3OPflyXgPREgKJ+AgpldL9zGz4+M2qhcVSk153UjLsFZ0M7LbfVA0s
         illeWI9FaF3lLkeihtCzmHZyAdXbplHGU0AEcq75ceZSh54Utc0zGiHNyvYJTFfCoOHb
         /CJQmzpsJYRAI/Xo/wV6UnqPLOwA7zrDJw8M9J9v57NHisg1MT0A/dKcO0YyYHfbtug0
         SK0bE1PTH1O3CoiusKBVnVvdEPfwGwA2rnjep3M+FLrWEZGu0N2EY2UwhhFbxxjkTCqZ
         WTeg==
X-Gm-Message-State: AOJu0YzHrLU7Szoj1u9gs1/uypCoKRoV3StyXD+ERHohE9LDF9z7g8I2
	djYkuEtr8LMrmIumD2jMK1mBV1ZpiRorH/kAI3B3sfFSItRLhgoEDq98E+XI7QI=
X-Google-Smtp-Source: AGHT+IH56uY1KTjaLHcIdfy5rNaclBoelCruvhUB0dsKKyrzE5fGplNMhBXktXc3gGc8I+vOXPmrCQ==
X-Received: by 2002:a17:907:76d3:b0:a59:c7d7:8b0f with SMTP id a640c23a62f3a-a5a2d57a717mr161064366b.29.1715342416263;
        Fri, 10 May 2024 05:00:16 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.05.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:00:15 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:53 +0200
Subject: [PATCH v2 30/31] arm64: dts: qcom: sm8550-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-30-436ca4218da2@linaro.org>
References: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
In-Reply-To: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

All of the thermal zone suppliers are interrupt-driven, remove the
bogus and unnecessary polling that only wastes CPU time.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8010.dtsi    |  2 -
 arch/arm64/boot/dts/qcom/pm8550.dtsi    |  1 -
 arch/arm64/boot/dts/qcom/pm8550b.dtsi   |  1 -
 arch/arm64/boot/dts/qcom/pm8550ve.dtsi  |  1 -
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi  |  4 --
 arch/arm64/boot/dts/qcom/pmr735d_a.dtsi |  1 -
 arch/arm64/boot/dts/qcom/pmr735d_b.dtsi |  1 -
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 82 ++++++---------------------------
 8 files changed, 13 insertions(+), 80 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8010.dtsi b/arch/arm64/boot/dts/qcom/pm8010.dtsi
index 0ea641e12209..ef330194946b 100644
--- a/arch/arm64/boot/dts/qcom/pm8010.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8010.dtsi
@@ -10,7 +10,6 @@ / {
 	thermal-zones {
 		pm8010-m-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pm8010_m_temp_alarm>;
 
@@ -31,7 +30,6 @@ trip1 {
 
 		pm8010-n-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pm8010_n_temp_alarm>;
 
diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 797a18c249a4..896bcacb6490 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -10,7 +10,6 @@ / {
 	thermal-zones {
 		pm8550-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pm8550_temp_alarm>;
 
diff --git a/arch/arm64/boot/dts/qcom/pm8550b.dtsi b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
index 72609f31c890..74d23b8970f4 100644
--- a/arch/arm64/boot/dts/qcom/pm8550b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
@@ -10,7 +10,6 @@ / {
 	thermal-zones {
 		pm8550b-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pm8550b_temp_alarm>;
 
diff --git a/arch/arm64/boot/dts/qcom/pm8550ve.dtsi b/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
index 4dc1f03ab2c7..9d4734eabf5a 100644
--- a/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
@@ -10,7 +10,6 @@ / {
 	thermal-zones {
 		pm8550ve-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pm8550ve_temp_alarm>;
 
diff --git a/arch/arm64/boot/dts/qcom/pm8550vs.dtsi b/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
index 97b1c18aa7d8..6426b431616b 100644
--- a/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
@@ -10,7 +10,6 @@ / {
 	thermal-zones {
 		pm8550vs-c-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pm8550vs_c_temp_alarm>;
 
@@ -31,7 +30,6 @@ trip1 {
 
 		pm8550vs-d-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pm8550vs_d_temp_alarm>;
 
@@ -52,7 +50,6 @@ trip1 {
 
 		pm8550vs-e-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pm8550vs_e_temp_alarm>;
 
@@ -73,7 +70,6 @@ trip1 {
 
 		pm8550vs-g-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pm8550vs_g_temp_alarm>;
 
diff --git a/arch/arm64/boot/dts/qcom/pmr735d_a.dtsi b/arch/arm64/boot/dts/qcom/pmr735d_a.dtsi
index 37daaefe3431..f9f1793d310e 100644
--- a/arch/arm64/boot/dts/qcom/pmr735d_a.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735d_a.dtsi
@@ -10,7 +10,6 @@ / {
 	thermal-zones {
 		pmr735d-k-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pmr735d_k_temp_alarm>;
 
diff --git a/arch/arm64/boot/dts/qcom/pmr735d_b.dtsi b/arch/arm64/boot/dts/qcom/pmr735d_b.dtsi
index 3b470f6ac46f..d91fbd3bff10 100644
--- a/arch/arm64/boot/dts/qcom/pmr735d_b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735d_b.dtsi
@@ -10,7 +10,6 @@ / {
 	thermal-zones {
 		pmr735d-l-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pmr735d_l_temp_alarm>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index bc5aeb05ffc3..51c547872438 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4571,8 +4571,6 @@ compute-cb@8 {
 
 	thermal-zones {
 		aoss0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
@@ -4591,8 +4589,6 @@ reset-mon-config {
 		};
 
 		cpuss0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -4611,8 +4607,6 @@ reset-mon-config {
 		};
 
 		cpuss1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -4631,8 +4625,6 @@ reset-mon-config {
 		};
 
 		cpuss2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -4651,8 +4643,6 @@ reset-mon-config {
 		};
 
 		cpuss3-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -4671,8 +4661,6 @@ reset-mon-config {
 		};
 
 		cpu3-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -4697,8 +4685,6 @@ cpu3_top_crit: cpu-critical {
 		};
 
 		cpu3-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -4723,8 +4709,6 @@ cpu3_bottom_crit: cpu-critical {
 		};
 
 		cpu4-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -4749,8 +4733,6 @@ cpu4_top_crit: cpu-critical {
 		};
 
 		cpu4-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -4775,8 +4757,6 @@ cpu4_bottom_crit: cpu-critical {
 		};
 
 		cpu5-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -4801,8 +4781,6 @@ cpu5_top_crit: cpu-critical {
 		};
 
 		cpu5-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
@@ -4827,8 +4805,6 @@ cpu5_bottom_crit: cpu-critical {
 		};
 
 		cpu6-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
@@ -4853,8 +4829,6 @@ cpu6_top_crit: cpu-critical {
 		};
 
 		cpu6-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 12>;
 
 			trips {
@@ -4879,8 +4853,6 @@ cpu6_bottom_crit: cpu-critical {
 		};
 
 		cpu7-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
@@ -4905,8 +4877,6 @@ cpu7_top_crit: cpu-critical {
 		};
 
 		cpu7-middle-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 14>;
 
 			trips {
@@ -4931,8 +4901,6 @@ cpu7_middle_crit: cpu-critical {
 		};
 
 		cpu7-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 15>;
 
 			trips {
@@ -4957,8 +4925,6 @@ cpu7_bottom_crit: cpu-critical {
 		};
 
 		aoss1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 0>;
 
 			trips {
@@ -4977,8 +4943,6 @@ reset-mon-config {
 		};
 
 		cpu0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
@@ -5003,8 +4967,6 @@ cpu0_crit: cpu-critical {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 2>;
 
 			trips {
@@ -5029,8 +4991,6 @@ cpu1_crit: cpu-critical {
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
@@ -5056,7 +5016,7 @@ cpu2_crit: cpu-critical {
 
 		cdsp0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 4>;
 
 			trips {
@@ -5088,7 +5048,7 @@ cdsp0_junction_config: junction-config {
 
 		cdsp1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
@@ -5120,7 +5080,7 @@ cdsp1_junction_config: junction-config {
 
 		cdsp2-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
@@ -5152,7 +5112,7 @@ cdsp2_junction_config: junction-config {
 
 		cdsp3-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
@@ -5183,8 +5143,6 @@ cdsp3_junction_config: junction-config {
 		};
 
 		video-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
@@ -5204,7 +5162,7 @@ reset-mon-config {
 
 		mem-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
@@ -5229,8 +5187,6 @@ reset-mon-config {
 		};
 
 		modem0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 10>;
 
 			trips {
@@ -5261,8 +5217,6 @@ reset-mon-config {
 		};
 
 		modem1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 11>;
 
 			trips {
@@ -5293,8 +5247,6 @@ reset-mon-config {
 		};
 
 		modem2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 12>;
 
 			trips {
@@ -5325,8 +5277,6 @@ reset-mon-config {
 		};
 
 		modem3-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 13>;
 
 			trips {
@@ -5357,8 +5307,6 @@ reset-mon-config {
 		};
 
 		camera0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 14>;
 
 			trips {
@@ -5377,8 +5325,6 @@ reset-mon-config {
 		};
 
 		camera1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 15>;
 
 			trips {
@@ -5397,8 +5343,6 @@ reset-mon-config {
 		};
 
 		aoss2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 0>;
 
 			trips {
@@ -5418,7 +5362,7 @@ reset-mon-config {
 
 		gpuss-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 1>;
 
 			cooling-maps {
@@ -5457,7 +5401,7 @@ gpu0_junction_config: junction-config {
 
 		gpuss-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 2>;
 
 			cooling-maps {
@@ -5496,7 +5440,7 @@ gpu1_junction_config: junction-config {
 
 		gpuss-2-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 3>;
 
 			cooling-maps {
@@ -5535,7 +5479,7 @@ gpu2_junction_config: junction-config {
 
 		gpuss-3-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 4>;
 
 			cooling-maps {
@@ -5574,7 +5518,7 @@ gpu3_junction_config: junction-config {
 
 		gpuss-4-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 5>;
 
 			cooling-maps {
@@ -5613,7 +5557,7 @@ gpu4_junction_config: junction-config {
 
 		gpuss-5-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 6>;
 
 			cooling-maps {
@@ -5652,7 +5596,7 @@ gpu5_junction_config: junction-config {
 
 		gpuss-6-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 7>;
 
 			cooling-maps {
@@ -5691,7 +5635,7 @@ gpu6_junction_config: junction-config {
 
 		gpuss-7-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 8>;
 
 			cooling-maps {

-- 
2.40.1


