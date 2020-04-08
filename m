Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCA81A22B0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgDHNKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:10:50 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53542 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729042AbgDHNKu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:10:50 -0400
Received: by mail-wm1-f68.google.com with SMTP id d77so5089748wmd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uCoRzaUrdhheeIlUNW47HAync5dklHonb09Mc1gGeaQ=;
        b=m0gdP+gW2L38CLkfKlAS1TDbSuutmYiyI58ZPkFL97FtWIweFVvbOIKVe+WTNSaHKA
         xkLRgN1PWfwEU61PK41yfNVb3P6jnaDql+mh9ce86e79y7CtT+GSIxI7wutR7gbwWJiK
         aZhaa9f98WnLj0Pw8euMTGIQd3N2MUdAkCL/P0bg80egMhuBb4w7JfTQPIxmjRdtE3j2
         YtAiz7lnBZ2SzjzGzc2lSCPWo2hluvX/TNBKIUYt4wybra/TqfvuaLuraV0kePIh+TIR
         bDAqPzIVQYozMf9SBkCC1qX4L4rp9+Y6DBRWZO1dLgcs2BLBSZ01I98Xnd0dLXzk4f/6
         WZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uCoRzaUrdhheeIlUNW47HAync5dklHonb09Mc1gGeaQ=;
        b=BEDlb5d7PBubVsp7XD8JBK1KDf6o6WbE/gNIwsAESJSv86eDQIae7eT9/Id6dbQN9y
         6yKOybTny2thNqLBcOlsqOKzpBWRAxDW5bZu+SmQDZCS1q91ZJk9vRMxb2k4jFt1/OGk
         LmzTWipKjRc1NkCUZMH6RuMvoi1tZ+w0EGEDQB4fAe/tFA0lwGGIME7RW0Wvoq2IT6hg
         gZshWaEk1sNijXhEhUUxFut5P0tyhCZO5s/2/6jdqtGE2OWIvFuEOzke1Wvp+SudFgLi
         yd40kWgv2TAY0w+SQfNj0I12dt5FBSJ/+vlddKAzPen8byWC6dQXTdb0gqmovLenzAt9
         kA2g==
X-Gm-Message-State: AGi0PubPAS4w2oc97mzPOYxweofgUBOXrCCXcY3n2LIQKOgutZ0rchUh
        7A0Z2X9fGe3UmpuIxFOKX7n0Ig==
X-Google-Smtp-Source: APiQypI8sSJsIxwVReEYgGo7DltNbhld0IwxBkK3vozu76CjKVRzBofc5Zdgq1mBXZhSwpBQCte0ZA==
X-Received: by 2002:a1c:bd8b:: with SMTP id n133mr4806161wmf.175.1586351448472;
        Wed, 08 Apr 2020 06:10:48 -0700 (PDT)
Received: from localhost.localdomain ([37.120.50.78])
        by smtp.gmail.com with ESMTPSA id f4sm18428044wrp.80.2020.04.08.06.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 06:10:47 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        leoyang.li@nxp.com, Anson.Huang@nxp.com, olof@lixom.net,
        leonard.crestez@nxp.com, geert+renesas@glider.be,
        marcin.juszkiewicz@linaro.org, valentin.schneider@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 2/6] arm64: dts: apq8016-sbc: Add CCI/Sensor nodes
Date:   Wed,  8 Apr 2020 15:09:55 +0200
Message-Id: <20200408130959.2717409-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408130959.2717409-1-robert.foss@linaro.org>
References: <20200408130959.2717409-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

Add cci device to msm8916.dtsi.
Add default 96boards camera node for db410c (apq8016-sbc).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
 - Reference CCI by label
 - Don't use generic node names
 - Move regulator nodes out of /soc
 - Use CCI label and move node out of /soc
 - Use reference for camss and move node out of /soc
 - Use reference for cci-i2c0 and move out of /cci
 - Disable camera_read by default, since no mezzanine board is guaranteed

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 76 +++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 06aab44d798c..14982762088d 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -51,6 +51,30 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	camera_vdddo_1v8: camera_vdddo_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vdddo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	camera_vdda_2v8: camera_vdda_2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vdda";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
+
+	camera_vddd_1v5: camera_vddd_1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vddd";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+	};
+
 	reserved-memory {
 		ramoops@bff00000{
 			compatible = "ramoops";
@@ -538,6 +562,58 @@ button@0 {
 	};
 };
 
+&camss {
+	status = "ok";
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			csiphy0_ep: endpoint {
+				clock-lanes = <1>;
+				data-lanes = <0 2>;
+				remote-endpoint = <&ov5640_ep>;
+				status = "okay";
+			};
+		};
+	};
+};
+
+&cci {
+	status = "ok";
+};
+
+&cci_i2c0 {
+	camera_rear@3b {
+		compatible = "ovti,ov5640";
+		reg = <0x3b>;
+
+		enable-gpios = <&msmgpio 34 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&camera_rear_default>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		clock-names = "xclk";
+		clock-frequency = <23880000>;
+
+		vdddo-supply = <&camera_vdddo_1v8>;
+		vdda-supply = <&camera_vdda_2v8>;
+		vddd-supply = <&camera_vddd_1v5>;
+
+		/* No camera mezzanine by default */
+		status = "disabled";
+
+		port {
+			ov5640_ep: endpoint {
+				clock-lanes = <1>;
+				data-lanes = <0 2>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8916_0: pm8916@0 {
 		pon@800 {
-- 
2.25.1

