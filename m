Return-Path: <linux-arm-msm+bounces-30137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 710099652B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 00:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B0941C22E68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 22:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8CB1B81C4;
	Thu, 29 Aug 2024 22:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WgcYKYRN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2523018A932;
	Thu, 29 Aug 2024 22:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724969763; cv=none; b=rLgbLtILK3ESpa6Xb/WYEPPlWCIEw9t+/2JLLwt3HbtIcZOqL/gRo9ByO/zewo9v/XvUF8CIX662cuv4TdEpjjLSYVExXh6uYk9AAIGVyA3RjSxQ2YhjvbhKkoJA2Ne0v0u/fm64X7h8RsUjrNKKJWjhf7rRkY3hQlqMi/c2OKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724969763; c=relaxed/simple;
	bh=b34+ImZNF5etbhSo75EGFiUfa+se+Z+gt6E6UhzuZMs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GKkTZUcEsJkA5cIM5q7fZmccfjpWTiyqRrXRQUQ3wf552haCN42A8KYAX3a0wGR3on9qsslnJjERJpm1a3phZJqQ14PLukY2vkxDHdedDaU+E/Yt3UEjvahPnFyMRt2iDkYr2QTTXL1VGxqvPbevceBLdGuSCD6z616apHHoCfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WgcYKYRN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47THVEhg029336;
	Thu, 29 Aug 2024 22:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2ZLhCYi/qtQgdi/cdg/BvKGhXv/g314yMem
	Nm9ff9X0=; b=WgcYKYRNJ3onuYvHj8hdTLuFzEw4+L6ptT3Gdsv8x7a40wEPv80
	2olrLJ4QABO6q2Ghkrck8jtQ/U1RnwleFT8pPV96k0AQ5uqvQJcaxEJgW2WKFM96
	W5Nd08P5uUkbTqgZANj3naVJUQtwDUU7IIDzTva9PcPexpo4WOGUnvjRpCDDxiLt
	gZemDlDO7dWsU3pawjzecycUsAQrZ8U3l/nf9JEV9dF45CUM4RbMjTKV8PU+sYQO
	HqOypuWTHd6gNXlCd1vDjm329vgi46zBEj1TnIMAqIt434xQZmzxxG445/W3NeQl
	wj5nEx2tXnSlx517DqVOUrSUK0YpJnWDVtQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puueq3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 22:15:58 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 47TMCLvX021097;
	Thu, 29 Aug 2024 22:15:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 41aj46q4uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 22:15:57 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47TMFvvr024978;
	Thu, 29 Aug 2024 22:15:57 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 47TMFvLG024977
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 22:15:57 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id 4C2FA639; Thu, 29 Aug 2024 15:15:57 -0700 (PDT)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
Subject: [PATCH v2 0/2] SCM: Support latest version of waitq-aware firmware
Date: Thu, 29 Aug 2024 15:15:53 -0700
Message-Id: <cover.1724968351.git.quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: ULhOuLAtJtGFwp3vKe8TzGZ4P7C_-KVe
X-Proofpoint-ORIG-GUID: ULhOuLAtJtGFwp3vKe8TzGZ4P7C_-KVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=999 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290158

This series adds support for the latest improvements made in SCM
firmware that allow for multiple wait-queues in firmware.

To support multi VM synchronization when VMs make SMC calls on same CPU,
waitqueue mechanism is added in firmware which runs at EL2 & EL3 exception
levels.

The macros defined in the first patch are only used in SCM driver and will
be dropped once Gunyah hypervisor driver patches are merged as fill_irq_fwspec_params()
is reused from here:
https://lore.kernel.org/all/20240405081735319-0700.eberman@hu-eberman-lv.qualcomm.com/

P.S. While at Qualcomm, Guru Das Srinagesh authored the initial version of these patches.
Thanks Guru!

---
Changes in v2:
- Dropped "Initialize waitq before setting global __scm" as it was merged here:
https://lore.kernel.org/r/1711034642-22860-4-git-send-email-quic_mojha@quicinc.com
- Decoupled "Remove QCOM_SMC_WAITQ_FLAG_WAKE_ALL" from series
- Converted xarray to a statically sized array
- Initialize waitq array in probe function
- Remove reinit of waitq completion struct in scm_get_completion()
- Introduced new APIs to get no. of waitqueue contexts and waitqueue IRQ no.
directly from firmware.

- Link to v1: https://lore.kernel.org/all/20240228-multi_waitq-v1-0-ccb096419af0@quicinc.com/

Unnathi Chalicheemala (2):
  firmware: qcom_scm: Add API to get waitqueue IRQ info
  firmware: qcom_scm: Support multiple waitq contexts

 drivers/firmware/qcom/qcom_scm.c | 135 ++++++++++++++++++++++++++-----
 drivers/firmware/qcom/qcom_scm.h |   1 +
 2 files changed, 116 insertions(+), 20 deletions(-)

-- 
2.34.1


