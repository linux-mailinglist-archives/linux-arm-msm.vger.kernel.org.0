Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C98A338547
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 06:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbhCLF2I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 00:28:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:34650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231368AbhCLF2D (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 00:28:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93BD064FA0;
        Fri, 12 Mar 2021 05:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615526883;
        bh=WdQ23F7j1uEXwmLdu1okUvpofovg5Shaw9+zn+i4cio=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LZ7DXIAoaIOVB+3AtKGTsbIu7ENEKRbBcn9GhKHTdyQzDbsCUr6H6lKRf8DjdaUXL
         icKo8al6I1e1xzBGC/7AwQcAFxcDuPfhybBS/FWEgVQLuPTJ2dCD9USTwXndFevN3L
         ut5GZ4cedRhywNIvUNCYPClLSQ/l7ln6YLiha42k194x31W1yNOpbggNNlVEeA+9lg
         dfACmL+QLa/etwKaiQXDAz8NE+zGKHS5EyWBfENtnUkKkVJiU9cftFBSNfNBhBAZAJ
         aI55KEtxT7b4jN9JsWOy0RZljcxvehNUlaJHV8dLZ+DEoymv0w3rWrz7+XNik+WCs8
         WeyJv9Naxq9Ng==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] arm64: dts: qcom: pm8350c: Add base dts file
Date:   Fri, 12 Mar 2021 10:57:34 +0530
Message-Id: <20210312052737.3558801-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312052737.3558801-1-vkoul@kernel.org>
References: <20210312052737.3558801-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add base DTS file for PM8350C along with GPIO node

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8350c.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
new file mode 100644
index 000000000000..2b9b75ecec60
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
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
+	pm8350c: pmic@2 {
+		compatible = "qcom,pm8350c", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8350c_gpios: gpio@8800 {
+			compatible = "qcom,pm8350c-gpio";
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

