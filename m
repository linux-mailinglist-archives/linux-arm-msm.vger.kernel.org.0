Return-Path: <linux-arm-msm+bounces-50886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B26A5A5DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 22:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C55D1892801
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 21:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030461E5B80;
	Mon, 10 Mar 2025 21:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EpV/s4z0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3D91E0E01;
	Mon, 10 Mar 2025 21:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741641187; cv=none; b=OkDYy7E8LY2C3yJlRpht1kBMdRDAKVgUaLeWo+oA4FD2cLhqcPPbBLCqoBLo8F3zPknhi970KJ5rfdYzlNslmXsuazs9GWERFiUkfIGPiI8kXDakbKS38A+y6/1kQY3OdBjxA8vk/0luAbZnhyFo0y5eiMRdZ2YaXZHwEcF1ZN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741641187; c=relaxed/simple;
	bh=tHd43onTQVhRh6yYlXqdKyB7aQCfCGK2VzjHhEU5cM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KDdpOKIR7JT5qEfP8zKHSAsTtDlzzwTbKBlhKiZ2cnXo7z620QuRhla+nuLAWMm3wHuqyTjStwB8+nvHhCt4s74hy3SkgnTK8q+lNmbXtZaIqwt7lwjEDUaxLRrc8BgbERkXohNrn43IWC+EiBq1iYMQJkkLrRQr9eBk+y68jdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EpV/s4z0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AK6LlX026525;
	Mon, 10 Mar 2025 21:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	okCtXcFIMNUNZR5ZTc6VmUfNrr3qOrG5ELwEESN2fd4=; b=EpV/s4z0aeLz8pdY
	50BSNkp/0FCzVWuDRdvkBjt+2GsNg8q2Li2YWvQlypGQTBuz6pIJubENSS1GRvZ9
	dXtzMZfXXiZ5ku5Q/+JEI6BPyYVC/TN1K/I4QfvWml4qSONW/rGH1QN8Cl34kcO2
	M0SWlN3XvmaJI8NGYeo5LWRt0Pd7xnzflA9jtQPEqedXyl7d8MWSbSuRkNpJrpZ3
	mgn8vBk0ulul8prgahiFMcWU0b+Paicr0DYUi7hIWTSX3a/odTLOeDM5n6C9x9En
	lSh4MH8cyyDI7SMAgVTzfHxXdJ4KPvUx01SL1awCgeI6aeLHbmvwC6Csf5pg0KlG
	CFxRYA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f2me56y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 21:12:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52ALCgGZ007594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 21:12:42 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 14:12:42 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 10 Mar 2025 14:12:30 -0700
Subject: [PATCH v2 2/6] phy: qcom-qmp-ufs: Add PHY Configuration support
 for sm8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250310-sm8750_ufs_master-v2-2-0dfdd6823161@quicinc.com>
References: <20250310-sm8750_ufs_master-v2-0-0dfdd6823161@quicinc.com>
In-Reply-To: <20250310-sm8750_ufs_master-v2-0-0dfdd6823161@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, Nitin Rawat <quic_nitirawa@quicinc.com>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Manish Pandey <quic_mapa@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741641161; l=15507;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=Tp8O3CHAulFY2/rc2cKmwOxh43Kc7bEV1U0xBYEBhPQ=;
 b=Kv8gvLgRtrkGnR/Og31rY52C1nkk9+nusIVyQFtfhQiAoVpkwy0LB2raNyb00gjygNncH6XRN
 9sM/LfyGfVKANaxkapgGFYQgkb0l/4QXI1s1BwJoHIA2eYGRVzbaI1w
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rROBFej2sXM7kevoeou11WynfLu1xfOE
X-Proofpoint-ORIG-GUID: rROBFej2sXM7kevoeou11WynfLu1xfOE
X-Authority-Analysis: v=2.4 cv=ab+bnQot c=1 sm=1 tr=0 ts=67cf55cc cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=tt4_J4unsdtat8xEA6AA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1011 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100162

From: Nitin Rawat <quic_nitirawa@quicinc.com>

Add SM8750 specific register layout and table configs. The serdes
TX RX register offset has changed for SM8750 and hence keep UFS
specific serdes offsets in a dedicated header file.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |   7 +
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v7.h    |  67 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 180 ++++++++++++++++++++-
 3 files changed, 246 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h
