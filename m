Return-Path: <linux-arm-msm+bounces-6705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C11D827D30
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 04:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4FC41C2342C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 03:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54194539F;
	Tue,  9 Jan 2024 03:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZXWr51K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D1D4436
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 03:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cd0d05838fso27160351fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 19:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704769445; x=1705374245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ciPx+L3pf4H16PRUpfVDL0MtkQGeDdR84nTHM/kOug=;
        b=tZXWr51KpdWt6UzlN4cDDbsCO5zGRExA4uu+Cy4kWHeDq/T5VXZelG7cHBhbNVPxy3
         nIQ3vqSt7yOLLe5Z/z/kNgqDaUOl6fNs4P0OIjUciqxFvI6cMEE41JrhU9aGlOAIwjEx
         o9cI2Hj6tWrE9h2xpIORK9JrqhMAUblE7LdvMWqwQ7vFQul2rqv0ZcBqnDh4SbwfAhFW
         jHwXbFrzF68NllWJTF3R4b7XbXrjy36Gi9E+pZ3pAgx+Xw5qkoVmsE+ivN1EFsZ4sLy6
         2ono/hecxlalRe6cNkl9rfUeeMJhKs1XN1jvYpdwuce55vqbpwnDFjyS79ANAAzvuL6x
         aDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704769445; x=1705374245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ciPx+L3pf4H16PRUpfVDL0MtkQGeDdR84nTHM/kOug=;
        b=BtmkKmNWL4VF8I3oHVCZtnF8qbJ/CBgNij3Za1KSsET8ej7eAUbD6tXxiJ5fR7nIov
         zmeT/UR4QCnf9qjFYAA2czgmyp6WKt5MFp0Mke19f6qW4bNj38KKpB4PdseKfVANIHTv
         Pweycl2x8s7UVmCLWho+xdR+BtOnXMm3xtyZbKPwLF3OF0ZzWzgyRjngycAg/ArnSGSz
         Xk5eYzO7yCXdNBwlXq6XgTx1UKRRaaXKh+ZGmC7AVMdsR2hvhU//67pobx2zD1+UCx7Z
         xPm44eUUMkR//LWxE9yA5K9GVVtZ+gZPa/sccRiinRzYCSLioJwgSSaJhb0/bbgO7R75
         wAbg==
X-Gm-Message-State: AOJu0YxhE/oBoCMr9tg5cDDH6DB0q/7Uldeqp/lM4OfUv0z7q99UUUdg
	Np28Cwe6uCpi95x1zoWlmh7ejv6H66VQlA==
X-Google-Smtp-Source: AGHT+IGVhvBKd5Nvg6pyhDcOyz+0EtqeuoT7hNyMPYNysv07pyPEoUc1caMhjrinFCfQ4SDhrPFUSA==
X-Received: by 2002:a2e:8881:0:b0:2cc:c8bb:aae6 with SMTP id k1-20020a2e8881000000b002ccc8bbaae6mr1858713lji.12.1704769445181;
        Mon, 08 Jan 2024 19:04:05 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g30-20020a2e391e000000b002cd1ad3b11csm176920lja.42.2024.01.08.19.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 19:04:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Jan 2024 05:04:02 +0200
Subject: [PATCH 4/8] phy: qcom: qmp: split DP PHY registers to separate
 headers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240109-phy-qmp-merge-common-v1-4-572899a14318@linaro.org>
References: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
In-Reply-To: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=12897;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=W0ggpdWzluGij7PtPoB3Bf0QY2eRo1kp9rR6Z3Zo+i8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlnLehXpOcjzzG8oky9ezeGIlOSnKZWg6gPrRfx
 MCGdTCrXu+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZy3oQAKCRCLPIo+Aiko
 1XWTB/0bvzTc2elX9a47KtEbyjZSWSq42tMZmAcY5nar9CdTGKg4uUtjrfmkgYS9Zu3PW8ASSWf
 cRnS5UR6/O99CbkLUww72SpPXmyyv94AjZ6nb6bt85lxJKQoyqUjvDovYRCt4uUs6IAYHL7dFxB
 4Hf1bnTCP7m02pL7wsA0cYx2b6C+6XfMQ9WOKhdYkIsOXQQ38w4U2kwbzhrgAzg0Pbam9cbfvhD
 gUJB2RSJFJj/KaIs8B4YLHJXGOukr0n/Okjjb0J6YbLYYuEUTp2aRny+EpCTjVOY5VNurPOr3Sa
 yWNSw38hNkFMYBzymoAhNAXmWt7eLraMFYVW3pdLBE+QtuBc
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Split the DP PHY register definitions to separate headers, removing them
from the global one.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-edp.c            |  3 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 10 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-dp-com-v3.h  | 18 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v3.h  | 21 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v4.h  | 19 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v5.h  | 13 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v6.h  | 13 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h     | 62 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c |  2 +
 drivers/phy/qualcomm/phy-qcom-qmp.h            | 88 --------------------------
 10 files changed, 159 insertions(+), 90 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 8e5078304646..9818d994c68b 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -21,7 +21,8 @@
 
 #include <dt-bindings/phy/phy.h>
 
