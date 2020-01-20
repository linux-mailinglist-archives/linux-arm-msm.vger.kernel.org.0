Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12C70142FD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 17:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbgATQbG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jan 2020 11:31:06 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33316 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729543AbgATQbF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jan 2020 11:31:05 -0500
Received: by mail-wr1-f68.google.com with SMTP id b6so140121wrq.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2020 08:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yws95nmaJZSmNzRJG51ZJDH/5MHh+qOjv+20GRqLWDg=;
        b=JjhzdQjI+TWAYz1W/yWbj5v73/R2yaAsNLu70EMpS+qEOvlaaV4FjluSActlg4WFY4
         rAwBvSpt36j6czs8YgW9dtDQwu3NdidQ/G08DvOAObI5a0nhQq/KV1D6BO+ZyXNIaWDj
         bVwt4gN1yYlp3/98Dahc58YnHw1HEmcWpipqBed13sjZUL3xoImM1hQGxI3uOipni1zZ
         06SNw0hLPZKpEo6F01Ck36suztNkZ2xVIsCGbALl1gbT9Kjqa4dWk7vSsXHC47gXlv/M
         qACwlHWuOuRH0EAfg3dmHfodAo4zmnJEpu08g/FFub312mbInsECtth5DEYOw8QXmBoz
         MIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yws95nmaJZSmNzRJG51ZJDH/5MHh+qOjv+20GRqLWDg=;
        b=AeehJduWq/hWQ0UcctmTbC9EK+4oyopYLB594VKK2BNWqdWqhNN82WbVQ1SEnLTjzr
         gNAt0M7WkhrSahXeCfjlFhYavYYg3ACQVDEdyilGLmRx4+Eaqx4JS+iUG6d8O2QjghRA
         j6/9XSWeyIDmj0Nw6EdeGjlNT7Ka8vK8sVt2JdmsI+Y/gEgAAnGaqlL1BBr1nVM1LL9R
         po8C8YhBSES60KkYmDlEJ/rwOgGy/clHNB6PKPRNUw6vnrx5Oix+VHqqGovsFfrjxvLD
         GRSsJZYfjScLGsh1n1XIVFEhoJPaMrPJIGs73PPJ3GExTX4ix/G3zohsNXdqw+yQWBmW
         qQVQ==
X-Gm-Message-State: APjAAAUw27OgH+9qRGnVsObfMBp987+2Ic7ekOEddvK/1fhW6YpAPzJD
        zKMctWZNPLwV7t16AWHUPP9239PXTQQ=
X-Google-Smtp-Source: APXvYqxmOZCSEA6GQloH9Buo4cUZ/wrM1BQmJrm83dbNodgqFFA3OF3cv8qxYTmhpFI31XBGoRqBGg==
X-Received: by 2002:adf:fe07:: with SMTP id n7mr331993wrr.286.1579537863155;
        Mon, 20 Jan 2020 08:31:03 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:31:02 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v2 13/19] arm64: dts: qcom: qcs404-evb: Define VBUS detect pin
Date:   Mon, 20 Jan 2020 16:31:10 +0000
Message-Id: <20200120163116.1197682-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
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

