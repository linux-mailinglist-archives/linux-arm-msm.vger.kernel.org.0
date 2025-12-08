Return-Path: <linux-arm-msm+bounces-84685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B18FCCAD850
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 16:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E50D304C9D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 14:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B742EBB9E;
	Mon,  8 Dec 2025 14:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMMWnXT3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E5D2DF14C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765205970; cv=none; b=E21u1WNivmGcgm9uGjRAOsxV+AOJ5L2vaeUoVi1Jg4/k4RRTJ22b7CanZkd8VgbpoRFiAsQPCwlQ7Ftm8+YElGodLjCDPomoeyOih65IS5N3Gw9pPsZJepgxjMKUVfUTAGJlWEfIulHKmSkBr8oUJpy2t/S+mdMX7k6FoEjrtKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765205970; c=relaxed/simple;
	bh=eUZx25U3sbk45BVbe4VOiqc8SJBQO3VlDhtP4glEGfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKu/yMg6fzeGzzd3Nwxr77nP7/+Usfbw3i51mA/RvP4Rs66CL+eAXAgXLXz4ZjHaNUMsqeHWJwXGx4odEz6eTv3KymI7ECzzg1UvqSVfEDO2ze34uQ1A/nQl1V1hOJxYqv+GvGD6BLSDauJHY2QrZfR/djqdFOfnWrvTFG0F2BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMMWnXT3; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b736ffc531fso758358566b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765205967; x=1765810767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvxbaU3LPveODQZxfbJsnXKFPnTK+dy5k6La/Lv5giw=;
        b=NMMWnXT38tD72xTyERVdOVSnkQumd/N9VuEU+8Ody51+i/cQQ76UpHWQiIHthIydak
         4UUj7F8bioWaGJLlPIuP+kjbqJuMdbYJgkDAZgRwnQzTgzPdgGqZEiD+W2ApRSzaapbo
         APAL5pENPv8T8RqooZA5iSE9mxsPZE04XMkidjo/T8cJB/YXjWPkD1M88/5l0WV14q+y
         MTQRLIZY3FoffisZXIPSUck7P4iy41FOCebZTwrDXk6OMOSzOKkJy1r10uhuwozt+CRP
         1Fz7RUtyQXxpV5Fiff3slMD/Q0lwkg0KudAYCfx6VIZF0RCh0viJaZprj9myImfoUvDr
         xLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765205967; x=1765810767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OvxbaU3LPveODQZxfbJsnXKFPnTK+dy5k6La/Lv5giw=;
        b=FktloChlIeHevyAZOWhBq/Bgt9Lc6Jr3Bt2DOxe35mvkxM3/BO89T9Sc9bCL7EP/H2
         2qEVFgsuzRFE0qg2bQPQSczQ9JnLxjh3qBj2s/bcBB9Mqacp6V4/0BGpe7eBzC3nLCgr
         u6oSvjdT0n7ilQlTNiWhyA243/gQfkKmDhtHZVw6TOAL1w64bchkYA0p63NT3q85+Rwg
         c36xhCwdqiArKN8Cp6JlXYZiGEzTLg1WmeMy2KskEenlHhdJmM3BOs1F7mszSx170DJR
         8X0vGWQShE9+MAJU9R6ZRkCEYN0u1Jf7Hsw6o1IA5q64hsl+bo+gPlFYL+LaYWqOOFqq
         gY9g==
X-Gm-Message-State: AOJu0YzpnZ5FMceAJuzX45s56sTfyaFFyFrqpa1el3iOn07FB8RjVaxk
	Xqd97qQhBuL7srhT/9ZDdO2ZpqrZMoVc9VYtGVyNYYzniQWVOlwbkK1w
X-Gm-Gg: ASbGncuMqdr7pGdoUv5E6UA+jek5SR/wcPbbZBYdhqq8qPmw2tXgHVq1mOz0Exy0vRL
	QY2Dza44SfIOvx/GZaPF5vHwk4Jywr5eTxkSxbUEaCADGTvevuJy2XKRxrjm8p/yLigQ8hHoUhj
	ovmwkXrVHNA5CkCWcJW8M9p8xsh1Ds5sognhvH9/UJZveTFb+dPbRUOFq7rSctRyJEnJexpABBG
	sLg0RnCdMJY74j0unDxkwQOiClXwKlr9M8qkwExl0vL7YjEKmcKy1qXhaq70DVFwQPArIk3BH+C
	UWrBXQeUiO2nambKTHLD7y8bgwNUAbXP0crJZKT0/tv6ceAM5bYLh2/baWugAHvPY3UyH7BvXb0
	CozdWEJ/z/t3ouzaClCWzdt0s+Q4wC54ZbU0dbuprlt1IOpU2B5peUF8muUyz4CzL046xNn38TE
	+2p3YNN2P3YMMLUw==
X-Google-Smtp-Source: AGHT+IHV4wT+FTlujDS+GtkBd7fAewGRJD2xd03tll2P5cqDlF7fKs1POKod7qkfkABTKmYBFPloXA==
X-Received: by 2002:a17:907:6eaa:b0:b73:9fea:331c with SMTP id a640c23a62f3a-b7a247eb824mr788301366b.47.1765205966796;
        Mon, 08 Dec 2025 06:59:26 -0800 (PST)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec300esm11365556a12.1.2025.12.08.06.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:59:26 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 08 Dec 2025 16:59:20 +0200
