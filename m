Return-Path: <linux-arm-msm+bounces-63169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D57AEF250
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 11:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A44F616B68B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 09:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC5126E149;
	Tue,  1 Jul 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PnPpjfDT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C85426CE10
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360501; cv=none; b=LyqLT+dEW3NRVVNuoUfE9igrTvfPFRGO14DicWhuQHEEUqZFZ8uCSlo55aaupJ5lsRptRa8hKbFM3XtoM8Ryi999mGdtE6SUgdOHBMsvftq2LKQCHi30L+uGbuiQok4qx+tQqDEAAEYW+T4DZQoJGF1kX/rAr6RVrAM6sy5MaM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360501; c=relaxed/simple;
	bh=uvHnH2msY/EEhdauW8+OFxLdafTW6YVb41iivdaVWuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZUjq/xrmBm9g77TA2t2cAhZuu/SpadS6PnSRAhB9e28zWr8P690DN1h+OjyYiiz6XaQdBasn7B4BeWRC4bNsSVII4lOnsbXK7syCrpS/JvP9syCmI5HeeUWA7GhqxDBzBuUKLq2qDj4+ftFYyFdXFBTktW8JYzPwTZyfYuvRVfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PnPpjfDT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so1936666f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 02:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751360497; x=1751965297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAwGOEpcqfQ5XA8qgts1jVeMvxqNoRIIkAwnTTErBaU=;
        b=PnPpjfDT4VnKPFOpMhp0AHs3Wyeq5XYO/bwX9DUFUo4xKgdIvA1SDwWXOoQGhC6SWR
         rUWLiE153bJCnTlaD4cei235vYuzsFepReJqqvaOnC2x0hBV3fKSG4loxsv3vWX7wjvK
         ZPW7nLrQnwM7LGNVx4LI5K3sNjWizlcbwtzHeFGky7OSJfTCTTxVJsLsDfnw2d6iBJSg
         O9bZ2TRaY0eyJE8gPnq1lKzdpou0s6zYmsJDkJE7QFo/pkkdOMejme91XfY/sBIrFI82
         iH6VimW5MdPeCgRwqkM5V/woq3/iPJ1s67R+hCnJXYx5g/1mz9jOrc3xWAm/FJ0aQZv9
         c7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751360497; x=1751965297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAwGOEpcqfQ5XA8qgts1jVeMvxqNoRIIkAwnTTErBaU=;
        b=DblUQeVtk9NkW1NmnDSCrKJ60xAnOtDEmKcqjHrQX1GqErH3NqFYP+o8dCsskLMSYG
         zAVpZ8/xwk8P52nfegKTHhXG7kWm1xMVQDlHKPtV/+BbV4cVgN1SptOrCnT7IhLgMMES
         CwrcjLFI+8/7jLeo+S3GnFXY4gRWYvofAjNgmRFx3vUU+GL/LPiNUcuPOaga6c59NVVM
         PoHjsF0ELUH9BuoF/ACHLcZlR0CgqjjK2a5+/k40BpoPA9TNck+r/XjHTU7mj8c1h3tD
         LD1225dwomwhz6GEMUIL2wcvc+zFMtmih8M5exjIuIXkfqCBceAROuPZnIUkFwlFZ+h6
         SPUw==
X-Gm-Message-State: AOJu0YwB0ulXuqvsCmptWOAMrWDnaN8YxG0BuTuOP3sQQmwa0GwadkcD
	IbDWvdpK9mRcv+eK9SqZaZfrc7LAGivHpAccISwJmLQDWFm3Uk11FMVNCM39Yt654bBt7pDHUoW
	vFWc2AzI=
