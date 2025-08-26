Return-Path: <linux-arm-msm+bounces-70911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F211DB36D69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 17:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79896189B98E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 15:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B712308F3A;
	Tue, 26 Aug 2025 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dTJBw3Td"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CD026A1B9;
	Tue, 26 Aug 2025 15:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756220988; cv=none; b=Dwn3ERqBgv3aZza0cFF5fdLaDFrU4FoL8PSdcDTCjxf4PA8mkEn058dx0Q6fpI5lRfoxqvFkoi+ASDAcdkWRw7KZrC59Hr3+zEjza3xl9z7I0cVgx0uLJpuk9Ebd3WyqqvvAzK8JEzxPRggOXKNYHr9/4Z7RZO58dBbmjzTvYnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756220988; c=relaxed/simple;
	bh=8eYUMhvn+IIZ06qLAmibbHFTwdcu3kwbiOXeFVmY048=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e+WUhdMYpBfUf4/CLqJx6FH3GsFJOa0s727dyCvIcLz4rieihy27dlahr5CSXQf+Lvd0MRlZGQ6Q99uZ3rHtNc7dWWzSXS7RGANKLvdhl0lMrpSXwb2J8yPv6/g4lNnoOJ8DYJ/u1F1yj0YZDrTQZUgqsRLmbUyVY2+9Gp6riAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dTJBw3Td; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8eGTk019189;
	Tue, 26 Aug 2025 15:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7EPwV5hN2UKWWwQJXTqQgiIfLRoD8LnWdqlkMnK+d0=; b=dTJBw3TdSsiVvlmT
	I0YS/1xFM7/YwKnaM115xgpsJkO6RnEQmhULeRyxofX+EJ9ip+gBAmXsqGWpT16g
	HsYcCx4NCrOrm3/Zu+eYfO7QcfW00znE5pdEpjhbLCAWI3C9/83QIa7IWZyqus+P
	BxtjfMjuHI8kavxVEXBSklQNa4UYjy9ABEU4liYZcvAVOlMMMl5L6SANsXm8PAXV
	zSiSAQDV3hndwCmCD5+KAX24YXol1mw1rCTYAs9DjOhYBD8VyFQUpPMjO+t19Fd4
	tg1Kps12YIH2Q9ptmRe0Mb+elDtUGNzk1Apl/gGf2xZJDto4Mv3bm3sqctYWFl5v
	8ydxhg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5h48c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 15:09:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57QF9ZK7020477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 15:09:35 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 26 Aug 2025 08:09:29 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V3 4/4] ufs: ufs-qcom: Add support for limiting HS gear and rate
Date: Tue, 26 Aug 2025 20:38:55 +0530
Message-ID: <20250826150855.7725-5-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXyzb+X/NMCIfH
 57TIkOjYphf6yhBKHAmJ8umn5Zi9bxD7pRmr2BhbToL9jY+yJLmkMiU8gEs1+aFtPEN7OL2xJWM
 AhSgpTyE8qkS8t0ruQV55mNrVT5i0p4VornNvxr9kTJmPubf9TdeE9nfFwVqwOr00vNXTNMgyUE
 R5H2dJnEj7Z/lPk23EEVMt5XmgsBUlE7mPin78mrOIflpK8XOw9EtZj8pwrZCQTER6NlvniA+IL
 TQ9tB2FZ5ixt3s/Fu3ZWWG1lrRF+j99WkJ0OYDmP8iG2j2mvS9Hua245GJ6bG4eF9WUo+QNGYOU
 DntDpHqvhcTCoPIgroPrrubAfBtb5rPfGsVFFsVxcxxdKvJErpzKA4FDZT6SnloWhNKsUaojOgc
 a4/D2nsT
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68adce30 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=YZsCTDY-3J_n_fZr9xEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Lvk0qAKZvzQi_rR9kqJdUKXZhWvokqop
X-Proofpoint-ORIG-GUID: Lvk0qAKZvzQi_rR9kqJdUKXZhWvokqop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Add support to limit Tx/Rx gear and rate during UFS initialization
based on DT property.

Also update the phy_gear to ensure PHY calibrations align with
the required gear and rate.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 1a93351fb70e..53c64d5fb95d 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1092,6 +1092,18 @@ static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
 	}
 }
 
+static void ufs_qcom_parse_limits(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct ufs_host_params *host_params = &host->host_params;
+	u32 hs_gear_old = host_params->hs_tx_gear;
+
+	ufshcd_parse_limits(hba, host_params);
+	if (host_params->hs_tx_gear != hs_gear_old) {
+		host->phy_gear = host_params->hs_tx_gear;
+	}
+}
+
 static void ufs_qcom_set_host_params(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
@@ -1333,6 +1345,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	ufs_qcom_advertise_quirks(hba);
 	ufs_qcom_set_host_params(hba);
 	ufs_qcom_set_phy_gear(host);
+	ufs_qcom_parse_limits(hba);
 
 	err = ufs_qcom_ice_init(host);
 	if (err)
-- 
2.50.1


