Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE17B155024
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 02:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbgBGB7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 20:59:25 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52617 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727618AbgBGB7Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 20:59:24 -0500
Received: by mail-wm1-f66.google.com with SMTP id p9so941253wmc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2020 17:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yws95nmaJZSmNzRJG51ZJDH/5MHh+qOjv+20GRqLWDg=;
        b=EB4qPHFiqjaHLWaM/xuGWdSlWoqy/me+RmkCCtLDpUqfROTlp11Nua9NpW76lSXJo6
         ol5HnB5j5EX18l8zD/2VjMykku+H0QwTjhYwS9COhevjdwrou9Fw0FijvSjEhVOJwx1N
         6IGnpJc+1rBgWMwF9eQKFMj2RnNPRsas+kbZfAmodzE3xFWpCsI0lOAFZZHMfJvsUtSY
         EqrpKVw0YEbkyYElU6X4xsGXJrYoTSxvL0dlf2Q8RQfjRF3imtAMQnoBaxSvTPtSBnsd
         8hzGiEjJPNLgaAMYSbdPltRfnksqE05dj4ZPutHykMSCZ/mSRogs1WbHbrUDxI/lCYz4
         ngJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yws95nmaJZSmNzRJG51ZJDH/5MHh+qOjv+20GRqLWDg=;
        b=oP/EzXPMZFD4q9HoA5lX/O6uuO18FhHjcKLqdYnIPPzM2BeloIeHxzz+5f/2+vbOqb
         TSRJVMVriFEP487SZfRuWWWrt2ji3wkRanSpEqyDo5jIWFR/rSDMM6uf2g9r/AkTxCKG
         rfSHxA0oJHzh6IufuFjgPH2J0HSBaSs1+DbupGfBh9VycrCckVpGsngYZoE3CahHY3hq
         FZM6XLIf6hccaU2juep89P2WEcZgs7/ofCWDFFJ9seyKYOs1DYEnP7Y2Dd8hi66P6AAM
         /4dngavuXsBFfSNSmQEGp/mYCuT23N99GKd5R48VAu0Ox4YIvrnz+3PIJzldoJomHKGp
         H2HQ==
X-Gm-Message-State: APjAAAUS37uT3NuJGaQrLFX1UPiGIsemGgb54EwrKmXwoEzSMHczIlN1
        NgQd5VR+nBBUCkOnoIMhoTvBNK0LtbM=
X-Google-Smtp-Source: APXvYqymcKqIpAqu/yA09z56SWIcUHvFeO6IwFLJ/k5vRwPvn5AEcGhoHMWSMAENnnnyws5hqQZpRQ==
X-Received: by 2002:a05:600c:224a:: with SMTP id a10mr950345wmm.143.1581040762397;
        Thu, 06 Feb 2020 17:59:22 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a62sm1490095wmh.33.2020.02.06.17.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 17:59:21 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v4 12/18] arm64: dts: qcom: qcs404-evb: Define VBUS detect pin
Date:   Fri,  7 Feb 2020 01:59:01 +0000
Message-Id: <20200207015907.242991-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VBUS present/absent is presented to the SoC via a GPIO on the EVB. Define
the pin mapping for later use by gpio-usb-conn.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 501a7330dbc8..6d53dc342f97 100644
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
@@ -270,6 +272,18 @@ rclk {
 	};
 };
 
+&pms405_gpios {
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
2.25.0

