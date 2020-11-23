Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC8A2C0DE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 15:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730820AbgKWOkp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 09:40:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730700AbgKWOkp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 09:40:45 -0500
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 300B3C061A4D
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:40:45 -0800 (PST)
Received: by mail-qt1-x842.google.com with SMTP id e60so4244350qtd.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G7Lx+ulfUjkJtOWjBaN8V+ZUQ9XkpEkdc/FGSeKx4Gk=;
        b=v4coxE/sLVKGR/0cRlmUbQ7Ky/9oAKJ325dPfDNSlOBzjuaXdrTllIeyYlDVFJOP3J
         PLbl7hjR+maN/VZm3l15Ip+OnPdOHP6L0PX1SDYN6J2mIuO5bzfeqbWf7Y/JPZlyTWVC
         9FcWuRE7rTLQmxByThCGMUi66Ne4ZQo2KZl5UUFSbZipWHwUJs5f5GwycI9vjJeqizJp
         CnQfYktYDcx27JJCOD/szx/nL4QeoIEi4VdRtGuc1n1ALan4O8EJQU9UXh91RBv0tZak
         lGryjyvU1GYTCWWLuHiKcx7Yw2YXboPcTU4SVp5F79ZQMbzmdeiwYWF0SlyD6+reRfJ6
         NuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G7Lx+ulfUjkJtOWjBaN8V+ZUQ9XkpEkdc/FGSeKx4Gk=;
        b=ZxUto2vB52vyCPcS6JWvNNZSxCpz4jAxVpUMldqQUM5Q4BgqAZxvmucVd6Ckvm+i5Q
         KNiGfz+WtLYuNTR4QtNm+kBDCmIcw9x8kDnRTEVzJYQJtGzd9L8sXgzq5JW9RiTmB+mF
         GHsKyVji4kBBUYj/luxXFuFYDJjpcdtE8vvzq1jK42vGhjWqQDoxqwv5axVPjpYLT6kJ
         UqTUg+JAjUKGh26JLNqz3d3IR3GGU7EqqsJZxWyhRexG+KXGE+ivvyp9QKSoKAGaEKwy
         6qLVvH+qFDxYTLp67w+9qoKr+R6TYe3zc7yy/jxVDeSxbYR/FyWL3THzTHhc3xYMNauR
         XGXw==
X-Gm-Message-State: AOAM533knzlyHw26T4JObFhQeI6MtDtQQBXLcZB8uvWtcugzGdBRxTY2
        XJmRP7BydUj9LavkUnW+49xguPTEQzu4ZxDG
X-Google-Smtp-Source: ABdhPJzBzo9EiY+XpQhMqvhRKaKlzx/TFJdSvep9gvQSUqrSG2wuUN4f5ScqNXzQRUWg8JLSbGz/qA==
X-Received: by 2002:ac8:734c:: with SMTP id q12mr18668190qtp.239.1606142444020;
        Mon, 23 Nov 2020 06:40:44 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g143sm9642929qke.102.2020.11.23.06.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 06:40:43 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: qcom: update usb qmp phy clock-cells property
Date:   Mon, 23 Nov 2020 09:37:05 -0500
Message-Id: <20201123143705.14277-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The top-level node doesn't provide any clocks, the subnode provides a
single clock with of_clk_hw_simple_get.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 4 ++--
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6678f1e8e395..0189cbfad521 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2608,7 +2608,6 @@ usb_1_qmpphy: phy-wrapper@88e9000 {
 			      <0 0x088e8000 0 0x38>;
 			reg-names = "reg-base", "dp_com";
 			status = "disabled";
-			#clock-cells = <1>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 40e8c11f23ab..4a353c432a83 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3482,7 +3482,6 @@ usb_1_qmpphy: phy@88e9000 {
 			      <0 0x088e8000 0 0x10>;
 			reg-names = "reg-base", "dp_com";
 			status = "disabled";
-			#clock-cells = <1>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -3504,6 +3503,7 @@ usb_1_ssphy: lanes@88e9200 {
 				      <0 0x088e9600 0 0x128>,
 				      <0 0x088e9800 0 0x200>,
 				      <0 0x088e9a00 0 0x100>;
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
 				clock-names = "pipe0";
@@ -3515,7 +3515,6 @@ usb_2_qmpphy: phy@88eb000 {
 			compatible = "qcom,sdm845-qmp-usb3-uni-phy";
 			reg = <0 0x088eb000 0 0x18c>;
 			status = "disabled";
-			#clock-cells = <1>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -3535,6 +3534,7 @@ usb_2_ssphy: lane@88eb200 {
 				      <0 0x088eb400 0 0x1fc>,
 				      <0 0x088eb800 0 0x218>,
 				      <0 0x088eb600 0 0x70>;
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 				clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
 				clock-names = "pipe0";
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index dab852833a65..bcfb06f5bebe 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -857,7 +857,6 @@ usb_1_qmpphy: phy@88e9000 {
 			      <0 0x088e8000 0 0x10>;
 			reg-names = "reg-base", "dp_com";
 			status = "disabled";
-			#clock-cells = <1>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -879,6 +878,7 @@ usb_1_ssphy: lanes@88e9200 {
 				      <0 0x088e9600 0 0x200>,
 				      <0 0x088e9800 0 0x200>,
 				      <0 0x088e9a00 0 0x100>;
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
 				clock-names = "pipe0";
@@ -904,7 +904,6 @@ usb_2_qmpphy: phy@88eb000 {
 			compatible = "qcom,sm8150-qmp-usb3-uni-phy";
 			reg = <0 0x088eb000 0 0x200>;
 			status = "disabled";
-			#clock-cells = <1>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -924,6 +923,7 @@ usb_2_ssphy: lane@88eb200 {
 				      <0 0x088eb400 0 0x200>,
 				      <0 0x088eb800 0 0x800>,
 				      <0 0x088eb600 0 0x200>;
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 				clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
 				clock-names = "pipe0";
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 8300a5873a21..468ba1d18751 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1494,7 +1494,6 @@ usb_1_qmpphy: phy@88e9000 {
 			      <0 0x088e8000 0 0x20>;
 			reg-names = "reg-base", "dp_com";
 			status = "disabled";
-			#clock-cells = <1>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -1515,6 +1514,7 @@ usb_1_ssphy: lanes@88e9200 {
 				      <0 0x088e9600 0 0x200>,
 				      <0 0x088e9800 0 0x200>,
 				      <0 0x088e9a00 0 0x100>;
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
 				clock-names = "pipe0";
@@ -1526,7 +1526,6 @@ usb_2_qmpphy: phy@88eb000 {
 			compatible = "qcom,sm8250-qmp-usb3-uni-phy";
 			reg = <0 0x088eb000 0 0x200>;
 			status = "disabled";
-			#clock-cells = <1>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -1545,6 +1544,7 @@ usb_2_ssphy: lane@88eb200 {
 				reg = <0 0x088eb200 0 0x200>,
 				      <0 0x088eb400 0 0x200>,
 				      <0 0x088eb800 0 0x800>;
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 				clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
 				clock-names = "pipe0";
-- 
2.26.1

