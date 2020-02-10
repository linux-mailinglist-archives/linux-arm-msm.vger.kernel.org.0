Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 196C01573FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 13:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgBJMH5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 07:07:57 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40864 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgBJMHm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 07:07:42 -0500
Received: by mail-wm1-f68.google.com with SMTP id t14so10280565wmi.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 04:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Kx77RkRZ6BLkxPPbqLY1opgnPyzoSH+OO3s+PAvU9w=;
        b=jwidverGDqxKUryr2rjAfuBdvB6PYnCqcqfLl5iwaXxA2Rqsg6SLGtCVM+abnqAmDy
         jWHBkr5Jn5kxh7dwNNcGG0sP0ZlO0SDQ1EMMbVVgBkxQLiztLTc4XqpQPvwfd1dZXf6u
         5KFhD39eiPprRntcTM49u4+dS0OWuAEORspl0UJZWoDsDICJSmBoULkVre5f9goEkI3P
         41lgDWI8s1xucFqyVV3+ZF7DXpiZLJE4EIjPIddki6vOiSi6W6obu5Juoq5PVU9dY/4I
         dbFa5UsgPCEmwbkoHQlPIYaN2bB1hjsANL0lZX1rx/Bi9jwHxUSgZIuAgkl6VPNVih/C
         2uSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Kx77RkRZ6BLkxPPbqLY1opgnPyzoSH+OO3s+PAvU9w=;
        b=OfZQIr6yQ/nBMFi7iGSeGdJ5ViMKb0tCjYkLqCu/KQy2U+f3ymYrNkO0IwkJRBSGJL
         6VpUia+D7Gc90s3SPi4p9siYZhexDBoEmUnJmWrMqwK5DUnfQY1PObck0zCBwQdFhqeZ
         fwlJ9hSgywiK3kWRBq9l6CqqCFDuWnxafFykPKKyFxTIKMgH6pQOVSVrGteCNbj9KSAa
         jH/EfQ1E/7LBbnPhL/Eqvmck4k6j+tgmS0yE2IRk/XKf1xznwJVorFkgOMM0OlzWykof
         Ul4I7UvEDB6Ror6hEgjI3IYaXzv8/4TACwmp+tEwKKTeeJb39KOiufl4KlFm+9k5JN7Y
         GJ9A==
X-Gm-Message-State: APjAAAUvv/U/NOKRR8O5cdRlX3nl6jXdVKKv9QlsCn/gj3Tt5B+Mi0IE
        Y3r+ra/5a3CACJS4Muk07ZkbZ7/Sw1s=
X-Google-Smtp-Source: APXvYqw701m0PX1z/zERDK7rm352EQhGZkc+h8ZXXoz6EqZ/j8XAaSG68jXgkXAw0R6YcPWNdy9oFA==
X-Received: by 2002:a1c:39d7:: with SMTP id g206mr14296473wma.111.1581336460292;
        Mon, 10 Feb 2020 04:07:40 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i204sm293124wma.44.2020.02.10.04.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:07:39 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v6 16/18] arm64: dts: qcom: qcs404-evb: Describe external VBUS regulator
Date:   Mon, 10 Feb 2020 12:07:21 +0000
Message-Id: <20200210120723.91794-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VBUS is supplied by an external regulator controlled by a GPIO pin. This
patch models the regulator as regulator-usb3-vbus.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index abfb2a9a37e9..01ef59e8e5b7 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -33,6 +33,18 @@ vdd_esmps3_3p3: vdd-esmps3-3p3-regulator {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	usb3_vbus_reg: regulator-usb3-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "VBUS_BOOST_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pms405_gpios 3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_vbus_boost_pin>;
+		vin-supply = <&vph_pwr>;
+		enable-active-high;
+	};
 };
 
 &blsp1_uart3 {
-- 
2.25.0

