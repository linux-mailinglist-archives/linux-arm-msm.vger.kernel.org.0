Return-Path: <linux-arm-msm+bounces-54638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 350B0A91CB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 14:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C08619E5C09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 12:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6ED1DA23;
	Thu, 17 Apr 2025 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U3jbWXqt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A5D33CA;
	Thu, 17 Apr 2025 12:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894038; cv=none; b=qgQ1tpHG/DN/VtRFy5PICVBSJ+CYAbyRpt5ZhtyIeuASOD+HFkGp8y1GspFVx5WKlnwNXfiB5mTVNghTEQURwL3iV0ckvn2Jtg9Bo/j6GdyojcS0aXR59VjHxKZwEX25DAsUAzelU0jm14e7meDoYLQK9ccjG9q0losRZzThoTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894038; c=relaxed/simple;
	bh=svLBuEiaOeLLLkQp3+tEcZnvD0CTsyN3AFJdjsg0pTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OAAIhXQ1A4KSdRD5MB3i5FiEQx5o3TO8EeZ+akMhIsEVuN+qMjcQdbScfcUjZM4pz//gtZUamSCFdKKMAIdvURmd9tuADqSZdx5Z9hZg/DSG62wBUsuuPA35hg9huRJNS4VdicuG1D9U4l3/M5m3qOmavOabysXdJLt3iQGKuP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U3jbWXqt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCHqjf026047;
	Thu, 17 Apr 2025 12:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ivJzsb6nLLB83i3baeNOWapLguyYB2mb4gp
	JbZRqW9g=; b=U3jbWXqt1sdPGh6md8b4nOoYd5/N8o90jIdpNr4PlQL5K+is5e6
	0zZIKfEA/xAF4/PHdbSJmvBxHExlSDISXmBOxeiawNlfrYJPpJV7YH30oUlmOWAa
	LnT2AoXIeva5iBUu+SZFqCoeTB/OPPw+gdgorwplgldphESnyszIOwHmY7qhoecD
	EAU5r65h/ysYem/P6KQLagFQZXbS6trqfzSQnaT2lwF2ysHso16jC6okmDPHZdPR
	EsIfxNkrqEwbOgPwd49zxbLNOKID9TFs+u2wqA+2Vibhrho8kdPpT88A1wzfffjx
	dO3qqONYlT4+k29/IU79Jsd+Oa6UCeTap2A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqf5q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 12:46:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCkmrZ017612;
	Thu, 17 Apr 2025 12:46:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 462f5drtt3-1;
	Thu, 17 Apr 2025 12:46:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53HCkmBT017604;
	Thu, 17 Apr 2025 12:46:48 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 53HCkl60017603;
	Thu, 17 Apr 2025 12:46:47 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id F1888501598; Thu, 17 Apr 2025 18:16:46 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        krzk+dt@kernel.org, robh@kernel.org, mani@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, beanhuo@micron.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V1 0/3] Add support to disable UFS LPM
Date: Thu, 17 Apr 2025 18:16:42 +0530
Message-ID: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9xKDzgHAnZdPlIDtBo3E57o1TMlNkdNO
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=6800f83c cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=DcltoM30VHtk37mhClIA:9
X-Proofpoint-GUID: 9xKDzgHAnZdPlIDtBo3E57o1TMlNkdNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=835
 priorityscore=1501 suspectscore=0 clxscore=1011 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170095

Add support to disable UFS Low Power Mode (LPM) for platforms
that doesn't support LPM.

Nitin Rawat (3):
  scsi: ufs: dt-bindings: Document UFS Disable LPM property
  scsi: ufs: pltfrm: Add parsing support for disable LPM property
  scsi: ufs: qcom: Add support to disable UFS LPM Feature

 .../devicetree/bindings/ufs/ufs-common.yaml       |  5 +++++
 drivers/ufs/host/ufs-qcom.c                       | 15 ++++++++-------
 drivers/ufs/host/ufshcd-pltfrm.c                  | 15 +++++++++++++++
 include/ufs/ufshcd.h                              |  1 +
 4 files changed, 29 insertions(+), 7 deletions(-)

--
2.48.1


