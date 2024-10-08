Return-Path: <linux-arm-msm+bounces-33596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2279954FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 18:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82275285657
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE7E1E1C30;
	Tue,  8 Oct 2024 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEHFXJ47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC161E1C1C;
	Tue,  8 Oct 2024 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406331; cv=none; b=nbLu67sEkTHY8B5t71vHC6C+a0xoYbdjesju3AiRrRhcLQJLr+ZijfHCdHRDLxEZx8CXk7QNp6BR77u6I7Lx7sulHeyrc9ur2Y5vtHD2t59ucL/jR641wvZf9r/wjDIF3ev8sa0M4vGHV+WYyrpBf0y+cBABb1iO7RtVMPVcGKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406331; c=relaxed/simple;
	bh=EyvxYgmd+WlVODzcYuBQPU4RuBQO8y3BQCMsMeHqzBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CIN09LTmzOjUVc+mSVBVcAiIZc+kUQrACYJKEJW0jFofrmCJTPuauTBlu7OWd7SDmUaOTpkTicIdXtcR3UBH1ao4FVEQYGAm5tjRlyhnkHwZJxWrYyQH6kLSZNev9FmfYPkvMXMUQT3sF22At1ew+Pbgrpx+ho4T+tJNB8/BN9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEHFXJ47; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53959a88668so7386141e87.2;
        Tue, 08 Oct 2024 09:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728406328; x=1729011128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moZlQ1Ms1cEUAdorR6NqtqJIQ081uxz/faO2ZLvLXrE=;
        b=iEHFXJ47p/PVCwsYyN3kf0X///oImy2Y03As7LaUZtpJADn6Ee+nfeXkAptaPoxXSj
         IP/Rq3X9nVBHQQ/W1UvqiinuxGYLcsjkHFPTk6bXB+B8vbttCYZV6041hC8z2GU3pBC/
         fzobcCXMEsWz1WoA/QUB+yu0sIAbnPLURPSB1kqHtBxZPyJuAtTpoNrBuwKJWB7C9+zb
         cDWi5FOLAEiGHlkT78z6IhSKQZvb6UqUJLy7uX3G+RPcM3mUlkUANdLKts0IcPcZMoPB
         9cm+6yD1uog/jX0elq6jsZ19XZORq9Y4iXcCYau9mOiJj5N4/W7CZj/+UD7KfXHpSndZ
         fp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728406328; x=1729011128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moZlQ1Ms1cEUAdorR6NqtqJIQ081uxz/faO2ZLvLXrE=;
        b=lZ3f67qp3AmB1fPto/V2AxuSNqXABAk5JEP8SoyF97LPUIr+FnM/uv9k0Xv9KgNfMq
         BgrxEPr7OG2y7ucQSqK/O8wG1EEjQI7mHcrOVOA0d6zQ2vv6iUXzWQCt1umm/fupHlCS
         ngjE+MB9cFiFN6FElbGsjESGJcDRNufF2nt+MIAiQxe8WkmnYUpUwlCXtm3INhcU8TeX
         oqTVnmTjEWy8z70zlEw3R+evHGui+i2H5SN5/4iK6n09Lxfz5+ukpX50vOvOfEr5o3wa
         HtjH5Evj4NGoGBUCkr1wpBzzb0neqZE4DIhFMTz2uiQCm4r6qzvxcfwYvZin9xG8XmWF
         Adsg==
X-Forwarded-Encrypted: i=1; AJvYcCU7qWDiKOmwoMBv7PJrmSMMdeIMLK6fB0An6MBYZajNrbr5sqVMQS0hQIpX9VpXSKAHBnAsvJfivYx9fLhS@vger.kernel.org, AJvYcCXUw6xfV582G/nAtRYNWgaW7OQtfQ4FrSAM/VTSaa60DxqDdkSx2iGEK9WcLqUYxl/rFn/+1jBWFTFy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9MJJ973bak2FjxgYRgNPIFN1HoPTsYfV0Fv5kdP3qnDyg99zp
	4yPY7gmisB5vhFMDRPaRIRVqhzfQxZ/nqq/9f043lIOvVL5Qhs9micsNwQ==
X-Google-Smtp-Source: AGHT+IGUYycy+d6O4ecEpPZjbIc6a1uVjG5ooRd+slnWU7zOMiVsdqqO/Cc6nJkDn3HtrmSed5mC6g==
X-Received: by 2002:a05:6512:2398:b0:52f:1ef:bafe with SMTP id 2adb3069b0e04-539ab877af4mr10250473e87.22.1728406327837;
        Tue, 08 Oct 2024 09:52:07 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-539aff23e5fsm1260736e87.235.2024.10.08.09.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:52:06 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 08 Oct 2024 19:51:43 +0300
Subject: [PATCH v6 06/12] arm64: dts: qcom: sdm845-starqltechn: add gpio
 keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-starqltechn_integration_upstream-v6-6-5445365d3052@gmail.com>
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
In-Reply-To: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728406308; l=1845;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=EyvxYgmd+WlVODzcYuBQPU4RuBQO8y3BQCMsMeHqzBY=;
 b=JWqDp7M2+ZYC5WYL41gywdCaHFnqtWeryQYgONbro5uF5Y9gQI73Xj6siquUEi0yL0qDhzmRs
 M+ohI4R2sk4A0raP1aI4S8lItz+3+SOqc0DqmUWcHFADkn0JbW3x/0h
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for phone buttons.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject.
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


