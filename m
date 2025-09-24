Return-Path: <linux-arm-msm+bounces-74751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B870B9C999
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B3751BC43A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E031D2C159F;
	Wed, 24 Sep 2025 23:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbNx8AYx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CE12C08BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756811; cv=none; b=fW1SQ8xjOab/qk8AyCdtFl9F6AKf5Qfh90WSKdUdnlX3HOGM3AySvO3gR8nzGA7jdoUBN4rf1+5beuVK+aMkwT0QRNcTDCJtwtDSEd297+RXyzP1FpxnlwfB3uhA4qYJ16a9scOXrCKmkK18pwOSchvrWJnoJtoz/IV2xHAQghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756811; c=relaxed/simple;
	bh=4vSdyILjWl7JeyGhaeKWfllkZGkG8k3DMb05WixnHQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNLGx4MJIjJEnZ4YxV0efTFNONxuHx2NlyM3ECNP2+/toxP+QHKQk5SvWi8nd6ktCG32Xn/48SKcx0k3Op8c6Q+Xyc8KvXWow7Ut293XaRIAZceHlD88i7NV7up52as/kJkMXkBZx9VILaKy5+Fh0YRuhKt207bJe5cP2C3Jpz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbNx8AYx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCoZGm016452
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DHltwgur1BfMiD6ZCGpjw2sjWFIRGbG1DzGcy24bkEk=; b=gbNx8AYxnXQxDU9Z
	v+ytH3aw3dN0O/JJZXzsjCEOBh3DN5Bp8GqCajvGmLkiV5g5SFbT6BHcCZz9bMEn
	P7KADXGGCF+rLdK/m/qoGdL5uVNuuzN6r7EReyQ8vpaxU3C3hgT+2yU+AWcUr/qy
	oJ87bjl7rhUOsKE+vk/yKKQknsqQIODlUGW2sEmI1Rq6s7kflE1Y22K5lXiHf2A4
	RVWzDMPl1Dc42jUmZ4RrNPrjy6O7YD54PT01sDaQQjYWjf4tU5i4KqGQrhDRSnI0
	bgYKnsn0LrVEp9U0Z/p1PNlvuPWyEiDIjdS9uWcaM1BIbEuEHBHP3gPUVWdgv/w3
	6XwNdg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhv0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2711a55da20so2296685ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756809; x=1759361609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHltwgur1BfMiD6ZCGpjw2sjWFIRGbG1DzGcy24bkEk=;
        b=jHjc7L17FPosB3F1HH1B31FPXcCEyoWQrlfDuRQdjrYuS7hJyVyDRo9q9YhDVWb3y7
         YE6gAWAWsIP5uvQgeUw3fEfcs9VoUrOuYXWZLiTWhlVxSAp8b4CB8MZFGhSLXPRXXsGX
         r0b9rYimOzb42+ObP4U7uOPcBujOVzPMPSfZZYdlxD5GYJ+OcrDU9XcQXALLgrcj2QUg
         +FB4dpztRLDCKMNjfN1Moa0zsjCd13Xt23O80YcQzFksdIibr/0Cf9+zpnnmDnmN11By
         ybN1TPskO59Q1+OU1DnrDtzaJ/n5huGWIf3ks6T6uq4+yEDEk4TgplYUuw4p/71wlu2X
         KbVg==
X-Gm-Message-State: AOJu0YzYfvrwRMkQcKOlnh2hfRWzXYpJrIsNT8kiZYAXInO6uRdo1WEo
	AUzvoKIeBopvvpQ2EEqiJUjBN+ZnRfvbbpxLlcawR9fgV0VQjIC2+cP2xSfAh9Sx74z1GLufJJ/
	4H/dCCzyZhpkhuKGBlTcmnFUZ3jErF7oH29BLlmUKEUWtzJAH3tsmLdL73pOA1ESsVElZ
