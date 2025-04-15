Return-Path: <linux-arm-msm+bounces-54435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7493A8A02F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 15:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D47E8581073
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 13:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35711E3DFD;
	Tue, 15 Apr 2025 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E22lVqLC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652C61AC44D
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725205; cv=none; b=If94Fn+t+efzBro5ZUvV04IREy/Pl0iA2sEQfUFxgl+ZAsg1dcKgVLHjpv9nLPiaD1N0DrMvw+XWG4+nwhF/nl53HE0UugFx2LyURYwqZt2q4frAKo6xefynvOi7OZ8lb3h6vesSYhmLvxVHc42zS4j0VS5zRj2xszk5PeU4XPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725205; c=relaxed/simple;
	bh=90veFZYkI7tOsSfYhPXPr8MTVtRlDMrsdewxWsLlM80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kUSil39NfejSIOjwCLfC/DwCzYNpGRXErm1vVcj1Fqu1TDrR6WWATWDZwXCL9BeP/9O2iwI04enDAvVAEIesJRi0lR/9gOCWdZfz3kw4I83ZlHl0oAAFflMWU4+UO34qXVdcV3ZRM6aY3zBIQteIX/rtk4cKJZJRAY5LG9Yj/5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E22lVqLC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac3b12e8518so932474066b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 06:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725201; x=1745330001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+VemoH6JbPZfntDzSZfUEE9eySHn4jqOWYpmcA1Ep4=;
        b=E22lVqLCWgIyMQhFIuvRgrk+20nIID2RaFGBhhv2CNbURJwiQSVYU1RnWT/j1vMBKf
         4rdN7ty57EEKEqyTB2oTJuWQOzuxlFHLDVGqRM4/mHzsMnsTfWVCvIBpvG5ScSVeF0TK
         ytWWgbncjBdlGNLGJgrfOTJ+NJdw4XtHWN1MGqQeh4PRmJvCoY/2b905Y6Nlctr7XNBz
         W5zxcBH3JcrC28e1XVU3nKqcy1KRijsFCnZ5JCu1K7i53S8rBPzvM94qhlaFO/n8oPl9
         2mL10gXSsh2c8NZRnpCs34LNBPkqAjH+w7fN+5BrQ6ERpd3Z/w8P3L608wrINTYSAz6e
         8/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725201; x=1745330001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+VemoH6JbPZfntDzSZfUEE9eySHn4jqOWYpmcA1Ep4=;
        b=UugNUbg2sZYpQ21ek0hP9B+UguOyaBhkJSnu/A72qr5uLgwgWY2QWuoVdw4izh99Cj
         fZvbFUYF4VbiN54K3wcDFFqbjH4V9vus81m7yZd5Ls9o6bzjMGvCeqYfWu/ZGbc1v19b
         uSejd7paRRvTWxEPPacFVQM7NBDooKQIIDsJd8ILXVZk1bdvdUY5x7ez80VhAEdNSCrx
         GoTpSU2ex2Qlc4TQE8NDR1iyfIOHi/HgWpjzk11d9cLkvIxnmnotlULASSypBhriFV3L
         jhlgy5FmkN4acf+ki1AbWvDHIBcTiFHwVFJxpPHTpZcHcY/Y+LumUCfTKXNgWZO7k/kE
         Xjqw==
X-Forwarded-Encrypted: i=1; AJvYcCWOHrrM6m4BBNQeWQkCxsvw567iKvXMk0heTCHT8UAiiVjAelL+XilsCEBDS30XriFGJPuWf4kBzVDF+miA@vger.kernel.org
X-Gm-Message-State: AOJu0YwazXlQChdosBbCB8lmIBHj42P7GwHN9hISwJrc5nyPfXNCcM80
	U7IWbIQ2abYoQLgEzlzDV6SDDM33g5AqjSVpGqpC+0agO9ugChDmWbnzjgzS4cY=
X-Gm-Gg: ASbGncuNv+5uL13x/jgRRrAwSOk9+MjDNYN4aa/KrlEHM5iq/minb2MNO7tm2TKNsKG
	rIw99een3ozMgoFi3jpValtWMu17GFKj+84ExQmy6PCEJzoAlkZPgXMbFjX2j0369gGFHDM5pbu
	P7HNg0zEQfMbUpR0bwm55VB6e5kdjsVqg+p0+mwr7d1jiwx+NlXBznqwfXu2XpUnDw7KlAvgDf8
	Ijr+/cnKsQqLDVvJO2olPxyvXUnMsrNW3xivbAedB9enyLESC5bHPRR2Th282Om9M69dsH/MsMB
	r3K+wMDkq1lgwuScTk8JTmf6D88S7zLR0Z0PKaInlWIHusR4o+E5QFo=