X-Gm-Gg: ASbGncsxvCOs7HWvdcBr+KOKQJEjvOcNPyray5eoZjl7gUovz3c7awcNXWW48XMf1GI
	Mf4pHqSDb23vyFEwroMOwiFyMHTxlQy7Qz41OBhnMvpwWI+REZwUPLPl8sGGGmnKBuxdfYSnHVm
	uLpzNCwcmarncuelpP1iOu7vMbF73ysa8am50hX5xDedpVqVJM3rzPLCNwuWu6r0XvSg2ywGwGm
	qUwh3WHMNe9FH688JafKHr9e0tGyTKe2d+h2oQlJ4YrqcF5E2M7TSO+y02dhZoozZg886u3tErS
	MvvV1Be5l1IUamZTDih/oaOc453yUsBwSe01TputiUHC0hODZkRrLNU=
X-Google-Smtp-Source: AGHT+IEKLiJwjlSYvzkewZ3Mc3DgP4zFkZCj73DARwviLicVDltHmFdaYp4pq4oHTqYJVCwRf7WuJA==
X-Received: by 2002:a05:6000:2082:b0:3a4:f8fa:9c94 with SMTP id ffacd0b85a97d-3a8f482c971mr14351536f8f.13.1751360497427;
        Tue, 01 Jul 2025 02:01:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ac6ee0d0b9sm6949707f8f.18.2025.07.01.02.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:01:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 11:01:30 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: qrb4210-rb2: fix GPIO lookup flags
 for i2c SDA and SCL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-qcom-gpio-lookup-open-drain-v1-2-9678c4352f11@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bJyr+EolXutUg6Adgg3/dXicSXPwJRQtVm5ZNnaoENo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY6Ptbfuw/p6xVVIdHuJfAtbE1Wrcn08RYYjHN
 jTykXF7RDWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGOj7QAKCRARpy6gFHHX
 ctGzD/90q1XNiMnWpWVXJkXP3LokKjs/5qiLaKEbTlonjzMiB08TpuOVcFLZTYvkTugdoNmx4w/
 Qo/MWdzEfXzQqTbTXANV/sCqhhAhK9wBKLHFu94ks+aIfWZrJ+fsxRfAOB44fKkKfRmG31yGYnY
 gFMxKnh0e0X8GlXeCgpKATnvPoaH57ITtn33YIqFQ4SFG5/VPcpe5UDdbr7xb4iis3KZ/+RrXar
 eyhcYl4z3yDMQ3XQVIhLNlw+LRV2V2pCqrG7OditkIqXpfQeG3WBe5SXfdVsUEf+JQignZbGmbd
 LCOIj3B6cnwbm8NjPDSYCLFYLFtiwM4LbV5dGG7rsJrRfwbHDvVY5ZWZXhFBqL8IEkC2w7ORX4z
 dnrqL5zQCORdW3ewaYTfx+nHJqUl3IUvq3SCjHR2atmzgMvY/PCkYv9Kt8WI31quq2DovPKR5Bv
 q5YwxQ787WDSIKsQreUJs14YfdkeZL2Lur1i8eSMi4CAD3nCab2URVQGo7cazwsTJ9HYgcnlE5P
 MQ93rTSNRR0DpFqxp02s4c5aUSz0a1DYCDyUp9YXJOttyJ8yPaurAdErFBGp/XXACj2XVzJlWbt
 OYhTjesBunbD3MIbhMzuM6fH88tX/U6QhiL+5xW2Yi9iJT3DONPXNPkRGGG3NuWqRXVk6+o6rCM
 9W8Q5WrI/dzyy8g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The I2C GPIO bus driver enforces the SDA and SCL pins as open-drain
outputs but the lookup flags in the DTS don't reflect that triggering
warnings from GPIO core. Add the appropriate flags.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index a37860175d2733214f1b257e84d5cb4821033242..bdf2d66e40c62596b8b024de833835a0750df35d 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -65,8 +66,8 @@ hdmi_con: endpoint {
 	i2c2_gpio: i2c {
 		compatible = "i2c-gpio";
 
-		sda-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
-		scl-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
+		sda-gpios = <&tlmm 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 

-- 
2.48.1


