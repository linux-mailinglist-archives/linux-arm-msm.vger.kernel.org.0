Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC9A5731244
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 10:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242016AbjFOIem (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 04:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244393AbjFOIe3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 04:34:29 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3912953
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:34:27 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b1b06af50eso23230821fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686818065; x=1689410065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWnphssxeGoP05vchmR/+BuaOayMwxPZ7IU9KpS7tUE=;
        b=W6eL/9vK6XbhFbeqOTqUOdQUmQsnx/SASVsNYTq49d6JDMLpy95SLOzNWEr27yCRY9
         8P0bhx8KapZi4PDBc1wYOfKnLiK1pfKXmjl9lT0KqYH03x97JCVUZfU4TfdlAKvmhs3v
         g+YpZuCEbmxrPIEFl9OTCmJX+jd7P6Fh3pugtofTIretXdFMmYTuE5Mlf3MV2zWesKWT
         upg8KQbu+V8LcjVTRbXG40q3zYU7DtTWj+u5KrQDUj7tGenOpwdvmGqhsUuZqS7W0daY
         Rq83IeIXsXfo/G7PLQPo24OzRDy0rvZSnY3qk3Gvih6hdNQsJPLXFAh0KKbv5k++ybZ9
         KOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686818065; x=1689410065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWnphssxeGoP05vchmR/+BuaOayMwxPZ7IU9KpS7tUE=;
        b=TGTjq6LtAeN83hLpGnlvLG+gp7b2LO/GVB0DgVtD2Qu9VFmnTMpbiR0E+DjPqLYExy
         g0astiSehMW0vgnR3iL5QGidcyYX/t+4CNYlGqfcreKIE+t1FkR/a36La8TRRXe+6lnf
         1EfBKXSdgT5v5xM7nAEFd0vxvlDthZj7Hak+41jxU5qcVmYeohj37YIVX+/bkjSbXsen
         8Sfg7V8RWn+qgLNaNO8Y36qTvefxzC7ikRx0J8NSnNNQXYMIGvbV2slV3501opRXqtYl
         wh4tfkX35Am4EseGXVbn08n2exQQ20kSgX8tOaz+e8hr2KAMRr+y5vLdd7nW/FlCSMQt
         IuXg==
X-Gm-Message-State: AC+VfDwy1docoF7NnTfnmgkyTKH5gVaO286czZCIlTCjQGLUXctsCzNV
        nWWFa4ZTnlh4C3j3oAurmhZOng==
X-Google-Smtp-Source: ACHHUZ61OcPoEliV7EOGtkD1/Q7l8MK4BUtGOM5hfxZAhH/rUfdzgEvOdDMF+caXRwZkQPYmezQc5Q==
X-Received: by 2002:a2e:2c0e:0:b0:2ad:1ba2:eff9 with SMTP id s14-20020a2e2c0e000000b002ad1ba2eff9mr7705562ljs.20.1686818065240;
        Thu, 15 Jun 2023 01:34:25 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a19-20020a2eb173000000b002ad92dff470sm2971209ljm.134.2023.06.15.01.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 01:34:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] Revert "arm64: dts: qcom: msm8996: rename labels for HDMI nodes"
