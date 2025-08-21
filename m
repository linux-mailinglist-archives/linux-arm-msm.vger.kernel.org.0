Return-Path: <linux-arm-msm+bounces-70129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0914AB2F511
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 165235E6385
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DC72F28EC;
	Thu, 21 Aug 2025 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YOPq8Kme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142D12F5483;
	Thu, 21 Aug 2025 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755771423; cv=none; b=rbkiKJ8WlkoBG4zpy5FPVtmMVt1ymEYu9/0BHl+4ntlLA4nEN7xdbPkzPxcwwDWyvmdjZ0l8hKBVw+D+bbrmpi0Fsis2JYoxWmFl0l3a8vIWAnAU/C+CEfCPW4QEzvFMgSx2w8mZl9L0ogxOlLUxK1E826fVYJsGQQFPBD0RwXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755771423; c=relaxed/simple;
	bh=8eYUMhvn+IIZ06qLAmibbHFTwdcu3kwbiOXeFVmY048=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gGz0kv+eNsS6h50j9mwIZ7WDQDmD7w5nBA2L9O1z8Z14woArrplraLR+3utJVFzb+L5heVvxlXDRRIS2z+WEw5jrNHqTPOh0nZp2t4/J63uImv4AHOm10VOtS9ovWmusyt3Z+WvyG93WrHnRyUi2firECnVY7tvc1iWerxG6i7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YOPq8Kme; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b7Cq014677;
	Thu, 21 Aug 2025 10:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7EPwV5hN2UKWWwQJXTqQgiIfLRoD8LnWdqlkMnK+d0=; b=YOPq8KmeKbND9hhH
	oF9I18OI4S19RvHgUVmw1Ktrv9wmLPi/o9ZzvYXPiU4rIVjPWgB7dbCY7PVpuOv6
	0WWLRDkfWMBhuS5hKigncR/cE8qWxIZJ0vId7rtx0mdBQwZeEvBCm6Sw3+v0yAa+
	dex3D+ZB+CcVo15GjLUttJ8oQXetBoF24ipBFBI9kTfryfcDc1uf/wqJEne7XqyF
	Vb7n11jiOuHw471KtqbciEX6ObqhF+SzV9+pBUYWR+EjWRqvGP9Zg71NnjHTqHhk
	DTRy4kDnP0TZ47hnkmVnkjpuOcbUeawOuoHlgnBJ3+SqAMzij6uSH609V3pH4HKR
	UIikjg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528w071-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 10:16:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LAGo1Q000671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 10:16:50 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 03:16:45 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 4/4] ufs: ufs-qcom: Add support for limiting HS gear and rate
Date: Thu, 21 Aug 2025 15:46:09 +0530
Message-ID: <20250821101609.20235-5-quic_rdwivedi@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a6f213 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=YZsCTDY-3J_n_fZr9xEA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 4ggwesiU1qExUjFQI9lifa8hdmnVIr7o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXy3npf0/BvzIz
 ajqUPr3GV8wORQb/8LWCg/YhK4Xt4D8UhRvCMqUua/BxzGNG5U6U5IcHHqhPx9Rrn1FQaUO5jyJ
 +65Yn2KDL9oLuLWjKS/TmiCv3QM2CpXnubBa04k5GD62yC1xGHd9dsgP55344ZZk2lwsBiY8wGM
 wtWAVPvN3KdqbXvEJkwlrOCT17xahWMm21AJ7xidhmkMbkV4F7AvamS43vIEfg57D2ZLpZsiJCy
 POjJr4gt3VJdlUjufDjEBZL3IxP3NfAzitRrqJfvxPRQysP2P/YwoJ20I5xpaq4mJeJnY1Nrzep
 oozkIKMxfy1JOZyy35ePE7D3ioAdByWa2/ze/yDWQDIHOML5jb1Hd9FANr+dR4Wr3a8Z51hB8Ja
 /qlEQYfJq9m/WkbYynt7v2GiuE2ARw==
X-Proofpoint-ORIG-GUID: 4ggwesiU1qExUjFQI9lifa8hdmnVIr7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

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