index 328c6c0b0b09ae4ff5bf14e846772e6d0f31ce5a..258f3d30742e8bc93a56aee3431d6e227a6bb791 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h
@@ -86,4 +86,11 @@
 #define QSERDES_V6_COM_CMN_STATUS				0x1d0
 #define QSERDES_V6_COM_C_READY_STATUS				0x1f8
 
+#define QSERDES_V6_COM_ADAPTIVE_ANALOG_CONFIG			0x268
+#define QSERDES_V6_COM_CP_CTRL_ADAPTIVE_MODE0			0x26c
+#define QSERDES_V6_COM_PLL_RCCTRL_ADAPTIVE_MODE0		0x270
+#define QSERDES_V6_COM_PLL_CCTRL_ADAPTIVE_MODE0			0x274
+#define QSERDES_V6_COM_CP_CTRL_ADAPTIVE_MODE1			0x278
+#define QSERDES_V6_COM_PLL_RCCTRL_ADAPTIVE_MODE1		0x27c
+#define QSERDES_V6_COM_PLL_CCTRL_ADAPTIVE_MODE1			0x280
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v7.h
new file mode 100644
index 0000000000000000000000000000000000000000..3f0522492f857ebfededd39748ec849678069bf4
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v7.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2024, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_UFS_V7_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_UFS_V7_H_
+
+#define QSERDES_UFS_V7_TX_RES_CODE_LANE_TX				0x28
+#define QSERDES_UFS_V7_TX_RES_CODE_LANE_RX				0x2c
+#define QSERDES_UFS_V7_TX_RES_CODE_LANE_OFFSET_TX			0x30
+#define QSERDES_UFS_V7_TX_RES_CODE_LANE_OFFSET_RX			0x34
+#define QSERDES_UFS_V7_TX_LANE_MODE_1					0x7c
+#define QSERDES_UFS_V7_TX_FR_DCC_CTRL					0x108
+
+#define QSERDES_UFS_V7_RX_UCDR_FASTLOCK_FO_GAIN_RATE4                   0x10
+#define QSERDES_UFS_V7_RX_UCDR_FASTLOCK_SO_GAIN_RATE4                   0x24
+#define QSERDES_UFS_V7_RX_UCDR_SO_SATURATION				0x28
+#define QSERDES_UFS_V7_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4                0x54
+#define QSERDES_UFS_V7_RX_UCDR_PI_CTRL1					0x58
+#define QSERDES_UFS_V7_RX_TERM_BW_CTRL0					0xc4
+#define QSERDES_UFS_V7_RX_UCDR_FO_GAIN_RATE2                            0xd4
+#define QSERDES_UFS_V7_RX_UCDR_FO_GAIN_RATE4                            0xdc
+#define QSERDES_UFS_V7_RX_UCDR_SO_GAIN_RATE4                            0xf0
+#define QSERDES_UFS_V7_RX_UCDR_PI_CONTROLS                              0xf4
+#define QSERDES_UFS_V7_RX_VGA_CAL_MAN_VAL                               0x178
+#define QSERDES_UFS_V7_RX_EQU_ADAPTOR_CNTRL4                            0x1b4
+#define QSERDES_UFS_V7_RX_EQ_OFFSET_ADAPTOR_CNTRL1                      0x1cc
+#define QSERDES_UFS_V7_RX_OFFSET_ADAPTOR_CNTRL3                         0x1d4
+#define QSERDES_UFS_V7_RX_INTERFACE_MODE                                0x1f0
+#define QSERDES_UFS_V7_RX_MODE_RATE_0_1_B0				0x218
+#define QSERDES_UFS_V7_RX_MODE_RATE_0_1_B1				0x21C
+#define QSERDES_UFS_V7_RX_MODE_RATE_0_1_B2				0x220
+#define QSERDES_UFS_V7_RX_MODE_RATE_0_1_B3				0x224
+#define QSERDES_UFS_V7_RX_MODE_RATE_0_1_B4				0x228
+#define QSERDES_UFS_V7_RX_MODE_RATE_0_1_B6				0x230
+#define QSERDES_UFS_V7_RX_MODE_RATE_0_1_B7				0x234
+#define QSERDES_UFS_V7_RX_MODE_RATE2_B3					0x248
+#define QSERDES_UFS_V7_RX_MODE_RATE2_B6					0x254
+#define QSERDES_UFS_V7_RX_MODE_RATE2_B7					0x258
+#define QSERDES_UFS_V7_RX_MODE_RATE3_B0					0x260
+#define QSERDES_UFS_V7_RX_MODE_RATE3_B1					0x264
+#define QSERDES_UFS_V7_RX_MODE_RATE3_B2					0x268
+#define QSERDES_UFS_V7_RX_MODE_RATE3_B3					0x26c
+#define QSERDES_UFS_V7_RX_MODE_RATE3_B4					0x270
+#define QSERDES_UFS_V7_RX_MODE_RATE3_B5					0x274
+#define QSERDES_UFS_V7_RX_MODE_RATE3_B7					0x27c
+#define QSERDES_UFS_V7_RX_MODE_RATE3_B8					0x280
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B0				0x284
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B1				0x288
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B2				0x28c
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B3				0x290
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B4				0x294
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B5				0x298
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B6				0x29c
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B7				0x2a0
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B0				0x2a8
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B1				0x2ac
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B2				0x2b0
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B3				0x2b4
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B4				0x2b8
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B5				0x2bc
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B6				0x2c0
+#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B7				0x2c4
+#define QSERDES_UFS_V7_RX_DLL0_FTUNE_CTRL				0x348
+#define QSERDES_UFS_V7_RX_SIGDET_CAL_TRIM				0x380
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index d964bdfe870029226482f264c78a27d0ec43bf2b..45b3b792696e9ed17ca9dedcf8e71202d27e86a2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -31,6 +31,7 @@
 #include "phy-qcom-qmp-pcs-ufs-v6.h"
 
 #include "phy-qcom-qmp-qserdes-txrx-ufs-v6.h"
