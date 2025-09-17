Return-Path: <linux-arm-msm+bounces-73947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18051B7FED1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A5F1625C9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680F02EB85D;
	Wed, 17 Sep 2025 14:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E+O5ywZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C3B29A31D;
	Wed, 17 Sep 2025 14:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758118231; cv=none; b=c6CCSpFPtDivZimkhTVNhYvaPaaMDo81zy8EaRvrcYoa68fSXSfB1asZjeTCgE0OYX2kZFrJV148awhdUmljbE5/dN44lkyggOddIOqfhfoIi0YmQyKB+WktmCWcS3h/dnDluwWs2ceID41VneNbzmJVDThSAsqi/Ren8jH9sFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758118231; c=relaxed/simple;
	bh=yFg+eTIntZUDGldEoDu02M/gxQ4qJAQSZAJMECaPtOs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fY/cehY1m+LXkJ35jUPC0pvCDpaC9YRTWdMuP9uYwpZ3/sQ7MOfxccjkSCbVdFFE3LlnkUrOALT4mt9DiLOnXJRuEOs11ZuIKat++HTz819z9zcFmXGkRMUJREvN+MITTrmYdJFwIxso72Z8pmIYKnUvcSvY1m6TxNlbq0s7HII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E+O5ywZM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XYXw029878;
	Wed, 17 Sep 2025 14:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KJ8+PbB3YJXI8m3SkqDg29QSmukxFeqEoZmLP20R2j8=; b=E+O5ywZMbV3jmhAM
	l/6U6f75bXUuCbu5jhct3+XWzJisBZsiAM6wmfTS799LqUmNGHWnAGK9n8QLUupH
	p7cEzNy/R4jzkG5+AuQYjdpQdW8q+xdt2cTmsYhGbuUzhXH+fiPCj6JCipOD54Kb
	XEXgnC1FQyAyNtV7yQkGd35kLgQpSkkgYhJoI46ojh9jqCnE4lrAMjpp9bLk3qW8
	gSmS5VDSCa1iYvvWXGdUNw8WhWP+xikohFw9uCq8WRIg8IxO1QLQI/7RR+sXmuSB
	kwmeBCBa+bge9L9ZA8zvoTl9uEtXKLJxz6gnb6WM+2GBprIhD/5FDAhHyOWoi5Ea
	mHxK9g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxjncm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:10:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58HEADIK015496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:10:13 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 17 Sep 2025 07:10:09 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V6 4/4] ufs: ufs-qcom: Add support for limiting HS gear and rate
Date: Wed, 17 Sep 2025 19:39:33 +0530
Message-ID: <20250917140933.2042689-5-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917140933.2042689-1-quic_rdwivedi@quicinc.com>
References: <20250917140933.2042689-1-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/PeNdcujnx9n
 +2bzm0kKn6CmLWJphrVtbRsUEWYzB+SQw+wa38tNFuuQNsiskLeaf2Do0yVsbalqkaDeMv2BRHh
 MmHpljGjC8CeVRhE73Cq8pQ0FqXY3T5Qnm4SWAYnJ5OBIrfoB1lOpAP7hxC+EbAfMZId9Lh7cmC
 vR58W90UBbAEZ77xwRvr7D4wWZtdeODF+VO1I3SP5Y1OJ5oMHCoPtCgirut/GktUO/WSkPHevOy
 rQJzHGOS+AKgBPZFOIehS6wilsRSu4rEO9XD5OxvsvpVlo2+scV0HDetc5Nn6gEEfb6hKSOel3y
 A43aNrUsHd/ss3/xqFMh68vCYR9b3iZGrxRrMLccQBTDzeLYv8Y4hxEwZS4l4D7BtPT6pNTOoDK
 lw+aJlYo
X-Authority-Analysis: v=2.4 cv=MMFgmNZl c=1 sm=1 tr=0 ts=68cac146 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=YZsCTDY-3J_n_fZr9xEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kATyhHd7kG3T2Fdpc5AnEQV3rrsUZ4jR
X-Proofpoint-GUID: kATyhHd7kG3T2Fdpc5AnEQV3rrsUZ4jR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Add support to limit Tx/Rx gear and rate during UFS initialization
based on DT property.

Also update the phy_gear to ensure PHY calibrations align with
the required gear and rate.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 1a93351fb70e..b5d7904597d9 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1092,6 +1092,18 @@ static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
 	}
 }
 
+static void ufs_qcom_parse_gear_limits(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct ufs_host_params *host_params = &host->host_params;
+	u32 hs_gear_old = host_params->hs_tx_gear;
+
+	ufshcd_parse_gear_limits(hba, host_params);
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
+	ufs_qcom_parse_gear_limits(hba);
 
 	err = ufs_qcom_ice_init(host);
 	if (err)
-- 
2.50.1


