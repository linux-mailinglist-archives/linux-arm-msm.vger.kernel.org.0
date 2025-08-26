Return-Path: <linux-arm-msm+bounces-70910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B0FB36D39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 17:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A979C7A2F31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 15:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE384263C8E;
	Tue, 26 Aug 2025 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M9A9kaqr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1736E275AE6;
	Tue, 26 Aug 2025 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756220983; cv=none; b=o13lG65Xc0RL7JNP6I73/hoW3ggeBwg87sl6FlyQ7ftsjF3ayfOQjeaYZGtSrGKGcTQeo30yuDyYv9VnoScb/2DlOLKhDWzzSWJxn9owpBbgHzQFsKfrRoh4o3Y+GfwnqQ9J8a5O3m16xMcX7BbqLPL3EkIUFbolWL16MVyoxrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756220983; c=relaxed/simple;
	bh=pm7rDd7h1+T5q5dVLa2839IPqvyBtCLAYQLM0ZoMepA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XGlK+/ltVCaVH35MAddfL3ub/kIjjIEyVBjQIb+2kHKnoCjIlkjB/av5rDfeufkWtDtUFgHS3Qftd/ls/WClqWlgMoOK56TQ23kjZpudT7yg9CyUOL03vO8+EdRzbnrx1+rFe/LTxIg7cr/6sm4ISaJcAqSQn3VlfeiMULovWxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M9A9kaqr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8ElVA002042;
	Tue, 26 Aug 2025 15:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZQVCuwtBy1hMTF9eQCCTaLJvqnj9Mqm5glMb7xR1KNc=; b=M9A9kaqr/6OPcchv
	aT2pRS0U/RzqBt6ycveKu81E00T1PAdkpGKcynnm0fncuNMfxknS+kqwwdAU20JX
	Jq0qqXx1FaXDC6/A+G3SNlVq5IKwkM672G/QcRrsTWuDE8wV8zddZ4YBbOSyl8ZE
	MFaSWejZ/vfphNNhmCgPSCigzCPyVSOpJAxDCqg8TcXi5o3clrma7aaCgHJiDlij
	qhPL9QKUrBrncMAXFlUKvICJJ4u7rVDcNG8faR6RJwOmOo7ObHQcdrl+WvGYDA3A
	0FzQBcJABeblLQN+CCjXQg6pHysVr0GMFMltVsT2PvUQhFpb33po7R/nuQP9oW1A
	kva6yQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfh8tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 15:09:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57QF9TkX007899
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 15:09:29 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 26 Aug 2025 08:09:24 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V3 3/4] ufs: pltfrm: Allow limiting HS gear and rate via DT
Date: Tue, 26 Aug 2025 20:38:54 +0530
Message-ID: <20250826150855.7725-4-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
References: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/9Ms/SzpsZra
 j0G1KKcaGf7Cq/4vzmyEl5caNpTNX0wB/waVEbVbXWH6csKlBjIhNp124cikWEtxdfE57S6LdfE
 +mI5fsGrpiK0Xn3up9hg2cveZffscgPQfoIRTQDiXrkfdNPmtOunMeGW94LFR47imuSwDocn5mT
 Od8bCeiQMpqWHRs6IMoc1Oioi66au3j7uR5+/Bn462iOqknmvi/drduBYOrF8rS9K238g6ON0UZ
 NxX14t53qb9O1z9lj4/qDdpOYcFFKzyQgvg3vFMvmTNPqMxJycZDTyLbgS5bdErGKYfepTMZl0V
 GfGaMP39TZNT62Dt3W0Nu1T6Xc0O9IHSyyS74GjdHol2JWsV2SXzPTBlXfv+/RP22AjZH6Bfm6q
 tOtokXzF
X-Proofpoint-GUID: mSQ2QnReZfEbERiDoDEEWFwZDwosvuqg
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68adce2a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=eseaCGvrkytYtZHUcXsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mSQ2QnReZfEbERiDoDEEWFwZDwosvuqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Add support for parsing 'limit-hs-gear' and 'limit-rate' device tree
properties to restrict high-speed gear and rate during initialization.

This is useful in cases where the customer board may have signal
integrity, clock configuration or layout issues that prevent reliable
operation at higher gears. Such limitations are especially critical in
those platforms, where stability is prioritized over peak performance.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 drivers/ufs/host/ufshcd-pltfrm.c | 29 +++++++++++++++++++++++++++++
 drivers/ufs/host/ufshcd-pltfrm.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index ffe5d1d2b215..d9be6c86f044 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -430,6 +430,35 @@ int ufshcd_negotiate_pwr_params(const struct ufs_host_params *host_params,
 }
 EXPORT_SYMBOL_GPL(ufshcd_negotiate_pwr_params);
 
+/**
+ * ufshcd_parse_limits - Parse DT-based gear and rate limits for UFS
+ * @hba: Pointer to UFS host bus adapter instance
+ * @host_params: Pointer to UFS host parameters structure to be updated
+ *
+ * This function reads optional device tree properties to apply
+ * platform-specific constraints.
+ *
+ * "limit-hs-gear": Specifies the max HS gear.
+ * "limit-rate": Specifies the max High-Speed rate.
+ */
+void ufshcd_parse_limits(struct ufs_hba *hba, struct ufs_host_params *host_params)
+{
+	struct device_node *np = hba->dev->of_node;
+	u32 hs_gear, hs_rate;
+
+	if (!np)
+		return;
+
+	if (!of_property_read_u32(np, "limit-hs-gear", &hs_gear)) {
+		host_params->hs_tx_gear = hs_gear;
+		host_params->hs_rx_gear = hs_gear;
+	}
+
+	if (!of_property_read_u32(np, "limit-rate", &hs_rate))
+		host_params->hs_rate = hs_rate;
+}
+EXPORT_SYMBOL_GPL(ufshcd_parse_limits);
+
 void ufshcd_init_host_params(struct ufs_host_params *host_params)
 {
 	*host_params = (struct ufs_host_params){
diff --git a/drivers/ufs/host/ufshcd-pltfrm.h b/drivers/ufs/host/ufshcd-pltfrm.h
index 3017f8e8f93c..1617f2541273 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.h
+++ b/drivers/ufs/host/ufshcd-pltfrm.h
@@ -29,6 +29,7 @@ int ufshcd_negotiate_pwr_params(const struct ufs_host_params *host_params,
 				const struct ufs_pa_layer_attr *dev_max,
 				struct ufs_pa_layer_attr *agreed_pwr);
 void ufshcd_init_host_params(struct ufs_host_params *host_params);
+void ufshcd_parse_limits(struct ufs_hba *hba, struct ufs_host_params *host_params);
 int ufshcd_pltfrm_init(struct platform_device *pdev,
 		       const struct ufs_hba_variant_ops *vops);
 void ufshcd_pltfrm_remove(struct platform_device *pdev);
-- 
2.50.1


