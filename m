Return-Path: <linux-arm-msm+bounces-87770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAF1CFBF70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 05:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D62C3006E21
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 04:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D042517AA;
	Wed,  7 Jan 2026 04:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+T4U5AQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F552512FF
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 04:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760235; cv=none; b=W/wq+g8ZLn+mBo2oH3X2/cGspa/5LHM5gCXuN8jIEa52mI5zYD6iXBErX+qjwPlyeKQS7n5cNCbypSR/t8hO7YYMTaC6QVccVyS316ZlcRmrsWjNz/Si5sLr9fkKqVxGEsZ0t52u+H+trJo7KFfaLVcPIX0VC9wDDKUtr57I1Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760235; c=relaxed/simple;
	bh=qdzZ4n+LNV/PsoK+uJu2XlZkWbAHoGmAnFcee+ROIho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKcvS0+Yv0/ZFZ4X1xWDHBRY7lPrN0H30hmZ/CrwA9qRaQZRlTd/jQkvLDuy9T+KAzDsU4ox3/nRchX7dFPcSGuT6viw2wS7stWGNWxT+s1iP8MtzkjHSfwfzd5MoK/NVrfpP5CEYKf2+/KHlV7o29wpCW3NfgyKs7XCNe/V0P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+T4U5AQ; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b2ed01b95dso180254385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 20:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760232; x=1768365032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahSJ784Agrct7hUV5mLfOvTi+Ib0YPHnSuXQC3QM7fc=;
        b=Y+T4U5AQe6+nnN4nS5u8TrS+Ti0U/ZWpGS6S8CSqHEYdPhm56f70zn8DVGC8/qK8Fc
         o+0zmpuCd7I2gqM50rITYBLgztY6Ex7gtxRoiTYEutad1GZURzdYn4atIUvTECBXbuI3
         NrWQB23VInYm7yix5D3VDeCt1xmpgEm0TGK7QDwj4nH2pwwYRMgeyWg0AFMh3Yq7zf4z
         z0d37yI97WbPmvBhsEDZ8IKXR6tcZ0g+gfkUGdryjiQvi7zfU4pfPtD7SaKCfK3eIfiV
         YucsNXmIRp4o09sJIgFWWeKZUDiWToOZHM0nsm9wuIchmu1j9MT5uUAB35O+ZP1vAUPn
         zOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760232; x=1768365032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ahSJ784Agrct7hUV5mLfOvTi+Ib0YPHnSuXQC3QM7fc=;
        b=j7sBGdL5Gs0sYG3mWvC5uhGagya1IqO1L9dig2nzh2Xkd9za0Zma7a0mg0nGWO16OO
         qhWkB7imirl/lgvm6SdhAwi30t/CuPP5BBiLJqIhOBudXQMwHxKN0VqEFeiUuHinfKf0
         8LX61VC5CgtpPm4UGXPMsV+L+M3PJOdTo2FPyQZfzwckdfIHaAKL4fIHvumSL9X9XTGE
         E8WaTO3dZOfkvbbhZhCuLvouKZmobessLSKKoHLyAvXPCtDNdMK1bAJLnbiHlExy5fb1
         noKXgm5jo7xjtUqclzPu5GEqNO2hU51uh2qlw53OUJAgBTIz9mYbWLwZ4KQFaGArFEy/
         K6kg==
X-Forwarded-Encrypted: i=1; AJvYcCXm5oW8r2ERf8+oeyNxyNziQhz2vt17an7GZxYsuu4B6WDHyrqCNEYaKrUex3dQS5jnqVTEP23ENdYhGWZq@vger.kernel.org
X-Gm-Message-State: AOJu0YxZuBGE72ZPWA3F8e7tidzaTUGw3/WIDB3IDc2yTCTy37sTmQgf
	417rk8ogEEnUxNlt0u3aCZoldbisqzcAqMIaz+uJn7OkHZcb3G5woDCs
X-Gm-Gg: AY/fxX5Qm4n5U6a4SVoN5f/Ba1+DAJODXwUNt5MYAgrzECBhuZOXDM/BhtEUQH2W7iW
	b+HlrNri/8tUcBnD6LFTGdQdY+cXCi4VIgWO704O0BA1mls9D7iPfhVhb5Ccpa06HMqeyaF843+
	BTYFwm9OzfSWUVs6SvfgtIJJXBkYjHf0n2v/8XM8UCIFAMXWXAUPq0vicIGMcWkSF+NaoAxJ5B5
	mWLpl3pJT8BqCJxg/z7MoEA3K3uGlMVaKYKBdXkHvhgv0iWviJwS3CCasMSTW+YZvvrANOAC/o9
	YRPXM1UQDxDvpBBY28/FbcboanPyN+PueQWaecLN95uMyOc8DUZb7M7u7LMP1QLnkIueRB9yt33
	n7Inq9ev9Hbscp7cPI2Wrpr5DfZIlZBEasBPrxffup3Cup2qbQXn80KeElNvY5j22Y+GfY7HKuc
	zdYSuPv3gUqS/6CzpdIX/XM/FWKQTX5WtlrHPpZ/Cyq7VBuOVU8/dj00LJq6aX9VPJGSotCzfq2
	k4=
X-Google-Smtp-Source: AGHT+IEKJU0YmzkhTabwMnLGBVZqz7X4gT/xpJHWpB9OPZzD+XwLnPG9+W6UrzCMMz8xaPi7qB+Ssg==
X-Received: by 2002:a05:620a:4081:b0:8b2:e0b4:4e7f with SMTP id af79cd13be357-8c38942ee3amr157373885a.90.1767760232387;
        Tue, 06 Jan 2026 20:30:32 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e217bsm26420756d6.13.2026.01.06.20.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:30:31 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 4/5] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Tue,  6 Jan 2026 23:30:43 -0500
Message-ID: <20260107043044.92485-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107043044.92485-1-mailingradian@gmail.com>
References: <20260107043044.92485-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera subsystem is added for the SoC common devicetree, but the
mclk pins should also be common across the SoC. Add the mclk pins for
the cameras.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 3eb4eaf7b8d7..f21e60a6a2ef 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1196,6 +1196,34 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio17", "gpio18";
 				function = "cci_i2c";
-- 
2.52.0


