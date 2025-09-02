Return-Path: <linux-arm-msm+bounces-71671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87939B40B09
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96A3F1B61AB3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8C133A019;
	Tue,  2 Sep 2025 16:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a5rzwA0B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A9A3431FC;
	Tue,  2 Sep 2025 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831781; cv=none; b=Rpdb3nSJytLBVmDyzwY/f4er2vWNv366bTXf8n4OpHK0eN2MwmX0p7hTe3AeQEfXZjqFWtpPkomeKoMXX3WcluBhr6zxrUQVwMdX37g5veBppsWaXs8acwBv51slooTGdLzJ4OIOFTcmFjCG2WFM1vzX4mwDDGFWOE4J3D4+ajo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831781; c=relaxed/simple;
	bh=++cCQ7ZCSCvafoVGJUq0su+FFdgV+qtROJ9NSGV2MEM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dv3Epm2o2vMwajxWgB/tg/Yj6snbW4mWDGaDzWVu+Co7FrZYKnMlJBNWiM0u3g1oR3wun40p6qZw9E2mSFBEE4ClXCce3f2pFGJEUhox0CcZFG2WyxpBNFajpgwMWJbTua31pXaakGOSJisu4i8SFi10c+j4uK1C6GTLcKCfoTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a5rzwA0B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqL8V010204;
	Tue, 2 Sep 2025 16:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AnKOYd4gZ7hpL17xCy5rLxUqnBvLnx2PMUdLuRRdaBc=; b=a5rzwA0Bo10CMWNU
	JU//LF1HlRwJfEJb+4gXfhg+vPF8nOabRhaBSzgJ/rrr4JrVrMMJ5JJr8COnb7OU
	j7LZv+82SIrXdVEjh6+WGHsWbEATF9BqWQPlVPBgVhXRs4EJzMA5rMG3p0AsKush
	Vreb552O3kYcfXeZmOX4XLzb94xPMBr0cilqUXAcprRAnfEx4WA1U1vLYnDa1Qyg
	bCkgmE+N60ArmuNEC8XvcE+d1iyU7IOQ7ArMrjwFno0RgMA79e/SLHoUac9Z+PPW
	2wMJLhc9/acfN4s6Y6jqKxazZp9gKMnTx6NQFH1jv1RfCxda+5f04nL3RsFS+6Kl
	66DCGQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0egr3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 16:49:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 582GnRcw032069
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Sep 2025 16:49:27 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 2 Sep 2025 09:49:22 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Nitin Rawat
	<quic_nitirawa@quicinc.com>
Subject: [PATCH V5 3/4] ufs: pltfrm: Allow limiting HS gear and rate via DT
Date: Tue, 2 Sep 2025 22:18:59 +0530
Message-ID: <20250902164900.21685-4-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
References: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vz6g-ACgSsTlRYQCb0zHSyll3aISYTnz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX0TEf30yWDGvt
 i1tUgwDDI6D8dhZWGKOh3mT9N0sK5cFQr9/FNO8LIrxf79uC7yhviKIGnQqPaDnFvgCvueTU3q1
 hRjSsYT1IW5wyB4e/oLnMdfvopfq1lWyT00S3JOcN1BZBwKQ7s/fB4BjSOnGModGQ+/02KH108B
 Oo04zIiKorpvAoCnVH+UXcz4AwhrqtteWt5eItjZUBBk1KEoQQs6DNm+B3fhaZPQjlqKcY3SdD5
 ltw0YReNqUA2OCFepQ+URKX/l2NtyeIguKJdKoCziYx3Re8suam0Pgaaagc6vos+70tHjUuQTac
 8gEWcWYGSApMum/U7xhySdLbmtnXx+NBbYKhNpPH3QcLq/oHafze2XHoj+BVt0+sNHPwND8w0Gc
 p7lp/tMR
X-Proofpoint-ORIG-GUID: vz6g-ACgSsTlRYQCb0zHSyll3aISYTnz
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b72017 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=4SmWkoQrYTlKMa40LuYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

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
index ffe5d1d2b215..4df6885f0dc0 100644
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
+		if (!strcmp(hs_rate, "rate-a"))
+			host_params->hs_rate = PA_HS_MODE_A;
+		else if (!strcmp(hs_rate, "rate-b"))
+			host_params->hs_rate = PA_HS_MODE_B;
+		else
+			dev_warn(hba->dev, "Invalid limit-rate: %s\n", hs_rate);
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


