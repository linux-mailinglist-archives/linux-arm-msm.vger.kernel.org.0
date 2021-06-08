Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 536F139FAA8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 17:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhFHP3g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 11:29:36 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:36373 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231192AbhFHP3g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 11:29:36 -0400
Received: from localhost.localdomain (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id E350A1FAFE;
        Tue,  8 Jun 2021 17:27:40 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] arm64: dts: qcom: Add PMI8996 DTSI file
Date:   Tue,  8 Jun 2021 17:27:34 +0200
Message-Id: <20210608152737.154218-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PMI8996 is *almost* the same hardware as PMI8994, say for some annoyances:

- Boards equipped with PMI8996 now have to include pmic-id (which wasn't the
case before)

- Different qpnp-ibb-discharge-resistor value (will be addressed after LABIBB
is introduced)

- Different inhibit-derating-ua value (will be addressed after BCL is
introduced)

- Different ramp_up_step value (will be addressed after [if?] QPNP Flash LED
is introduced)

This DTSI is supposed to be included >>ON TOP OF<< pmi8994.dtsi, like this:

-- msm8996-nice-device.dts --
\#include "pmi8994.dtsi"
\#include "pmi8996.dtsi"

or more likely like this:

-- msm8996-some-phone.dts --
\#include "msm8996.dtsi"
...
\#include "pmi8994.dtsi"

-- msm8996-pmi8996-some-phone.dts --
\#include "msm8996-some-phone.dts"
\#include "pmi8996.dtsi"

So that we only have to keep 2 DTs for devices that were shipped with both
ones, instead of what would be three (device base + pmi8994 + pmi8996)

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
changes since v2:
- Add a more explanatory commit message

 arch/arm64/boot/dts/qcom/pmi8996.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmi8996.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pmi8996.dtsi b/arch/arm64/boot/dts/qcom/pmi8996.dtsi
new file mode 100644
index 000000000000..31b47209e261
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmi8996.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+ /*
+  * PMI8996 is a slight modification of PMI8994 with
+  * some notable changes, like being the first PMIC
+  * whose the bootloader has to check to continue booting
+  * and a change to a LABIBB parameter.
+  */
+
+/ {
+	qcom,pmic-id = <0x20009 0x10013 0 0>;
+};
-- 
2.31.1

