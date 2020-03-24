Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91EBF19157F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 17:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728301AbgCXP6z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 11:58:55 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51111 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728009AbgCXP6y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 11:58:54 -0400
Received: by mail-wm1-f65.google.com with SMTP id d198so3799637wmd.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2020 08:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XPYOl9OSvnlb7pbajpjD/KFcLeeFx7WRfchUdrcylgw=;
        b=YHsHf9RCWJ9Rkt8w6oePRTlQPhaIlN8o9yI18GdZk6d549IZQI9P0+hsaofIYyEuYJ
         Pu4WSGVwS4cBplZPuQ3WqdbIeCm+pJ8I7Q55t8f5yS57f49NCTL6DeIx97+mL4ijqlXM
         Sy+4gHnjl43p9nDSLap7RJ3f7oMqOMH7TO1cruo0H8JyPGX9id6qeoDIJzaTjBskAav7
         uQu6aJZCeEM/zClNuaDzR74lg++HuvFmB41duTI54392uEqAuGclZmUHHpfCUabph7fX
         BFrXxCxj3bYBkmJuiK7X8NVRLWhBcm8zMQchXuJ3gpD9r3GZhHgLzqyaMcFTyTbxfKVf
         ufJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XPYOl9OSvnlb7pbajpjD/KFcLeeFx7WRfchUdrcylgw=;
        b=J7l5FYhd+ypJZAO32VGgeprK7ykhc2iAchvFjEPbxa79q/+bsLhgVI9xGIyOdX+UMp
         tOxNMGIWtQsIwtVuw//ymy8wyqBxGiESvu54nyChuVxSDPxjryrP0P8jx50CQK1JQ5ur
         bRK9er2Li6AtkCuXtNns2UL05viAvA+GhQooQ2rHkhkV9v/YNjjNACV27caTSqI6KVnZ
         JQaKC/fD9ULWSw8CiRv98Tc1/9Rgsxe7m+Tjn8WPdQIHmDPg9uooi7fO9Uo3WiRTRiN5
         PyJSYgH1+ohNdM0HTPDPBlkPYENybilBkE79XIOmrlIZGsI3Ewm4vQwAEzTvPR6nmqtW
         h6Gg==
X-Gm-Message-State: ANhLgQ3W5N1Ybt9FaSrFM0gED4o92eBvFeFwAUzHzQ/c7NSS0Q7MthOt
        iSRVfkg1zzipxUXI4rSS+2mAXg==
X-Google-Smtp-Source: ADFU+vuZkUbQmRe+H1djjQ4pvSEQwOP24JfoxEbqOVwByz2BSkhjvCiifE7uaI//6oPP5ccMUuMJrA==
X-Received: by 2002:a1c:9ecb:: with SMTP id h194mr6657099wme.49.1585065531892;
        Tue, 24 Mar 2020 08:58:51 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:e15d:2127:89a:e5dc])
        by smtp.gmail.com with ESMTPSA id t124sm4993321wmg.13.2020.03.24.08.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 08:58:51 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, Anson.Huang@nxp.com,
        dinguyen@kernel.org, leonard.crestez@nxp.com,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v3 2/6] arm64: dts: apq8016-sbc: Add CCI/Sensor nodes
Date:   Tue, 24 Mar 2020 16:58:38 +0100
Message-Id: <20200324155843.10719-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324155843.10719-1-robert.foss@linaro.org>
References: <20200324155843.10719-1-robert.foss@linaro.org>
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
index 037e26b3f8d5..d98c7e9e6eb9 100644
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

