Return-Path: <linux-arm-msm+bounces-69712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2F6B2BE31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E59E582C01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99AE321F2A;
	Tue, 19 Aug 2025 09:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WxLe+u3Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DAB320CD8
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597175; cv=none; b=H9Lyuy3ID/5O+39/DUyLEAMa5dJWg2lnMdQY5PGvOgrPeNf23GKqNHsDHC/2vdgRYU55pIzxqXytOyJrBx+FRbOnvecFmHkCUpJbLOD9TcG+TLERK94c/Y7X5NTBU+7Iax1KlOoEoI6cDXgGNAduh4fKDDhLxwFPfO8DYzvfptI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597175; c=relaxed/simple;
	bh=XbC/EhKIPbWgAx5xtCXs15Izpyh+QjiCFb5aWinn93k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/Mbp0AhvfFrV2wAPvu0LkZuBCJA7uLs59GCm0C4XLKCuoD+99oJnw+t6pZ2gvtDmasBW+KFORnopWzShttdbiMKQcdb7h4biRDdhUioMRbBCdgI6+yKC/hubDHkmNFmh/gVnJ6jLZxagSN+WQJ586/LXjGBMBUWKqaONZVXzaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WxLe+u3Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90auH030852
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZXdUtQNXJ2hesfvhNvI/OWy7YCjNNYfGl5bsLwFo4PQ=; b=WxLe+u3YzcryvC+U
	6hBambZ+jwevUrQjnFGvbMsmUWo5fF82NysSjIDSRMKtM+4i2ZEGvuLG2g/LNkRE
	V8im4WQf0tG7EBStZmOLzapDhH+C8xqSMOGvdai2EUVZN+pCjKLatlPm8BoE/kwf
	bZ5AaMn3s8qSGuvgivOjk866wHVjGv01Wo77tAWdBpx2rt2LFSGxPT8n8IMBc23l
	7Z5M2Jd62WJ8JR/9MqV/NBgQh/lwK7pDBHuOjX/UGUCopZTmREpIkPL8I3JuTveA
	I8nTPLVdi/aFVvbBYxf0l/oiTNK/2ic/2EGF1WPNAAQlo6SRgvE3aoCgf7XRkH4B
	/hxeiQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtg976-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:52:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e55665b05so2518957b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597171; x=1756201971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXdUtQNXJ2hesfvhNvI/OWy7YCjNNYfGl5bsLwFo4PQ=;
        b=RItM2QkAF298EbSIIB5tn7dpVWPyK4oAUmk2w9ju83WElL/4ql43Bmt/nWn3tsaL88
         sMp7B5+9jjAQwOQdX+DXI4QJOM+2KIkx9rKW0Yluvos452zuT45PuTVqIQSR1PFrQj/i
         3nxLqZ/7Tk2fXZBfVA7iii5e9IKCWIHKm2GLB3JuICqmb5UVps40jkMIEbFyd6O73uLx
         T9mYj9sD0f7jD5Jy0y6q1bDf713+FYnIrwtWcpBsSFotLGLMbcaz0+poc36EgS6pnQVR
         O2KyK4PolxBd4qESlxEaYdzfEg8CBpB0jkdmBImFNrFR9WBIMkLLTS3UPuz3fyect4Bh
         Z9vg==
X-Gm-Message-State: AOJu0YzrDPZSXOl3RPVIk6cIytjluB+rOh9G81nD+DLYJkiLSTv577DQ
	/SIQCtIhLmgeki/Wf+yuazIaZ8w88+P5nVMTVLRFnzgMs0cRdOJ84isYiegRSjDqVoAneeJtcmG
	nwF8h3QnCVY1bsTVqQoi9v5E2i7aiRDoQ66gu+sfXcnfGp4LjwCQuPrByivDqi52+d9zC
X-Gm-Gg: ASbGncs9UJ6JSHJERHdaXoj011j7ZHnyKv0DePCwB9WLkMiIYb/M7ivETfAidhhiJ+y
	9VDRPO6kIjpxIWBZMCEiaQrcY1oFlwGNz52PEDzlZprg9L2zQKNz328MNPpYZM5y6V/67xehvO5
	+SIzZanbdOhE9HM2HbKttEcUUsQCV2FcTY7Chee0XH/c/F9Zq3J8Eo4OazjuW0jFL3EnaQWsDEc
	lp88asvM4uWtj2+GAUZG0wBjcM05YQk/HqJTcYHTdWCjUd3JfklkLq5xxAhLYe1AErwxTsxWoUG
	bCGxkyERcHQoimfSG5quTlaBRZRHzGTIa1kXbhShzwwTq6f9SZYWgTMRVMUfN92gqOiGyWSu0EN
	oiQ9u1Vl1KF3eNOo=
