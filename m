Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47F9407AD8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Sep 2021 01:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234679AbhIKX3Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 19:29:25 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:56472 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234517AbhIKX3V (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 19:29:21 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 0E01BCB1FB;
        Sat, 11 Sep 2021 23:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1631402887; bh=OcpixR9jeWmLq3TJq/m8MuZTVwFVPOE18f2h11qI8no=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=RmUjf15sPaqGnbtrrMb5OtGyhrH/g4wlKPP7vkBKWy+ukSx1fmmQZEQVWJy880nCB
         gDow5vjv4iHgfszUqCbeKFSmPQ2G6d1bkeypUMQsY5yuWQ6xo/iHSvvtrcWkB7nHlr
         70lVstLqYygd5Bt2GnAWzuePQNRAQBZ9ae3LZcSg=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, bartosz.dudziak@snejp.pl,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] ARM: dts: qcom: Add pm8226 PMIC
Date:   Sun, 12 Sep 2021 01:26:59 +0200
Message-Id: <20210911232707.259615-6-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911232707.259615-1-luca@z3ntu.xyz>
References: <20210911232707.259615-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The pm8226 is used with Qualcomm platforms, like msm8226.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-pm8226.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-pm8226.dtsi

diff --git a/arch/arm/boot/dts/qcom-pm8226.dtsi b/arch/arm/boot/dts/qcom-pm8226.dtsi
new file mode 100644
index 000000000000..dddb5150dfd7
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-pm8226.dtsi
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: BSD-3-Clause
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pm8226_0: pm8226@0 {
+		compatible = "qcom,pm8226", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pwrkey@800 {
+			compatible = "qcom,pm8941-pwrkey";
+			reg = <0x800>;
+			interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+			debounce = <15625>;
+			bias-pull-up;
+		};
+	};
+
+	pm8226_1: pm8226@1 {
+		compatible = "qcom,pm8226", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.33.0

