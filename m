Return-Path: <linux-arm-msm+bounces-1468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD937F4328
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C4F6B2109B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FD24B5A4;
	Wed, 22 Nov 2023 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y5Ne4A81"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21EE1A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:04:13 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5441ba3e53cso8985494a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700647452; x=1701252252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gs74nhLMj2XOqoIIaz5J8r/tU6tBKU967K+bEMRbRRU=;
        b=Y5Ne4A81h+AlFMJfuqbOT2z3jg+LOhk92/llClIcueKEvRYt0oOKlIFEc+azxdB2PU
         GUS1+KKcuHS0DhkxtZOigDD6su+ftUcXfXDXejoHnRQb7XJwXgtArGvy9hiZhSOBHdQi
         bxGn09SHZlbTfPvLrofmfUDfACqIrOe8qZ6nedEvy3p85vFfN4Cp4ldfvt2N82ZKADdf
         CdERUSJB4KH5bffoEEEADlnd2+0Jf88YQfZmO9M/UDxFH2ser1xtretA8REEQE6zMB/3
         TfI7DLRgV4LJmv0FFszhGotKe0fzLX9eU9wfZkzciq2gAxmhA1mM7Pxq21y5qGRelzvh
         wTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700647452; x=1701252252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gs74nhLMj2XOqoIIaz5J8r/tU6tBKU967K+bEMRbRRU=;
        b=X20RvrfHW20gtU0tEReR6RQwywmZuxrNhno3sTZ50hBgk1jlFM0DBn6P1fMB3/6RaD
         uB/i8ETyrsCug/HekJXAYsCaHAyZV3TzZ2gYcQzjnrZzPO+XHHEqmjUWLsZg+19UvRWw
         5KomfhmuLNADN7Zku1/3h9jWnIzJePfvZ0GORG2M8cBIvAME1ovNOBnwnsT28PF2x5LM
         k68oY8Uj1ePDyxlhYDKy4mA0CueZJYOqNY9YET9wxHZLzHs+tRqhLxQaj2rWeU1kP8UX
         dtSk3w2OvrWJnuLP2Xk+i0xV3yWC5AF153wVyDw/T5FVnWrCtaDeIx41bOFPF03caH14
         qyHg==
X-Gm-Message-State: AOJu0YxgRtVZxSfx/uBHMZsYTWduyI20ivclE7wlqGWk8GQ1UFl80cw/
	Wij3dSAZmUXKF3YnFx8HvPk11W0mztv1ES7j2UU=
X-Google-Smtp-Source: AGHT+IGnBXCwpSo+QICY+RaccJY5aUjpMqdtRI6/hjX3SMiQ4RSSW786T+VXtRLYu6339Vvn6DfjHQ==
X-Received: by 2002:aa7:d40b:0:b0:53f:1067:4b94 with SMTP id z11-20020aa7d40b000000b0053f10674b94mr1210582edq.18.1700647452250;
        Wed, 22 Nov 2023 02:04:12 -0800 (PST)
Received: from [127.0.1.1] ([86.123.99.122])
        by smtp.gmail.com with ESMTPSA id o9-20020a509b09000000b0053deb97e8e6sm6110456edi.28.2023.11.22.02.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 02:04:11 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 22 Nov 2023 12:03:55 +0200
Subject: [PATCH 3/7] phy: qcom-qmp: pcs: Add v7 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-3-d9340d362664@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2052; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=V6EysvvuNt83o5PfcG1W4aH/vaCeWPRnMZtIEulp950=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlXdIRxZOW/+70Z5s06jRtjlJ09B49/GOfiwYNc
 kl5f3P2mjeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZV3SEQAKCRAbX0TJAJUV
 VknCEACCqDgG7NxNoVuO/sYZzX/QZidYFsUkcz7CsL6TxJSkbrvnHPCJECALRaJRFHb4kYJjIhn
 jZiUV7Dq+6q1BEQH6mnCL9hwDngSTk4URxZDb5OkYfSegsX45DtVmd9qU4Pg2HU63xrRYullRxP
 T0DLPOoWfg44cPPA+YfGpLTPhnTllKoJJcA/N8N61WLpMLdi0EMseQD96cBRNFQ3T+lhZG3CXqg
 RbH4jFoBgWobY9aTe7LjZEMA2FuVlhHqMkLYMMYPVSHzUdiR/QNyL5l4ycQ7u8SdBfuSqf8eCIi
 Eg6DHF8ymw2Ag+1BdnjRtizvHDzUVZsESHDOwIfag1d4Aa3k0UU6XGpPbKmVvH/hWMzT0tvQ/U2
 gsAsUwnEmQKoNpg4jmyFmaCLcuFCuKIeRoTmRxABY5X4GZ6HCcLx/JyV0y6elg6BQla2eYTzTWO
 ixTRDysYRhOadnRTiw2FMVaGgVD6bGlozSvtxzP2bE9wrkuq5m2EgXj6iZQO4PwKoj/TGyLBZ/o
 JTLbt4io6oiDMKh1y+YMxOikcQDcL+0M2B0xfLDVSecuWGnG3qKCSy4fhDanHYdseBovZ/tKx30
 xrAAUZLfoDY6Pi0hl8ee4ByhC2/G0fV6L29sWRnbW/yvWJfswFOfOBWXZULkaFO/peOErJDdLCe
 SztoX4WzawHFGTA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X1E80100 platform bumps the HW version of QMP phy to v7 for USB,
and PCIe. Add the new PCS offsets in a dedicated header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h | 28 ++++++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h        |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h
new file mode 100644
index 000000000000..520f28d802f6
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V7_H_
+#define QCOM_PHY_QMP_PCS_V7_H_
+
+/* Only for QMP V6 PHY - USB/PCIe PCS registers */
+
+#define QPHY_V7_PCS_LOCK_DETECT_CONFIG1			0xc4
+#define QPHY_V7_PCS_LOCK_DETECT_CONFIG2			0xc8
+#define QPHY_V7_PCS_LOCK_DETECT_CONFIG3			0xcc
+#define QPHY_V7_PCS_LOCK_DETECT_CONFIG6			0xd8
+#define QPHY_V7_PCS_REFGEN_REQ_CONFIG1			0xdc
+#define QPHY_V7_PCS_RX_SIGDET_LVL			0x188
+#define QPHY_V7_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
+#define QPHY_V7_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
+#define QPHY_V7_PCS_RATE_SLEW_CNTRL1			0x198
+#define QPHY_V7_PCS_RX_CONFIG				0x1b0
+#define QPHY_V7_PCS_ALIGN_DETECT_CONFIG1		0x1c0
+#define QPHY_V7_PCS_ALIGN_DETECT_CONFIG2		0x1c4
+#define QPHY_V7_PCS_PCS_TX_RX_CONFIG			0x1d0
+#define QPHY_V7_PCS_EQ_CONFIG1				0x1dc
+#define QPHY_V7_PCS_EQ_CONFIG2				0x1e0
+#define QPHY_V7_PCS_EQ_CONFIG5				0x1ec
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 71f063f4a56e..21f6a56e7ae3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -44,6 +44,8 @@
 
 #include "phy-qcom-qmp-pcs-v6_20.h"
 
+#include "phy-qcom-qmp-pcs-v7.h"
+
 /* Only for QMP V3 & V4 PHY - DP COM registers */
 #define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
 #define QPHY_V3_DP_COM_SW_RESET				0x04

-- 
2.34.1


