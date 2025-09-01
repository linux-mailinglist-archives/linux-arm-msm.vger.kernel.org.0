Return-Path: <linux-arm-msm+bounces-71419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4595B3EBBC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 18:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7AE718825B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 16:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6442F2EC09F;
	Mon,  1 Sep 2025 15:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CN22WcWo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FDC2E6CAD;
	Mon,  1 Sep 2025 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756742324; cv=none; b=K8WkN2MX0bg1J5c4hd3SaajE2uNjFn/y4a/tt74AiPZx8rkuMVd/SyiRGFvKe3Sebx13A997S6pkgNs2qSDrOzgwpFnN9QeoZza6eLvAfkL0M/xm0a1bERSy+tdCVr2ROFP05w6PSLNLoZ5YKWYQYBy7mkNwma0+lbXRmDDzTuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756742324; c=relaxed/simple;
	bh=3OdJp/OWdH3e6+1e6ZGf0PH9HmjVvKxRsJXul26bRWI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g3i8TIc3tbY6MGs8ebnVtAzEuelTc3cGH3+2x6+j6DK1v+VLwGknTia5/kbR3z19J5ZVx5+dw5fL2QffK+NIMiTxIYSOKt1H1TRlilUKTMXTVBgvPbb2FCmuRr78oFIBW8wkkVU2WKF08qtN+SaYLP1xDMhp64o4DZTqjDt+Ko4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CN22WcWo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B42lu011342;
	Mon, 1 Sep 2025 15:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7rgD8AWQ/4GZdPewcpEta5t2EVVG4Hzw8nikLbJlnEI=; b=CN22WcWooHPAX5FA
	gaGPqjxaNmer2AXBBjk4hLtoYapyFmqgyRZCY3gLxJhml50jokEik5xFe/b4/U/U
	v09eng5afLuKIP5Le4NzljFAgm2Ku9sKB7xBUdY3iR7oZmLBZHQdMdwzOG9NFAkx
	uUrwFEXlNVBFc337crkt875hfiLU9luTBZZ8hsYzbSLOpSK44J1XxIjtTCElICvT
	JnTj7Dl/JGOQ/KCzISbOZ3RI5YsC4yMwxpPxY/GlCyFBnGrXwyuc296rczZB+NpT
	0ZMLkexWRZuyAfet6+74rOf1b8NpQY1ChezZmJMAziI2t7dKOpqpjVHxMSs0p5KP
	6inoug==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy129m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 15:58:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 581FwSPH013331
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Sep 2025 15:58:28 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 1 Sep 2025 08:58:24 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Nitin Rawat
	<quic_nitirawa@quicinc.com>
Subject: [PATCH V4 3/4] ufs: pltfrm: Allow limiting HS gear and rate via DT
Date: Mon, 1 Sep 2025 21:27:59 +0530
Message-ID: <20250901155801.26988-4-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901155801.26988-1-quic_rdwivedi@quicinc.com>
References: <20250901155801.26988-1-quic_rdwivedi@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b5c2a5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=4SmWkoQrYTlKMa40LuYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IEON68wP28JXhI-qGaLYPqB0MNSK9KHd
X-Proofpoint-ORIG-GUID: IEON68wP28JXhI-qGaLYPqB0MNSK9KHd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXxdixDjON3yhQ
 Uh/0U5K+wugZsFuLj0W1FEu9zHvh18FjYLG6Hdsn5Hxvos8Q4mm7qjlUKBIRF1hwk+AtHU7X7aM
 13trOY4FGE1JvniwNLGsI9I0bLq1r3aLlWs0N3xyg6VL4ZUU5ANMhFrxr3qHZdXZ8oV8ftlmiB8
 czovHoC1DCrOEVmmtepPERWgHgG04uv6MW8k8yv4PDAXPSbglW/BRIQ0V0llJ0KTMQoe2RWkTrf
 u7F1L9/MU5OtPPHueV72xsrjcwWSMPw2DGtsbA+sDXiT1YqacV4EALnHchxb9a8r1xwq8Tlgp32
 RGnSVOcHP04eZ7kOk8vX51/tE3DcelMLgIU8gFrFoSN8M6GvXOiC9xG8E5Hi/sAESINxp/aNgr6
 vIJ9OUj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

Add support for parsing 'limit-hs-gear' and 'limit-rate' device tree
properties to restrict high-speed gear and rate during initialization.

This is useful in cases where the customer board may have signal
integrity, clock configuration or layout issues that prevent reliable
operation at higher gears. Such limitations are especially critical in
those platforms, where stability is prioritized over peak performance.

Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 drivers/ufs/host/ufshcd-pltfrm.c | 36 ++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufshcd-pltfrm.h |  1 +
 2 files changed, 37 insertions(+)

diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index ffe5d1d2b215..a3cfb1935bbc 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -430,6 +430,42 @@ int ufshcd_negotiate_pwr_params(const struct ufs_host_params *host_params,
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
+	u32 hs_gear;
+	const char *hs_rate;
+
+	if (!np)
+		return;
+
+	if (!of_property_read_u32(np, "limit-hs-gear", &hs_gear)) {
+		host_params->hs_tx_gear = hs_gear;
+		host_params->hs_rx_gear = hs_gear;
+	}
+
+	if (!of_property_read_string(np, "limit-rate", &hs_rate)) {
+		if (!strcmp(hs_rate, "Rate-A"))
+			host_params->hs_rate = PA_HS_MODE_A;
+		else if (!strcmp(hs_rate, "Rate-B"))
+			host_params->hs_rate = PA_HS_MODE_B;
+		else
+			dev_warn(hba->dev, "Invalid limit-rate value\n", hs_rate);
+	}
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


