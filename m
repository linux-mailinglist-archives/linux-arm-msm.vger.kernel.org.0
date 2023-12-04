Return-Path: <linux-arm-msm+bounces-3264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9AA8033F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27442280FCE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5354325546;
	Mon,  4 Dec 2023 13:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YyhRklG/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 775B6194
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 05:08:01 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c09f4814eso15059175e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 05:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701695280; x=1702300080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUks0VPbd9cYN7vszIiBuJ+mQVO4/oWNE01Kkc+iAPE=;
        b=YyhRklG/zHjIAoYyiIoq+useOhy/J6SIE0U9gMoYk3inYkmLYqyF0htPEDrnz01FZ5
         YeBHjDed25348xQjJhU6G5kzGmXbdO/ql43QzH8AaQ/qNQo7ExT3eRvEpx75UEAgzUP4
         Fg7u5TBtb+60m/QWrr9BovJqlcC5WZBdMrVJfmrxJNFphvYxWoGt0tMptZrTJtyOQ7GN
         yHXTbmTNrkglrrhGRUaWpiEq/ym/avJzyk7RQZjbFHX58aDjYRz718TJ0jhT4S0I+ahV
         BIrgvwlYauLbqvkUJ9KtnWTpyCC3Z2FR2hg+3xKFYTt0mvv6YJepPnmYoz9IRBNg7Tk+
         XRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695280; x=1702300080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUks0VPbd9cYN7vszIiBuJ+mQVO4/oWNE01Kkc+iAPE=;
        b=vbc6kKuSx3ecMFt8HJMvwUjIPHZL88O8lttRb99uXUbkviP41PW1T/NJGzCDaS9xA1
         8W47dYoME+eIKr+RqWFIHA1DX5w84EW1Tb0L/umnnUKZgn+V1CRaxTQiCxBW5ewW5KD9
         pkt+ytZXoyzwMvVIAUOMCB9lmukJKLx3Crs5VWKZD/7l23rQ2uQ6cDL2hdFaFXBarhYL
         6J9Zqcc5pqouK1RgPRscnYvhbetRcBEbdgOQtRLln3pU00+gSVu/jQpjDi7iio2QA1ZP
         DmZbHHxMJFWkk7lRGOMgr/Rnq5wZ2h3drGByAFzNV1S7Zn+a9kv+EmoiF3NZaEoVq+6J
         ewMw==
X-Gm-Message-State: AOJu0YxkIvwaNXL3zkgmylThhI9Uo3lDsJynQSn2XO+ZOV0nI0roFQkL
	Feju2e/nkxDukzZ3A2Zy8x84hg==
X-Google-Smtp-Source: AGHT+IFM0QwwCk8522Vl3t4aRbxd9Q+q4yyucz746KxdgT4MpgGYyFNAZFhvVp/Nwh8zfZev+tmAwA==
X-Received: by 2002:a7b:c857:0:b0:40b:5e59:ccad with SMTP id c23-20020a7bc857000000b0040b5e59ccadmr423442wml.142.1701695279957;
        Mon, 04 Dec 2023 05:07:59 -0800 (PST)
Received: from [127.0.1.1] ([82.77.85.67])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c4f8a00b004053e9276easm18494166wmq.32.2023.12.04.05.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:07:59 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 04 Dec 2023 15:07:39 +0200
Subject: [PATCH v2 5/7] phy: qcom-qmp: qserdes-com: Add v7 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-5-21956ae0c5c3@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-0-21956ae0c5c3@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-0-21956ae0c5c3@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5077; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=4NLR4VFQwo4+fX7UwBPIiMq13lp/lzmGWpiGVxHOxcA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlbc8l1+QvRIvoYU4BHdmt5lsW9MqdkS82wkNOD
 I/RF6dwMoOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZW3PJQAKCRAbX0TJAJUV
 VvE8D/4kT2ifTcIAdfsBcf+LM4L0G7TndZkVJox9hn3jld3QtHxxah4jSkGFk1Q0E1Qw+Wn7tPG
 olswtGk47KAQFpB64L/0mnsSg6ORQwBEP9tvnvQ+suuieuEsDdR1rtHsP/iultNPMgpurjYeicF
 ByMhP48WgJWI0gxnha9weMMs8bdNfaTvlZpwWG/Oo6klSE0PjjSkUcJZ2vfpkU3laX/apLxJIYi
 dn5V6M8eweTEKy7tdc+dgJO+3LXLOq5YTxp62DCZmd3CCVAqMdLoCjkm1M6+H2DARbgpK8KivTG
 ZZN/wwSJChMx/+VnYCj/ijR2UqrtRCXOxcJ7aU/Chst54tIrbKnhL2oXZjYLadsKgst3M7jXrB4
 zpr7MNuFqr7bASZRsnTUybt2vDDrJCvCcX2TDKXWYpd0H/X4jSJzitNEdEHdf8T5LzEh2pj1hUG
 XoSOIg8Xti7l4ImK/n/Sx+YIp+8HGggOcQuiUFeGoWIixqOhAYB1dHssiIrVdGAHqACgJlq85AA
 8FKHt6irlVilmm9NG+XYsrbuOO0Jem3Qc54ZcF6nHl3oJI+NRrDa/Pzx6wJPWl9wZaWYNlwkunW
 KVT8bw6g+p7corClfaSg89oZHQu65qJHZ/tC3baIg3IiUxOaTmxVGznoDJbISe74SHxpyOefUeX
 UTNHCkAhTWyTDmw==
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
index 000000000000..9fe7326e4190
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


