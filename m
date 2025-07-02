Return-Path: <linux-arm-msm+bounces-63427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C77DEAF5C7C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 17:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 006854E37AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 15:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D975A30B9B3;
	Wed,  2 Jul 2025 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RQNWozAT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315D5309DB6;
	Wed,  2 Jul 2025 15:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469310; cv=none; b=FEaoBjLEx2nxALr+pf1I2E0FHE3kkuJi5Aso8Vx8DoKIp49HP3GiK6ywwJzFWfPjG7aEcNyTUzcTgIBDrCZ0o7Z6IWrfiJ7M9IUGH79U3iaz+b+kZoeY/eTDRpt5Vdht+q/r5Lm81D7ToKANFuFe3WUxW7N4gDXBWmU3x79oJ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469310; c=relaxed/simple;
	bh=rMtiv8YhynFvbsomd0RDzdkphRuywmb5Mi8W2Ow6GbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/DU8TjNZZWzn1Y1oJwhFJrkEMw2bXhKTGwzhiVNyO67sS+ja6qHHEXy4QmOOjvT5Huz0Kkwy0xLEipX7kiyS7E8hWuZVlqXRvOlFrSXqXOvuKUxkw6Ft/xnO9cTKaLNq4g2HVgWr8+ehIfM5ng58es0Hw5ePvdgFx3Aa4VdItI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RQNWozAT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56289uS1024893;
	Wed, 2 Jul 2025 15:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e4wK+4rwZxs
	fbxeM4+gkxG8Wyl3xF7TFhgrE9SEs9zg=; b=RQNWozAT7pTp+mKQhCA7oi/lhtn
	HMrQEtXirKZcGrqY/Rq741eXGjT1Dr82TRs7CaZgeRvALTRc8kNa4mwDdmjhulch
	UN+Qs/Q79rUeiTSHBtWI4gWOL+6uMxM14xAM5c+YjiN/NlKakKulp3i0DSzeRy2z
	XNtwHAOhxHGb9679N7O2k5RBo6Ci1jgu8Y5lCOHRDmyS3TTPWgcJj/9ba25vyFIy
	4+oXUp4d5gvlfZLNVtV03EpgKZGxe2sXTZ24mx7kPXfKMlzJS1nPAf9UF05aoUeV
	f7KIiLSFxwiOJZlMiETijkNcuVoKyj53lM2Ivw1EDfLovPj3b8/gpinSzZA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8024x5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 15:14:48 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 562FEihF025534;
	Wed, 2 Jul 2025 15:14:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47j9fm57pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 02 Jul 2025 15:14:44 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 562FEi6R025529;
	Wed, 2 Jul 2025 15:14:44 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 562FEiUK025525;
	Wed, 02 Jul 2025 15:14:44 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id CB87D61C6C3; Wed,  2 Jul 2025 20:44:43 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V1 2/2] scsi: ufs: qcom: Enable QUnipro Internal Clock Gating
Date: Wed,  2 Jul 2025 20:44:41 +0530
Message-ID: <20250702151441.8061-3-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702151441.8061-1-quic_nitirawa@quicinc.com>
References: <20250702151441.8061-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: BpyLdfUUr919O-huM3sd44IzLmdLBFWH
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68654ce8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=ntjNA1mAdOrbGcrCdYgA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BpyLdfUUr919O-huM3sd44IzLmdLBFWH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyNSBTYWx0ZWRfX0coFgFvjhVrd
 4NNft5wjBZy4GWC8Xcw3ohEA68tvHJ6xVSDqWp27NHUCa5ljcz6ZNa49/hcbNYNAc5q+7CClXVr
 TEgBNT2tw64xc50z0jEFIn6rlkHE0AvqexgzZriR3rQWQLQt+q/BlAP0jtlMnOKoBS8dUghfjmL
 UMy4LmeYnHRc4pu6CC4RLhtLhqYoxOVHkKj0ViAkiYNIJz3dbTjvJa09AGpBX9Ssy0iaICyN0Q5
 s8OPrPy45BQqF92BxoOZFAzTSuThQeRl0IJTmH5QKAI5T/oyrz4dJKZYKTfjJGIbdHMjpY+ewc5
 uc7MuP16WWO67yQaKYQk4UAWhZYgXQQCqJ730UySK8L3ZqjM3uwyWMCMRluBZ9mHnn8PFBS7MUK
 JeShV5f/IZbiLKWeJl+w5LzjU9DjGDpPKm1u5O/k7dRQRmWvMOPzGvRhBbdh8k3IjzF48PIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020125

Enable internal clock gating for QUnipro by setting the following
attributes to 1 during host controller initialization:
- DL_VS_CLK_CFG
- PA_VS_CLK_CFG_REG
- DME_VS_CORE_CLK_CTRL.DME_HW_CGC_EN

This change is necessary to support the internal clock gating mechanism
in Qualcomm UFS host controller.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index dfdc52333a96..25b5f83b049c 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -558,11 +558,32 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
  */
 static void ufs_qcom_enable_hw_clk_gating(struct ufs_hba *hba)
 {
+	int err = 0;
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
index 0a5cfc2dd4f7..d8ad3cb3bd1c 100644
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
@@ -234,6 +243,32 @@ static inline void ufs_qcom_deassert_reset(struct ufs_hba *hba)
 	ufshcd_readl(hba, REG_UFS_CFG1);
 }

+/**
+ * ufshcd_dme_rmw - get modify set a dme attribute
+ * @hba - per adapter instance
+ * @mask - mask to apply on read value
+ * @val - actual value to write
+ * @attr - dme attribute
+ */
+static inline int ufshcd_dme_rmw(struct ufs_hba *hba, u32 mask,
+				 u32 val, u32 attr)
+{
+	u32 cfg = 0;
+	int err = 0;
+
+	err = ufshcd_dme_get(hba, UIC_ARG_MIB(attr), &cfg);
+	if (err)
+		goto out;
+
+	cfg &= ~mask;
+	cfg |= (val & mask);
+
+	err = ufshcd_dme_set(hba, UIC_ARG_MIB(attr), cfg);
+
+out:
+	return err;
+}
+
 /* Host controller hardware version: major.minor.step */
 struct ufs_hw_version {
 	u16 step;
--
2.48.1


