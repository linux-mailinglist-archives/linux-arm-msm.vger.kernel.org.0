Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 836844058D3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 16:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346632AbhIIOSg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 10:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244359AbhIIOS0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 10:18:26 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1788AC0281DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Sep 2021 05:38:26 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 024BB1FABE;
        Thu,  9 Sep 2021 14:38:24 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 4/4] arm64: dts: qcom: msm8998-fxtec-pro1: Add tlmm keyboard keys
Date:   Thu,  9 Sep 2021 14:38:23 +0200
Message-Id: <20210909123823.368199-4-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210909123823.368199-1-angelogioacchino.delregno@somainline.org>
References: <20210909123823.368199-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This device has a physical matrix keyboard, connected to a GPIO
expander, for which there's still no support yet.
Though, some of the keys are connected to the MSM8998 GPIOs and not
as a matrix, so these can be added.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../boot/dts/qcom/msm8998-fxtec-pro1.dts      | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
index deabb00758e3..49705fe655ee 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
@@ -43,6 +43,62 @@ hall-sensor1 {
 		};
 	};
 
+	gpio-kb-extra-keys {
+		compatible = "gpio-keys";
+		input-name = "extra-kb-keys";
+		label = "Keyboard extra keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_kb_pins_extra>;
+
+		home {
+			label = "Home";
+			gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+
+		super-l {
+			label = "Super Left";
+			gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_FN>;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+
+		super-r {
+			label = "Super Right";
+			gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_FN>;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+
+		shift {
+			label = "Shift";
+			gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RIGHTSHIFT>;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+
+		ctrl {
+			label = "Ctrl";
+			gpios = <&tlmm 128 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_LEFTCTRL>;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+
+		alt {
+			label = "Alt";
+			gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_LEFTALT>;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		input-name = "side-buttons";
@@ -205,6 +261,14 @@ mdp_vsync_n: mdp-vsync-n {
 		drive-strength = <2>;
 	};
 
+	gpio_kb_pins_extra: gpio-kb-pins-extra {
+		pins = "gpio21", "gpio32", "gpio33", "gpio114",
+		       "gpio128", "gpio129";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	ts_vio_default: ts-vio-def {
 		pins = "gpio81";
 		function = "gpio";
-- 
2.32.0

