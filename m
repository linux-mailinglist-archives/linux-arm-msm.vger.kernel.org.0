Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6717A4DD9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 01:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbfFTXJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 19:09:25 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:42326 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbfFTXJZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 19:09:25 -0400
X-Greylist: delayed 587 seconds by postgrey-1.27 at vger.kernel.org; Thu, 20 Jun 2019 19:09:24 EDT
Received: from localhost.localdomain (80-110-121-20.cgn.dynamic.surfer.at [80.110.121.20])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 66645C2A9C;
        Thu, 20 Jun 2019 22:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1561071575; bh=FTGmDnKKypvtndUTsH4/yLMEt9oBVapsz5XGfmtXkW8=;
        h=From:To:Cc:Subject:Date;
        b=NXwWPSsFM6BHazsoRnGmTpS4FSl0Jj8sJIkZRKLbACrzEZxIOj8rEywV6txjwcpWt
         OpZ66lqWMS65jcJZgjHGN1rDHvWrzPMqcleTxLfhjtUMSYL21QTPv63wRxuurvZSIT
         j/Fap4/+l/w/BCLgTRfxs2z95cnbYkC+ffC7FoPI=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~martijnbraam/pmos-upstream@lists.sr.ht,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: msm8974-FP2: add reboot-mode node
Date:   Fri, 21 Jun 2019 00:58:24 +0200
Message-Id: <20190620225824.2845-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enables userspace to signal the bootloader to go into the
bootloader or recovery mode.

The magic values can be found in both the downstream kernel and the LK
kernel (bootloader).

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Sidenote: Why are there no userspace tools to be found that support
this? Anyways, we have one now in postmarketOS :)

 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
index 643c57f84818..f86736a6d77e 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
@@ -338,6 +338,20 @@
 			};
 		};
 	};
+
+	imem@fe805000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0xfe805000 0x1000>;
+
+		reboot-mode {
+			compatible = "syscon-reboot-mode";
+			offset = <0x65c>;
+
+			mode-normal	= <0x77665501>;
+			mode-bootloader	= <0x77665500>;
+			mode-recovery	= <0x77665502>;
+		};
+	};
 };
 
 &spmi_bus {
-- 
2.22.0

