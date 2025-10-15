Return-Path: <linux-arm-msm+bounces-77357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD5EBDDFD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACD44421E16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A933331D38A;
	Wed, 15 Oct 2025 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l81r1Uuc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B95931BCAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760524072; cv=none; b=o78mV0kTwXuzl9QxVmdDTDRmfhkYCQbmx51kUmvS7uG2W3O0Y/8ykALeO8+JFoDnYCKH5zV/fNIS+7eCPRzyWMe5FUT56jdvGk0yumag9TlyNnGMTezD518vFb1aIOtm5jiXO7ICFZ06fKv5cgD6ATGjyC02JhrK+ZTSRPOtcLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760524072; c=relaxed/simple;
	bh=oFnKNL4LlT5/93e0cQNiy8Qw+BXY3+8dDZtcph0oAzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1lZYJTQhZDy8WibF9fqgyVW4cdwoFKBaShmAIkqYfu0SFdEXylqqjpfrZGZ/99/nn8URJbps20QsJKIo0DSjWMhIyM5s2/2HtVF5nzDnNDaybLmbfKXW5ICpqznI1My3Xy2kd9DW/LETtJxXzKUNCheaCyWbddcE9hrvZkD2vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l81r1Uuc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s7fI024770
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UsypE5wXOc0oAjNZDpo2kWWSLxG6ciEpndDtjgOZ3Wk=; b=l81r1UucvvJX36xz
	UbRAfUvmExI9s1XVG6OwjhKOqBuk9AJABMS6ZiGFphHC8tsiANJDmhBOqeoBas+F
	zkud5uzn9nM3WmxJHRouoMmNvBPcyG9m+I7FDgOCzcdQTIhRliUIVdRO+tBhQYtq
	5uTJ2o8ITol/jbA8m5K5VpBWN0okUjOEtWmzW4nUcrI1YvrxaxI4zriXQrq/YLPn
	xhxh0nwaCg2bq3mqeAYueHqmQMsSaSJOyePg9sMwEh5G2N4GXPALwiZxMxaNiJhh
	ruoCTKkDhHsZxNFT7vm6Dt/Mh7sTJApJ2fVy43a4VnUenlJ1y4NLlG4mXHR4z49b
	BadpVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0v1pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-336b646768eso13288020a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760524069; x=1761128869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsypE5wXOc0oAjNZDpo2kWWSLxG6ciEpndDtjgOZ3Wk=;
        b=qchaHptk5p98ENUBydNuUwBqt0itfWB3AR7V0KqZbIEH02jG1kn2ZY2e4FL7U8nrgM
         pbORHjv16YFcbj6nebpUtUrqbMJnuxwkpT+sOhKW6KXv3LknxtY0zRE4jD293LqdHDte
         U4R3k4a5hzKfrbixUalbYTzF4efuLDarLWJ2+aiufDewcooladBQ1n0XZUh3Jj7C9PP3
         yVn7gHE1pbvvXgzgxjNAb0kI84QiHyb+eJrts9T1hu99tOyzlW9q+ED1cajuhzK9lqns
         JqUObfVdGToBHikhmYdZmKyXzRPaUQAg9ZiGxcmTIWimrprtQYtoULWTmXgW+ADmjqGG
         RftA==
X-Gm-Message-State: AOJu0YwnfP0Lr1oPkk3Y6kxVTqRIPdz8jAMdA+e11BMhJJC2BdQga6qX
	t/AE16odwNeNR/uKNDFO0NvO+hT4UQEz7dIekep29i9MWr0b8sDqup/fhc6qP8JzG0UJp92SPCX
	8Ah1JWTDtu4AIj5fG2fblC/wSu0uRXSqw7l8/dB6FKfXneCnb/5h9+U/5vqhR56Epf1OqZCf0uR
	9WUmLkDg==