X-Gm-Gg: ASbGncufuj0d9ZcsXKGeAbt5cAalnefBIA7G0KQ2CW5mvWMZGr+WBuba5lI5HDnV++j
	0rfJxuyFWk7a5PRUBG7YgNcxu0NubuX+wGHq4FwGaXRDGmrZ7tHW4uxUUKjQgMMd9wg0i5m2BwV
	paZthgqsPOaybD36cr8hJJ9H960v3ZmSvSg6fIfypSbpNYMBZXNmxKiBebwW8GOJ9xrEmgbA72U
	O3g0rznp2QUFwlNEZeoQ3IKO1Y6BfJWtpDoL0YDebIscInN8oAiXpu9bP+lN0eTfMB309kFoqMe
	K3QWO4Zh5g7q4OwDK1abT5iYRsnI1/088G3Sz7d9+NPmKci9YHmnzYdxuoDB3qTVQlGMYH8tInF
	oIhOb7ELH/sJ9P/M=
X-Received: by 2002:a05:6a20:9192:b0:277:f962:3163 with SMTP id adf61e73a8af0-2e7c29376b1mr1642735637.19.1758756808585;
        Wed, 24 Sep 2025 16:33:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTJ71K9g+469uClLmZwSoL9DavnoWtdXEI7DsRgFdlBq0ISrCZ69X/FgwyFw4ueQ317L5Drw==
X-Received: by 2002:a05:6a20:9192:b0:277:f962:3163 with SMTP id adf61e73a8af0-2e7c29376b1mr1642702637.19.1758756808129;
        Wed, 24 Sep 2025 16:33:28 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53ca107sm392911a12.13.2025.09.24.16.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:33:27 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:33:19 -0700
Subject: [PATCH 3/6] phy: qcom-qmp: qserdes-txrx: Add QMP PCIe PHY
 v8-specific register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-pcie-v1-3-5fb59e398b83@oss.qualcomm.com>
References: <20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com>
In-Reply-To: <20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756801; l=4314;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=jFjxkAF3nqQJ+9TobMmzv/05mm+4KFnWIHbV2tnmmys=;
 b=zA7wfPQ/vlNf/7X4Du1r8wbvarwm3TBfLjDd3lQhjTbIeeg9h3LBVgegrL6ORnIdveVaet98z
 Fl0r4It3ZgIBstk0+1Weuglswx5BfuOMDUA7FCDECNvMSCVfjbfKgzM
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d47fc9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4xyYOQZvY-QN-ePQHmMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: v3DFo2Z-ZNko5rHBerOpmRF5vP6PZyHa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfXysFYk6GhVxXl
 ngzdkYC8jtAwP2N1x0hP2nhr1v9Po+XlUOXVIMRa8sLb132JMrP7iwBGkd/36NrxDicOAAU3svU
 OVZtoV+ODBlEP7dC6SNBGjEg4/wvLs+sYT0kKaXTltZSrHVmsyH96YMlEiUF+sEup1xeHUxCNog
 1rwujRD1uDMw8ScNoypEhxo1+f/OilNhxzGOHMqO1lS9Ll7g1v3aWCn6w409I7S1PUFBdwTxf84
 2caFOwBkZQfqk+LwpRTvcUeK+RUZDJPUkRGJJCqzeG/yNQdmkGplfz56WxpPxx25oyGUmKVBYP0
 85wmZiaiJejK2nM9h3W77OKTkf4rIFW+S7nrf3/btFVCpjagCuwiyH0sRN/k46kzkU4I1dIJAaG
 cdI7oeID
X-Proofpoint-ORIG-GUID: v3DFo2Z-ZNko5rHBerOpmRF5vP6PZyHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

From: Qiang Yu <qiang.yu@oss.qualcomm.com>

