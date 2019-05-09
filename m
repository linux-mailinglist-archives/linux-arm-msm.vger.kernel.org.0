Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE2018385
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 04:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbfEICEQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 22:04:16 -0400
Received: from onstation.org ([52.200.56.107]:56830 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726640AbfEICEL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 22:04:11 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id CFFFD45026;
        Thu,  9 May 2019 02:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1557367450;
        bh=tN+WlNENxq3sFnnBtPcG6qkIFwJuLGxheJCgQUHqMEg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NUFXe+4N//SEeFq/vLgmUefhNFmb0b/FsteUCBRLkqbK4EkADQLZNNhD+YLAvcSRd
         5ETrtmHp8rhOvTWc2xEKZot9CyMgdl9iflZcda5XrUJ2A4uNq/Dqm4FlsSB9LcyYS9
         Jy8ax9lPqCMm42ZZe3buBNUbUDZyQXgSfCL5KA9I=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        jonathan@marek.ca, robh@kernel.org
Subject: [PATCH v2 5/6] ARM: dts: qcom: msm8974-hammerhead: add support for backlight
Date:   Wed,  8 May 2019 22:03:51 -0400
Message-Id: <20190509020352.14282-6-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509020352.14282-1-masneyb@onstation.org>
References: <20190509020352.14282-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add necessary device tree nodes for the main LCD backlight.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
This requires this series that should be merged soon:
https://lore.kernel.org/lkml/20190424092505.6578-1-masneyb@onstation.org/
The device tree bindings have been reviewed. The driver changes have
received 3 {Reviewed,Acked}-bys.

Changes since v1:
- None

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index b3b04736a159..b7cf4b1019e9 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -289,6 +289,16 @@
 			};
 		};
 
+		i2c11_pins: i2c11 {
+			mux {
+				pins = "gpio83", "gpio84";
+				function = "blsp_i2c11";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+
 		i2c12_pins: i2c12 {
 			mux {
 				pins = "gpio87", "gpio88";
@@ -369,6 +379,30 @@
 		};
 	};
 
+	i2c@f9967000 {
+		status = "ok";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c11_pins>;
+		clock-frequency = <355000>;
+		qcom,src-freq = <50000000>;
+
+		led-controller@38 {
+			compatible = "ti,lm3630a";
+			status = "ok";
+			reg = <0x38>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				led-sources = <0 1>;
+				label = "lcd-backlight";
+				default-brightness = <200>;
+			};
+		};
+	};
+
 	i2c@f9968000 {
 		status = "ok";
 		pinctrl-names = "default";
-- 
2.20.1