-#include "phy-qcom-qmp.h"
+#include "phy-qcom-qmp-dp-phy.h"
+#include "phy-qcom-qmp-qserdes-com-v4.h"
 
 /* EDP_PHY registers */
 #define DP_PHY_CFG                              0x0010
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index c86f6f612b1e..1dae93640479 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -33,6 +33,14 @@
 #include "phy-qcom-qmp-pcs-usb-v5.h"
 #include "phy-qcom-qmp-pcs-usb-v6.h"
 
+#include "phy-qcom-qmp-dp-com-v3.h"
+
+#include "phy-qcom-qmp-dp-phy.h"
+#include "phy-qcom-qmp-dp-phy-v3.h"
+#include "phy-qcom-qmp-dp-phy-v4.h"
+#include "phy-qcom-qmp-dp-phy-v5.h"
+#include "phy-qcom-qmp-dp-phy-v6.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */
@@ -2322,7 +2330,7 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
 	u32 status;
 	int ret;
 
-	writel(0x0f, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_CFG_1);
+	writel(0x0f, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);
 
 	qmp_configure_dp_mode(qmp);
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-com-v3.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-com-v3.h
new file mode 100644
index 000000000000..396179ef38b0
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-com-v3.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_DP_COM_V3_H_
+#define QCOM_PHY_QMP_DP_COM_V3_H_
+
+/* Only for QMP V3 & V4 PHY - DP COM registers */
+#define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
+#define QPHY_V3_DP_COM_SW_RESET				0x04
+#define QPHY_V3_DP_COM_POWER_DOWN_CTRL			0x08
+#define QPHY_V3_DP_COM_SWI_CTRL				0x0c
+#define QPHY_V3_DP_COM_TYPEC_CTRL			0x10
+#define QPHY_V3_DP_COM_TYPEC_PWRDN_CTRL			0x14
+#define QPHY_V3_DP_COM_RESET_OVRD_CTRL			0x1c
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v3.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v3.h
new file mode 100644
index 000000000000..00a9702abccd
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v3.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_DP_PHY_V3_H_
+#define QCOM_PHY_QMP_DP_PHY_V3_H_
+
+/* Only for QMP V3 PHY - DP PHY registers */
+#define QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK		0x048
+#define QSERDES_V3_DP_PHY_AUX_INTERRUPT_CLEAR		0x04c
+#define QSERDES_V3_DP_PHY_AUX_BIST_CFG			0x050
+
+#define QSERDES_V3_DP_PHY_VCO_DIV			0x064
+#define QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL		0x06c
+#define QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL		0x088
+
+#define QSERDES_V3_DP_PHY_SPARE0			0x0ac
+#define QSERDES_V3_DP_PHY_STATUS			0x0c0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v4.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v4.h
new file mode 100644
index 000000000000..ed6795e1257c
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v4.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_DP_PHY_V4_H_
+#define QCOM_PHY_QMP_DP_PHY_V4_H_
+
+/* Only for QMP V4 PHY - DP PHY registers */
+#define QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK		0x054
+#define QSERDES_V4_DP_PHY_AUX_INTERRUPT_CLEAR		0x058
+#define QSERDES_V4_DP_PHY_VCO_DIV			0x070
+#define QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL		0x078
+#define QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL		0x09c
+#define QSERDES_V4_DP_PHY_SPARE0			0x0c8
+#define QSERDES_V4_DP_PHY_AUX_INTERRUPT_STATUS		0x0d8
+#define QSERDES_V4_DP_PHY_STATUS			0x0dc
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v5.h
new file mode 100644
index 000000000000..f5cfacf9be96
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v5.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_DP_PHY_V5_H_
+#define QCOM_PHY_QMP_DP_PHY_V5_H_
+
+/* Only for QMP V5 PHY - DP PHY registers */
+#define QSERDES_V5_DP_PHY_AUX_INTERRUPT_STATUS		0x0d8
+#define QSERDES_V5_DP_PHY_STATUS			0x0dc
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v6.h
new file mode 100644
index 000000000000..01a20d3be4b8
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v6.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_DP_PHY_V6_H_
+#define QCOM_PHY_QMP_DP_PHY_V6_H_
+
+/* Only for QMP V6 PHY - DP PHY registers */
+#define QSERDES_V6_DP_PHY_AUX_INTERRUPT_STATUS		0x0e0
+#define QSERDES_V6_DP_PHY_STATUS			0x0e4
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
new file mode 100644
index 000000000000..0ebd405bcaf0
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_DP_PHY_H_
+#define QCOM_PHY_QMP_DP_PHY_H_
+
+/* QMP PHY - DP PHY registers */
+#define QSERDES_DP_PHY_REVISION_ID0			0x000
+#define QSERDES_DP_PHY_REVISION_ID1			0x004
+#define QSERDES_DP_PHY_REVISION_ID2			0x008
+#define QSERDES_DP_PHY_REVISION_ID3			0x00c
+#define QSERDES_DP_PHY_CFG				0x010
+#define QSERDES_DP_PHY_CFG_1				0x014
+#define QSERDES_DP_PHY_PD_CTL				0x018
+#define QSERDES_DP_PHY_MODE				0x01c
+#define QSERDES_DP_PHY_AUX_CFG0				0x020
+#define QSERDES_DP_PHY_AUX_CFG1				0x024
+#define QSERDES_DP_PHY_AUX_CFG2				0x028
+#define QSERDES_DP_PHY_AUX_CFG3				0x02c
+#define QSERDES_DP_PHY_AUX_CFG4				0x030
+#define QSERDES_DP_PHY_AUX_CFG5				0x034
+#define QSERDES_DP_PHY_AUX_CFG6				0x038
+#define QSERDES_DP_PHY_AUX_CFG7				0x03c
+#define QSERDES_DP_PHY_AUX_CFG8				0x040
+#define QSERDES_DP_PHY_AUX_CFG9				0x044
+
+/* QSERDES COM_BIAS_EN_CLKBUFLR_EN bits */
+# define QSERDES_V3_COM_BIAS_EN				0x0001
+# define QSERDES_V3_COM_BIAS_EN_MUX			0x0002
+# define QSERDES_V3_COM_CLKBUF_R_EN			0x0004
+# define QSERDES_V3_COM_CLKBUF_L_EN			0x0008
+# define QSERDES_V3_COM_EN_SYSCLK_TX_SEL		0x0010
+# define QSERDES_V3_COM_CLKBUF_RX_DRIVE_L		0x0020
+# define QSERDES_V3_COM_CLKBUF_RX_DRIVE_R		0x0040
+
+/* QPHY_TX_TX_EMP_POST1_LVL bits */
+# define DP_PHY_TXn_TX_EMP_POST1_LVL_MASK		0x001f
+# define DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN		0x0020
+
+/* QPHY_TX_TX_DRV_LVL bits */
+# define DP_PHY_TXn_TX_DRV_LVL_MASK			0x001f
+# define DP_PHY_TXn_TX_DRV_LVL_MUX_EN			0x0020
+
+/* QSERDES_DP_PHY_PD_CTL bits */
+# define DP_PHY_PD_CTL_PWRDN				0x001
+# define DP_PHY_PD_CTL_PSR_PWRDN			0x002
+# define DP_PHY_PD_CTL_AUX_PWRDN			0x004
+# define DP_PHY_PD_CTL_LANE_0_1_PWRDN			0x008
+# define DP_PHY_PD_CTL_LANE_2_3_PWRDN			0x010
+# define DP_PHY_PD_CTL_PLL_PWRDN			0x020
+# define DP_PHY_PD_CTL_DP_CLAMP_EN			0x040
+
+/* QPHY_DP_PHY_AUX_INTERRUPT_STATUS bits */
+# define PHY_AUX_STOP_ERR_MASK				0x01
+# define PHY_AUX_DEC_ERR_MASK				0x02
+# define PHY_AUX_SYNC_ERR_MASK				0x04
+# define PHY_AUX_ALIGN_ERR_MASK				0x08
+# define PHY_AUX_REQ_ERR_MASK				0x10
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 5d7bb4f58af8..ca220878c630 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -25,6 +25,8 @@
 #include "phy-qcom-qmp-pcs-usb-v4.h"
 #include "phy-qcom-qmp-pcs-usb-v5.h"
 