+#include "phy-qcom-qmp-qserdes-txrx-ufs-v7.h"
 
 /* QPHY_PCS_READY_STATUS bit */
 #define PCS_READY				BIT(0)
@@ -949,6 +950,124 @@ static const struct qmp_phy_init_tbl sm8650_ufsphy_g5_pcs[] = {
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HSG5_SYNC_WAIT_TIME, 0x9e),
 };
 
+static const struct qmp_phy_init_tbl sm8750_ufsphy_serdes[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0xd9),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO_MODE1, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_IETRIM, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_IPTRIM, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_CTRL, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADAPTIVE_ANALOG_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_ADAPTIVE_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCCTRL_ADAPTIVE_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_ADAPTIVE_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x4c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_ADAPTIVE_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCCTRL_ADAPTIVE_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_ADAPTIVE_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xbe),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
+};
+
+static const struct qmp_phy_init_tbl sm8750_ufsphy_tx[] = {
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_TX_LANE_MODE_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_TX_RES_CODE_LANE_OFFSET_TX, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_TX_RES_CODE_LANE_OFFSET_RX, 0x17),
+};
+
+static const struct qmp_phy_init_tbl sm8750_ufsphy_rx[] = {
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FO_GAIN_RATE2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FO_GAIN_RATE4, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_SO_GAIN_RATE4, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_PI_CONTROLS, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_OFFSET_ADAPTOR_CNTRL3, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FASTLOCK_FO_GAIN_RATE4, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FASTLOCK_SO_GAIN_RATE4, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_VGA_CAL_MAN_VAL, 0x8e),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_EQU_ADAPTOR_CNTRL4, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B0, 0xce),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B1, 0xce),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B2, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B3, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B4, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B6, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B7, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE2_B3, 0x9a),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE2_B6, 0xe2),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE2_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B0, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B1, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B2, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B3, 0x9b),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B4, 0x2a),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B5, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B8, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B0, 0x93),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B1, 0x93),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B2, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B3, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B4, 0x5f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B5, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B6, 0xe3),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B0, 0x9b),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B1, 0x9b),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B2, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B3, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B4, 0x5f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B5, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B6, 0xfb),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_SO_SATURATION, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_PI_CTRL1, 0x94),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_TERM_BW_CTRL0, 0xfa),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_DLL0_FTUNE_CTRL, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_SIGDET_CAL_TRIM, 0x77),
+};
+
+static const struct qmp_phy_init_tbl sm8750_ufsphy_pcs[] = {
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PCS_CTRL1, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_SIGDET_CTRL2, 0x68),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_POST_EMP_LVL_S4, 0x0e),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_POST_EMP_LVL_S5, 0x12),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_POST_EMP_LVL_S6, 0x15),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_POST_EMP_LVL_S7, 0x19),
+};
+
+static const struct qmp_phy_init_tbl sm8750_ufsphy_g4_pcs[] = {
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x04),
+};
+
+static const struct qmp_phy_init_tbl sm8750_ufsphy_hs_b_pcs[] = {
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PCS_CTRL1, 0x41),
+};
+
 struct qmp_ufs_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -1523,6 +1642,45 @@ static const struct qmp_phy_cfg sm8650_ufsphy_cfg = {
 	.regs			= ufsphy_v6_regs_layout,
 };
 
