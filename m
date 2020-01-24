Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97CCE14912D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 23:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387516AbgAXWnc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 17:43:32 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38966 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387491AbgAXWn1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 17:43:27 -0500
Received: by mail-pf1-f195.google.com with SMTP id q10so1799083pfs.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 14:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W9Q9a9KTrafykk7sSvwstO8MsMaSjnD9xam7szWjZDw=;
        b=jgjD9Xxy4nlsaa7hkNYnuT4CcmzwgvwlFgpRuwAPR3fdSGa7W9GTwmxt/bvF513wuw
         Z1C0VQpRrsrKWTSMCQhlr/vinxMWl+ODRosOtXxAcvpaj4/Pt2tvxVpsi1JI8pLt4WjW
         eOgUHMcY/25hhzXZcsr7VEYgR7Z/pVuxz1tis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W9Q9a9KTrafykk7sSvwstO8MsMaSjnD9xam7szWjZDw=;
        b=LzorTe7sOv7Ns64O/sw1OGlT9IeyzK7aSN4MQYQqtTxTYJPiDtMHSjime4PhVJAJn7
         0SyMyebdMByAlJnqGJ1xur1PEaNVpMAZd89a8Ye7SThhuqH9cFWfGhNq2Ibd8eJsu0Ey
         ImJ11WkCVPtdatiR4Ct66VFDuiUWez4Qb3PqgYDgoq7T5BoisimmxLVaAiWV/jRgQmI1
         TbEO3tsMDZjOkjlyJF8+8wg+6bGp+b45AIyKve//N5TqzW5LaX1CoJnQvFk9fHIwviSv
         DaMdzMzGiGwysF3gxOcCGVxxpbmqs6TwFbkhHd5cVVZaZP0rpdob0rXeL8dgQV/ol0Nk
         shEQ==
X-Gm-Message-State: APjAAAUnHDl6s2DtuQ+yekoHu4ZhOJb/7LEqRiIBObdKKeRWnisB9jvq
        iteq5W9XVGfYjKxmwm/z/HvcKQ==
X-Google-Smtp-Source: APXvYqyvlxXWuURQFVjahxnKg8HiiJD1ty6z3PYW5nbOmdrvu0Ae1oXPHdhdKlHv1P1ziyQGUdj1Vg==
X-Received: by 2002:aa7:8006:: with SMTP id j6mr5297976pfi.185.1579905806866;
        Fri, 24 Jan 2020 14:43:26 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id o2sm7690948pjo.26.2020.01.24.14.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 14:43:26 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        mka@chromium.org, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        hoegsberg@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 10/10] arm64: dts: sc7180: Add clock controller nodes
Date:   Fri, 24 Jan 2020 14:42:25 -0800
Message-Id: <20200124144154.v2.10.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200124224225.22547-1-dianders@chromium.org>
References: <20200124224225.22547-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

Add the display, video & graphics clock controller nodes supported on
SC7180.

NOTE: the dispcc needs input clocks from various PHYs that aren't in
the device tree yet.  For now we'll leave these stubbed out with <0>,
which is apparently the magic way to do this.  These clocks aren't
really "optional" and this stubbing out method is apparently the best
way to handle it.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Added includes
- Changed various parent names to match bindings / driver

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 41 ++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 8011c5fe2a31..ee3b4bade66b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -5,7 +5,9 @@
  * Copyright (c) 2019, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dispcc-sc7180.h>
 #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+#include <dt-bindings/clock/qcom,gpucc-sc7180.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
@@ -1039,6 +1041,18 @@ pinmux {
 			};
 		};
 
+		gpucc: clock-controller@5090000 {
+			compatible = "qcom,sc7180-gpucc";
+			reg = <0 0x05090000 0 0x9000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "xo", "gpll0", "gpll0_div";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		qspi: spi@88dc000 {
 			compatible = "qcom,qspi-v1";
 			reg = <0 0x088dc000 0 0x600>;
@@ -1151,6 +1165,33 @@ usb_1_dwc3: dwc3@a600000 {
 			};
 		};
 
+		videocc: clock-controller@ab00000 {
+			compatible = "qcom,sc7180-videocc";
+			reg = <0 0x0ab00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sc7180-dispcc";
+			reg = <0 0x0af00000 0 0x200000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "xo", "gpll0",
+				      "dsi_phy_pll_byte", "dsi_phy_pll_pixel",
+				      "dp_phy_pll_link", "dp_phy_pll_vco_div";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7180-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
-- 
2.25.0.341.g760bfbb309-goog

