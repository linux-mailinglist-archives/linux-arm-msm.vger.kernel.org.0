Return-Path: <linux-arm-msm+bounces-3691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB29880877F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8E541C21D01
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725AF3C46F;
	Thu,  7 Dec 2023 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PL1ZtwNT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3DAFDD
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:19:43 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a1c7d8f89a5so104154466b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701951582; x=1702556382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8/wN9bVDO/fT20ixO2JSLBwr82UnvTKWcapBaXM3F4=;
        b=PL1ZtwNTzc2+wi+bibQoXq2hergR+BWvfeLcN+VmgGCLfaRc7MXu9og+ULxaUdHfdv
         K1nRQAS6D0FhZVVxulKj1LseX7+EifPuT63HfTIlgGfzhUy5GQGhagFnU7q2Sy3pqRMc
         ddznF53gZisoVSX6RnIx/SotgIb1zDcmTDN1RTRSh47ZweJxGAbWAL+qcLymLB127HI8
         QSvLJojOJxXuV0inRCwCT6Di9xLRtv9tZRw7fFps3+9XGHREz1Hvv2uqbnp7RGB8yMSD
         1HJ1dVdR/YR5INboeNVfXVa0+wFKN6Yr3RPSgEqr1z2SMymzXmaXV8znir7vETZ6UoX5
         Vz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951582; x=1702556382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8/wN9bVDO/fT20ixO2JSLBwr82UnvTKWcapBaXM3F4=;
        b=XxJhUSMvhitSpbmbZd2bIyus0ZbS81NgyKawL2lAHpGh/WIOL+zQYrchL+aenb9f/0
         6BZFjFMMpQCvN6lxWG8xIwNdAHXfljPchQ9r+M4WB9yxwfNuwJ0EiKg3W51qGigv5mTz
         TXnt3/dYlxYl+3tZoYLhFqE+8+esisFuQ7PCi/2n549WVhPz2jL/dUbLFYxdYwWa0+3R
         A5M9m9iSauVO001zS+fvJ3YOOgPjCYrlRsGhIVVRRBfy5f5nsp4GvSv9aA8KsQDb+hLc
         jPc2LYpSaA450QALQ/nur48e2OBsG9Yj/DM/90NPn4T5+Qfw5k8bqLunLC6liQtF0c4/
         ubAg==
X-Gm-Message-State: AOJu0YzW1NvA94OZ5fGCdN7UKkXcPHbqF/EapJJbeXlNInRHjg5nbd7j
	OEE+HtEOewJUHVdy8OfoXKfzgELo+InZnrh+Uu8=
X-Google-Smtp-Source: AGHT+IFM4jfhmjYf4Mr1kYFBvBAD+grQ/qtplvT+cAK0RXakzXW3dxwq4ULR/FPsbKFcz8j/n20www==
X-Received: by 2002:a17:906:73d2:b0:9d3:f436:61e5 with SMTP id n18-20020a17090673d200b009d3f43661e5mr1841709ejl.29.1701951581963;
        Thu, 07 Dec 2023 04:19:41 -0800 (PST)
Received: from [127.0.1.1] ([82.79.186.233])
        by smtp.gmail.com with ESMTPSA id f24-20020a170906c09800b00a1e814b7155sm761394ejz.62.2023.12.07.04.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:19:41 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 07 Dec 2023 14:19:15 +0200
Subject: [PATCH v3 6/7] phy: qcom-qmp: qserdes-txrx: Add V6 N4 register
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-6-dfd1c375ef61@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3441; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=mP9L6SpjvbccTHuSpfnLLqvU2TjJIjDbq/c6nbRWGbY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlcbhT6HtWXSLcyCrc1rPAIG5k0A7Aqpz1UiuVn
 stZx52K9lOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXG4UwAKCRAbX0TJAJUV
 VkWaD/4oTYB78IX2ull9QOh/gUlChoWzOkm8FSM57hA++T1WkbykJlyP64dzTB5vtnOAnTQrLCs
 MNGmGZZ1FkO43Gk1RtkDdltfOGFQrnF58TAeHmATijghVFssRU7HoQOlkoUQ+fIuUzKfqnLzkgx
 ewiSR1jG0cAZMjUFEpektIvdYHlFWXytRzB8b9LzWghly5XvCr42Z6SZTLt8owDt/VNFy6f15S0
 MfbzzFVbAMPtBeaJEhunGE65GEjyrFagCizYt+upuHJFtfx5x1Fi9aj0KiGA9fsrkYpbaWWik7T
 veDOjOIGGNytCwrPe9gVf9tZBDMbckRswl3LLlxoAt6yeoQi+9pD9OCjZjEcBfU2Kbqg8LWD7A0
 k1PHtoNGehmnTP3/mZn1i7Ihx3FC+/3A+PRvPer75wcOvKoORLa6EKKMaTiOQCxW90wJAzu03KC
 eli3jlZoU1DPCjwPQ9I43oWGcr7+0iYOiqnXK1sETyIeH7cOBBuluyK/Ie4jUOSLn9TKun3ZWPM
 npobcNTMEmtLoLNWPMi5SvHg29Sxj5dtoSTBrS/JYiZ3OwBiP63rOxf306v/q5+ppXo0eU+M0aS
 7XREsSEcWghj4klSEbmgUVYFJPIfkYdxND+1btWuNJL0ugXUJ+64kLq7FJn0OciP+q7saf2ojUY
 q6xG6fA/HGXFjRA==
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


