Return-Path: <linux-arm-msm+bounces-54924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8737FA966D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 667E0189F462
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25D12777E5;
	Tue, 22 Apr 2025 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pheps0XH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7356B275861
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319861; cv=none; b=BvqNwIgbgEb09DFvp1TAqNF6BeRQOkAzhYEd15GsADmPdxY0ewWeFye2XxsGwC8LAkDoYRps7KRLNF85JXYHVwGaiZPbRKAA/BvdPQu++P0Dlsu2fS87b+UDzmMKFVHefBwRPdVMqLFf1y6DgQeWKTued6dTkqVYzGoFJx9osQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319861; c=relaxed/simple;
	bh=gnvuDCE5wViTdfpznP4LcSJNqnBDKqvPjeQY9ED8tTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ak1gP5jLc0eWtkEp3ZATWmGOn/kW19P7zsd/ShZteF+dpriQtzSHIGI1XDG0Mi8VKmvSJHSL587dyGb9rwZZ8nipJjqFOkc02IEqVhuoCvaTTgZsHbq7n8cEA2UytuasuOFiKwZJbzEF/NNBlpDMXAKxmSN7q5tZpZz0go8tQJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pheps0XH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so52466215e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745319857; x=1745924657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiqqHSuVE8a9FO+9GPj44bI8F9P4MidkfuEFeuU5jmU=;
        b=pheps0XHTbHbiUw+LxFV+oRZJkK2a4Zy0crWSL90FrSOQPHSqgDiBZwd7hCDIL9IQS
         F1bN57UE/h85RLAb9rOAl63p37OnRQe+ixPYtfRjuWVT+ruxYv8q50D6jpj6aRy0KFfN
         o2z57INHdZTdYrjYLtB6ayDcDOVOfdsavF0B2GdCy4Sr1snZotNwUWd49a5A14OIwFhH
         QSfTeYVbgxlzqQvFJWBxmHgDbc+6toWdpKueWCslk6PoHbk1a5kBawiZ3eVcvN7I2ps+
         0sT9U5kI5cMdwHmizs33mChZm2iOqEZ6sN90lzx/n8p+AT+5fo+vF0QSbijwZvdgP1aG
         Rx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745319857; x=1745924657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiqqHSuVE8a9FO+9GPj44bI8F9P4MidkfuEFeuU5jmU=;
        b=PvcvyYaV/pQ7UIGJNND1a3Z6ybyxJKTEgtLj4lPSgK3PWx6e8D+r3s26Rk3SZT6MZU
         0U7p1VZwvdFuFnztDBTULeXaEy3aqzuDANQGYEcMf2qpPPJ6giQ0HwcokAgdEglgDkqZ
         SVTgaDXqk/mW4tZA9Np1BC6n/JsOe0u4FureW4NP7atTr/mk4WWj1qzihGFJOoF9q4k3
         gjeKjLsxvoy2N8c1HdEjcrMTZ9AVe6A7E3P5boYB0aCdHO02GeLu4qg9k5dMjpn37Yf5
         P/Fic/zkclZsgb0xLTsIUV1SW9I/X+RtFYwqtMRXhC68/T86HysGuw4HfjWmY5lKzXV4
         4bAg==
X-Forwarded-Encrypted: i=1; AJvYcCUafdLY0dokEPGDJJZnSCE9DAsX4GD+sn6GgLxSIyp3W20qBgLQuqvANTgcgLXGTkcrhISCPhrVSNOjPxIe@vger.kernel.org
X-Gm-Message-State: AOJu0YxReFwGRw+/G9l3NOIvjtirRx9wLlgafzcQmueLls2U5sDpqrBJ
	w25lzRSquw4rpp+/0EfRl5YK8QDkoeYk7nUPcCzp+GLb7G3cfoxKqeiTbyxe3do=
