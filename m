Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BECA4405233
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 14:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352812AbhIIMl4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 08:41:56 -0400
Received: from relay04.th.seeweb.it ([5.144.164.165]:41273 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354812AbhIIMjk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 08:39:40 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 52AAD1FA03;
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
Subject: [PATCH v2 2/4] arm64: dts: qcom: msm8998-fxtec-pro1: Add physical keyboard leds
Date:   Thu,  9 Sep 2021 14:38:21 +0200
Message-Id: <20210909123823.368199-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210909123823.368199-1-angelogioacchino.delregno@somainline.org>
References: <20210909123823.368199-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add configuration for the physical keyboard LEDs, including the
caps lock indicator and keyboard backlight.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../boot/dts/qcom/msm8998-fxtec-pro1.dts      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
index dc566567f42f..d44250f09965 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
@@ -78,6 +78,28 @@ camera-focus {
 		};
 	};
 
+	keyboard-leds {
+		compatible = "gpio-leds";
+
+		backlight {
+			color = <LED_COLOR_ID_WHITE>;
+			default-state = "off";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+			label = "white:kbd_backlight";
+			retain-state-suspended;
+		};
+
+		caps-lock {
+			color = <LED_COLOR_ID_YELLOW>;
+			default-state = "off";
+			function = LED_FUNCTION_CAPSLOCK;
+			gpios = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+			label = "yellow:capslock";
+			linux,default-trigger = "kbd-capslock";
+		};
+	};
+
 	reserved-memory {
 		cont_splash_mem: memory@9d400000 {
 			reg = <0x0 0x9d400000 0x0 0x2000000>;
-- 
2.32.0

