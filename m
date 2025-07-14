Return-Path: <linux-arm-msm+bounces-64770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13637B0385D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 09:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28FA47A3745
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 07:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9784238145;
	Mon, 14 Jul 2025 07:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TwX35vB/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0A02367C1;
	Mon, 14 Jul 2025 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752479634; cv=none; b=r/JUUtIYylbTy4zAwnJFUvC1pRA+6EKUv+Mgxy0Z3N8R+/MDT0y5XkSETn8UxQZBpgkQCQ5ADCNI2YHRMDGPjVsHZxybeIVHNEbcZJpT3gB6cOD0TbfYg/XTXC0N1KgESf89KoSRF7rBMyssvprRCtSZtSnajfLzV3spwRpM8J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752479634; c=relaxed/simple;
	bh=EE8kkr0IUnVlW8ESpxc+h5LTHH6HWh4qrxPV2gmwsFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2RyeITcKkU207naqoA7UP9g6qeRhP6VCS7LiOc0zol0n5WO/At69Io2XkWXL1T/j6/kHwD9fWrRBYWCyEqfzLV88L+6YF79yNvuGxRqoYEnS61c51tWmRR2g1q9OCnyTXBO9iljAW4xP7myPVfS0HQJd5AhNYGTOFTng8dAUak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TwX35vB/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E67UfU005596;
	Mon, 14 Jul 2025 07:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8DaG+iuqFRR
	b030i84DyWG+I1gLa9mmVPm7qSytIl8E=; b=TwX35vB/V6AjnE9y10lag1mSsp3
	FB9IwOY039LdestoXN07vSBbtLTsWckqP6aWLFp5fSl857KPGNEzimCwIsN8oKs8
	uTzdaOW6tNPTjgk69XRJOMbyD8ACEzvgar/KlyRNzJa5aTOFBYGxX9zuKEekUJIj
	cMuHN5ZvyEyuZbSxoV/aznQ7pGMG6bWJYNAQvy3vPfmQJmJO79wAXKuNht0jE12w
	HlI1T5S/rKlx+GmdGdH3XYLHzhEc/ocNpa/SUi8Rc0JhMzOTqZm1Wj+hmxIMvsTe
	3qLyfFweomY2BQn79qsJn9Okpx47Cat+EDYA5jf+cDSV7SH0UNdu5RGyGeA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvb0ra79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 07:53:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56E7rcjq007494;
	Mon, 14 Jul 2025 07:53:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 47ugskv3sp-1;
	Mon, 14 Jul 2025 07:53:39 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56E7rcv3007481;
	Mon, 14 Jul 2025 07:53:39 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 56E7rc6d007499;
	Mon, 14 Jul 2025 07:53:39 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id D8D2D571872; Mon, 14 Jul 2025 13:23:38 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V5 3/3] ufs: ufs-qcom: Enable QUnipro Internal Clock Gating
Date: Mon, 14 Jul 2025 13:23:36 +0530
Message-ID: <20250714075336.2133-4-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714075336.2133-1-quic_nitirawa@quicinc.com>
References: <20250714075336.2133-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 0T95tdQOax3-IbWnxWvgJ6sW7nzDC9w9
X-Authority-Analysis: v=2.4 cv=B8e50PtM c=1 sm=1 tr=0 ts=6874b787 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=qOmeOml8TDbB3g6YpnoA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0T95tdQOax3-IbWnxWvgJ6sW7nzDC9w9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA0NSBTYWx0ZWRfX74wabtBR6Izc
 Qdr6vAkv75mHMCUb94X8uV6fn4pBdIY1+euM8FCKziNOKpZTthgc9PAILTK8/ggKNZJuHnjJlvx
 cjm2uN+V5+HujDCt2E3JrxsWmk0IekFFBa2jB+e/X8gb6oQGTvbIWw1nuQpxG2MFPv4WBOSjkJg
 xIRQIR9+AZNfIUaYEychFM5XEkAnK7OXR7AUJjAfI3DbsZuTiCWzbJ1aBcAnzLtBJ2Q1RDKNZIv
 z11pm/1/TpJT5hliDEezTnsJ2LA3fI0owNhO2XM3GB7OQjoflagcpgHGj7A1r+kQNRVjYGrDBP/
 ufiNpOuCmutyRfdVGO+NpRA0Svzh2R3U/MUyJh4ZdRhK0O4hu8N+n36q69Rg8zjeZQRlWIjlKSf
 P1bJb3ZuJggvoh0syYwll3P0ysjWNeM5FvgsA1SOePVJyo6GHukPxpgTc/0JUNLrjcICFPmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140045

Enable internal clock gating for Qualcomm UFS host controller by
setting the following attributes to 1 during host controller
initialization:
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


