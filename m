Return-Path: <linux-arm-msm+bounces-3692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 637B6808781
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE9041F225DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6369F3D0A4;
	Thu,  7 Dec 2023 12:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HyBtLqji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B16410C4
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:19:45 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ca208940b3so7940851fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701951583; x=1702556383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhgn4JuesDggACyONvCQcbB2IG7dVX16NvRquXXZaUU=;
        b=HyBtLqjiKhgj9k5ih6n68AxqQvyd9DtxhefPjlS3fwHDC/rgZiBNpv3uaegSfSChUU
         oh8q5am9fuDEvinZjvTc4LboG4klCwN0cupX/Ea1e0SQelupqFDV+y0Qg3GdtWh0Lytc
         dpWIWDlLxuhtJFHd88zv4UmaqT29uqSA4G7we5NvkTpMiFYaHj9uyuZBgqP5mZed9u2p
         KUxZNK9QS4dCUJchS+Nr03yC65Azi/vA2hOPGFsXqPwRzRY0eYm1FYhbuGONjIXb8vqT
         +d7aeuhIgdzyVr+AkcZM/2gct0f1ee7GsRkKP9pBOJ5Zu8L9QPP4XbS8cDjc75NZRmw6
         z1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951583; x=1702556383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhgn4JuesDggACyONvCQcbB2IG7dVX16NvRquXXZaUU=;
        b=pncA85i1I597dkuVqGmnsj1Ej179KzM+LXTErznNeQDjhCByJFuKsgOTjSZBV2NONC
         E1nLMh53ZJly4APueB29DV+uHAo9MiietJTtDbSCEwq0s8RA6EQ2w54fwaVIezvlKNVd
         g5KcS9NM1rLiyMKboG3yCbj2oUEu7nytjFCJU5bH06pdBmmtpnL5FgiwD0CpXYmaZzlY
         /9Ilus/QyCc7ywGLa9BMYl/O84DfKSu4EG1wRw+UlG20rjc54xt2d3y3IJ7baTReACFE
         Wo0sIN7HH5G/EYpDGBPZA5haLeX7xY22mFfbPRTlhGqWni2CaWMWmyPtv2mG9SS/Tr9u
         H3XA==
X-Gm-Message-State: AOJu0YzZVfiSgyIVsTQekQOHsPJauiJEfVcl4V3rd41U01mlSXtFnvJQ
	K7zp4G1pe5VCWKfjS1mrRdw8k2jZMnBXobmvgIY=
X-Google-Smtp-Source: AGHT+IHUoLBD3h8BKOPes5RN9bzkEgT/kkYheeiOqti8BmA/GLPCP3qJ0FHGz1qy2A1QlJPJ6kRIGg==
X-Received: by 2002:a2e:381a:0:b0:2c9:f14b:d8f1 with SMTP id f26-20020a2e381a000000b002c9f14bd8f1mr1543710lja.91.1701951583157;
        Thu, 07 Dec 2023 04:19:43 -0800 (PST)
Received: from [127.0.1.1] ([82.79.186.233])
        by smtp.gmail.com with ESMTPSA id f24-20020a170906c09800b00a1e814b7155sm761394ejz.62.2023.12.07.04.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:19:42 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 07 Dec 2023 14:19:16 +0200
Subject: [PATCH v3 7/7] phy: qcom-qmp: qserdes-txrx: Add v7 register
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-7-dfd1c375ef61@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4633; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=5/98ruvfAJIRmZEeQwSABffPhoVobDT0dnDcTfgG38Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlcbhUs+P3c/e7UUpb0pILpCCasUJIkNjVfz/DB
 QvtvOA//I2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXG4VAAKCRAbX0TJAJUV
 VpuoD/4q4pQtxobq5xecR9xU/VsnppN7AHS0aQT9MjHcdzWz8uBjxRbafyEvYZr6doTewf4M2DP
 btCWG/VcQf2w97LhgqNc5qEbJ+IrAm2NpHlNgevFp5qUUjHsMIJFA20vHgrbXjy3c1xFTC6lgGv
 aUyeV+lqYqzkrdqZ00cWlLNji3El4Ir98pe8dHuvRRCWkrhKavLiSMtg43FfGfKSfa8Ud06rUH/
 bZBmoPudhHSK3BfKk3KXd/FWzRFKmw5oD9e4NCziwWvWu5L7yCGVPV2ZllxPe5wafzd5xojoX9X
 dSwRZkOCplYRtdrVIli2j6C4bH38pJ58yl5+ZgqSBGf/Dask72GWPDe6eQk6Spqx40cDwxSQ8Gq
 qMkZWW7P/fOMcoBiOkNoBnYo+KLEOUu9bUHASAJOSo89CSt6au9VA2BiV27Gu8QL866wEPPzg7X
 5dGhSbLFn4MLf/8xFR7tmcC4LGm+/CuX5/Rhgxnlv4JH6510cOUm7pDiDt/ExNHC0AQmWv54UeL
 DnCaArkf1J0GkdmZitrzrg3xhTle+YavBO4nItW94frfewAlVhQ+oAlBXWGVgVT3oeEVZZdv4ah
 fgkkEjKbzF+owriGk5uPKsnUz3LhsuNW0QkLvApvyd2WhdZwmXJsO4NU5cF9HvJgpWLlNZm9kSZ
 ikXhfa4QeWTEfHw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X1E80100 platform bumps the HW version of QMP phy to v7 for USB and PCIE.
Add the new qserdes TX RX offsets in a dedicated header file.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    | 78 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 2 files changed, 79 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
new file mode 100644
index 000000000000..91f865b11347
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V7_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V7_H_
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


