Return-Path: <linux-arm-msm+bounces-25777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 664FC92CCBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 10:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96CCC1C21949
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 08:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CBD45C18;
	Wed, 10 Jul 2024 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vX80bix+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D3F84E15
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720599512; cv=none; b=qyyz+YME0meTb+pwPypBeK2TDNkPdvBOc+P8Zk+u6VXQuz40nIh0mmv8syPQyt8QPRCcLrFqsdY3MZKmjauQJvcyzAKcyMvUTgMe7vr2Brh6GyvIJBYhjDYyh2ekCcsg5znPlsGfWzec5SIo5EX8LtJpU0oPI6v0xfy2UN6OUCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720599512; c=relaxed/simple;
	bh=9m1cbq5+8fHq5QuRWShEEghuif5svrqXetyTg1PqpTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BX9zJvnu24kcabz9GhzgCup+KisiBdH0geaD8ow/vRf+40uFft60O7fdSg/XjezHnrcEvPjQweMXVE+HvbfymtSJGWnOVe7KNzdO2QdrlMdTxe9R58PHC6lHqc7ijRofXjsMeohBoxjmzYk62/mUVA/0cL4C6VOlTTOnRn/4q3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vX80bix+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4266ea6a412so16583355e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 01:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720599509; x=1721204309; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bwAYm3giDAIxDvJE+ZVtguYZXVFd6y+Ue9mW9JsRY5Y=;
        b=vX80bix+Dgbkr/EHFarXPmcmehnEqAgRcqedtSL9s1Ths2Ze7gTdiGRc8RaWC6jElA
         kqphoe6cbF2F0CrlAmhagskhMd/BGjR11e2jKrtgotFyzzYH5Ls3GIgInRWMYSru7lyv
         61GxbCrOj6vv7q99YI5qu1dltvCevNmj8M0secbXQT4tiitg7T1S6lwCODEg9wW4stAd
         MIK1/9y54yVFr9BDawrFI4J98gBmnPL7iDlSADjc3PPGBsJ4bI2uBF5M+wjrH6aRjZOd
         czoCyUgZrP6E0Wn/6uuQRIDfUqXNodD2ZWTwZ9Hg5G34MlYTqERBws9Km8Sdr4PQBEW2
         ZqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720599509; x=1721204309;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwAYm3giDAIxDvJE+ZVtguYZXVFd6y+Ue9mW9JsRY5Y=;
        b=lQhdLS7bXfi0Q4458bcRZeJS9zxOGaLSF1U5GTGCUZy0JcZINDn7vnnlLR8LldTKuz
         3KfbeYNcuYfZ+KGXcBFGJYgsSKLwAetkndZ0GAJPsi0fMM+yXWg76Jwvf8MQVLU608U4
         /LKsKlc0bbjPapnHWsna66yto/JEHvI7Y/2KjHxGdWzFRNIpdBOmO/YTxC5bVC87GMRE
         B07iT1Q8vJaQhwJl1uydz2jDy5qssIdwJ/VRB60nqqYEYyLSeFt0KT2uCT4u8Mfw5Nb7
         6A2qWr2bZuWXjwTb/UedhWaM/2MNvAnckhQ5hCRTB4JxbHD+NYsMos6b1Ov3kIvTohxd
         OXPg==
X-Forwarded-Encrypted: i=1; AJvYcCWwgFJGRYmghvmaRGuwki5UPYwK1VG+W62ejTGkL0uNwDcZ16DNRHN2f2qMjacLM9DMsBO6DKuCYriFSZFJJOsIlp9O0hexvK6n4HlAvA==
X-Gm-Message-State: AOJu0YxxIAGAtEC/8wGc2OhDRrUvJeGWPJ/THjrkjJBrpN/qHF19wRbR
	jTRNezjIfuGpKVuCrGQ475C85CtQP11TzcDmMNSXQ3GNunjQSxm9odU7HJwyscw=
X-Google-Smtp-Source: AGHT+IHpF1MhI7/EXpOqXVUyQNe6vrR4Kn5NV63JCW0Z9wBg7sQ08z+KHfUxlkbSCr3uHNLxH/tesw==
X-Received: by 2002:a05:600c:2247:b0:426:5dc8:6a6a with SMTP id 5b1f17b1804b1-426707d7fd6mr32852885e9.21.1720599508759;
        Wed, 10 Jul 2024 01:18:28 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:97f4:d77f:bb51:56c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f7362d9sm69818915e9.30.2024.07.10.01.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 01:18:28 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 10 Jul 2024 10:18:20 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100-crd: Add LID switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-x1e80100-crd-lid-v1-1-0156e8a62af6@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMtDjmYC/x3MQQqAIBBA0avErBsYNSi7SrQwHWsgKhRCiO6et
 HyL/x/InIQzjM0DiW/Jch4Vqm3Ab+5YGSVUgybdUa8Ii+KBFBH6FHCXgJ2xJgZeXLQaanYljlL
 +5TS/7wcMvHvKYgAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0

Add gpio-keys for exposing the LID switch state, similar to
sc8280xp-lenovo-thinkpad-x13s.dts. Only the GPIO number is different.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 6152bcd0bc1f..889253ff5408 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -6,6 +6,8 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "x1e80100.dtsi"
@@ -49,6 +51,21 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,x1e80100-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -918,6 +935,12 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";

---
base-commit: 6fd4da15c334831a865d4700ceb3ff5a917163e3
change-id: 20240710-x1e80100-crd-lid-4393fdebaf92

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


