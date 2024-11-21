Return-Path: <linux-arm-msm+bounces-38582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD689D4553
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 02:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 025BB2827A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 01:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5B2487A7;
	Thu, 21 Nov 2024 01:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m2rDk5SE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7896A19A;
	Thu, 21 Nov 2024 01:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732153067; cv=none; b=IA2az008/DpoVAoMf/wRpjyNP8AA+ftC198i3l9yHLO9NzruaqPSP4ZH0usEfr2Ie0KxcyOz3kpRz4G9W/iWVQVqYeii1q3l8+FG7tUm9tTIJEvR9arIfcMzYoJPkeT2eXfqBT/IiaNGj/uSj7OZGerCbplgH7swwvGBPZbOsU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732153067; c=relaxed/simple;
	bh=+vmL86ts9Co+irvYEylTwUr6wNcIrbRbnUB+re4UPbM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=txBeFM5Uz3X+xojX+dZAF4KMSq6Y3aCZkzOWPo17cqKlTKz1tIxcd3Sw/gnRQfLAH26bC/Q7YWluwIC/lR3RwwEADF18crHzA+G5XVRSbxl3jZCMGE/t8FSlgYi+buCQWz3PA6iyFadp9juPZQxydHO2UathVR6z1fuHMC+4EkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m2rDk5SE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKUxNF005756;
	Thu, 21 Nov 2024 01:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ETGvAeeuzW563BAxL0pFZT
	DphVnsVcwKs8JXU9eOI9g=; b=m2rDk5SE/U6XDXPvo4DJZkI9bsW5YlQWlCflCS
	QrWFyhy3+QW5dGi6YEgTerC12eZa40qUBs2LPEQMNAf16Der2+T0CtE0DYRJYKU0
	SJsCNfqwwca6euepVFbwKQWM99CCc3bnObya3G40L/Tvn24QRya9uE4VjkOj+JNO
	KE+pWnUD6iyJL3C5+iOYAanjEyLgdZqdVigsHFxiVcLOH/1RnozNj0da0KqV912y
	Rb0HesitgNolrvYV8e/+hy6BxbiLVm1i1Ksny69aVpZb9X1Ysb1Xx6NagseTy1ez
	YOBj0V+84ReklFoyRZ7GHx2yG4NGAo3ShANK2D3Jl6J7iClQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7ynct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 01:37:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL1bf4x010355
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 01:37:41 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 17:37:41 -0800
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Subject: [PATCH RFC 0/3] Introduce orphan tee_shm and default tee_context
Date: Wed, 20 Nov 2024 17:37:14 -0800
Message-ID: <20241120-fix-tee_shm-refcount-upstream-v1-0-5da97f584fcd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMuOPmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyMD3bTMCt2S1NT44oxc3aLUtOT80rwS3dKC4pKi1MRc3WQzc8MkC8u
 0pFQzcyWgGQVAJZkVYPOjlYLcnJVia2sBFYBUHXQAAAA=
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg
	<sumit.garg@linaro.org>
CC: <op-tee@lists.trustedfirmware.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Amirreza Zarrabi <quic_azarrabi@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TcM5-H28dH-ebf7nWeuxBmsT-sADeSjD
X-Proofpoint-GUID: TcM5-H28dH-ebf7nWeuxBmsT-sADeSjD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=999 clxscore=1011 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210011

The TEE subsystem manages three main structures: tee_device, the device
that represents the TEE; tee_context, the context that represents the
TEE client; and tee_shm, which represents the shared memory with the
TEE. When a tee_device is opened, it creates a tee_context instance. The
tee_shm is created for the tee_device when allocating shared memory with
the TEE but is linked to a context. The lifespan of the device is
determined by the presence of context and shared memory, while the
lifespan of a context depends on the client closing the device.

This behavior has been modified, making the lifespan of context
dependent on shared memory. If a client closes the device but doesn’t
release the shared memory, the linked context will remain active,
preventing the release callback from freeing resources in the TEE. This
could lead to a deadlock if the TEE holds a reference to the shared
memory and relies on the release callback to remove the reference.

In this pachset we introduce orphan tee_shm and default tee_context.

When a shared memory becomes orphan because its associated context is
released, it no longer has a tee_context. One method to differentiate
between orphaned and regular shared memory is to use NULL as the linked
context. However, this can cause issues if releasing the shared memory
triggers additional calls, like those to the supplicant, which require a
valid context. Instead of using NULL, an internal tee_context for the
driver can be used.

The driver relies on tee_device_unregister which is a blocking calls
waiting for all context to be released and all shared memory to be freed
before unloading the driver. This means that all contexts, including
internal context, should be closed before tee_device_unregister can
proceed. This can introduce a short window where there is no valid
context to use when releasing the shared memory. The default tee_context
has lifespan similar to the device.

For an orphan tee_shm, default context is used.

This has not been tested. Looking for feedback if this is a reasonable
change.

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
Amirreza Zarrabi (3):
      tee: revert removal of redundant teedev in struct tee_shm
      tee: revert removal of linked list of struct tee_shm
      tee: introduce orphan tee_shm and default context

 drivers/tee/optee/core.c    |  2 +-
 drivers/tee/optee/ffa_abi.c |  2 +-
 drivers/tee/optee/smc_abi.c |  2 +-
 drivers/tee/tee_core.c      | 84 +++++++++++++++++++++++++++++----------------
 drivers/tee/tee_private.h   |  3 --
 drivers/tee/tee_shm.c       | 41 ++++++++++++----------
 include/linux/tee_core.h    | 15 ++++++++
 include/linux/tee_drv.h     | 13 ++++---
 8 files changed, 100 insertions(+), 62 deletions(-)
---
base-commit: ae58226b89ac0cffa05ba7357733776542e40216
change-id: 20241120-fix-tee_shm-refcount-upstream-c671b89fbe67

Best regards,
-- 
Amirreza Zarrabi <quic_azarrabi@quicinc.com>


