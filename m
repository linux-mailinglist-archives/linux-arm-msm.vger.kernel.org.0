Return-Path: <linux-arm-msm+bounces-54433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D8BA8A01D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 15:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F83B7A424C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 13:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631461B3725;
	Tue, 15 Apr 2025 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y7IMz9/t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6B11A255C
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725203; cv=none; b=pqjtfmxWeGumaerYdNJVNTksI8OWe0bvfBghoflO31SUV0K4EDulCG2LyRvK7Y/HuyPlrolLW/Ztw81riWU3HwDfZ6CN6CxVZ5ksZfD7hCY1H0kbUkcnAynByBGNIOEUTB0KHMS8gZZ76XwvnjjEqup1R8vx5s5OCtJPG2gtUCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725203; c=relaxed/simple;
	bh=7rT0DnZ40BX0chd62YZIMarCtZkIZTK+AlWOSsnMwGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2tq+SH7RVeGdvFwLtR7YV/SalSt5Fc9pwGeWbmgC2CH/1Ty6awVjPV3fBRaMvZQCPMts0wxR9Je0LaEtzfau1OmnR2LrYHqLlhddAL0G272Jc9k/YQZINCiJ689DcoIoRnQ7blKdlTyNHChURmm78vhadj7UVWBV52kUBxq0qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y7IMz9/t; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac73723b2d5so1112580566b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 06:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725199; x=1745329999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6tYxjgZnNiRfOX1HagPvU4+OfIiUTK0uIOiDBKkMjM=;
        b=y7IMz9/tz7QC4qUgfMWO0TWDSiNTNhL4gduoy/OHKLrBiVNzu1OyGP8P5FD7i68Rjw
         sb/M9r33+hrgykmJDPuMYKCrlXShESp5+TAwbG34Yboym2ZIqvaU7gI+F2ipF9YQ5Hii
         bgk4DDr6iAKRyYiB+shAy1QC0vqN2JmOJ+2c2Y/ZzluCdMrf9xu+OjfD9JAJUSZzIj4V
         lVZY3x/Pz/koSA6M4wKlq1PJSf94vb/Rf2gEyKuJPZsIHgzCVkSCE++m3SvmaZTgom+x
         asDo4fdIq9NTdjxRnO5LOHlbYtRto1Du1eMLPDNf++GZl4UB983ga22yiBqlPi0dOdb6
         jAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725199; x=1745329999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6tYxjgZnNiRfOX1HagPvU4+OfIiUTK0uIOiDBKkMjM=;
        b=Ym89+4VCYr0UFFMtTbeywrgfgQzth/0kaTztey+FYzZdauZv+9lmLbij6moeL2jHdy
         G1UuHM5uFfl4vyh2fPGQ+IKqn9U4cDbcRQ8w8Ro8X+0E5fW961YTmA3E3rNdu69oc9Zf
         BmX8XgoSszp6x3fK79wbYUPpPRE7i7Esm8a79g/+/yX/NxSQm8BBxQ/k7T6VQoSneA2B
         BB5NiLcrGW7v+zocwPd+Pnk/Q590F6R0ngF0cFYnVvzQdrLa0/74ZvFBXAk8E1wPewfA
         7T93B1/YMFRVDE+XZUmEYyEv9QkC3OJuIsRTBKkcfIVruqipDH1TM8jvVVxY5sBTIKOY
         M7cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHULyxxOa8Ogy2XKsxdzBIL+ojvwY8myzqIi2GDUu4nEmbX+7n98ioLm/jB+2C6yWurUHzC6yArtCFjPtz@vger.kernel.org
X-Gm-Message-State: AOJu0YyjoWYZ2P9UxvTST9EDw97epPZAYPcHZvMaOIGcShuYkcVbbjYz
	Vs77Z29diHEx6kuZOzQ7eHcLec/MvHL+LJlAPUfG8dBUZwa+a+Oy1SVoOgCRX6c=
