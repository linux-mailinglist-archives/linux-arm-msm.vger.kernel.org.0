Return-Path: <linux-arm-msm+bounces-81940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E43C604FD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 13:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 425BF241DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 12:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3F429B20D;
	Sat, 15 Nov 2025 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jX0p4G1b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49F329B204
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763209629; cv=none; b=D3W0JkuX52aFu+c2IDoTVmIbEjgd6tjcX1X8U0JoWus3pMbx9d7u6HezzmZComLrE+oqGD8jkGMsPBxY6ssuPnvs3uonowJwRoABXRnwvZMvJxAk/H1AYZ9hijU6SsJlE5CD9DLX9yy6zmFlDLrkV2rUQiIn3t78bjkwAW5IW58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763209629; c=relaxed/simple;
	bh=9aLmwzkNAl0fWuMuVondtmIaHCgChuo26ApIfLvkfFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q61pNfwJbdTdBmSJ4Ce+Dq+sOxw13rcWMePQ4dAyHoPx/WLbjYxGZWzuSsCIVDT3E8uUXXgpGCaTFwrh+4W13G8+8hUUasLrESVbbcTHm5n1xMDqdDzEegQ87l7eINaQBhcHNowE14qkc+4de2ttFwBeK5DQVSVadryT0e4z8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jX0p4G1b; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-641677916b5so5239634a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 04:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763209626; x=1763814426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvK3la7gcQuHMKu0Ctg4YqteqqaI5MjLgal59B0Tr/k=;
        b=jX0p4G1bL1wGzg59vdWRfuF0lI2seIe9FYdRKI29IW+nbgvWdWP6wzgdaQgpLvcvsX
         iPpj93gMio21e7fj6zpZrNAw9EXXns77LRgPadsctHrKzCGZsp/MQYwOsQ0LzWkBQpOw
         1eJoHokxBRuCfFESZl5IdSLlnNHPaG7D5UPW16DLrTY29GEx2k2UZLL5GLcEK8GnRJwi
         6cjwJzmRpfDvC1sKfxCO52svm+RKNesnnM5S6GoL79dEE83rZIJK3vcdm3JDFU4f3IbA
         ElBt29gOOigk3JVDYYPTQR69AHTf5kwGVB9j3tdP686W6P50dyFHvhAoyZ2Pi99qM4X8
         mHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763209626; x=1763814426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lvK3la7gcQuHMKu0Ctg4YqteqqaI5MjLgal59B0Tr/k=;
        b=RvTe7rC6Kqklgj8CWUMDEJSkS84JxUoVaft4P2NTGa2I6p8WvaGq7HPFVi7S5AnD7z
         f0eu9b2GiAfHCnR3aPvKN2xSyTdgnGBO3t78sbn+qfRA0fTNuscuo3geywZKZn1ctwDG
         H5UlxOFIpb4V4VIdljNpZByW7aldJ6HTOqz8uXIwUYuP52rykE6BNCAqvphk/UPri21j
         x5f71OPN/jYiBVHxYKL1/6DNWZwkGFs5PoAflkLEcvcEnIsfwYYraj87iYBWMIYxVLZv
         DqvnmWLWonBX532D9QSkU7XyRVSL6jVfHU6X7wsCAXtZYXsXEt6epNqzTm+LcJ/2SZrH
         FT0g==
X-Gm-Message-State: AOJu0Yw6uX+i3VJd40rPINDFcBqo9DD9GkBGSxuFpElVot0qS3vGut33
	XzxguxEGsW+8M1/catn4Gpheqb8RiBhiupSNX1EakyhH5twUoD5TyqSk
X-Gm-Gg: ASbGnctijpyvFLNakYijF7cXv9Hi+HnLzgMiuMEc6GBIz9GGsVBuroZIem8IzTkelhC
	r6K/7z6D8KXzGWtzeXeKWNELeXTUvo6bE6Cw8JTsO5xc5mgRA9ukGbWO2/D61+8x+efg0dGPD6z
	aA1ZXeSPXnrBM7gt+OXcGCMeMJXzV4Omg83R12KUMC9UG3/XdeomQOIbvPKGxriMavqd+5KHtPi
	XgmRCkNhDUMdfhIb5MvsUjpachk7pcr+zxeBingXc71/RqT3Tmli5JfE61O9pnqbwK4BL/aJ+LV
	JUizLvv/moXwQmJOl1ZogZLLmjeR37QH1Xq02zcNuv47vyJqfdh9m5TYcNg7KFyFDkRaf8zgqFF
	S5qNXQfQCdEtu6zWk9sQ/PR7stNDS4/1WXjoOpMZcPRkj5lIYiPWz6xtawn41+80ecvgcFEAAPK
	+mLHOiMtOiRXLsio0=
X-Google-Smtp-Source: AGHT+IGPNXXDBVzrdW0ewCGGvsan17fP3zMqb7WdKL2xTwdzjqfWwc/8Nm7mBh23tsxt8snJrllZqA==
X-Received: by 2002:a05:6402:2683:b0:640:b1cf:f800 with SMTP id 4fb4d7f45d1cf-64350e02fcbmr5344009a12.4.1763209625786;
        Sat, 15 Nov 2025 04:27:05 -0800 (PST)
Received: from [192.168.0.188] ([88.223.153.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b2155sm5627042a12.29.2025.11.15.04.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 04:27:04 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 15 Nov 2025 14:26:43 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: msm8939-asus-z00t: add battery
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251115-battery-hall-v1-1-1586283d17c7@gmail.com>
References: <20251115-battery-hall-v1-0-1586283d17c7@gmail.com>
In-Reply-To: <20251115-battery-hall-v1-0-1586283d17c7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

This device tracks remaining battery capacity percentage using voltage
mode BMS. This commit enables the pm8916_bms node and adds a battery
node to track its capacity. Battery properties were taken from the
downstream code and from the information printed on the battery itself.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index ebb548e62e02..b58f0a04abfd 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -20,6 +20,25 @@ aliases {
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
+		ocv-capacity-celsius = <25>;
+		ocv-capacity-table-0 = <4372000 100>, <4306000 95>, <4247000 90>,
+			<4190000 85>, <4134000 80>, <4081000 75>, <4030000 70>,
+			<3984000 65>, <3930000 60>, <3884000 55>, <3850000 50>,
+			<3826000 45>, <3804000 40>, <3786000 35>, <3770000 30>,
+			<3753000 25>, <3734000 20>, <3712000 16>, <3693000 13>,
+			<3686000 11>, <3684000 10>, <3682000 9>, <3680000 8>,
+			<3676000 7>, <3668000 6>, <3643000 5>, <3600000 4>,
+			<3542000 3>, <3462000 2>, <3340000 1>, <3000000 0>;
+	};
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -135,6 +154,12 @@ &mpss_mem {
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
2.51.2