Subject: [PATCH v3 1/2] arm64: dts: qcom: msm8939-asus-z00t: add battery
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-b4-battery-hall-v3-1-84e2157705a4@gmail.com>
References: <20251208-b4-battery-hall-v3-0-84e2157705a4@gmail.com>
In-Reply-To: <20251208-b4-battery-hall-v3-0-84e2157705a4@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

This device tracks remaining battery capacity percentage using voltage
mode BMS. This commit enables the pm8916_bms node and adds a battery
node to track its capacity. Battery properties were taken from the
information printed on the battery itself and downstream device tree
for a battery named "nvt+atl_3000mah" [1]

[1] https://github.com/Asus-MSM8916/android_kernel_asus_msm8916/blob/10.x/arch/arm/boot/dts/qcom/ASUS_ZE550KL_1936167_3000mAh_3p4COV_VBMS_Final.dtsi

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 61 ++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index ebb548e62e02..d0f0f80dd326 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -20,6 +20,61 @@ aliases {
 		serial0 = &blsp_uart2;
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion-polymer";
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4400000>;
+		energy-full-design-microwatt-hours = <11500000>;
+		charge-full-design-microamp-hours = <3000000>;
+
+		ocv-capacity-celsius = <(-20) 0 25 40 60>;
+		ocv-capacity-table-0 = <4378000 100>, <4220000 95>, <4125000 90>,
+			<4071000 85>, <3977000 80>, <3916000 75>, <3866000 70>,
+			<3838000 65>, <3822000 60>, <3809000 55>, <3797000 50>,
+			<3784000 45>, <3771000 40>, <3757000 35>, <3743000 30>,
+			<3726000 25>, <3707000 20>, <3688000 16>, <3670000 13>,
+			<3655000 11>, <3648000 10>, <3636000 9>, <3624000 8>,
+			<3612000 7>, <3592000 6>, <3569000 5>, <3540000 4>,
+			<3494000 3>, <3418000 2>, <3289000 1>, <3000000 0>;
+
+		ocv-capacity-table-1 = <4378000 100>, <4292000 95>, <4226000 90>,
+			<4166000 85>, <4109000 80>, <4064000 75>, <3992000 70>,
+			<3942000 65>, <3898000 60>, <3859000 55>, <3826000 50>,
+			<3802000 45>, <3788000 40>, <3779000 35>, <3768000 30>,
+			<3752000 25>, <3732000 20>, <3712000 16>, <3696000 13>,
+			<3688000 11>, <3684000 10>, <3680000 9>, <3675000 8>,
+			<3669000 7>, <3658000 6>, <3636000 5>, <3599000 4>,
+			<3544000 3>, <3466000 2>, <3341000 1>, <3000000 0>;
+
+		ocv-capacity-table-2 = <4372000 100>, <4306000 95>, <4247000 90>,
+			<4190000 85>, <4134000 80>, <4081000 75>, <4030000 70>,
+			<3984000 65>, <3930000 60>, <3884000 55>, <3850000 50>,
+			<3826000 45>, <3804000 40>, <3786000 35>, <3770000 30>,
+			<3753000 25>, <3734000 20>, <3712000 16>, <3693000 13>,
+			<3686000 11>, <3684000 10>, <3682000 9>, <3680000 8>,
+			<3676000 7>, <3668000 6>, <3643000 5>, <3600000 4>,
+			<3542000 3>, <3462000 2>, <3340000 1>, <3000000 0>;
+
+		ocv-capacity-table-3 = <4365000 100>, <4304000 95>, <4246000 90>,
+			<4189000 85>, <4133000 80>, <4080000 75>, <4030000 70>,
+			<3985000 65>, <3933000 60>, <3886000 55>, <3852000 50>,
+			<3827000 45>, <3806000 40>, <3789000 35>, <3769000 30>,
+			<3746000 25>, <3726000 20>, <3706000 16>, <3688000 13>,
+			<3681000 11>, <3678000 10>, <3676000 9>, <3676000 8>,
+			<3672000 7>, <3660000 6>, <3634000 5>, <3588000 4>,
+			<3528000 3>, <3448000 2>, <3322000 1>, <3000000 0>;
+
+		ocv-capacity-table-4 = <4358000 100>, <4298000 95>, <4240000 90>,
+			<4183000 85>, <4128000 80>, <4076000 75>, <4027000 70>,
+			<3983000 65>, <3935000 60>, <3887000 55>, <3852000 50>,
+			<3827000 45>, <3806000 40>, <3789000 35>, <3764000 30>,
+			<3738000 25>, <3715000 20>, <3695000 16>, <3677000 13>,
+			<3672000 11>, <3669000 10>, <3667000 9>, <3666000 8>,
+			<3662000 7>, <3652000 6>, <3622000 5>, <3577000 4>,
+			<3518000 3>, <3440000 2>, <3321000 1>, <3000000 0>;
+	};
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -135,6 +190,12 @@ &mpss_mem {
 	reg = <0x0 0x86800000 0x0 0x5500000>;
 };
 
+&pm8916_bms {
+	monitored-battery = <&battery>;
+
+	status = "okay";
+};
+
 &pm8916_codec {
 	qcom,micbias-lvl = <2800>;
 	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;

-- 
2.52.0


