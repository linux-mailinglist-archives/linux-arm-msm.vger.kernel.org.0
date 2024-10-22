Return-Path: <linux-arm-msm+bounces-35444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 287EE9AB281
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55C3D1C21E3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C29B19ABB7;
	Tue, 22 Oct 2024 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tG0djMpu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD301AA789
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612079; cv=none; b=NoY4YGm1r3s0ksUissWPdFxw1RgbFoWu1FC6GGTTJQzwLKZTpCx6z6kPLlcCIoDAEsELt6tVzQoi00xU4AmKmiadLlCcHFk4PhuqgALNIXRU3A8Ns9bWcp48GRae0zdXfguN2g+NobCVjwLFDXVCv8dszZagzUsF8z6680tUxg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612079; c=relaxed/simple;
	bh=GcmigDyZAHp7zbGoBym5nEfSWnlKu7XTHgqkT9Vecx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bh7v3L6rIbOAZzfqaANyN05ljEW+VZTqPto9aNftWnYHLwjlQD7ov49ZNLsHAgdMa6rOyxZV+JC0IV9b+/ddJ76rE5N1+1HD4zun5W0h+xi7+MrBtPJcZBmf5YO0e/oUoPmD3+y26Ib/aGyCPDIfanPly6ppGM6LLU9WWy0GMqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tG0djMpu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d5100d0b1so508171f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729612076; x=1730216876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBbC0Aq58Xt7Rl73gnLhqqgKUE/KmWq4fUllvPU2g44=;
        b=tG0djMpuhsAPQ7Ohye6PeZ3Yo3/9ren6hMvUd9WJTJ6HOCQ4XnJY00ZaDeJnJFZSJO
         lfqwqTarQCzR92nNcVDt2j1sSvQ3+UN3/LYIXS7lZEjcO0XUmJZadPcieRsMLziwJu6O
         Olj9GmvW4mRrtIs/xwXYCznvI3/Zv8lNCauuAl4X7/SJpHObFpBhqrXyIY9RNtotzVI6
         kxB0BFFlca7COQrVcRhfPlN1wH1WWA9RTlORHC96D1zO2wFjxPkZoeZK2s2wY9/TmuZm
         S3GgG2gxKqXTe1lYwoKU1pSd3b7yWzUIZ+cs1ZfMh40XNsMDGGmRhIYStANRiFeB8F4z
         LpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612076; x=1730216876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBbC0Aq58Xt7Rl73gnLhqqgKUE/KmWq4fUllvPU2g44=;
        b=EcY3FmXs7lCgG9auZGQoS7+D4yhC9KyUcozyYi2v+DbZtQZw4CIO1kCt+DbNGa/tw1
         Ns6oocBqFSU9awmlmAX1W3PC+B5986UpjGIVZqPSBwTHsQkeq8plEIaABMlgubJ7UVqt
         MQjSPh0smcsEoVJMPCtty4P4uvnkOxmcy9PjHCe4cHpMAe0LSiMlOGsY3ROueCpR7vFU
         WKT6wFceOjrpt4YlzZVZSLLATCOipGLUF93f6EYMXv82bwMpeFjTa81+clXApPK9SqL7
         yyeDma8Ih2LwpHhte4371prprvuRde1YFHsa1gUblAwK3YkQTFF231aFFWCyNR4f2C+N
         GEBA==
X-Gm-Message-State: AOJu0Yyw5TNbqSxy5ZmnUvYSVQtZCtdL28+18ru9+TnepEdpIs53VLuC
	oC9QRAMdusMgBpWPAvIAa5cq+QdMZX+eH8yFSraAW1DIJfOaLfzG1blgrh6oLy0=
X-Google-Smtp-Source: AGHT+IGIg+FjY3wqhHxlOG7QWzJipzEfTCGf7p2bmnWbd3ypRogQRWcahtd9oCX4J8mHEue1fiqtHg==
X-Received: by 2002:a05:6000:402a:b0:37c:ffdd:6d57 with SMTP id ffacd0b85a97d-37ea2148dcfmr4905792f8f.1.1729612076376;
        Tue, 22 Oct 2024 08:47:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c725fesm3439959a12.87.2024.10.22.08.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:47:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 22 Oct 2024 17:47:28 +0200
Subject: [PATCH v3 03/18] arm64: dts: qcom: msm8992-libra: drop unused
 regulators labels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-dts-qcom-label-v3-3-0505bc7d2c56@linaro.org>
References: <20241022-dts-qcom-label-v3-0-0505bc7d2c56@linaro.org>
In-Reply-To: <20241022-dts-qcom-label-v3-0-0505bc7d2c56@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GcmigDyZAHp7zbGoBym5nEfSWnlKu7XTHgqkT9Vecx8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnF8kWgZmf9NA1lefwvfFaIgENi8kFFt5TjU0S6
 ptlZ1AAcLmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZxfJFgAKCRDBN2bmhouD
 19qoD/9UiTPh4GyRJxrt4sehJyq4v19Qd2kzygksmWSeBR8AFiSntD1Pzu/8Jz+izHbU5kHU1Lt
 /wb4LREjxZAP1GeRA0CTyWo0ugLZJE1PYxrkrIDv1fPKOSREDRf3+e+zqSidsH9cwsoWfS0GOtv
 mVyKZ/Jd5lNsTKSgcIY7cK3ADpsGMizeciPoiq9K7NZkMW7EdscHPc5TnGlYgHU1HJVZHFVmt9p
 fXx6EWBwSK295bTt2qudtH2BvrbTONbzxX1hXpNb70okSb3lj7wIHBrYMYpN2EXV3w5XZ6kPr5/
 tRe12K0sPaFJ9DAfiowzI4Ry8dsnvAE6gUYEOdxq0bRbAAPN7+iFMvf9q3n8zxmeP4ZwCcXyVs4
 z15IrN5OYcB+QqWl6fc2IuN+vqQrU4IlDzeUe1d0P5i96Jym+t6yiphhGxQgvY5q5zw8dnOCxoN
 SOJe0k0pqFlBg+YOURKVURD7GW8qOcWn/3ryfN70Xp6kpBujlcA8iRiTcBtbx+O24uAgIw4nZCu
 D7rQ1iVJscV4P3afpMOWAuW4FzR7ESKqzYrbE5YN3WDL0Xb5qqu/E54tkXbVmottQjw+xaTuVRl
 ACczmu8DVaavI2UP7hc9ruLyKR55NpTofpJwAcoSalTMMY+JzeWFt8Z5mNEL0Az9WKNQ/PUGcba
 6kau0vP5W4eIH9g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase, but the labels are not
used, so just drop them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index 133f9c2540bcab3eae9c5e6047f942ac5a5794ea..d0290a20b888ddcf5885f6c19fd5a687431be764 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -175,7 +175,7 @@ &blsp2_uart2 {
 };
 
 &pm8994_spmi_regulators {
-	VDD_APC0: s8 {
+	s8 {
 		regulator-min-microvolt = <680000>;
 		regulator-max-microvolt = <1180000>;
 		regulator-always-on;
@@ -183,7 +183,7 @@ VDD_APC0: s8 {
 	};
 
 	/* APC1 is 3-phase, but quoting downstream, s11 is "the gang leader" */
-	VDD_APC1: s11 {
+	s11 {
 		regulator-min-microvolt = <700000>;
 		regulator-max-microvolt = <1225000>;
 		regulator-always-on;

-- 
2.43.0


