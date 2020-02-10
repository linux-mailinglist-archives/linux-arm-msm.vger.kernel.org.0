Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 635921573FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 13:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbgBJMHx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 07:07:53 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37942 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727782AbgBJMHo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 07:07:44 -0500
Received: by mail-wr1-f67.google.com with SMTP id y17so7338636wrh.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 04:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dlgrD1ImLwD8i7swr2073g2/em63RPZPKMG2q6/uiVU=;
        b=uUWsD3xXPNWZCRZzUdS2YN/EuB9ZtVVSLw6IxS8dRj1eSMq7dCiwtNaRO+3bT5nc+D
         VghAfZAv1tc8NYEvA4SjVupe3sQsVYzxaOi+k8q1lKOMZzSF5tGH6QGGiXWc/t+BAEBD
         18koliwiRZIaIF6BamDEYehIJHr/8LNtGVTkC3nuWVTMroC3pz/I2CUuVfEPopMQDDTH
         pQ4RIcaVXpcuLU3PcoHXlBuAEhkF79HpHzioumIlF4YrwZ3BoF+9L3aOGftaH5kKHKVo
         CfO5vp7Mmuf6KzjbAvH7O6Owyj/owr3ggtFigip/ke8qLI/W6F6O78AlDfTzGozIfff/
         HrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dlgrD1ImLwD8i7swr2073g2/em63RPZPKMG2q6/uiVU=;
        b=QEI28mXS0ZTPpFu3jCrOLs+sr6XeK0C7+twzonqFGU6fVabGVE/2sgUKyqSplANkpT
         4Ks0FNmVtygV+qa5uotpDp4bHOYdxb8iQ74Bo9+coV9U8rZAfugbbRPnjbMWKN/pTMbH
         +iSQa+TGtzHMiSrPHMWhWk9ScFzLzKj1jKAzuQwWYj5ACu12u7XSR5YiiE05919VdvSR
         G/fui6FljzQYwwz2sfneWw2uoy7JtwfdXA/gKwk/RPbzEUaYQnTD78/qiA5a6oO2ViS5
         vb+guIT+6u1C5+b8rLca7/Ik2yRhYM+sE5mLhwWKY1+Y8uWUfcPjf6ckJlG2JD6BfFQH
         F3Lg==
X-Gm-Message-State: APjAAAViuASO4DzA5f9KLtiGTNGe9fam05YquzlApjqba6DxhiIpohbe
        41iMMDM0hOTHqn/ZQ1sb2yfrb+MKuVo=
X-Google-Smtp-Source: APXvYqwTicbL22mHDUW1ie+v1PtpkNYflJpxuGDJn6zmsXhpmjJ4NFJzieYb8MQk8zXmSUJGKLMw9A==
X-Received: by 2002:adf:f10b:: with SMTP id r11mr1633083wro.307.1581336462595;
        Mon, 10 Feb 2020 04:07:42 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i204sm293124wma.44.2020.02.10.04.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:07:42 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v6 18/18] arm64: dts: qcom: qcs404-evb: Enable USB controllers
Date:   Mon, 10 Feb 2020 12:07:23 +0000
Message-Id: <20200210120723.91794-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch enables the primary and secondary USB controllers on the
qcs404-evb.

Primary:
The primary USB controller has

- One USB3 SS PHY using gpio-usb-conn
- One USB2 HS PHY in device mode only and no connector driver
  associated.

Secondary:
The second DWC3 controller which has one USB Hi-Speed PHY attached to it.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 0fff50f755ef..4045d3000da6 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -318,6 +318,46 @@ pinconf {
 	};
 };
 
+&usb2 {
+	status = "okay";
+};
+
+&usb2_phy_sec {
+	vdd-supply = <&vreg_l4_1p2>;
+	vdda1p8-supply = <&vreg_l5_1p8>;
+	vdda3p3-supply = <&vreg_l12_3p3>;
+	status = "okay";
+};
+
+&usb3 {
+	status = "okay";
+	dwc3@7580000 {
+		usb-role-switch;
+		usb_con: connector {
+			compatible = "gpio-usb-b-connector";
+			label = "USB-C";
+			id-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+			vbus-supply = <&usb3_vbus_reg>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&usb3_id_pin>, <&usb3_vbus_pin>;
+			status = "okay";
+		};
+	};
+};
+
+&usb2_phy_prim {
+	vdd-supply = <&vreg_l4_1p2>;
+	vdda1p8-supply = <&vreg_l5_1p8>;
+	vdda3p3-supply = <&vreg_l12_3p3>;
+	status = "okay";
+};
+
+&usb3_phy {
+	vdd-supply = <&vreg_l3_1p05>;
+	vdda1p8-supply = <&vreg_l5_1p8>;
+	status = "okay";
+};
+
 &wifi {
 	status = "okay";
 	vdd-0.8-cx-mx-supply = <&vreg_l2_1p275>;
-- 
2.25.0

