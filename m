Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDA730BF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2019 11:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfEaJqd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 05:46:33 -0400
Received: from onstation.org ([52.200.56.107]:51364 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726998AbfEaJqd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 05:46:33 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 96F1E45087;
        Fri, 31 May 2019 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1559295992;
        bh=P7el3Xz8wlBT8PxKKUD6xEjlNmXFaxsNrW/042rvrXc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JKVOa9SAa7kA2Lli3+GkWmtyF8MNZPxXaea7LmxpPJnge8YifcrGodkFsm8APowey
         Gf7GreekdN/kCh7UNbAXSlfs0p6N7JyTLs1oif1tKegAr9Pe6YhkQK1Nb+gXSyWLqZ
         B/wxNfa1E+rVqfIeHzxq7wcMu7mq2yC05inAeVIA=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        jonathan@marek.ca, robh@kernel.org, jeffrey.l.hugo@gmail.com
Subject: [PATCH v3 6/6] ARM: dts: qcom: msm8974-hammerhead: add support for display
Date:   Fri, 31 May 2019 05:46:19 -0400
Message-Id: <20190531094619.31704-7-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531094619.31704-1-masneyb@onstation.org>
References: <20190531094619.31704-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add initial support for the display found on the LG Nexus 5 (hammerhead)
phone. This is based on work from Jonathan Marek.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 51889d66b55a..4776f01f492c 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -332,6 +332,16 @@
 				function = "gpio";
 			};
 		};
+
+		panel_pin: panel {
+			te {
+				pins = "gpio12";
+				function = "mdp_vsync";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
 	};
 
 	vibrator@fd8c3450 {
@@ -531,6 +541,54 @@
 			};
 		};
 	};
+
+	mdss@fd900000 {
+		status = "ok";
+
+		mdp@fd900000 {
+			status = "ok";
+		};
+
+		dsi@fd922800 {
+			status = "ok";
+
+			vdda-supply = <&pm8941_l2>;
+			vdd-supply = <&pm8941_lvs3>;
+			vddio-supply = <&pm8941_l12>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports {
+				port@1 {
+					endpoint {
+						remote-endpoint = <&panel_in>;
+						data-lanes = <0 1 2 3>;
+					};
+				};
+			};
+
+			panel: panel@0 {
+				reg = <0>;
+				compatible = "lg,acx467akm-7";
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&panel_pin>;
+
+				port {
+					panel_in: endpoint {
+						remote-endpoint = <&dsi0_out>;
+					};
+				};
+			};
+		};
+
+		dsi-phy@fd922a00 {
+			status = "ok";
+
+			vddio-supply = <&pm8941_l12>;
+		};
+	};
 };
 
 &spmi_bus {
-- 
2.20.1

