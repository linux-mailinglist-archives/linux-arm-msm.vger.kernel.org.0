Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95CFF38B533
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 19:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234168AbhETRbQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 13:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbhETRbQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 13:31:16 -0400
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0AFC061574;
        Thu, 20 May 2021 10:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
        :To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=t8O+8555wJbKDLP6nB+MoViptVBwZRp5uBA8kT1EzNY=; b=Xmqv4xH6dMS2CMdiP1rEOyF05z
        2BS/KLN7q20sGWbaeiDVvk3Qi+Sj89VEoPuAE7RiD/q095BubP3KfZKmGIhlKar3EJyLntfD75Fts
        w0fvy2ACo3MW9BBegla1lZJJMz7QdU5IqqWHR8EWjB3APsxSdvkSI8jSrfTvQnmimiyE/8+IdBb+R
        htQdXLa+Kkv+yAZMUiR70QzRcbVRwHU27BjwOTIHqLOOXAbY+6Jhu2YvWuXEhjlFK9lQWR2Rjr/Yp
        v0o8JKwhatK34Rj68WkTOh4KpKNGa+FPIlikeAuO1FYOm4MN9sCjoq8VsUGxEi6Gv1wTVd4S3x1GF
        M6zndwdg==;
Received: from noodles by the.earth.li with local (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1ljmUa-0003sd-7Z; Thu, 20 May 2021 18:29:52 +0100
Date:   Thu, 20 May 2021 18:29:52 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] ARM: dts: qcom: Add tsens details to ipq806x
Message-ID: <f7ebf47ca9e7e973e696e6b9b4fff3a2ac5da40d.1621531633.git.noodles@earth.li>
References: <cover.1621097174.git.noodles@earth.li>
 <cover.1621531633.git.noodles@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1621531633.git.noodles@earth.li>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 241 ++++++++++++++++++++++++++++
 1 file changed, 241 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 3f666021ff23..9628092217cb 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -46,6 +46,228 @@
 		};
 	};
 
+	thermal-zones {
+		tsens_tz_sensor0 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 0>;
+
+			trips {
+				cpu-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+
+				cpu-hot {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		tsens_tz_sensor1 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 1>;
+
+			trips {
+				cpu-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+
+				cpu-hot {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		tsens_tz_sensor2 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 2>;
+
+			trips {
+				cpu-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+
+				cpu-hot {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		tsens_tz_sensor3 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 3>;
+
+			trips {
+				cpu-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+
+				cpu-hot {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		tsens_tz_sensor4 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 4>;
+
+			trips {
+				cpu-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+
+				cpu-hot {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		tsens_tz_sensor5 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 5>;
+
+			trips {
+				cpu-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+
+				cpu-hot {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		tsens_tz_sensor6 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 6>;
+
+			trips {
+				cpu-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+
+				cpu-hot {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		tsens_tz_sensor7 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 7>;
+
+			trips {
+				cpu-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+
+				cpu-hot {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		tsens_tz_sensor8 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 8>;
+
+			trips {
+				cpu-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+
+				cpu-hot {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		tsens_tz_sensor9 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 9>;
+
+			trips {
+				cpu-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+
+				cpu-hot {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		tsens_tz_sensor10 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 10>;
+
+			trips {
+				cpu-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+
+				cpu-hot {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
+
 	memory {
 		device_type = "memory";
 		reg = <0x0 0x0>;
@@ -503,6 +725,12 @@
 			reg = <0x00700000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			tsens_calib: calib@400 {
+				reg = <0x400 0xb>;
+			};
+			tsens_calib_backup: calib_backup@410 {
+				reg = <0x410 0xb>;
+			};
 		};
 
 		gcc: clock-controller@900000 {
@@ -510,6 +738,19 @@
 			reg = <0x00900000 0x4000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+
+			tsens: thermal-sensor@900000 {
+				compatible = "qcom,ipq8064-tsens";
+
+				nvmem-cells = <&tsens_calib>, <&tsens_calib_backup>;
+				nvmem-cell-names = "calib", "calib_backup";
+				interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "uplow";
+
+				#qcom,sensors = <11>;
+				#thermal-sensor-cells = <1>;
+			};
 		};
 
 		tcsr: syscon@1a400000 {
-- 
2.20.1

