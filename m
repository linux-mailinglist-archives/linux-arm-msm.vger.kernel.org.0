Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95128679F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2019 13:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfGML0t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Jul 2019 07:26:49 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:37368 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726474AbfGML0t (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Jul 2019 07:26:49 -0400
Received: from g550jk.localnet (80-123-55-184.adsl.highway.telekom.at [80.123.55.184])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 40FDFC00ED;
        Sat, 13 Jul 2019 11:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1563017206; bh=bSfORFWKc+/pN+2RMX10ijrg8NjEbUNxysCDmNwbQzA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=GuU+64IReyZBxYuFgXPVWS28qbjidsqSYqjpnV+hey5WtfVvEhhU6p01hOFBwp2zO
         2roU3HuLCWnOxxX7G3mH64UiBtSFrf0UBORneqZUrWgJoDnCH6VbjXUcHryBo3YY9t
         5VVpYgkdFEq2k0WEoXGdtQU3vuC04G50MYNChGLw=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Brian Masney <masneyb@onstation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        ~martijnbraam/pmos-upstream@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: msm8974-FP2: add reboot-mode node
Date:   Sat, 13 Jul 2019 13:26:45 +0200
Message-ID: <3733253.hEy9q5iLy3@g550jk>
In-Reply-To: <20190622014302.GA20947@onstation.org>
References: <20190620225824.2845-1-luca@z3ntu.xyz> <4607058.UzJteFJyig@g550jk> <20190622014302.GA20947@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Brian,
how about something like that (formatting is surely broken because I'm not 
sending this with git-send-email^^)?

I'd says this should be work fine with all devices as all modes are defined in 
the device-specific dts but the reg and offset values are in the board dts. 
Should I also add a status = "disabled" to the reboot-mode node in the board 
dts?

diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/
dts/qcom-msm8974-fairphone-fp2.dts
index 643c57f84818..ff4a3e0aa746 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
@@ -338,6 +338,16 @@
 			};
 		};
 	};
+
+	imem@fe805000 {
+		status = "okay";
+
+		reboot-mode {
+			mode-normal	= <0x77665501>;
+			mode-bootloader	= <0x77665500>;
+			mode-recovery	= <0x77665502>;
+		};
+	};
 };
 
 &spmi_bus {
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-
msm8974.dtsi
index 45b5c8ef0374..1927430bded7 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1085,6 +1085,17 @@
 				};
 			};
 		};
+
+		imem@fe805000 {
+			status = "disabled";
+			compatible = "syscon", "simple-mfd";
+			reg = <0xfe805000 0x1000>;
+
+			reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x65c>;
+			};
+		};
 	};
 
 	smd {


Regards,
Luca


