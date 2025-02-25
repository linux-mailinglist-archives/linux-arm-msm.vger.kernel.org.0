Return-Path: <linux-arm-msm+bounces-49391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D2BA45045
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 23:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDF4A425C51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 22:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF0821B183;
	Tue, 25 Feb 2025 22:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wp9XkMmJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93452192E7
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 22:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740522645; cv=none; b=O9jblIowXlgLw8A+P+xkkwgi7VuwjGiLAwma3PQmT42W1F6fQ8kJd6/qSbx+A1/uK3w68X+P7R8kERMJ41CR+jtprw69JHk4+tIsQ3SSjzXAVawmRo/UecUvaWcefrGRc2YiR7tltjvyEsoJ5y8hsJH1fIe3F12RaA6kXFQfLko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740522645; c=relaxed/simple;
	bh=U8Tmllu36eRt1IvyE+drV86ujyrekgVtGiQRy2deoC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNqqGwfDlzGRrJcAlYYvlbKoP5SE3g6s6cicRLBIkwXiX17F+bfGfZ+UyI/sxDJml+Lp21z6Lc4wkGjy8dUbtvBnRDY5OnXxWPtYvgkzwKHnpsj6boXeszIKWB6PJ0NjFvPdgqpSwJAmVE4/YPfwLNKxhuXPaUGtrC8bUsI87Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wp9XkMmJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22104c4de96so107793945ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 14:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740522643; x=1741127443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFOFDJTlvBOkHKCK42HjTvHHM9LFtDeP2UVxz+Mu6EE=;
        b=Wp9XkMmJZR9StSZoKT5qYjk8b7r6yVO0NJLEU7ofxC0945GB0K3zal5u47ENVEgobS
         bcQj7RxcWls/+r6Z2la9kbiUzL2gvMeYjNsMJLsynDwDa4/6n+9szwTe3LFCpkYr3yxL
         tcn90Y/+UGH3o3LPmABA6fUAgz4r9IoYlW6eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522643; x=1741127443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFOFDJTlvBOkHKCK42HjTvHHM9LFtDeP2UVxz+Mu6EE=;
        b=r/Je9n1QdF1h7e0dyHs+zyuxlNjNNjGPL0kDMS4CXtBQiNlp+YUNEWg4JYAylNOspN
         n50FPZDLexGSgsptv45qh+QLdL5aSt33keNVwgD0q0jdyMu7TmCY7wemSsMMFVdlewTc
         vhewkgu4IskktHTa/AZUmj7tBUcy7ZR9XJp2PDIIVf5ut9MevP0pqQVZRv2fE0K7rc83
         lWJ4VxrTl/zQkUYLCAepATEKyf+L6jf9hzo5nKf72r9UY4VeFHMaNad3NfBbLv1i6Mxl
         Dp3dU5Oz6K/y98jHLu8lnmmSXYEoz7J6U4xw2Eg1spHYsLe2hGoOS9jBtZP4M7uAjeQe
         GxyA==
X-Forwarded-Encrypted: i=1; AJvYcCWuzAifBtgMttxfD6YVxF+sOMxlxq6dXGWSBjLk235jRxFY7NUBdaD7A16L3fUdpp7m7Dj/yGAPUNE+Vn4p@vger.kernel.org
X-Gm-Message-State: AOJu0YzeRKun4c2nLssu2UB5zaK+tAqa8iqquGcHGxmP7v4Y5GW9ENrd
	ygNiOdR1XOUq5VXnLLgtRvwy03SsDHp9r2HZb+aiUg5G/eGdSe0vn6+fxrAaHQ==
X-Gm-Gg: ASbGnctJ8EsE0Lj7FamMfdet+gtgVGrcoRg8yYqKIKS+EFH12AsXUCjSUL4zTeJ4dKI
	TFvttS6waUWKxq0Y3FUUeabPasrddaR/b+b1b6KN6SzAsRiBTBt5S7syujVjkbIA35ddrAkJyVj
	68khiAQk4MuatnaxvkXpp5u0tLW31phy6rwy5BMxxLbmWuR7x87af5GrrL1xeRfugMuhFSfK1pZ
	YPRvYpoYTpZfFVKmzn6J5bzGKHZ77k3j4L/2uEIyORdDoQYc/BI+PWCsZeqJI33XQmFHNZVAVYK
	s7Km7tsJOREuX6bsnMT/yHwT0DvspvJXve+a1WGvucyF+eJt2MJaWjNzRcO+7nmH3g==
