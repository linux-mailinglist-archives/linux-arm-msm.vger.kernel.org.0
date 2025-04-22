Return-Path: <linux-arm-msm+bounces-54928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B10FA966E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8620189F5E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37035276050;
	Tue, 22 Apr 2025 11:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p9dzKfqm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0976277815
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319865; cv=none; b=laSISZRlfKRd8hf0ZuvzI4h+O/9T2oVmp9+YNQYE5v8Yjk56UVmk2D+QAxQ9m9baoDzqvaGGLrHk6VTXUwKCdaO5/QoQ6JS9Hq72LtVn+Yl9nfo+47lxuBHqoA0HYi4P61loRr2tKXhPQ2/Smt6atdVMgwz041hq0PXfJNGTO8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319865; c=relaxed/simple;
	bh=khrIOuPNydaoE0R69LRaxeUdmtv0GT+QtuOLskCJVgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnY+ka8In9E3AAFudi45B9IkG3SPBE8f+1DaFG5KSP2UBiGhlPV4A/N2z1Juy/jxvGjTY731t1QaMXoiSKzISlqbiPpVzOG2S7gBwSQpDG1XLuUUeRkl7w/p+oEM+tSNA48TJN0vqe849tjaVb5xkJGsCqHqi6ioCOKEAiPlMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p9dzKfqm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so24237545e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745319861; x=1745924661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ci38G1RmPeuAoUiNuhDTBFPaBQP/k30oBtFbdnT3L54=;
        b=p9dzKfqmx7Eux9glMhReTxMCtnPQN4hKKGTPMg5dHsN0ZpERmTj3k/0+qjnAh8PN5B
         /Cgm1dAMOK40RETNMH3GY5a3tgj49Hid0NAAdB4VLbSKS+0ux19jhGFkXEOJ7IMPKBwN
         rTj6Nte3dg6wZn4XVFe7/lHl5Zkq8b2sSSfTRYu5q11i0Z9iyL1SRxTSykrnnRrVw3up
         JaI0t9D78dQQ3nizhLA25BcJ+MugbKLLxpsMh/mc+XcMX5WrN5d5Z9nrhw8B0H61objR
         CtRB1K/IBeNKXIiYcxh9KkmexIEb6jhKW2Ghdq2XJ+OYBkNhZdEIBKEYYih4DTpLOAtf
         Pa6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745319861; x=1745924661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ci38G1RmPeuAoUiNuhDTBFPaBQP/k30oBtFbdnT3L54=;
        b=qGZ96LfH/591jOP07mfab82uyjx/UP0rYi49mflJy+EMSmsXQpsUWltuElIJQPtukS
         q+IzJbCGeSWMmEjq/TYr5JYNlvQ135HGcFEVOOixCD7ehdvFndEz8h4cwAghG/P+7uhZ
         gvxwykxkr1zfko424Lw+judLSgBaBkKZU1R9fUEOOHK2Lkr1ggNPdsCgSMgZO7Fts12d
         uSgQpvo5npKMZSS6pLXb7y6SUX8ayUhKntVDzSkktktpE506LgcRFKVVH42dtvOb8Sml
         STVfxuU8CP5gKfQuqlMyG+oKa6JSUl0wcjwDYGjYNE48r9Iv/ziPdSQHxJWHfFM53RjJ
         w0bw==
X-Forwarded-Encrypted: i=1; AJvYcCVCgbt4+7RJ7UTnr9R0S5/Za16G9o8tx2mKPaK01JVnk14GuDzj5CqmK4Ia5TCp19QN8TSYY2l62G+dzwkR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd+ibWsINOLmMTVwVkZ9Z0Kji2cgzTFfUvwkeQNDN3hoxOGui3
	DQXgK5/JNXlHCs1E2spXGPtsu8mTJPF9AGdpa/y12Dpsz887u5dJAWdOkcKC6WI=
X-Gm-Gg: ASbGncs/FoHCx9Guy42q1wDDm/e9FctRILgeuVBt9JzTyuW75jwqWlNznmyuQcG5w4Y
	Qul/lX2P4PL8aWP5C7aMre9rlbumfhkB/i3PG6SUUXsOaViftRfEfBV45fRzkCMnH+LTaGNmHaN
	kFnYYEFbepDcMoaBGvtqoINVDwrkfossCP7F6haq4bFB2lCUe3WND9f88MqWUBpWJbKUFdoq1Q2
	y+HOsm2QWkAsdMmtiN3TR/mLysKS96Y2eBKVC5vPXAO+41TeJi4yXqDCoEaYZISeT8Lumhb/Ujf
	0T1w14STPgW/St0KfTHy1/pFAygRZXgHBOzq8pr2eV6ay8PKE5NPmZaZCeK6mOY7Ng==
