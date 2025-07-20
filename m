Return-Path: <linux-arm-msm+bounces-65789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B87FB0B5CE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 14:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E4AD3A66EF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1681A3179;
	Sun, 20 Jul 2025 12:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYwh4Us7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2775060B8A
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753013813; cv=none; b=il+h4sc+6mIWG2c8l5czkOvgCtl8YCaaLvvzHhQqLmY+bvzMAQ0qmNdJjCQ0xMggY8WqOnO1WLeapCMep82RrKvIHvBNDkcuq8rbdjyQYYsEM0WlLedcBoHcXCyR+WZP7sC6wmoT5rr2PCnaxdSK03P0VPBQzZg9HNQ5xIA3PSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753013813; c=relaxed/simple;
	bh=6N5DisMgqH4uXAYM8uU6vWHlCUFyS+1n+wdiyhygzmo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n3tHwjOZKMy9o8xsATsKgfhqGpBLBYy3jKAQ/RyQI8fAdowvsN4hX2Wf4BbFu18XsBdijQJQaPHlNqApw3OOwywvsXFi9MiZnMefnNrri7DRUsCLupLFu0k83lhkWtlYAKZFYV0E6hRjBAtVu7ZOox245QwEf6/j3q9SyoK891I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYwh4Us7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KBDAxS031469
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BRz9CJxIoiVkkfsVZqEaKY
	nvwgqhcwu3BeWnZwXeIbQ=; b=VYwh4Us7Ib85j5BDn63GK+QC83fFkGWMHBODFr
	fH5fX2Q0KzX6f2S/dizemfTw+vC6DY66WulV989dQJJvUqRNuNQ4se76Gsom2Sk6
	Wy8HKPP0b7azT5lDubg+Z1HMG0i8Tg2Vjbv5zDl62WtjQlcqhFj52wv6A3TaqmyW
	RkGsZVaNuIyHfZvu52CH04E5ee8dTdHDd1AhyH/putmzxL/bPDLa0PfmuejQal+P
	XcPgjHIw1VB9o76hBA/nqObeqy/hF3Oha6XaDkvhHsfyZRpxUanSYi4pQsArTnQM
	wXDlKLLQ8BJs1z8F2ahGQUavNFpm2MnG0llNpJRAapKlHH/Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9t3m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:16:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74928291bc3so2622591b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 05:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753013810; x=1753618610;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRz9CJxIoiVkkfsVZqEaKYnvwgqhcwu3BeWnZwXeIbQ=;
        b=Vwvc/RGNwt5GBplDGgb1MvzMq7wq3mAgHiaYVNllG2yxia3mmfRuc26Allr3QYXypG
         sOoAzd3kqdoZT2KH7HQ5fDMcvQ/rdiuEtrB2o6kATQbBOJ5KI62mNifhWSYzDiWcaEIp
         xXsHAVkYDFSrvSmEg3//Enegn2x3IJiDqnMXetiODcOKe0mY/TVF5W0YF/13oikWnEk+
         LhrUM7v61GkB2SvHo//ghT4Qz+7Cyf+3Q2vJV79Km6qJGTH0Lz0dbVU0QlXmOLiPdMlX
         9h94JgBJbiQeEGMMQy/t1N9tEFPtq+y/5BLxNFbHBkSje0Wdwu7RdXSo3+MD2ZJVy+U8
         l2/A==
X-Gm-Message-State: AOJu0YzWv+znh1xKshGH7aAvGY27sK2dGQj21cMqPezi5EExsJxo849g
	l3inWUc0ixhtYQQ9r5KPLRPaJOB80+UgUBa3mXz6NKrzHTlea0kjyEHm8JReXJEPlzwtRMZG3QV
	F0ZGjHXUJdhvhmqL5qYupQNYwVh9sVSF56zfz5M6BadNSMBmzLa9ZogI1sxXaeOM1Mh+zMqSa04
	rj
X-Gm-Gg: ASbGncv6dSE3t+FTHhOynS1fBghi3W8qj6JE+aBGjJBTKsQc2t2bfRW3K+F3nmKtJW6
	Im6fTM6Fm0TavTeJE3LvGNn8+Zds0Mz0enPFQwcmmhXn5cIlwBrJGzq0de21dzUlAJUkIyV79UN
	r95XeNICaEZ2cQ20ewvr8J1kPwEi32iQLYqje1q/9HjeC8b3MdYMpZslRg8aRntqSvg/AlYvWQU
	o0dPZeo3DwAzXAiuUVNZExLNBuBBRQ2PGUcqLx91h1X8djf1BhZ8lgE65PK7UcHn5E7sPvsAAAX
	hux47JC/e0rk1moglixwRh5BtW6XE9lCxu7PCVXJCtYeWhlZhWK4Lw+Y0UgRmeYT
X-Received: by 2002:a05:6a00:3e0a:b0:742:aecc:c46b with SMTP id d2e1a72fcca58-756e99fc423mr22709777b3a.15.1753013810121;
        Sun, 20 Jul 2025 05:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3WQE6VxrcFzUyVHmjvH0Xv5hyM5tVlmf+2X2yTpgqZpQXqs1GYjTUCMAjIgH0EvUJaGNagw==
