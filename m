Return-Path: <linux-arm-msm+bounces-3266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D148033F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8EA1B209BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F8825568;
	Mon,  4 Dec 2023 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AM/7MkGe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5989AD2
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 05:08:04 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50bf4f97752so1311321e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 05:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701695282; x=1702300082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFaNDvAciUYjYjthOi5eKX9jiH9kiUBWf4wtlJjm6Ro=;
        b=AM/7MkGeVG0hLmvR/xAV+ZOcsR+fFlbB0FboIMTjryU4y83P0IHAd1sO5kc65EomTK
         C1ImlXzup4TPIolt7C5RaIR7Sycu1VIla7HrDwcjcvzyjq6OORF9EBAYVf43l5klDv35
         luMpU7PQ/j57KnDFI99MvTX+uAMmtwvqB97DSDhl+Xt72G33+OaH7N/F0294c02wybTd
         qEkxL/goSa+C8ntMYXolHbZ+g2ofVx6teJspwpUHCEfCeUBGes+KgZwTcxgqSCNFRSRX
         mVupR/7tuLfGTY7lAiCJYogR4+m8Tts/I+ne8B7wHeqgo489BRUuIqt+6g2PFiewJG8/
         9LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695282; x=1702300082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFaNDvAciUYjYjthOi5eKX9jiH9kiUBWf4wtlJjm6Ro=;
        b=n6ICkFhu3yKT+YbDzOouVw1NsdW2sz7KTt8rV6iZoOYatJ+6EQvAGZjUlF0KjvgodI
         TSlrvuTlhCbvj+NACJHH6tV7SxidhcCbW8fa9mVut/2Wq291tEoVGQjgZiDX6kf2Z4qD
         y03VjW8dXFD5FVa/HrIX/Iz6iyBBjwGaME0pg2Bo6Khmnktkf77yW+zY/SK5tmYQqRsU
         jnWWAqoTfMBszE2DMyDqyuYkgxoJcoSLK6i4kw3qyaLWc1ku1r7f3OATH2PSgZTb4fJe
         jpct0jwZ7sE9VjDydeG59iPv0dMHW1AYgr0NUhAi27cvUT6s+zgo4+j4jUH+gabm5jbz
         2SrQ==
X-Gm-Message-State: AOJu0YzKvUNJoPmHSbNfJ0ftoksUnr+71lxLul4pg9qyUpKyRsxrTwEx
	Homy2fa65lQ+9eTshlsjByp9ag==
X-Google-Smtp-Source: AGHT+IGSMQhmuuR24eEKa3Yf6WfYllNbOcdr0y63lmh5viDT4S9MLSqk1Cwbe6aM71GCsQJ8cWpCoA==
X-Received: by 2002:a05:6512:3b09:b0:50b:e60f:4baa with SMTP id f9-20020a0565123b0900b0050be60f4baamr2186715lfv.47.1701695282584;
        Mon, 04 Dec 2023 05:08:02 -0800 (PST)
Received: from [127.0.1.1] ([82.77.85.67])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c4f8a00b004053e9276easm18494166wmq.32.2023.12.04.05.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:08:02 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 04 Dec 2023 15:07:41 +0200
Subject: [PATCH v2 7/7] phy: qcom-qmp: qserdes-txrx: Add v7 register
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-7-21956ae0c5c3@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-0-21956ae0c5c3@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-0-21956ae0c5c3@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4572; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=DSABUphv7ANB5Lh18JmO/Nn4c0WU8ibscamqugkwAE4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlbc8n73wEcEj219yAts+JXiqh7cb9UyOalp/Sx
 NrlXUnvMoKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZW3PJwAKCRAbX0TJAJUV
 VomXEACFgS/Yn56v/EvRarO7w86BRhpfJkdC1P/7PlkjHrw4VACEkM6uP4FzXmoyMubetibLZLx
 cG0Ply6pniwF9SrEBIAGr0R9PNp+oMb9vJ2zFEJCfpQAFLMC8hc4p3B9aDGe23fLK6b1V8mxb4H
 hs7O/3HSzX+ZW48k86jlH6YccsbD+2fnNOiA2qcRaUp061tvWvxrYne0P0TgoDIT6DKc/xE7xbQ
 l24HKBsfx0JjK0tiK13jfwDflHtrQ+Twt8LFeo5ze8+1Dp7tWbZ/y73Xf6J8f2cRf5pECCzGam5
 gdvE7uhGu/Mo6m+kYbi4/pIhI6oE5jEQqgTsd06z7zODcU1d1Xi2gUXMS4Pw99jAQN5s1cvfzZC
 axO4OLVnhLex45mqW0phLs3753wT8wi45WBLyo1xTYLFiCv74hv1hqRg6j7daSi1vvB+xEEqeUh
 zZmJ/Vw/FGY4PKmjbcvL9QB4OtEkPNPc2+iuhSG5PV162ishn+/75yh9Dh0g9F1g3h09l4mZlsY
 4jpI/3waQAN60V+79TPto8p3Yswl+sv/9dPkDlu+huzF79FSqOXeuTaktrUWB3OyHMLuanHAewZ
 26J74DDfFNcSViO1UXw4wmdQLtoXkqCNQmyC4QQXP831M1IH1oQ7z/hi3WM99J2x68IKl0TOHTS
 9tN2GkEP/Mib6zA==
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


