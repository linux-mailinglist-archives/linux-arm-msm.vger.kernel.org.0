Return-Path: <linux-arm-msm+bounces-63171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1157AEF24D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 11:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB2001BC6D77
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 09:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF72226C399;
	Tue,  1 Jul 2025 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Oy6+DLm8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC43C26D4EA
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360502; cv=none; b=AvntohJqvgFd5WkZuf3ZmlM36mIXzbuO+dRzlUwevXm1+ZJwirQTluuV9f0yfYiEw1ZUdQ2QQMN35f+j1DVK49Sgo2dCfPxk6GELmQX0Uwx3x8cGEuemDv34WSvY8qc4+BUPTHMy0zKdDdx3egPKARtKbIa8lmTr5AtPmhppXNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360502; c=relaxed/simple;
	bh=8I/seT/85wMKp9dokfTmL7c3/ay9b1ucl1JER21Z39Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H8sGAWJesVFm9izgCexgntkaylaRdUGBPU+/ej0ud1GbV/4IUYbAKMfNOn2w/QEt1ImiV2tK7xKeQFbAgQqMoYAcitFDu5zsI9BRvy+WePsfyVHRjVFfknB0KM+GXf8JDQILhpmaDbV36lh/WJzRwSGca7YMLQlx5Ux3nORd9A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Oy6+DLm8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453643020bdso46723375e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 02:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751360499; x=1751965299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEZfpgVz92TePkzW+W3EnTL8/wojxpCAVdg7T0jc8Jg=;
        b=Oy6+DLm8t0eQQ9gOEUWDnWxJqxWQKNWWlxNnsujEpUJkvUoXt2e7VCaAwhxT3vKJeQ
         fxwchfsmfLeJouV28vg9LTDDiqIJF0+sf4nV+FrR9MgKJ3LqCmonlzBb8PNi4ArTiZIM
         iXtJASjr3dy+Aa/setNrjNeY/zZ1HvbDHpOHzkL3A1V7UUgU+3g71FvwhL1s1kbhBez/
         LY++CAK43/l0KfQd8byyz28dpVwrM/zozvmPG7+8i2pqPKKzDCHZ+3PmmhVXM1i+f4CE
         q5ECSOcbpxrdQQ/8XmL7RSMPZJJzU39v+U77qel/2bUKT4Lzx/17MfYFd/S4W52HiP5z
         Y+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751360499; x=1751965299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEZfpgVz92TePkzW+W3EnTL8/wojxpCAVdg7T0jc8Jg=;
        b=L0FxAmsMo7NxwFCC2uErXgmXVB45A/Se2SeW1jSiM86Uvdhq4Fe7ov44JKKBMaozaN
         BAb3oyv/FaK8dRmNGhld+FAqailEwLMzJgtug461vYKO6+tK7NEpdmjTZg+esAwefWKO
         IuNXmGoojq6MBpyvPid6fLrAcAYauJhOaUleV6DXM/sBX+3CeZgYV9HUjXOY2gLU8e16
         Y+MxxYfXSTr+A8INvetyMNwyR174pfgobQ7Snsm0B3NtZjt7uBWMTCvFbTGm41vZCDU+
         Wq8dD8Oqx74Mt7UtD9M66/DCC4JvvW2xpvkFqXPy7w4fsqhZ1SF0/0HtY+8rern5ZQdC
         gfHw==
X-Gm-Message-State: AOJu0YwjQWgnz2pIDQuYtOYq2WY21tZi7JaBneXkfWX2JgJ2tTomGbKq
	tjoRvhC5Jj1tGKbHVukTEkkp/5+nNdsG2dfy9WtaAC678Ff27bmjqYWm0o2HppDAaRw=
X-Gm-Gg: ASbGncuZN9uy97+mf3yLf4lArzSTzC9rIF5gveoNCWkGR6cH3MUwYpU7mJXsfyZVIPF
	r7Gia/IXhF3BSxMF4w88RwUkatzYhouV0cce0zdfbUReZ+5/P5nGYxr2DhSq1i5WQyCCiF0KMGx
	HhjxTDK38g7KNovZCEQtRqpK+KV7YHM+KTCsuTLdd5NgnO3k2Nvpc29CsmtWwGU32TMjmjt5EXx
	Geb4gvhGo3ossu4E4W+9T3vcXwOyKhEEI/U4qV+EZe6ooCyTGxUo5Oo6ahBklkB9UOPANQUDGSK
	YRlUawJJ7luIlYun+/aDATJQFn87/PyD+fKZ3kBPC6gd9msSLEqbAxCDaI5+cGi+GQ==
