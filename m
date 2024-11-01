Return-Path: <linux-arm-msm+bounces-36674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 430239B8A87
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 06:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0231428333C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 05:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C5B15574E;
	Fri,  1 Nov 2024 05:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ztuhDuwN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E84714B08A
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 05:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730439132; cv=none; b=IXm4xwK1Q6JNEDwoT7nSxJl5by1HtC5LvEUOEgjzpLAtIctnpTNZeDvIEaPfPEPUW2pRq36/f5JQ8THp1qidkr4l+ygbtTsv0VJRy/kiY9A3iaQatLizE38ReNi8th/R06/nLIkpeJO5MffBDk+vNMfkZDULoyk5zYfWGhbmpB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730439132; c=relaxed/simple;
	bh=FDgphfZPTIA9fzYFST+hL8RP/WFy/9sedu45TzPwsTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9hPKX0KvtDluSjUMC0L8QV6r0jIfN9/+Bjx5z3IutJIVMUHCw4uoHRZkJUfT5V3EDgLQy3+qM3px++uT1cZCUUIaCmXVkTxdBcGjfsFrJ4qoNuXUWC/LF14+S3E1/A/zpKzvauQcRn+CyhKXM9FArM//tVsJnaFhIiwIeriotU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ztuhDuwN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so13391945e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 22:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730439127; x=1731043927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uS0C+AJNY5VNBI4UsIfDrVJ22E6TQciTqVzmaVT9hTQ=;
        b=ztuhDuwNCiEau1ZldiY97t9i156OAFobsG1XoXZf3KMpR4F8RSPxAvvggZkMdhgLGZ
         lOFyORi98B8F4V5WDysYhj7kNKsFUQd6pNEJkYz70iTKX5GWd9zRhgRqvq0WPF8BJHdG
         8px6xJ9uhoN+LFC1qrWbOmrvKNz+KDsxTvTUCjWtV+ykzF9ZyLrpbF0qn4v7J9wCzum5
         1szw4VSDrHj9DSyU4EvHsFbMscg25akQfi6kX6FUSpP6K4vsQBtEgL3UzovW3U8F41tK
         TQuCqV2EjAQiAHfSgz0Ys2BkdF4UAVmZ/maJLKcLTVkkoXFl9D9ggCr7jsZ7WPvhBWfU
         cNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730439127; x=1731043927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uS0C+AJNY5VNBI4UsIfDrVJ22E6TQciTqVzmaVT9hTQ=;
        b=g+RKbi+wIzJSpV6KP/w+KO9a7z3zGXtiXC/K+g70+iFgjB93hldl4B72XY2wJtTM11
         TuqmL0JzA5Bg/FoIYiqKbII+DKtE9tMyLnd76P8Z7hWVBmHPabEM+Cb3UkHO66NiUI8V
         p7Oww7B+/N83EKUtGZgrDgt1JnJ3ODiqka9J3ePhc4hweGx2M/Mepjk2xnFNobQDjQ1S
         EWRPo11cAIViw1rKWbYpcxNF9rdMvQxp7/CA1APCauUsx1CHCV1JK1Pv7TDhi+llBBh9
         cqRPAAKMAyA3RBqAtO6tl8Nqt5m75Cch531L6+WN/8ZXQeVIwDpA2w4Hzb2pVLOiGLQM
         ++qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQM79hm92Lg8er8pkN5MGTm+JkISLguHpSPfZ5I+4Rk08t2PnrZwpDekKulVqRX0MiWQGenSOr87JkV5+l@vger.kernel.org
X-Gm-Message-State: AOJu0YyAcI+0Z7njRXVuV75IyTBjdQag2NbGaxZMDyKTBGimz+dy8g+S
	DO6Te/NRWUWU9FHEEmTotdlh27IT+g51G89TVd4q05+BE5IlThOWBBY3uXQkUAQ=
X-Google-Smtp-Source: AGHT+IER9AxOJBpFiZCFJQilJGMnnJtNxlQDfXsPi3ZNDmy8oAHHgazdwWdcUJC87G4x+qKhFpksrw==
X-Received: by 2002:a05:600c:3515:b0:431:5df7:b310 with SMTP id 5b1f17b1804b1-4319aca52f4mr190879015e9.8.1730439127571;
        Thu, 31 Oct 2024 22:32:07 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6852fdsm46960505e9.34.2024.10.31.22.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 22:32:07 -0700 (PDT)
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
Subject: [PATCH v1 08/10] arm64: dts: qcom: qrb4210-rb2: enable wsa881x amplifier
Date: Fri,  1 Nov 2024 05:31:52 +0000
Message-ID: <20241101053154.497550-9-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101053154.497550-1-alexey.klimov@linaro.org>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
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
pins/gpios.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index fc71f5930688..76b9ae1b0ebc 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -63,6 +63,16 @@ hdmi_con: endpoint {
 		};
 	};
 
+	i2c0_gpio: i2c0 {
+		compatible = "i2c-gpio";
+
+		sda-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	i2c2_gpio: i2c {
 		compatible = "i2c-gpio";
 
@@ -272,6 +282,25 @@ zap-shader {
 	};
 };
 
+&i2c0_gpio {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	wsa881x: codec@f {
+		compatible = "qcom,qrb4210-wsa881x-i2c-codec";
+		reg = <0x0f>;
+		pinctrl-0 = <&wsa_en_active>;
+		pinctrl-1 = <&wsa_en_sleep>;
+		pinctrl-names = "default", "sleep";
+		clocks = <&q6afecc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "wsa_mclk";
+		powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
+		mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
+		sound-name-prefix = "SpkrMono";
+		#sound-dai-cells = <0>;
+	};
+};
+
 &i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -746,6 +775,22 @@ wcd_reset_n_sleep: wcd-reset-n-sleep-state {
 		bias-disable;
 		output-low;
 	};
+
+	wsa_en_active: wsa-en-active-state {
+		pins = "gpio106";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-high;
+	};
+
+	wsa_en_sleep: wsa-en-sleep-state {
+		pins = "gpio106";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+		input-enable;
+	};
 };
 
 &uart3 {
-- 
2.45.2


