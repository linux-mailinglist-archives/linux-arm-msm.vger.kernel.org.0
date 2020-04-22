Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D481B42D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 13:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgDVLKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 07:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726285AbgDVLKW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 07:10:22 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E71C03C1AA
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 04:10:21 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g13so1879083wrb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7f32msqOiQc0JpLw4MsEw0QrRZ2lpHCE6FKLkalbvhU=;
        b=oDW7AMfFyPLs3g/zpMq2viBMk8aiY9eT4ASTGtRNfZ/GNURtr5HFv+DKOuGmhURwNx
         GR6EDrdL3h4lx7VJpQZEeHiweD8WchR/17GnC0HM9nrLRMwVFA6HY4kuQq53cqoiAL53
         mDkjEPJkQq9P+x04dN36TjDnEUEy9xVaKEnL/SXcddRNRpjwunVNbITSolUIRvdtSCRI
         judJfd45dgbj2MidVMBv4ktQjbWqPLZ7screXp/fetAlVT9bISvXZobEegwbEuoPPBc3
         gX+XheeZyB8YLvL3CragfDHRWXmTMDxQPjw3nxikD76TH1Z+emCQ/wUtg2g6n9lplUXD
         BcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7f32msqOiQc0JpLw4MsEw0QrRZ2lpHCE6FKLkalbvhU=;
        b=Rjzt5SJweWfPmffFajvJNbjhak2YjpWf3z3qMVcp4+QSC2We5uWMcLvKSgeRcGxqwt
         PtLDDO2qKxXdcUqYx9kqgwyjseORd5XySC+i8XdaM52pHoDMT80foUofkRGCwsIWws/C
         hntK1tws3kAXynFPNYYn32LjCuXOCbWEY3D1JJX8yluhzJjcyTnr8RyZGDYrG2x/kpXr
         RJc4O85xMDUHGJEQNFYIBEope+/jX1BLirhmpXDaMl8xlGkHPE213AmU/CbKS1/rhFd5
         6NyJAif5S7L8c1f/MrlsqNi370pVbZdHKQOuFdzJdUd8i1LLytuM4Kj9h4MCxl0YE9WO
         4rEA==
X-Gm-Message-State: AGi0Pub2kRwZkpiepWQwo0Q8rQmN9VGSagB9Jm/2ARLZQOJb+B5FriEa
        TAXddZBw1o5dcFpi7RNl9Mh/Hg==
X-Google-Smtp-Source: APiQypINbD+SwSQX239iVL4ARcQzUpE85tcDSAX0g1f/DkT80BUmiUIIWTpHdSuEhZG7PDqB5JWNiA==
X-Received: by 2002:a5d:470a:: with SMTP id y10mr28586916wrq.63.1587553820230;
        Wed, 22 Apr 2020 04:10:20 -0700 (PDT)
Received: from localhost.localdomain ([37.120.50.78])
        by smtp.gmail.com with ESMTPSA id h188sm7993906wme.8.2020.04.22.04.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 04:10:19 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1] arm64: dts: qcom: apq8016-sbc-d3: Add Qualcomm APQ8016 SBC + D3 mezzanine
Date:   Wed, 22 Apr 2020 13:10:14 +0200
Message-Id: <20200422111014.616233-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device treee support for the Qualcomm APQ8016 SBC, otherwise known as
the Dragonboard 410c with the D3 mezzanine expansion board.

The D3 mezzanine ships in a kit with a OmniVision 5640 sensor module,
which is what this DT targets.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile           |  1 +
 arch/arm64/boot/dts/qcom/apq8016-sbc-d3.dts | 45 +++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-d3.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index cc103f7020fd..025362471929 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-d3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM) += apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-d3.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc-d3.dts
new file mode 100644
index 000000000000..1b85adeeada1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-d3.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2015, The Linux Foundation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "apq8016-sbc.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. APQ 8016 SBC w/ D3 Mezzanine";
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

