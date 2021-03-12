Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094EF338555
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 06:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231480AbhCLF2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 00:28:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:34764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231461AbhCLF2J (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 00:28:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E950464F9A;
        Fri, 12 Mar 2021 05:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615526889;
        bh=7ki5DrCuHW0iEkwUlxIpVuB9NphBXc+42Zg4Vkr+VGI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tL7LaLCc5qUj6DIN1O7ZB3VTKlQuD7IpP6d0gE6pw12A8r8443dLQf3N/YY4XWNZl
         ypG531/Eib8LMZnDBm3R3/cSecuatw3iM7J5WbjNWqFusXwC45JTf8tCIH6qHx9BCh
         qo/WgvQoSajjRlKXOFr3awxYxqrNRCSJsH4oZqFynsEZ0AkwysGVNxVGS16HnekdkU
         z8PLMUneXa65243z/ZPTI1+dtK08MoJGFrBgQT7W0F9Sq0XRtHj+tg4ixCi+MYY9bA
         0nlj46dTMyjnciwZhSMTLEbfMR2YaXUlRa198CCf3NHNxSXk6T3WeAO2rkSknbva82
         Nqbyz4zs8ep5Q==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] arm64: dts: qcom: pmr735B: Add base dts file
Date:   Fri, 12 Mar 2021 10:57:36 +0530
Message-Id: <20210312052737.3558801-8-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312052737.3558801-1-vkoul@kernel.org>
References: <20210312052737.3558801-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add base DTS file for PMR735B along with GPIO node

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/pmr735b.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735b.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pmr735b.dtsi b/arch/arm64/boot/dts/qcom/pmr735b.dtsi
new file mode 100644
index 000000000000..1144086280f5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmr735b.dtsi
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
+	pmr735b: pmic@5 {
+		compatible = "qcom,pmr735b", "qcom,spmi-pmic";
+		reg = <0x5 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmr735b_gpios: gpio@8800 {
+			compatible = "qcom,pmr735b-gpio";
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

