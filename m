Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC989369AA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 04:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfFFCBH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 22:01:07 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42743 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfFFCBH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 22:01:07 -0400
Received: by mail-pl1-f194.google.com with SMTP id go2so247114plb.9;
        Wed, 05 Jun 2019 19:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hl7Qw6TV0ASyprnMWnpIzwz2Nh0SP6ZozbsZ5FdFVys=;
        b=H0k5UvaxvoCI50EAcHDJDxKJiqPALNdhcZOr8eEA7gVjCtmKlSz0krZHgfOkkp7+mT
         mQZjsMFRXdOkRVdmESmy71jsa/D4dFb5WyU9Tnt61rUn/+b+mV+dJAoC9of6ekK+S8JI
         f7NFg9RICEMvg5h23hNFtZse6Eg/1ldR++y8RqxBBwHJT/xw69U9MREv5u4Y1l02NT3n
         /ES3O02YP6HuqFXVsaDKWltsUsG2SBdk4VmWETzqatY5JvGpA3lMVDIgaEHV0P7OR9Fj
         A5VFUnMFJtVm+fGa8mksgKLQCrfOzvXoJyvDuly354CxnjGsrfv6TC/1bjRjVJleP8tO
         599Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hl7Qw6TV0ASyprnMWnpIzwz2Nh0SP6ZozbsZ5FdFVys=;
        b=Oosww+8oVAwDw2zXdLp++jiTT1B1Uod/Gv5qGm/fZaUH/4XcMtyNm33qH0mYk89Dby
         sAJJplcNfS9Ai6WdAbtOP4YMaNDsihNT924q+X0jGRJ1Y2eslC1KjHXrYqCaHay6vuaJ
         hX4+zQ13Zs+WPez+bJlXZ9sNZF8rtHyKxu6DOZSOZSYWR74iDrK1tiJXEgPzI5v1LO/d
         L1/a73YuHJhNIy9o9XgO5IIw5//iBzbm0vSqelVB4gmYTswuPsRz91hthyHU0jR74vBg
         fYF4sOQh9PGaGSdiZXJA/uVSu02nPZohipROPk8PDlRrQwDQA97o5t+H0OlvmXgkh2P0
         wjEQ==
X-Gm-Message-State: APjAAAWmMRbRuDp2gROJHAAur0tOlg6vH7tgNYTY3fJxzBEpGcQIl/W0
        uvEiWxVIsE3RMC56MnW51xg=
X-Google-Smtp-Source: APXvYqyMYndp+Uyq2J7tCVNgbiVo5mec/xiEJ7usFR3KQl0MMLdJT9wum0Dz60prHwMGJJc8YZuCOg==
X-Received: by 2002:a17:902:bb89:: with SMTP id m9mr44474933pls.188.1559786466660;
        Wed, 05 Jun 2019 19:01:06 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id b15sm248746pff.31.2019.06.05.19.01.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 19:01:06 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr,
        jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: Document gpucc for msm8998
Date:   Wed,  5 Jun 2019 18:59:37 -0700
Message-Id: <20190606015937.2337-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606015844.2285-1-jeffrey.l.hugo@gmail.com>
References: <20190606015844.2285-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GPU for msm8998 has its own clock controller.  Document it.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 .../devicetree/bindings/clock/qcom,gpucc.txt  |  4 ++-
 .../dt-bindings/clock/qcom,gpucc-msm8998.h    | 29 +++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-msm8998.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
index 4e5215ef1acd..269afe8a757e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
@@ -2,13 +2,15 @@ Qualcomm Graphics Clock & Reset Controller Binding
 --------------------------------------------------
 
 Required properties :
-- compatible : shall contain "qcom,sdm845-gpucc"
+- compatible : shall contain "qcom,sdm845-gpucc" or "qcom,msm8998-gpucc"
 - reg : shall contain base register location and length
 - #clock-cells : from common clock binding, shall contain 1
 - #reset-cells : from common reset binding, shall contain 1
 - #power-domain-cells : from generic power domain binding, shall contain 1
 - clocks : shall contain the XO clock
+	   shall contain the gpll0 out main clock (msm8998)
 - clock-names : shall be "xo"
+		shall be "gpll0" (msm8998)
 
 Example:
 	gpucc: clock-controller@5090000 {
diff --git a/include/dt-bindings/clock/qcom,gpucc-msm8998.h b/include/dt-bindings/clock/qcom,gpucc-msm8998.h
new file mode 100644
index 000000000000..2623570ee974
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gpucc-msm8998.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019, Jeffrey Hugo
+ */
+
+#ifndef _DT_BINDINGS_CLK_MSM_GPUCC_8998_H
+#define _DT_BINDINGS_CLK_MSM_GPUCC_8998_H
+
+#define GPUPLL0						0
+#define GPUPLL0_OUT_EVEN				1
+#define RBCPR_CLK_SRC					2
+#define GFX3D_CLK_SRC					3
+#define RBBMTIMER_CLK_SRC				4
+#define GFX3D_ISENSE_CLK_SRC				5
+#define RBCPR_CLK					6
+#define GFX3D_CLK					7
+#define RBBMTIMER_CLK					8
+#define GFX3D_ISENSE_CLK				9
+#define GPUCC_CXO_CLK					10
+
+#define GPU_CX_BCR					0
+#define RBCPR_BCR					1
+#define GPU_GX_BCR					2
+#define GPU_ISENSE_BCR					3
+
+#define GPU_CX_GDSC					1
+#define GPU_GX_GDSC					2
+
+#endif
-- 
2.17.1

