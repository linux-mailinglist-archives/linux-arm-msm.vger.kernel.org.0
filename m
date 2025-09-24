Return-Path: <linux-arm-msm+bounces-74752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F79B9C9A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 215911BC43FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2820F29BD83;
	Wed, 24 Sep 2025 23:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HR0Zk/AJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E302C08BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756814; cv=none; b=B9zlpKuJDlZTN4yTE/XwM5IBkkYFfrwfl9EKWqemKUfIBh1+U0pGHnOIZwdxg6NpcBT9qA46XVyL7+hpq8XQHG2EbGI2XASdjo5tjHTcr0XfoKsyiSqNNNIy6GOJQoG0Di27FzeqapI36k1YZTZn7E0U4gk0Pr6q6vsNRk0FuFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756814; c=relaxed/simple;
	bh=s17pVTpfHpJBXVbeGOGy/DKB8otKGHuREpCt9nlrFq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rkPAFUE4541B4p3nI28HBZic9u5n8ydZ2ycqhrOU/32Dt921dna8MO5b6/dgcsArKtiykhuVSnM1rxng6H8TxbhUJf21SgxGwYJp41v7M9YJG5TzDtbYgkKpJAzodmhG9cor8HlhLPrPGo92svNX2besqOE9aWtt9XdVjZUpspE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HR0Zk/AJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD2eQ0025120
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ndw+rqs1qizTVWC5reblwW5J0ZiIr5WD2TSz5Cliqlo=; b=HR0Zk/AJRp6407YY
	eIvGNh6kUVESKF93V0hMQYoJWv7qmPcN33UXFe3Y5crrW8tTW0+jSgMHTJJXVsvd
	huJJDduF5E2VwB3mhSqftHNbcftWmjzEeM2aMG1KD/tGmGUxMlXyYx96a+R1jJA3
	k2HjgGCNO1SeYQqyfhxV+beVBojHaKzX6Xpty5OHm65S2r4FIrHjJeDYj8jBQrHo
	M9ZakkPXql7b9nV7nq6Mjh0mElY37Kb+jTEIvKSXqT945eUZjGZl/QDlrCvPgVRv
	WqqOGLf6v++FRRHUWy8wkeFmq+l0rVqg2mZrmUOaCR7aZ9uWKvMlCcSRFWSLjSch
	tFGDog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv162h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2445806b18aso3031775ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756810; x=1759361610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ndw+rqs1qizTVWC5reblwW5J0ZiIr5WD2TSz5Cliqlo=;
        b=hn/rQe5MN/N+jmA6uOwee021FvKk2RQarr2dwpUOxpN+BwLC4UhRmEVpHZ/ERQ8O9/
         ceWQb75tCSAzX/fGp9NyO859SnWmjIXgVIFjU6G2Neu2jSdpnUdmC3N78muGm8iY3e/c
         LjJMiPdf1vVrzA1SzWI3U32km+e+jc4LAEe9wHjmJmCdzDt0MLd7L9CdIMMHQuLxFqRK
         3fgdZt7n/ta8MXJO0d2fYJzTR6t6EuN25M096t0eymMQNSSrbgQT1avi5s2Bb/V8PDRv
         XzAfVUeEmxtz4CPC+8x8w77MXChr93J5v5eQ2E9U6omA9O1oVH0lvfX5KcTH121T1sFL
         zweQ==
X-Gm-Message-State: AOJu0YzGxsyg4TVRltNYsRihFsCO+rtsM9Me5VBWCtcf6zba6F25Na+z
	etb1tbLO+Jy4cTB6ycuKDhQxs0588bhJX5E4RgixKCccKWwfTZl2mrql4G5qZ4Ik3voA7D7Zr5G
	qcGLEaHyxROpoXCbCx1SP+dPKdTGJApuGdglKt6wa5TJG8fmICr0XsZCArMM51OisZFRQ
X-Gm-Gg: ASbGncu5U6zjv5SQOa+ajfKqRUly5phmnfrVvZkCz6zdClgyGkL9q8un2I9HllE2nsB
	2Clg0q7lADzh7B4b5HevmiBX8eQ+jD+Ih7MaBuLzXS+4Yzoycw42o+eQiiA2M0wIj8mpaS+Gk5B
	3vJdxiTHqX/bHjUCUgnhpC902k7DtWHkn0AHK+wbZZiGwv14ZSuZ56vtdXjMFLU64SBSaaIdlyD
	UeSwUvoiR0mtzVRKeFJ+xEYA134bYK2qDb6dvhxWS1mwCEShXfJ/MKTQW4oT8RuMcwZhQOMr7Qb
	TKQhw0TgrUR+5PXx6Xx9aKZ7h2wZvB5aCDqJ3lNFBzMarRRUuU5FOkRYP+BZ+kWNm/vek5CTHr7
	HjeGzC5kd/kv9F5E=
X-Received: by 2002:a17:903:244d:b0:25c:392c:33be with SMTP id d9443c01a7336-27ed4a5c567mr15661665ad.59.1758756810038;
        Wed, 24 Sep 2025 16:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5CADDonj4Tj3EKc7HnMksbjmMI+Bu1zU78weaqGMcam4AMLJAz+8098+e9XI7Mmhcp0yHBA==
