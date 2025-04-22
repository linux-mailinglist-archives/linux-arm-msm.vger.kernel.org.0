Return-Path: <linux-arm-msm+bounces-54923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3AAA966D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E45147A5566
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E3C277026;
	Tue, 22 Apr 2025 11:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bd8ZeDW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE227275844
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319860; cv=none; b=Ev+yi3yqpBq+63u/uqY3X7dqLLRN54ZLNqFAQCQZkl9ugMB0IngpjEsy8OMRM//P+eBYyh4ZvC5iQMqcrsM5OyxCY+bw5o5o4R+XBwG4y3UQJoKtuE0mSg7ycDtzpOscW1TzMx1XZBTH16txzHRYaEIlHKWwpy+meIXnkYGaC94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319860; c=relaxed/simple;
	bh=3N5Ve43An8QWuTz96AT+otHRgtWvki3oNy+G1iIdE5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tl3wxZ3Kyd4vp8jaL0u12Ht01ZwnpKamzd2Vcl9u//G6Y51YhhfxqL1vgpFOFZjL+0wjHOlPRqQMcgG3v95CEhFcKIE8kk7pP6OsgWYZKmgKWsbAy5mIxgUHaYiX4REG4jUNBtOJy6KKtzDlhBLpuj6qzTA/AkVbVLyyGuRMmwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bd8ZeDW7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso32254725e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745319855; x=1745924655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=If9XTmcLRrnHI4RWCMlR8qmU9GvmhXCv57t5L47NjK4=;
        b=Bd8ZeDW7f4dhQh9jYp97XC/XJWxPQY6N2+xiz5ezZ6p9F3XxvGTFbIxHTU6mStgY08
         YsHOYPeFd9A4Lv4yWypnPKaMwiAGWoyZVRPaTRJ4wq97gNHW3cLbvaYVmbD7R50qMVzD
         V5OWFDFVavDPF7s+s7yy0CH/pIpFl8v0RPsrUF/WinKgOh0AVmMQA+aGziYhUIPsVsEI
         J0LGxcVB2axqpHhkxiQH73edpA2qWTKcE/VfHWm7EUQcbSHhjl0Ypz43O6CVpw2O3kXt
         22WfRrGoGDI4qhjKQm0cz5PY065gLn2VgsA2P//DYYrZhriwsDCIJx8jn6syHVTas4Ij
         967g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745319855; x=1745924655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=If9XTmcLRrnHI4RWCMlR8qmU9GvmhXCv57t5L47NjK4=;
        b=ebQYWZxysKDd10+LJ3vDDx3KCRg2AjWojRm8JmLB7MtxNGZNxFI5rI7HgL1xYWaNiI
         6ANBE5uH6qWp6Zg+saUjgANDdpY9XMAaaOSFR+8JUR8Oiyf9K7sNAHwlDx9EdrOw4qsd
         oXxyobDl29HG75MHIvV5POeZwnI/b1bd396vJeezOljr+t9vx5HVGCZg98+EUxBFFr1q
         5ZKfB7cR9+hXlD6UdcQssp+8EfLfVO+46DZfsJSDkkZa5Sx0j0qRxJf1NfpgSYU9oVXI
         DmAyHurBUQHQ82vwQm88DWhca87YIlFRsM9UccO9Jmvt4uGSPfQjry8kpY//4ifcDLtP
         5zdg==
X-Forwarded-Encrypted: i=1; AJvYcCVguoPS5WOvur5GgD9HF5/Kb9Z+z17ZuMHUzCkX521tyQeuIUczGO/HGSmt5a3XYhXdwr4x1eXWX1jog1T1@vger.kernel.org
X-Gm-Message-State: AOJu0YzMz0bMr5f25+HGOn4nQkQVSsGm1z7v9ows4twwzKHI33PUvX9Q
	vtLW0CxL3p8s5/zeV4wzvtHgbSQq8bVn3jaBT0N5hgfB0mbkG7I4fooxhtJ0Bjk=
X-Gm-Gg: ASbGncs5lw1hpmtu4hOgj/ObEefq9HLm+ioMCh0nA4l3Pu1bvrzovGSQX2oVbm4Rdev
	kK9TzVlRF0E9mBTAnmKqVAEoyes/xJM8aI9yG8W4fglpXOJYSHvfevm8gV8QbRQkz4P1fhDohil
	KEjhwfKTVgS3X3I3zUnoiIUMhQXDiJljdiuwI7nPnEf49wyBQLyNC55JglnkJ863qNH7Zs2u3rt
	IQV9DA6Vkgm2cVcHBRT3TnlLH7CAAVOxtRAsEj1ExS1Lx5CqtI26m0RtXJ7m9ecwn60908FfTmm
	6OiKd8Ut62MXA6C8JGAChG47xoEW27RK6GeQcTjlvtm2FhsmxYpniqA=
X-Google-Smtp-Source: AGHT+IE+wbZyfYA3nAUWkN+o2Qxtu9mdlvLXjFSbTaFocunOJ/i9+w5AijAEZ8JK3UwFV4KzSXhObQ==
X-Received: by 2002:a05:600c:3acf:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-4406ac2040dmr136456695e9.30.1745319854870;
        Tue, 22 Apr 2025 04:04:14 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:8847:e39a:2a2f:e614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acddfsm169609725e9.15.2025.04.22.04.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:04:14 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 22 Apr 2025 13:03:48 +0200
Subject: [PATCH v2 1/6] arm64: dts: qcom: msm8916/39: Move UART pinctrl to
 board files
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-msm8916-console-pinctrl-v2-1-f345b7a53c91@linaro.org>
References: <20250422-msm8916-console-pinctrl-v2-0-f345b7a53c91@linaro.org>
In-Reply-To: <20250422-msm8916-console-pinctrl-v2-0-f345b7a53c91@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <casey.connolly@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

In preparation of adding a new console UART specific pinctrl template, move
the pinctrl reference to the board DT part. This forces people porting new
boards to consider what exactly they need for their board.

No functional change for the boards upstream.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


