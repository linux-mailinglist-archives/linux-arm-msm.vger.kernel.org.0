Return-Path: <linux-arm-msm+bounces-3690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DDE80877E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43D621C21E57
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541F339AF9;
	Thu,  7 Dec 2023 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="he+bb/yh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C1010C0
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:19:42 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3316c6e299eso862347f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701951581; x=1702556381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/847UUBKrJxQjcvEbcGghrvmsfONNtFOEIMLRYas9XA=;
        b=he+bb/yhKpYIeI4o/GHVl2pJLTHFFytVtfQPZzRZn561wOOLLO5XcGLK+BYZnZhmyz
         Ah2WzcVSS6G6ow+fLyEO4G6v8oWkoChbv/DCj79On2RdFa/xqLNX5h9dDCctRxYRgzCJ
         x/cLYkPPR3wAZNwUDGN3v4eoAsjeA0X3rYQkDkTSECcMtAL8jv5wRI+QIH6uJ5klgEvf
         IE0mjVC5e/9TeUc2UUXOv8InOcT9Abxs+C/4BWNqnHwNA04v7CVqgQLZ7N/TeExqnvFM
         x05FPSmmLRTi3fX996u/cbCFxLr5f8dpGRnpKoh7SvrIyG0TVN/bMeRbz1HObBDeL8vx
         N6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951581; x=1702556381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/847UUBKrJxQjcvEbcGghrvmsfONNtFOEIMLRYas9XA=;
        b=cxb1fNASttjsqmZMqdV23wUvokwoGUfsVDgIJnldMIeFc/jvpUZKoeQlwUhaJ5xGWi
         L6SbELxeSh5IV3EPBfjDO6XN0dIX0bz4X5hrcyOxg+4nXB5I6lOMlPYKFu6U5I3BI9jq
         Ra4FAKB0Mef4X0EuxtrwK98Qxcn20tWOgaRYlpDC5WuyuHZZ+uePg3fn9Qdcr/gCYxJO
         FAruwntKTqYi2x2A5/9FTKb+DULtitlyHrgb14PtZaci6ncfWFgMWOxkSYetCS77Ipc1
         057k0bp2R/26Que2w0Q+tNI1ZwVt/KwHshOW8YEsBA1qb2P9HoIH77FG2iq+7Qa0fBkY
         1ULQ==
X-Gm-Message-State: AOJu0Yz679ZPNu3a+oPgniCl3bsRY+d7+c/h5w8Cy8SdSoxIKIAMth4q
	l9kLn7+3otDQN9lTQ2fOR8uxQk6ndUhbKiJBaCw=
X-Google-Smtp-Source: AGHT+IGESRKR5AA2BcJOplRlThrGcNEPb7a2DM1e0LBvFzSxmhoeFJ5ZAjFbcSk8n4b8ZqkvXCe4/w==
X-Received: by 2002:a7b:c40d:0:b0:40c:2787:571e with SMTP id k13-20020a7bc40d000000b0040c2787571emr508867wmi.7.1701951580836;
        Thu, 07 Dec 2023 04:19:40 -0800 (PST)
Received: from [127.0.1.1] ([82.79.186.233])
        by smtp.gmail.com with ESMTPSA id f24-20020a170906c09800b00a1e814b7155sm761394ejz.62.2023.12.07.04.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:19:40 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 07 Dec 2023 14:19:14 +0200
