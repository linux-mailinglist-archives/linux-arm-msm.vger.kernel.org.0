Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A551A2CC79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2019 18:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfE1Qro (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 12:47:44 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38984 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfE1Qro (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 12:47:44 -0400
Received: by mail-pf1-f195.google.com with SMTP id z26so11832898pfg.6;
        Tue, 28 May 2019 09:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hl7Qw6TV0ASyprnMWnpIzwz2Nh0SP6ZozbsZ5FdFVys=;
        b=STtGBzN9B0qD3mljxoo5fKRndyWoueeaacpeC4lAPSvzGc/G3EwY/6UcJgaKTSzQ+v
         x+npRt4LXPMFgUDNHgR2h06MhHGhaFRPODGs3G7mOtsIkf0E1VyFHDX9V9Vci5chVCfl
         PrXPUhrcVYTTaz/G0SHFdv7j+aUus3gDc7Jes4BX44l4M4dIf8PCk30Bc6vWYYeX90mB
         lS5qnOUmzfT9UF3PKz96GiWu5k2i8rIyDhShyvjW3tlrFAY7pfYINnx/aaQJvCdMje5u
         4ltqIQ+sA0iXr/orT9uuHWFYZfcBXSaVXCzrb4RzaO/aR2sKmGVIesf7f8U9D8jail00
         28jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hl7Qw6TV0ASyprnMWnpIzwz2Nh0SP6ZozbsZ5FdFVys=;
        b=bDTvMc3jNxcpDjUKfFsQzBud5+4vokP9GTl+us2OU5MKyUCELpDI5GQvhamkV+Pq5t
         uWjsMsJyE7dNMyzb7CXXeWw4IKerumcMPK1EbAMQ5ylFbybzLqh23r5HSI0tOXnF5mwv
         qVNlhyld9ky0MMeruhwKRJqbQsRFX6NBcZYoJNlOzk9lOaSAK8u/3y3pBmg53eo7U3+K
         JcYdCvO+38PhLf775KOOW/o7AwG7lLpMcoFFoQui2DWWYhtoaRw70yA2M95Em/I2lpsH
         52m/b192fxP0OM7bXsQF0JWO0rrA4F1N+kgKKUaNS/9yBce1BZXnr2NsQW5TYPss83Rl
         XJ3g==
X-Gm-Message-State: APjAAAVIIlZHAZj4g5+j6pJCcc+45WvSxN55xuJRogOuIVo4aCU7R/kw
        zG9fgENnLq3PkSkrNRoKAwY=
X-Google-Smtp-Source: APXvYqyKVw7Hkf+z72Bij1Vjytf0Etcp6hDOTy/Y2amP3k/FKnaMiBjtMsEf8wscY5EFmEukJMjRGQ==
X-Received: by 2002:a62:5e42:: with SMTP id s63mr140542978pfb.78.1559062063424;
        Tue, 28 May 2019 09:47:43 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id q10sm14489672pff.132.2019.05.28.09.47.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:47:42 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr,
        jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 1/3] dt-bindings: clock: Document gpucc for msm8998
Date:   Tue, 28 May 2019 09:47:40 -0700
Message-Id: <20190528164740.38593-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528164616.38517-1-jeffrey.l.hugo@gmail.com>
References: <20190528164616.38517-1-jeffrey.l.hugo@gmail.com>
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

