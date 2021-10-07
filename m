Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7172D425ECC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 23:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241742AbhJGV1a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 17:27:30 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:59022 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241479AbhJGV10 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 17:27:26 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id C34D3C9157;
        Thu,  7 Oct 2021 21:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633641931; bh=ypUUkVhGZTTYseT65cOBdzBB3lW/QgcaSQMa/iPZE2w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=wWIAAESBEWm6F5bAxeygg4V1cUBOEDcb7mFL2DpzZTdAUiP+HXpVuDWql0EAn8zOp
         WSetlF/wqIQihOXj0VwQZVKsLC8t4w+9WbtajRfA760VIbTHI4P4fGH2+Y4iX8L/oU
         ffIuL6DiXvJNWZlftxv6mRpExsd0a7RBV0bwVnGQ=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] arm64: dts: qcom: Add SM7225 device tree
Date:   Thu,  7 Oct 2021 23:24:37 +0200
Message-Id: <20211007212444.328034-11-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007212444.328034-1-luca@z3ntu.xyz>
References: <20211007212444.328034-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Snapdragon 750G (sm7225) is software-wise very similar to Snapdragon
690 (sm6350) with minor differences in clock speeds and as added here,
it uses the Kryo 570 instead of Kryo 560.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
v2: add R-b

 arch/arm64/boot/dts/qcom/sm7225.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7225.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sm7225.dtsi b/arch/arm64/boot/dts/qcom/sm7225.dtsi
new file mode 100644
index 000000000000..7b2a002ca7ff
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7225.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Luca Weiss <luca@z3ntu.xyz>
+ */
+
+#include "sm6350.dtsi"
+
+/* SM7225 uses Kryo 570 instead of Kryo 560 */
+&CPU0 { compatible = "qcom,kryo570"; };
+&CPU1 { compatible = "qcom,kryo570"; };
+&CPU2 { compatible = "qcom,kryo570"; };
+&CPU3 { compatible = "qcom,kryo570"; };
+&CPU4 { compatible = "qcom,kryo570"; };
+&CPU5 { compatible = "qcom,kryo570"; };
+&CPU6 { compatible = "qcom,kryo570"; };
+&CPU7 { compatible = "qcom,kryo570"; };
-- 
2.33.0