Subject: [PATCH v3 5/7] phy: qcom-qmp: qserdes-com: Add v7 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-5-dfd1c375ef61@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5123; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=spj3SEZE9avoakL3mG/7gzlt0L9zUbhEjx52FhOjp5A=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlcbhSt3jh2LJYLeK0gHEe52rsw0BnQGkWnr3L+
 EPXPmv69r6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXG4UgAKCRAbX0TJAJUV
 VqdLEACOd10mVUjDZxM9rSCqgCld6oO/moT/lbW2cBemnItYIBGTD3jSU4NEC+VfCODyzDT+Ab1
 iAgCYc5PSS7R5cVLf+ZdgEq0lpcdIYjyhkpbbJMpiBgAD/8m9eqskhhMpg1s59OQ2MLy+zs6k0J
 rODzROj2P/9T2J3fnYCvaXT8YkBIESr1Iihv4qpzn+twoOSHlqwYv77tCpw52Y/mpAbeao3/o0W
 Te+eUBlKg6WETjfLaYMh9upZfw/Sxw1h49B/ukh7IaPDQCMuV/AX38Q7RCkMkDXtVmfghRmjuPr
 mK3HYM5AxHsDHd6C2GExfaePn/RcK/LTB4cFGvE1r3TcMhYjFsZfXBWkqD/R3q5fmRJqDPV+Y8I
 Afz9M+dIuslt3vRzAwuGQW89oMFeotiEzrUZ3YFpUKtaYz5sOWHc004oYGiU5PaI9wzIJeHO/8U
 hPzYFkzNFKOvOarKYpJlaeoDG/Nti4sZef4A02pBbrBfKE/LyxZjycULXP4H5q6Ws4R/9bLvpZA
 SJs1e7Mcep/hYppi+JiLfduoDpMNqGC9SwrRM2Ev3HuqWTuqaUwTb+wdcTU750mgy6tazO61Gf6
 3QsvJE/GN3a5PJl+9TjN7hU4ARv8Ua0gImXQzwqBO8PH46UnEGjsi8bu6TaN3/CDH7THeqs/v/B
 smlbyD4jFRN51QA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X1E80100 platform bumps the HW version of QMP phy to v7 for USB
and PCIE g3x2. Add the new qserdes com offsets in a dedicated
header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h | 87 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  2 +
 2 files changed, 89 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h
