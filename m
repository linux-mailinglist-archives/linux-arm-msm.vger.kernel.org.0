Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D7F225A72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 10:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgGTIyX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 04:54:23 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:23224 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgGTIyX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 04:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595235260;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=gpNTwwXFV4Hfgnj72qN9DpHxzi/LLdSLme1NgmlaSLQ=;
        b=MaZJSyxjQazbw64mABjmcMRvR5V6N55oQPBtzcZRChxsVR8JIhryGDlbbPuwyso7Fn
        5BnJcGJdDZrNeOKwrR8XW4G/iUTs2miX30qMbFR8nf+lmKNfXc9dPX8ut7+aXIJk8L5M
        5t0YzZkSzYXUCfods/eB9lTPaCyUmx29JImYs7i8UIsagaUXF0lVfnatUyXYrSB5GFM+
        jNFC0d8WwEWspuhERkLMC+CTEaS1wthnMgKvX4ytTaPm/V0qv9HceKc8oPgeIIbJEsTo
        wh4vDJ+xRTINtTt8d/blTiezrIArA5A0/oXgNKQ5g1huC0bAQaIy3VQxNb9rlqplewgS
        fjyA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6NeHYC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew6K8sHdgD
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 20 Jul 2020 10:54:17 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 01/10] arm64: dts: qcom: apq8016-sbc: Remove properties that are already default
Date:   Mon, 20 Jul 2020 10:53:57 +0200
Message-Id: <20200720085406.6716-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720085406.6716-1-stephan@gerhold.net>
References: <20200720085406.6716-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

apq8016-sbc.dtsi overrides several properties that are already the
default in msm8916.dtsi. Remove these to simplify the device tree
a bit.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 194343510dcb..0bec6dac17ad 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -387,7 +387,6 @@ usb@78d9000 {
 			adp-disable;
 			hnp-disable;
 			srp-disable;
-			dr_mode = "otg";
 			pinctrl-names = "default", "device";
 			pinctrl-0 = <&usb_sw_sel_pm &usb_hub_reset_pm>;
 			pinctrl-1 = <&usb_sw_sel_pm_device &usb_hub_reset_pm_device>;
@@ -405,15 +404,7 @@ lpass@7708000 {
 		};
 
 		mdss@1a00000 {
-			status = "okay";
-
-			mdp@1a01000 {
-				status = "okay";
-			};
-
 			dsi@1a98000 {
-				status = "okay";
-
 				vdda-supply = <&pm8916_l2>;
 				vddio-supply = <&pm8916_l6>;
 
@@ -428,16 +419,10 @@ endpoint {
 			};
 
 			dsi-phy@1a98300 {
-				status = "okay";
-
 				vddio-supply = <&pm8916_l6>;
 			};
 		};
 
-		lpass_codec: codec{
-			status = "okay";
-		};
-
 		/*
 		Internal Codec
 			playback - Primary MI2S
@@ -587,8 +572,6 @@ button@0 {
 &camss {
 	status = "ok";
 	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
 		port@0 {
 			reg = <0>;
 			csiphy0_ep: endpoint {
@@ -651,7 +634,6 @@ resin {
 };
 
 &wcd_codec {
-	status = "okay";
 	clocks = <&gcc GCC_CODEC_DIGCODEC_CLK>;
 	clock-names = "mclk";
 	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;
-- 
2.27.0