X-Google-Smtp-Source: AGHT+IG5ubq9eET1ZC4GhM61uEK4jdNNkzhNZAdlklWE3e1rQelT1NMzbLfuXTScqK53VKJ8CfOM2Q==
X-Received: by 2002:a17:902:e5c9:b0:220:cd61:c03b with SMTP id d9443c01a7336-22307b4cc22mr79637205ad.21.1740522643010;
        Tue, 25 Feb 2025 14:30:43 -0800 (PST)
Received: from localhost (222.246.125.34.bc.googleusercontent.com. [34.125.246.222])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2230a092d61sm19521635ad.116.2025.02.25.14.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 14:30:42 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v5 2/2] arm64: dts: qcom: sc7180-trogdor: Wire up USB to usb-c-connectors
Date: Tue, 25 Feb 2025 14:30:37 -0800
Message-ID: <20250225223038.879614-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
In-Reply-To: <20250225223038.879614-1-swboyd@chromium.org>
References: <20250225223038.879614-1-swboyd@chromium.org>
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
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../dts/qcom/sc7180-trogdor-clamshell.dtsi    |  21 +++
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  47 +++++++
 .../dts/qcom/sc7180-trogdor-detachable.dtsi   |  16 +++
 .../dts/qcom/sc7180-trogdor-homestar.dtsi     |  47 +++++++
 .../dts/qcom/sc7180-trogdor-kingoftown.dts    |  55 ++++++++
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  55 ++++++++
 .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi |  55 ++++++++
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  44 +++++++
 .../qcom/sc7180-trogdor-quackingstick.dtsi    |  31 +++++
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  57 ++++++++-
 .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  47 +++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 121 ++++++++++++++++++
 12 files changed, 594 insertions(+), 2 deletions(-)

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
index 7c5d8a57ef7f..3847c10c64c9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-detachable.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-detachable.dtsi
@@ -6,6 +6,22 @@
  */
 
 /* This file must be included after sc7180-trogdor.dtsi to modify cros_ec */
+
+/ {
+	pogo_pins: keyboard-connector {
+		compatible = "google,usb-pogo-keyboard";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
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
index d393a2712ce6..5b1544108bca 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
@@ -52,12 +52,65 @@ &trackpad {
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
+
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
index 74ab321d3333..f096ab402e84 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -673,6 +673,27 @@ usb_c0: connector@0 {
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
+
+						usb_c0_hs: endpoint {
+							/* Endpoint filled in by board */
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_c0_ss: endpoint {
+							/* Endpoint filled in by board */
+						};
+					};
+				};
 			};
 
 			usb_c1: connector@1 {
@@ -682,6 +703,27 @@ usb_c1: connector@1 {
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
+
+						usb_c1_hs: endpoint {
+							/* Endpoint filled in by board */
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_c1_ss: endpoint {
+							/* Endpoint filled in by board */
+						};
+					};
+				};
 			};
 		};
 	};
@@ -966,6 +1008,45 @@ usb_hub_2_x: hub@1 {
 		reg = <1>;
 		vdd-supply = <&pp3300_hub>;
 		peer-hub = <&usb_hub_3_x>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_dfp1_hs: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+			port@2 {
+				reg = <2>;
+
+				usb_hub_dfp2_hs: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				usb_hub_dfp3_hs: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+
+				usb_hub_dfp4_hs: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+		};
 	};
 
 	/* 3.x hub on port 2 */
@@ -974,6 +1055,46 @@ usb_hub_3_x: hub@2 {
 		reg = <2>;
 		vdd-supply = <&pp3300_hub>;
 		peer-hub = <&usb_hub_2_x>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_dfp1_ss: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				usb_hub_dfp2_ss: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				usb_hub_dfp3_ss: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+
+				usb_hub_dfp4_ss: endpoint {
+					/* Endpoint filled in by board */
+				};
+			};
+		};
 	};
 };
 
-- 
https://chromeos.dev


