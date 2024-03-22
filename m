Return-Path: <linux-arm-msm+bounces-14898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF6488738C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 20:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70C451F22357
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 19:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B91E76C96;
	Fri, 22 Mar 2024 19:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fYCOfiZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1891F76C8F
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 19:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711134136; cv=none; b=ZUP2F/dKVWUQSxRwsQKgYUzgC5F1xMl9rjjMozwxI/2N8DLVRIZLT0jr7mTFqlljj6uYSgNx4ryvgCwF26PWgvI+7jjbQLrYjrhEbLdMpRlyTqAGXZFq/obQjsU6CQolyOX3lrnchq8Ci2zNy4svIo6QYbcLvLBlyeHU0xe/s6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711134136; c=relaxed/simple;
	bh=kw1sUziSC70Eb0/EExMCaFFWCt6AeBVT/CR8Ao1mk6Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LIxUqkc6FNutB1O6I6MWB92/KeQ5TCcBJ6Aa/mvUeGDCv5+3uE28o73uiFiLgUaNMPp21xxynjWeO1awGFKe6ygS0PwXgbqBfMzXhXZxCPt77XUrFAMIKOH0Maa3oAIT8yKht+2LuEMcLN5KYdiTVBXAzSb+wPx55XY+31UQ1rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fYCOfiZm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42MIo38H023642;
	Fri, 22 Mar 2024 19:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=QutXxlM
	BHByGHqQtpkzW5X/LPWd8vRQVqi8dfyhWfAY=; b=fYCOfiZm+HKtXJ6aRKN1vyD
	bFNDJF+qfte4qAndD2I8fp2Y78Vk2v5nTb0RrF/n1Qwds5bUKSdkogm8dTYR5j9p
	cke7UFga9f4ALaCs5XexNvpyPD/ExS3T24di+7gaFTyIjmkgkUR3dSAugtzvi0qK
	ladkfo9e7+TtHzVGjAuhya61yThoX52PUS6WK9Ma0ERbXLYAVmmVgim/dmrD6KT+
	OqXKhY/MHPsUoytfYXL8dVvFjn1Apb1yN3m2bDS0gaIOQcw8/nj1ibkom0gxxoXS
	Q6r5T9bEmjn4lEV2RHpf0cbJZP6Gvb46WO+l29XFap/JWXSEyY6hmTiXPduWQKg=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x18d2sevg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 19:01:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42MJ1gEt016242
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 19:01:42 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 22 Mar 2024 12:01:41 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>, <daniel@ffwll.ch>,
        <jiasheng@iscas.ac.cn>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v2 0/2] drm: Add DRM managed workqueues
Date: Fri, 22 Mar 2024 13:01:19 -0600
Message-ID: <20240322190121.3881425-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ANunKHemzVh7ZDUSV6NWhtnQyPztJa0A
X-Proofpoint-ORIG-GUID: ANunKHemzVh7ZDUSV6NWhtnQyPztJa0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_11,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 mlxscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403220137

Based on work at https://lore.kernel.org/dri-devel/20230118032413.6496-1-jiasheng@iscas.ac.cn/

The API in the origional work seemed to have two issues:
1. The output parameter was not correctly defined
2. The allocating functions did not return the allocated object like the
other drmm functions

I tweaked the implementation to address both of these.

From what I can tell, the i915 change no longer applies to the code
base, likely due to refactoring from merging xe.  I dropped it.

v2:
-Fix make htmldocs warnings

Jeffrey Hugo (1):
  accel/qaic: Use drmm_alloc_workqueue()

Jiasheng Jiang (1):
  drm: Add DRM-managed alloc_workqueue() and alloc_ordered_workqueue()

 drivers/accel/qaic/qaic_drv.c | 30 ++----------
 drivers/gpu/drm/drm_managed.c | 87 +++++++++++++++++++++++++++++++++++
 include/drm/drm_managed.h     |  8 ++++
 3 files changed, 99 insertions(+), 26 deletions(-)

-- 
2.34.1


