Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36CD39FAAC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 17:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231826AbhFHP3j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 11:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbhFHP3h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 11:29:37 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC046C061787
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 08:27:44 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 916BF1F9D2;
        Tue,  8 Jun 2021 17:27:42 +0200 (CEST)
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
Subject: [PATCH v3 2/3] arm64: dts: qcom: Add MSM8996v3.0 DTSI file
Date:   Tue,  8 Jun 2021 17:27:35 +0200
Message-Id: <20210608152737.154218-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608152737.154218-1-konrad.dybcio@somainline.org>
References: <20210608152737.154218-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an overlay for MSM8996v3.0, which is a pre-final revision
of the said SoC. It has some stark differences with regards to
GPU, or more specifically its power delivery path. Oh, and of
course a different msm-id.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v2:
- Remove a stray space before "/ {"

 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi b/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
new file mode 100644
index 000000000000..483676baf7e7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+#include "msm8996.dtsi"
+
+/ {
+	qcom,msm-id = <246 0x30000>;
+ };
+
+ /*
+  * This revision seems to have differ GPU CPR
+  * parameters, GPU frequencies and some differences
+  * when it comes to voltage delivery to.. once again
+  * the GPU. Funnily enough, it's simpler to make it an
+  * overlay on top of 3.1 (the final one) than vice versa.
+  * The differences will show here as more and more
+  * features get enabled upstream.
+  */
+
+gpu_opp_table_3_0: gpu-opp-table-30 {
+	compatible = "operating-points-v2";
+
+	opp-624000000 {
+		opp-hz = /bits/ 64 <624000000>;
+		opp-level = <7>;
+	};
+
+	opp-560000000 {
+		opp-hz = /bits/ 64 <560000000>;
+		opp-level = <6>;
+	};
+
+	opp-510000000 {
+		opp-hz = /bits/ 64 <510000000>;
+		opp-level = <5>;
+	};
+
+	opp-401800000 {
+		opp-hz = /bits/ 64 <401800000>;
+		opp-level = <4>;
+	};
+
+	opp-315000000 {
+		opp-hz = /bits/ 64 <315000000>;
+		opp-level = <3>;
+	};
+
+	opp-214000000 {
+		opp-hz = /bits/ 64 <214000000>;
+		opp-level = <3>;
+	};
+
+	opp-133000000 {
+		opp-hz = /bits/ 64 <133000000>;
+		opp-level = <3>;
+	};
+};
+
+&gpu {
+	operating-points-v2 = <&gpu_opp_table_3_0>;
+};
-- 
2.31.1

