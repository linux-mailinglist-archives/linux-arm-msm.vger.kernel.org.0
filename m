Return-Path: <linux-arm-msm+bounces-3265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E118033F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC23D1C20A5A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC272555A;
	Mon,  4 Dec 2023 13:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DbAKtXVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2527113
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 05:08:02 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40859dee28cso44269025e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 05:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701695281; x=1702300081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8/wN9bVDO/fT20ixO2JSLBwr82UnvTKWcapBaXM3F4=;
        b=DbAKtXVWf43mlPXkXv0/KIyWFqnVBLJyJbtOB2d2JQ10o/bQt0S1eHnJ8OgUHL7Q+a
         BJHifupkmQZeh9JoCUe0N1W0ESb5JyVcdD3Ke+2EjfYL29Br+ZlGZhD1/u1XlzCFa3fl
         SPo6w9mDkN6noHK3dHVcOILhLv4VqabipItPBo4EfpysZPYPEfS32gaIdepB5OIRZ9UE
         dqNjOgTHcA7KoPO/6w7W8GutzM5v3y+XXIcC+ysVy6ysx/x1ru3qYw8sIYqm73dqWwah
         lQU0NRikw9XX4mNIIOzs3J8cbKIrw8dec8ZOQKjpjyptow6x0GeB9+4aRM6eJ9Ed6EgG
         Bq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695281; x=1702300081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8/wN9bVDO/fT20ixO2JSLBwr82UnvTKWcapBaXM3F4=;
        b=X7bNwzGtU1udnOax9t+9M0rbEhi95j8Ez1YagVMW5gPLgo883vt87HjHuVsHouVjca
         pptmjbqvWeq/IwWJwWBc8/ZaAfzvGS7irh5TN4PLaPv/KGdhxwYAMJhLiYWVxDoGHGNW
         MDWGJVGfWaNkb13iLPI80jDPZh/9kAs9CzGDcQDNwDDp9YC3RfgNo2tf6ehEBrDEOprm
         4jXYVVbXUGdztKJ5kjWNRORidQZ22HBaVMa8zVRrbcpAgT1GZaqcbGHLdqv7Qp/FeADG
         dv6gudEn4u8ZPPDz96ms+DAvYKU+Q5XORHeOXTyqtgbZ62G7Vdu9rKbDU3pM5ImR4cWU
         CRxw==
X-Gm-Message-State: AOJu0YwI5+7lpgA6I+jxkdM24zgWWzknSWCAhQPXwwvYOl9TsN/q9Pqr
	itEAlfwl/pkt7Qb9smKhj+tL1Q==
X-Google-Smtp-Source: AGHT+IGMHdhbuGPecflZBTUfmHubu9TYXaV9juwkLdp562K9OLSvK7kIuiTPaL0q9Tvs7zvDkHPeug==
X-Received: by 2002:a05:600c:1c0f:b0:40b:2b3d:9f45 with SMTP id j15-20020a05600c1c0f00b0040b2b3d9f45mr2992488wms.14.1701695281231;
        Mon, 04 Dec 2023 05:08:01 -0800 (PST)
Received: from [127.0.1.1] ([82.77.85.67])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c4f8a00b004053e9276easm18494166wmq.32.2023.12.04.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:08:00 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 04 Dec 2023 15:07:40 +0200
Subject: [PATCH v2 6/7] phy: qcom-qmp: qserdes-txrx: Add V6 N4 register
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-6-21956ae0c5c3@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-0-21956ae0c5c3@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-0-21956ae0c5c3@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3441; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=mP9L6SpjvbccTHuSpfnLLqvU2TjJIjDbq/c6nbRWGbY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlbc8mxqFzFRVpj609aNo824m4dO2D7XDmVu0TQ
 oE3S7/PiQKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZW3PJgAKCRAbX0TJAJUV
 VnSvEACZJJyxW+F8fnfg/mEQ7/u1gyGZdebSgUfKaO+y8k1oZU61qguHffG8zKbvKmx4+CeylZX
 a9sZImVFvS0nCm0WhqSQ1SGe671FKhDNX3JPSaoXtP4mKRG/dkoy+fC2bf0GLm60JqF3SxtGt8S
 SPKiKI65pILqAEAiUC29EP6sr/asvcdQkkgHVyVNT2BtsyeRLudKrmE8LmfF5YPCB0qqbK9GTr7
 AatXhi4CYTrhOxPWS2c34Khu/MBnU4rdRFerR5jY9zrPJqS0ArE+6qctDxPiZ4ABIVAehErr+Rl
 CX7k5T+X+11hChFYyCLnM9TjenvGS+k/TMp5nTgb6rw0rP/Zqss4O5OOQ+0Fzu0EagaJT+OAMrq
 I30ALYdWyY/OSEk2f0U0DuZFBqADcbfFFyi2W3gcFFrB0dxTyx5cFPtM+I8CYxJYcZtg/TTd+R6
 8jWUFvROeoVbVW49djUPXDytB+yiNVTuml3fyQVTP6a3r6Os3oglhGa8kXIrE6/qxYXkCKCnFCr
 DvDj1Sdk/Dalmmix2GbEZlZoV5WPUeqL99koaIZpRdHSpNPL7WZ7Gl3GRDqXIVmNsApYkwHXTR2
 QZZm5B9j0855kb6J/ec1I7wT1gdHiFuGA49/IKFksw6arllGZULhmTI64dzxy/n50+YDIswkk/D
 H+gDO6W/DXuqzuQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

