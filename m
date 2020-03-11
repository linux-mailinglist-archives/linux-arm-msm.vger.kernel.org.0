Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5EF1821F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 20:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731124AbgCKTPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 15:15:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37514 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731245AbgCKTPH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 15:15:07 -0400
Received: by mail-wr1-f68.google.com with SMTP id 6so4127519wre.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3BfHSzn4UCeA2FP5LolQzAR+/B6SLs4bxqX8bC/4tNE=;
        b=r6VLu240RNeUWsOOl/nPDVFRYxuT3S+GA+WHQHy7Qk7RE4h3c4+0YKO6YBXyDbZzT4
         Xz22tvQTRnWpAe8YTCxuecuzAiFNpSQT+6MYPQROStcQB93+7tvEpPZ/0sl75U4kFQRl
         +LoQAG0h1kPrR0dq4ibDKX0pDuuwordljTWwhmhiFijm17jrT49Fb+k9dFDsvYefArYT
         iWKoffTcpa83MvIOUi93QzR4aXISdImP1AY/3D5XBgkNbyTyswnpkK1+fIGBUSeoMxYH
         3FNQWn3r9lSIig4ZamF8nFb7j67hYLU38XyBMeAZL+mRwKIrJfKmmLZCFI+gjnoNX89R
         Q6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3BfHSzn4UCeA2FP5LolQzAR+/B6SLs4bxqX8bC/4tNE=;
        b=Ov+YJqt8wCJB2HplquxWgF+QsndjI9YBfGof7IdCvCVTVldk3svkDWCr74wnuiCRsE
         z8Bda/m65Adkd6Z5Z0/SxEE4SoKhXsJyId22lcPG/RDC1F4psKM2BNZMnPRR8kmo+RHz
         grk0QW9sBbDRscCmPCw5DaMyC92scBuac24OZWydhZazSKaj1wM763jgR1aoFd0KNr9O
         9nJRUU65fssjs3ZKsriZ//3qonmYoz8+WR9011wpjEVLt8no112FTgKHoR6SXmnswcCC
         ONLcSQ6TPlFFrssyXQ1eUvNL8q7HmU2HvBqiT6JltjKZyHUNqTZLtoKdLPDemMBKLjrF
         5XFw==
X-Gm-Message-State: ANhLgQ21AdNvJM5fzR6SWSZw1xHLu3pe1pbzu6nWnWUGFR3YzbNC2K0V
        bz34uwSMqId0CYTYJWKc2fp68A==
X-Google-Smtp-Source: ADFU+vuGmQZPjPDr1rIXs8EjGenquDs/gL0Bo11Ca0LpJc0B56nEbdNtKiu0Ui9qgntKs9aBD/Kq4g==
X-Received: by 2002:a5d:4d48:: with SMTP id a8mr6094375wru.246.1583954104420;
        Wed, 11 Mar 2020 12:15:04 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c85sm9687437wmd.48.2020.03.11.12.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:15:03 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 2/6] arm64: dts: qcom: qcs404-evb: Define VBUS pins
Date:   Wed, 11 Mar 2020 19:15:13 +0000
Message-Id: <20200311191517.8221-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
References: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
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
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

