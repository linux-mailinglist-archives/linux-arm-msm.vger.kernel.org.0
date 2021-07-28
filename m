Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95DA23D989A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232948AbhG1W0n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:26:43 -0400
Received: from m-r1.th.seeweb.it ([5.144.164.170]:40687 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbhG1W0W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:26:22 -0400
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id DA7611FF08;
        Thu, 29 Jul 2021 00:26:18 +0200 (CEST)
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
Subject: [PATCH 25/39] arm64: dts: qcom: Add device tree for SDM636
Date:   Thu, 29 Jul 2021 00:25:28 +0200
Message-Id: <20210728222542.54269-26-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This SoC is almost identical to its older brother,
SDM660, with a few minor exceptions like the
different GPU.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm636.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm636.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sdm636.dtsi b/arch/arm64/boot/dts/qcom/sdm636.dtsi
new file mode 100644
index 000000000000..ae15d81fa3f9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm636.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, AngeloGioacchino Del Regno <kholk11@gmail.com>
+ * Copyright (c) 2020, Konrad Dybcio <konradybcio@gmail.com>
+ * Copyright (c) 2020, Martin Botka <martin.botka1@gmail.com>
+ */
+
+#include "sdm660.dtsi"
+
+/*
+ * According to the downstream DTS,
+ * 636 is basically a 660 except for
+ * different CPU frequencies, Adreno
+ * 509 instead of 512 and lack of
+ * turing IP. These differences will
+ * be addressed when the aforementioned
+ * peripherals will be enabled upstream.
+ */
+
+&adreno_gpu {
+	compatible = "qcom,adreno-509.0", "qcom,adreno";
+	/* Adreno 509 shares the frequency table with 512 */
+};
-- 
2.32.0

