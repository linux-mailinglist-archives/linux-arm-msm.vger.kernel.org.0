Return-Path: <linux-arm-msm+bounces-32586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7746987567
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 16:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF2411C22DA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FF71514DC;
	Thu, 26 Sep 2024 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1jv5mQC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4273E14BFBF;
	Thu, 26 Sep 2024 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360544; cv=none; b=FOzPL1FA8EpnAdIAV4Yi9h/XH037+P9aOiXa6z8ghpbjckEnKdW5DudR7m4BzgmctskzRFhgjkVAv9BMiElUz5tW5bS//HK8Et/y4UQYQJD4a9L+OJ7A0shcuMbM69FgBm06DoW8UR+hR8fAEMF335yOPkHtMsdVR3gyxPuLr54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360544; c=relaxed/simple;
	bh=HSWoKU+U+LciT4YeTMc8x2BUj723ugWiGdsGsQ5TSgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RxywJ3LLiaitNcev6OASz4F9jhYmN1VGXxC12Kp9FdlOTbZMTst+moa/+heaiTRNRXcONchZtGTZsqSl5qy4/RDR9yT38LqVvIHizcunv8bOY9e4AE7NXaGJAckZfwLu71+qvW+hRaV/RytbdPcoQDEIUIpkVSeYgHafRD+AHXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1jv5mQC; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f7528f4658so10062991fa.3;
        Thu, 26 Sep 2024 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360541; x=1727965341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXU7Bk7WbuxNrJusNNOpHMNB9jnyfgFFtQVMoYQpR+c=;
        b=N1jv5mQC0qapquJs5bUtRz2d4g4mb8rPUcHSPETPzhJF3qBEi72RwSa5IJZJyeIjT/
         Vcs+KK+gliDeKlouxaABEobXYc/4mosN1BEBeCU7bMQV7npYnMLRUER/2/vM3knorx2h
         SSZEBMI9RudfCVO9YVTWaKSG/LCM+Y1BqpryxkaJWvpVl9469m53ZQ0816y+lfcnqtj3
         FMapWZ/G/h0cnTQuSOxnz56EgybcUBnqBpj8j0XasJ15GkntH+4XLAYzrJDlzGicaIdV
         Oeon26n7OETI0dvuCo4jVRaCqKZeMyMFUAPqWGSRgKky1acwYvVYzv1wrupugj2c20dw
         dZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360541; x=1727965341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXU7Bk7WbuxNrJusNNOpHMNB9jnyfgFFtQVMoYQpR+c=;
        b=nweMFes9/88BFhTZeGOvq/Ifw9QMELzPaQXpboQ9QC5fwOHxHVvuUUoNDtRYky3K1C
         pkgJa+ABYi1QLzxKUXF5ogdJtDl3Ds5Pt6D/JYxSSTWwSDQemum9hhEr7gvgFP2r7F6h
         Z37wok35eiMFLLimTskBKyeCacns9J8QvjBfKqfO5wVvMCMMDsjcLeMeSSitUz9vB4Vc
         fyr5WLu+aCIbypuzNvEpJgWDdeWvYECASZIx/dBBFyo5zvHLhmzJOTag0Yzlg65i9Ypi
         dO9VSv4G3Q7JZ0USPZUZwi21Rt4VDwuDMxrhr4AK1WENT6L1ljvOAdlXmfBPQ85rOFDP
         CHTA==
X-Forwarded-Encrypted: i=1; AJvYcCVoUUh1Dj7eo2JS/f1KcBSzbGv1mBBFozF1HMpv+/0Wg2NnOc0JKh5Zzvorozy0XGx/U8AgDKHQqN/f@vger.kernel.org, AJvYcCXsa6H34zDpiz5KyxdnsrPBf1HmGiyuit9dbPTYX4kpxcrSS8OEbwAivVfHzn6kaJ/He8KjFEprOZn6aUdE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi1t0yHnsh3ust00jsy+clpx16GgisKssIGtNcQcq0pHskLpwZ
	ncya3r4DfyRe6tyrsAdEI7sJq8kJ43ySAIe0UwUiW09Q+IOJaFCerC1kFA==
X-Google-Smtp-Source: AGHT+IHucf7WvGIQzkMya8V1JPR5e94Nbo0B7frD0noBAwNjxHMlxrjbJINWvNwQZX/AeUblMZHEhQ==
X-Received: by 2002:a05:6512:138a:b0:52e:98f6:c21f with SMTP id 2adb3069b0e04-53870499a40mr4466933e87.16.1727360541042;
        Thu, 26 Sep 2024 07:22:21 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a864db1bsm815803e87.267.2024.09.26.07.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:22:20 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 17:22:03 +0300
Subject: [PATCH v5 03/12] arm64: dts: qcom: starqltechn: fix usb regulator
 mistake
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-starqltechn_integration_upstream-v5-3-d2084672ff2f@gmail.com>
References: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727360533; l=1140;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=HSWoKU+U+LciT4YeTMc8x2BUj723ugWiGdsGsQ5TSgI=;
 b=7sHiyK6yWWGVS2zG0v6ClRA0gKFTcGFypDguj626XhrwLZawWPLYQzSdfCa+nYRjdvPAcmcvf
 tugHJ9kh4t6AuAai0fXsjlfhshm4TlE+FiFJxuPdZCVnvaceS16mEVC
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Usb regulator was wrongly pointed to vreg_l1a_0p875.
However, on starqltechn it's powered from vreg_l5a_0p8.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 6fc30fd1262b..f3f2b25883d8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -135,8 +135,6 @@ vdda_pll_cc_ebi23:
 		vdda_sp_sensor:
 		vdda_ufs1_core:
 		vdda_ufs2_core:
-		vdda_usb1_ss_core:
-		vdda_usb2_ss_core:
 		vreg_l1a_0p875: ldo1 {
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
@@ -157,6 +155,7 @@ vreg_l3a_1p0: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vdda_usb1_ss_core:
 		vdd_wcss_cx:
 		vdd_wcss_mx:
 		vdda_wcss_pll:

-- 
2.39.2


