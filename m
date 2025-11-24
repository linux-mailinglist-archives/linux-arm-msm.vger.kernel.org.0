Return-Path: <linux-arm-msm+bounces-83035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2FFC7FDED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2829D3A6950
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A87D2FB98A;
	Mon, 24 Nov 2025 10:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ku5PfHY/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5yN1E/h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09FA2F7ACA
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979965; cv=none; b=rheMUxJC7jmfMx8jY62KJWws7N9QtNqhRp7c4Ji4ozbs4T6T+8ZL2iK+xEp/tIHGr63vz7UX+V8Snpu4Ho0U8I4RqBxgYal4clJEvfP+b/1gBxzQLr/TauEfgBM8F3VJW3Z9aVkqeve1VykVWfwsnUAd27Z1HUJEuHWk9LC54/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979965; c=relaxed/simple;
	bh=ZbSDkniGcxNnPJzqaBaMjAhjt1v3sdTM3DUt2uBqCaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nv2fMxrJflxGs464PAqFAoYQOcd/KvMWL4V5a6LQoiPaosu8ev+ySYQ2A9NqP4tFVmPitdKdRKQgr+EGLueDXb6RlLPS5FNjkEqHILdD54HUnkVa5fL5dCL1DNd4oDTEARuayy1RbWcQPbmjdjVysOVQ2tGlLwa5cB6kGgDJq/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ku5PfHY/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5yN1E/h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8IGZX2614414
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQXVl7HhYAGGwBcSc00STLR56wP1a28fkEjKawQeBt4=; b=ku5PfHY/QKNjqFFE
	e2fg6K7ZbjHxoMxPMiv1bFFzcfnhBpUAs1ac+8UBGv4sy5EjFSM5KQ0IN0S6A2mt
	SvbCBX5cbJj6HXphdFuNQ3MTyGCvHzehr5qLdG5GZdDU+9ZCobhDgJxKeNoBg+0C
	rEFbMDL2KV1MTO0ZAuhBtZmdmbYc5aVVGeUzUqskY4FIiOtEKCtxbzyfvCxwXqJM
	6jgt+zMVfE0u8Od50J70rhQTjbLwKP+QMOwnnU4CW5dPdK/mu3+r89XCh8ObnTzn
	0GS1vUeAAVb8VmFJqikhqNnhjEhUO5sH0A1sC5sK/jWnMzzAaPxIqfyG4Ow3KYEz
	y60aNA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6ffcmkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:26:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b993eb2701bso3944272a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 02:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763979960; x=1764584760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQXVl7HhYAGGwBcSc00STLR56wP1a28fkEjKawQeBt4=;
        b=a5yN1E/hucOPVXaZ3D/q3rGjvInsi/S+mBXorQysZ7eetvB9CgtgSZdk+g55CjIvzy
         KputodK4g4ECjpEWeRFeNXi+hn9QNqMDWoAY3SbK8gmnkmFOTJ4b5VmzuHOMWrjzMmRb
         ODBqZIyY6DDjei4qINOB8Wwo2CwuMN1Oj/jtL+JrPkR0dqxfU0R2DuLPuxmNVEbh565t
         YTNiREemtzAj46GOGQcYwacyKN7xSknBQC4oO5Jz8Bu+8b4T/Z67AOlRdEO5hsMvrNuW
         iqp0KzInjJc+ct0MBXZV/wWnQjWP/m6uBP1AEv5Bza87n7osCRLP5vuMZZo499t0eSC+
         N/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763979960; x=1764584760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQXVl7HhYAGGwBcSc00STLR56wP1a28fkEjKawQeBt4=;
        b=Pue07fFn2yfizFv0oQP8feaoxbcgDidY7V9hUG8n9uviE0QNYpUq125jmTv6WJ+xhB
         pk2Pz+T1nqoWGPj9D9uB5/c+0BERNVXo19gHJIZOc8m7Ym/jdPbhrd4FMq6cHkaOgsYg
         gUapHHp82wmWX8/ilLnLDRfB5kWe+wXddQ073/UuhP6VNmReJopVaA85OeQa9d67TCd0
         oEw2x/TRPs42SWG0cUl8Gp+5TmviJXro+7os7J7zY1Oh+YMeH2qzafIqW/4w15LDSph9
         tGYJ8Hp9lMtCxAFAGn24MoOykfVH3RWwTzrzJcWvqYHhZ6sYF70EC89tB+fGvzbaxBRp
         B3RA==
X-Gm-Message-State: AOJu0YzZYHNACm3QBPG2W72FJcOIe0HcZC1rt+Q1fWNvhJh6U0mQeR+s
	cMxhuCkMlc4sHaEExzx66N4k1sbmYx0OGCabSwuIwFpkeGGJSjYsOZo6WnbYm03egwMoa2lU/Gy
	Dthib5x2BjzX7MNEQPL2r2u0oTapZRAvZviib33PkPCv7yNeuxX1uxQBSTKKGrYO4L3wl
