Return-Path: <linux-arm-msm+bounces-31922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2577D97B1CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 17:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C66E81F24E93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 15:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47351199E80;
	Tue, 17 Sep 2024 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZdwoE+3r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAD119993D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726585261; cv=none; b=VAu1h519Qc8+Xk4/OKzX9ggEenU0TRyQ7cREiDo9uZP2J7iSuQ5u2eTpTQTMhwkBnze5uyDW+y82p0BQrz4iMmdBgM0i5ihTOMU6V2QZmm9u+zeVm6Yp/pJHRfja4+l7GTRsqWaq0xot7Ew/K49U9Sc2H9c9+LWqB2OiVey9b70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726585261; c=relaxed/simple;
	bh=sSFYJMbgDWgR+ke66HWJqHDGMJhDpkQTcdbX77Tx2yY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yo41q4umZkjYWPQA5ghKrtaHyaBFLdbJ8Hx51v0Khukf0dRVKAKBoqbmnxS9zMaCqic1xST58M9ysVpAxq9OJdYcBPC+xKJYNo/ZZmnOd/zmTvzTrIPJFEB+Zum8Y70fD70V3yW+9eyLfTpMs0VtWSCq+A5nWfBTXrPIet3dFp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZdwoE+3r; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so49427515e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 08:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726585258; x=1727190058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/IGfI+hgL3jCy+Xqpn3mDFDW7I26z/9+F8suS+KtWGI=;
        b=ZdwoE+3r5jorqc0WTP9iCbvETyjcee63mOb03ve1VEbhsIFg8WYSlQVaJroaLGw4us
         JDCwnAH7v748yQRTAIkJs/RnECPb2saaLcKgzUfsbb4lUcRA+dJDnV5+Kp/Bm1in73XE
         caL7CD3HU4hhp7bIZZ+tZ2ZZE0IYRUP02psPnospuh3pKHYVHboN/3qtulFA1KrDTB93
         lW12Y/Ajw507VJEuPJne9GyWzDv4UuEOKntJQUbwHjjMfwE1n1BVcT3k1pEOoi7OnmO4
         O10k5Vfn6+PZTkqBrFLDmoJAqSmn1NdKyKE2okra/OfPPeAH0bQyO5bs6+uKz9Gp5Gmo
         QFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726585258; x=1727190058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IGfI+hgL3jCy+Xqpn3mDFDW7I26z/9+F8suS+KtWGI=;
        b=flc2/tCO6G/hAQJTarpeysYu4CqEYq8yTqYdl7+v+hUmIqfyNb99VnTub9vhyANN9C
         HlqaSaLXHRfxhnFL+NnsT+pqlctY0pmhgFkCrLMvic35va3004es3Zngo/tq28oGApHZ
         08x8qI3VzeElclcxfT78IcUNHG0FKyIP1fobFnEC3fkfbE2EMndK9szLLVngW81reHi+
         ZfSAIbW9WYQTQoDaXSinF/jzOSkIFizUFO/tSdCQaL5rWnpylpItrTabSbSX06vATxt0
         9rh73Xw8RPQ7EGe9tYkEVeWWITyikc0lsYhhuksHvc7/gC9SWjdeqaWNUwZJ+DjfzNl4
         griQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRj1R1hHvTCFk+tlTm6kxwfqY8zZ2612Ls/kJFwKVwoitlAjPpnO82N4gYPRPu+djfmMGMNqkq+E/CxSEe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjvyj+/DnUDI5jCyUGOCoPPM9HgimaAJinm9t7+D67toMHEph1
	X0VzujZoRAozkhCpik6cngiGOzM/4RkOFBKXKlBWofO4O8lRZg1VGIPYq8NS03s=
X-Google-Smtp-Source: AGHT+IGG6WRrXCFb3u8z80/Dre90pfDqU9nH83nSFhdGV7KfAJBZo4pKvdFKsntvm/0n7z9dfbp4KQ==
X-Received: by 2002:a05:600c:35c4:b0:42c:b750:19f3 with SMTP id 5b1f17b1804b1-42cdb444697mr134644585e9.0.1726585257537;
        Tue, 17 Sep 2024 08:00:57 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73f99ebsm9800595f8f.63.2024.09.17.08.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 08:00:57 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	abel.vesa@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2] arm64: dts: qcom: x1e80100-t14s: add another trackpad support
Date: Tue, 17 Sep 2024 11:00:49 -0400
Message-Id: <20240917150049.3110-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Trackpad HID device on some of the T14s Product Models 21N2ZC5PUS is
at I2C address 0x2c add this to be able to get it working on these laptops.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
- moved pinctrl to parent node so that pinctrl can be claimed globally.

 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts  | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index 08ec2419f95f..45a77c1fb6f4 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -551,6 +551,9 @@ zap-shader {
 &i2c0 {
 	clock-frequency = <400000>;
 
+	pinctrl-0 = <&tpad_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	/* ELAN06E2 or ELAN06E3 */
@@ -561,13 +564,19 @@ touchpad@15 {
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-0 = <&tpad_default>;
-		pinctrl-names = "default";
-
 		wakeup-source;
 	};
 
-	/* TODO: second-sourced SYNA8022 or SYNA8024 touchpad @ 0x2c */
+	/* SYNA8022 or SYNA8024 */
+	touchpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		wakeup-source;
+	};
 
 	/* ELAN06F1 or SYNA06F2 */
 	keyboard@3a {
-- 
2.39.2