There is a variant of V6 offsets that are different, the QMP PHY N4,
and it is found on the X1E80100 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h | 51 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 2 files changed, 52 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
new file mode 100644
index 000000000000..a814ad11af07
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V6_N4_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V6_N4_H_
+
+#define QSERDES_V6_N4_TX_RES_CODE_LANE_OFFSET_TX	0x30
+#define QSERDES_V6_N4_TX_RES_CODE_LANE_OFFSET_RX	0x34
+#define QSERDES_V6_N4_TX_LANE_MODE_1			0x78
+#define QSERDES_V6_N4_TX_LANE_MODE_2			0x7c
+#define QSERDES_V6_N4_TX_LANE_MODE_3			0x80
+
+#define QSERDES_V6_N4_RX_UCDR_FO_GAIN_RATE2		0x8
+#define QSERDES_V6_N4_RX_UCDR_SO_GAIN_RATE2		0x18
+#define QSERDES_V6_N4_RX_UCDR_PI_CONTROLS		0x20
+#define QSERDES_V6_N4_RX_IVCM_CAL_CODE_OVERRIDE		0x94
+#define QSERDES_V6_N4_RX_RX_IVCM_CAL_CTRL2		0x9c
+#define QSERDES_V6_N4_RX_RX_IVCM_POSTCAL_OFFSET		0xa0
+#define QSERDES_V6_N4_RX_DFE_3				0xb4
+#define QSERDES_V6_N4_RX_VGA_CAL_CNTRL1			0xe0
+#define QSERDES_V6_N4_RX_VGA_CAL_MAN_VAL		0xe8
+#define QSERDES_V6_N4_RX_GM_CAL				0x10c
+#define QSERDES_V6_N4_RX_SIGDET_ENABLES			0x148
+#define QSERDES_V6_N4_RX_SIGDET_CNTRL			0x14c
+#define QSERDES_V6_N4_RX_SIGDET_DEGLITCH_CNTRL		0x154
+#define QSERDES_V6_N4_RX_DFE_CTLE_POST_CAL_OFFSET	0x194
+#define QSERDES_V6_N4_RX_Q_PI_INTRINSIC_BIAS_RATE32	0x1dc
+#define QSERDES_V6_N4_RX_UCDR_PI_CTRL1			0x23c
+#define QSERDES_V6_N4_RX_UCDR_PI_CTRL2			0x240
+#define QSERDES_V6_N4_RX_UCDR_SB2_GAIN2_RATE2		0x27c
+#define QSERDES_V6_N4_RX_DFE_DAC_ENABLE1		0x298
+#define QSERDES_V6_N4_RX_MODE_RATE_0_1_B0		0x2b8
+#define QSERDES_V6_N4_RX_MODE_RATE_0_1_B1		0x2bc
+#define QSERDES_V6_N4_RX_MODE_RATE_0_1_B2		0x2c0
+#define QSERDES_V6_N4_RX_MODE_RATE_0_1_B3		0x2c4
+#define QSERDES_V6_N4_RX_MODE_RATE_0_1_B4		0x2c8
+#define QSERDES_V6_N4_RX_MODE_RATE_0_1_B5		0x2cc
+#define QSERDES_V6_N4_RX_MODE_RATE_0_1_B6		0x2d0
+#define QSERDES_V6_N4_RX_MODE_RATE2_B0			0x2d4
+#define QSERDES_V6_N4_RX_MODE_RATE2_B1			0x2d8
+#define QSERDES_V6_N4_RX_MODE_RATE2_B2			0x2dc
+#define QSERDES_V6_N4_RX_MODE_RATE2_B3			0x2e0
+#define QSERDES_V6_N4_RX_MODE_RATE2_B4			0x2e4
+#define QSERDES_V6_N4_RX_MODE_RATE2_B5			0x2e8
+#define QSERDES_V6_N4_RX_MODE_RATE2_B6			0x2ec
+#define QSERDES_V6_N4_RX_RX_SUMMER_CAL_SPD_MODE		0x30c
+#define QSERDES_V6_N4_RX_RX_BKUP_CTRL1			0x310
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 3a0512c3e07a..63b3cbfcb50f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -24,6 +24,7 @@
 #include "phy-qcom-qmp-qserdes-com-v6.h"
 #include "phy-qcom-qmp-qserdes-txrx-v6.h"
 #include "phy-qcom-qmp-qserdes-txrx-v6_20.h"
+#include "phy-qcom-qmp-qserdes-txrx-v6_n4.h"
 #include "phy-qcom-qmp-qserdes-ln-shrd-v6.h"
 
 #include "phy-qcom-qmp-qserdes-com-v7.h"

-- 
2.34.1


