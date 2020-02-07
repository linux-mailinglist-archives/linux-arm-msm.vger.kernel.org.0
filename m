Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDAD2155F2A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 21:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727731AbgBGURQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 15:17:16 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42809 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727747AbgBGURN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 15:17:13 -0500
Received: by mail-wr1-f65.google.com with SMTP id k11so363523wrd.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2020 12:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dlgrD1ImLwD8i7swr2073g2/em63RPZPKMG2q6/uiVU=;
        b=Ru4R36kTtWo7RY+7R96hpnx7U4sdZ95e5vrc2PCKal3y0Pmq4XW9r1cPh45LLKmIxo
         C9UQwp4tsILXsP4T9ciEBiAiwfQnimN93bMsJvhBV6cotvScHBlACyorUxuCYt8OQvtb
         ho4AJOdsTlUWoBADTDM8dT0pYigB3GbSjdYuHtBFQn9ZlcekMaqop8GeZfDQMoxADijn
         1l1ZKQ6CW5pcRcyktTZCc1baIkfH1NALgUFdTi3rb+eqvvE8ST3KeQfksZolPsL7hXyx
         EAOdixPfG4ktmNqWkwhtktkVDdU9zW2237aa5qctzskVtU7kaZ041+JTMO1OkqHJrn+X
         hcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dlgrD1ImLwD8i7swr2073g2/em63RPZPKMG2q6/uiVU=;
        b=YB5CSkIt7C447a0dx+xBoeOrVT+vjJRlzsmD2OJUn8UNRXGP861GE2+sgpiS+Tre1l
         8G+0PkW5zNq8TpXfchQ3Pe3kREBerRSL3OSTqWLQDQt9ELwf+unu9Jt8vj/LK1LADhxW
         OVtNQ2O/GymPWV1q3h4sGHw0ur1D7Dr4lGdBuTiafUrtVfF4/bVQMQwgVdoTEr52COXz
         L4FE08g/vtFY98zYqzefP/CWx3uw8TcCBbibFO0Gl5SZHFjPuJN48037qYAvipXZLiMU
         CotZyk5PB2pCl77jrWr5gM2QiFuqbCDG+MhGqCSCCbEoTB2wbsAsJD39Hu/Fn3XXnKvN
         fU0g==
X-Gm-Message-State: APjAAAUWE9B9N85MIR15dSeRdHkVhQzUd9obCPf6mfnTBN8uf60g+6E7
        g+bZEOFhYS7rsCcfQFXBXHTASfoFwSQ=
X-Google-Smtp-Source: APXvYqzE9BTTrq21fdw8OjnE89OQse/v2jVi476ojGDmrV4TRcoetaQFboSU5vlQ6uS2bchtechMiA==
X-Received: by 2002:adf:f802:: with SMTP id s2mr758230wrp.201.1581106630760;
        Fri, 07 Feb 2020 12:17:10 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id h2sm5018542wrt.45.2020.02.07.12.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 12:17:10 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v5 18/18] arm64: dts: qcom: qcs404-evb: Enable USB controllers
Date:   Fri,  7 Feb 2020 20:16:54 +0000
Message-Id: <20200207201654.641525-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
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

