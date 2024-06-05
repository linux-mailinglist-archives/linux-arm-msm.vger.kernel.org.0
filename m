Return-Path: <linux-arm-msm+bounces-21736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F208FC713
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 10:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63873281DCE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 08:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E5C18F2FF;
	Wed,  5 Jun 2024 08:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KFOgKVgL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294FD18C35B
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717577767; cv=none; b=eEX7PGTSGaIyaQuXAuzc2dQTGpeXnYKe0pGg35Wpm8vif3cD3jred95g4Msetf65qZ7ffG0qHi/1DIyJVEUas68/M/AFM3Kc15rl2sv2wD8OrPs4TyyxSSsmViMdSur4GmTfc2ML33LoP48OpYTNPsOiMbSydYdosIv3EiVYfRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717577767; c=relaxed/simple;
	bh=JimJ2WKWJoWSbde6de8NxEi7A9lLOi4dbNpKH7X4d1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ntXdkZ29IVQv1mN+fVSgR4AxuQtLkQirnfftCwS4pLREMQbYQALQNTgUjGM32XkAJGis8sopPX74AZhcFS2N4TOT6ZNO2DUTaxMwblpr6SrW9wGEI8A4+lp0J7sPvIuoOYbgqEVUagI8dPnnrJuM9gJXBtcxs/4rvdbiuCpPYW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KFOgKVgL; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b94ad88cbso5554702e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 01:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717577764; x=1718182564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqEUikhtDVFjEcI485X9HiAEizf3mzMtkmWG+aaEE8A=;
        b=KFOgKVgLz8XG8akFwVHkk4id0JNVd/zwtbbHwVk5qjf1DzGzmGYGbCICkfxfmTbXfH
         9pJR7IqaXWLu6Pu6V8QoOcFzF91oTrxMsCP+PZXMTXoi+WsLKzZijOE1BzEwpo+nWP0l
         F9gnrFopdsLXaTFb/vJxevR7EhaBbJb1d5fHBXDccxp+olRb3PxtZ1PYysocXpvi6FPX
         tLUkS0bqjYm3ZFXECpTJdPItcHIaw/gkA6IcBMyXnG1z3ouZv+uVzFFg0zomqbwfIpWc
         FRt3H4kIz0mmgXgihB9TSREAWTuiuzwnkzaXgzEm8/wd9ZzOp2FgJwNTyuELKyliDfLz
         jL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717577764; x=1718182564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqEUikhtDVFjEcI485X9HiAEizf3mzMtkmWG+aaEE8A=;
        b=E7Rk1orXTDalwNS7NIT+4PmChyyw1BtyVg3On9dN+8EJMdW0Y5JLQgXbhkKM0sI+Ck
         lBHW4zq3DCGGGzXI3H4wCJi6Lm0hAMf9B9wy8sQ4ZFIjpWsVNG3uZ1Tlfw0ZCL6P8jWA
         0TgL+XqqhKMNnlah/HRqF1ul5HEXenvaTsI8O1FBh9km85GXBe8C9Y47lMGL0lAsNq61
         NQFMaHs7I9mkjSVrv0SeF+0Xm8Fqaz9SMZttTI9j06K6XMP8FpQ07NhZc7fWkY+b5xVo
         y5Vv3Rks2msApMFRvTXuFNwz4++aB0hcoNJb62S5uBiB4mD8DU/TjY1nT59xbv8rQVlK
         a6/g==
X-Forwarded-Encrypted: i=1; AJvYcCWfedojvq4mv8U5ipoJOjH6uYXX9W3ovMHDCkM4xmBo2922DYwu3f9ig0r1vM2EIDpEPOxPH43ke+y0IpfNLePPoM/TCBmIMjxEhxv24w==
X-Gm-Message-State: AOJu0YyBPGr/bE/k4xBUZSVVC0oBkAkQXMx1H9SR0J4T6MUhUccMdkLH
	lrdrSXAf6qyxBkuGZW5GUox8/oEuXQ8mhDaYtdq0/c8gsPwUf0ZbAyFXo/O3Ofs=
X-Google-Smtp-Source: AGHT+IGDwja78Rvvvf5+U4K2XTt1TmZqI4X52cKE9aRdYun8E7uFAXsKe5nG3KKFgOjR205k/hDDrA==
X-Received: by 2002:ac2:4949:0:b0:52b:8417:fa94 with SMTP id 2adb3069b0e04-52bab4e6994mr1326729e87.33.1717577764439;
        Wed, 05 Jun 2024 01:56:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f55dsm1715321e87.72.2024.06.05.01.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:56:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 05 Jun 2024 11:55:57 +0300
Subject: [PATCH v2 2/2] arm64: dts: qcom: qrb4210-rb2: switch I2C2 to
 i2c-gpio
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-rb12-i2c2g-pio-v2-2-946f5d6b6948@linaro.org>
References: <20240605-rb12-i2c2g-pio-v2-0-946f5d6b6948@linaro.org>
In-Reply-To: <20240605-rb12-i2c2g-pio-v2-0-946f5d6b6948@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1506;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JimJ2WKWJoWSbde6de8NxEi7A9lLOi4dbNpKH7X4d1A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYCgiA4lLxMV6lFXqvgHShtbOIvKMDyXjoGGKT
 dduqSktUCWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmAoIgAKCRCLPIo+Aiko
 1YT+B/9ki4zwj3Q/i+HkXQc0zyA+go7ug0uz/NQ5xfTM628lK3uJTwcFg1IZXlnD4kdjhCm3L/U
 vEChhdUnJXgXMSw93qVuKIYOT7FbuVId3qOCWZtvwrqoAq4obRePXicpWjyor3w+EtB0w8QO2B3
 S2bj1amDG7DFHps3Pvm5nq4LZEYv7BlffOwPqNceSmLufG3j6d3XXst0jARPcQNlj9+26Sx4hZ1
 FaKywQBdxmjHX8BXQiAyTgDP8tR9rlk8mhPTCweccTXnQJDuwY/nqsr9h7JosyP9ll18pcke6aE
 SV8mWxH6pSrUxXqpMQhnUvkm89Od05UcKpWqThtcCfGKQsLD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On the Qualcomm RB2 platform the I2C bus connected to the LT9611UXC
bridge under some circumstances can go into a state when all transfers
timeout. This causes both issues with fetching of EDID and with
updating of the bridge's firmware. While we are debugging the issue,
switch corresponding I2C bus to use i2c-gpio driver. While using
i2c-gpio no communication issues are observed.

This patch is asusmed to be a temporary fix, so it is implemented in a
non-intrusive manner to simply reverting it later.

Fixes: f7b01e07e89c ("arm64: dts: qcom: qrb4210-rb2: Enable display out")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 2c39bb1b97db..cb8a62714a30 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -60,6 +60,17 @@ hdmi_con: endpoint {
 		};
 	};
 
+	i2c2_gpio: i2c {
+		compatible = "i2c-gpio";
+
+		sda-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -190,7 +201,7 @@ zap-shader {
 	};
 };
 
-&i2c2 {
+&i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";
 

-- 
2.39.2