X-Gm-Gg: ASbGncvtW1KaxOA/2vtWRUw5UXnc1D//caIqwE2ztl08vuLashIdtzx+Fwt35WiiPK/
	GABNdUybbbg/BKuzcA/LWtP9Kb3yc438iEBHS6P806LdEVcrEFs9zVj5R67uwsJk31cYApLgHx1
	y03cx/Nxnio6fojIywtiMdMyJby1YcDWm9RJSeRC1JTDv9hMfA6iQaqL09oSaSvO2PUb45gQK0i
	ZTuiPVcaOV2FRJWNVRD/kXQqbKwsSwoerYD5enUy72gCB8K23SfuoYZjI1wQ7cgouKwijiTZIa6
	LPIVkktqDrz9UoiNhuNG8cVSnnZSQiMHQyqsQvnrPRObSm7KDBF1m4A=
X-Google-Smtp-Source: AGHT+IFhIj/+fxqFFGCZWpI1l3XTSVLaNNlkDp5FGsKsa9Jqm21q7ahc253exL1WWtl/0BYNjY8s7w==
X-Received: by 2002:a05:600c:3487:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-4406abfab7dmr122554515e9.24.1745319856605;
        Tue, 22 Apr 2025 04:04:16 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:8847:e39a:2a2f:e614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acddfsm169609725e9.15.2025.04.22.04.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:04:16 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 22 Apr 2025 13:03:49 +0200
Subject: [PATCH v2 2/6] arm64: dts: qcom: msm8916/39: Introduce new UART
 console pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-msm8916-console-pinctrl-v2-2-f345b7a53c91@linaro.org>
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

At the moment, msm8916/39.dtsi have two inconsistent UART pinctrl templates
that are used by all the boards:

 - &blsp_uart1_default configures all 4 pins (TX, RX, CTS, RTS), some
   boards then limit this to just RX and TX
 - &blsp_uart2_default only configures 2 pins (TX, RX), even though UART2
   also supports CTS/RTS

It's difficult to define a generic pinctrl template for all UART use cases,
since they are quite different in practice. The main use case for most of
the 40+ MSM8916/39-based boards upstream is the UART debug console. The
current generic template is lacking some properties to work properly:

 - bias-pull-up for RX: Generally, UART is push-pull and does not need pull
   up/down. Both sides drive TX, so RX should never be floating. This is
   why the current pinctrl in msm8916/39.dtsi uses bias-disable. However,
   this assumes that UART is always connected. For the debug console this
   will be rarely the case on mobile devices, only during debugging
   sessions. The rest of the time, the RX pin is floating.

   This has never caused massive problems, but it's obvious now that this
   needs fixing:

    (1) In U-Boot, we have been fighting with problems with autoboot for
        years. Most of the time, there is a single \0 byte ("break event")
        read during boot, which interrupts the autoboot process. I tried to
        work around that by inserting some random delay [1], but it turned
        out this is also not working reliably on all boards.

        What happens is: Since RX is floating, it switches randomly between
        high or low. A long low state is interpreted as "break event" (\0).

    (2) In postmarketOS, we used to have the "magic SysRq key" enabled by
        default for the serial console. We had to disable this at some
        point, because there was a small number of users who were reporting
        sysrq spam in the kernel log, possibly even crashes/panics
        triggered by sysrq.

        What likely happened is: SysRq is triggered by sending a "break
        event", like in (1). With enough luck, you could even trigger any
        of the SysRq actions if the RX pin switches between high and low
        (e.g. because of noise introduced by the LTE radio close by).

   We can fix this using bias-pull-up, but this may be unneeded,
   unexpected, or even unwanted for other UART use cases.

 - bootph-all: U-Boot needs to know which pinctrl to apply during early
   boot stages, so we should specify "bootph-all" for the console UART
   pinctrl. Without bootph-all, the bias-pull-up won't be applied early
   enough in U-Boot to avoid the problem with autoboot in point (1) above.
   It doesn't make sense to specify this for the other UART instances.
   bootph-all is a generic property documented in dt-schema bootph.yaml.

Define these two additional properties only for the debug UART console, by
defining a new pinctrl template specifically for that. In the following
commits, boards will be converted to use these where appropriate.

