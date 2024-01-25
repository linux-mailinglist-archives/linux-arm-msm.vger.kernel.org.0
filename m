Return-Path: <linux-arm-msm+bounces-8373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B46483D09A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C55DE28BFC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C07F134B4;
	Thu, 25 Jan 2024 23:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9QqBsiK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEEC12E5C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706224984; cv=none; b=qfocNf6XttoycaM2jcbuIHYIDqS+LEHyqW/ly5TKIQeVoKxOhc+EPl3obfJANxGO42X8iDoBHSVi++3tNwAGFwrr9NGjAtcFB1wz/ks9+NpeTHSOmbiUHmyR5v4k9Wr4boikMGkacQzVMaSSYDQIm3qBctvN+OTJy+aTPZrZdzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706224984; c=relaxed/simple;
	bh=iTMp1cFXVu2VMwKZbbpSudi+L/OmjSO/l1qnVbvJSBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=txpQegbfmtcZmgRprJp5R18hjbfWHZ0rAC9d6hT3D1KRTmcN6pcje6v9pc79bQbhc7Y1gomBhkuLApzxiIzl+947ooyQVN0FzmPaGVL58mgMQy6T1OOdH/G7ZVPWVFytcqbghc+jdLgxt96xt2Ao7S5lroxreaBbDCFimw/l+as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9QqBsiK; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5100fd7f71dso362172e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706224980; x=1706829780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzgRUDNNT3ZPy8YgrqeGv8pEOlKEL0DJbKF/XJ8EPao=;
        b=D9QqBsiK5oH8Len6cv5jYsPJ+ItNGrldTUSqeiwbSsSj8JkNZMc+2GCW/n4WURSn1j
         pdyL9k9uWL49fjRJrcdx489mM9V0sqqLda9Vpyo1B+ejsAjJfe4QzoDDItSYQqmI63Ix
         +nXNnCfNYTN//qWXHGGjiUs1cHzSgGozz/GZwkoPEUeIaPtZdCEBJTkpHwupkqd32ar0
         CjvPlN6qyOtNPr4THb7cwqAhd/i7mnVnYrzfr3v9JtqEKOWa70MJJ8YF76AB1v0S9O8y
         hRp31yJ1dtMChtKGQpy9H3Az/OOE/O3jtq4mZZSszmpAhro93Hqq199eH9MmkepDnKEJ
         q5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706224980; x=1706829780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzgRUDNNT3ZPy8YgrqeGv8pEOlKEL0DJbKF/XJ8EPao=;
        b=CaWo5klahiP9qI+Q5pl6G4ghF8K3ddCKZHrPdhcnybFvvJfZTh0+aibEzrRSjCJ2Xw
         vAjoDKtMxTXm8UfTfQFlOk+fosKjWt2KaSVC9o1QHmAN5sIy4B8Fn6ZByFryl4CpIcgf
         0MCwHSQNjz2HvAI2PcNpJdrUMeFQNtfhCm/rYWWO+rSoe3+x0Fkbr3Y9/1wCJQSQciTu
         pjT52mNSXEqlZFwZf+bWLn2fl1am5aOZvSGKBnMT0zq8VDpD/VVeG5e4hGExJDZdPrWV
         7NzA5C4fShEHMLEBOLAbdGMQEDA8edfuF4Bxamdoc3w7/T2p7YZqptiwbk6GG5expyzr
         4NyA==
X-Gm-Message-State: AOJu0YzY+b7TXAkevK1qmeSUzq+WkDXdKujNlFXAMO3Yc50jP891w0+D
	TvrcRc7GxtvhZiWpwPhiyhZteP2oJX65DtEUmcaQd7UhOhWdDSAT01ecUinoE7MZFdVdLzT9dv4
	W
X-Google-Smtp-Source: AGHT+IF+nFNMVv0hMAkhDAmlPngK6xhRENuuwbyr8UFoEqE6pVwCYOMYe0jQ1PncPQGTxbA/3uqgnA==
X-Received: by 2002:ac2:4288:0:b0:510:1bd5:22f4 with SMTP id m8-20020ac24288000000b005101bd522f4mr246520lfh.121.1706224980159;
        Thu, 25 Jan 2024 15:23:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k3-20020a05651210c300b0050e6df07728sm3920lfg.180.2024.01.25.15.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:22:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:22:38 +0200
Subject: [PATCH v2 4/8] phy: qcom: qmp: split DP PHY registers to separate
 headers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-phy-qmp-merge-common-v2-4-a463d0b57836@linaro.org>
References: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
In-Reply-To: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=12903;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=iTMp1cFXVu2VMwKZbbpSudi+L/OmjSO/l1qnVbvJSBk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsu1Pc16ygpsvJXf6kcXc2YHQECF3X+uzswrHK
 eTPxvGc20CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLtTwAKCRCLPIo+Aiko
 1dsnB/wMwQK0A6lP+LS3yRUqxGn2N+XNoUtU9+yOCJG1FrQTZzF0j9B2VhwhZHVyfv94AEHUae0
 FqpqJW5HfgeJdGYkvbSwG67dAzffp70zbGrLWhFp7I4+B1y1ZEiJo14iX35f/IbGETMWguMoDT4
 1KsrCUWC2sxrMpmEmdaC6+G1+M2dtBTX59UwX1FbhLS9ZrXhPzUBwf0MusUAE+a+5rVaHE0oC8i
 6wMcDOZczFcWOfnkMzXlazlHnm5EKDzJMMmF/52fZ+XUQWmNm3PfwTQaZPvLwg4W9EQxEIW1ZuZ
 zZhUlrt/9uKgYOh0J4ypDMbXwPIR+l7k1lcqn0zaC5KljVFx
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
index f6e9471da51a..bb961094e41a 100644
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
 
 	qmp_combo_configure_dp_mode(qmp);
 
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


