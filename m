Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E9D3C5D71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 15:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbhGLNmV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 09:42:21 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:27210 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbhGLNmU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 09:42:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626097167;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=uj4361IdKb7OQ0W1whJiP9eXyjnBDXK83GDOvs7XQjM=;
    b=iikrtoZGatLsULQg8YYCrutITftCoH+s8+wUmDjdQjti0XLV20KgAT9Sy59XBz5ygx
    MI1eSxV7uEsllZLadPqrT2TiFDA3firuzuleeNo21dGhqhwg6BFAwC69Zk+Z74AyxCtT
    OmO6ENQq9I6xUduMTEddSzoAEm1kFBam3jKM6h/TzHXboRa4IqzW8AYHGrxZyQKT888d
    qUyVz9N1Q2C5leZ5r4l1PHbvVcup0Cb/5FWjeWDVfHufB3fiZ+8UIQqBEB/nsU7urr3n
    q3xHasJ8wN5wfSSERlMFQfKCRw4vlfphuaM7HnbKgxq/jYdpFpU9YSqc/b6gpsUq+5Uz
    VftA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB426L3OY="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id Y070ccx6CDdR9tY
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 12 Jul 2021 15:39:27 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/4] arm64: dts: qcom: msm8916-wingtech-wt88047: Add notification LED
Date:   Mon, 12 Jul 2021 15:37:34 +0200
Message-Id: <20210712133735.318250-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712133735.318250-1-stephan@gerhold.net>
References: <20210712133735.318250-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Xiaomi Redmi 2 has a notification LED connected to an Awinic
AW2013 controller, add it to the device tree.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../dts/qcom/msm8916-wingtech-wt88047.dts     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
index a4d8d6ff2289..9d9e85e75411 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
@@ -6,6 +6,7 @@
 #include "msm8916-pm8916.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Xiaomi Redmi 2 (Wingtech WT88047)";
@@ -66,6 +67,40 @@ touchscreen@38 {
 	};
 };
 
+&blsp_i2c6 {
+	status = "okay";
+
+	led-controller@45 {
+		compatible = "awinic,aw2013";
+		reg = <0x45>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vcc-supply = <&pm8916_l16>;
+
+		led@0 {
+			reg = <0>;
+			led-max-microamp = <15000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@1 {
+			reg = <1>;
+			led-max-microamp = <15000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@2 {
+			reg = <2>;
+			led-max-microamp = <15000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
 &blsp1_uart2 {
 	status = "okay";
 };
-- 
2.32.0

