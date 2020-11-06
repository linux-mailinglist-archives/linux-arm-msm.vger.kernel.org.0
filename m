Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF062A8B81
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 01:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732959AbgKFAhp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 19:37:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732577AbgKFAhp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 19:37:45 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB18C0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 16:37:45 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id o129so2744020pfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 16:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eWFExiUft5Duzv61RypPNQKu/5puPrFkS8dVHuVaiao=;
        b=b+yp5ifYdRGPlSsWRqSK+sKn1G73G7B7QKGK6Q8lSXEikaSA3bCAnIpJHyAcb/FUPE
         xmGQen5/c7nC4NOyU+flw+HuCUqkiQ1NSh47UQ1zsWqwZWUazaoqWIOArx8PY7izwtk+
         k1W56aJoe4TrplaWHOfjsZJ0NEMyv+Epu8uuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eWFExiUft5Duzv61RypPNQKu/5puPrFkS8dVHuVaiao=;
        b=YNiutoZAXmF8XfkfyXrhrGlv4czEKIHs3D1O3bYyeM46TuWO6H7BlKbDV2bLVp9wYL
         vdNZn+gT4l+8lp/r+OsN9skcIw5SXjL7H2Et+L9B98NLi9207+i4g1yzPi9E5VwJYtwv
         nFrRLx1OfQcbXq+PJ3kKxSO5ko9TSHPDM2a51XTLps3XJxDPUUZbSCw0yINwfmlbh/NX
         H1kYmF5jU+2ho9UbQIjgVicdOiGsXsO/sJwbXQg9Fan5XLwcllGPJ3PdUVxNxcTo2fs/
         TqXpjb8mXViaBT+mjhc+WNRZ7if/7eHYo8d6AMgQLNbKVFuA0+/CT5nkh8O22xa0IPAn
         gpow==
X-Gm-Message-State: AOAM5326CjblQRorVNsoijkcr6SQqYLXsd3AK9ritGmEZ9y+lnE3v5nH
        nKbhVXo4SMrDOAwIzJDugQbSyBR5U+Rdzg==
X-Google-Smtp-Source: ABdhPJwH0BipH1uikW/1xZSb9lxX0MDSK+bPRCICxN2IBKoegmEcXyoOiUIYBif+DSi+JElG4pk94A==
X-Received: by 2002:a17:90a:4742:: with SMTP id y2mr5120722pjg.228.1604623064780;
        Thu, 05 Nov 2020 16:37:44 -0800 (PST)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id bx6sm3446554pjb.39.2020.11.05.16.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 16:37:44 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sc7180-trogdor: Make pp3300_a the default supply for pp3300_hub
Date:   Thu,  5 Nov 2020 16:37:33 -0800
Message-Id: <20201105163724.v2.2.I0ed4abdd2b2916fbedf76be254bc3457fb8b9655@changeid>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201105163724.v2.1.I5a75056d573808f40fed22ab7d28ea6be5819f84@changeid>
References: <20201105163724.v2.1.I5a75056d573808f40fed22ab7d28ea6be5819f84@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The trogdor design has two options for supplying the 'pp3300_hub' power
rail, it can be supplied by 'pp3300_l7c' or 'pp3300_a'. The 'pp3300_a'
path includes a load switch that can be controlled through GPIO84.
Initially trogdor boards used 'pp3300_l7c' to power the USB hub, newer
revisions (will) use 'pp3300_a' as supply for 'pp3300_hub'.

Add a DT node for the 'pp3300_a' path and a pinctrl entry for the GPIO.
Make this path the default and keep trogdor rev1, lazor rev0 and rev1
on 'pp3300_l7c'. These earlier revisions also allocated the GPIO to the
purpose of controlling the power switch, so there is no need to limit
the pinctrl config to newer revisions. Remove the platform-wide
'always-on' property from 'pp3300_l7c' and add it to the boards that
use this supply. Also delete the 'always-on' of 'pp3300_hub' for
these boards.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
- added 'always-on' and 'boot-on' properties for new 'pp3300_hub'
- removed platform-wide 'always-on' property for 'pp3300_l7c'
- added 'always-on' property to 'pp3300_l7c'  for boards that still
  use 'pp3300_l7c'
- delete 'always-on' property of 'pp3300_hub' for boards that still
  use 'pp3300_l7c'
- got rid of 'pp3300_hub_7c' label, just use 'pp3300_l7c'
- fixed position of 'en_pp3300_hub' node to respect ordering
- updated commit message

 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 13 ++++++++
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 13 ++++++++
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts | 13 ++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 33 ++++++++++++++++++-
 4 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
index ae4c23a4fe65..1d809269e7ef 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
@@ -14,6 +14,15 @@ / {
 	compatible = "google,lazor-rev0", "qcom,sc7180";
 };
 
+&pp3300_hub {
+	/* pp3300_l7c is used to power the USB hub */
+	/delete-property/regulator-always-on;
+};
+
+&pp3300_l7c {
+	regulator-always-on;
+};
+
 &sn65dsi86_out {
 	/*
 	 * Lane 0 was incorrectly mapped on the cable, but we've now decided
@@ -22,3 +31,7 @@ &sn65dsi86_out {
 	 */
 	lane-polarities = <1 0>;
 };
+
+&usb_hub {
+	vdd-supply = <&pp3300_l7c>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
index f6ee1beba458..1d573523d6b6 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
@@ -13,3 +13,16 @@ / {
 	model = "Google Lazor (rev1)";
 	compatible = "google,lazor-rev1", "qcom,sc7180";
 };
+
+&pp3300_hub {
+	/* pp3300_l7c is used to power the USB hub */
+	/delete-property/regulator-always-on;
+};
+
+&pp3300_l7c {
+	regulator-always-on;
+};
+
+&usb_hub {
+	 vdd-supply = <&pp3300_l7c>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
index 0a281c24841c..6603f2102233 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
@@ -58,10 +58,23 @@ ap_ts: touchscreen@10 {
 	};
 };
 
+&pp3300_hub {
+	/* pp3300_l7c is used to power the USB hub */
+	/delete-property/regulator-always-on;
+};
+
+&pp3300_l7c {
+	regulator-always-on;
+};
+
 &sdhc_2 {
 	status = "okay";
 };
 
+&usb_hub {
+	 vdd-supply = <&pp3300_l7c>;
+};
+
 /* PINCTRL - board-specific pinctrl */
 
 &tlmm {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index bf875589d364..50e733412a7f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -174,6 +174,25 @@ pp3300_fp_tp: pp3300-fp-tp-regulator {
 		vin-supply = <&pp3300_a>;
 	};
 
+	pp3300_hub: pp3300-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_hub";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&en_pp3300_hub>;
+
+		/* AP turns on with en_pp3300_hub; always on for AP */
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&pp3300_a>;
+	};
+
 	/* BOARD-SPECIFIC TOP LEVEL NODES */
 
 	backlight: backlight {
@@ -469,7 +488,6 @@ ppvar_l6c: ldo6 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		pp3300_hub:
 		pp3300_l7c: ldo7 {
 			regulator-min-microvolt = <3304000>;
 			regulator-max-microvolt = <3304000>;
@@ -1164,6 +1182,19 @@ pinconf {
 		};
 	};
 
+	en_pp3300_hub: en-pp3300-hub {
+		pinmux {
+			pins = "gpio84";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio84";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	fpmcu_boot0: fpmcu-boot0 {
 		pinmux {
 			pins = "gpio10";
-- 
2.29.1.341.ge80a0c044ae-goog