X-Gm-Gg: ASbGncs12ItSKLPhxM3EFUfVWNMs36i+YUpH4dlD56ubs5c8Yr1vtc1dzY+9m6/jvCu
	CvIK53ZnRs50LBPldi65MSNgC8+IdoNUaBTcpYPiST87KpcrY9AU+R8GeOusQoifyonZ/YjlQff
	BjhUTJkHQ6BLf5F0ULh21uKAOtI5B6Zm/wkAujCtCddPezLgZzDYj7tyFM1RE/GGTz0ukxfGDsR
	wc2SVBydcuKHsLrd4lebQpAPGsrLnCM+ukO/EvOmwz6QSoIwPJhUHTEs7NTnEmWiEH/h3Hm9TAD
	rZg6ClFs0xyTyiI0AyD5gxb8Li2FhmgzHc4yAsLteQ5ITSRZuwGC6w3pEH4rdOPBW+jEk9z0wP4
	+p5qpcZ4nebkNFq2iXD1i4iLQQEgCFOfYI6soLna/znCL216cj/g6F5+Z
X-Received: by 2002:a05:7022:2214:b0:11b:95fe:bedf with SMTP id a92af1059eb24-11c9d84e0bamr7668024c88.27.1763979959486;
        Mon, 24 Nov 2025 02:25:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjOw0JxYuSliQthQWESX5rWtgkd9v5Hu0yOrbQZZUX2pVdDCFqf7mmbXihgRVb7dZpwkZdVQ==
X-Received: by 2002:a05:7022:2214:b0:11b:95fe:bedf with SMTP id a92af1059eb24-11c9d84e0bamr7667995c88.27.1763979958924;
        Mon, 24 Nov 2025 02:25:58 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93de6d5csm46140627c88.4.2025.11.24.02.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 02:25:58 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 02:24:36 -0800
Subject: [PATCH v4 3/5] phy: qcom-qmp: pcs-pcie: Add v8 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-kaanapali-pcie-phy-v4-3-d04ee9cca83b@oss.qualcomm.com>
References: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
In-Reply-To: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763979955; l=2279;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=ZbSDkniGcxNnPJzqaBaMjAhjt1v3sdTM3DUt2uBqCaM=;
 b=BUvw/OMtIT27B7yF4TR0hcOyBUtfnd/h5DkFUgJZ4FRueKtOuiH2eZ+MqYmLeXuK2j+388FKa
 8nILT89GyEEBVfVW29kHhgoneTXg1ipLBqX6/B9mdRajWTRDf6xPxW3
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: yiRC0xpWGto1UfyAtHAMdGNxhScLomtU
X-Proofpoint-ORIG-GUID: yiRC0xpWGto1UfyAtHAMdGNxhScLomtU
X-Authority-Analysis: v=2.4 cv=OsxCCi/t c=1 sm=1 tr=0 ts=692432b8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=cXB1dxBGfnZZ65A63A0A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA5MiBTYWx0ZWRfXwpVfw0xVS6jD
 RhhMvIFWHVp+zXJTQ+Y99ZJjSbKo9UpzpJ4nGXHPoIfXfIltqz03kLewsCaV59/JFCLr8+L/PLK
 /AFupKY3/KD5cxYUPB0JNkUWFqt8mc1R2rmvE5Lcs5zCVGBS8KPZSkkzx1SpjDqlsswn0OnU2wn
 4B/KmtexhofjXS8VXL8JF2e2jkrvV8eayFIc6X01c9DO8+t990a87bHp0h+6aWS4rzb6WEQKMOt
 FH8EU/HO/0njtc4mB5zBbqny+YnLTOM3XBFj+qlHjDvzhOZzqp4d1D9WcNMSKsThTYdBRp80uAO
 dylxaEQ5rtNdS2DrQdDq/c+LNLGvIBZdxi58Xhnax9MBPkQaXwTkUXNf0rMbKtJkFt43ExvIVr3
 UPkK1+ZpKCzscwkrgCqx3Rb5DyCdPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240092

Kaanapali SoC uses QMP phy with version v8 for PCIe Gen3 x2. Add the new
PCS PCIE specific offsets in a dedicated header file.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v8.h | 34 +++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v8.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e06aa9d73d588aacc86fc1b87fb17396de700b8
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v8.h
@@ -0,0 +1,34 @@
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
+#define QPHY_PCIE_V8_PCS_G12S1_TXDEEMPH_M6DB			0x170
+#define QPHY_PCIE_V8_PCS_G3S2_PRE_GAIN			0x178
+#define QPHY_PCIE_V8_PCS_RX_MARGINING_CONFIG1	0x17c
+#define QPHY_PCIE_V8_PCS_RX_MARGINING_CONFIG3	0x184
+#define QPHY_PCIE_V8_PCS_RX_MARGINING_CONFIG5	0x18c
+#define QPHY_PCIE_V8_PCS_RX_SIGDET_LVL			0x190
+#define QPHY_PCIE_V8_PCS_G3_FOM_EQ_CONFIG5		0x1ac
+#define QPHY_PCIE_V8_PCS_ELECIDLE_DLY_SEL			0x1b8
+#define QPHY_PCIE_V8_PCS_G4_FOM_EQ_CONFIG5		0x1c0
+#define QPHY_PCIE_V8_PCS_POWER_STATE_CONFIG6			0x1d0
+#define QPHY_PCIE_V8_PCS_PCS_TX_RX_CONFIG1			0x1dc
+#define QPHY_PCIE_V8_PCS_PCS_TX_RX_CONFIG2			0x1e0
+#define QPHY_PCIE_V8_PCS_EQ_CONFIG4			0x1f8
+#define QPHY_PCIE_V8_PCS_EQ_CONFIG5			0x1fc
+#endif

-- 
2.34.1


