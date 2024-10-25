Return-Path: <linux-arm-msm+bounces-35786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7CA9AF954
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 07:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F04F28252C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 05:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A05B19B59F;
	Fri, 25 Oct 2024 05:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CfBD6ovG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C191197521;
	Fri, 25 Oct 2024 05:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729835487; cv=none; b=E6A382LA4Lg0wcQqawS6y0qWw6Oar3ROThYv4o2MDYfhjHXziR7Sl8VoX/ICjOZY12ch1W4rJlS1cNYHuPS1RMRA8Xxxj3gAjxOGIq3uoR8wZ3fqurvtfvyDPeacsgHWP8snFwti7HK+T2tyvc8m185sQQGuXv5LJPbUStLeoGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729835487; c=relaxed/simple;
	bh=Lw25vTu0qqfYwP9s9rInpUV6KpQ9I9LvWUE5ZeFOKB0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mpHvyy8RWZjWhtwjn3EgF01AZbofDatxHZ6kd94tFTLav4GsjYIiN6D0M4wTZjVqMkFYNx/+yHnpCvhujQlPH+D43dFSMpG+TB60MxKnUGwW4my1E2Dv6c5JVMw7B20jnrgclC5eLR+JfwwFLvOV2TwF822oyEkpSUUT2EquXlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CfBD6ovG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OLApGU020289;
	Fri, 25 Oct 2024 05:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=j4dI9icppoAur5lquUafDkT8o7p6W+wZqvtjOOgcQ30=; b=Cf
	BD6ovGHhI7N6zcgNOw0VvDallgp5DGmUKgFeayzBEBGjpRza8QL3LBj9CmVqAnFY
	b7FJ7xwkMxB9G4i23rwxSFx3LeOv3DJVelTiQTzFHp1VnHEoeXHeC1gTS1oj0oR2
	xf/KHNWXNlLJsp3wZje9oyvKIMNUHUQ1p1s5Y7o9Sbsd+/uN7jOF6kIBPpNVTgBE
	6prnt1aJxpe0mhNzNdyK7A4326YIqITanuX1HfljuejoUeUANkthQm7TodHA/lrU
	Ax8eET3tcn+4HhhP8p0sP1IG1nHsaUzYVj6/bGKxO7zpg0tQeoQHgSw8uWMzW8im
	rDQC8Njvb5HlUXZU6sSg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em66fxav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 05:51:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P5pDop006264
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 05:51:13 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 22:51:10 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>
Subject: [PATCH 0/3] scsi: ufs-qcom: Enable Dumping of Hibern8, MCQ, and Testbus Registers
Date: Fri, 25 Oct 2024 11:20:51 +0530
Message-ID: <20241025055054.23170-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BCl8ggYjt51EBZNYw3jJr3J0YNPG-W3w
X-Proofpoint-GUID: BCl8ggYjt51EBZNYw3jJr3J0YNPG-W3w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=22
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=383
 suspectscore=0 clxscore=1011 mlxscore=0 bulkscore=22 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250043

Submitting a series of patches aimed at enhancing the debugging and monitoring capabilities
of the UFS-QCOM driver. These patches introduce new functionalities that will significantly
aid in diagnosing and resolving issues related to hardware and software operations.

Manish Pandey (3):
  scsi: ufs-qcom: Add support for dumping HW and SW hibern8 count
  scsi: ufs-qcom: Add support for dumping MCQ registers
  scsi: ufs-qcom: Add support for testbus registers

 drivers/ufs/host/ufs-qcom.c | 141 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  11 +++
 2 files changed, 152 insertions(+)

-- 
2.17.1


