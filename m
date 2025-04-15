Return-Path: <linux-arm-msm+bounces-54436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1EDA8A031
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 15:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28848581259
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 13:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C63D1F17E8;
	Tue, 15 Apr 2025 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ySUlPsEB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774981B4F3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725206; cv=none; b=t+SHUfm2hTugV8K23nzvOrLv5zSd0Jd7iCwa9EqVDlvSPnin60XAy0yReRrSJ2Kib+9q1I0S0hv+xQURbSrvV5ai8d5PXsKCyySKNSdoHzpwnFLPOaoYcmZw0EmHG4ZRUHYbhRJO86ia0E1xmZpxvMaC3e7z9XR4OO38YGZqnCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725206; c=relaxed/simple;
	bh=JWwoxEMK2A5kDbhJ080c6MdZJuqktgRFVi8Ef7ShjQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZvZ/5VwDmduRXt0iYjrhGlXqUWBVRV+1yaI3aNcID7/0hpM/s0xpmo28UHC67c3koSGov0d20ZmyNbKnFSJJzFKoM8rKshkOSHLRUoLLBzCiSoVtN/lYzbIjWCT6++COrF140rO47MUehHUPPWFW88TkFZaQcuCsvYzBvpyFvHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ySUlPsEB; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so10297906a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 06:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725201; x=1745330001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzowgvGIaxdQmiDRDdrZTttLqfGAIGHXMByDo47trxw=;
        b=ySUlPsEB3vYBsGS1xVnFdaphSHt7LRYeQAyYfwPYNT9teyB71pHVb9/KQhP9rl9w16
         0yzbXnHY7LKNYG/z+WaL94p1ljxIDOo1KWJt3jWkLfwQAfZ+QdwU+jcUhZS2SaQeCOP2
         GsXTNfetQElNS8j96kZZG+MyllcNvhQK8srYh4PbOXCaRmCj27Fv+/lDzAtntww2omiA
         WaJECwzXpMK78Lb20cT9+f+/nAVSqVkWGJLm7MeZ0qwKQXuPKBIKTx8LhFND998yuLn5
         dS1NQfYfHG8vyNeiZhNHoCRizAUkNr2kyV/lFfWVwNxyoQ66cBQIdW8a2n2RxsW5bDYq
         XSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725201; x=1745330001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzowgvGIaxdQmiDRDdrZTttLqfGAIGHXMByDo47trxw=;
        b=ivjhNPSjPUy3c3u9XM8B1Z++wuLtZhloTetTRFT015VOWZpehQQcIzqycBf2gtdXQD
         koNkRm6LQFiDiA/i4snq8qDG2yai190bBjjKj/1e3rOlm76Vi0BIERoTtX2AlcZcTDt1
         QxLQUGyImPLqcAIchtHwQqr6sBYHceMAQ1+eTpTfWa+ia9kH/uukPdJaUu3F1Jvqgac+
         1mPSdWT1kyPwBT8fOryF5FI/lNgEtUjZE4JnMGaAncXZdo12Pob3Pqh+0rKpVz6fgl9K
         MnpzXo0Pj9T081KUKGaQUJXAL9Bq7rxHfVEO7kxqrMHhk7lJWhzT9Wfzzq4tLqjEEmuV
         hGvg==
X-Forwarded-Encrypted: i=1; AJvYcCX5UkjS4i7EkJXvfR1PhceRg7vgGQQqKtsDVPUgclvvCNc6ZxdjzqJPNQ9Asoixf5SliOGU9fbJo7V6weK2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp3DhPHhFOW8kLp/DFR6cSA4GL1OPB+DvtHKAQubE2ZjpdvAvm
	6pgw427murx3sDltflLN9J0Y2Ta9Jg1Pv1YSMTPQSayhJ1tFejFFuR9ljFkjLmY=
X-Gm-Gg: ASbGnctcdhZIYa6+JExiLEqeLHEl7iGzrAzV0OrsEJOFNk/FB4XMqibReZuahI47rcR
	3pB6DTPLzyqZtV0vdovU6n6rIEE9vgGTs9Y6zh9FkqHNidTlVMUvCaF3zm+LFkvs4mci3bnTw0/
	sUjSj7kj96ndv6T6XIrdFC7iokmL3PTHwbn8KtUiBL6ZHhqzhYWGsSE7snnRUxFWokME0VkfvV0
	jdHCNorYTK+O/xt0ntpb1f5TxaGkf8KPHOCu+vQqzrUiPpQrb5YGIO3fTnRyS7TV6VgCbQ59uvO
	NEfBACF0Vdi1CmA60S131zTwBSh2eR1XnGYbXTXMP7b7hDg0diH+F+8=
X-Google-Smtp-Source: AGHT+IE675xAbbKMbD4WeLidcu5LWshKzXZX5noo05D93crI/D9lMfCT+vddCc2faeoXBgbbVScKiw==
X-Received: by 2002:a17:907:972a:b0:ac6:f4c1:b797 with SMTP id a640c23a62f3a-acad349c39cmr1352690966b.19.1744725201472;
        Tue, 15 Apr 2025 06:53:21 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:7b18:2529:5ce1:343d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acadcc21a44sm681379166b.177.2025.04.15.06.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:53:21 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 15 Apr 2025 15:52:47 +0200
Subject: [PATCH 4/8] arm64: dts: qcom: msm8916-motorola: Use UART1 console
 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-msm8916-console-pinctrl-v1-4-a1d33ea994b9@linaro.org>
References: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
In-Reply-To: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14.2

The Motorola MSM8916-based smartphones all use UART1 with 2 pins (TX, RX)
as debug UART console, so make use of the new &blsp_uart1_console_default
template. This applies the needed bias-pull-up to avoid garbage input,
bootph-all for U-Boot and avoids having to override the UART pins.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
index 48134e5ff524fd5708db7b9c3a567ec3f751868c..4e202e7ed7db1921f347ca8b4a01ccec593a8d8e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
@@ -69,8 +69,8 @@ rmi4-f11@11 {
 };
 
 &blsp_uart1 {
-	pinctrl-0 = <&blsp_uart1_default>;
-	pinctrl-1 = <&blsp_uart1_sleep>;
+	pinctrl-0 = <&blsp_uart1_console_default>;
+	pinctrl-1 = <&blsp_uart1_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
@@ -132,14 +132,6 @@ &wcnss_mem {
 	status = "okay";
 };
 
-/* CTS/RTX are not used */
-&blsp_uart1_default {
-	pins = "gpio0", "gpio1";
-};
-&blsp_uart1_sleep {
-	pins = "gpio0", "gpio1";
-};
-
 &tlmm {
 	gpio_keys_default: gpio-keys-default-state {
 		pins = "gpio107";

-- 
2.47.2


