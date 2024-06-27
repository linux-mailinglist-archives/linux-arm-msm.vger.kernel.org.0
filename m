Return-Path: <linux-arm-msm+bounces-24413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 983EF91A1AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 10:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C1861F238CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 08:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7006A135A40;
	Thu, 27 Jun 2024 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pHa5Q4zd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312B280600;
	Thu, 27 Jun 2024 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719477507; cv=none; b=nSDod86CqBn00QCd0Wx4DFNHlcJVIQMSmVLTov2bUxO0h7vsWROBpEXFVrnEIusIK0gZrhRNZQT96Pqt1976apTPSABUPt5SYpQdkfh3BxD36ua2KZPbcWCVIlRuA2BwgMPYDOmnIA9SGobv2acbrrsQVbpW/8Zn8lnJgGCTU7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719477507; c=relaxed/simple;
	bh=kh3BvM1UYLJbgnRm0wk8tVIY19VqIuh2seSAOWDNjek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=RFqBCqRkjLyvWASEmpR1OZDWEDf4x6ZOu0J031WRiXM0fp2TgUMtSRXJfJlXfCn7GKWbMhY/MruAg6ldGNDrrc5v5ilEOK+ou3WRCfkXweVUTVLCTN0woWfgPgjf78+MwNcexGu34rW3bGDvEiTQx39gLfmyN52sDJMqNVYk+TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pHa5Q4zd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R1mPr5022654;
	Thu, 27 Jun 2024 08:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=/8PbBjaENy3mbbV95BuGAhcwyL8sMrqxjHV3mlbulEA=; b=pH
	a5Q4zdxYonEIAgUOqodamCFPxjqnYyINj/6wnFT1KCYuUZFXkl5ZNLJOG+fb36bQ
	dWC5XIiUQvO/KVqFP7DAT0yjDyZrZz0QJ4gg13hWjljf8LqOpah5bL/FDx26gvuo
	Ir757Il2AMiwKyYN4y7LMOVdyblG+l0rvJx2uo4kd0+w6MaLS+Fray4Dko4cOPhu
	hoaop8yLWzjK+IFcSJEowVWgUPy66QVjyHFS4Gl7wnKHqd1Z+ApqCRXi4BatmYlG
	8cIOyJ4J1V4cXWa192wwhRjsU9o4+hvywWf2DJmRJqjJV4Q7AHEGAoDhhtYl61UX
	bzly/eq9/9QQydB8cc8g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqw9k87b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 08:38:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45R8c4n4030671;
	Thu, 27 Jun 2024 08:38:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ywqpmddgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 27 Jun 2024 08:38:04 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45R8c4nW030658;
	Thu, 27 Jun 2024 08:38:04 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.213.109.119])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45R8c4f6030653;
	Thu, 27 Jun 2024 08:38:04 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2305851)
	id 23F0352B08F; Thu, 27 Jun 2024 14:08:02 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_nitirawa@quicinc.com
Subject: [PATCH v2 2/2] scsi: ufs: qcom: Enable suspending clk scaling on no request
Date: Thu, 27 Jun 2024 14:07:56 +0530
Message-Id: <20240627083756.25340-3-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240627083756.25340-1-quic_rampraka@quicinc.com>
References: <20240627083756.25340-1-quic_rampraka@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: n8FFsEVu6fw-16fLYKiKxRFkmINht5Zg
X-Proofpoint-GUID: n8FFsEVu6fw-16fLYKiKxRFkmINht5Zg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_04,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406270065
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Enable suspending clk scaling on no request for Qualcomm SoC.

Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index cca190d1c577..9041ffab152c 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1548,6 +1548,8 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
 	p->timer = DEVFREQ_TIMER_DELAYED;
 	d->upthreshold = 70;
 	d->downdifferential = 5;
+
+	hba->clk_scaling.suspend_on_no_request = true;
 }
 #else
 static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
-- 
2.17.1


