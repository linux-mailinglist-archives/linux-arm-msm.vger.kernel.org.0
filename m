Return-Path: <linux-arm-msm+bounces-47496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2675AA2FDEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 23:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B752A165CC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 22:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F60025B69A;
	Mon, 10 Feb 2025 22:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AFWUD8ZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236A8259498
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 22:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739228242; cv=none; b=dCOhjyQtgwG/nsygFNYOXVoT1GlASf85WQKBR/u1YSyRtQFsD1q7mVScqULqVoVv/YoC7aTUkB7Lp1NwyN5aKmFs0AW9rRX23S7qyIrIgnm0tGsmv58Oz3UJulmjHIPyVvee7RI4vFdg9x3aGNS6un7n2Vl0YiNe1/szdd5YjjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739228242; c=relaxed/simple;
	bh=cVBuTyyxHtoHv82ibjHY39xAQ/a7ov6kzLJy9X3iJ1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbjtCeEdk70b4q/BmSU1pMpLFq8CFB/0/tj92sGQRsSmnAtEw/8xZ9864rd9aAj9T45aSeXtMbROo10yvzOuQleaObr6HtjUACbxvQHpZ3KMpwgjvAhgJDZRllUI+/m8NqEqQ3Ont9s9XgTl/+X+Um5kP1hC7XuwOKfKw/ULWdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AFWUD8ZC; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f818a980cso31603045ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 14:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739228238; x=1739833038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2TMWQZOU48p3apEenIg9cWRNKsU3G8uFbxEYjoTKz4=;
        b=AFWUD8ZCzmrRnQTmWfZLykFTTSabwaDbK/WFuXl7BMqxz1qXK/0iuTz9SisMdVTa95
         lMkdkol/azwEzO5EdNeYIJvUPxfpPtD3Znf1p+jN3xignCa4pJV315acXLsHT6JB5ESn
         q37kJ1BNjP9soosIl8K+jQ8CidQtnismYW7Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228238; x=1739833038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2TMWQZOU48p3apEenIg9cWRNKsU3G8uFbxEYjoTKz4=;
        b=vb9TPKUKTv5V/pPEN1DZI3k3X00FnTRvEl6CCU39lsPJElYpndmp8YcCL6dmIHBq7V
         v4LEtgiXlMneHugxwR8/LqpbLsycX8yhkLVysDwmyMkzOuajx4GiYJikSe5XdigfTzaG
         nOSOh4UbgP1EH3+pZLEswGkOHK2JYQB4gxUNqbJ8umpnFlpkweJfMKKVS38Z+nxx6xuJ
         ++59OJj/vbvmyAbaQlimiH0MGS4KTx65YOXTDpaX4mzVa3PoNJrhKHl8MaoyaNgECcmd
         6Ysm7FX0qyyfXi36JU5Aldf10uaasF385FfZ1LtAbvZTHWfwgqHurjWJGod/TaAeXgg8
         k82g==
X-Forwarded-Encrypted: i=1; AJvYcCVxAIvu/tcPx+GCIilXW0pwhIy6iqNcWCqpMQkrbpXtskE6SVIcWxeKslT5xNQWyzIui4lz0WRao6cJmB7M@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4v1IWHz2ffnCk/JQOOTj4z5uRNvpUa+WlnaABTL1nvtA3AtFX
	dtID4Owy8cNbIzTwhb98PFAJhOjXVSQujfEJkngMXGP44QU0MuE112l9/KsMGQ==
X-Gm-Gg: ASbGncuZefRP5PfSBgljUYwmkHnnic0W/lusc0F5JfUERmukUAsRskoj9MU9YvWSIV2
	mRv4w4L9uD4IfTNZ+wdh1U3IpADV4t052bcP8k2xvLp5mpntodgAQVLW+Oz8bEX+Aqui0fLBcsG
	p28W3E3TPdqKde7vpPPHIvHZZMXp4Ot2aFKNh1o+yfwe9r1dlg1VWWfJygMyoW8lud4Az7DtfLD
	oIuZ5wkfoQzITffYXM5ZHMv4iS7pQeNfJpR+AQi1PTlU71S8taJ7v8tBpvojMieOfiFFOlH64e8
	WYlrnjU9t0U/qiL+vDhbTda0I5QtM35MSdV7gIyR+r4oGWwVlkvt4fQ=