[1]: https://source.denx.de/u-boot/u-boot/-/commit/ad7e967738a9c639e07cf50b83ffccdf9a8537b0

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 45 ++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 45 ++++++++++++++++++++++++++++++++++-
 2 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 733c17d0495617e683d362d7b7aae59078f2a0b0..07ae0b921afa1fec7350467cf1b299fe91112a60 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1247,6 +1247,31 @@ blsp_uart1_sleep: blsp-uart1-sleep-state {
 				bias-pull-down;
 			};
 
+			blsp_uart1_console_default: blsp-uart1-console-default-state {
+				tx-pins {
+					pins = "gpio0";
+					function = "blsp_uart1";
+					drive-strength = <16>;
+					bias-disable;
+					bootph-all;
+				};
+
+				rx-pins {
+					pins = "gpio1";
+					function = "blsp_uart1";
+					drive-strength = <16>;
+					bias-pull-up;
+					bootph-all;
+				};
+			};
+
+			blsp_uart1_console_sleep: blsp-uart1-console-sleep-state {
+				pins = "gpio0", "gpio1";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			blsp_uart2_default: blsp-uart2-default-state {
 				pins = "gpio4", "gpio5";
 				function = "blsp_uart2";
@@ -1254,7 +1279,25 @@ blsp_uart2_default: blsp-uart2-default-state {
 				bias-disable;
 			};
 
-			blsp_uart2_sleep: blsp-uart2-sleep-state {
+			blsp_uart2_console_default: blsp-uart2-console-default-state {
+				tx-pins {
+					pins = "gpio4";
+					function = "blsp_uart2";
+					drive-strength = <16>;
+					bias-disable;
+					bootph-all;
+				};
+
+				rx-pins {
+					pins = "gpio5";
+					function = "blsp_uart2";
+					drive-strength = <16>;
+					bias-pull-up;
+					bootph-all;
+				};
+			};
+
+			blsp_uart2_sleep: blsp_uart2_console_sleep: blsp-uart2-sleep-state {
 				pins = "gpio4", "gpio5";
 				function = "gpio";
 				drive-strength = <2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 67ff2ffc6e455fa5ad8a664a161873507cab6391..52a99aea210e04f04f3d25696ecd6b9c604c743a 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -919,6 +919,31 @@ blsp_uart1_sleep: blsp-uart1-sleep-state {
 				bias-pull-down;
 			};
 
+			blsp_uart1_console_default: blsp-uart1-console-default-state {
+				tx-pins {
+					pins = "gpio0";
+					function = "blsp_uart1";
+					drive-strength = <16>;
+					bias-disable;
+					bootph-all;
+				};
+
+				rx-pins {
+					pins = "gpio1";
+					function = "blsp_uart1";
+					drive-strength = <16>;
+					bias-pull-up;
+					bootph-all;
+				};
+			};
+
+			blsp_uart1_console_sleep: blsp-uart1-console-sleep-state {
+				pins = "gpio0", "gpio1";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			blsp_uart2_default: blsp-uart2-default-state {
 				pins = "gpio4", "gpio5";
 				function = "blsp_uart2";
@@ -926,7 +951,25 @@ blsp_uart2_default: blsp-uart2-default-state {
 				bias-disable;
 			};
 
-			blsp_uart2_sleep: blsp-uart2-sleep-state {
+			blsp_uart2_console_default: blsp-uart2-console-default-state {
+				tx-pins {
+					pins = "gpio4";
+					function = "blsp_uart2";
+					drive-strength = <16>;
+					bias-disable;
+					bootph-all;
+				};
+
+				rx-pins {
+					pins = "gpio5";
+					function = "blsp_uart2";
+					drive-strength = <16>;
+					bias-pull-up;
+					bootph-all;
+				};
+			};
+
+			blsp_uart2_sleep: blsp_uart2_console_sleep: blsp-uart2-sleep-state {
 				pins = "gpio4", "gpio5";
 				function = "gpio";
 				drive-strength = <2>;

-- 
2.47.2


