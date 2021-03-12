Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F78333853F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 06:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhCLF2F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 00:28:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:34612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231344AbhCLF1x (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 00:27:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D875F64F8E;
        Fri, 12 Mar 2021 05:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615526873;
        bh=QVRSNxTDuISQ+jlj4UuDcJFhqaYuRAmgRTwx+vrHnb8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DPfLV1aD1SFKu6JSQ4KEXaFZyqRARsJLnJBE7Y/iscBIgLW18lixrqMrRsf/3yf0b
         j+t3qsC/QoNKnWJs3n7NxXKzCLt9IuYjTY4tA89n49jgHZ39UMJ4+kxdhCQenhczuE
         HwMqAxHyCouLLUeIR1zMO474v74sMRzYb4mIlLY7bc94zQqR1YYSpn1DRhVTBAWknC
         HGi5YvK+/hIIMcGhlCz3bu7IgwEVG7xrjWFaHyjZ4p8jSa32sbLa8dItn6Dim+TlEI
         fFS2TlVtspby4xvJ2Bcyz/qpiT5iT14eMtF/hhrD7pmOgF9lOQU59JRsslF8JmhUMi
         n1CIS+74/Kbdw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] arm64: dts: qcom: pmk8350: Add base dts file
Date:   Fri, 12 Mar 2021 10:57:31 +0530
Message-Id: <20210312052737.3558801-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312052737.3558801-1-vkoul@kernel.org>
References: <20210312052737.3558801-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add base DTS file for PMK8350 along with GPIO node

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/pmk8350.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
new file mode 100644
index 000000000000..1530b8ff270f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
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
+	pmk8350: pmic@0 {
+		compatible = "qcom,pmk8350", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmk8350_gpios: gpio@b000 {
+			compatible = "qcom,pmk8350-gpio";
+			reg = <0xb000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.26.2

