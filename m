Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4303E33853E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 06:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbhCLF2H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 00:28:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:34624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231346AbhCLF15 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 00:27:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2005C64F84;
        Fri, 12 Mar 2021 05:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615526876;
        bh=13OEpZzxTT8XQQP4bjEJUkp7rb+lCYdcsrFPw+V1v8M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i787g7a0ofxxzwrly2qX6jCFVM/t8BsXnqWwNs+7N9d4jfypsnQrXXnvrTEPHdvVw
         r6B0LdKmpYPEa3EkPCbTy9JnNNX15g4NL/zNtKH5aELdk6bXivMFFO9YwKpgt1zXC1
         inOoz6QkrttVhF9mSSpXZM9rsySOg3bO3VNNMQiNVnt+WtF6kTkpM3RuLYCcRDO2ju
         /uLA1mJz2keF/ltIBJTiVRSg8FJgN0llmeA/9joXo844xqar6mf/STLhn3N2QM2XaT
         Rn6MgJnTOHXr4FEh+q1nyLxsVhmDD9FObyTa4wKEUGMhgPpNv0op3bSt4wge/KgSxM
         S185MDzQeqDHA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] arm64: dts: qcom: pm8350: Add base dts file
Date:   Fri, 12 Mar 2021 10:57:32 +0530
Message-Id: <20210312052737.3558801-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312052737.3558801-1-vkoul@kernel.org>
References: <20210312052737.3558801-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add base DTS file for PM8350 along with GPIO node

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/pm8350.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8350.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8350.dtsi b/arch/arm64/boot/dts/qcom/pm8350.dtsi
new file mode 100644
index 000000000000..308f9ca7c744
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8350.dtsi
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
+	pm8350: pmic@1 {
+		compatible = "qcom,pm8350", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8350_gpios: gpio@8800 {
+			compatible = "qcom,pm8350-gpio";
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

