Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010861D4916
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 11:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgEOJIf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 05:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726922AbgEOJId (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 05:08:33 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF9EC05BD09
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 02:08:32 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l18so2628458wrn.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 02:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dtYTgXYxfIoUCk4loRWbuFk7VuNlmN02rgGRoj7S0Ao=;
        b=PJ9EvlicG79uzhFJwbIU3UATGIRW97yWLRhLUOn6ud/9ECe8YeepuMRUm8KNJjBo8V
         NMlf49pTjcPoPtNR8ULE9IjISzwdMYrENJ3mmF2Zg+l/gVhL+4UbwkhRL6efIk1bNgdp
         CNelvYyJmG62PVcbZsIwqaerZBmgQkW+n1gHOMTDYot6JN8PeGvRMhh57HR0kA0Thpjw
         1kNt736a28aieaDLp8LrNzLdszmw4EhFa3lNmLZiNSPL7B0xG12d5t09FtJtnbRAlhwA
         gewV1hsFRMVJRUamG2DhjwvL3cAAbESswSZKhNEgBbYESIlgs8NOYPUddv8oyNaA/AyD
         mQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dtYTgXYxfIoUCk4loRWbuFk7VuNlmN02rgGRoj7S0Ao=;
        b=oNY4eGkNJRJ43VaSKbvKOh/J+bWB6DpZofDs6sWCoG/rjY8GpGYmWmrJgSYRe7zKvU
         XAGfnCrqMlTfV+65T1YEPpMCObowsiYF1WTMCQFIF9XHLK4EoANJgXWnVQ/f29XV3Ko+
         Rt0lPdTZnPKyFuAEzK6XRIYN+x5KNmFju9BuAdCtrZEjFRnE0getww4khUmHibeApJel
         0spd0+zCQ73QXganT3LpFBBVFLBlCv3Gm3+uMbZiZJnn6JBO1dlc1jkcByT+1g0/aHJM
         gig6XD2IYcVY3oBLHYRUD7Y/1RnDnO7yTbhkXdL1w0dYLYREHPP6AX/TYh1c89qtmsBr
         V92g==
X-Gm-Message-State: AOAM530iwVTIpCOsU26kxX1Bd9I+ojNy1ZjYosV82tVfOLXuftGS6UtE
        JYbXuB8BAmI9Jk4bLcF+HWZ0JA==
X-Google-Smtp-Source: ABdhPJzlPFRglVuF6PYzK/e/6mVvcXfBSVM6Eb646F46YSaOH4YpjKFqonvd0bkXEgMGJHzdh6HVSg==
X-Received: by 2002:a05:6000:1107:: with SMTP id z7mr3029463wrw.93.1589533710197;
        Fri, 15 May 2020 02:08:30 -0700 (PDT)
Received: from localhost.localdomain ([37.120.32.219])
        by smtp.gmail.com with ESMTPSA id z132sm2834240wmc.29.2020.05.15.02.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 02:08:29 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2] arm64: dts: qcom: apq8016-sbc-d3: Add Qualcomm APQ8016 SBC + D3Camera mezzanine
Date:   Fri, 15 May 2020 11:08:20 +0200
Message-Id: <20200515090820.1744353-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device treee support for the Qualcomm APQ8016 SBC, otherwise known as
the Dragonboard 410c with the D3Camera mezzanine expansion board.

The D3Camera mezzanine ships in a kit with a OmniVision 5640 sensor module,
which is what this DT targets.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v1:
 - Vinod: Changed license to GPL+BSD
 - Vinod: Changed copyright year to 2020
 - Nico: Changed name of mezzanine to d3camera

 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../boot/dts/qcom/apq8016-sbc-d3camera.dts    | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-d3camera.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index cc103f7020fd..3f95b522694e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-d3camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM) += apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-d3camera.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc-d3camera.dts
new file mode 100644
index 000000000000..752e5ec47499
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-d3camera.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "apq8016-sbc.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. APQ 8016 SBC w/ D3Camera Mezzanine";
+	compatible = "qcom,apq8016-sbc", "qcom,apq8016", "qcom,sbc";
+};
+
+&cci_i2c0 {
+	/delete-node/ camera_rear@3b;
+
+	camera_rear@76 {
+		compatible = "ovti,ov5640";
+		reg = <0x76>;
+
+		enable-gpios = <&msmgpio 34 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&camera_rear_default>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		clock-names = "xclk";
+		clock-frequency = <23880000>;
+
+		vdddo-supply = <&camera_vdddo_1v8>;
+		vdda-supply = <&camera_vdda_2v8>;
+		vddd-supply = <&camera_vddd_1v5>;
+
+		status = "ok";
+
+		port {
+			ov5640_ep: endpoint {
+				clock-lanes = <1>;
+				data-lanes = <0 2>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+};
-- 
2.25.1