+static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {
+	.lanes			= 2,
+
+	.offsets		= &qmp_ufs_offsets_v6,
+	.max_supported_gear	= UFS_HS_G5,
+
+	.tbls = {
+		.serdes		= sm8750_ufsphy_serdes,
+		.serdes_num	= ARRAY_SIZE(sm8750_ufsphy_serdes),
+		.tx		= sm8750_ufsphy_tx,
+		.tx_num		= ARRAY_SIZE(sm8750_ufsphy_tx),
+		.rx		= sm8750_ufsphy_rx,
+		.rx_num		= ARRAY_SIZE(sm8750_ufsphy_rx),
+		.pcs		= sm8750_ufsphy_pcs,
+		.pcs_num	= ARRAY_SIZE(sm8750_ufsphy_pcs),
+	},
+
+	.tbls_hs_b = {
+		.pcs		= sm8750_ufsphy_hs_b_pcs,
+		.pcs_num	= ARRAY_SIZE(sm8750_ufsphy_hs_b_pcs),
+	},
+
+	.tbls_hs_overlay[0] = {
+		.pcs		= sm8750_ufsphy_g4_pcs,
+		.pcs_num	= ARRAY_SIZE(sm8750_ufsphy_g4_pcs),
+		.max_gear	= UFS_HS_G4,
+	},
+	.tbls_hs_overlay[1] = {
+		.pcs		= sm8650_ufsphy_g5_pcs,
+		.pcs_num	= ARRAY_SIZE(sm8650_ufsphy_g5_pcs),
+		.max_gear	= UFS_HS_G5,
+	},
+
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= ufsphy_v6_regs_layout,
+
+};
+
 static void qmp_ufs_serdes_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	void __iomem *serdes = qmp->serdes;
@@ -1578,23 +1736,25 @@ static int qmp_ufs_get_gear_overlay(struct qmp_ufs *qmp, const struct qmp_phy_cf
 	return ret;
 }
 
+static void qmp_ufs_init_all(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls *tbls)
+{
+	qmp_ufs_serdes_init(qmp, tbls);
+	qmp_ufs_lanes_init(qmp, tbls);
+	qmp_ufs_pcs_init(qmp, tbls);
+}
+
 static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg *cfg)
 {
 	int i;
 
-	qmp_ufs_serdes_init(qmp, &cfg->tbls);
-	qmp_ufs_lanes_init(qmp, &cfg->tbls);
-	qmp_ufs_pcs_init(qmp, &cfg->tbls);
+	qmp_ufs_init_all(qmp, &cfg->tbls);
 
 	i = qmp_ufs_get_gear_overlay(qmp, cfg);
 	if (i >= 0) {
-		qmp_ufs_serdes_init(qmp, &cfg->tbls_hs_overlay[i]);
-		qmp_ufs_lanes_init(qmp, &cfg->tbls_hs_overlay[i]);
-		qmp_ufs_pcs_init(qmp, &cfg->tbls_hs_overlay[i]);
+		qmp_ufs_init_all(qmp, &cfg->tbls_hs_overlay[i]);
 	}
 
-	if (qmp->mode == PHY_MODE_UFS_HS_B)
-		qmp_ufs_serdes_init(qmp, &cfg->tbls_hs_b);
+	qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
 }
 
 static int qmp_ufs_com_init(struct qmp_ufs *qmp)
@@ -2061,7 +2221,11 @@ static const struct of_device_id qmp_ufs_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8650-qmp-ufs-phy",
 		.data = &sm8650_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm8750-qmp-ufs-phy",
+		.data = &sm8750_ufsphy_cfg,
 	},
+
 	{ },
 };
 MODULE_DEVICE_TABLE(of, qmp_ufs_of_match_table);

-- 
2.46.1


