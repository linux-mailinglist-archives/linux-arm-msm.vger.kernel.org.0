Return-Path: <linux-arm-msm+bounces-63948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBB3AFBD15
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 23:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78440480872
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 21:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1962853E0;
	Mon,  7 Jul 2025 21:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m8mrIAFQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F3C26CE00;
	Mon,  7 Jul 2025 21:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751922211; cv=none; b=Ym9im50QDF+Fzehg/KfbtS64+k9T9NDTRMcp3oYb+gMnC62quU1X5ApCIpg4EYahBj9DErHxgCGvabfgW9VDRzWbdSX6vk3WnMRkqG1aErPv2QhuBoNrbuMVTxzs5b+yTG53tFUYdf2RJiNBbpFvTte1WsGkU73QyRrkW9TiBD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751922211; c=relaxed/simple;
	bh=AbkzMAYAWERnxiFKRiZtC8lW41jukiC9OACIVaS7/W0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mJPdzlVdiwQLNPhGqjnN2MlSKiVwdi7jgxQUzPdXTVBR6hIEZmEDD2X3EV71w62rUK8JcQs8UysuGE+/QEERzmi/UOGi6CrAHl5Gdhr5vCZGlY6KGAeX6TvmXtMDvuOYyAX+pkC2+Ya+sRQRvvl4mhtS73uazLmDGDzLGPKNqA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m8mrIAFQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567KAMK7011930;
	Mon, 7 Jul 2025 21:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hnYqspkuEK+pu2xr1vqMUHoCIxhuBQQlYy9
	QcC7+xec=; b=m8mrIAFQfNqFfLemml0gygmc7sfg4A2iPIxqiqw65KcnCkqMHFC
	54xpw6y+anJcDkAbqgHmPsZNUqOYgPT2WROtSlATzIWBgMq6Pb7LdIOCZSNw4onR
	pQ3RTv5cF79B2wjh9my2pYYaiL+QBZTQvFeBJDCEQ+j597dOquPGQ6osv3yXY2fa
	3tDIoImwn8bKriEnBKIdZ5CDy7Ja//RJrzyd65xW1CJ1v3LMNwYHINyfO7eZyLE4
	CnBUP4CwU0VYq7J0RWhHwrecc4CILBA4lE3I5W4MrHHISaplplcIHXEblN+osrqe
	c0PmwAnbQQqS9rQwj+lgJM5YlJpyjh05vLQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmrmwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 21:03:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 567L33sI015125;
	Mon, 7 Jul 2025 21:03:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 47pw4knn21-1;
	Mon, 07 Jul 2025 21:03:03 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 567L33jC015120;
	Mon, 7 Jul 2025 21:03:03 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 567L32mp015117;
	Mon, 07 Jul 2025 21:03:03 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 815BF57186C; Tue,  8 Jul 2025 02:33:02 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 0/3] scsi: ufs: qcom: Align programming sequence as per HW spec
Date: Tue,  8 Jul 2025 02:32:57 +0530
Message-ID: <20250707210300.561-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686c360b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=g0woJlExcYKCPppWxPgA:9
X-Proofpoint-GUID: thcVEDtOMYUrJigDUnVENkmM-Ftxyyy2
X-Proofpoint-ORIG-GUID: thcVEDtOMYUrJigDUnVENkmM-Ftxyyy2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDE0MSBTYWx0ZWRfX1hKd/UnPWm4d
 5GMxp8ABraPTN2uxJXon/fDkiahN9txI7C7HVhS2Tc4mjLKVFl2CZ2bltX/onH6dunTAoztI9JO
 yiHbeyFR7S7qg9JSkDROq7/HqKxNK9bh9DTDlN+Y9HVQaw7eH6e33FtHLYSo4pEQXyD++VmtTfT
 sp0cFdeFsqrQeAjGaytmtIFaDshQmbwm71OLRZ7/2iTez/T06qs7Hg7bViz4XeH59KSR3RX6JgB
 AjGXVs/TM/k4X7CdravTK36TAya/hAGYOVlIfSlpYWHsm0LXDq6yOy/fWin3u7tj1TmdI6rDPAh
 WK1yqiCyYrb7PtB1vmJUrYry0FTYSCqPZIWfYvakle3SR9wrR9iLs61HUIasrVkhwxvlFM99q/y
 l+4/RaTSX4Vw43sQWKGxJocJZYmaJXCPW8XBR1GX7gEixNSyZ6zTQ4rXfYdCRGGfMfu2oliA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_05,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011
 spamscore=0 suspectscore=0 mlxlogscore=684 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070141

This patch series adds programming support for Qualcomm UFS
to align with Hardware Specification.

In this patch series below changes are taken care.

1. Enable QUnipro Internal Clock Gating
2. Update esi_vec_mask for HW major version >= 6

Changes from v1:
1. Moved ufshcd_dme_rmw to ufshcd.h as per avri's comment.

Bao D. Nguyen (1):
  scsi: ufs: ufs-qcom: Update esi_vec_mask for HW major version >= 6

Nitin Rawat (2):
  scsi: ufs: core: Add ufshcd_dme_rmw to modify DME attributes
  scsi: ufs: qcom: Enable QUnipro Internal Clock Gating

 drivers/ufs/host/ufs-qcom.c | 24 ++++++++++++++++++++++--
 drivers/ufs/host/ufs-qcom.h |  9 +++++++++
 include/ufs/ufshcd.h        | 26 ++++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 2 deletions(-)

--
2.48.1


