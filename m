Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07212338550
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 06:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbhCLF2h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 00:28:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:34746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231407AbhCLF2G (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 00:28:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C786764F8E;
        Fri, 12 Mar 2021 05:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615526886;
        bh=ccS6pLnpZRn7eszZUjU4QVyabgxKQTTl2OZooLyk9XY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y6bQdee3ICaRN5zOF8NJaqi6ZTmZOZX6J5CaX+kckQEZxQ4JOj76kuDjoF5I0qTJa
         jS543OpBHJCPp7iuyteEmKtCJBGk2zkxElxsvW1nXIArLU/ZOZe1N8/Vdc9GqLVP8L
         TKuEu5u6cYjHO61gMMs4E3M38Fetfd2Ie+bw8s4spTczbaSDAiosITgd10C5gpv96n
         tIEhgAB1ABbqPhIFo8Ibg52oZA7TzTHo8No+/r7tBTSxjbwMflUAeeO0Qbsg+7HAPj
         IsRjAEV1TzDamIh/dQShtekO7cBSv8QdUwuOjdvUDfojWSw4pS6spNokmS2Yod9z3q
         UH/ZQfGHtzSDw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] arm64: dts: qcom: pmr735a: Add base dts file
Date:   Fri, 12 Mar 2021 10:57:35 +0530
Message-Id: <20210312052737.3558801-7-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312052737.3558801-1-vkoul@kernel.org>
References: <20210312052737.3558801-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add base DTS file for PMR735A along with GPIO node

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/pmr735a.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735a.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pmr735a.dtsi b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
new file mode 100644
index 000000000000..1c675af13cbf
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
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
+	pmr735a: pmic@4 {
+		compatible = "qcom,pmr735a", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmr735a_gpios: gpio@8800 {
+			compatible = "qcom,pmr735a-gpio";
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