+#include "phy-qcom-qmp-dp-com-v3.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 6923496cbfee..d6a9c9b5ea12 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -50,92 +50,4 @@
 
 #include "phy-qcom-qmp-pcs-v7.h"
 
-/* Only for QMP V3 & V4 PHY - DP COM registers */
-#define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
-#define QPHY_V3_DP_COM_SW_RESET				0x04
-#define QPHY_V3_DP_COM_POWER_DOWN_CTRL			0x08
-#define QPHY_V3_DP_COM_SWI_CTRL				0x0c
-#define QPHY_V3_DP_COM_TYPEC_CTRL			0x10
-#define QPHY_V3_DP_COM_TYPEC_PWRDN_CTRL			0x14
-#define QPHY_V3_DP_COM_RESET_OVRD_CTRL			0x1c
-
-/* QSERDES V3 COM bits */
-# define QSERDES_V3_COM_BIAS_EN				0x0001
-# define QSERDES_V3_COM_BIAS_EN_MUX			0x0002
-# define QSERDES_V3_COM_CLKBUF_R_EN			0x0004
-# define QSERDES_V3_COM_CLKBUF_L_EN			0x0008
-# define QSERDES_V3_COM_EN_SYSCLK_TX_SEL		0x0010
-# define QSERDES_V3_COM_CLKBUF_RX_DRIVE_L		0x0020
-# define QSERDES_V3_COM_CLKBUF_RX_DRIVE_R		0x0040
-
-/* QSERDES V3 TX bits */
-# define DP_PHY_TXn_TX_EMP_POST1_LVL_MASK		0x001f
-# define DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN		0x0020
-# define DP_PHY_TXn_TX_DRV_LVL_MASK			0x001f
-# define DP_PHY_TXn_TX_DRV_LVL_MUX_EN			0x0020
-
-/* QMP PHY - DP PHY registers */
-#define QSERDES_DP_PHY_REVISION_ID0			0x000
-#define QSERDES_DP_PHY_REVISION_ID1			0x004
-#define QSERDES_DP_PHY_REVISION_ID2			0x008
-#define QSERDES_DP_PHY_REVISION_ID3			0x00c
-#define QSERDES_DP_PHY_CFG				0x010
-#define QSERDES_DP_PHY_PD_CTL				0x018
-# define DP_PHY_PD_CTL_PWRDN				0x001
-# define DP_PHY_PD_CTL_PSR_PWRDN			0x002
-# define DP_PHY_PD_CTL_AUX_PWRDN			0x004
-# define DP_PHY_PD_CTL_LANE_0_1_PWRDN			0x008
-# define DP_PHY_PD_CTL_LANE_2_3_PWRDN			0x010
-# define DP_PHY_PD_CTL_PLL_PWRDN			0x020
-# define DP_PHY_PD_CTL_DP_CLAMP_EN			0x040
-#define QSERDES_DP_PHY_MODE				0x01c
-#define QSERDES_DP_PHY_AUX_CFG0				0x020
-#define QSERDES_DP_PHY_AUX_CFG1				0x024
-#define QSERDES_DP_PHY_AUX_CFG2				0x028
-#define QSERDES_DP_PHY_AUX_CFG3				0x02c
-#define QSERDES_DP_PHY_AUX_CFG4				0x030
-#define QSERDES_DP_PHY_AUX_CFG5				0x034
-#define QSERDES_DP_PHY_AUX_CFG6				0x038
-#define QSERDES_DP_PHY_AUX_CFG7				0x03c
-#define QSERDES_DP_PHY_AUX_CFG8				0x040
-#define QSERDES_DP_PHY_AUX_CFG9				0x044
-
-/* Only for QMP V3 PHY - DP PHY registers */
-#define QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK		0x048
-# define PHY_AUX_STOP_ERR_MASK				0x01
-# define PHY_AUX_DEC_ERR_MASK				0x02
-# define PHY_AUX_SYNC_ERR_MASK				0x04
-# define PHY_AUX_ALIGN_ERR_MASK				0x08
-# define PHY_AUX_REQ_ERR_MASK				0x10
-
-#define QSERDES_V3_DP_PHY_AUX_INTERRUPT_CLEAR		0x04c
-#define QSERDES_V3_DP_PHY_AUX_BIST_CFG			0x050
-
-#define QSERDES_V3_DP_PHY_VCO_DIV			0x064
-#define QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL		0x06c
-#define QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL		0x088
-
-#define QSERDES_V3_DP_PHY_SPARE0			0x0ac
-#define DP_PHY_SPARE0_MASK				0x0f
-#define DP_PHY_SPARE0_ORIENTATION_INFO_SHIFT		0x04(0x0004)
-
-#define QSERDES_V3_DP_PHY_STATUS			0x0c0
-
-/* Only for QMP V4 PHY - DP PHY registers */
-#define QSERDES_V4_DP_PHY_CFG_1				0x014
-#define QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK		0x054
-#define QSERDES_V4_DP_PHY_AUX_INTERRUPT_CLEAR		0x058
-#define QSERDES_V4_DP_PHY_VCO_DIV			0x070
-#define QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL		0x078
-#define QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL		0x09c
-#define QSERDES_V4_DP_PHY_SPARE0			0x0c8
-#define QSERDES_V4_DP_PHY_AUX_INTERRUPT_STATUS		0x0d8
-#define QSERDES_V4_DP_PHY_STATUS			0x0dc
-
-#define QSERDES_V5_DP_PHY_STATUS			0x0dc
-
-/* Only for QMP V6 PHY - DP PHY registers */
-#define QSERDES_V6_DP_PHY_AUX_INTERRUPT_STATUS		0x0e0
-#define QSERDES_V6_DP_PHY_STATUS			0x0e4
-
 #endif

-- 
2.39.2


