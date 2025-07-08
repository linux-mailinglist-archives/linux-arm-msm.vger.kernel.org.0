Return-Path: <linux-arm-msm+bounces-64106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA89AFD9C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 23:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66FDD1C201C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 21:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D40246772;
	Tue,  8 Jul 2025 21:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BgRBodFK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F418A241CA2;
	Tue,  8 Jul 2025 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752009964; cv=none; b=IQw0qxqoui5nEYGOAOSGgTGo4bU5C+nDHrkxjFUOYYYEIRu/pukutj0e1t67sacHTqwDLJaEn+ojU+vHL0ixvw+bxsL/yAXYMj1KMXjbPR3lzqPbVlppYVEmljaOPnYypASaOkPNiAe4mRPkQwjmlZKMHqfI7d/OelOUqlvy3TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752009964; c=relaxed/simple;
	bh=1L3IixxcSwfogoS7JihmrYCjzc4HVU2/uBp6yic+InU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEHfyLz3fcKtWuGdi1GaB+YLY6OUO5c7mYxESvXImX/T1o4P3Y6q6WXT0ZfuznIqH0VpFpHM1NW1NmqrDDZ/WxOYTtjqNhNjD/mQy+wRz65B6DAKtIJ4Nci3WhV6cdTR+DleYWrGK8S0BaVyQxtH6+p60l13ELcPlqBXNEor/2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BgRBodFK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568JFKiN012125;
	Tue, 8 Jul 2025 21:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5y0EcV5lJzu
	HJYyi3eypnGM2WwiOKdaErNNPqTN3v5c=; b=BgRBodFKMO26KlZWdGfxsBXTsJo
	QQ/R8uzugb9ulO0ijoVjCXCju9+6M4bMBV3QMvUjie9g0AQjifJlBTu5DKQHFYs2
	k1eHpz6W12u1fc9lEluRTsHbKrkZa2s3wNN09Kv4WIA9LDQvWKvfyawngOEAZlXY
	cyL55ssDbYJrrcYii9X3UqopWZmECegMSrDKLekw3jHW5FMx6Nm6m2qILvUTK/Uk
	Z9I6tHBfL0v+XE8qo8j1/BjW6Sub39U+ua4mvsPeYZZ07VjUFunMuQgKk/2aITYi
	nOQ17qsyXZTn/ZheiLdRxGFc1P5UtAgFIR3I1bStYOt1KMMOlNtb8G3gs8Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97snr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 21:25:43 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 568LPdMD000892;
	Tue, 8 Jul 2025 21:25:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 47pw4kvamw-1;
	Tue, 08 Jul 2025 21:25:40 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 568LPeMH000939;
	Tue, 8 Jul 2025 21:25:40 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 568LPee2000938;
	Tue, 08 Jul 2025 21:25:40 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id DA8F557186F; Wed,  9 Jul 2025 02:55:39 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V3 3/3] ufs: ufs-qcom: Enable QUnipro Internal Clock Gating
Date: Wed,  9 Jul 2025 02:55:34 +0530
Message-ID: <20250708212534.20910-4-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250708212534.20910-1-quic_nitirawa@quicinc.com>
References: <20250708212534.20910-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686d8cd8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=qOmeOml8TDbB3g6YpnoA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE4MyBTYWx0ZWRfX8Ebkh1hKLjPl
 hRK1r0/iLZwggra7C7okZWO+QYHp9lpEVmUPm8z25g4CItuXUfPBX+yYRoH2t4nBdyN8BnT+Pzt
 P8pawEYdL/S37dO5vqju/8R/3gTt7LAbOgE85BhQ2J5JgWPSgG/cUVoS8RrY5buxrVb8pWV2fKN
 OG0lTTSMsBIrmXYBxIYe5YsKEA2fVRIrh3j6y0+fYTi9xCWbZcfcX4F8kiJZP1E/GFsb9cYcTcj
 g57c9hGu6mM6wMAVkybWBdNi8xFThT5hZjWMD0Dli2457AiWBpVtCXrX2dw00K2rOM8c4ec7Gya
 CnYAgodkf0EimcgHfAk6Kqo5+URSICJGN8XOrPQcnYgHzkGxhOdTF+Al4pIxe/IaB+jGF5IZPft
 6Miir6vTrJ0sRMNzMH9jwkJPHavXVvCl3ln9fKBza3dXyf7batWGo6O0DZInhS67nXdxQKz/
X-Proofpoint-GUID: neuZG4UHQ6cb82edTmPyxoqdQLO9Uzt_
X-Proofpoint-ORIG-GUID: neuZG4UHQ6cb82edTmPyxoqdQLO9Uzt_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_06,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080183

Enable internal clock gating for QUnipro by setting the following
attributes to 1 during host controller initialization:
- DL_VS_CLK_CFG
- PA_VS_CLK_CFG_REG
- DME_VS_CORE_CLK_CTRL.DME_HW_CGC_EN

This change is necessary to support the internal clock gating mechanism
in Qualcomm UFS host controller. This is power saving feature and hence
driver can continue to function correctly despite any error in enabling
these feature.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index dfdc52333a96..4bbe4de1679b 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -558,11 +558,32 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
  */
 static void ufs_qcom_enable_hw_clk_gating(struct ufs_hba *hba)
 {
+	int err;
+
+	/* Enable UTP internal clock gating */
 	ufshcd_rmwl(hba, REG_UFS_CFG2_CGC_EN_ALL, REG_UFS_CFG2_CGC_EN_ALL,
 		    REG_UFS_CFG2);

 	/* Ensure that HW clock gating is enabled before next operations */
 	ufshcd_readl(hba, REG_UFS_CFG2);
+
+	/* Enable Unipro internal clock gating */
+	err = ufshcd_dme_rmw(hba, DL_VS_CLK_CFG_MASK,
+			     DL_VS_CLK_CFG_MASK, DL_VS_CLK_CFG);
+	if (err)
+		goto out;
+
+	err = ufshcd_dme_rmw(hba, PA_VS_CLK_CFG_REG_MASK,
+			     PA_VS_CLK_CFG_REG_MASK, PA_VS_CLK_CFG_REG);
+	if (err)
+		goto out;
+
+	err = ufshcd_dme_rmw(hba, DME_VS_CORE_CLK_CTRL_DME_HW_CGC_EN,
+			     DME_VS_CORE_CLK_CTRL_DME_HW_CGC_EN,
+			     DME_VS_CORE_CLK_CTRL);
+out:
+	if (err)
+		dev_err(hba->dev, "hw clk gating enabled failed\n");
 }

 static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 0a5cfc2dd4f7..e0e129af7c16 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -24,6 +24,15 @@

 #define UFS_QCOM_LIMIT_HS_RATE		PA_HS_MODE_B

+/* bit and mask definitions for PA_VS_CLK_CFG_REG attribute */
+#define PA_VS_CLK_CFG_REG      0x9004
+#define PA_VS_CLK_CFG_REG_MASK GENMASK(8, 0)
+
+/* bit and mask definitions for DL_VS_CLK_CFG attribute */
+#define DL_VS_CLK_CFG          0xA00B
+#define DL_VS_CLK_CFG_MASK GENMASK(9, 0)
+#define DME_VS_CORE_CLK_CTRL_DME_HW_CGC_EN             BIT(9)
+
 /* QCOM UFS host controller vendor specific registers */
 enum {
 	REG_UFS_SYS1CLK_1US                 = 0xC0,
--
2.48.1


