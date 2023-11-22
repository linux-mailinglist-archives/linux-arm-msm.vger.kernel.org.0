Return-Path: <linux-arm-msm+bounces-1473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF2E7F432F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66B7FB20F76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61BF4B5C1;
	Wed, 22 Nov 2023 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZjJT1Xr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60BED53
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:04:18 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo9502686a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700647457; x=1701252257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aoX5uB+BF3efXMI0yxqwvmNtTa7dNWj91nG0J2f2fYs=;
        b=YZjJT1Xr79oo3jVpMPQ1a/vcDf5Gq7olN+18mckh8FjnrfJHhqa7ICJ3XOZ0orEJKE
         PjMbSOhgmcAQGfYE94gAFB2+GrAiZXKqDLs1765HI2c7dO3y1UBfgEAUTJejn+hb0lzJ
         EtXLJ0/xDTiJq9tlR76DaEAiBwd+z+PdELEmuW0MEfz2dcjFXeFnXcuSDcGWdNIXuN0k
         ivRFszvE44kheurSObh5sLj7dwqIxbRIJg35f6NI3CqebhE2Bz5YcEa4PLVcsrIEB+44
         nGaHwywOnZudZEiM3jG62txVUSV7CORedp20PmO81KsgivBaLBCfvdanLtaSQTJJ5u+E
         xNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700647457; x=1701252257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoX5uB+BF3efXMI0yxqwvmNtTa7dNWj91nG0J2f2fYs=;
        b=tXROWUxUuXytV6IIemSojS50vZRjT8vhSPxDUtsaMI5ypIxGycSATJtGdsBwRN9R/n
         NuE6oDXiWMtk7IlL7gBpyF+V+ZPOhgz1WENacDA44/nl0MK3KiFauqDSfvRyvrSFWOpd
         PWii3DmjbbVl+QJ215bjPMAnEb/scOPA55AyE7SDY6/slFzbMDIcele25nCueeiaW/4P
         RODlbdmR59zSsDBtZVU+srZbJWHwVVKPBqxKFjokviPrA/NFyLdsNNOrZe3g3UjD/FUb
         G5JRjM8F2VKwBacta2poFIqL01PKeFw/8jHPWm5S/s0iQpQ1wlyMsWeVFY2OeHa/iRaE
         RgKw==
X-Gm-Message-State: AOJu0Yzmy2UKf/I8eCoow/8f9khCFXdNaX+EX4N6/TJ6RfOX8TM1YBJh
	sie7N5O8A88MXgVigeVZwQCH1Q==
X-Google-Smtp-Source: AGHT+IFvspBRkaxaPwVPBpdyZPYwvAOthr0IYbioLW5AaJu2Q7WL9YsT7pCXH9vUULGeMERrB5xBow==
X-Received: by 2002:aa7:cd74:0:b0:543:5f7a:9e27 with SMTP id ca20-20020aa7cd74000000b005435f7a9e27mr1464175edb.12.1700647457211;
        Wed, 22 Nov 2023 02:04:17 -0800 (PST)
Received: from [127.0.1.1] ([86.123.99.122])
        by smtp.gmail.com with ESMTPSA id o9-20020a509b09000000b0053deb97e8e6sm6110456edi.28.2023.11.22.02.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 02:04:16 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 22 Nov 2023 12:03:59 +0200
Subject: [PATCH 7/7] phy: qcom-qmp: qserdes-txrx: Add v7 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-7-d9340d362664@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4580; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=h3a6bhb68prVh8MCjOsfWms2L9QVp3zvpbve1dpq10k=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlXdIW5MVDXZz9L02Q5QkintYeyIvSmnKslK3uI
 ZflrufqAsOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZV3SFgAKCRAbX0TJAJUV
 VmQqEACRJViQeHSrEXByPFue07HDYG6S25m346GXyyWGlOSaqp1OYj9i4Ye5I+4yfjWTK0o8eFh
 swdq+NjBYzE7AKDd9cN0wc+E3Ur7k4JHsP0UGUJEYapSJAGnRQnSkLt2iulkK6T8FZua3SuKU39
 v07zN7Hrq2LCZnjby8+JqUaThm5vFxp0r0nIchrLlfR1pvSbtS4GOA8Wc5t9TXnu1ECSZHQvDR4
 odqiWlSu1VF4SZkYgRJ/EO8WGHo1riQmMH5jtvadU64VNfCe66NZ2yUecr/ZauckjjHT3W2RCMC
 Vf4crB9m7yOcZ7CdhPEILVg+n1NBHsyNm2qa8HhQgr+mu3JS3UDmYA79QoL4k/tbLGD8BQZ0ese
 BUumhCG9CftigBQXA/GihTghEGNustcNShMmZEmWjnvlg2SG66scVMlaOwtCgArIbQiW8dW254L
 MFmN6K5c2U+PqRIe58Cog5JLZcEyuT1NXaqeci4IcIbhiISWpf5Pb4q2GTM7ueJVBGRXa6XTj1Q
 k91KJpvczvilcc2J7F5GSwXrNbwOpTDTqKIjeSmHdEse7yWzBbU8r1yX3sZwOJUOIIOe5C82xKt
 uOIv++Rlbm8O+ggWkpx8ZiBKp3wibiOiZsU9YdWENA/yD+SVbNSGkoxeDbsm/+DjZWv2dt36pyT
 pL1teL6VrgCO2lg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X1E80100 platform bumps the HW version of QMP phy to v7 for USB and PCIE.
