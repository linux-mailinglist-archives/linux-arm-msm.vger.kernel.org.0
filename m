Return-Path: <linux-arm-msm+bounces-71672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E45B2B40B0B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0144F3BBE92
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4B9343D69;
	Tue,  2 Sep 2025 16:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DfeMDtpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E98341AC3;
	Tue,  2 Sep 2025 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831783; cv=none; b=d8ReG1NqgMN7GdXk57BznjHn5TilnyjcpRcDXpmuIBjOvSRqogt2DedKqlEBB6U/2wPck205/+Ha5B/N1WWDrrVEtDl+EkLe6Mzf0QBQBKWwDLFfCfqouYCR9jUUFYnNkzZJZY88Dr79PxxGerzAMgho9KKWXkT5LcFPuYvLKro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831783; c=relaxed/simple;
	bh=8eYUMhvn+IIZ06qLAmibbHFTwdcu3kwbiOXeFVmY048=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eD2d3p4kHIdz9WFuq/cPeDdv4o6j1FaCRnHQcHbxLE4g0jrxyvPKHx0gm8TZ+fCtQys24WrORcxQK8Bi/8WWow7T5KVtXrovLCZJDNfRXVAzjMRvMDRXjaWJgv4JqenfXv4Cip9OTfyp6u3iTPM4GoGiJcOw5gtdRXSFHIvqtuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DfeMDtpV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqL8W010204;
	Tue, 2 Sep 2025 16:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7EPwV5hN2UKWWwQJXTqQgiIfLRoD8LnWdqlkMnK+d0=; b=DfeMDtpVSUFRp9zu
	qgXixTrV0VFWOEeXcgxSKH1RGoU3Px248dVW8Gko8uZ0bVsY2/ydqEP2i2QAAPhy
	0WnxGpHR0CXDJNPITjaElXf7Y+VA/L0+GWvRXIbHotka3PUi583wA0VEr7EA5FBY
	eXGPnO2hKwO8iZYv8J8Lni9wvHWYbo7TvMa/J6ie7jD40Scu/uXaRrR40jR1VoQo
	Cd7PjienDiyVhOFNXsxu90q9jkpxapYF9l2UcQ10KgUyBMn3DbOiGARNjkTPuPaW
	7WWi3SGhuY5Q4IgbYAP3s5kCfNae3CNz0prG9PfhDUDGOCdF55t2T+8g1/rEK7Dq
	vQlBjQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0egr3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 16:49:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 582GnVuQ032096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Sep 2025 16:49:31 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 2 Sep 2025 09:49:27 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V5 4/4] ufs: ufs-qcom: Add support for limiting HS gear and rate
Date: Tue, 2 Sep 2025 22:19:00 +0530
Message-ID: <20250902164900.21685-5-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-GUID: YGYlXGqB2wY8gHXkpBgiPvRrWZ0IGWod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXxkfu/TYRFi9t
 FaD4AZiIYoS4Az7NA4NavaxW4b3x1u32hMD/xXCJJS7pxPhoRm7RH8WC3N85A21vCBIi6LYR9rq
 DQ3qI+9RQjw+hp4zpu7xbwxffeyi9qEoCKAz0V64X4OW+mW6h8yKv7M+jJNX4W14yZQVKYeSUcG
 zgWpdSFB0og+AG95uncrhz0liZGs83kcjni/fkD7Jfdye+AF5BHwR7Kc3kiv2AcFlvtWosa139G
 5gnXlEBR/8UsZvtTPU5Nsa5yfa8sFQht3K8tXMT7vSERiNR8GBBYFzOvMrnty2U/c9PFrwy5SbE
 yFx5o03qXftKXSRyGK9tf0B1+0viXUozk6lnF05uAe1yX6vSHBEop+Eeo7eFW8YJ05vgvFl9FGQ
 pWJAiO36
X-Proofpoint-ORIG-GUID: YGYlXGqB2wY8gHXkpBgiPvRrWZ0IGWod
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b7201b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=YZsCTDY-3J_n_fZr9xEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

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


