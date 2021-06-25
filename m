Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981473B4A69
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jun 2021 00:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhFYWF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 18:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhFYWFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 18:05:55 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1682C0617A8
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 15:03:33 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id u190so9300820pgd.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 15:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O4ese8Y4+WSHdRNE0+R9rpSzI0msBCg5RrtNbTiIqXM=;
        b=Cv064OjNvDCHlDf/LlWl/Wj6EQ0ckksJX0ePjELby3NYPebamCDitDYh5UOh6dNsHH
         rY3hm8o/JQMdIFFYR+3K8IOw6FyccFk2ZseFoAdyBTNppN3sTH1u0ckoDTFyyQde1K+1
         tZ8G36Rvynxree8SAW2lmKLbC1W3BXb38xvhknGkApAlMqzeJdxUzhE4ZHrkNdCQSKZp
         alsor1IFRdU4kwnMQmIBz9WhyvOkQrotoB0KxOsCnKB8BIVDWnLqlip+sI3SvLG6Bu7S
         uFTfYFb3CC+xcHOYMwkO0sZbnyfflZnSfiZFjC4xsb1XYhobJGQ0/5vuH83lYRNN1JUu
         Uz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O4ese8Y4+WSHdRNE0+R9rpSzI0msBCg5RrtNbTiIqXM=;
        b=JU94ga4baoIgPEvzUI37QG8+8LSMFA6t+myKcivbcPK0k2C8XhjYqPCm2SR2uzr7V1
         IJt5p/Uf41qUoLg7g2Ml6L9YsmpsdB440W8gwL0FQB6Fjhi6GT6VCWM7X/AHHQk83m/L
         qTI03nPbjvUwuakY7VD4g47Az4crx7cCEOUuOon3HGbA7Gubhd3/bMYAzCv6Rnw/FGow
         6jLTPhM0TOzaBZ3Ey3E7l8jafmkwYlWOCTH3X7G7c9Yhmj0vSBbYeAj/FKGNMWOMPtza
         gi2K/2Ni3a24A2KVG6gL1VpiZy4dJcZQCm02alcjd7mssG7poe4MDaVzon2VIaf9m7zi
         Coog==
X-Gm-Message-State: AOAM532m1+1hANMjRMH/mGmx19oF0205/d7ZtWqXERjkIdbuzMLl1qhL
        xKbPVoU8DG21BSAuNP0/DS3C4kBfJPW55g==
X-Google-Smtp-Source: ABdhPJxe8S2kEQbTu6Z4fKxxr3Tm9HmzleVP6Kc8hVv16kFSf9Oc69fk4hi+1DqlmoQiTPdPp8Z/hA==
X-Received: by 2002:aa7:88d6:0:b029:300:6247:8141 with SMTP id k22-20020aa788d60000b029030062478141mr12351002pff.47.1624658612953;
        Fri, 25 Jun 2021 15:03:32 -0700 (PDT)
Received: from localhost.name ([122.177.20.255])
        by smtp.gmail.com with ESMTPSA id d9sm6374040pjx.13.2021.06.25.15.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 15:03:32 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        balbi@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: Fix usb entries for SA8155p adp board
Date:   Sat, 26 Jun 2021 03:33:11 +0530
Message-Id: <20210625220311.527549-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625220311.527549-1-bhupesh.sharma@linaro.org>
References: <20210625220311.527549-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SA8155p adp board has two USB A-type receptacles called
USB-portB and USB-portC respectively.

While USB-portB is a USB High-Speed connector/interface, the
USB-portC one is a USB 3.1 Super-Speed connector/interface.

Also the USB-portB is used as the USB emergency
download port (for image download purposes).

Enable both the ports on the board in USB Host mode (since all
the USB interfaces are brought out to USB Type A
connectors).

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 60 ++++++++++++++++++++----
 1 file changed, 51 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 0da7a3b8d1bf..5ae2ddc65f7e 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -307,10 +307,6 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
-&tlmm {
-	gpio-reserved-ranges = <0 4>;
-};
-
 &uart2 {
 	status = "okay";
 };
@@ -337,6 +333,16 @@ &ufs_mem_phy {
 	vdda-pll-max-microamp = <18300>;
 };
 
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "host";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb2phy_ac_en1_default>;
+};
 
 &usb_1_hsphy {
 	status = "okay";
@@ -346,15 +352,51 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
+	status = "disabled";
+};
+
+&usb_2 {
 	status = "okay";
-	vdda-phy-supply = <&vreg_l8c_1p2>;
-	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
 };
 
-&usb_1 {
+&usb_2_dwc3 {
+	dr_mode = "host";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb2phy_ac_en2_default>;
+};
+
+&usb_2_hsphy {
 	status = "okay";
+	vdda-pll-supply = <&vdd_usb_hs_core>;
+	vdda33-supply = <&vdda_usb_hs_3p1>;
+	vdda18-supply = <&vdda_usb_hs_1p8>;
 };
 
-&usb_1_dwc3 {
-	dr_mode = "peripheral";
+&usb_2_qmpphy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l8c_1p2>;
+	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>;
+
+	usb2phy_ac_en1_default: usb2phy_ac_en1_default {
+		mux {
+			pins = "gpio113";
+			function = "usb2phy_ac";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+
+	usb2phy_ac_en2_default: usb2phy_ac_en2_default {
+		mux {
+			pins = "gpio123";
+			function = "usb2phy_ac";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
 };
-- 
2.31.1