X-Gm-Gg: ASbGncsT0p+UVe39wdV582fNk5gMXrn7gjNDM6frCANqb2tpHOz8zlVScJ0r5b/r4Ya
	WS6VDO/G95H6HeLdUxltUf7UBCj0MZm2EX5OTdEDEHv2N20CwDmix+EU23vlrN51xG2gai2BzC6
	zNH0gUcz/nnuQj3cSmDzCK56ECpyHhv0+Jr28Pq7YZiNu+4Ey18odufbO8oG+QzPwyxDUZxRjcS
	wg4Rztd2ZPwB2/3gZi7zMqG1k/Hs5vJa2oQrv4u0NvzbRMI5ZVdg08DxiA+K7CZGhXWn5Bvdcle
	0j0Y64ulXzBckMYUfDBSSOBz8BJsKI2/YvJNXN3QdS5MmjVMyur+tEc=
X-Google-Smtp-Source: AGHT+IFj4BGzQDL0tZmOUj1gbsZcM1OSfHV0iPjzyd8vrIYlrHFKk2z6XvkElZnyILkNERPUmwhmrw==
X-Received: by 2002:a17:907:940a:b0:abf:6ec7:65e9 with SMTP id a640c23a62f3a-acad36a6206mr1463236066b.43.1744725198568;
        Tue, 15 Apr 2025 06:53:18 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:7b18:2529:5ce1:343d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acadcc21a44sm681379166b.177.2025.04.15.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:53:18 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 15 Apr 2025 15:52:44 +0200
Subject: [PATCH 1/8] arm64: dts: qcom: msm8916/39: Move UART pinctrl to
 board files
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-msm8916-console-pinctrl-v1-1-a1d33ea994b9@linaro.org>
References: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
In-Reply-To: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14.2

In preparation of adding a new console UART specific pinctrl template, move
the pinctrl reference to the board DT part. This forces people porting new
boards to consider what exactly they need for their board.