X-Google-Smtp-Source: AGHT+IGdwPxvUX1GWCk8KWoZjeQmrh4Z6x0ZXSTeFhG0SP9E8wT2IvFLk9vTpJ3Y5FNrVgw+cJ1Omw==
X-Received: by 2002:a17:902:e802:b0:21f:db8:262d with SMTP id d9443c01a7336-21f4e7636c0mr281455855ad.35.1739228238416;
        Mon, 10 Feb 2025 14:57:18 -0800 (PST)
Received: from localhost (222.246.125.34.bc.googleusercontent.com. [34.125.246.222])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-ad51af7a22dsm8277473a12.69.2025.02.10.14.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 14:57:18 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	cros-qcom-dts-watchers@chromium.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v3 2/2] arm64: dts: qcom: sc7180-trogdor: Wire up USB to usb-c-connectors
Date: Mon, 10 Feb 2025 14:57:12 -0800
Message-ID: <20250210225714.1073618-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250210225714.1073618-1-swboyd@chromium.org>
References: <20250210225714.1073618-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fully describe the USB type-c on sc7180 Trogdor devices. Most Trogdor
devices have two USB type-c ports (i.e. usb-c-connector nodes), but
Quackingstick only has one. Also, clamshell devices such as Lazor have a
USB webcam connected to the USB hub, while detachable devices such as
Wormdingler don't have a webcam, or a USB type-a connector. Instead they
have the pogo pins for the detachable keyboard.

Fully describing the topology like this will let us expose information
about what devices are connected to which physical USB connector (type-A
or type-C).

Cc: <cros-qcom-dts-watchers@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../dts/qcom/sc7180-trogdor-clamshell.dtsi    |  21 ++++
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  47 ++++++++
 .../dts/qcom/sc7180-trogdor-detachable.dtsi   |  15 +++
 .../dts/qcom/sc7180-trogdor-homestar.dtsi     |  47 ++++++++
 .../dts/qcom/sc7180-trogdor-kingoftown.dts    |  55 +++++++++
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  55 +++++++++
 .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi |  55 +++++++++
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  44 +++++++
 .../qcom/sc7180-trogdor-quackingstick.dtsi    |  31 +++++
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  56 ++++++++-
 .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  47 ++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 109 ++++++++++++++++++
 12 files changed, 580 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-clamshell.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-clamshell.dtsi
index d91533b80e76..4e4f0b239f3c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-clamshell.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-clamshell.dtsi
@@ -7,3 +7,24 @@
 
 /* This file must be included after sc7180-trogdor.dtsi to modify cros_ec */
 #include <arm/cros-ec-keyboard.dtsi>