X-Received: by 2002:a05:6a00:3e0a:b0:742:aecc:c46b with SMTP id d2e1a72fcca58-756e99fc423mr22709737b3a.15.1753013809577;
        Sun, 20 Jul 2025 05:16:49 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 05:16:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 00/17] drm/msm: Support for Inter Frame Power Collapse
 (IFPC) feature
Date: Sun, 20 Jul 2025 17:46:01 +0530
Message-Id: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAALefGgC/yXMQQ6CMBCF4as0s7aGtlgNVyEsaB10FtA6U4gJ4
 e42svxf8r4dBJlQoFM7MG4klJYa5qIgvsflhZqetcE2tjXWeE1TjlrWnBMX7cKjMf4e3M1ZqJf
 MONH3z/XD2YyftarlHCGMgjqmeabSqc1fq8ixheE4fr10bSiLAAAA
X-Change-ID: 20241216-ifpc-support-3b80167b3532
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=3475;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=6N5DisMgqH4uXAYM8uU6vWHlCUFyS+1n+wdiyhygzmo=;
 b=kRgDa+BqEIipkBf58lQ1Dd4n/f/NyyTp16tEOWBOPKbXKvSR/UnLPJgy27i/Or6gVCKfR+qeO
 Gze2zfEDKolCFYsATLkHgb0pS3r27Rvy36i70J6jC0C4Ql1hV1X+BA5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: uzWXb7yZ9uT-D2FePsJfrAw4ad7iSEJD
X-Proofpoint-ORIG-GUID: uzWXb7yZ9uT-D2FePsJfrAw4ad7iSEJD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfX2cvN6Yvc/C7L
 daWjruhFQJzo4nA/3ns7qaKt5Uz0nAnL9UibQK3y48KWiJEJPT4Hrzwg2cb+Sb1mJ9HhWsguuof
 kl9QgCJ0X+aW8/oGu1MJIq01uFaT6VqNNL9JHaOSwTR+x0I2qtAxvv3+ePR5kUJQ6F/xPPyKo8P
 oRUrisnS9MdyyCPinUtmJvm8lsN49tUbLG97IXrlXT4A295n0s3a+BgzLS+6Q37bZqJMzX6lutA
 QqOjLLlGkit/2yw0fIxE8lxO4w0c1BMQEGzwr23JgOdDY4lG/sEzcwmaPtBEcwxF1W8haPhuTyj
 mKWuNylP/ngTQ4IY83rkFjKxH8a76gJf8lpO7XyHp2nJalcQ6/opZfzNEVB0QvLcjG4eTJI1FB4
 bC8PBgRP9Ude5PuBPPd34nT1fHlMd0gLb9ch1MGypkNz+irfBy5SL1VcnGOJavWKXKdq6YO9
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687cde33 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8 a=sLhxGqmu1eV7p1u-_mQA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200117

This patch series introduces the IFPC feature to the DRM-MSM driver for
Adreno GPUs. IFPC enables GMU to quickly transition GPU into a low power
state when idle and quickly resume gpu to active state upon workload
submission, hence the name 'Inter Frame Power Collapse'. Since the KMD is
unaware of these transitions, it must perform a handshake with the
hardware (eg: fenced_write, OOB signaling etc) before accessing registers
in the GX power domain.

Initial patches address a few existing issues that were not exposed in the
absence of IFPC. With IFPC, msm_devfreq_idle becomes redundant and
therefore it is disabled for GPUs that support this feature. Additionally,
the DCVS tunings have been relaxed for GPUs with IFPC support to further
improve power savings.

This series also adds the necessary restore register list for X1-85 GPU
and enables IFPC support for it.

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (17):
      drm/msm: Update GMU register xml
      drm/msm: a6xx: Refactor a6xx_sptprac_enable()
      drm/msm: a6xx: Fix gx_is_on check for a7x family
      drm/msm/a6xx: Poll additional DRV status
      drm/msm/a6xx: Fix PDC sleep sequence
      drm/msm: Add an ftrace for gpu register access
      drm/msm/adreno: Add fenced regwrite support
      drm/msm/a6xx: Set Keep-alive votes to block IFPC
      drm/msm/a6xx: Switch to GMU AO counter
      drm/msm/a6xx: Poll AHB fence status in GPU IRQ handler
      drm/msm: Add support for IFPC
      drm/msm: Skip devfreq IDLE when possible
      drm/msm/a6xx: Fix hangcheck for IFPC
      drm/msm/adreno: Disable IFPC when sysprof is active
      drm/msm/a6xx: Make crashstate capture IFPC safe
      drm/msm/a6xx: Enable IFPC on Adreno X1-85
      drm/msm/adreno: Relax devfreq tunings

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c         |  67 ++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 107 ++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  11 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 203 ++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c       |  10 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c             |  33 +++-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c         |  40 +++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h           |   1 +
 drivers/gpu/drm/msm/msm_gpu.h                     |   9 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c             |  13 ++
 drivers/gpu/drm/msm/msm_gpu_trace.h               |  12 ++
 drivers/gpu/drm/msm/msm_submitqueue.c             |   4 +
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  11 ++
 14 files changed, 449 insertions(+), 75 deletions(-)
---
base-commit: 88bf743cabe5793d24f831ef8240a0bf90e5fd44
change-id: 20241216-ifpc-support-3b80167b3532

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


