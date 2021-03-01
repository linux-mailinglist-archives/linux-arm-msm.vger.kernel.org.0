Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B8B3293DD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 22:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241296AbhCAVkW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 16:40:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244198AbhCAViL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 16:38:11 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58842C0617AA
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 13:34:50 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id q20so12400565pfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 13:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9bA9mGQR2XV2Gj/ebrJ5SxBXvAk5v97N7zNdK3wCFp8=;
        b=WLxG2oFEc/OXWrJ5q2bugcDgJSWNAZ1XByY9zm7+5G7Ga8Ueu99EB/PpdW6b8DlwaS
         v/8dWE44NSmiY7iBMD5fQdz5jOwu6/0uasbvyvNEHTlrkpfrA8Q1Uc11/VSpiLRfrPeq
         DeicQyd8CPzwfOe2J1h0cGIKBtVQQhlwXk59A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9bA9mGQR2XV2Gj/ebrJ5SxBXvAk5v97N7zNdK3wCFp8=;
        b=gDIMNLoM/L+q8Yaao9/Hv9OXZ8m4YFNVf1BmikPI8bmsJ+dBpTcC7kHKvZqodGpWkO
         q91l3k1d1M3anxRVrG6+Ag6VIVQcj3n2UuTpEFF09DWyV7yK/K/UReP8xxT/7VX9ZHPm
         /ZxHjwIXZJVqPr1WFIRP6SudwW1Av0RkUcEIkojMa7AKeayZgXdl7pHhgetZx9oOw0NL
         XmoYfZceUEgAZCXAzI/VuLAikpCy7dSewcwCcdNSjk2+2QmqMQ1ZydtzxeNhfLHThBgt
         oO1uWJ9ht/lHzyoLpkiI9mBzNRfoIZi5RnikRArWbEDLi5nxJ9FcLVBw77GHHZB2oaec
         kYlQ==
X-Gm-Message-State: AOAM533CSeOJz0KwN+37CG45GP031Oplduau3HBgX7JdNbVwsqx/r8o7
        7lCQE9vJHLtOaFwJ70NW5Hdp8w==
X-Google-Smtp-Source: ABdhPJzC7Eant4eIg87EAGIjnk4wlP3tmMPMyicEXXSBR3McIMNQbbVJPer/hPxvCAtzNgGEzfjlAQ==
X-Received: by 2002:a62:77c7:0:b029:1ed:5afb:4dda with SMTP id s190-20020a6277c70000b02901ed5afb4ddamr16649580pfc.1.1614634489924;
        Mon, 01 Mar 2021 13:34:49 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:c086:5f6:85dd:98c8])
        by smtp.gmail.com with ESMTPSA id f13sm790366pjj.1.2021.03.01.13.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 13:34:49 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/13] arm64: dts: qcom: Prep sc7180-trogdor trackpad IRQ for new boards
Date:   Mon,  1 Mar 2021 13:34:27 -0800
Message-Id: <20210301133318.v2.3.Iddf6dc8102aa4fbc3847936226fc7bf2e2cd315c@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210301213437.4165775-1-dianders@chromium.org>
References: <20210301213437.4165775-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The trackpad interrupt got renamed and also moved to a new GPIO on
newer boards.  Let's do the move in the "trogdor.dtsi" file and then
undo it in the two old boards.

NOTE: since none of the new boards have device trees yet, this change
looks silly on its own but it will make sense after more boards are
supported.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

(no changes since v1)

 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi      | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts   | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi     | 14 ++++++++------
 3 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index 89e5cd29ec09..11269522da50 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -58,8 +58,22 @@ ap_ts: touchscreen@10 {
 	};
 };
 
+&trackpad {
+	interrupts = <58 IRQ_TYPE_EDGE_FALLING>;
+};
+
 /* PINCTRL - modifications to sc7180-trogdor.dtsi */
 
+&trackpad_int_1v8_odl {
+	pinmux {
+		pins = "gpio58";
+	};
+
+	pinconf {
+		pins = "gpio58";
+	};
+};
+
 &ts_reset_l {
 	pinconf {
 		/* This pin is not connected on -rev0, pull up to park. */
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
index 2cb522d6962e..bd2c783e0f2f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
@@ -68,6 +68,22 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&trackpad {
+	interrupts = <58 IRQ_TYPE_EDGE_FALLING>;
+};
+
+/* PINCTRL - modifications to sc7180-trogdor.dtsi */
+
+&trackpad_int_1v8_odl {
+	pinmux {
+		pins = "gpio58";
+	};
+
+	pinconf {
+		pins = "gpio58";
+	};
+};
+
 /* PINCTRL - board-specific pinctrl */
 
 &tlmm {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 47eed134c733..b471503e415e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -644,14 +644,14 @@ ap_tp_i2c: &i2c7 {
 	status = "okay";
 	clock-frequency = <400000>;
 
-	trackpad@15 {
+	trackpad: trackpad@15 {
 		compatible = "elan,ekth3000";
 		reg = <0x15>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&trackpad_int_1v8_odl>;
+		pinctrl-0 = <&tp_int_odl>;
 
 		interrupt-parent = <&tlmm>;
-		interrupts = <58 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
 
 		vcc-supply = <&pp3300_fp_tp>;
 
@@ -1412,14 +1412,16 @@ pinconf-rx {
 		};
 	};
 
-	trackpad_int_1v8_odl: trackpad-int-1v8-odl {
+	/* Named trackpad_int_1v8_odl on earlier revision schematics */
+	trackpad_int_1v8_odl:
+	tp_int_odl: tp-int-odl {
 		pinmux {
-			pins = "gpio58";
+			pins = "gpio0";
 			function = "gpio";
 		};
 
 		pinconf {
-			pins = "gpio58";
+			pins = "gpio0";
 
 			/* Has external pullup */
 			bias-disable;
-- 
2.30.1.766.gb4fecdf3b7-goog

