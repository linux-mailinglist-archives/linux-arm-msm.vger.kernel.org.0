Return-Path: <linux-arm-msm+bounces-41622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A7E9EDCC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FE55283830
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82F216EBE8;
	Thu, 12 Dec 2024 00:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XtSIV5AP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FBE1632D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 00:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964473; cv=none; b=a1wQ0JxPZqcEu6fWUc7GI8yClwlH4m07K7bu7LPC0mKSC0jrFzy3bwI95kiaKnsIe8ixwb6XhXN21brQnX459BsBNxm9uW+DZc3xMaWzZ6ISaR0/tgMyWmbOtdGCIcQbddVT7uS20dQErPbz80G8ujvkdTy1vesYs+ZoPdUt9x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964473; c=relaxed/simple;
	bh=onN/fyaI2B+gXcyjb4glosU8R39A7qsREEgJ/i/7DUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQtsbocWVpAM55aiHms/xJHlieroJ7KidxqQ/6+/6HC1hmSh/wtpSulaMzovBCq36S2LHq0etGn8aFSBMhAsdMjFFNGTVW3FW7i4T4qMOXh/e47leWx34I9hyDD01gemTVTAAj5FIm1v81mzfZkjxFF5LaVxZLRS3/kS7HQZwO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XtSIV5AP; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3863494591bso7759f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 16:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733964470; x=1734569270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rV+oSHxMzB7djaacyAb6Ozy1okMulrrztHmf2SfoQUo=;
        b=XtSIV5APpS0KNQLd44M8RpH6wVTqlpX6nCyxqyxrWI9GDzuP01dcSinh/F6cz5gt74
         qFMM9ggeBmCvercGLD7oXBMZez6h+lL56lTMQiGQvVnymR/xn4Hvros81Q5N/Rdv3bK1
         fRuMceHnlmphdITh2vtJ5hspMYP/eK3zAgGb1/PwsEUeRALgzeSiatJw0+P3G1lFhH5r
         7ES+eItG9x/BCKLuVQ6U7Bn5Dmu2Gy3EN87CtuJ2PEZIobEcCznwX3LBbNuKegAyGpWz
         8+I9zYwokrLAfkCGV7/Y6bdVLPbW4f8v8L0L4bzRjv29wrd0pR2rzhgcxooq3hL6TQMC
         kIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964470; x=1734569270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rV+oSHxMzB7djaacyAb6Ozy1okMulrrztHmf2SfoQUo=;
        b=fG7Qj2NKUZpaYxSl8vpIPekvicGNrlaaLrBXWnlTBTVHqbn7K93eo2t1pLBcXQT8eT
         F5dnQUy57Apn7/hjiLghIKknuas9hfen7bEci9Vu/GP4C0kVtdHEW7/FEbZyghVkD5oU
         4qTKPJHJYvsOb8x/gMLNNoeJNMPOBZju60gs/r8U0en0qA8WDfbCzSk1pMmjoeH+V02j
         7FS7MazcG2Q+GuvBc2Hw0TL/0F9bCcCLmR/4pc5aMIGqVtasDSr1CddBW35/RVtX9vlJ
         IaV3W+FmvE+l7LIfu01GEfRdYo40gYNle+2O+UOJHcSx5LJmu/AqWZOnA1CH/zDmLqJZ
         iFeg==
X-Forwarded-Encrypted: i=1; AJvYcCXLy+ZYf0f8OEzyvUPOZ7FkrMXGJk0LCqXvV7jqVq8hTdYoHn1FZOfXD9uB+QYg/gXALZBZi0/S6eepAyLJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx2zyAYYYDStvZE0gIVe/r1aT2/1Y+xs/gwPGEGQe2djio8LXO
	2Hn8+ZyUA+HGlBTQjCkPgJUzRkB44Q1FxGQn83VWHQjN49rxkiyPRJO2P1m7u4c=
X-Gm-Gg: ASbGncugX6qnnIiWblU5vdQV1XspuASJANCHTXt/KzQnq9sRSbhhaZTj3lDp2J12TvG
	vluRNqt8F9jGo2r2A9Ob7jqHp/gLyteidyME599TCG3wkJQGbprvNV8K7JwZ0dtTdFyf1T2U8f5
	+deHAyfZ5yWdq4y7do1dnl/KwKJT3BcHhyqBR0Q+9pVQ/vOMuGNe3lJNNorrBQqi6wZ1TRH0w8q
	xyEXi3pfvQP2iP0vvVqUNFKyyq3NXKC6R2ZNU7Gtz8GtHlpB18icomfBjmQnpuaMqvlVdwH
X-Google-Smtp-Source: AGHT+IFAk1Y8qy4yabp5VFqeN0qshO4/4jp4s6LgayFE/Znd6/U/Ng+pprV0dDY9YOcoyY0cS9nP0g==
X-Received: by 2002:a5d:6da4:0:b0:385:e0ea:d4ef with SMTP id ffacd0b85a97d-3864cea1edcmr3389698f8f.58.1733964470591;
        Wed, 11 Dec 2024 16:47:50 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4ef4sm2459660f8f.39.2024.12.11.16.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:47:49 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/14] arm64: dts: qcom: qrb4210-rb2: enable wsa881x amplifier
Date: Thu, 12 Dec 2024 00:47:23 +0000
Message-ID: <20241212004727.2903846-11-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212004727.2903846-1-alexey.klimov@linaro.org>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One WSA881X amplifier is connected on QRB4210 RB2 board
hence only mono speaker is supported. This amplifier is set
to work in analog mode only. Also add required powerdown
pin/gpio.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 6217bc6e6282..827ce5f7adfb 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -264,6 +264,24 @@ zap-shader {
 	};
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	wsa881x: amplifier@f {
+		compatible = "qcom,wsa8815";
+		reg = <0x0f>;
+		pinctrl-0 = <&wsa_en_active>;
+		pinctrl-names = "default";
+		clocks = <&q6afecc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
+		mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
+		sound-name-prefix = "SpkrMono";
+		#sound-dai-cells = <0>;
+		#thermal-sensor-cells = <0>;
+	};
+};
+
 &i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -730,6 +748,14 @@ wcd_reset_n: wcd-reset-n-state {
 		drive-strength = <16>;
 		output-high;
 	};
+
+	wsa_en_active: wsa-en-active-state {
+		pins = "gpio106";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-high;
+	};
 };
 
 &uart3 {
-- 
2.45.2