X-Received: by 2002:a17:903:244d:b0:25c:392c:33be with SMTP id d9443c01a7336-27ed4a5c567mr15661345ad.59.1758756809568;
        Wed, 24 Sep 2025 16:33:29 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53ca107sm392911a12.13.2025.09.24.16.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:33:29 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:33:20 -0700
Subject: [PATCH 4/6] phy: qcom-qmp: pcs-pcie: Add v8 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-pcie-v1-4-5fb59e398b83@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756801; l=2102;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=lh5soms/PW05Acpi9g8AxeEqOMMit9vCSgZ1ViTmATo=;
 b=5tMPZ0N4k9d3RS+mJPp3yzpfG9uOjUB3PGKnR/MMsJHFt75AMbLGDGORXo1/pTnX2w1v6Ctso
 0OHJhRjQjxHAtqp/3XVN9c0OF/4OPIVcxiIsGLc9IG85bCKf1oKDjFE
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: v9BJKKE6lLRkwDxjLWXVwVErg2DX8lnj
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d47fcb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8UDt2JBBUKJrZSEALGsA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX31+3wSRMib/K
 ffk7ARYEE3IBjcy9C3KkvVppwaca6w9+9oQQkBP12koON3ECSUHdv9Zk5uy4s5ii5F+5KG1R5sb
 LMPbEWBj5EgLjQQ6mamekIujt9ZD5XiMV0ij+dBuRQR//9iddwbHYDVsbvqMWEclef7jpJqwP9F
 5FRijawftT2ACquiocjRWyp7qN7fS9cIJyYZTtJ5t0aMPAb88XYPk1w55fNYaC0iDjaEHGTqirO
 sGd+t9iSGQm/UT7Qjvk7ei4B2SsOinHdEBZAuZuD6HO9Y4PvUdQvPN2AdMekXPah8snJ3m7tG85
 JIZK4WX1zxZ2MnJWlE6oiMJSczoeRtLx0pDGjC7a6/lDGRXLlfr+whRSSj2pduEB97S12CgAH1T
 eon+KMiv
X-Proofpoint-ORIG-GUID: v9BJKKE6lLRkwDxjLWXVwVErg2DX8lnj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

From: Qiang Yu <qiang.yu@oss.qualcomm.com>

Kaanapali SoC uses QMP phy with version v8 for PCIe Gen3 x2. Add the new
PCS PCIE specific offsets in a dedicated header file.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v8.h | 35 +++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v8.h
new file mode 100644
index 000000000000..5d630e5123a5
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v8.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_PCIE_V8_H_
+#define QCOM_PHY_QMP_PCS_PCIE_V8_H_
+
+/* Only for QMP V8 PHY - PCIE PCS registers */
+
+#define QPHY_PCIE_V8_PCS_POWER_STATE_CONFIG2		0x00c
+#define QPHY_PCIE_V8_PCS_TX_RX_CONFIG		0x018
+#define QPHY_PCIE_V8_PCS_ENDPOINT_REFCLK_DRIVE	0x01c
+#define QPHY_PCIE_V8_PCS_OSC_DTCT_ACTIONS		0x090
+#define QPHY_PCIE_V8_PCS_EQ_CONFIG1			0x0a0
+#define QPHY_PCIE_V8_PCS_G3_RXEQEVAL_TIME		0x0f0
+#define QPHY_PCIE_V8_PCS_G4_RXEQEVAL_TIME		0x0f4
+#define QPHY_PCIE_V8_PCS_G4_EQ_CONFIG5		0x108
+#define QPHY_PCIE_V8_PCS_G4_PRE_GAIN			0x15c
+#define QPHY_PCIE_V8_PCS_RX_MARGINING_CONFIG1	0x17c
+#define QPHY_PCIE_V8_PCS_RX_MARGINING_CONFIG3	0x184
+#define QPHY_PCIE_V8_PCS_RX_MARGINING_CONFIG5	0x18c
+#define QPHY_PCIE_V8_PCS_G3_FOM_EQ_CONFIG5		0x1ac
+#define QPHY_PCIE_V8_PCS_G4_FOM_EQ_CONFIG5		0x1c0
+#define QPHY_PCIE_V8_PCS_POWER_STATE_CONFIG6			0x1d0
+
+#define QPHY_PCIE_V8_PCS_G12S1_TXDEEMPH_M6DB			0x170
+#define QPHY_PCIE_V8_PCS_G3S2_PRE_GAIN			0x178
+#define QPHY_PCIE_V8_PCS_RX_SIGDET_LVL			0x190
+#define QPHY_PCIE_V8_PCS_ELECIDLE_DLY_SEL			0x1b8
+#define QPHY_PCIE_V8_PCS_PCS_TX_RX_CONFIG1			0x1dc
+#define QPHY_PCIE_V8_PCS_PCS_TX_RX_CONFIG2			0x1e0
+#define QPHY_PCIE_V8_PCS_EQ_CONFIG4			0x1f8
+#define QPHY_PCIE_V8_PCS_EQ_CONFIG5			0x1fc
+#endif

-- 
2.25.1