Kaanapali SoC uses QMP PHY with version v8 for PCIe Gen3 x2, but its
qserdes-txrx register offsets differ from the existing v8 offsets. To
accommodate these differences, add the qserdes-txrx specific offsets in
a dedicated header file.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h   | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h
new file mode 100644
index 000000000000..181846e08c0f
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_PCIE_V8_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_PCIE_V8_H_
+
+#define QSERDES_V8_PCIE_TX_RES_CODE_LANE_OFFSET_TX		0x030
+#define QSERDES_V8_PCIE_TX_RES_CODE_LANE_OFFSET_RX		0x034
+#define QSERDES_V8_PCIE_TX_LANE_MODE_1		0x07c
+#define QSERDES_V8_PCIE_TX_LANE_MODE_2		0x080
+#define QSERDES_V8_PCIE_TX_LANE_MODE_3		0x084
+#define QSERDES_V8_PCIE_TX_TRAN_DRVR_EMP_EN		0x0b4
+#define QSERDES_V8_PCIE_TX_TX_BAND0		0x0e0
+#define QSERDES_V8_PCIE_TX_TX_BAND1		0x0e4
+#define QSERDES_V8_PCIE_TX_SEL_10B_8B		0x0f4
+#define QSERDES_V8_PCIE_TX_SEL_20B_10B		0x0f8
+#define QSERDES_V8_PCIE_TX_PARRATE_REC_DETECT_IDLE_EN		0x058
+#define QSERDES_V8_PCIE_TX_TX_ADAPT_POST_THRESH1		0x118
+#define QSERDES_V8_PCIE_TX_TX_ADAPT_POST_THRESH2		0x11c
+#define QSERDES_V8_PCIE_TX_PHPRE_CTRL		0x128
+#define QSERDES_V8_PCIE_TX_EQ_RCF_CTRL_RATE3		0x148
+#define QSERDES_V8_PCIE_TX_EQ_RCF_CTRL_RATE4		0x14c
+
+#define QSERDES_V8_PCIE_RX_UCDR_FO_GAIN_RATE4		0x0dc
+#define QSERDES_V8_PCIE_RX_UCDR_SO_GAIN_RATE3		0x0ec
+#define QSERDES_V8_PCIE_RX_UCDR_SO_GAIN_RATE4		0x0f0
+#define QSERDES_V8_PCIE_RX_UCDR_PI_CONTROLS		0x0f4
+#define QSERDES_V8_PCIE_RX_VGA_CAL_CNTRL1		0x170
+#define QSERDES_V8_PCIE_RX_VGA_CAL_MAN_VAL		0x178
+#define QSERDES_V8_PCIE_RX_RX_EQU_ADAPTOR_CNTRL4		0x1b4
+#define QSERDES_V8_PCIE_RX_SIGDET_ENABLES			0x1d8
+#define QSERDES_V8_PCIE_RX_SIGDET_LVL			0x1e0
+#define QSERDES_V8_PCIE_RX_RXCLK_DIV2_CTRL			0x0b8
+#define QSERDES_V8_PCIE_RX_RX_BAND_CTRL0			0x0bc
+#define QSERDES_V8_PCIE_RX_RX_TERM_BW_CTRL0			0x0c4
+#define QSERDES_V8_PCIE_RX_RX_TERM_BW_CTRL1			0x0c8
+#define QSERDES_V8_PCIE_RX_SVS_MODE_CTRL			0x0b4
+#define QSERDES_V8_PCIE_RX_UCDR_PI_CTRL1			0x058
+#define QSERDES_V8_PCIE_RX_UCDR_PI_CTRL2			0x05c
+#define QSERDES_V8_PCIE_RX_UCDR_SB2_THRESH2_RATE3			0x084
+#define QSERDES_V8_PCIE_RX_UCDR_SB2_GAIN1_RATE3			0x098
+#define QSERDES_V8_PCIE_RX_UCDR_SB2_GAIN2_RATE3			0x0ac
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B0			0x218
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B1			0x21c
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B2			0x220
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B4			0x228
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B7			0x234
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B0			0x260
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B1			0x264
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B2			0x268
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B3			0x26c
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B4			0x270
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B0			0x284
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B1			0x288
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B2			0x28c
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B3			0x290
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B4			0x294
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B5			0x298
+#define QSERDES_V8_PCIE_RX_Q_PI_INTRINSIC_BIAS_RATE32			0x31c
+#define QSERDES_V8_PCIE_RX_Q_PI_INTRINSIC_BIAS_RATE4			0x320
+#define QSERDES_V8_PCIE_RX_EOM_MAX_ERR_LIMIT_LSB			0x11c
+#define QSERDES_V8_PCIE_RX_EOM_MAX_ERR_LIMIT_MSB			0x120
+#define QSERDES_V8_PCIE_RX_AUXDATA_BIN_RATE23			0x108
+#define QSERDES_V8_PCIE_RX_AUXDATA_BIN_RATE4			0x10c
+#define QSERDES_V8_PCIE_RX_VTHRESH_CAL_MAN_VAL_RATE3			0x198
+#define QSERDES_V8_PCIE_RX_VTHRESH_CAL_MAN_VAL_RATE4			0x19c
+#define QSERDES_V8_PCIE_RX_GM_CAL			0x1a0
+
+#endif

-- 
2.25.1


