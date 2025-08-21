Return-Path: <linux-arm-msm+bounces-70119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D63E6B2F474
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 11:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74423AA583B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 09:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CB22EFD87;
	Thu, 21 Aug 2025 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4SimEev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840C02F5333
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769500; cv=none; b=Yz9XoGlNMy8vs1/wdQ9vzKkYpv6vmbM7uNLYZvZDYjzuahHS/snMLqTuon+YLJfYSyEyAOEiJSVM3FJfoyJ1wVY+Ig6flW1DFT6gqqgQD3c0ljiSDu0HmIeKK1MmosKK0o4/QeIo0X6jzNwTWbxQiKKrlAHYuhkbiMxM2b0dWZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769500; c=relaxed/simple;
	bh=u8m9J6JQcdijVzZyCUGGAb3P5FvSVwhfqYJgvJbWutg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aOf1sZzHPortDUAnu5Cu42xpOdu9sI6FygzjUdFAGVt05fEsAspvIYLkUOayd1SX0oXUFxHeWrGwKrSwGPC46qS6/SCrO6ZdghcdBnixR+5MMx/3rV/lKnyFj29X90VAOS2TjTkY29E8t/09ZQqFXRQpCwAI+UUgDdUZjPAdfgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4SimEev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bC3u015272
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAjVIj9zZFihL1lRBahHpibojgWb7AeuAiH+1H/bqwE=; b=O4SimEevwrTiOB8/
	Q/CV5f89mpciz9a9uEDPJyNEn8VgtPq9vk+dKGBbBRSB1dIe4iLYwrUlBkmjskIG
	hk6wu8bY8y9gSp2RX85NjuPxbk/z94PtBw7SBru61U4Q+oYqVu5cN36pMaqauKPP
	lWS0SVIDkfWIb2/07PSxPsjt0uSvSm+XxiSiaXFd5aW9SuJu7ZYdlqNWnvBd7ZyV
	HvCnBn/wkpkYVIuq9vn7q0Qa59XoSIvDeSLtrfs4GXJ9A0NcAfAFyP/59NbL2DxE
	B5lyV8Xt5SmDYrIyTx/Fpw7JKEldqS53xz3nfT4x38PfkctgChymWsTpn81YYCJp
	llIGsQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cmyag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:44:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e54a1646aso988070b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 02:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755769497; x=1756374297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAjVIj9zZFihL1lRBahHpibojgWb7AeuAiH+1H/bqwE=;
        b=R4df/LBbIjY+ktMnlBLcWueRg9vHQUbN/KEFg0PZRSW/SH+61yVDPgUsPqgsCNahm5
         qm6USdgwHJMTi7yyz85+eyYYieV4yBicES6wo6unAx1+W8J1n3v4cVM8b5dU3B0Lwqs9
         EQthAgCaky4fgtpz42QyRmJt3yPBD6Yl5de64LVQcK8ixaigQ8hGCxHXRt3ZVX7W5aOr
         h9BrWTWyJoUHmP7ZvEk9mBlx6ReFgF+2YaYJC7s0LbggCi0dqSHZJ06Mw+YZnQ/MQqQn
         Z/mkyoUfX0s7X04th9K8n4bSdd4MUtJpMSLrhn466ZxO35kyVtFodJuWr81gXzwBVrJy
         ju7A==
X-Gm-Message-State: AOJu0YxsLlrSftmxCr8Lgp9iYUxuiG9NuBOu8r/1/uWyYDlyA6jGIP2s
	VWjUweFtwR18T9OQn0zM+STjxenB4CtF7YUv1v9GetAvKWVWXzV/KiouC/A4i0a4cQouAV4ffm7
	V7BgSDgSUyeMApLTUM/hDlwsJtWG55GXMop/EHn4StiduRRgS7XW3GpIZhrM/Lo3P/uAQ
X-Gm-Gg: ASbGnct9ondDlGueMC0Gotle7i5bCn0iXW7KjV+hlrNJSa0brhWwHLvp8QFEeVfz1ww
	bQbBE05PHYvBSLEY51Ppa68cf7zwzneWOF/NAXpHXlotW1fZqUDTH1CA2wrmAyDeCXJVhwScMKG
	5Czm5jExQtjUEQWLUHpr8HQ1D1SAVnDIDdL9SlsUIPmiwxllSDN/SL++R03A6ZjPFXuX3nSJ2/f
	E4XTh3WdC75FsIBhdb9gTtJgMmqP9c/u2KKfnINmVEEK+ZjoKYqjf9HcbCuSQA2EF8tXVpEEJUY
	K3BEA043ytC3I+mGjPc08i9qrfB94y4HRNuikNQAwb15Z1OO0Je1arp9ow8LlM4UJXsYWoE4DT9
	csQqX/htot0EjfsU=
X-Received: by 2002:a05:6a21:6daa:b0:240:1a3a:d7bc with SMTP id adf61e73a8af0-2433074ea5dmr2729243637.3.1755769496734;
        Thu, 21 Aug 2025 02:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/MpkzQr3ODF27xl6H7fzctS/steJVN2Lh7mmHLZCmX18Qc+LXKukq9LL+tR+L4vIIZsB+BQ==