No functional change for the boards upstream.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
The ordering of the pinctrl before/after the "status" property matches the
existing style of the files.
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts                     | 6 ++++++
 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts        | 6 ++++++
 arch/arm64/boot/dts/qcom/apq8039-t2.dts                      | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts             | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts         | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts               | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts           | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts               | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts                  | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts                 | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts         | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts         | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi        | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts                     | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi   | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi     | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi      | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts       | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi                    | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi       | 3 +++
 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts        | 3 +++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                        | 6 ------
 arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts             | 3 +++
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts         | 3 +++
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts              | 3 +++
 arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi       | 3 +++
 arch/arm64/boot/dts/qcom/msm8939.dtsi                        | 6 ------
 28 files changed, 87 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index aba08424aa38439952f959f79a9ded2201de1f7c..6175b1b9d7c6e82ef8ed3b6198b4b8cef81514d8 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -222,11 +222,17 @@ &blsp_spi5 {
 &blsp_uart1 {
 	status = "okay";
 	label = "LS-UART0";
+	pinctrl-0 = <&blsp_uart1_default>;
+	pinctrl-1 = <&blsp_uart1_sleep>;
+	pinctrl-names = "default", "sleep";
 };
 
 &blsp_uart2 {
 	status = "okay";
 	label = "LS-UART1";
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 };
 
 &camss {
diff --git a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
index 75c6137e5a11dd5c738681d676dfc9b014efb34c..7a03893530c7b89705f5544491c14edd7120acdc 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
@@ -190,11 +190,17 @@ tpm@0 {
 };
 
 &blsp_uart1 {
+	pinctrl-0 = <&blsp_uart1_default>;
+	pinctrl-1 = <&blsp_uart1_sleep>;
+	pinctrl-names = "default", "sleep";
 	label = "UART0";
 	status = "okay";
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	label = "UART1";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/apq8039-t2.dts b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
index 4f82bb668616f942d65f59a6f418cf38f404df32..f656eca59ee23a6d19450b4d3fee7a661b002709 100644
--- a/arch/arm64/boot/dts/qcom/apq8039-t2.dts
+++ b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
@@ -116,6 +116,9 @@ &blsp_i2c5 {
 };
 
 &blsp_uart1 {
+	pinctrl-0 = <&blsp_uart1_default>;
+	pinctrl-1 = <&blsp_uart1_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
@@ -128,6 +131,9 @@ &blsp_uart1_sleep {
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
index b4ce14a79370bc16b7d8fe144e56f4bb27e01534..9b82468ace3edfe8d808492b83e7753d3314e7af 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
@@ -133,6 +133,9 @@ touchscreen@38 {
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
index 3459145516a12ae8e054e24b3ed9b73f9d79905a..1c2f8e8f9b263b024cc7c239447e7158262b0c1c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
@@ -214,6 +214,9 @@ led@1 {
 
 &blsp_uart2 {
 	status = "okay";
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 };
 
 &mpss_mem {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
index 77618c7374dfe29cf5660e0834aa2b0fa6f3d67c..f7a9ee0dba09eef83e9b4149856cdefa0ae3fd4b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
@@ -130,6 +130,9 @@ touchscreen@38 {
 
 &blsp_uart2 {
 	status = "okay";
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 };
 
 &mpss_mem {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts b/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
index f7be7e3718209b9ca96afb13ea1aca05e1388225..e5ca1ca0d9976a0d36af5359e705ca7b2070122b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
@@ -131,6 +131,9 @@ touchscreen@38 {
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
index bf7fc89dd106f670e7cda270c7284a6a3d7d052d..f75e60b5d1b3b40673cb0639a3f8d0056d037a02 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
@@ -214,6 +214,9 @@ nfc@28 {
 
 &blsp_uart2 {
 	status = "okay";
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 };
 
 &lpass {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts b/arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts
index a823a1c4020894edf845130e72803b48dbd24ac8..7c49b4cb27cb5a9914b38865596eb27541f390fd 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts
@@ -59,6 +59,9 @@ reg_sd_vmmc: regulator-sdcard-vmmc {
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts b/arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts
index 07345e694f6f46bbf71ed3c551b2a80d5f352d2c..6e55d37f588c9b829bb594ff156cda6cb8b6caf2 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts
@@ -112,6 +112,9 @@ touchscreen@34 {
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 7f0c2c1b8a94b2c4d79e5e0b2b7188f4e2b2d281..4576178cc9b0936a7356b9852fc003fe949ed903 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -254,6 +254,9 @@ rmi4-f12@12 {
 
 &blsp_uart2 {
 	status = "okay";
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 };
 
 &pm8916_bms {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
index 2cc54eaf72027a213f9d779c57fa22386bda934a..e0dacdf552452a36cbdb041b37d68eb4d661e6c8 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
@@ -178,6 +178,9 @@ imu@68 {
 
 &blsp_uart2 {
 	status = "okay";
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 };
 
 &mpss_mem {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
index 6a27d0ecd2ad23b462191a5a328a49a76ab13b42..48134e5ff524fd5708db7b9c3a567ec3f751868c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
@@ -69,6 +69,9 @@ rmi4-f11@11 {
 };
 
 &blsp_uart1 {
+	pinctrl-0 = <&blsp_uart1_default>;
+	pinctrl-1 = <&blsp_uart1_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dts b/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
index c11a845e91bb5029e89905ec7dee3b07646dd4cb..c115142df364e99a4f566775d4d1679e6a8920e2 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
@@ -23,5 +23,8 @@ chosen {
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index e6355e5e2177df9e3beba6b2d96a15fb069ce57a..58a548d220a485e9a92c012c1529e3fe838d6c9f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -302,6 +302,9 @@ charger: charger {
 
 &blsp_uart2 {
 	status = "okay";
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 };
 
 &gpu {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
index 7a7e99b015d9bf9686d2b41f7efb76a093c1730d..4290ae7782d659eb0d2594825717ffaf4c84076b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
@@ -304,6 +304,9 @@ charger: charger {
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
index fbd2caf405d5f686a40a59ff7e0bfc78f164e03c..30e34574999c52f7ea99c9bd7af41101e5d4d4d0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
@@ -116,6 +116,9 @@ fuelgauge@36 {
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
index 5ca2ada266f495e4584a5143a8cce6f1f1c4ad78..d4af7856f5f3a70160774d1637e39e19d163725d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
@@ -135,6 +135,9 @@ touchscreen: touchscreen@50 {
 
 &blsp_uart2 {
 	status = "okay";
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 };
 
 &mpss_mem {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index caad1dead2e03c30dd6eb09b457439a9b0446126..45c3b3387b52030a6475ae0da2a2c89ea98ca6c1 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -319,6 +319,9 @@ rt5033_charger: charger {
 
 &blsp_uart2 {
 	status = "okay";
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 };
 
 &gpu {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi b/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
index c77ed04bb6c36dbc0cb7c0b09f50d1f18aafa4c9..2bfe56da8f6c624ed97d8a5750d12c59c039c874 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
@@ -72,6 +72,9 @@ &bam_dmux_dma {
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi
index 1a7c347dc3f08409f7db3b246c04687c666bba32..f5caac42bbad106f86448c217aa1472a32fbeaa6 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi
@@ -93,6 +93,9 @@ touchscreen@38 {
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
index 510b3b3c4e3c4223c64bcfa563e0e080d033d7b7..10d0974334abf0e501ec97e2de487f40c1507f82 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
@@ -169,6 +169,9 @@ led@2 {
 
 &blsp_uart2 {
 	status = "okay";
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 };
 
 &mpss_mem {
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index c89f9e92e832eae8f630555e9e7f5817d6731d4d..733c17d0495617e683d362d7b7aae59078f2a0b0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -2159,9 +2159,6 @@ blsp_uart1: serial@78af000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp_dma 0>, <&blsp_dma 1>;
 			dma-names = "tx", "rx";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp_uart1_default>;
-			pinctrl-1 = <&blsp_uart1_sleep>;
 			status = "disabled";
 		};
 
@@ -2173,9 +2170,6 @@ blsp_uart2: serial@78b0000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp_dma 2>, <&blsp_dma 3>;
 			dma-names = "tx", "rx";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp_uart2_default>;
-			pinctrl-1 = <&blsp_uart2_sleep>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts b/arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts
index 3cec51891aed95968f7b5cb099ae2107691635fb..9f647027d082864ccaa240f7118f20a8d19f6a4a 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts
@@ -126,6 +126,9 @@ touchscreen@1c {
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index b845da4fa23e612f04cf8a8f15b8892e396a8c41..f59647b5b7dfdd7bf630f9d180bb56a10a3ea0a3 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -243,6 +243,9 @@ touchscreen@4a {
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts b/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts
index ceba6e73b2112687d16ee595003c80ea1a93143a..3d9cbe7fdad8808968190d7a744bab29eeb0e827 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts
@@ -373,6 +373,9 @@ charger: charger {
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi
index 800e0747a2f79f6ef9a7d86d56c1a2006207b1c7..cbefe34327ba7b04ea57032c68dd69642e6d1685 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi
@@ -126,6 +126,9 @@ touchscreen: touchscreen@38 {
 };
 
 &blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_default>;
+	pinctrl-1 = <&blsp_uart2_sleep>;
+	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index ca478db63be4578b92d85e178548c5e16b29bf03..67ff2ffc6e455fa5ad8a664a161873507cab6391 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1770,9 +1770,6 @@ blsp_uart1: serial@78af000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp_dma 0>, <&blsp_dma 1>;
 			dma-names = "tx", "rx";
-			pinctrl-0 = <&blsp_uart1_default>;
-			pinctrl-1 = <&blsp_uart1_sleep>;
-			pinctrl-names = "default", "sleep";
 			status = "disabled";
 		};
 
@@ -1784,9 +1781,6 @@ blsp_uart2: serial@78b0000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp_dma 2>, <&blsp_dma 3>;
 			dma-names = "tx", "rx";
-			pinctrl-0 = <&blsp_uart2_default>;
-			pinctrl-1 = <&blsp_uart2_sleep>;
-			pinctrl-names = "default", "sleep";
 			status = "disabled";
 		};
 

-- 
2.47.2


