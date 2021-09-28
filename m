Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F40DB41A4F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 03:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238583AbhI1Bvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 21:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238547AbhI1Bv1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 21:51:27 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 305E7C061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 18:49:49 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so576039pjc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 18:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cry++6+X71PaNOnypG/OsUy9BnBOOfJhMJ6Pn/SOmuw=;
        b=ftliVyTExJSz8UeHHIGvbwYmdzacOv6Cu83WlvFnVl4uTE5Wr0D5cis8lj/4pY1tnB
         VKNTuO+Z4zBETtRD5U2E7TT06BhZNRz+ZnrT/ZDLx4SCEwGq6pup5EWe3u/22vzwNtQ3
         rPK9AaMLV3Vo5VRnPkcNb2ozEUq/uaX3E5Wa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cry++6+X71PaNOnypG/OsUy9BnBOOfJhMJ6Pn/SOmuw=;
        b=Yb2XH9VSl9wcnPIHQG6FkTVb7mT+BZ9PzMk09mfJTYIevshasWLoAjdV03hV03z0Se
         XLqEDV/ce4boohUC1S/Py2oWNBnSLJO4UwU7xub9Hpl+lLuCdnWvvqjObmsPw3xa5GQ3
         dzrkJLd8F1S2W0hS8kYV/k0FIfoItJXwCcZy+ljbbkZBobDraUuREZJQzNeB+js70ICU
         EMrzcYgMs1sG0ay3lWMxvo5X7GUAhKWerq0/AOHpdaWy1a3Ohv0XOmWDm5ZNZ4ZvUzVv
         EcPml8Zl7eGo/uf2K83hYhxcFpTSpGaInZTf1qduChEPnY7CXjaG8jz/AS+s+DhNbH4N
         YYrQ==
X-Gm-Message-State: AOAM533Ze7fiijegzvKf/g9DrtzjdwdgbMIEx5lWYuztq/M7kTg+5ZS5
        ldOr/KX78RFdRlo/UNzKuZNPfA==
X-Google-Smtp-Source: ABdhPJx7DUGxgyYU9HWxHMSnescmzlbwhPjU9RC75PtWMMMr3Z3/f0fz+NJ40waZvQhJL/+mqEIC8Q==
X-Received: by 2002:a17:90b:1c8e:: with SMTP id oo14mr2460115pjb.224.1632793788743;
        Mon, 27 Sep 2021 18:49:48 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:8016:e67e:e320:7523])
        by smtp.gmail.com with ESMTPSA id e15sm13013744pfc.134.2021.09.27.18.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 18:49:48 -0700 (PDT)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org, swboyd@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: sc7180: Support Parade ps8640 edp bridge
Date:   Mon, 27 Sep 2021 18:49:40 -0700
Message-Id: <20210927184858.2.I651eec59ce3cd1c4bdd64de31f9c3531f501b3a8@changeid>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
In-Reply-To: <20210927184858.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
References: <20210927184858.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a dts fragment file to support the sc7180 boards with the second
source edp bridge, Parade ps8640.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

 .../qcom/sc7180-trogdor-parade-ps8640.dtsi    | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
new file mode 100644
index 000000000000..647afb3a7c6a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Trogdor dts fragment for the boards with Parade ps8640 edp bridge
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/ {
+	pp3300_brij_ps8640: pp3300-brij-ps8640 {
+		compatible = "regulator-fixed";
+		status = "okay";
+		regulator-name = "pp3300_brij_ps8640";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 32 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&en_pp3300_edp_brij_ps8640>;
+
+		vin-supply = <&pp3300_a>;
+	};
+};
+
+&dsi0_out {
+	remote-endpoint = <&ps8640_in>;
+};
+
+&i2c2 {
+	ps8640_bridge: edp-bridge@8 {
+		compatible = "parade,ps8640";
+		reg = <0x8>;
+
+		powerdown-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_brij_en>, <&edp_brij_ps8640_rst>;
+
+		vdd12-supply = <&pp1200_brij>;
+		vdd33-supply = <&pp3300_brij_ps8640>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				ps8640_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				ps8640_out: endpoint {
+					remote-endpoint = <&panel_in_edp>;
+				};
+			};
+		};
+
+		aux_bus: aux-bus {
+			panel: panel {
+				/* Compatible will be filled in per-board */
+				power-supply = <&pp3300_dx_edp>;
+				backlight = <&backlight>;
+
+				port {
+					panel_in_edp: endpoint {
+						remote-endpoint = <&ps8640_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&tlmm {
+	edp_brij_ps8640_rst: edp-brij-ps8640-rst {
+		pinmux {
+			pins = "gpio11";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio11";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	en_pp3300_edp_brij_ps8640: en-pp3300-edp-brij-ps8640 {
+		pinmux {
+			pins = "gpio32";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio32";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+};
-- 
2.33.0.685.g46640cef36-goog

