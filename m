Return-Path: <linux-arm-msm+bounces-19911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 332358C70A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 05:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E94F1F226A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 03:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD3CBE4B;
	Thu, 16 May 2024 03:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QCGbMwib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0B74A12;
	Thu, 16 May 2024 03:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715829896; cv=none; b=QH2Ps7efNn/+AeiHQCOCIv2XbOzQE5NxanlloiZzgs4kFRTnQEd5dHMMBkyuirtEKusFKhiwmROMa6pUTVMcMR28eT36xJRqpHfs+yvDA0kfa56OLPgJWxlAjOkGoOzyn/Y+thvO8Bvnw5xhfMghgKdZy+PH2Rq+f1K8N3sw3xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715829896; c=relaxed/simple;
	bh=PTp9pFLa9dPDiaGCHMinEIOfWb/k80Jglp4GRHKx2ds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YdIvmtXWXpWG6wxlHPmfk3A2Kk9r3Ctas4tb8gmOw50qt4sc9NfkVwiZHNFBOLSg3wN168AQY9wTmrM6eFdI8NX3i0eTlK/rIIZ0OzbkBN3t5R+qbYahX8CFh4f8+PNojFUQtmTjwHTH1Va6bbPVcxJzXqsiMs8ul9Tfz6ZjC0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QCGbMwib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FK5rOI007487;
	Thu, 16 May 2024 03:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=dtJFB+k
	U4B6Rme2fJPNO1BsTYjjqtsfeNJ4gvvZblCk=; b=QCGbMwibUw4ExY1l8xYgZBu
	XyCesMbuowUUZ7WpgHKQUP79m5b+qXkXPhga2vf131Mr/bpJV1U/GkVAQD8VeiDT
	7bHHgvHUBNql7lu6nrWIGIbR//0fhNCvXuMc+6VUvCxS2t/Tk2+MqcbsVNmUU7QA
	XFTPFQY7Y310m8jwtFN/1SLm3VNKAOsj0QhWQMPd8ZhXLRSrWKnHgoTMvVQoXkxE
	j7trRBStSoe2e9DBdeWLl5e9rY5n1fD+MVWlzpvLMGN6tT3w0LdRBcPeav6cKS+8
	zirlsj3GSY2L6UdiNgLuO9/ZsSl4/MPCnrroNVhJVQqMLQLpr4zB5LYzxmZU6tw=
	=
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47f44egr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 03:24:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44G3Obt1032171;
	Thu, 16 May 2024 03:24:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3y4quybhjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 03:24:37 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44G3OblR032147;
	Thu, 16 May 2024 03:24:37 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-devipriy-blr.qualcomm.com [10.131.37.37])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 44G3ObaS032140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 03:24:37 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4059087)
	id 6A6FC419AE; Thu, 16 May 2024 08:54:36 +0530 (+0530)
From: devi priya <quic_devipriy@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        neil.armstrong@linaro.org, quic_msarkar@quicinc.com,
        quic_qianyu@quicinc.com, abel.vesa@linaro.org, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_devipriy@quicinc.com
Subject: [PATCH V4 4/4] phy: qcom-qmp-pcie: Add support for IPQ9574 g3x1 and g3x2 PCIEs
Date: Thu, 16 May 2024 08:54:36 +0530
Message-Id: <20240516032436.2681828-5-quic_devipriy@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516032436.2681828-1-quic_devipriy@quicinc.com>
References: <20240516032436.2681828-1-quic_devipriy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wUSEp5Ll2z2XXlNVVm9FGV11arhdjqqt
X-Proofpoint-ORIG-GUID: wUSEp5Ll2z2XXlNVVm9FGV11arhdjqqt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_01,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160022

Add support for a single-lane and two-lane PCIe PHYs
found on Qualcomm IPQ9574 platform.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
Signed-off-by: devi priya <quic_devipriy@quicinc.com>
---
 Changes in V4:
	- Picked up the R-b tag

 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 309 +++++++++++++++++++++++
 1 file changed, 309 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 6c796723c8f5..8cb91b9114d6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -489,6 +489,243 @@ static const struct qmp_phy_init_tbl ipq8074_pcie_gen3_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
 };
 
