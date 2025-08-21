Return-Path: <linux-arm-msm+bounces-70128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEED2B2F510
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 196015E1754
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DD62F5474;
	Thu, 21 Aug 2025 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ag+ZRgqz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF672FABE3;
	Thu, 21 Aug 2025 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755771418; cv=none; b=kL4HgO+DMNaXE0WevusRyljsVY3CQ0MdYWYO0XQVhgCJOrQZSVfkDUDEFulXWQAjpJcofovvRMB/fbOHiIbtX+/o0KIe6cnJQVGwZ0FE66E4PSvzCgSQCB1AYNKaP8TSOEEvNNgfA1QmBqQ0p/PHFlhiyraxxhEB4TiL4nIg0Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755771418; c=relaxed/simple;
	bh=pm7rDd7h1+T5q5dVLa2839IPqvyBtCLAYQLM0ZoMepA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zhw8wuFZjR1QUJqdDFjN7Lrnfj6smr66BlSIR/F0zWhYdgrhjSILc5QY5kWSOwyObE/z5ddn5ogWaZiKTVvLSZ12+cDTPw9rPf/+I8jilOdhQUNinO5ik4fOIhrE7f4TUL7H2aWy3+51jIibcMGfQRsrWbfGI6kBAKUn02iH5pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ag+ZRgqz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bILS013281;
	Thu, 21 Aug 2025 10:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZQVCuwtBy1hMTF9eQCCTaLJvqnj9Mqm5glMb7xR1KNc=; b=ag+ZRgqzx9drEVI6
	PP6ihY+1BrJV2ZNL8tWmz56SZv59GqFH+8fHBQfKkW4vMQ/rpFCwuCLpMmUeK1tC
	MuoAMZH9Z7mWjIqZ0Mm+vcHpWe0zr/8J74rRRRWBDBntTXNIXVo3IAo2uCeN8ts5
	4hysZXSDdnBgm6sFkpFt8wObZiBEIE6AqmwE+/325OlyihwwKR5EvA2YnDkGPl2H
	1wlsrOp9kNC00QuT1wQuqvqce1/vn2GmDo6bqHvavPZdvu0tW60u+eiIoHn4ZGsA
	NzpnKV2YM9uXE3/N6LKkHEdRXuTN4PXt+ZyZ/2xllSJ/vhZsW8pESpGz6rxIRxKo
	6dxAfw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dmyma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 10:16:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LAGjqb000618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 10:16:45 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 03:16:40 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 3/4] ufs: pltfrm: Allow limiting HS gear and rate via DT
Date: Thu, 21 Aug 2025 15:46:08 +0530
Message-ID: <20250821101609.20235-4-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821101609.20235-1-quic_rdwivedi@quicinc.com>
References: <20250821101609.20235-1-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+kPVn+sV33n1
 2GVqEzIY1C8tvQdhAgwU7jh2TzHcAV7S8cxj10FSwRQZ+UFgdI6hbY3UbEzhlUB9n+PFanWUm0W
 5c7zGvML0gR78THCDrlzZoTs9A443swIEbfZS1FgQaa6NomcZU/LSblJdTyztUMjLmbBO4D2xCI
 J+5aatasJuXNAoZc6w6JwBQ91ULna4JLzjQAvwC5rTeg0WTFqhnxru/rcoX77cecEhwQWazf+Lt
 7Zd7JG9BwECiznsszisVbYbpBn1C0RRocXuvoET5o6sPAAvRyEzA/qdiTJ0oOEb6kcREA7unC9B
 rDsOK3ReRFs0d+m+c0mSILGnHD0kBwH4DQ2ABVYpTxsWdRhYJip7D2OiEtbNvGiizfmMW/deKM1
 cPXGEZjJo8PPZJaBPjAoeFYfT1xzlg==
X-Proofpoint-ORIG-GUID: Qvzi-R-rr5OAxKN424DsrjTHiKTwKQC-
X-Proofpoint-GUID: Qvzi-R-rr5OAxKN424DsrjTHiKTwKQC-
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a6f20e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=eseaCGvrkytYtZHUcXsA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

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


