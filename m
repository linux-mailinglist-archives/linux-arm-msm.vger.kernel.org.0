Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E833474F5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 01:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233010AbhLOAgl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 19:36:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbhLOAgl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 19:36:41 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5320DC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:36:41 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id r5so18668495pgi.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2JWrOXHn9iAjlu9c6tl0A3v0l3D/OKUEJfARl66JzjM=;
        b=IIMScrFo+FYGUU7p9riTJoAYFiS7Y9Av5pKlEZHIVAehuzzPoc4VfZI7c02XT2sNUs
         OM/Fg85IrnD1DGYRrVYVFLrFXaCKYDAhMx2UMa4iqF7c7ngF+rC5/fvVBJrHfq/9qnfg
         pFpZkPjMrQB1Ke1G/s1dnttxXXUNz7gsIxvmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2JWrOXHn9iAjlu9c6tl0A3v0l3D/OKUEJfARl66JzjM=;
        b=8KrTXJsFcp1gnBrIm5kv+VIIHsjk6rFxUQOvXADGz2f5lw4UYCMg/1DFIhIqq+pmy1
         iUCyT8Bi5Fa4/qgSFa6nLrRjUrLQjVUJ9Cntqoo2HMQ0W+M/HUN+O4zOws8HILbEZJ56
         7j/4DgQYr8ZRc3O3cYWzBR+93Z8diu4mrr12RmCNDUbLlfz0xmV0nCCDXoX/wf0MJ3zQ
         xZ1SJziZ9lRQqCjayCaIxAHgCohst+IJANb5AVx9C3LgXDRrRL2gElDdS2aqQ1aAy9q3
         oAb9e5SyqKorkcYHdT0t+nhC9DzCqKTV80CalJSz4SQ3ZEx/0cEojr5S3A3h+jmNHshi
         eVbw==
X-Gm-Message-State: AOAM530hhQPEHW7PgyI19xGSEPe8xyp+pJ6Wks2zWj/XvpwYsmJc92L7
        zV7R1xP69fLvUpJJZAw9fl1sFA==
X-Google-Smtp-Source: ABdhPJx/0i0Q4w9yBQIOKqEX9gxLovY6A8fv3oLdiUqAAQDOQhGIGRlyg42dxUamof3p8qhq3yitWg==
X-Received: by 2002:a63:ec4f:: with SMTP id r15mr5763225pgj.190.1639528600653;
        Tue, 14 Dec 2021 16:36:40 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:46aa:90e5:f847:f509])
        by smtp.gmail.com with ESMTPSA id l9sm250788pfu.55.2021.12.14.16.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:36:40 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] arm64: dts: sc7180: Add board regulators for MIPI camera trogdor boards
Date:   Tue, 14 Dec 2021 16:36:38 -0800
Message-Id: <20211215003639.386460-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some trogdor boards have on-board regulators for the MIPI camera
components. Add nodes describing these regulators so boards with these
supplies can consume them.

Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  16 +++
 .../dts/qcom/sc7180-trogdor-homestar.dtsi     |  16 +++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 122 ++++++++++++++++++
 3 files changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index 14ed09f30a73..c81805ef2250 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -142,6 +142,22 @@ skin-temp-thermistor@1 {
 	};
 };
 
+&pp1800_uf_cam {
+	status = "okay";
+};
+
+&pp1800_wf_cam {
+	status = "okay";
+};
+
+&pp2800_uf_cam {
+	status = "okay";
+};
+
+&pp2800_wf_cam {
+	status = "okay";
+};
+
 &pp3300_dx_edp {
 	gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index 4ab890b2a1d4..9110fed291c4 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -149,6 +149,22 @@ skin-temp-thermistor@1 {
 	};
 };
 
+&pp1800_uf_cam {
+	status = "okay";
+};
+
+&pp1800_wf_cam {
+	status = "okay";
+};
+
+&pp2800_uf_cam {
+	status = "okay";
+};
+
+&pp2800_wf_cam {
+	status = "okay";
+};
+
 &pp3300_dx_edp {
 	gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index d4f4441179fc..1dd8e35093a8 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -113,6 +113,40 @@ src_vph_pwr: src-vph-pwr-regulator {
 		vin-supply = <&ppvar_sys>;
 	};
 
+	pp1800_uf_cam: pp1800-uf-cam-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1800_uf_cam";
+		status = "disabled";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&uf_cam_en>;
+
+		vin-supply = <&pp1800_ldo>;
+		regulator-enable-ramp-delay = <1000>;
+	};
+
+	pp1800_wf_cam: pp1800-wf-cam-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1800_wf_cam";
+		status = "disabled";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wf_cam_en>;
+
+		vin-supply = <&pp1800_ldo>;
+		regulator-enable-ramp-delay = <1000>;
+	};
+
 	pp5000_a: pp5000-a-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "pp5000_a";
@@ -144,6 +178,66 @@ pp3300_a: pp3300-a-regulator {
 		vin-supply = <&ppvar_sys>;
 	};
 
+	pp1800_ec:
+	pp1800_sensors:
+	pp1800_ldo: pp1800-ldo-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1800_ldo";
+
+		/* EC turns on with hibernate_l; always on for AP */
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		/*
+		 * Actually should be pp1800_h1 but we don't have any need to
+		 * model that so we use the parent of pp1800_h1.
+		 */
+		vin-supply = <&pp3300_a>;
+	};
+
+	pp2800_uf_cam: pp2800-uf-cam-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pp2800_uf_cam";
+		status = "disabled";
+
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+
+		gpio = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		/*
+		 * The pinconf can only be referenced once so we put it on the
+		 * first regulator and comment it out here.
+		 * pinctrl-names = "default";
+		 * pinctrl-0 = <&uf_cam_en>;
+		 */
+
+		vin-supply = <&pp3300_a>;
+	};
+
+	pp2800_vcm_wf_cam:
+	pp2800_wf_cam: pp2800-wf-cam-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pp2800_wf_cam";
+		status = "disabled";
+
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+
+		gpio = <&tlmm 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		/*
+		 * The pinconf can only be referenced once so we put it on the
+		 * first regulator and comment it out here.
+		 * pinctrl-names = "default";
+		 * pinctrl-0 = <&wf_cam_en>;
+		 */
+
+		vin-supply = <&pp3300_a>;
+	};
+
 	pp3300_audio:
 	pp3300_codec: pp3300-codec-regulator {
 		compatible = "regulator-fixed";
@@ -1517,4 +1611,32 @@ pinconf-sd-cd {
 			drive-strength = <2>;
 		};
 	};
+
+	uf_cam_en: uf-cam-en {
+		pinmux {
+			pins = "gpio6";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio6";
+			drive-strength = <2>;
+			/* External pull down */
+			bias-disable;
+		};
+	};
+
+	wf_cam_en: wf-cam-en {
+		pinmux {
+			pins = "gpio7";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio7";
+			drive-strength = <2>;
+			/* External pull down */
+			bias-disable;
+		};
+	};
 };

base-commit: 136057256686de39cc3a07c2e39ef6bc43003ff6
-- 
https://chromeos.dev

