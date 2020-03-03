Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF55177D16
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 18:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730767AbgCCRMd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 12:12:33 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36538 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730708AbgCCRMN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 12:12:13 -0500
Received: by mail-wm1-f68.google.com with SMTP id g83so3668919wme.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 09:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hGNTAFqXsi7D5stT0DNXt+Hv8uO5S+gOsoBxWrDsv3g=;
        b=wzZyOfUmn3V6z5p5vP7MOmOL0F5Cmh1jDgzI3QD1HjW+4XjQ8Hev1ljsBgZu1dYG7t
         IYXAnG+Moabo3pR78T0cZ926kKAZ218rmfHQxxZsZerHxft0NAPyF1g04v0RIM5NXKx9
         7etEFcEJ9yiYVk/aVi0M5xgvmOPkj3X+trPhrNuML1SkFkg1OwaVZ3Jwj66Te4DJnud2
         Fh2GJhBP9qpQ5p9mXYgsTKj1z5QgNzD6hRlyOh0Mu7oNgFba46xQc1olp9THJAybTBlK
         61MlGYnd+dw0YI086BjClDk9kqrftZdL7U30Vr9NOAR9wt47ACb5al2hN/e8BZHu91r8
         NLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGNTAFqXsi7D5stT0DNXt+Hv8uO5S+gOsoBxWrDsv3g=;
        b=he+A/Bs2hLSu3DZg9L35kQocYHBE2jaNrI/Jn4Hn2UfJ4fto0dFKG2wHsDCOy+N4cZ
         h31x48Tu3NzxYcfrv0LnAvox32axP9RJ62YwE6cJWTbNGaA/8qohw/A6eoBF/Xz65cql
         3iIySJcF4axXhuzwbteOd6An2T/qbSOL7ML/d7ev9UgD8Q1a2/dTUINMuEpxiCMKON1r
         KMIfhmlg23DFVwQ+g1BenKqijfhZE+U1WvaN2TOHzL4sg6XwI0tM+f0wx45RV/qQ0/My
         YypujDX+7nfczgc/TQ28RM8pMJti4NIG9/pgEXFxXEKuZw72QjZ9HdYAu3y8495jZZTe
         hflw==
X-Gm-Message-State: ANhLgQ1c1N5icKUlHpP3dg3UeYwKqAS24eOrt2qp24k9eZjPoHq57iTZ
        9KSfyflFEhSS8lWtEdrxgxPeK4t3pfI=
X-Google-Smtp-Source: ADFU+vvOhzRL7NuzophBFliwar9a0QIHZz0rYBsuA6eN/MXyW5ytE5FgayCW4lonuqLSp6ucIdKeuA==
X-Received: by 2002:a05:600c:4108:: with SMTP id j8mr5114959wmi.188.1583255529920;
        Tue, 03 Mar 2020 09:12:09 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:12:09 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v7 14/18] arm64: dts: qcom: qcs404-evb: Define VBUS pins
Date:   Tue,  3 Mar 2020 17:11:55 +0000
Message-Id: <20200303171159.246992-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Defines VBUS detect and VBUS boost for the QCS404 EVB.

Detect:
VBUS present/absent is presented to the SoC via a GPIO on the EVB. Define
the pin mapping for later use by gpio-usb-conn.

Boost:
An external regulator is used to trigger VBUS on/off via GPIO. This patch
defines the relevant GPIO in the EVB dts.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 522d3ef72df5..62ef9c34b04e 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -4,6 +4,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include "qcs404.dtsi"
 #include "pms405.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	aliases {
@@ -271,6 +273,26 @@ rclk {
 	};
 };
 
+&pms405_gpios {
+	usb_vbus_boost_pin: usb-vbus-boost-pin {
+		pinconf {
+			pins = "gpio3";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-low;
+			power-source = <1>;
+		};
+	};
+	usb3_vbus_pin: usb3-vbus-pin {
+		pinconf {
+			pins = "gpio12";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			input-enable;
+			bias-pull-down;
+			power-source = <1>;
+		};
+	};
+};
+
 &wifi {
 	status = "okay";
 	vdd-0.8-cx-mx-supply = <&vreg_l2_1p275>;
-- 
2.25.1

