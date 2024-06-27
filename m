Return-Path: <linux-arm-msm+bounces-24411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDF991A1AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 10:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8C8EB21690
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 08:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF9081AC4;
	Thu, 27 Jun 2024 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HlsQDQYS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312EC811E0;
	Thu, 27 Jun 2024 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719477506; cv=none; b=MT+gNQawKRs/ZycrvRNCan+Ayq7QuFLSuefDe9+T0BQ6ccR3tyyFTcf0K5gBZymfFhSRErn35mPmak0VbZn7waIa0i4i0xUPcNLn4usRikSq1/1CI0W3WHMkOGLr2FJF4FTj2GseamGOFnFGbPKcmkV4EHOw90oNdbpxt/g7jTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719477506; c=relaxed/simple;
	bh=mqfx5ksWosU0CiBPtG4D894KPu7bNgUqhw/E4BETbGo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Ser2A6ct1CBIAw2DQP4Np7qxvU4CRfHGAVXWmuZ9tfG1EgeOEtjYt6J6zyeLgwlLoHGsytIflkGprD8C06FqHz4aKH39CAjRaqvVj0ClcqRiuailxpwU61qstJqMz9sFFLr/Dk748x1RQJt2cGrrbz9YTXeZpJFpDd/KmBSX94o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HlsQDQYS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLl7cK015311;
	Thu, 27 Jun 2024 08:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=Lq+rRcg6ccZe
	tyDINB1odtbA3NLCz3ENFJv718cfSJE=; b=HlsQDQYSpmEG1CCVSXaXnJZeF62E
	/T7vyMTd+qF6NQ0Aq9Ixq06xQmpJAXMxc2CNeT9r8Cu1kyNf49MxrLT8KRCpEZEK
	G/tCmQiY6uuRZQJevCRn770CxMaOXFjsjNnrG/Su4X9VtAYUKeimmcICtwkHZpHB
	+LJtKklTuPiFQi43Sw4dl0Jb2QKYsEre1+kV2Xp+NYydZmepECjjOMScUlIUW0Ev
	84T/3x3ln5XtClcqSU1AbEWm3iRqBHR1Gp8a5P4j8lydGMqYG2I7JHo39PQgbxzG
	I+yuq7Ivf6clN0XrMfQTDLUJfyLth9EIpR/b+egsrjIBhL/HRHnFsVFNiA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400gcmas65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 08:38:06 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45R8c1jf030630;
	Thu, 27 Jun 2024 08:38:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ywqpmddg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 27 Jun 2024 08:38:01 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45R8c0Hv030625;
	Thu, 27 Jun 2024 08:38:00 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.213.109.119])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45R8c0Oa030623;
	Thu, 27 Jun 2024 08:38:00 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2305851)
	id 891B952B08E; Thu, 27 Jun 2024 14:07:59 +0530 (+0530)
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
Subject: [PATCH V2 0/2] Suspend clk scaling when there is no request
Date: Thu, 27 Jun 2024 14:07:54 +0530
Message-Id: <20240627083756.25340-1-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8NI7dJoZaMspH3J7PXFI6UJoMBXhqGtp
X-Proofpoint-ORIG-GUID: 8NI7dJoZaMspH3J7PXFI6UJoMBXhqGtp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_04,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=850 clxscore=1015 mlxscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406270065
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Currently ufs clk scaling is getting suspended only when the
clks are scaled down, but next when high load is generated its
adding a huge amount of latency in scaling up the clk and complete
the request post that.

Now if the scaling is suspended in its existing state, and when high
load is generated it is helping improve the random performance KPI by
28%. So suspending the scaling when there is no request. And the clk
would be put in low scaled state when the actual request load is low.

Making this change as optional for other vendor by having the check
enabled using vops as for some vendor suspending without bringing the
clk in low scaled state might have impact on power consumption on the
SoC.

Changes since V1:
	- Address minor review comment.

Ram Prakash Gupta (2):
  scsi: ufs: Suspend clk scaling on no request
  scsi: ufs: qcom: Enable suspending clk scaling on no request

 drivers/ufs/core/ufshcd.c   | 3 ++-
 drivers/ufs/host/ufs-qcom.c | 2 ++
 include/ufs/ufshcd.h        | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.17.1