X-Google-Smtp-Source: AGHT+IGckcdlnWQqBL6qiNxjnkHkWJyUfuh1CJ+EyBVjThrN7w/33qBUkDxftZXEgQa6I55NFkVdlQ==
X-Received: by 2002:a05:600c:384f:b0:440:59eb:bfc with SMTP id 5b1f17b1804b1-4406abf94bamr115861735e9.23.1745319861045;
        Tue, 22 Apr 2025 04:04:21 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:8847:e39a:2a2f:e614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acddfsm169609725e9.15.2025.04.22.04.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:04:20 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 22 Apr 2025 13:03:53 +0200
Subject: [PATCH v2 6/6] arm64: dts: qcom: msm8939: Drop generic UART
 pinctrl templates
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-msm8916-console-pinctrl-v2-6-f345b7a53c91@linaro.org>
References: <20250422-msm8916-console-pinctrl-v2-0-f345b7a53c91@linaro.org>
In-Reply-To: <20250422-msm8916-console-pinctrl-v2-0-f345b7a53c91@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.2

Remove the generic UART pinctrl templates from msm8939.dtsi and copy the
definition for the custom UART use cases into the board DT files. This
makes it clear that the set of pins/pull etc are specific to the board and
UART use case.

No functional change.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8039-t2.dts | 22 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/msm8939.dtsi   | 23 +----------------------
 2 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8039-t2.dts b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
index 4aa0ad19bc0f7fde6f5f3a93cdb6be19fb4f1f65..38c281f0fe65ccfc49de70eaef2a970323ecebc8 100644
--- a/arch/arm64/boot/dts/qcom/apq8039-t2.dts
+++ b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
@@ -122,14 +122,6 @@ &blsp_uart1 {
 	status = "okay";
 };
 
-&blsp_uart1_default {
-	pins = "gpio0", "gpio1";
-};
-
-&blsp_uart1_sleep {
-	pins = "gpio0", "gpio1";
-};
-
 &blsp_uart2 {
 	pinctrl-0 = <&blsp_uart2_console_default>;
 	pinctrl-1 = <&blsp_uart2_console_sleep>;
@@ -329,6 +321,20 @@ &tlmm {
 		"USBC_GPIO7_1V8",	/* GPIO_120 */
 		"NC";
 
+	blsp_uart1_default: blsp-uart1-default-state {
+		pins = "gpio0", "gpio1";
+		function = "blsp_uart1";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	blsp_uart1_sleep: blsp-uart1-sleep-state {
+		pins = "gpio0", "gpio1";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	pinctrl_backlight: backlight-state {
 		pins = "gpio98";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 52a99aea210e04f04f3d25696ecd6b9c604c743a..68b92fdb996c26e7a1aadedf0f52e1afca85c4ab 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -905,20 +905,6 @@ blsp_spi6_sleep: blsp-spi6-sleep-state {
 				bias-pull-down;
 			};
 
-			blsp_uart1_default: blsp-uart1-default-state {
-				pins = "gpio0", "gpio1", "gpio2", "gpio3";
-				function = "blsp_uart1";
-				drive-strength = <16>;
-				bias-disable;
-			};
-
-			blsp_uart1_sleep: blsp-uart1-sleep-state {
-				pins = "gpio0", "gpio1", "gpio2", "gpio3";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
 			blsp_uart1_console_default: blsp-uart1-console-default-state {
 				tx-pins {
 					pins = "gpio0";
@@ -944,13 +930,6 @@ blsp_uart1_console_sleep: blsp-uart1-console-sleep-state {
 				bias-pull-down;
 			};
 
-			blsp_uart2_default: blsp-uart2-default-state {
-				pins = "gpio4", "gpio5";
-				function = "blsp_uart2";
-				drive-strength = <16>;
-				bias-disable;
-			};
-
 			blsp_uart2_console_default: blsp-uart2-console-default-state {
 				tx-pins {
 					pins = "gpio4";
@@ -969,7 +948,7 @@ rx-pins {
 				};
 			};
 
-			blsp_uart2_sleep: blsp_uart2_console_sleep: blsp-uart2-sleep-state {
+			blsp_uart2_console_sleep: blsp-uart2-console-sleep-state {
 				pins = "gpio4", "gpio5";
 				function = "gpio";
 				drive-strength = <2>;

-- 
2.47.2


