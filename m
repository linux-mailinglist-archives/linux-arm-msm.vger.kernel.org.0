Return-Path: <linux-arm-msm+bounces-64289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF60AFF35D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 22:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99B311C4752A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 20:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A2C2451C3;
	Wed,  9 Jul 2025 20:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YPjNnN15"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6B4235046;
	Wed,  9 Jul 2025 20:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752094615; cv=none; b=M5Z2s4V2G8nl1YFEv2/IiKIn9C3yOiC11WoLI3fSEpl4MFwgRtFqcR4YG0tipDCfl4T7JdPFcUV74V5TWwNw+ZsBR7dH/qgSPL3FLV+HfAAsRevfYbjSPGtUO+VVZwHvA1n68huLB0x4rDGK2yCJOq3ApyVpGNqU268lv7RIT8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752094615; c=relaxed/simple;
	bh=1L3IixxcSwfogoS7JihmrYCjzc4HVU2/uBp6yic+InU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/a1R1cwPofejP9gETA0SgSVT8lbnGooc4koWhSPK4kpTeJwPOw02tLMZgLqm+MPQIsRu3oDOE/tQHeXRzx5MdcT0CKeN89Cn6DHy/Li82aFwiBCIb58zxRQ7SFF2pzocw/2s0iaSoGOvU9PJ776o5lCAVfjC0j0dPv0GVM/CCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YPjNnN15; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569Cp2FQ032001;
	Wed, 9 Jul 2025 20:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5y0EcV5lJzu
	HJYyi3eypnGM2WwiOKdaErNNPqTN3v5c=; b=YPjNnN15i9NKTq6nEAmsIuBOBuW
	ZiDir1ac/TIvFrKC6jJSZBrgzisLxwFHjeTQNv7sN/gEOODFW2uZY+62c+Z+eflk
	7DwgvBaP/dYjpz68+EXd9Wn8F7qrJrZXMlB74t3+LF3SsaHQe1ngiOyeigjHGdUC
	60vC8pxBd7dP9cDDRogiW5GFRKyxXp/jtSMShvEwADN2ESApidkYuzl6qwmV+gw3
	Z8DRM5zaInGWT9jTWsMsI3wMphYeIH3ze5BNJYdADY9Q+IuUwzel+zrmh+Qu1H/f
	yexnZD/f5oaFhDOUzp7DoHY39XDNTGwhGufqA6JC0/5nTRpfQA4JsZvC/8w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qw41y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 20:56:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 569KufEc029941;
	Wed, 9 Jul 2025 20:56:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 47sdus4c7y-1;
	Wed, 09 Jul 2025 20:56:41 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569KuePB029936;
	Wed, 9 Jul 2025 20:56:40 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 569Kuesr029935;
	Wed, 09 Jul 2025 20:56:40 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 1ADFA571870; Thu, 10 Jul 2025 02:26:40 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V4 3/3] ufs: ufs-qcom: Enable QUnipro Internal Clock Gating
Date: Thu, 10 Jul 2025 02:26:35 +0530
Message-ID: <20250709205635.3395-4-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250709205635.3395-1-quic_nitirawa@quicinc.com>
References: <20250709205635.3395-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE4NyBTYWx0ZWRfX7E+5KeJFhJaZ
 1N+G12A/yL30zEOFj5k4g2eXqacyBxV0WGUC8wdEpQIAHkyYNmANeSDjBjWzrQq/7dxGfuxz8+t
 urPELGpxRfu/Yw0zOxc7KV0kX7kncmD8yp6KZyBcv56eLUb4LPMroimgYmccpUp7pFRd9Jv23ny
 MuIm39ec4w9u+DfQU7bYqd9fzby32TeubBrlcC+8mlIIJOBnRHWqtpNNsQjHPZ2T/TX8h9PRx+/
 kug/LkVqDQc+RTHd0jiJ4F4LFpU5yF3PwrdawmFMUmuNHScPsw4vqkNvltBQnmcZiSEWCjnFojI
 nYcBsI6QHgpLQnKqHGMQP3Qvah64V2zkbjNRS/hAkGwbglhQu3mfbnpgc038SzGSVTs9Mp369X1
 KzPJJngf2Ag1iFrnQC0OTTs5XVj62p8DPobrO1KLEHpKoOB8sekUBUVzr3IDTPFF4e+wf2Q4
X-Proofpoint-GUID: eo5R2XO7uslK_ImJp56HyD_sEXX2owuK
X-Proofpoint-ORIG-GUID: eo5R2XO7uslK_ImJp56HyD_sEXX2owuK
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686ed78c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=qOmeOml8TDbB3g6YpnoA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090187

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


