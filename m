Return-Path: <linux-arm-msm+bounces-55614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0982A9C633
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93BC44A4C1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 10:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B80325C6E6;
	Fri, 25 Apr 2025 10:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="P7P1ZKaK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949AB24886C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577992; cv=none; b=uc0Xl2GMTsDIH7UL6cuc5ZCBp+5HrhlzCNZrujCdaT90uaokVd/yxSSc7o4SyxdVTluYtmW0xer+eN9ZKnOhkd5jWg8hPXuoPUHUqhQ+/bvsnPH5DMO1E86kYYvodhm2+sDGOmEcrzORo8T01stpfMXAxDp7fs3xKJIXqMiEInk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577992; c=relaxed/simple;
	bh=EWK09hWcaH146zbHZFg6DDovIAXiO8bxdJLkoqKzFV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mI/AWngRJA05+VIjlCYE6QOiMJnDAzVALFqyHr6z7fsCb8YbBDKT/0g/E7G4gMCZNWUXE3abL2hQyf2cLbQF+/gxvup69E8I9MvuASzRD9+w7ywBzF9rUuG/tgnKDNZhxoOwXXELQFKoJSIoiyNkF0cgURaBq+bryrwFN6W+Z0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=P7P1ZKaK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso458269966b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 03:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745577988; x=1746182788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hK9WfekleK8BtH0UPXJ3KZe2/zWmazeTIHMX8EeozYE=;
        b=P7P1ZKaKNWo9H4J9qGfbH77wsXRx7ZKeGD10q2K0rgOY2rclfZVuFrrT/ti5TB1Kj1
         tcYjP7h4OPy2hmLFysrhgzVSuqbT0AvgAzLUmytnl3ZBqgfmjdxAGaaOwnL+p0XE6g/3
         SCmAIuckDOxSvM0WKTxQ4E9a+dsoIpAsgXfZxNBMp2SkXgW9N5keF0ZQO9Z6kJ/WvMyo
         IG6t7BdrjN00BqIFdd34Hgcxy1TGq8b/qrq4pKfwzTIwMJQ2UQnSPc3HEvj97wkPEzwI
         deppOY0VJ+FW+5wEQU+SKUxLx9YgB+gmhYs3s+l8E2TXmrEM1BRDPxN+eLAorGovqzU5
         +WKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577988; x=1746182788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hK9WfekleK8BtH0UPXJ3KZe2/zWmazeTIHMX8EeozYE=;
        b=kkvnlOXzZ2P+KiQuvYheM5ios69Vxspyz7GJrTdbR8lsyG4PQJWGDj3MIEor+mfKrW
         2mQXHWRCazvy+elIp9v8W0v+/cy/VItcJKyBjd9jbIpQW422XQvt+eqI0FZtfzW00RXd
         9SWF+Gptv1ToZ2wWp0bzTWsyRf9ktyRUXllxabMWgNVOndWGBU2APJra/rbZevLRzEZn
         PPgi7Oc2L9JFWNdmUXWzRNp4rLPN5n9PTpWi9ZvxGUN04S7l2ZhgeS262HRfgx1/tEVz
         mPMY+vmTvwBvnchMoOBq+RevKAoTwrEW7zUMdCQ04+Z9KxzdszxqR8Y5gO9NOiSSRGkA
         1tbw==
X-Forwarded-Encrypted: i=1; AJvYcCX63p9y/psj7hYFUxyReF/FefBrHtNgHV2FiKXTBLt1g4jAqD3+4fHTunWpa3K2CmFLRYZHG9NcJ0mfOFqV@vger.kernel.org
X-Gm-Message-State: AOJu0YyegQsm6EU+CaNUfAkdzRZCNrXHVYOfeqDcksd10CnSHhU1DTfQ
	q2vDj+TxnoqguwZBOBKuTklffBPo6sMwAykjS/mU7oqvd9aTc0HPEvkgLLIt6Ss=
X-Gm-Gg: ASbGnct6wvYHWme9LwpboQahnTKWvhqSSTtcP6QApCxTUVtpCPx2JrJbhBKPDoXDh6h
	YEYX35y0eH7aBIdeZGR1E+kz3H22ChmLnw0omEixsU7QqIyoUFUqWL5R/JdwozA0dlcoaHxNxD8
	4LqdTlolhppXfjV0eUA9/DGHQR2eEC0qOk1eXTizn8drc5who73KlUyThxMNztVkOG5e9Q9ZYkW
	qJ/mXn4AcfQz3YEzjLWkSkYHzOUwVnYpnZwCkqA2cjO0qUKy8kVZXlXaLHwm0P4gzMXvhivDiqG
	d1NL+R57dVQKAvW+8pibItKzRiG4PgtlIwDG2fvoag7JM1DmGot2saIgP2MkD6fq4hZVYjOI8Pl
	jJRVS+3o3gAQXzTeldS8hgefDpIvEnaSFQ8lXlEXSf5XeTVbF3UDvKx00jNm40KPO8I8=
X-Google-Smtp-Source: AGHT+IHQVDgFIH9o2gUfuqJT72GpbOPKv/PF4gbijBHoW9ExaOSzoPneDcgPWSfYtQBZXg9eDIY+8g==
X-Received: by 2002:a17:906:7954:b0:ac7:3916:327d with SMTP id a640c23a62f3a-ace713b720bmr146876866b.60.1745577987834;
        Fri, 25 Apr 2025 03:46:27 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7b98sm118765066b.66.2025.04.25.03.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:46:27 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 12:44:56 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Enable USB audio offloading which allows to play audio via a USB-C
headset with lower power consumption and enabling some other features.

This can be used like the following:

  $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
  $ aplay --device=plughw:0,0 test.wav

Compared to regular playback to the USB sound card no interrupts should
appear on the xhci-hcd interrupts during playback, instead the ADSP will
be handling the playback.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi              |  3 ++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 37 +++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 9a1b9f02282a0cf2e39bf2ade21989dbf4362bc1..ade69296cbc99eab3ee6dc020f2064d102a3b115 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2956,6 +2956,9 @@ wifi: wifi@18800000 {
 		};
 	};
 
+	sound: sound {
+	};
+
 	thermal-zones {
 		aoss0-thermal {
 			thermal-sensors = <&tsens0 0>;
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 71e87ab929551b339216a5fa583833ed8661a606..0f8e0a988db0d32384f39537731c77344ec50cf2 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -19,6 +19,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/usb/pd.h>
 #include "sm7225.dtsi"
 #include "pm6150l.dtsi"
@@ -955,6 +956,12 @@ channel@644 {
 	};
 };
 
+&q6asmdai {
+	dai@0 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+	};
+};
+
 &qup_uart1_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power
@@ -1023,6 +1030,35 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "fairphone,fp4-sndcard";
+	model = "Fairphone 4";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	usb-dai-link {
+		link-name = "USB Playback";
+
+		cpu {
+			sound-dai = <&q6afedai USB_RX>;
+		};
+
+		codec {
+			sound-dai = <&q6usbdai USB_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <13 4>, <56 2>;
 
@@ -1178,6 +1214,7 @@ &usb_1 {
 &usb_1_dwc3 {
 	maximum-speed = "super-speed";
 	dr_mode = "otg";
+	num-hc-interrupters = /bits/ 16 <3>;
 };
 
 &usb_1_dwc3_hs_out {

-- 
2.49.0


