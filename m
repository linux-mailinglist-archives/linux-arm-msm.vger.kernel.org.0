Return-Path: <linux-arm-msm+bounces-61456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF298ADB44F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 16:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6BC21881F79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 14:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4711E833D;
	Mon, 16 Jun 2025 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="noK6lW0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D4817A2F7
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085087; cv=none; b=QG0rNyuYemv0s/k+tRVe5OMcfJTNCX/Fpelb+imJH2i1upOcASvheohfWSnqnaaBGS0pNfqqQ7ZAkcUBdYQzFQsa5YMkVoimYqu6bUq4s00EZtI467/FRI9VvmOnC24A3d7ENWbQBidYBbqXtxAS5JdC6hiasGRtsPU8ME0bcCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085087; c=relaxed/simple;
	bh=kzkcNCFVZreEpTi+MDrsYk9dzhK0n7va0JV6nYSUZCM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=m8JdjQcr0m41oOvtL0HAFesjPCbb9UvMlfyd8RvRi1hACVnVN5uU8d0oPQyhYg2s1zp9n7X+ft+USuOpBqetol/F08RtD3DQftgfUPuzdH6OJpR4MRixm+aNa3GRCXhPxE27U04FKm9caSACexKYdk+Qu3txdIhBQtw0+3PCgdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=noK6lW0J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8Rc19025023
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 14:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:reply-to
	:subject:to; s=qcppdkim1; bh=OF+xq6A7Vha67Y6nxaav1VkwmNZVPUuwRDl
	u8Vsm1S0=; b=noK6lW0J5TctLLigmSZaskkWSpI3D1IpnexZQb3M0L/6J1D1JcS
	FRk39hw4bUkfZ1eZVUFLQOqrQqS8TczekM1fnrjDpiKskB0uIVspxSC9wIfJO/pr
	3VSjpGb6XJpcVr/sF1x8j/pbT3gtg7n5kG23CtWfT39Pk3CNtwh04Ww4meFpNw1Y
	EFhgN0Sj0q3maU9rYg8pCiiv5Rxbp82ZWIAimONy8sH3dTTLs/T996xQ4B1cq9E/
	lwpXqJF1peAYVtir93Y9Yk3H1zMYg2Qy1XJzc0JLXVXwIiRhKePeh8p9P1fya0Rq
	XvPVDCIHwHRMvCtQuaaG6XwXFZ1Y0+ZaIqA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f74wcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 14:44:44 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2e91916a983so955322fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750085084; x=1750689884;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OF+xq6A7Vha67Y6nxaav1VkwmNZVPUuwRDlu8Vsm1S0=;
        b=RQT3Ff0pTTtWHGfF4oQ4VFShDug9nE0QHMBvDVJ5L8l03w6xJmgWu9YtoJU7+D9JYI
         piVgomQt90Zm6hU20wEJvmyXhduUN9MrKX97MNmoH22roaLRpZ6DVWZvgR78wV2Qh9uq
         xqzeBHZ3nS6H3i8LnnGBlp/pUehoe4aCYYhfjzzXbz8//o/UvMRRmdbUk5Ssqspdiwud
         zNQgDjNoQMMRI+Il6BfsjCfjhOmm0Y7uzspiwx6eRir+3cUvO5iPWSpT/rUcQ2hY79lS
         dUZtPDR52OCYbDN/OQEC23kqaaJ/jAxyXkdiqpwPvxMxq+7VMS+n9HBMsf50q0GxPkND
         XctQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCFeYi4uAJIKTwSvm7NTQgTh60sj2fEaDc8b/SKIfqczhD58SFHcbDsjr+71mmubezjrVYGpyR5/FpITbv@vger.kernel.org
X-Gm-Message-State: AOJu0YylnG+CSHvF0MqlaJhhguZ68R56+GK9YPfJGGU71rkgEiaS0QT9
	jBSpwVF8k9UamQEaKXYJaPBkwPMKti+llb+peKtoFdPH8qeutCB4O//yjlq+Af9ojAtcFTOVEkI
	tF6VaWg2g9txLV0J8BoK36qExSorZ/GA2YT48gpECBotsPdxAzgYL9UsqxkwDxZ7Rf2Y+kEnSUw
	27b9I6RwOu0d82dH7wBHb6XSjrfDjl6Fx6jvh16qKyLCI=
X-Gm-Gg: ASbGncsdmTTaYrlJK+3ShqUDiNpI2lLk1txXUytauVnuLHXYi5Sn1ST7TYBFdLeZQbe
	JTF6V8AAaig3i4Mre2JdLuG7Xf+93MXGWp/S89QIs6XzwaopTFWhXLi0gun44Z1q8pl5xawmTg1
	NjL3GUZXFnXM+vdffn4pGkVlMEZQJxQdxG3/4=
X-Received: by 2002:a05:6870:1cc:b0:2e9:512:ee1a with SMTP id 586e51a60fabf-2eaf0835465mr5709587fac.4.1750085083832;
        Mon, 16 Jun 2025 07:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPyxd/ZCna+fivSUS1vT9j9EBiQJj04kCv6BQd+zEIl13TKyJNAt+sPYBirqLvu+a3UFqX+NCdq2I6N/FBSFg=
