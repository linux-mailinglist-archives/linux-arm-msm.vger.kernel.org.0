Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1241E338543
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 06:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbhCLF2H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 00:28:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:34636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231348AbhCLF2A (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 00:28:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C8A964FA0;
        Fri, 12 Mar 2021 05:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615526879;
        bh=ENTrra+4XMPpj+qT25vVnN3pyfzFezuSZCSAeAsaBzc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Uui1lHha8zGiX/GjcoDd0sW4lOSMGBXd+NpgTo/teYOSO1hxwpi+9raGLyNxFLegv
         bvAZ1ndC/UJW8mC+uw/TQawhOnCZrlii+AEfMV6jTWZf+2R93S/cSA4EZpsJRFSThh
         FZnvPBID6rQlV70skyx2Y5dN1luPsc6b0MBAiDHx3cNFeLtGY7gdjyyl9S0GpM/8f8
         mzaGhVaCJ5yfSdx7+o3vPgd/imrqAZVOqnGmD/R89o/tiygBMp+BQQJzvnEKIhpPTa
         V0ccIx8PETOrVv1w8E/o3IQE535lW15+DwcbsnZkH1BivglTTSU0RmWpapCNqOYoxU
         CdbNAZb7TlWJA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] arm64: dts: qcom: pm8350b: Add base dts file
Date:   Fri, 12 Mar 2021 10:57:33 +0530
Message-Id: <20210312052737.3558801-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312052737.3558801-1-vkoul@kernel.org>
References: <20210312052737.3558801-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add base DTS file for PM8350B along with GPIO node

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/pm8350b.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8350b.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8350b.dtsi b/arch/arm64/boot/dts/qcom/pm8350b.dtsi
new file mode 100644
index 000000000000..b23bb1d49a4d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8350b.dtsi
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Linaro Limited
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pm8350b: pmic@3 {
+		compatible = "qcom,pm8350b", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8350b_gpios: gpio@8800 {
+			compatible = "qcom,pm8350b-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.26.2

