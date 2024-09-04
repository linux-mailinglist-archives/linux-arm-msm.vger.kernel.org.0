Return-Path: <linux-arm-msm+bounces-30606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3355F96AED4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 04:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6AB0B23346
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 02:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034013D967;
	Wed,  4 Sep 2024 02:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Rlwtzfse"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6252010A12;
	Wed,  4 Sep 2024 02:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725418628; cv=none; b=VUjNEyAmadncXd8JGDpS6z2npM+yMOkRkFwxF+cFv8gcGO2ooxJolrUeHKqS/EI1h4PatheDowV/UjITEO29NbtoGX7IWD36g0ARkvEcDdD/Kxfybmu2ff+1cxWE/PRhz3n6I/RS+P19hczldpcKpVE8sZIt6jH2cvrt5qq/NtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725418628; c=relaxed/simple;
	bh=7/f4Tq8dP6336GO+4c1FLfGwJKdvXnUPv8pWgAG+THA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d/1Q6TXmsy8UvMMDcL2XTm3DtGMiJhCbRX/KQUCy7ZgACwxuXxh9ZlKnxCHr8uwiAdEUJwP3jGYRbwtJ42G4XWzULOxUl/SVZN5mvpYfZUcqn9qItlHNUMcbaseFXAUOERVBzg4L4CTHBOgXoY+t0tAaWTbobtNEMQP6D1D7tMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Rlwtzfse; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483IRNLU009415;
	Wed, 4 Sep 2024 02:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=il+bJVxO9LYbn4Y9NnupTU
	e018Tv/GvD+rSBEzCM6gU=; b=RlwtzfseAFpQWgKFzkhkeaLecXEYXk7JSq7FoT
	XncUrTUT1ja8j5J3+zSqydYeSHBIvOdVxWahdXsWZhBGR53f84b/5XE/QaYYJHY3
	G0k9bc2B8QYFAZNqLKl9RycwzKLQgesNTgKoMatOKdut+wqMvOhtgAfPVnUJb8Gr
	ST6ExPTGUxOldLhnvbvvhF1hTlv/kgXTFH5iId1La9Y0Z9IeE32kwL0xeUJcd3dJ
	t1JoDb0FGdjbJvF3EkuPGr3Xsotn1ZnjAOKiD9aHEq5Vc96zGUqPpuStwqRDujau
	y2ptPsDZFRVoAIri4raKvSJ82EqTTns26ef5LfOCisumlFMw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41e0bhjh6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 02:56:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4842utYa028520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 02:56:55 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 19:56:51 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <johan@kernel.org>, <konradybcio@kernel.org>
Subject: [PATCH 0/2] firmware: arm_scmi: Misc Fixes
Date: Wed, 4 Sep 2024 08:26:31 +0530
Message-ID: <20240904025633.2881671-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sAEnno2ZYcAY2NatJuUyFzY4r0FJR6Ph
X-Proofpoint-GUID: sAEnno2ZYcAY2NatJuUyFzY4r0FJR6Ph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_01,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=639
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040020

The series addresses a couple of kernel warnings that are required to [1]
to land.

[1] - https://lore.kernel.org/lkml/20240612124056.39230-1-quic_sibis@quicinc.com/

Base branch: next-20240903

Sibi Sankar (2):
  firmware: arm_scmi: Ensure that the message-id supports fastchannel
  firmware: arm_scmi: Skip adding bad duplicates

 drivers/firmware/arm_scmi/driver.c |  9 +++++++++
 drivers/firmware/arm_scmi/perf.c   | 13 +++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

-- 
2.34.1


