Return-Path: <linux-arm-msm+bounces-3688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E710808780
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BF1D1C21A07
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445CA3A8C1;
	Thu,  7 Dec 2023 12:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dLWHGeF2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77DF8D5C
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:19:40 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a00f67f120aso101514966b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701951578; x=1702556378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGHV88NHoP25qmFC88bijzEotkjq5kSrfnrsf5gnWnU=;
        b=dLWHGeF2Kxc+sKIpXOC3IxOOG8eUs2xcjCAfWRGg39E9LWY2+JTPt6x7/qsiQnnm6N
         PXh0ENPNMrMTn2pELorfodHA7hT9lpm/GECg/Pj17w32FVYzxKTZrfcwbrSSkxiPxG7j
         kJk0LYrdZy20Sk31kWaSWdIi13Xob/hoHkB2vhP5ZZ4QNsTGYCcJSECpAn9komfivcI3
         hxJHC7dZhmdXzp7mbtKYMSQc1xnTWWS1+UHIgUy8e6eaakCfelCU4CVHwrxG9QKtSw2O
         OKtQ0319KA1X7RJJEyo86INnCdvwiJ7MpD4M0uC46r/boYE2mAfCW6idBYdOcmu+HUAf
         P9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951578; x=1702556378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGHV88NHoP25qmFC88bijzEotkjq5kSrfnrsf5gnWnU=;
        b=AsAnWGCKyEmCCOsMLojde4cv143veUKX5//wNjsmAOap4gjV8atMgOkm7EFim4gEVN
         W351fhjzuQB/E3HeNRm4blvR1cUoqY+NrZklvbV1x6Cr8k+nDiLYS/jDR8YQLPMeuAQH
         8kCpsJ+Wl5EqyVg+bPw970JxzAcpKnZuuTIynRWHXqUWzs112RpkczGmLL0XKTDADOSC
         q0z3mHZFf1pMjikxHwPFljSS1dNSIRVMUioZz3VtzXoDyfJppdMqyK08W9lkjEEFb19V
         0vKLuYedTpK46Ojlf3/zUS9tnM+rFN8Ynj5nbXQBOblL4CMre75cha0llx3OQoRx0wg7
         F5lg==
X-Gm-Message-State: AOJu0YyR/wmyeGJQJ1YCEuhOYxHUgCNnqKmLJuBJ8EuwDMDFYtVXwGYy
	Pv1B7uFePCm5OmO8Mduf3z8EMa1YdKLmpFUf4QA=
X-Google-Smtp-Source: AGHT+IFnTNxL6mh9XIHt4yGAmG86ARKFNFDsH5YoLZO8tS2u5z0k4nEFYqklzW7NXB11j3XKRnCRNA==
X-Received: by 2002:a17:907:7190:b0:9c3:e66e:2006 with SMTP id zv16-20020a170907719000b009c3e66e2006mr1235143ejb.9.1701951578651;
        Thu, 07 Dec 2023 04:19:38 -0800 (PST)
Received: from [127.0.1.1] ([82.79.186.233])
        by smtp.gmail.com with ESMTPSA id f24-20020a170906c09800b00a1e814b7155sm761394ejz.62.2023.12.07.04.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:19:38 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 07 Dec 2023 14:19:12 +0200
Subject: [PATCH v3 3/7] phy: qcom-qmp: pcs: Add v7 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-3-dfd1c375ef61@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2265; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Ge9uHoDuXXvAQ55h+Et8Z8vF4p7+wEMKdaHgdMwEqGk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlcbhPfy4psDwYMoLc3DyHe+itq1ML0mzViRBit
 o0rlPBGk3OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXG4TwAKCRAbX0TJAJUV
 VmL1D/0WeT+S8R8U4i6vg8xjGyNRgBnA4s1WFpuYFKmUOrqyfPkBs84o/+D82xusp/RzemSy5eo
 SuRaHtH9fQr33m2Phe1d4PL12ggWJOCTkvbMalx22cOY9zuTvmJ4gatyCHsDW/2ldI0JWuTW17y
 sYCkdc2TalFLJ9sQwo0jKOhUZng1+j0I1VR02sVricz+A4KtDVtxcT6GxnNWNaEw7Y9blCyWDYT
 5szs0492ExTBQubamm/2zwF9JlO4HZRIRahY85L0UOc99jl/Mdje1oXpgYE9BSTlkUN7BOZwCjM
 RlqZM4DZyPc6UeKQmmzqtdg3mSYRI3MJtyMi+plSJTmnIn+E1lM+oim84AMQ3xY7EbeTXHCXgk1
 ua2BpbaBB+S+bD8ElVdGl4714PSDalUblXWB/NdRExGC3sPJSd0A1HMBwDFVVnUPl9yoax4rwPS
 nTLLj+dU7Ip1HZts2WlJD6W++o6QYeFDoCAZl8SXx+IyThOTeJE04Tt+TKdKosscpmLz47e8w7F
 +U48kLyMG+By8W3nuxmn8wMjeylS6fWIT+VHLLwkCRg9/XZIZs9GYoENpK/VOy5o16claG0/jSy
 L8WjpBSWzo8pUD59SxsWx5EeRBQfA3NI+pXSAftsYiUeOgtIyUrfOJnuKHYpgVySEpgm/04hf+r
 VKbxPGS5HluFI+Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X1E80100 platform bumps the HW version of QMP phy to v7 for USB,
and PCIe. Add the new PCS offsets in a dedicated header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h | 32 ++++++++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h        |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h
new file mode 100644
index 000000000000..c7759892ed2e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V7_H_
+#define QCOM_PHY_QMP_PCS_V7_H_
+
+/* Only for QMP V7 PHY - USB/PCIe PCS registers */
+#define QPHY_V7_PCS_SW_RESET			0x000
+#define QPHY_V7_PCS_PCS_STATUS1			0x014
+#define QPHY_V7_PCS_POWER_DOWN_CONTROL		0x040
+#define QPHY_V7_PCS_START_CONTROL		0x044
+#define QPHY_V7_PCS_POWER_STATE_CONFIG1		0x090
+#define QPHY_V7_PCS_LOCK_DETECT_CONFIG1		0x0c4
+#define QPHY_V7_PCS_LOCK_DETECT_CONFIG2		0x0c8
+#define QPHY_V7_PCS_LOCK_DETECT_CONFIG3		0x0cc
+#define QPHY_V7_PCS_LOCK_DETECT_CONFIG6		0x0d8
+#define QPHY_V7_PCS_REFGEN_REQ_CONFIG1		0x0dc
+#define QPHY_V7_PCS_RX_SIGDET_LVL		0x188
+#define QPHY_V7_PCS_RCVR_DTCT_DLY_P1U2_L	0x190
+#define QPHY_V7_PCS_RCVR_DTCT_DLY_P1U2_H	0x194
+#define QPHY_V7_PCS_RATE_SLEW_CNTRL1		0x198
+#define QPHY_V7_PCS_CDR_RESET_TIME		0x1b0
+#define QPHY_V7_PCS_ALIGN_DETECT_CONFIG1	0x1c0
+#define QPHY_V7_PCS_ALIGN_DETECT_CONFIG2	0x1c4
+#define QPHY_V7_PCS_PCS_TX_RX_CONFIG		0x1d0
+#define QPHY_V7_PCS_EQ_CONFIG1			0x1dc
+#define QPHY_V7_PCS_EQ_CONFIG2			0x1e0
+#define QPHY_V7_PCS_EQ_CONFIG5			0x1ec
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


