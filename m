Return-Path: <linux-arm-msm+bounces-54440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65231A8A034
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 15:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1981B1901064
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 13:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F3A297A40;
	Tue, 15 Apr 2025 13:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v9jvvfyW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E401E8327
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725209; cv=none; b=QPZNJqBzo+b2WcmQoX4b7tvr0Aougzv64BDzroHPPYggcW1FHSwnnuXKiM/azSQeBFFajA5S/pH1k0hx2j/bKv6n8JCgoTKCOcie9vgz32Qqdh0jRlr4sLiLmnqBOA6BqaqjZO2mFxkGQBGgG5e6oiSdOoaCER6+7ws9hoVO9yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725209; c=relaxed/simple;
	bh=ZIi3kcYiMso2WJn9cew3pYXvwn9ZXc1TLzpsXS99dGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oJ019oOHPG2yFbYxin/Mv5S89492bniz5rS5wQp4tNYO3iwAAQEb9p6VbGuu7eY7jkMiK1DN6ibpr8j3AQyrNhTHvYYn64k4FzoLYZvMd8lD0EDI5lVLV01FtTmLQCs8LkoVx16kFu4pTe89uYbYw+JQXW8ex57+8GB9I/V3sYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v9jvvfyW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so2550075a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 06:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725204; x=1745330004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MYD5mLPfBJwtdhmSlhM/n7g0njzNNoiH91RzZwtKY0=;
        b=v9jvvfyWu6G0l2ckXMU/H8V5aLqKncBMZafm55nGih2VSuAFGtgZhrftroS/wqo3L0
         s5GcHpWYI3eshVYJsVddUJDw6XHWb5FT1k3i8mZoMi2mIMzV0a2V6HbDf31T1VbMsuJc
         leiIdD9BuMaQBPrSXvPGVa+a6375hLPHrSXRTcmhHvCJoV7tp4B0IqRyxv9M+f5LE45L
         8US1JaProNJM9M+SqGViI5YObyONRr9fDJxAueb3GJXYQDA0k0JKlCBxz/E/rTKnMoF0
         dMv1gxVSGEi9ooqHcXlydc3B0MQvIOAOt7WzO75qo5rT8XKAhnYC3ozCvWSYrIsOwiBf
         /yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725204; x=1745330004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MYD5mLPfBJwtdhmSlhM/n7g0njzNNoiH91RzZwtKY0=;
        b=vnSq4JUFY1n1nxmvfwNRI3L0gECdaSVPUa3F//hC8omiIln/1a3MBiov0Fgb/654Sh
         O+zCC/386bhxbd9cOun9l37cif2BKc7BododExSq8NQOByZZ1/hhM06oSCsPuDufpLDR
         oM+flZ4w8s/eXkgfjTWg5i954Zm2Nd51H86loL4lutf4bkrwhuLW712/4BzOaU9H9BUA
         IfQ3jeUudU2A+n8sn1j9+S1/BPmGJIkzpCd32yn0fvYIg7/PUP30b5nXgzAa21gl3KJ5
         eIwoAF0gr9AEZR1EZiGIoL1hsjGsnbT/lDCxbWFa752MdpYOsY5PpYTUUpFAlyVgX0r3
         UOuw==
X-Forwarded-Encrypted: i=1; AJvYcCXY/y88CEJgmwfFDN7YUbHVAFHRq8UY3VJH7ARnU/4yuwSDdBoZ58tvJjEzQdQjPGSCUVyuz6WRYqk6V8DT@vger.kernel.org
X-Gm-Message-State: AOJu0YyMNzKZ7xY/CD69AKvbTrot6NQ2fQ/JrjsY5Hf7w8YDoK4EfjEu
	NQj+ZvxEJYrlXfLr8l0jPl6DCXXin0+cYGRR/RuDkY/0bdX+23jSTemDIlOc0io=
X-Gm-Gg: ASbGnctHI5i8AgdVOIitXwjUBrbf8pBBDSOhPd1G54NL4P1/4BbqxNBcJUl+Fd00OsK
	g9NiuyzZoCQaq5jHROAJMl2MrpNoEFN6VzeWTTNQr9PBR3bJFOKkK8nfDuf3JzNg7AACmQuofYl
	SFqYFS6GkI7gEz1rPNrjbV/ZW6scMzeM89H4FLflXNlT9jKd3VfQgxd1+TaR9v6Z2S/MwH0y2pr
	hvY6fa6a8F8q2Y6377/B+VrY8HiA+EcbFcDCwLRd2EMgkquDNoZt+k3dJ4hOd3Oibml7PLkjDhy
	2mA3AhnReYkGWBrh43E4PTR8QKgVqAouFh3GaDNQed85Tx92O39tupM=
X-Google-Smtp-Source: AGHT+IEVRudoi2scqh4XMCLq7eGU/gtugjegdf6OGs4JINDcEGAAHxM95AejGZDsKYMpE+VTCck6EQ==
X-Received: by 2002:a17:907:3d4d:b0:ac3:8626:615 with SMTP id a640c23a62f3a-acad36d62camr1778426566b.49.1744725204133;
        Tue, 15 Apr 2025 06:53:24 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:7b18:2529:5ce1:343d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acadcc21a44sm681379166b.177.2025.04.15.06.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:53:23 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 15 Apr 2025 15:52:50 +0200
Subject: [PATCH 7/8] arm64: dts: qcom: apq8039-t2: Move customized pinctrl
 to board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-msm8916-console-pinctrl-v1-7-a1d33ea994b9@linaro.org>
References: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
In-Reply-To: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14.2

Prepare for removing the generic UART pinctrl templates from msm8939.dtsi
by copying the definition for the 4 pin UART1 instance into apq8039-t2.dts
and apply the override to limit it to 2 pins. Having it defined separately
in the board DT file makes it clear that the set of pins/pull etc are
specific to the board and UART use case.

No functional change.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8039-t2.dts | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

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

-- 
2.47.2