Add the new qserdes TX RX offsets in a dedicated header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    | 78 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 2 files changed, 79 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
new file mode 100644
index 000000000000..14023f47a95c
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_USB_V7_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_USB_V7_H_
+
+#define QSERDES_V7_TX_CLKBUF_ENABLE				0x08
+#define QSERDES_V7_TX_RESET_TSYNC_EN				0x1c
+#define QSERDES_V7_TX_PRE_STALL_LDO_BOOST_EN			0x20
+#define QSERDES_V7_TX_TX_BAND					0x24
+#define QSERDES_V7_TX_INTERFACE_SELECT				0x2c
+#define QSERDES_V7_TX_RES_CODE_LANE_TX				0x34
+#define QSERDES_V7_TX_RES_CODE_LANE_RX				0x38
+#define QSERDES_V7_TX_RES_CODE_LANE_OFFSET_TX			0x3c
+#define QSERDES_V7_TX_RES_CODE_LANE_OFFSET_RX			0x40
+#define QSERDES_V7_TX_PARRATE_REC_DETECT_IDLE_EN		0x60
+#define QSERDES_V7_TX_BIST_PATTERN7				0x7c
+#define QSERDES_V7_TX_LANE_MODE_1				0x84
+#define QSERDES_V7_TX_LANE_MODE_2				0x88
+#define QSERDES_V7_TX_LANE_MODE_3				0x8c
+#define QSERDES_V7_TX_LANE_MODE_4				0x90
+#define QSERDES_V7_TX_LANE_MODE_5				0x94
+#define QSERDES_V7_TX_RCV_DETECT_LVL_2				0xa4
+#define QSERDES_V7_TX_TRAN_DRVR_EMP_EN				0xc0
+#define QSERDES_V7_TX_TX_INTERFACE_MODE				0xc4
+#define QSERDES_V7_TX_VMODE_CTRL1				0xc8
+#define QSERDES_V7_TX_PI_QEC_CTRL				0xe4
+
+#define QSERDES_V7_RX_UCDR_FO_GAIN				0x08
+#define QSERDES_V7_RX_UCDR_SO_GAIN				0x14
+#define QSERDES_V7_RX_UCDR_FASTLOCK_FO_GAIN			0x30
+#define QSERDES_V7_RX_UCDR_SO_SATURATION_AND_ENABLE		0x34
+#define QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_LOW			0x3c
+#define QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_HIGH			0x40
+#define QSERDES_V7_RX_UCDR_PI_CONTROLS				0x44
+#define QSERDES_V7_RX_UCDR_SB2_THRESH1				0x4c
+#define QSERDES_V7_RX_UCDR_SB2_THRESH2				0x50
+#define QSERDES_V7_RX_UCDR_SB2_GAIN1				0x54
+#define QSERDES_V7_RX_UCDR_SB2_GAIN2				0x58
+#define QSERDES_V7_RX_AUX_DATA_TCOARSE_TFINE			0x60
+#define QSERDES_V7_RX_TX_ADAPT_POST_THRESH			0xcc
+#define QSERDES_V7_RX_VGA_CAL_CNTRL1				0xd4
+#define QSERDES_V7_RX_VGA_CAL_CNTRL2				0xd8
+#define QSERDES_V7_RX_GM_CAL					0xdc
+#define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL2			0xec
+#define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL3			0xf0
+#define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL4			0xf4
+#define QSERDES_V7_RX_RX_IDAC_TSETTLE_LOW			0xf8
+#define QSERDES_V7_RX_RX_IDAC_TSETTLE_HIGH			0xfc
+#define QSERDES_V7_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		0x110
+#define QSERDES_V7_RX_SIDGET_ENABLES				0x118
+#define QSERDES_V7_RX_SIGDET_CNTRL				0x11c
+#define QSERDES_V7_RX_SIGDET_DEGLITCH_CNTRL			0x124
+#define QSERDES_V7_RX_RX_MODE_00_LOW				0x15c
+#define QSERDES_V7_RX_RX_MODE_00_HIGH				0x160
+#define QSERDES_V7_RX_RX_MODE_00_HIGH2				0x164
+#define QSERDES_V7_RX_RX_MODE_00_HIGH3				0x168
+#define QSERDES_V7_RX_RX_MODE_00_HIGH4				0x16c
+#define QSERDES_V7_RX_RX_MODE_01_LOW				0x170
+#define QSERDES_V7_RX_RX_MODE_01_HIGH				0x174
+#define QSERDES_V7_RX_RX_MODE_01_HIGH2				0x178
+#define QSERDES_V7_RX_RX_MODE_01_HIGH3				0x17c
+#define QSERDES_V7_RX_RX_MODE_01_HIGH4				0x180
+#define QSERDES_V7_RX_RX_MODE_10_LOW				0x184
+#define QSERDES_V7_RX_RX_MODE_10_HIGH				0x188
+#define QSERDES_V7_RX_RX_MODE_10_HIGH2				0x18c
+#define QSERDES_V7_RX_RX_MODE_10_HIGH3				0x190
+#define QSERDES_V7_RX_RX_MODE_10_HIGH4				0x194
+#define QSERDES_V7_RX_DFE_EN_TIMER				0x1a0
+#define QSERDES_V7_RX_DFE_CTLE_POST_CAL_OFFSET			0x1a4
+#define QSERDES_V7_RX_DCC_CTRL1					0x1a8
+#define QSERDES_V7_RX_VTH_CODE					0x1b0
+#define QSERDES_V7_RX_SIGDET_CAL_CTRL1				0x1e4
+#define QSERDES_V7_RX_SIGDET_CAL_TRIM				0x1f8
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 63b3cbfcb50f..6923496cbfee 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -28,6 +28,7 @@
 #include "phy-qcom-qmp-qserdes-ln-shrd-v6.h"
 
 #include "phy-qcom-qmp-qserdes-com-v7.h"
+#include "phy-qcom-qmp-qserdes-txrx-v7.h"
 
 #include "phy-qcom-qmp-qserdes-pll.h"
 

-- 
2.34.1