new file mode 100644
index 000000000000..7430f4921477
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_COM_V7_H_
+#define QCOM_PHY_QMP_QSERDES_COM_V7_H_
+
+/* Only for QMP V7 PHY - QSERDES COM registers */
+
+#define QSERDES_V7_COM_SSC_STEP_SIZE1_MODE1			0x00
+#define QSERDES_V7_COM_SSC_STEP_SIZE2_MODE1			0x04
+#define QSERDES_V7_COM_CP_CTRL_MODE1				0x10
+#define QSERDES_V7_COM_PLL_RCTRL_MODE1				0x14
+#define QSERDES_V7_COM_PLL_CCTRL_MODE1				0x18
+#define QSERDES_V7_COM_CORECLK_DIV_MODE1			0x1c
+#define QSERDES_V7_COM_LOCK_CMP1_MODE1				0x20
+#define QSERDES_V7_COM_LOCK_CMP2_MODE1				0x24
+#define QSERDES_V7_COM_DEC_START_MODE1				0x28
+#define QSERDES_V7_COM_DEC_START_MSB_MODE1			0x2c
+#define QSERDES_V7_COM_DIV_FRAC_START1_MODE1			0x30
+#define QSERDES_V7_COM_DIV_FRAC_START2_MODE1			0x34
+#define QSERDES_V7_COM_DIV_FRAC_START3_MODE1			0x38
+#define QSERDES_V7_COM_HSCLK_SEL_1				0x3c
+#define QSERDES_V7_COM_INTEGLOOP_GAIN0_MODE1			0x40
+#define QSERDES_V7_COM_INTEGLOOP_GAIN1_MODE1			0x44
+#define QSERDES_V7_COM_VCO_TUNE1_MODE1				0x48
+#define QSERDES_V7_COM_VCO_TUNE2_MODE1				0x4c
+#define QSERDES_V7_COM_BIN_VCOCAL_CMP_CODE1_MODE1		0x50
+#define QSERDES_V7_COM_BIN_VCOCAL_CMP_CODE2_MODE1		0x54
+#define QSERDES_V7_COM_BIN_VCOCAL_CMP_CODE1_MODE0		0x58
+#define QSERDES_V7_COM_BIN_VCOCAL_CMP_CODE2_MODE0		0x5c
+#define QSERDES_V7_COM_SSC_STEP_SIZE1_MODE0			0x60
+#define QSERDES_V7_COM_SSC_STEP_SIZE2_MODE0			0x64
+#define QSERDES_V7_COM_CP_CTRL_MODE0				0x70
+#define QSERDES_V7_COM_PLL_RCTRL_MODE0				0x74
+#define QSERDES_V7_COM_PLL_CCTRL_MODE0				0x78
+#define QSERDES_V7_COM_PLL_CORE_CLK_DIV_MODE0			0x7c
+#define QSERDES_V7_COM_LOCK_CMP1_MODE0				0x80
+#define QSERDES_V7_COM_LOCK_CMP2_MODE0				0x84
+#define QSERDES_V7_COM_DEC_START_MODE0				0x88
+#define QSERDES_V7_COM_DEC_START_MSB_MODE0			0x8c
+#define QSERDES_V7_COM_DIV_FRAC_START1_MODE0			0x90
+#define QSERDES_V7_COM_DIV_FRAC_START2_MODE0			0x94
+#define QSERDES_V7_COM_DIV_FRAC_START3_MODE0			0x98
+#define QSERDES_V7_COM_HSCLK_HS_SWITCH_SEL_1			0x9c
+#define QSERDES_V7_COM_INTEGLOOP_GAIN0_MODE0			0xa0
+#define QSERDES_V7_COM_INTEGLOOP_GAIN1_MODE0			0xa4
+#define QSERDES_V7_COM_VCO_TUNE1_MODE0				0xa8
+#define QSERDES_V7_COM_VCO_TUNE2_MODE0				0xac
+#define QSERDES_V7_COM_BG_TIMER					0xbc
+#define QSERDES_V7_COM_SSC_EN_CENTER				0xc0
+#define QSERDES_V7_COM_SSC_ADJ_PER1				0xc4
+#define QSERDES_V7_COM_SSC_PER1					0xcc
+#define QSERDES_V7_COM_SSC_PER2					0xd0
+#define QSERDES_V7_COM_PLL_POST_DIV_MUX				0xd8
+#define QSERDES_V7_COM_PLL_BIAS_EN_CLK_BUFLR_EN			0xdc
+#define QSERDES_V7_COM_CLK_ENABLE1				0xe0
+#define QSERDES_V7_COM_SYS_CLK_CTRL				0xe4
+#define QSERDES_V7_COM_SYSCLK_BUF_ENABLE			0xe8
+#define QSERDES_V7_COM_PLL_IVCO					0xf4
+#define QSERDES_V7_COM_PLL_IVCO_MODE1				0xf8
+#define QSERDES_V7_COM_SYSCLK_EN_SEL				0x110
+#define QSERDES_V7_COM_RESETSM_CNTRL				0x118
+#define QSERDES_V7_COM_LOCK_CMP_EN				0x120
+#define QSERDES_V7_COM_LOCK_CMP_CFG				0x124
+#define QSERDES_V7_COM_VCO_TUNE_CTRL				0x13c
+#define QSERDES_V7_COM_VCO_TUNE_MAP				0x140
+#define QSERDES_V7_COM_VCO_TUNE_INITVAL2			0x148
+#define QSERDES_V7_COM_VCO_TUNE_MAXVAL2				0x158
+#define QSERDES_V7_COM_CLK_SELECT				0x164
+#define QSERDES_V7_COM_CORE_CLK_EN				0x170
+#define QSERDES_V7_COM_CMN_CONFIG_1				0x174
+#define QSERDES_V7_COM_SVS_MODE_CLK_SEL				0x17c
+#define QSERDES_V7_COM_CMN_MISC_1				0x184
+#define QSERDES_V7_COM_CMN_MODE					0x188
+#define QSERDES_V7_COM_PLL_VCO_DC_LEVEL_CTRL			0x198
+#define QSERDES_V7_COM_AUTO_GAIN_ADJ_CTRL_1			0x1a4
+#define QSERDES_V7_COM_AUTO_GAIN_ADJ_CTRL_2			0x1a8
+#define QSERDES_V7_COM_AUTO_GAIN_ADJ_CTRL_3			0x1ac
+#define QSERDES_V7_COM_ADDITIONAL_MISC				0x1b4
+#define QSERDES_V7_COM_ADDITIONAL_MISC_2			0x1b8
+#define QSERDES_V7_COM_ADDITIONAL_MISC_3			0x1bc
+#define QSERDES_V7_COM_CMN_STATUS				0x1d0
+#define QSERDES_V7_COM_C_READY_STATUS				0x1f8
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 21f6a56e7ae3..3a0512c3e07a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -26,6 +26,8 @@
 #include "phy-qcom-qmp-qserdes-txrx-v6_20.h"
 #include "phy-qcom-qmp-qserdes-ln-shrd-v6.h"
 
+#include "phy-qcom-qmp-qserdes-com-v7.h"
+
 #include "phy-qcom-qmp-qserdes-pll.h"
 
 #include "phy-qcom-qmp-pcs-v2.h"

-- 
2.34.1