X-Received: by 2002:a05:6870:1cc:b0:2e9:512:ee1a with SMTP id
 586e51a60fabf-2eaf0835465mr5709578fac.4.1750085083424; Mon, 16 Jun 2025
 07:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 07:44:32 -0700
X-Gm-Features: AX0GCFvt5LG4Hp3T6ZAjQtUtoIr85DmoyodqDFDNkakh-GWvcoJA7D6CJENh8xI
Message-ID: <CACSVV03=OH74ip8O1xqb8RJWGyM4HFuUnWuR=p3zJR+-ko_AJA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-06-16 for v5.16-rc3
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <freedreno@lists.freedesktop.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5MyBTYWx0ZWRfX3WxB314gDLAJ
 X1txScmI0jLw/+W3w+XK06zZbV8SLI3YRAVbappuA3lY2uHCnGaANBHT9q3/NXob7BVb9JHtHfX
 xobjR0ZC0VwAuUslyNecvkP2VlVbXX2AElXgNYV8XxaUZynPYEDnawU2mYntj85hs4UolM9V6ci
 j/3p4Sn15nr+jmOOsPbrNc2S9YN9hdrrgcmZ7gwVPMwEiCF7r8/VAa3SQcdRLXjCYBtA4wdg/Cr
 8NLpCF5P3mqMDFxyqHT5JJdR6ZsZxg82UeQNYvFOdjoWPvC3Jyvq96WCg5wunM3r8hkANirZ9Us
 e5ttVyzBCLnuE1qBPp8fsURm4X/rKDxg4sVn7gJZQUuXp7srQGt/o/OHMlCyDDmJk/S6A8f92dH
 9GFqWpV7WzhqUVlRzs/nvvbL5jOuSXF1U8nsDGP7XU4ngJqKY/EWGtXNNpG3oat/DKIvs5i8
X-Proofpoint-GUID: B3DMgqQOeyKYSBydfmgX6Tm97xgqSEmU
X-Proofpoint-ORIG-GUID: B3DMgqQOeyKYSBydfmgX6Tm97xgqSEmU
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=68502ddc cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=Y02TM-CbU_CDVPOd8LEA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160093

Hi Dave, Simona,

Fixes for v6.16-rc3, as described below.

The following changes since commit ee11d953fd230b4e1c28388913826ca832ae8444:

  MAINTAINERS: .mailmap: update Rob Clark's email address (2025-06-04
13:26:41 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2025-06-16

for you to fetch changes up to d3deabe4c619875714b9a844b1a3d9752dbae1dd:

  drm/msm: Fix inverted WARN_ON() logic (2025-06-14 08:10:44 -0700)

----------------------------------------------------------------
Fixes for v6.16-rc3

Display:
- Fixed DP output on SDM845
- Fixed 10nm DSI PLL init

GPU:
- SUBMIT ioctl error path leak fixes
- drm half of stall-on-fault fixes.  Note there is a soft dependency,
  to get correct mmu fault devcoredumps, on arm-smmu changes which
  are not in this branch, but have already been merged by Linus.  So
  by the time Linus merges this, everything should be peachy.
- a7xx: Missing CP_RESET_CONTEXT_STATE
- Skip GPU component bind if GPU is not in the device table.

----------------------------------------------------------------
Connor Abbott (5):
      drm/msm: Don't use a worker to capture fault devcoredump
      drm/msm: Delete resume_translation()
      drm/msm: Temporarily disable stall-on-fault after a page fault
      drm/msm: Fix CP_RESET_CONTEXT_STATE bitfield names
      drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE

James A. MacInnes (2):
      drm/msm/dp: Disable wide bus support for SDM845
      drm/msm/disp: Correct porch timing for SDM845

Krzysztof Kozlowski (1):
      drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate

Rob Clark (6):
      drm/msm: Fix a fence leak in submit error path
      drm/msm: Fix another leak in the submit error path
      drm/msm: Rename add_components_mdp()
      drm/msm/adreno: Pass device_node to find_chipid()
      drm/msm/adreno: Check for recognized GPU before bind
      drm/msm: Fix inverted WARN_ON() logic

Ryan Eatmon (1):
      drivers: gpu: drm: msm: registers: improve reproducibility

 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c           |  5 --
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 18 ++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         | 39 ++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            | 54 +++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 ++++--
 drivers/gpu/drm/msm/dp/dp_display.c                |  7 ++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |  7 +++
 drivers/gpu/drm/msm/msm_debugfs.c                  | 32 +++++++++++++
 drivers/gpu/drm/msm/msm_drv.c                      | 10 ++--
 drivers/gpu/drm/msm/msm_drv.h                      | 23 +++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c               | 17 ++++++-
 drivers/gpu/drm/msm/msm_gpu.c                      | 20 ++++----
 drivers/gpu/drm/msm/msm_gpu.h                      |  9 ++--
 drivers/gpu/drm/msm/msm_iommu.c                    | 12 ++---
 drivers/gpu/drm/msm/msm_mmu.h                      |  2 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  3 +-
 drivers/gpu/drm/msm/registers/gen_header.py        |  8 ++--
 19 files changed, 217 insertions(+), 67 deletions(-)