X-Gm-Gg: ASbGncs3c2wnvIemqE6nOhBFWHPO60a7Dz3pfXs2vakMnNcZ0DhecqE2ktAe5KOAE9D
	BADhkXT5DEiTHeTXoYKZqxLNBXnWIAtuMT5y2yPjigraxz2rzVbGN4t59wEUB1n8zfH10IQy3Cy
	6gj209yxuOZBf66FkUpj6/LoVxddNwTyk10pIJ+G4Nb8QmD5gPYmRrteWb7qLygPoxBhzGDYnWt
	iC+sPzWlKHZnaj472qr/y7cAAadVv/m/OWgyB5fpcwzXABw4vdjehe1hICHAGIZWE42Txa5v5rU
	ZjFysvTSYdFOiIC7SMMwKjoV+YBqDfvTXCAJFgU8QHZ0CxULzdhUOEtNadBus5m1HEEfI0uM/2Z
	+Dgh7mLTRIWw=
X-Received: by 2002:a17:90b:1651:b0:330:ba05:a799 with SMTP id 98e67ed59e1d1-33b5111708amr42052222a91.16.1760524069017;
        Wed, 15 Oct 2025 03:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRFkLffYhJNP7XAH/u0Aq7wHtAEYsMusMRG0+7QAyf2Gp9T9gOYvAM94GZz2D2lqHfrbQ5tQ==
X-Received: by 2002:a17:90b:1651:b0:330:ba05:a799 with SMTP id 98e67ed59e1d1-33b5111708amr42052192a91.16.1760524068469;
        Wed, 15 Oct 2025 03:27:48 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787a1a7sm1993574a91.18.2025.10.15.03.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 03:27:47 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 03:27:33 -0700
Subject: [PATCH v2 3/6] phy: qcom-qmp: qserdes-txrx: Add complete QMP PCIe
 PHY v8 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-kaanapali-pcie-upstream-v2-3-84fa7ea638a1@oss.qualcomm.com>
References: <20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com>
In-Reply-To: <20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760524063; l=4435;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=oFnKNL4LlT5/93e0cQNiy8Qw+BXY3+8dDZtcph0oAzE=;
 b=VxG3wO8sb5ZPOC81rpuJygWhJuojZpFxlbQ9VEBmRmzwFw9u1rCZFRghi7ePU7RjwLoflrg2+
 0PevlZaF4kfBnzV8rWHFr/OPYt/G8NqjTln4UVx+XwSULgApq1eRQ0s
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2PNwaDL11hD4
 kentOYJlCd38d+i0BDOpO2IXup4ms2ekowvRj1X/nlRAIJkNTRPYPqZ1kIarzl4fkwDMdi1jBNJ
 pJ0q2PYqI/3haJc4rGOuui2W2q/EGr0+7hgnl8aJclhGotCHEZWOe1BU4gvTf/RClwBwos3Xm14
 RqtmIgSVK83OwUo105MVBX0ypZcDx405q1yZ6yaYxjkkO4gXseq287F8/U84KX41YdU473gIk2/
 l1y/QMm9jlXlmtfqncBJ8DRqQZvolbYxrMKv5XQ9WKQRTOx9kgDfiH/9uzUeLMt+Cit1Y6t8O7V
 yeUt9jgKGH8bKFHNutXR6+J8eXvIT2+tmk6TGeCKQ==
X-Proofpoint-GUID: oV6dazjYOpTzuqaPV14H20R1aOeaw_8V
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ef7726 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AMX_CUzcla2ZGstc20cA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: oV6dazjYOpTzuqaPV14H20R1aOeaw_8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Kaanapali SoC uses QMP PHY with version v8 for PCIe Gen3 x2, but requires
a completely unique qserdes-txrx register offsets compared to existing v8
offsets.

Hence, add a dedicated header file containing the FULL SET of qserdes-txrx
register definitions required for Kaanapali's PCIe PHY operation.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h   | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h
new file mode 100644
index 0000000000000000000000000000000000000000..181846e08c0f053c5cc7dbaa39a1d407ffdcbcdc
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
2.34.1