X-Google-Smtp-Source: AGHT+IHCes0G+xk/lOar09FklsVADVO86cU+eaDfU0dbj2bA77b5QNHnjabmqTqpe+Ix/13ytNhHTw==
X-Received: by 2002:a17:907:1b1e:b0:ac7:4f1:65c5 with SMTP id a640c23a62f3a-acad36d7ac0mr1453544966b.54.1744725200534;
        Tue, 15 Apr 2025 06:53:20 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:7b18:2529:5ce1:343d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acadcc21a44sm681379166b.177.2025.04.15.06.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:53:20 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 15 Apr 2025 15:52:46 +0200
Subject: [PATCH 3/8] arm64: dts: qcom: msm8919/39: Use UART2 console
 pinctrl where appropriate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-msm8916-console-pinctrl-v1-3-a1d33ea994b9@linaro.org>
References: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
In-Reply-To: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14.2

Convert the majority of MSM8916/39-based boards, which use UART2 with 2
pins (TX, RX) for the debug UART console. This adds the needed bias-pull-up
and bootph-all properties to avoid garbage input when UART is disconnected.

apq8016-schneider-hmibsc.dts does not use UART2 as a debug console, so it's
left as-is in this commit.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/apq8039-t2.dts                      | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts             | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts               | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts           | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts               | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts                  | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts                 | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi   | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi     | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi      | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts       | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi                    | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi       | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts        | 4 ++--
 arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts             | 4 ++--
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi       | 4 ++--
 24 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index 6175b1b9d7c6e82ef8ed3b6198b4b8cef81514d8..f12a5e2b1e8c2cce6e85b8444c97a7e0d7b7c58f 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -230,8 +230,8 @@ &blsp_uart1 {
 &blsp_uart2 {
 	status = "okay";
 	label = "LS-UART1";
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/apq8039-t2.dts b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
index f656eca59ee23a6d19450b4d3fee7a661b002709..4aa0ad19bc0f7fde6f5f3a93cdb6be19fb4f1f65 100644
--- a/arch/arm64/boot/dts/qcom/apq8039-t2.dts
+++ b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
@@ -131,8 +131,8 @@ &blsp_uart1_sleep {
 };
 
 &blsp_uart2 {
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
index 9b82468ace3edfe8d808492b83e7753d3314e7af..3a6eba904641c65ee8e982774f4122ef9ddb3704 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
@@ -133,8 +133,8 @@ touchscreen@38 {
 };
 
 &blsp_uart2 {
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
index 1c2f8e8f9b263b024cc7c239447e7158262b0c1c..2de8b6f9531b25f1ee745c5e298d1cab806f0391 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
@@ -214,8 +214,8 @@ led@1 {
 
 &blsp_uart2 {
 	status = "okay";
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
index f7a9ee0dba09eef83e9b4149856cdefa0ae3fd4b..29d61f8d5dc9c8099524ecbfdb80ab7afaa811c4 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
@@ -130,8 +130,8 @@ touchscreen@38 {
 
 &blsp_uart2 {
 	status = "okay";
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts b/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
index e5ca1ca0d9976a0d36af5359e705ca7b2070122b..742a325245c5c09dcb6227ae262865b17ee5ef46 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
@@ -131,8 +131,8 @@ touchscreen@38 {
 };
 
 &blsp_uart2 {
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
index f75e60b5d1b3b40673cb0639a3f8d0056d037a02..aa414b5d7ee47a0e20ca2341c9a3250503184a69 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
@@ -214,8 +214,8 @@ nfc@28 {
 
 &blsp_uart2 {
 	status = "okay";
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts b/arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts
index 7c49b4cb27cb5a9914b38865596eb27541f390fd..22bc73b94344aff42f560304c99cbb7b8995fdfd 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts
@@ -59,8 +59,8 @@ reg_sd_vmmc: regulator-sdcard-vmmc {
 };
 
 &blsp_uart2 {
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts b/arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts
index 6e55d37f588c9b829bb594ff156cda6cb8b6caf2..c50374979939c26186e97d19047de77356a9c3c1 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts
@@ -112,8 +112,8 @@ touchscreen@34 {
 };
 
 &blsp_uart2 {
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 4576178cc9b0936a7356b9852fc003fe949ed903..eb449112a22684492e6b6f9705389d44f2cec379 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -254,8 +254,8 @@ rmi4-f12@12 {
 
 &blsp_uart2 {
 	status = "okay";
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
index e0dacdf552452a36cbdb041b37d68eb4d661e6c8..887764dc55b21a5892510f822004b054eb65fa0a 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
@@ -178,8 +178,8 @@ imu@68 {
 
 &blsp_uart2 {
 	status = "okay";
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dts b/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
index c115142df364e99a4f566775d4d1679e6a8920e2..63d476523544babc9213e34e227870a447410eca 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
@@ -23,8 +23,8 @@ chosen {
 };
 
 &blsp_uart2 {
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 58a548d220a485e9a92c012c1529e3fe838d6c9f..6f75707b6f9b4707cbed7e12ab60fa888d6a1f06 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -302,8 +302,8 @@ charger: charger {
 
 &blsp_uart2 {
 	status = "okay";
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
index 4290ae7782d659eb0d2594825717ffaf4c84076b..fb790b02736acff017d12318de1c01100a33c808 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
@@ -304,8 +304,8 @@ charger: charger {
 };
 
 &blsp_uart2 {
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
index 30e34574999c52f7ea99c9bd7af41101e5d4d4d0..ff9679d3f664cbb203ff42b4cf27468622cc5cf3 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
@@ -116,8 +116,8 @@ fuelgauge@36 {
 };
 
 &blsp_uart2 {
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
index d4af7856f5f3a70160774d1637e39e19d163725d..697f25d51d9d05087500231f4d9ad77fe81ea3b3 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
@@ -135,8 +135,8 @@ touchscreen: touchscreen@50 {
 
 &blsp_uart2 {
 	status = "okay";
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 45c3b3387b52030a6475ae0da2a2c89ea98ca6c1..71b5c98458ff475e101a0a40d3601b5ca144ec92 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -319,8 +319,8 @@ rt5033_charger: charger {
 
 &blsp_uart2 {
 	status = "okay";
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi b/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
index 2bfe56da8f6c624ed97d8a5750d12c59c039c874..5719933fa8e01b0b90ef7477c0bf181af379a524 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
@@ -72,8 +72,8 @@ &bam_dmux_dma {
 };
 
 &blsp_uart2 {
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi
index f5caac42bbad106f86448c217aa1472a32fbeaa6..ebe85cd85ddf30b9905975318746403e0cecf7ee 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi
@@ -93,8 +93,8 @@ touchscreen@38 {
 };
 
 &blsp_uart2 {
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
index 10d0974334abf0e501ec97e2de487f40c1507f82..68c8856d4c2ed22370822eb295c0000fd80226f5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
@@ -169,8 +169,8 @@ led@2 {
 
 &blsp_uart2 {
 	status = "okay";
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts b/arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts
index 9f647027d082864ccaa240f7118f20a8d19f6a4a..18381a66daef8642da27b3ea8c48964c1ccf121b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts
@@ -126,8 +126,8 @@ touchscreen@1c {
 };
 
 &blsp_uart2 {
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index f59647b5b7dfdd7bf630f9d180bb56a10a3ea0a3..13422a19c26a15812657e92ab0b52d6f53f5c944 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -243,8 +243,8 @@ touchscreen@4a {
 };
 
 &blsp_uart2 {
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts b/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts
index 3d9cbe7fdad8808968190d7a744bab29eeb0e827..07613080e79e9bfb21493a0b61c85bc172d5e3f6 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts
@@ -373,8 +373,8 @@ charger: charger {
 };
 
 &blsp_uart2 {
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi
index cbefe34327ba7b04ea57032c68dd69642e6d1685..a5187355f9fa09148b9f04970da6855a49cdd059 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi
@@ -126,8 +126,8 @@ touchscreen: touchscreen@38 {
 };
 
 &blsp_uart2 {
-	pinctrl-0 = <&blsp_uart2_default>;
-	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };

-- 
2.47.2