X-Received: by 2002:a05:6a21:6daa:b0:240:1a3a:d7bc with SMTP id adf61e73a8af0-2433074ea5dmr2729197637.3.1755769496270;
        Thu, 21 Aug 2025 02:44:56 -0700 (PDT)
Received: from hu-wenbyao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f23d853esm1426078a91.6.2025.08.21.02.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 02:44:55 -0700 (PDT)
From: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 02:44:31 -0700
Subject: [PATCH v2 4/4] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen5x4 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-glymur_pcie5-v2-4-cd516784ef20@oss.qualcomm.com>
References: <20250821-glymur_pcie5-v2-0-cd516784ef20@oss.qualcomm.com>
In-Reply-To: <20250821-glymur_pcie5-v2-0-cd516784ef20@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755769489; l=2773;
 i=wenbin.yao@oss.qualcomm.com; s=20250806; h=from:subject:message-id;
 bh=JCxdUH/Y1jTAi945mFOnkGKBqKReuEeHRFI8YpRwdqY=;
 b=6wWnoLAUA4kYP35QHTffBdgSdXwR5Lbvh/SsOGFjyL6WHXSpedpTdCm7nm6S/liahDEy/d2bs
 IHolWYfa9GbCqIKvGTxQIMxeN2g6PHyR0poVPj8UmQfDLMRioUouvFd
X-Developer-Key: i=wenbin.yao@oss.qualcomm.com; a=ed25519;
 pk=nBPq+51QejLSupTaJoOMvgFbXSyRVCJexMZ+bUTG5KU=
X-Proofpoint-GUID: ZTtJODn6eEgyKs5bgf8ikV9NfJBrqfaN
X-Proofpoint-ORIG-GUID: ZTtJODn6eEgyKs5bgf8ikV9NfJBrqfaN
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a6ea99 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KvwrgBbZ-pJFRlqJlL4A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX46CVu+6sEJIv
 rL/GZSfUEPgDlqBebVABtguFoV0VRe4XmcyqS6w6z4qhjm67Tn4fpY4SlbIMIvC7tir9xfvtnQn
 Nvg42jK+c7s7zox+ujn6QtEvOcTn31fojfGpNtSRqinATJkL7Gbt4ZCoZil9aM2C+FWq35UO+OV
 zw0RqHb8aHP9725eio7BDDnfuBOxxwXmACY6jFSgwuORrpVkbYyxDLGQavaxL9bVyIgRM55aJI1
 76M8ri7RJ2wHGNL5oNw0lN4xSQUR12zmSTe04qPdH2z4Tphh2yGr911OYaob+wS9e07OWaw+oPa
 /oKoye+H9h7uT+Ngk36ISyMSd46/q+MorZKjxWQ3Ft3mIbvdi/sO+H58s4bQr/Q2lvNykbu1gPi
 k7t4hWLhSi9VkoqvULpMGrxKufmBBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

Add support for Gen5 x4 PCIe QMP PHY found on Glymur platform.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 95830dcfdec9b1f68fd55d1cc3c102985cfafcc1..fc67ee1e4a3c0c6f2ec23f51c09c3cc16df9aaf4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -93,6 +93,12 @@ static const unsigned int pciephy_v6_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_POWER_DOWN_CONTROL,
 };
 
+static const unsigned int pciephy_v8_50_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_START_CTRL]		= QPHY_V8_50_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V8_50_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]   = QPHY_V8_50_PCS_POWER_DOWN_CONTROL,
+};
+
 static const struct qmp_phy_init_tbl msm8998_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
@@ -2963,6 +2969,7 @@ struct qmp_pcie_offsets {
 	u16 rx2;
 	u16 txz;
 	u16 rxz;
+	u16 txrxz;
 	u16 ln_shrd;
 };
 
@@ -3229,6 +3236,12 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
 	.ln_shrd	= 0x8000,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
+	.serdes     = 0x8000,
+	.pcs        = 0x9000,
+	.txrxz      = 0xd000,
+};
+
 static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -4258,6 +4271,22 @@ static const struct qmp_phy_cfg qmp_v6_gen4x4_pciephy_cfg = {
 	.phy_status             = PHYSTATUS_4_20,
 };
 
+static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
+	.lanes = 4,
+
+	.offsets        = &qmp_pcie_offsets_v8_50,
+
+	.reset_list     = sdm845_pciephy_reset_l,
+	.num_resets     = ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list      = sm8550_qmp_phy_vreg_l,
+	.num_vregs      = ARRAY_SIZE(sm8550_qmp_phy_vreg_l),
+
+	.regs           = pciephy_v8_50_regs_layout,
+
+	.pwrdn_ctrl     = SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status     = PHYSTATUS_4_20,
+};
+
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -5114,6 +5143,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy",
 		.data = &qmp_v6_gen4x4_pciephy_cfg,
+	}, {
+		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
+		.data = &glymur_qmp_gen5x4_pciephy_cfg,
 	},
 	{ },
 };

-- 
2.34.1