+
+/ {
+	usb-a-connector {
+		compatible = "usb-a-connector";
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb_a0_hs: endpoint@0 {
+				reg = <0>;
+				/* Endpoint filled in by board */
+			};
+
+			usb_a0_ss: endpoint@1 {
+				reg = <1>;
+				/* Endpoint filled in by board */
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index 25b17b0425f2..548d6c1ee050 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -134,6 +134,17 @@ skin-temp-thermistor@1 {
 	};
 };
 
+&pogo_pins {
+	keyboard@4 {
+		compatible = "usb18d1,504c";
+		reg = <4>;
+	};
+};
+
+&pogo_pins_in {
+	remote-endpoint = <&usb_hub_dfp4_hs>;
+};
+
 &pp1800_uf_cam {
 	status = "okay";
 };
@@ -175,6 +186,42 @@ &sound_multimedia0_codec {
 	sound-dai = <&adau7002>;
 };
 
+&usb_c0_hs {
+	remote-endpoint = <&usb_hub_dfp1_hs>;
+};
+
+&usb_c0_ss {
+	remote-endpoint = <&usb_hub_dfp1_ss>;
+};
+
+&usb_c1_hs {
+	remote-endpoint = <&usb_hub_dfp2_hs>;
+};
+
+&usb_c1_ss {
+	remote-endpoint = <&usb_hub_dfp2_ss>;
+};
+
+&usb_hub_dfp1_hs {
+	remote-endpoint = <&usb_c0_hs>;
+};
+
+&usb_hub_dfp1_ss {
+	remote-endpoint = <&usb_c0_ss>;
+};
+
+&usb_hub_dfp2_hs {
+	remote-endpoint = <&usb_c1_hs>;
+};
+
+&usb_hub_dfp2_ss {
+	remote-endpoint = <&usb_c1_ss>;
+};
+
+&usb_hub_dfp4_hs {
+	remote-endpoint = <&pogo_pins_in>;
+};
+
 /* PINCTRL - modifications to sc7180-trogdor.dtsi */
 
 &en_pp3300_dx_edp {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-detachable.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-detachable.dtsi
index 7c5d8a57ef7f..d33c73f4bac4 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-detachable.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-detachable.dtsi
@@ -6,6 +6,21 @@
  */
 
 /* This file must be included after sc7180-trogdor.dtsi to modify cros_ec */
+
+/ {
+	pogo_pins: keyboard-connector {
+		compatible = "google,usb-pogo-keyboard";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* Detachable keyboard filled in by board */
+		port {
+			pogo_pins_in: endpoint {
+				/* Endpoint filled in by board */
+			};
+		};
+	};
+};
+
 &cros_ec {
 	keyboard-controller {
 		compatible = "google,cros-ec-keyb-switches";
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index f57976906d63..09c4a30d96ef 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -159,6 +159,17 @@ skin-temp-thermistor@1 {
 	};
 };
 
+&pogo_pins {
+	keyboard@3 {
+		compatible = "usb18d1,5052";
+		reg = <3>;
+	};
+};
+
+&pogo_pins_in {
+	remote-endpoint = <&usb_hub_dfp3_hs>;
+};
+
 &pp1800_uf_cam {
 	status = "okay";
 };
@@ -187,6 +198,42 @@ &sound_multimedia1_codec {
 	sound-dai = <&max98360a>, <&max98360a_1>, <&max98360a_2>, <&max98360a_3> ;
 };
 
+&usb_c0_hs {
+	remote-endpoint = <&usb_hub_dfp2_hs>;
+};
+
+&usb_c0_ss {
+	remote-endpoint = <&usb_hub_dfp2_ss>;
+};
+
+&usb_c1_hs {
+	remote-endpoint = <&usb_hub_dfp4_hs>;
+};
+
+&usb_c1_ss {
+	remote-endpoint = <&usb_hub_dfp4_ss>;
+};
+
+&usb_hub_dfp2_hs {
+	remote-endpoint = <&usb_c0_hs>;
+};
+
+&usb_hub_dfp2_ss {
+	remote-endpoint = <&usb_c0_ss>;
+};
+
+&usb_hub_dfp3_hs {
+	remote-endpoint = <&pogo_pins_in>;
+};
+
+&usb_hub_dfp4_hs {
+	remote-endpoint = <&usb_c1_hs>;
+};
+
+&usb_hub_dfp4_ss {
+	remote-endpoint = <&usb_c1_ss>;
+};
+
 &wifi {
 	qcom,ath10k-calibration-variant = "GO_HOMESTAR";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dts
index 655bea928e52..d4ff26fba3be 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dts
@@ -78,6 +78,61 @@ &pp3300_dx_edp {
 	gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
 };
 
+&usb_a0_hs {
+	remote-endpoint = <&usb_hub_dfp3_hs>;
+};
+
+&usb_a0_ss {
+	remote-endpoint = <&usb_hub_dfp3_ss>;
+};
+
+&usb_c0_hs {
+	remote-endpoint = <&usb_hub_dfp1_hs>;
+};
+
+&usb_c0_ss {
+	remote-endpoint = <&usb_hub_dfp1_ss>;
+};
+
+&usb_c1_hs {
+	remote-endpoint = <&usb_hub_dfp2_hs>;
+};
+
+&usb_c1_ss {
+	remote-endpoint = <&usb_hub_dfp2_ss>;
+};
+
+&usb_hub_2_x {
+	camera@4 {
+		compatible = "usb4f2,b75a";
+		reg = <4>;
+	};
+};
+
+&usb_hub_dfp1_hs {
+	remote-endpoint = <&usb_c0_hs>;
+};
+
+&usb_hub_dfp1_ss {
+	remote-endpoint = <&usb_c0_ss>;
+};
+
+&usb_hub_dfp2_hs {
+	remote-endpoint = <&usb_c1_hs>;
+};
+
+&usb_hub_dfp2_ss {
+	remote-endpoint = <&usb_c1_ss>;
+};
+
+&usb_hub_dfp3_hs {
+	remote-endpoint = <&usb_a0_hs>;
+};
+
+&usb_hub_dfp3_ss {
+	remote-endpoint = <&usb_a0_ss>;
+};
+
 &wifi {
 	qcom,ath10k-calibration-variant = "GO_KINGOFTOWN";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index c3fd6760de7a..7b545ae5791b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -68,6 +68,61 @@ &trackpad {
 	interrupts = <58 IRQ_TYPE_EDGE_FALLING>;
 };
 
+&usb_a0_hs {
+	remote-endpoint = <&usb_hub_dfp3_hs>;
+};
+
+&usb_a0_ss {
+	remote-endpoint = <&usb_hub_dfp3_ss>;
+};
+
+&usb_c0_hs {
+	remote-endpoint = <&usb_hub_dfp2_hs>;
+};
+
+&usb_c0_ss {
+	remote-endpoint = <&usb_hub_dfp2_ss>;
+};
+
+&usb_c1_hs {
+	remote-endpoint = <&usb_hub_dfp4_hs>;
+};
+
+&usb_c1_ss {
+	remote-endpoint = <&usb_hub_dfp4_ss>;
+};
+
+&usb_hub_2_x {
+	camera@1 {
+		compatible = "usb408,a092";
+		reg = <1>;
+	};
+};
+
+&usb_hub_dfp2_hs {
+	remote-endpoint = <&usb_c0_hs>;
+};
+
+&usb_hub_dfp2_ss {
+	remote-endpoint = <&usb_c0_ss>;
+};
+
+&usb_hub_dfp3_hs {
+	remote-endpoint = <&usb_a0_hs>;
+};
+
+&usb_hub_dfp3_ss {
+	remote-endpoint = <&usb_a0_ss>;
+};
+
+&usb_hub_dfp4_hs {
+	remote-endpoint = <&usb_c1_hs>;
+};
+
+&usb_hub_dfp4_ss {
+	remote-endpoint = <&usb_c1_ss>;
+};
+
 &wifi {
 	qcom,ath10k-calibration-variant = "GO_LAZOR";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
index cc2c5610a279..9523843f06ab 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
@@ -82,6 +82,61 @@ &pp3300_dx_edp {
 	gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
 };
 
+&usb_a0_hs {
+	remote-endpoint = <&usb_hub_dfp3_hs>;
+};
+
+&usb_a0_ss {
+	remote-endpoint = <&usb_hub_dfp3_ss>;
+};
+
+&usb_c0_hs {
+	remote-endpoint = <&usb_hub_dfp1_hs>;
+};
+
+&usb_c0_ss {
+	remote-endpoint = <&usb_hub_dfp1_ss>;
+};
+
+&usb_c1_hs {
+	remote-endpoint = <&usb_hub_dfp2_hs>;
+};
+
+&usb_c1_ss {
+	remote-endpoint = <&usb_hub_dfp2_ss>;
+};
+
+&usb_hub_2_x {
+	camera@4 {
+		compatible = "usb5c8,b03";
+		reg = <4>;
+	};
+};
+
+&usb_hub_dfp1_hs {
+	remote-endpoint = <&usb_c0_hs>;
+};
+
+&usb_hub_dfp1_ss {
+	remote-endpoint = <&usb_c0_ss>;
+};
+
+&usb_hub_dfp2_hs {
+	remote-endpoint = <&usb_c1_hs>;
+};
+
+&usb_hub_dfp2_ss {
+	remote-endpoint = <&usb_c1_ss>;
+};
+
+&usb_hub_dfp3_hs {
+	remote-endpoint = <&usb_a0_hs>;
+};
+
+&usb_hub_dfp3_ss {
+	remote-endpoint = <&usb_a0_ss>;
+};
+
 /* PINCTRL - modifications to sc7180-trogdor.dtsi */
 
 &en_pp3300_dx_edp {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index f7300ffbb451..4cc1a155d999 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -176,10 +176,54 @@ &sound {
 	dmic-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
 };
 
+&usb_a0_hs {
+	remote-endpoint = <&usb_hub_dfp4_hs>;
+};
+
+&usb_a0_ss {
+	remote-endpoint = <&usb_hub_dfp4_ss>;
+};
+
+&usb_c0_hs {
+	remote-endpoint = <&usb_hub_dfp3_hs>;
+};
+
+&usb_c0_ss {
+	remote-endpoint = <&usb_hub_dfp3_ss>;
+};
+
 &usb_c1 {
 	status = "disabled";
 };
 
+&usb_hub_2_x {
+	camera@1 {
+		compatible = "usb4f2,b718";
+		reg = <1>;
+	};
+
+	camera@2 {
+		compatible = "usb13d3,56e9";
+		reg = <2>;
+	};
+};
+
+&usb_hub_dfp3_hs {
+	remote-endpoint = <&usb_c0_hs>;
+};
+
+&usb_hub_dfp3_ss {
+	remote-endpoint = <&usb_c0_ss>;
+};
+
+&usb_hub_dfp4_hs {
+	remote-endpoint = <&usb_a0_hs>;
+};
+
+&usb_hub_dfp4_ss {
+	remote-endpoint = <&usb_a0_ss>;
+};
+
 &wifi {
 	qcom,ath10k-calibration-variant = "GO_POMPOM";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
index ff8996b4de4e..174efd3abfa5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
@@ -105,6 +105,17 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&pogo_pins {
+	keyboard@1 {
+		compatible = "usb18d1,505b";
+		reg = <1>;
+	};
+};
+
+&pogo_pins_in {
+	remote-endpoint = <&usb_hub_dfp1_hs>;
+};
+
 &pp1800_uf_cam {
 	status = "okay";
 };
@@ -129,11 +140,31 @@ pp3300_disp_on: &pp3300_dx_edp {
 	gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
 };
 
+&usb_c0_hs {
+	remote-endpoint = <&usb_hub_dfp2_hs>;
+};
+
+&usb_c0_ss {
+	remote-endpoint = <&usb_hub_dfp2_ss>;
+};
+
 /* This board only has 1 USB Type-C port. */
 &usb_c1 {
 	status = "disabled";
 };
 
+&usb_hub_dfp2_hs {
+	remote-endpoint = <&usb_c0_hs>;
+};
+
+&usb_hub_dfp2_ss {
+	remote-endpoint = <&usb_c0_ss>;
+};
+
+&usb_hub_dfp1_hs {
+	remote-endpoint = <&pogo_pins_in>;
+};
+
 /* PINCTRL - modifications to sc7180-trogdor.dtsi */
 
 /*
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
index d393a2712ce6..dddf92c04c4d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
@@ -52,12 +52,64 @@ &trackpad {
 	interrupts = <58 IRQ_TYPE_EDGE_FALLING>;
 };
 
+&usb_a0_hs {
+	remote-endpoint = <&usb_hub_dfp3_hs>;
+};
+
+&usb_a0_ss {
+	remote-endpoint = <&usb_hub_dfp3_ss>;
+};
+
+&usb_c0_hs {
+	remote-endpoint = <&usb_hub_dfp2_hs>;
+};
+
+&usb_c0_ss {
+	remote-endpoint = <&usb_hub_dfp2_ss>;
+};
+
+&usb_c1_hs {
+	remote-endpoint = <&usb_hub_dfp4_hs>;
+};
+
+&usb_c1_ss {
+	remote-endpoint = <&usb_hub_dfp4_ss>;
+};
+
 &usb_hub_2_x {
-	 vdd-supply = <&pp3300_l7c>;
+	vdd-supply = <&pp3300_l7c>;
+	camera@1 {
+		compatible = "usb4f2,b567";
+		reg = <1>;
+	};
 };
 
 &usb_hub_3_x {
-	 vdd-supply = <&pp3300_l7c>;
+	vdd-supply = <&pp3300_l7c>;
+};
+
+&usb_hub_dfp2_hs {
+	remote-endpoint = <&usb_c0_hs>;
+};
+
+&usb_hub_dfp2_ss {
+	remote-endpoint = <&usb_c0_ss>;
+};
+
+&usb_hub_dfp3_hs {
+	remote-endpoint = <&usb_a0_hs>;
+};
+
+&usb_hub_dfp3_ss {
+	remote-endpoint = <&usb_a0_ss>;
+};
+
+&usb_hub_dfp4_hs {
+	remote-endpoint = <&usb_c1_hs>;
+};
+
+&usb_hub_dfp4_ss {
+	remote-endpoint = <&usb_c1_ss>;
 };
 
 /* PINCTRL - modifications to sc7180-trogdor.dtsi */
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
index d4925be3b1fc..59cdf8eea647 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
@@ -179,6 +179,17 @@ skin-temp-thermistor@1 {
 	};
 };
 
+&pogo_pins {
+	keyboard@3 {
+		compatible = "usb18d1,5057";
+		reg = <3>;
+	};
+};
+
+&pogo_pins_in {
+	remote-endpoint = <&usb_hub_dfp3_hs>;
+};
+
 &pp1800_uf_cam {
 	status = "okay";
 };
@@ -195,6 +206,42 @@ &pp2800_wf_cam {
 	status = "okay";
 };
 
+&usb_c0_hs {
+	remote-endpoint = <&usb_hub_dfp2_hs>;
+};
+
+&usb_c0_ss {
+	remote-endpoint = <&usb_hub_dfp2_ss>;
+};
+
+&usb_c1_hs {
+	remote-endpoint = <&usb_hub_dfp4_hs>;
+};
+
+&usb_c1_ss {
+	remote-endpoint = <&usb_hub_dfp3_ss>;
+};
+
+&usb_hub_dfp2_hs {
+	remote-endpoint = <&usb_c0_hs>;
+};
+
+&usb_hub_dfp2_ss {
+	remote-endpoint = <&usb_c0_ss>;
+};
+
+&usb_hub_dfp4_hs {
+	remote-endpoint = <&usb_c1_hs>;
+};
+
+&usb_hub_dfp3_ss {
+	remote-endpoint = <&usb_c1_ss>;
+};
+
+&usb_hub_dfp3_hs {
+	remote-endpoint = <&pogo_pins_in>;
+};
+
 &wifi {
 	qcom,ath10k-calibration-variant = "GO_WORMDINGLER";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 74ab321d3333..af866cdd4fef 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -673,6 +673,25 @@ usb_c0: connector@0 {
 				power-role = "dual";
 				data-role = "host";
 				try-power-role = "source";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						usb_c0_hs: endpoint {
+							/* Endpoint filled in by board */
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						usb_c0_ss: endpoint {
+							/* Endpoint filled in by board */
+						};
+					};
+				};
 			};
 
 			usb_c1: connector@1 {
@@ -682,6 +701,25 @@ usb_c1: connector@1 {
 				power-role = "dual";
 				data-role = "host";
 				try-power-role = "source";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						usb_c1_hs: endpoint {
+							/* Endpoint filled in by board */
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						usb_c1_ss: endpoint {
+							/* Endpoint filled in by board */
+						};
+					};
+				};
 			};
 		};
 	};
@@ -966,6 +1004,41 @@ usb_hub_2_x: hub@1 {
 		reg = <1>;
 		vdd-supply = <&pp3300_hub>;
 		peer-hub = <&usb_hub_3_x>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usb_hub_2_x_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+				usb_hub_dfp1_hs: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+			port@2 {
+				reg = <2>;
+				usb_hub_dfp2_hs: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				usb_hub_dfp3_hs: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+				usb_hub_dfp4_hs: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+		};
 	};
 
 	/* 3.x hub on port 2 */
@@ -974,6 +1047,42 @@ usb_hub_3_x: hub@2 {
 		reg = <2>;
 		vdd-supply = <&pp3300_hub>;
 		peer-hub = <&usb_hub_2_x>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usb_hub_3_x_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+				usb_hub_dfp1_ss: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				usb_hub_dfp2_ss: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				usb_hub_dfp3_ss: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+				usb_hub_dfp4_ss: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+		};
 	};
 };
 
-- 
https://chromeos.dev


