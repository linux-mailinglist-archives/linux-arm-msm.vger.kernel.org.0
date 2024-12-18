Return-Path: <linux-arm-msm+bounces-42601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E65A89F5B6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 01:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C69A16F260
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 00:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10C51F931;
	Wed, 18 Dec 2024 00:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fhTp/YGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414B217C91;
	Wed, 18 Dec 2024 00:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481713; cv=none; b=QvOOw9ula+IAZVFljAD1Wj1oP2uNgg76hijpCiLHU1dA4oATGVPKoveFaAA/Bem9VJfrIVwMelsFSNLPgWXjqoxSsJVqRLzm49PrP1P/kJFAmnetiHfa11RgwRD9kmM/oVHr3q6jb66pbFSbL3U/TlAhAZWIJ9md1OAWx49nt1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481713; c=relaxed/simple;
	bh=8v8tVxwIEalWudvsQhTGI/+8TbyqYgg05+y8nly2gSg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=sPvIaxbQu4WOusw1ElH1EviOx5L0rm/R99DU2Q6FnO3Wsd6odHfalluq9VbWXrpjmLZUktdYzXwOhjhTgkV2mR5Dv8uglyNCTCMIGl+KNUhAYwB/3N5l/XyoAHZeRVEqQpqYsqbYulU1GR92X7yFoTcBGk1Fwu43izL5dGKZ8s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fhTp/YGm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHKrYhP013630;
	Wed, 18 Dec 2024 00:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bLKMfP728/tBS9278o0oEg
	mLp67j8qDmpi5nITFL0J8=; b=fhTp/YGmn1sHJODHji8N9iFivfk9FTQAoj+osE
	EKEfrubPOM1FeFIOLqWD8ecvMov/EZhIqn/hQpTP4TxWhPJFGaku+EVNbGTQEJ6w
	CVAcao0H1O78Og1hjSUWu5BPpyZ04R6GnfEKBFVXHgqFCDRtal5B+3hHNaJedv/Y
	uwG85E8xBF1gStDQTr5AVeWCYfcs66/E7LbgjsQiC1kC6APleXe3j378oSUBpNU2
	F3bCJUGtwCi/ZaP5lVlSeaz8ZB2hCEz+nuSPKQXRyxC0SIErg6n0ah0iXSCE091I
	djjp0AhCtc4cvtRbFFoUmMok9lMC8+Zpb6+mb3hkRyuwzOvg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kgr10bhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 00:28:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI0SMwT026413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 00:28:22 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 16:28:21 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v2 0/5] drm/msm: add a display mmu fault handler
Date: Tue, 17 Dec 2024 16:27:52 -0800
Message-ID: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAgXYmcC/z3N0QqCMBTG8VeRXXdkG1NnV75HRKx5lofcrE0lE
 N+9FdTlDz7+38YSRsLEjsXGIq6UaAoZ8lAwO5hwQ6A+m0kulZCiAXMdKJj1Dsn7BZxZxhnysB8
 xgumxqRy6VvOW5cIjoqPXt346Z7s4eZiHiObf5LXUUiitdKl4U9WVAAHPhezld9R9RMGWdvJs3
 9+W7bspsgAAAA==
X-Change-ID: 20241217-abhinavk-smmu-fault-handler-ade75fef9809
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734481701; l=1480;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=8v8tVxwIEalWudvsQhTGI/+8TbyqYgg05+y8nly2gSg=;
 b=/WNx18im+refjr6pFDOMLybuorQGq7tRR04sAQisWReZEojEv6fUoZYR4Eh+2lIzp9VGpfqfQ
 N5N5Zf/K3OaDZfhf9R6lF2V27aFeIRNOFUx0gMZN1ad8xRL3MRMVime
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sdJ1SLXlnfa2jvPRQfKWQCwyvFl7FPGM
X-Proofpoint-ORIG-GUID: sdJ1SLXlnfa2jvPRQfKWQCwyvFl7FPGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=868 clxscore=1015
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412180001

To debug display mmu faults, this series introduces a display fault
handler similar to the gpu one.

This series has been tested on sc7280 chromebook by using triggering
a smmu fault by forcing an incorrect stride on the planes.

---
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
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20241217-abhinavk-smmu-fault-handler-ade75fef9809

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>


