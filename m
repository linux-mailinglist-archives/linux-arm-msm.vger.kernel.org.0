Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9112C177D0C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 18:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729821AbgCCRMT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 12:12:19 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51233 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730734AbgCCRMQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 12:12:16 -0500
Received: by mail-wm1-f66.google.com with SMTP id a132so4159739wme.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 09:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LBQ2v3hA6tUuTQv1F+Yyise6oBp+Wr4OulTkBt8Vu4I=;
        b=MuZ/MiO2WECej5cula13eoTtSplGql2nE4/SV0KTwBnbu1ULqTOwYdxwhA9dTioSVG
         MDF6Y7w6EF/Etsd0sds4bS4DiXQTLMO+O8Zruq5mrFfU75ahUKCpn87rQgv8Ugz5orSd
         pehyOiaNqPHFgkt1lCDbVz5qGvx3cKrxm2G8HzeLddue7+pdhcwZTIPRO6EI863Vcm8o
         NmLGUNMw3OnmCblBtEnOzighvjaiLNgv8LDvFApMorKHn0R59sJafAMM73Q2PAkzMZLf
         oPuC1UGwO2skPUuXI0XyyOZB5a0THy2BFygUAHJAoARhWovvYDNtv/S9y6Xk9MM0t88A
         41qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LBQ2v3hA6tUuTQv1F+Yyise6oBp+Wr4OulTkBt8Vu4I=;
        b=NADjWt2kdJF13FdhOAn3D91p5hWABrhhFOLTRExOhooyu24j0HRmYzBvgHTN7Cv6Ij
         otROfAoDkBOUV5ZZNv2fKYHvo5xmVJl+qpzRUVWdCCaDRo6ifBwBDUmxR+LmBvTtahc+
         VUn38H7u0t3KYAghjvxGT95yvUZZ3Ol6vuHRy2dY4l+qZxvGLONVil9LCJm7v0VF1J9k
         BjxlU7eGsyIGuXqINqdJBlVc5mQxaU44XMp8XNBBDXvUPzfke8g5TblO7hCXmIooZQXy
         QEKbGE+xp4i1LNv20fAZv8hsbNPEQLrQ01fnNZ80DKT3yVyWJRp9rrsoc12Fo64rrkzL
         +Kzw==
X-Gm-Message-State: ANhLgQ2lhiHYcusthliVKDta5S6jiBeAtklpcmIMkTvTPd08MXKHBVc/
        9cORFfbhVWLpTKZgdJnbJm3CDhweT6o=
X-Google-Smtp-Source: ADFU+vtjKGrY2UQkokTzHe0CV7rbHBSu/5iKmuaPRTnpGoKYIJ2QcJzM9XpasbAPE/3CsG61MXPzIw==
X-Received: by 2002:a1c:4b0f:: with SMTP id y15mr5143834wma.87.1583255534987;
        Tue, 03 Mar 2020 09:12:14 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:12:14 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v7 18/18] arm64: dts: qcom: qcs404-evb: Enable USB controllers
Date:   Tue,  3 Mar 2020 17:11:59 +0000
Message-Id: <20200303171159.246992-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
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
index 44c7dda1e1fc..4dc3f45282fe 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -319,6 +319,46 @@ pinconf {
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
2.25.1