Date:   Thu, 15 Jun 2023 11:34:21 +0300
Message-Id: <20230615083422.350297-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615083422.350297-1-dmitry.baryshkov@linaro.org>
References: <20230615083422.350297-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit f43b6dc7d56e ("arm64: dts: qcom: msm8996: rename labels for
HDMI nodes") is broken, it changes all the HDMI node names,
compatible strings instead of changing just node aliases. Revert the
commit in order to land a proper clean version.

Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Fixes: f43b6dc7d56e ("arm64: dts: qcom: msm8996: rename labels for HDMI nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts  | 50 ++++++++++----------
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts |  6 +--
 arch/arm64/boot/dts/qcom/msm8996-mtp.dts     |  4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 16 +++----
 4 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 537547b97459..b599909c4463 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -208,6 +208,25 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
+	pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
+
+	core-vdda-supply = <&vreg_l12a_1p8>;
+	core-vcc-supply = <&vreg_s4a_1p8>;
+};
+
+&hdmi_phy {
+	status = "okay";
+
+	vddio-supply = <&vreg_l12a_1p8>;
+	vcca-supply = <&vreg_l28a_0p925>;
+	#phy-cells = <0>;
+};
+
 &hsusb_phy1 {
 	status = "okay";
 
@@ -232,25 +251,6 @@ &mdss {
 	status = "okay";
 };
 
-&mdss_hdmi {
-	status = "okay";
-
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&mdss_hdmi_hpd_active &mdss_hdmi_ddc_active>;
-	pinctrl-1 = <&mdss_hdmi_hpd_suspend &mdss_hdmi_ddc_suspend>;
-
-	core-vdda-supply = <&vreg_l12a_1p8>;
-	core-vcc-supply = <&vreg_s4a_1p8>;
-};
-
-&mdss_hdmi_phy {
-	status = "okay";
-
-	vddio-supply = <&vreg_l12a_1p8>;
-	vcca-supply = <&vreg_l28a_0p925>;
-	#phy-cells = <0>;
-};
-
 &mmcc {
 	vdd-gfx-supply = <&vdd_gfx>;
 };
@@ -433,28 +433,28 @@ sdc2_cd_off: sdc2-cd-off-state {
 		drive-strength = <2>;
 	};
 
-	mdss_hdmi_hpd_active: mdss_hdmi-hpd-active-state {
+	hdmi_hpd_active: hdmi-hpd-active-state {
 		pins = "gpio34";
 		function = "hdmi_hot";
 		bias-pull-down;
 		drive-strength = <16>;
 	};
 
-	mdss_hdmi_hpd_suspend: mdss_hdmi-hpd-suspend-state {
+	hdmi_hpd_suspend: hdmi-hpd-suspend-state {
 		pins = "gpio34";
 		function = "hdmi_hot";
 		bias-pull-down;
 		drive-strength = <2>;
 	};
 
-	mdss_hdmi_ddc_active: mdss_hdmi-ddc-active-state {
+	hdmi_ddc_active: hdmi-ddc-active-state {
 		pins = "gpio32", "gpio33";
 		function = "hdmi_ddc";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
 
-	mdss_hdmi_ddc_suspend: mdss_hdmi-ddc-suspend-state {
+	hdmi_ddc_suspend: hdmi-ddc-suspend-state {
 		pins = "gpio32", "gpio33";
 		function = "hdmi_ddc";
 		drive-strength = <2>;
@@ -1043,7 +1043,7 @@ cpu {
 		};
 	};
 
-	mdss_hdmi-dai-link {
+	hdmi-dai-link {
 		link-name = "HDMI";
 		cpu {
 			sound-dai = <&q6afedai HDMI_RX>;
@@ -1054,7 +1054,7 @@ platform {
 		};
 
 		codec {
-			sound-dai = <&mdss_hdmi 0>;
+			sound-dai = <&hdmi 0>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
index ac6471d1db1f..ed2e2f6c6775 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
@@ -92,15 +92,15 @@ &gpu {
 	status = "okay";
 };
 
-&mdss {
+&hdmi {
 	status = "okay";
 };
 
-&mdss_hdmi {
+&hdmi_phy {
 	status = "okay";
 };
 
-&mdss_hdmi_phy {
+&mdss {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996-mtp.dts b/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
index 495d45a16e63..596ad4c896f5 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
@@ -24,10 +24,10 @@ &blsp2_uart2 {
 	status = "okay";
 };
 
-&mdss_hdmi {
+&hdmi {
 	status = "okay";
 };
 
-&mdss_hdmi_phy {
+&hdmi_phy {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 0cb2d4f08c3a..3855366ca89f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -895,7 +895,7 @@ mmcc: clock-controller@8c0000 {
 				 <&mdss_dsi0_phy 0>,
 				 <&mdss_dsi1_phy 1>,
 				 <&mdss_dsi1_phy 0>,
-				 <&mdss_hdmi_phy>;
+				 <&hdmi_phy>;
 			clock-names = "xo",
 				      "gpll0",
 				      "gcc_mmss_noc_cfg_ahb_clk",
@@ -980,7 +980,7 @@ ports {
 					port@0 {
 						reg = <0>;
 						mdp5_intf3_out: endpoint {
-							remote-endpoint = <&mdss_hdmi_in>;
+							remote-endpoint = <&hdmi_in>;
 						};
 					};
 
@@ -1136,8 +1136,8 @@ mdss_dsi1_phy: phy@996400 {
 				status = "disabled";
 			};
 
-			mdss_hdmi: mdss_hdmi-tx@9a0000 {
-				compatible = "qcom,mdss_hdmi-tx-8996";
+			hdmi: hdmi-tx@9a0000 {
+				compatible = "qcom,hdmi-tx-8996";
 				reg =	<0x009a0000 0x50c>,
 					<0x00070000 0x6158>,
 					<0x009e0000 0xfff>;
@@ -1160,7 +1160,7 @@ mdss_hdmi: mdss_hdmi-tx@9a0000 {
 					"alt_iface",
 					"extp";
 
-				phys = <&mdss_hdmi_phy>;
+				phys = <&hdmi_phy>;
 				#sound-dai-cells = <1>;
 
 				status = "disabled";
@@ -1171,16 +1171,16 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						mdss_hdmi_in: endpoint {
+						hdmi_in: endpoint {
 							remote-endpoint = <&mdp5_intf3_out>;
 						};
 					};
 				};
 			};
 
-			mdss_hdmi_phy: phy@9a0600 {
+			hdmi_phy: phy@9a0600 {
 				#phy-cells = <0>;
-				compatible = "qcom,mdss_hdmi-phy-8996";
+				compatible = "qcom,hdmi-phy-8996";
 				reg = <0x009a0600 0x1c4>,
 				      <0x009a0a00 0x124>,
 				      <0x009a0c00 0x124>,
-- 
2.39.2

