Return-Path: <linux-arm-msm+bounces-71418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 559FDB3EBB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 17:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31BA9173B3D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 15:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A95E2EC088;
	Mon,  1 Sep 2025 15:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b2NHKBAp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753C72E6CDB;
	Mon,  1 Sep 2025 15:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756742322; cv=none; b=DKQ36cFAxPeKMWwMHtOWuOho0WEDbXwe4Jev0mpszvqY/FV+OmMmCQfV4HJa+8k1kfrFFN25LvDC6QMnuRAwZTM2wBF80uiqdGLIWDSNoRnqhwq+HSfHwPbpICOS0xWRvx19n2TV2ECHsayYkNZHw8CwrKxKdABP3Y+ogCTVsjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756742322; c=relaxed/simple;
	bh=8eYUMhvn+IIZ06qLAmibbHFTwdcu3kwbiOXeFVmY048=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bjp7g773JvoT4lzuCNWRCXCGmSP5T0eYkftcTHa10v8N1Z0Pf1xRA3jCk69x9JZ9SqlaEuowmV0dZzZCnFSu8zV8giiVJxWpR0iz7cFzwIXoqGghUZMRl/C36HyslyCSI7JtZGdueTJJ2v47MQRWsuQhfP7r2t3UdwqTbTJRbIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b2NHKBAp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B43gn025100;
	Mon, 1 Sep 2025 15:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7EPwV5hN2UKWWwQJXTqQgiIfLRoD8LnWdqlkMnK+d0=; b=b2NHKBApERx1tTAH
	9ioxDlKA9HBOfWdinsWhFpgdcofvPd8CeqKLGZiXkUAdoBxeeRVYdYZ3t+zxLz37
	6f0r3ELL45xIpwsd/+zjQusFwjUsvF4KDNFdNa3/6exRHUpGXk4PlA2R6/5yck8X
	zlnD09kb9JjG0tct7wahcZq/IGzRUeTRzRRJg1eWNL9yceWYLz2X9qD6gVb+7o4Q
	rorNuHxiXjOZ/ty9yfiQ8exibV9c2P27c56mgIz1vpDwX/LB4eylru+Yk0VxWjrC
	MV6AYOkxs/qR2POk5Btc9e14KFOBLFreux8gMIJRxhzq+nbDAsCGJGgF/HN1TrqE
	zI49GA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fd64w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 15:58:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 581FwWME003196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Sep 2025 15:58:32 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 1 Sep 2025 08:58:28 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V4 4/4] ufs: ufs-qcom: Add support for limiting HS gear and rate
Date: Mon, 1 Sep 2025 21:28:00 +0530
Message-ID: <20250901155801.26988-5-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfXzaz8PEMi4tT+
 Ti/49o/9+ujqOzr/jM8EzgfOB6riKKVY1KH0FUpU8HPzjpuVnX5qV3I5Bs1GXDcPp5ovi8IaTAg
 cPUbBGHHHBppys5VknoFfeDUwZ3ziMvpy+xfPTsOyuNU4Ik2wzJArj0Bmx/keGunCHBwPPCvICs
 +YMdguOrzjpMG+Ylf15ie55s1WBQwNj8ZXWFs1F0jN7bRh9t1LQD/2Hi8ghiHbJZmN2NLXJ+tKB
 uDCs4mFxY6Dmc4XL5SV+W0mJSQrMaHZzFXtm1N6Tx9I5TVXEkR89Or5ZUBelETW2SRdOiti7V7C
 Ne4hxdxVw1cdCwAXRVKn4xQl7n8VX1XRfVuJoyRNpgds14ON8BivMhAKyXjEcgClzfhot0yXHRF
 iuTKwznU
X-Proofpoint-ORIG-GUID: 9HRUwHyaRdWszOK_7j2PawCTeMNOsE5m
X-Proofpoint-GUID: 9HRUwHyaRdWszOK_7j2PawCTeMNOsE5m
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b5c2a9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=YZsCTDY-3J_n_fZr9xEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

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


