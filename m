Return-Path: <linux-arm-msm+bounces-1472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B187D7F432C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D41441C20A66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D695D4B5B2;
	Wed, 22 Nov 2023 10:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aTj7ezFS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569FB198
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:04:16 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-547e7de7b6fso1334861a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700647455; x=1701252255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDiRJ+3ohSGmvqN98Ow3ORvrYhuPBxUUkNt9gsWpN/4=;
        b=aTj7ezFS1ywxRZrP4VHO8laDl6/ktq2XCcTBB1hU1pC1xqLh3aTrphOHWaVc9nNPZv
         2qEaRVb0tvZL1yHRgOCWAZy3muaxQNnT5mpULT5Gs3y/P38n6OWbdsCoVizQPsgsrkLk
         eDsdZNNcf6kI6vpI7uqayOh6pNOnE36Ct7m7oaEJADs8qle0UYBI7kCfuOGLKXIaC4ae
         L2X3tlwbAVrtfW0Lz73JYBDDnQNhc5wbqtyzhbED4IhyOKyWDxf0Gxh/EfDCkT08Ez8c
         6Qusr8fNq5s3KnGFuXpFX4FUgL++6KUj81mAoDcDUI4rWpUyriiYdofz9GpgYObXhrrT
         hTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700647455; x=1701252255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDiRJ+3ohSGmvqN98Ow3ORvrYhuPBxUUkNt9gsWpN/4=;
        b=E8ZD6znswFVP+GoYOX2BbC7gtQ0Fov3NPhChF/mqhjVFJY8HszoLR0N0TT3GAzCKOd
         S4XQgCoNhQMZQZb2GrgUXMSesE7uUSeXffPaGZnEhnJliJSb/7WraBcr4DVOCsZAe+DB
         E43WPo/u7xFLAuuTtVa3wU04oC+A6qy93Q3l7ezooDG054WY12MPnVGTodplB89IxRr2
         9PH5E9VvWcPlfdL6NPP1izQ0ADFdgtjXMQN4jEOP+JSgjqxogJG6op8BwHj3EuO8ibf8
         LlM85gRL9OVneJKCN3tt7LaKhKOFmp08h5uOxPXhKTZ7JxYl029ysW4vGeptFp2V51WX
         g/+w==
X-Gm-Message-State: AOJu0YzFSx2xfXPHWqFn86AsbaQwzu3gn0EDNvA5pwuM8/RzYTK06wCP
	k5ErPINpF4fSKEbeVEdoxz0nuQ==
X-Google-Smtp-Source: AGHT+IGm3bcxmbKWW4SG7sozK0aYHHmIq6aNe8fVn/CSn9aQ6YSD+sU8cVw0vhjZf3el8k4WrKYQrw==
X-Received: by 2002:aa7:c249:0:b0:545:52ff:edef with SMTP id y9-20020aa7c249000000b0054552ffedefmr4276961edo.20.1700647454806;
        Wed, 22 Nov 2023 02:04:14 -0800 (PST)
Received: from [127.0.1.1] ([86.123.99.122])
        by smtp.gmail.com with ESMTPSA id o9-20020a509b09000000b0053deb97e8e6sm6110456edi.28.2023.11.22.02.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 02:04:14 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 22 Nov 2023 12:03:57 +0200
Subject: [PATCH 5/7] phy: qcom-qmp: qserdes-com: Add v7 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-5-d9340d362664@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5077; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=SqXIhA30CiithXVD8pBM0Al/ZUxSuZmrG0Sr19NhYFc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlXdIUgAgR9hZX7dlxr0zP2fQL30g2dMJHbKiL/
 59XzR1VusqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZV3SFAAKCRAbX0TJAJUV
 Vln4EACfXWF9UmIL7wllku8jMQclXbfwReetu28UOS3Kow1J5UJUKR5brd9/MFxGM6FtCdukbqe
 odeu9VLSAS6Prs/dftRShH5S2GDjpQFHsQkf0RIrXl9tVUEFfgCXYPxMhpuAARylIi//waUezKK
 5ZWS6P9Yrdtvpf0ah3CIUUlMoU/JpA4QroaBnHe9V8yXVlcf+jz2gzi9FKdLUa4aZTx6961DEwH
 /vBBIOXOizlfVtSFk6fdTV670tYiOxmJA5SJtmExg7wCAEBr30SJFpD7m9AQXWVCJrhkro8A5/C
 hLs9fLkZzYMJ52fpUzr6RZExG/4cW6aSd+GLRda/lwHvh6KIs6AzUhOy157e0kdY3W+Ibep+ZgE
 MetexKwRS67WJlZ5U4WR+h87PDxxBgJsfKsD52R/+EwBCXKk0LG7C7T/pUXFpODbTccoahBxYTb
 KL2pdwQFqdEaVjCiGYBM07mdPzE1QO4Iyltb7W+NhNf0vKH8HyNDFoaBEYASAIbkHIzWnAEKeyM
 5Dg++awRnZTkA9CRqVF4JLRQKMRJoMMU3cAzqHEQzVwlGDcaouJ5gvApxnPm1VnMBdpYUMj7wa1
 2DeS5V4pB41HR0ZufkoUC7L3m98msGSC07OHRUcFDmyI6f/6VI0nR1fojA9elxcE5aNncq8ZFFO
 7mSkZsLwZCe4OKA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X1E80100 platform bumps the HW version of QMP phy to v7 for USB
and PCIE g3x2. Add the new qserdes com offsets in a dedicated
header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h | 86 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  2 +
 2 files changed, 88 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h
new file mode 100644
index 000000000000..c8775ca1ab6b
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_COM_V7_H_
+#define QCOM_PHY_QMP_QSERDES_COM_V7_H_
+
+/* Only for QMP V6 PHY - QSERDES COM registers */
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


