Return-Path: <linux-arm-msm+bounces-48556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA390A3C92C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 20:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BC0E189CB67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 19:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CC122FE18;
	Wed, 19 Feb 2025 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Alw8WS3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCAB21CC74;
	Wed, 19 Feb 2025 19:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739994609; cv=none; b=kpLSI39n1J2iRwnWbh4xGdccdSnqdy3f7Yxyfi+RfVGu8XUBkuOjgz56Mx4BAUnFDOfa2nXY2fMYsuFo6YpmUG7RVPOtYuWhX4E/FFDaYKPSJqYLGweNGbLOmYOLTWQUo++qiEr+A0DdQp325D46ud4WT+ArUbMp51vDFbcT3gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739994609; c=relaxed/simple;
	bh=tWZue+1RuI1RRVTcW+CiaxaQDWrkOh8LDyTvVfPHg2E=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=s5HSphfmc+gOikutPhdk58EQJwxWIbyO8aO8cxiCHGKvoRBfxZS4ElN56LApsPN+AfVhxsHnMBPDssuv9+yATFGLlnKBe1UZY8nvsl5pME4QFHeFXDLr2QEc6aU13g8V4mbtnAswvngTk1fU7PMGdhswShewQHU6V7eYXjoiUpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Alw8WS3U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JAaXDw017365;
	Wed, 19 Feb 2025 19:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yoqVrLtziorSSQIsiIHYjF
	LK7d7Ng89gryqZ1bWum3s=; b=Alw8WS3Uy0f3gjmV0BQodARsWkBWXWtfUkEnSm
	P93OuUt+u58A6LIvXW35boq2OjP/HsRXFeo/n6VyQoI2r4BecVgvYL02mWpicgBr
	AdyRMbpI94NkkTKE4cs4xMyWz7VQodDXsEETikjz+HeB/j02mlT6lrpYoN/0Cq+P
	QHGgATo+j1+D1nUwer2Hpd1+YxGeZ0941la+dhvPh2J8FwW58yig0WPwqpk/lk3c
	VehPc0Y0/+TXuaPww5HEhHA9Ws8FmBQfb2rlbLSFa0yJfmwrz2+UYZfNBbqc6Mys
	KakG1e9ly4dETr2BnQJdPUjYgA0mqJwcTrNz9lw00b1PMi3A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3bthn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 19:49:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JJnvcb025556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 19:49:57 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Feb 2025 11:49:57 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v3 0/5] drm/msm: add a display mmu fault handler
Date: Wed, 19 Feb 2025 11:49:16 -0800
Message-ID: <20250219-abhinavk-smmu-fault-handler-v3-0-aa3f0bf4434a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL01tmcC/43OQQrCMBCF4atI1k5J0jSprryHiMR0Ygdtq0lbF
 OndTQsK7lz+MHzzXixiIIxsu3qxgCNF6toU+XrFXG3bMwJVqZnkUgkpDNhTTa0dLxCbZgBvh2s
 P6bC6YgBboSk8+k3JNywJt4CeHou+P6T2oWugrwPar8m1LKVQpSozxU2hCwEC7gO54+fRbi5qX
 ea6ZkZrin0XnsviUc70f+NGCRxUIXJjtNbOVj/wYZqmNy5mrn4NAQAA
X-Change-ID: 20241217-abhinavk-smmu-fault-handler-ade75fef9809
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739994596; l=1766;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=tWZue+1RuI1RRVTcW+CiaxaQDWrkOh8LDyTvVfPHg2E=;
 b=wk/Y/1EhCHPvuwDEasfLYS+BHi4CT28ZuZeceUMxShAsQNxssgoQa8YDYHOXWoNlBCQxTmaA2
 e6tyaG9JH9+AsZS/JMvLcIfzP54zh02YSH/eAEPmWHzM+M8VNqGZRIu
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AphNhgLKZhfAdtjavU5Z1462TtlcefRw
X-Proofpoint-GUID: AphNhgLKZhfAdtjavU5Z1462TtlcefRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_08,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=889 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502190153

To debug display mmu faults, this series introduces a display fault
handler similar to the gpu one.

This series has been tested on sc7280 chromebook by using triggering
a smmu fault by forcing an incorrect stride on the planes.

---
Changes in v3:
- Move resetting of fault_snapshot_capture to before prepare_commit()
  call (Dmitry)
- Change fault_snapshot_capture from int to atomic_t (Dmitry, Abhinav)
- Link to v2: https://lore.kernel.org/r/20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com

Changes in v2:
- Reset fault_snapshot_capture flag in atomic commit tail (Rob)

changes since RFC:
	- move msm_mmu_set_fault_handler() to msm_kms_init_aspace
	- make msm_kms_fault_handler return -ENOSYS
	- use msm_disp_snapshot_state() instead of msm_disp_snapshot_state_sync()
	  because smmu fault handler should not sleep
	- add a rate limiter for the snapshot to avoid spam

---
Abhinav Kumar (5):
      drm/msm: register a fault handler for display mmu faults
      drm/msm/iommu: rename msm_fault_handler to msm_gpu_fault_handler
      drm/msm/iommu: introduce msm_iommu_disp_new() for msm_kms
      drm/msm: switch msm_kms to use msm_iommu_disp_new()
      drm/msm/dpu: rate limit snapshot capture for mmu faults

 drivers/gpu/drm/msm/msm_atomic.c |  2 ++
 drivers/gpu/drm/msm/msm_iommu.c  | 32 +++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_kms.c    | 18 +++++++++++++++++-
 drivers/gpu/drm/msm/msm_kms.h    |  3 +++
 drivers/gpu/drm/msm/msm_mmu.h    |  1 +
 5 files changed, 52 insertions(+), 4 deletions(-)
---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20241217-abhinavk-smmu-fault-handler-ade75fef9809

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>


