Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 537C62CC88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2019 18:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbfE1Qsh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 12:48:37 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35589 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbfE1Qsh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 12:48:37 -0400
Received: by mail-pg1-f193.google.com with SMTP id t1so11339035pgc.2;
        Tue, 28 May 2019 09:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VyKAAyyKF/StTl6Cc7Bhi0hP4Fbpr1Wnyb227vQxupA=;
        b=BDz6LEiPv3DbWPxz2q4nGxrvuf/nyreOKnjeVboH01uYK4LNfyhggoZp6K2ruiObxv
         YAuAXBsTfVJ0boZKnKIkC6UU6d+mWpLDwme//1KEmGzD9lBi4erPBlC0RLWowqzMaBDQ
         bBh1w+idklGCiKs3Nshy8rmsEEciIFwavafIlX+ImMRbJUusmGGA2j3ShrQ2Yyv8vbBO
         zSEs8ZE61BbEAHHkxNOMxS1iZ5J2QHK/XBmmBJGUF9yPqiCrLEuG7rDaLS9VM1AXYQqD
         wBUEWG4L2XxIQHIQCgkt2JlO3jZke23eqatR1WPnLhfwekflViSOgopPAinxrdo8rBQs
         FCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VyKAAyyKF/StTl6Cc7Bhi0hP4Fbpr1Wnyb227vQxupA=;
        b=MH9RdEIX7phwnSlJlc39I9+buo2YFLuM/vwl4aEaN6uJ/EZmc8mikIFSLPHNFPMDl4
         1TAUH7uo8zyRLS3v3Q4K7FJ3TmEvZCGzDDXK//vbgofo7QJEP2BSQ5W1uVMVrqNRwHbd
         r1vgWPFTypzZ4y3C5E6zEKv89RqBdEVRvkfKhFdgP0GZ2OL4YeX1A9OXikrXRNQJ5JqM
         NeGkt17lcj4qQmgKDM3OZ0x6V90ujsdkh/lCNC+riDcidOa5lGfu5ouXxCgbkWWaX1PP
         balyg2g3+G5CZe+0al/REd+v0YelmACHVvTX4BwkDigiXrNkt+905Ub5bmdB36Pa3vBs
         2UzQ==
X-Gm-Message-State: APjAAAVl6Bg+NgVifN9/ZoIPEJIht9+OGkVEdpgI5jhIMrova7feHbwQ
        GWiX8gK0zRrtOMimycOTRxI=
X-Google-Smtp-Source: APXvYqyHME0FjSisF3IqfNkzb5R68J3a7YnPvgHLro3k6kdMV1VTMJnenNrsas0+2U+az3DIIcmv+A==
X-Received: by 2002:a63:2248:: with SMTP id t8mr90644297pgm.358.1559062116816;
        Tue, 28 May 2019 09:48:36 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a30sm8916533pje.4.2019.05.28.09.48.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:48:36 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, marc.w.gonzalez@free.fr,
        jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: msm8998: Add gpucc node
Date:   Tue, 28 May 2019 09:48:34 -0700
Message-Id: <20190528164834.38691-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528164616.38517-1-jeffrey.l.hugo@gmail.com>
References: <20190528164616.38517-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MSM8998 GPU Clock Controller DT node.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 574be78a936e..cf00bfeec6b3 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+#include <dt-bindings/clock/qcom,gpucc-msm8998.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
 
@@ -763,6 +764,20 @@
 			reg = <0x1f40000 0x20000>;
 		};
 
+		gpucc: clock-controller@5065000 {
+			compatible = "qcom,gpucc-msm8998";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0x05065000 0x9000>;
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GPLL0_OUT_MAIN>;
+			clock-names = "xo",
+				      "gpll0";
+		};
+
+
 		apcs_glb: mailbox@9820000 {
 			compatible = "qcom,msm8998-apcs-hmss-global";
 			reg = <0x17911000 0x1000>;
-- 
2.17.1