X-Google-Smtp-Source: AGHT+IH28bGKzShEfA+MLMc8AaPF4kIpkFpzgw9PDmFhy87DLkzQ3JI6j/S8k6ijdDPU+aLJnH1wJg==
X-Received: by 2002:a05:600c:4f95:b0:453:23fe:ca86 with SMTP id 5b1f17b1804b1-4538ee50438mr173879135e9.4.1751360498784;
        Tue, 01 Jul 2025 02:01:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ac6ee0d0b9sm6949707f8f.18.2025.07.01.02.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:01:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 11:01:31 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sdm845-samsung-starqltechn: fix GPIO
 lookup flags for i2c SDA and SCL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-qcom-gpio-lookup-open-drain-v1-3-9678c4352f11@linaro.org>
References: <20250701-qcom-gpio-lookup-open-drain-v1-0-9678c4352f11@linaro.org>
In-Reply-To: <20250701-qcom-gpio-lookup-open-drain-v1-0-9678c4352f11@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+DBS7NAhgqWQc/bDKA/6Q/4j1r/Tyn90fNvYlC5yibM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY6PuTj2gRg7KtMHO6CQKF7GnTfwgNTxTdk9bb
 Uw/5jywPfOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGOj7gAKCRARpy6gFHHX
 cofYEADDt1fgSSrEpySCEs2NfUvmIo4A0wv6ZSlcFxUd34Nd0lQcNH1sqmMsMLCPQrp0TzVQwsz
 q/MYhdDEUnev8ynkrzUtwRPzo+laXWyXrVysav4zrV72aAnjlaXxcYh/f0bjMkOZo/4HSsHgG7B
 wPdwhcF1IYTilQHaKIEgf73qlR2MKU879o6KHR3KCJzOG1IsTX9Ehz2HduFyM/OTj8HtTlahHCP
 zUAoiWRxxa/7uQVvZiYIdkKQKB8QRFWhGvEXHagWS1JAtYe5A8voay84o1jrWHyaYifC+HBU870
 63Ama2CfZKyUO5OOMqhIeGzNU+NJa27w/IPUtQgVhcgb7WJMBly2IYSFWCtAQ4JOC4id/Zm3pbG
 KileB3YZB8rHV2+LcvwcwHq2sWaHherNsxy+mKw9Ms6vMjvOp2P3c2MS0ujUBfO5oZYJveDuCVO
 UGaxuhKrII/t9LxkmJJZrnxuip99hLPC1gC/GRsqr7WjzY1n1ZaNYbHQ1Q+NJfJw2ZC1FohJesU
 kuAGvmlrZbOY/9Ouy558wqPeoWjwTqKE911Sq4BX4cNd9/Feo/JamkAuwJ6ERfRJ2uFHYqZBEVu
 sPe1RaGWbFIGcf6o9smX0JxdP0MFwDFbx3tucFVPykY1rs3Obux6SawdrgrlVNR2yngjJcVejDh
 aduQHULhaJRxUtg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The I2C GPIO bus driver enforces the SDA and SCL pins as open-drain
outputs but the lookup flags in the DTS don't reflect that triggering
warnings from GPIO core. Add the appropriate flags.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index d686531bf4eacae2105bbed3a9d5478b45a4b2a3..9076d8eb4d50af736d5c4de7158fbf32231f6629 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -145,8 +145,8 @@ rmtfs_mem: rmtfs-mem@fde00000 {
 
 	i2c21 {
 		compatible = "i2c-gpio";
-		sda-gpios = <&tlmm 127 GPIO_ACTIVE_HIGH>;
-		scl-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
+		sda-gpios = <&tlmm 127 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 128 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <2>;
 		pinctrl-0 = <&i2c21_sda_state &i2c21_scl_state>;
 		pinctrl-names = "default";

-- 
2.48.1