+static const struct qmp_phy_init_tbl ipq9574_gen3x1_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CLKBUFLR_EN, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CTRL_BY_PSM, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_SELECT, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TRIM, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE_TIMER1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE_TIMER2, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x21),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE0, 0x68),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START3_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE0, 0xd4),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE0, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE0, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORECLK_DIV, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_SELECT, 0x32),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_BUF_ENABLE, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE1, 0x53),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START3_MODE1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START2_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE1, 0x29),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE1, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE1, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE1, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE1, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE1, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORECLK_DIV_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_PER1, 0x7d),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_ADJ_PER1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_ADJ_PER2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE1_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE2_MODE0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE1_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE2_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_EP_DIV_MODE0, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_EP_DIV_MODE1, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x89),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_ENABLE1, 0x10),
+};
+
+static const struct qmp_phy_init_tbl ipq9574_gen3x2_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CLKBUFLR_EN, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CTRL_BY_PSM, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_SELECT, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TRIM, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE_TIMER1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE_TIMER2, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x21),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE0, 0x68),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START3_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE0, 0xd4),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE0, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE0, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORECLK_DIV, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_SELECT, 0x32),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_BUF_ENABLE, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE1, 0x53),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START3_MODE1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START2_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE1, 0x29),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE1, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE1, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE1, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE1, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE1, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORECLK_DIV_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_PER1, 0x7d),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_ADJ_PER1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_ADJ_PER2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE1_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE2_MODE0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE1_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE2_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_EP_DIV_MODE0, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_EP_DIV_MODE1, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x89),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_ENABLE1, 0x10),
+};
+
+static const struct qmp_phy_init_tbl ipq9574_pcie_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x61),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x70),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL1, 0x73),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_LOW, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0xb1),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb1),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0xd3),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+};
+
+static const struct qmp_phy_init_tbl ipq9574_gen3x1_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_DCC_CAL_CONFIG, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x0d),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_G12S1_TXDEEMPH_M3P5DB, 0x10),
+};
+
+static const struct qmp_phy_init_tbl ipq9574_gen3x1_pcie_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG2, 0x0d),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG1, 0x14),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG1, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG2, 0x0b),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_PRE, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_POST, 0x58),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG2, 0x52),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_INT_AUX_CLK_CONFIG1, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_MODE2_CONFIG2, 0x50),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_MODE2_CONFIG4, 0x1a),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_MODE2_CONFIG5, 0x06),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_MODE2_CONFIG6, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
+};
+
+static const struct qmp_phy_init_tbl ipq9574_gen3x2_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x0d),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_G12S1_TXDEEMPH_M3P5DB, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_DCC_CAL_CONFIG, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
+};
+
+static const struct qmp_phy_init_tbl ipq9574_gen3x2_pcie_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG2, 0x1d),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_EQ_CONFIG1, 0x14),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_EQ_CONFIG1, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_EQ_CONFIG2, 0x0b),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_PRESET_P10_PRE, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_PRESET_P10_POST, 0x58),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_OSC_DTCT_CONFIG1, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_OSC_DTCT_CONFIG2, 0x52),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_OSC_DTCT_CONFIG4, 0x19),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_INT_AUX_CLK_CONFIG1, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_OSC_DTCT_MODE2_CONFIG2, 0x49),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_OSC_DTCT_MODE2_CONFIG4, 0x2a),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_OSC_DTCT_MODE2_CONFIG5, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_OSC_DTCT_MODE2_CONFIG6, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
+};
+
 static const struct qmp_phy_init_tbl sdm845_qmp_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
@@ -2535,6 +2772,16 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v5 = {
 	.rx2		= 0x1800,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_ipq9574 = {
+	.serdes         = 0,
+	.pcs            = 0x1000,
+	.pcs_misc       = 0x1400,
+	.tx             = 0x0200,
+	.rx             = 0x0400,
+	.tx2            = 0x0600,
+	.rx2            = 0x0800,
+};
+
 static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
 	.serdes		= 0x1000,
 	.pcs		= 0x1200,
@@ -2647,6 +2894,62 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
 	.phy_status		= PHYSTATUS,
 };
 
+static const struct qmp_phy_cfg ipq9574_gen3x1_pciephy_cfg = {
+	.lanes			= 1,
+
+	.offsets		= &qmp_pcie_offsets_v4x1,
+
+	.tbls = {
+		.serdes		= ipq9574_gen3x1_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq9574_gen3x1_pcie_serdes_tbl),
+		.tx		= ipq8074_pcie_gen3_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq8074_pcie_gen3_tx_tbl),
+		.rx		= ipq9574_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq9574_pcie_rx_tbl),
+		.pcs		= ipq9574_gen3x1_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq9574_gen3x1_pcie_pcs_tbl),
+		.pcs_misc	= ipq9574_gen3x1_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq9574_gen3x1_pcie_pcs_misc_tbl),
+	},
+	.reset_list		= ipq8074_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
+	.vreg_list		= NULL,
+	.num_vregs		= 0,
+	.regs			= pciephy_v4_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+	.pipe_clock_rate	= 250000000,
+};
+
+static const struct qmp_phy_cfg ipq9574_gen3x2_pciephy_cfg = {
+	.lanes			= 2,
+
+	.offsets		= &qmp_pcie_offsets_ipq9574,
+
+	.tbls = {
+		.serdes		= ipq9574_gen3x2_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq9574_gen3x2_pcie_serdes_tbl),
+		.tx		= ipq8074_pcie_gen3_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq8074_pcie_gen3_tx_tbl),
+		.rx		= ipq9574_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq9574_pcie_rx_tbl),
+		.pcs		= ipq9574_gen3x2_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq9574_gen3x2_pcie_pcs_tbl),
+		.pcs_misc	= ipq9574_gen3x2_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq9574_gen3x2_pcie_pcs_misc_tbl),
+	},
+	.reset_list		= ipq8074_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
+	.vreg_list		= NULL,
+	.num_vregs		= 0,
+	.regs			= pciephy_v5_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+	.pipe_clock_rate	= 250000000,
+};
+
 static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -4030,6 +4333,12 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,ipq8074-qmp-pcie-phy",
 		.data = &ipq8074_pciephy_cfg,
+	}, {
+		.compatible = "qcom,ipq9574-qmp-gen3x1-pcie-phy",
+		.data = &ipq9574_gen3x1_pciephy_cfg,
+	}, {
+		.compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy",
+		.data = &ipq9574_gen3x2_pciephy_cfg,
 	}, {
 		.compatible = "qcom,msm8998-qmp-pcie-phy",
 		.data = &msm8998_pciephy_cfg,
-- 
2.34.1


