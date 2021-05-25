Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F67390A2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 22:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233099AbhEYUEu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 16:04:50 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:56141 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbhEYUEs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 16:04:48 -0400
Received: from localhost.localdomain (83.6.168.54.neoplus.adsl.tpnet.pl [83.6.168.54])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 5A8A620377;
        Tue, 25 May 2021 22:03:15 +0200 (CEST)
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
Subject: [PATCH 2/7] arm64: dts: qcom: Add MSM8996v3.0 DTSI file
Date:   Tue, 25 May 2021 22:02:40 +0200
Message-Id: <20210525200246.118323-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525200246.118323-1-konrad.dybcio@somainline.org>
References: <20210525200246.118323-1-konrad.dybcio@somainline.org>
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
 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi b/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
new file mode 100644
index 000000000000..b46f10b7413a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+#include "msm8996.dtsi"
+
+ / {
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
-- 
2.31.1

