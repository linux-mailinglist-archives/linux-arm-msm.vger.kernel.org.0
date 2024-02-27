Return-Path: <linux-arm-msm+bounces-12717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 814C0869809
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 15:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CF371F2C8A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 14:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4517A145328;
	Tue, 27 Feb 2024 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IVaU9pZj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC87B14037E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 14:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709044054; cv=none; b=CGSgJVhd4GJOUVC6FE/+qiEapRIsxPMd9GEPmnlLT1Sr2z840SxG31fC8+bPFTPTKOo1xyjXkWkhvUDyRJwtLayxFvHSgoVpzOvo8es1ctqkKTIJnQF5yzC/nk5k1sFpPxk1SQv58QZtgkPdUscNv9o0wSG8CXRQpc4yf8OpBkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709044054; c=relaxed/simple;
	bh=bsf32Y7coVxxTSmKbLEaQtO9FBe/PteLHrHMoCJPWNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lzVc5gNS8YJoT4AZdfGKeCFhmx4asqP+WfAqHHCvdPlAFqPuS32/mizxXyGSCtAHO/nrg+uENyzmeBRQY7tZ4OWMpLsewRPRMad1dc1o0XhtQBS8ayAOi9RlgOlQSAtWylaQ+jW2vZvUcxaVVTS3wqnX1e70xVV+PdOfL3FdbRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IVaU9pZj; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-563f675be29so4644738a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 06:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709044050; x=1709648850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33B8gJG0ZgTkJiJm72SjJZHXMoaZN/mFMW+Qqrnw2t8=;
        b=IVaU9pZjuhsJ1zFdWoQuozQa/7/tNS0nLICblbHILCW1ry233EHzqkgoT8YUpqGBKt
         rhGoXZvL6bWtUWfYfK/cfnuSiA+/a0Ocw/1a1qQB58Y44jTpiNZDEI5WLHIVSghsn3ZM
         0iSlcEIYdi1HSh+YUO9uhlrwIGCluVz3B+9V4nOV2ypHMuOgxyeH1sWBxs6soA0ogbhV
         fc5ivc8DFjr18AAdn3ALiLJmZia244q7SzOQgREktIAFyqHkN98yqIr87QF6mIZdgM7l
         QAYMcWfOJbdsmurYm4L3MHu1HqAdrSFQMwCps1oSGgYT4+Mj75PwD6YKuQIuuOdeq81K
         fz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709044050; x=1709648850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33B8gJG0ZgTkJiJm72SjJZHXMoaZN/mFMW+Qqrnw2t8=;
        b=I4jkVWnOd0JdADqR3AvJLbP8KYYOMG6AS4638OJ7lLf/zoSJw0gSVIEjrwKimkf7lO
         V9GIsTzqpWzNu06wuv3MSSDqHArAW9hJMwOaEy2c1uIEmrdGy4ucvWf1Mh+G3pq49O+4
         RqrKmjcvXbRg7ysU7z3Y8zlk31fbCzxlRtAnpgRjAvuWXL690JTn9z+4b7d5cXJP8OoC
         lvsPEMpjluxBgXXD4kimM0RBkTDS5wb3ZrawpgXoJPehW8MyG+ULKY0aTp2dzlNf8JGQ
         c+cLqdxVj22it/BzuXTWPwfcrhh/EX4ms5EoBItZdBywiWBUSEPeJW1Zl8A0FPfAyp7D
         i/YA==
X-Forwarded-Encrypted: i=1; AJvYcCWwJ0lB+az/g43QPzOEV5DzT5fgCA+YLCQLqmzFHIX3+bqE9jkwGr/0RgXmBM7z7xF5gxBY+8gEWLXbTNEngHqRGS0nwkbqN7g+3vGmYA==
X-Gm-Message-State: AOJu0YwcgYTbynM++a348f0xUH5tGdyVu5JI8nQXQ5IwgWNVKsRhaSQD
	iSy/XzOI7VMHFBDL71jONwIorSu847i6+ZwV2+JTQb3rSoSeBVuurqLiVjK+8wU=
X-Google-Smtp-Source: AGHT+IEij7029UEKKPfIsg6SV1R+vPsLyeR6KBl+70fxTzEzohEkoVCooioBYOnozthxWZTZ/05cSw==
X-Received: by 2002:a05:6402:3456:b0:565:7116:d533 with SMTP id l22-20020a056402345600b005657116d533mr7046605edc.6.1709044050058;
        Tue, 27 Feb 2024 06:27:30 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id u16-20020aa7d550000000b00564c7454bf3sm813689edr.8.2024.02.27.06.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 06:27:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: x1e80100-crd: switch WSA8845 speakers to shared reset-gpio
Date: Tue, 27 Feb 2024 15:27:24 +0100
Message-Id: <20240227142725.625561-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227142725.625561-1-krzysztof.kozlowski@linaro.org>
References: <20240227142725.625561-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each pair of WSA8845 speakers share the powerdown SD_N GPIO, thus this
GPIO is specified twice in each WSA8845 device node.  Such DTS was added
hoping non-exclusive GPIO usage would be accepted, but it turned out
otherwise: it is not supported by the Linux kernel.

Linux kernel however supports sharing reset GPIOs, when used bia the
reset controller framework as implemented in commit 26c8a435fce6 ("ASoC:
dt-bindings: qcom,wsa8840: Add reset-gpios for shared line") and
commit c721f189e89c ("reset: Instantiate reset GPIO controller for
shared reset-gpios").

Convert the property with shutdown GPIO to "reset-gpios" to use
mentioned Linux kernel feature.  This allows to bring all four speakers
out of reset.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Dependencies merged by respective maintainers for next release:
1. ASoC: commit 26c8a435fce6 ("ASoC: dt-bindings: qcom,wsa8840: Add
   reset-gpios for shared line")
2. reset: commit c721f189e89c ("reset: Instantiate reset GPIO controller
   for shared reset-gpios").
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index d7ba45953277..266a461f4882 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -802,13 +802,14 @@ &smb2360_2_eusb2_repeater {
 &swr0 {
 	status = "okay";
 
+	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
+	pinctrl-names = "default";
+
 	/* WSA8845, Left Woofer */
 	left_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
-		pinctrl-0 = <&spkr_01_sd_n_active>;
-		pinctrl-names = "default";
-		powerdown-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "WooferLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
@@ -819,8 +820,7 @@ left_woofer: speaker@0,0 {
 	left_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
-		/* pinctrl in left_woofer node because of sharing the GPIO*/
-		powerdown-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TwitterLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
@@ -853,13 +853,14 @@ wcd_tx: codec@0,3 {
 &swr3 {
 	status = "okay";
 
+	pinctrl-0 = <&wsa2_swr_active>, <&spkr_23_sd_n_active>;
+	pinctrl-names = "default";
+
 	/* WSA8845, Right Woofer */
 	right_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
-		pinctrl-0 = <&spkr_23_sd_n_active>;
-		pinctrl-names = "default";
-		powerdown-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "WooferRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
@@ -870,8 +871,7 @@ right_woofer: speaker@0,0 {
 	right_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
-		/* pinctrl in right_woofer node because of sharing the GPIO*/
-		powerdown-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TwitterRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
-- 
2.34.1


