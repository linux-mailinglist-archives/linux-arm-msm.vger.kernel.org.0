Return-Path: <linux-arm-msm+bounces-32589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BA0987570
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 16:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C5BA2853F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CA115854D;
	Thu, 26 Sep 2024 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5Q1nm37"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957D3156F39;
	Thu, 26 Sep 2024 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360551; cv=none; b=hFYWdUdrx+wFtuP2vK28467jpAezJxWPKwLvkAJIN3EksrZul870hvNiaKQ6nbaW2KqbX6+Wab4CxGG5yp/+oCVgZtNR6RLq8C8JBETt/xxEUKbFEGyJKLy1J/gkn73pn3eKsL1eMTrJOTu6byLDcbTWp4hyzUfvt44JbQSMkSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360551; c=relaxed/simple;
	bh=2XWuNrMgiDoaK/13xnD5IYq7rMSto2oE6ATIp4tUISo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OGkfMg8TNOAA/r52ks/AA06MDeTC2Jsu8d7+ADTFNXUpMcUJ6KwCnSyPP7XpPjjOTWMcMIh6pQaFAziIErUEkLoZLL4ecImMY44fGHRoDRqM9+tGjaCQWTpqcfGqqw5/wZl2rfqA4BPXMb01YRIKKPqwx5U97CcvAgn5gdGuOMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5Q1nm37; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-535be093a43so1323879e87.3;
        Thu, 26 Sep 2024 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360548; x=1727965348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jSznaHt4B2DkTGoeNg0QL5oUuPd8Pgnz8pC3eRlRiM=;
        b=b5Q1nm37aEtAJ4WZXHwfgU6bdmMXxnl0W/rNjrPDP5lMFDAd/wMS1hoVP7TsaYTkAD
         MI/76UZTofuRfYXmpI8jTpIRfU4T8XnnJ1wTOwdhB7QzeafkjD0w0vXXCBO7ftGo9m04
         Tq7EQAX7vRyZKsmT0pfopOOwTIIks/Bc2y6dgaDznk4h8OcRPTnpQVOllowxn9LBIYOw
         SeWOtm7eLpK01R6y61rnnWlq/C1w4NJOSW8gElA6Q+fjyrYGCc9oBPnObyqJlwJ1hSJC
         kXyoY5jy1Cb75Y2u1V4p6faznMo2wquyPriEuGDXeibH7zJ1nvafXxkxmBDjLZCSX3gA
         u0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360548; x=1727965348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jSznaHt4B2DkTGoeNg0QL5oUuPd8Pgnz8pC3eRlRiM=;
        b=utRNSqtM8CksIxUMQYGoaiAQC96EPIY39yM+jQuW82M1VB8fNKemZLEeWGu89KJXUy
         4QdJLpoPERiBL0PtooxTmvyka24IJ4dyRl8kxy9c8TfBon+gcbzsW3s0KqlXBf17iCl9
         hr1HqSzi62mAEjteRTahr43ZnAGDFTp/vV1mFzvnpEy6UaSFmXfGl5a7Jjamn6HOG/OP
         B5IWMqaDV41+lf8polUq+B0oJ/Tv3e5Jp20lM2FGK/oQdvLZ6KCHFzmpW1ZCaRGA7mKa
         2+yYZKkLqyrQ7CsFUVjwTtCey5Pmdv7ySLS57Y6gweKsq3yoVGrUNLQapaWeVszfCzED
         Uguw==
X-Forwarded-Encrypted: i=1; AJvYcCVU6rXhqRRXxwVeSc+GDYRRIxAM8jKpw1UW9rPh2m5funzB7K9zybXLdZ7q/M/jP74xgrY/4EMhBvdqaS0v@vger.kernel.org, AJvYcCXOXM0gLiRxZpvr3YxhgZgPcQvhT3xOcOzfSrlA/abA6WZ8SKCQOWxqrDJrTbWdy2M0ukR7a1OSLAgC@vger.kernel.org
X-Gm-Message-State: AOJu0YxtLrBjyWrGSiOchsdCtbVIsSIIdgH8Sj/X3/ncqf7hJpEEdafQ
	OZIquqEQdPdNuT8OouJ1683RIPBeokTrW0OI1Vv6ZFT/PXUrYk/EHjqiwA==
X-Google-Smtp-Source: AGHT+IHjjLi8HzXBEZXpOFHrVuBTcDWap54Xh57wkDSPqVNme2afqHghBb39IGzaCF7tV/1ctA3ukA==
X-Received: by 2002:a05:6512:3f03:b0:536:56d8:24b4 with SMTP id 2adb3069b0e04-5387048bd3fmr4470282e87.5.1727360547386;
        Thu, 26 Sep 2024 07:22:27 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a864db1bsm815803e87.267.2024.09.26.07.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:22:27 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 17:22:06 +0300
Subject: [PATCH v5 06/12] arm64: dts: qcom: starqltechn: add gpio keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-starqltechn_integration_upstream-v5-6-d2084672ff2f@gmail.com>
References: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727360533; l=1764;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=2XWuNrMgiDoaK/13xnD5IYq7rMSto2oE6ATIp4tUISo=;
 b=uxzXiVCEICd68B8zmMaaPKsR5sunigobHL3KN6ljQgpy500LRzDJ2QDTbfIoPEhxHNJT6lVxS
 xDJJEWHA/liB5MV9VrkTzoI0Q02T3xAvv0Mgwgc0uW9GpUAWgqWe9Dt
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for phone buttons.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 5948b401165c..a3bd5231569d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -7,9 +7,11 @@
 
 /dts-v1/;
 
+#include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
+#include "pm8998.dtsi"
 
 / {
 	chassis-type = "handset";
@@ -69,6 +71,25 @@ memory@a1300000 {
 			pmsg-size = <0x40000>;
 		};
 	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		key-vol-up {
+			label = "volume_up";
+			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+
+		key-wink {
+			label = "key_wink";
+			gpios = <&pm8998_gpios 19 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_ENTER>;
+			debounce-interval = <15>;
+		};
+	};
 };
 
 
@@ -417,6 +438,21 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&pm8998_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&pm8998_gpios {
+	chg_int_default: chg-int-default-state {
+		pins = "gpio11";
+		function = "normal";
+		input-enable;
+		bias-disable;
+		power-source = <0>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
 			       <85 4>; /* SPI (fingerprint reader) */

-- 
2.39.2