X-Received: by 2002:a05:6a00:1893:b0:748:e9e4:d970 with SMTP id d2e1a72fcca58-76e80e746a8mr2218621b3a.1.1755597170726;
        Tue, 19 Aug 2025 02:52:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf4aRpNKR1aJRW4hTTUipwhih4soPt+VU7Faus3psEcWXtA92FJ5i400YWIWNJxAKyarm4MA==
X-Received: by 2002:a05:6a00:1893:b0:748:e9e4:d970 with SMTP id d2e1a72fcca58-76e80e746a8mr2218594b3a.1.1755597170275;
        Tue, 19 Aug 2025 02:52:50 -0700 (PDT)
Received: from hu-wenbyao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4f7cf7sm1998291b3a.69.2025.08.19.02.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:52:49 -0700 (PDT)
From: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 02:52:08 -0700
Subject: [PATCH 4/4] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen5x4 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-glymur_pcie5-v1-4-2ea09f83cbb0@oss.qualcomm.com>
References: <20250819-glymur_pcie5-v1-0-2ea09f83cbb0@oss.qualcomm.com>
In-Reply-To: <20250819-glymur_pcie5-v1-0-2ea09f83cbb0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755597163; l=2597;
 i=wenbin.yao@oss.qualcomm.com; s=20250806; h=from:subject:message-id;
 bh=IjDSUOkDbzgxEeCC7x7bThrq8X7KAnHKc7YQ1oYlFq8=;
 b=+Yimf78LSPEQGi1dy/kn7GxcxX38qdkUzPgyA+eTTvwfToKLPMpvQ4zApWicSQZq7xwZZVLFx
 M1Nj5OfoxLyAau0VpucdXkSVo4mO9wu4SzVDBKYbvItORaLJRe29M/u
X-Developer-Key: i=wenbin.yao@oss.qualcomm.com; a=ed25519;
 pk=nBPq+51QejLSupTaJoOMvgFbXSyRVCJexMZ+bUTG5KU=
X-Proofpoint-ORIG-GUID: OayXnqa9IYzm8fkrkuji6KuFS6YMiF3N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX8gfiYpHjAJ5o
 YXXMr4mcOo78/99HQv/Vf9VGwxSexOLldZ8genXONUtHwJWDRudyJb5wel17rCpAvslV8Lnwpzz
 uoZc/H+8vzcQaBNxlMD1AHRnHj11hFMrt0bUx6hzqS1lE8ZoLXNev2CMqQwUO1Zr+xWn1nxLHit
 w7AvSso5sIS1MlhD+c5G/FfiUqw5XH3VTxtXBxpTpEoG6Zg6oEE2/FTYwUYNNgge835JFtjOw1v
 dgCMr9FpNuK5FjAhWhepjqdRv2hPW/Btn2MX69w5CpBfKiLgV4gIPBZO3f5DvjL6dj7+uGFzoZ/
 kQzScXysyysi6d2x3bSuCJO/hNQn3CDyrAHh7h/nsfV/Dzob/3+usZrCkmefdiH3aZi0UdOripr
 dXIz75NO
X-Proofpoint-GUID: OayXnqa9IYzm8fkrkuji6KuFS6YMiF3N
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a44973 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KvwrgBbZ-pJFRlqJlL4A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

Add support for Gen5 x4 PCIe QMP PHY found on Glymur platform.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 95830dcfdec9b1f68fd55d1cc3c102985cfafcc1..e422cf6932d261074ed3419ed8806e9ed212c26c 100644
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
@@ -3229,6 +3235,10 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
 	.ln_shrd	= 0x8000,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
+	.pcs        = 0x9000,
+};
+
 static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -4258,6 +4268,22 @@ static const struct qmp_phy_cfg qmp_v6_gen4x4_pciephy_cfg = {
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
@@ -5114,6 +5140,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
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


