Return-Path: <linux-arm-msm+bounces-86671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37911CDEFAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 21:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41DB23002D4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 20:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B80378F20;
	Fri, 26 Dec 2025 20:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUomsBWz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X816Us2d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C080EF4F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 20:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766781092; cv=none; b=rd/yV76UQBfzReukbitT6QMFbHtQY83qru6dOFXbkgeN/miKsF9C5Y9vrhxUnOZfJA6T9XY10Ek6+xFSdt5GmBOhB8YLPy9CJISNxasdzryOyWmkff7ZPrRlzazfILBuOtVXJyH7foPMLEQ5M6E152EBrLXvXOZeJ2r5j88lFHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766781092; c=relaxed/simple;
	bh=XK+73B4VsytvApJdUBRz4B5p3NWgnD8/OragGJ91v68=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=p6+yGO2hGGpo34iaNBhKy3DTg2kKBWmQB3MAyV+/20WSO4jC5y35/1xGmaTr/8Cx8AB6FsZnxBh70YH7hcvlCzpTE7rNer4loCmDRsjaxU51B4mWKKEPlK6tDo7e4ihy/TFBnYFdv7kiupMMcup2jRJU4ZAVAF4hnW5OCV5xX5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUomsBWz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X816Us2d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8banf2454348
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 20:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:reply-to
	:subject:to; s=qcppdkim1; bh=4AWFGr6gKgFJOCoEJs5vWAtnJQDYSY770au
	cV1GG3lI=; b=jUomsBWz1a7lun/xLvJmSeJJ4Rs8Zs247O9AxmDh4CN+2wNWwJP
	Fq83H+9ZNZwYgN0tjuQzNY9Xv7EX/KUg4fRNAGeZPym2W4wWAZB+BWRDmeQufBBM
	MQu8F8/e4kA4I/YStRMwWxCyDZji5o2BO63FGHt6TSHfHgjMEyOhDemVDRh3wmp+
	RzxxIhGzkFwCvRpf398xNvuaOjPkmRFSF0s0h8jionEgYvR6TS/irYVZMsaMVH1N
	EjcCovMxDq4QiGxb8V/c4F0lPrFK7ejmZNzCMyfeecg5dbbyBjQlIilBnzf0UdpK
	auYFiFAE+X+YZek+JqfvGO1gZP3S2TgkCcA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8hwe50ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 20:31:29 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-451064d84edso11445607b6e.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 12:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766781089; x=1767385889; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AWFGr6gKgFJOCoEJs5vWAtnJQDYSY770aucV1GG3lI=;
        b=X816Us2dISqVksQpPzjvp2YyqYodZI8Ny3q6+HQaKws4I+SkDfOPtDYUvM1069ao3p
         lxlCZQ5Hll3cl2S7maRJDeT2JQ+wavq2aP0jrOmuR5dBqK0+WNR8/u7wLzWVXAybqd9a
         WX/WmlnPofizqHYq6HySOKgyvAvl/YSyNRP2YgiidypTElnXbRIddiALaaldYFoNvL1z
         BHG4rg2upRZ9GJFvyHtVEoSYGjvFSzhVqd3ogeM+38bT427LgaU2Bhn+j2qazhm9XOEP
         gXifoYA1YOUuZZ7NS9YP57Ct2vxVpg0vN9xr9IH1yHs4THQIm7Rd37y4EsfWvlNJEmnk
         I8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766781089; x=1767385889;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4AWFGr6gKgFJOCoEJs5vWAtnJQDYSY770aucV1GG3lI=;
        b=qRuMhdMBEjkLLw6tUe7WRTmi3imQL0xS5Y+bDbPL7tykNwzyrqC9IwrtPwzvtjKrL6
         Ld3xr45Fu2xNJ7IGtbdKO+eW3P2PuQ9lMgTQQ2d/GyNtHYHOWS/MF4ChojkgHW6516wv
         csyhjS6gbCkyWczgs/xbMzUwjUW5GAfaSyCRJcJ6Ujh+aOPWg44RXZg9aXAZLPKh2YM0
         rpSlgHOVpCkUXYPeSG5coxiOWZS0ri3ME+K7atuz8Y8YrYFHZABXuUt9vVlF5BbthzUo
         7mASLTKUY6GcvQjLhfmyC1WtZ5gFXUzR4w6429KGHW5P3FgNHIw2mbAmMTa9UzlRMrK5
         aRMA==
X-Forwarded-Encrypted: i=1; AJvYcCUP3WKEkyy723Pt3Sylf6iAdeFPRpPHmTiRw6qdwVxGMRKq0qIx4E6OlQXueR2fPQ81SN5B6JRMts5Pl5ON@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/zQUeBQZmX/LTwkoFIbYtj8U7euL7EQkBvEuN9h+xKSCvExej
	ZEYIO/YJKArCTJMdLNZtYGF+FMH/oZI/kPlK+LUeoNoNmiTfZyJwqg19eXbTK/jqDioQeQX8gTp
	y97uC9v5JnJ4dRbOJv5RyoLEgLYm+XQHhDag4jZ5OcMWkbs9vUxFnc7TLT+wESSN/xdHQDUZ5ua
	6/M4gYKAjncQUZT9pW0Bq/bNz8K96dZi3phzP0Y9VOFzGf9dd/a9z6Jg==
X-Gm-Gg: AY/fxX47+GIE3iuhNRDvG7tIyl7f9hJPPAl5qwZBTFUZzC92WJKKRQ8ty5AqzTszNRt
	JInZTQ8G/D8hEl93jSkUZmhJc5EvG/JZKak9p24/cF5wLdiGHXCAQjpKaIl4GkLkc7A4CKpzXjC
	AkZC1cWpajrS1AcT1rdl+ys0Nl1Vwrcv3YfhitRGWuAbvtQ+Ju+iNQSVzrAX+6ldmG
X-Received: by 2002:a05:6808:19a6:b0:453:587c:8362 with SMTP id 5614622812f47-457b1e54e1cmr11529675b6e.11.1766781088852;
        Fri, 26 Dec 2025 12:31:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEt7xfrwX20cCFFg3FDxCd51j0HkcEkdYfmiFLcWeH07u/31Q+rg4EarGgy8D/a52+vYGqLVgLGTGZJ31p+XjE=
X-Received: by 2002:a05:6808:19a6:b0:453:587c:8362 with SMTP id
 5614622812f47-457b1e54e1cmr11529661b6e.11.1766781088366; Fri, 26 Dec 2025
 12:31:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 12:31:17 -0800
X-Gm-Features: AQt7F2rqIupn1E477TC3v5dx2uwAYIb5qZfLBCMyoyzxki1MVu_wt-kWfn9qFjA
Message-ID: <CACSVV01jcLLChsFtmqc4VDNoQ2ic2q+d86n3wdoSUdmW6xaSdQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-12-26 for v6.19-rc3
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <freedreno@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE5MyBTYWx0ZWRfX1fondcyOdZEl
 LiTxtdcMF1DHRIbDgdAQqnS+kkasPhIjezZF4mPXwugJfcARWP2wd2b0y7x6GzGUkJ1Ad/Q2Qsl
 4gp4/M4yYvsfiK7/fXkrKAX59BQ7zJCoSikRaKkJCEdBUQgMWfI7fFfPP4N4RVD9gLUiJuQ3n6E
 HpGNL4UxbKLN5BWme5nLLHBmOhtg16LxV8Yp0yUgJ9iv6tDCivaxwyU2An17C+TbHjqzv1E3tC0
 tsL3fHV6lH8cQ7S0I0tu+0KCnAs+SiNj0Qt6sXdwd8pkixavFwDCVS5qMRkVtg5pB+r6K7R686U
 4XsXa4daGUefPdYdXVK+r4fKAtrcgpf8p40iJR2dY40fn0wOrdAnFAHVYsYvfSk2s6bzsh6oSEf
 nv79xMgdY8O8BytZX89NYax/f005qlRIVcXIQevMzpWEVqhJor7VQczu0QUi2AFwDRz939vB6i/
 wTFfBBUjwC2ZPfc7saw==
X-Proofpoint-GUID: VaUxBaZXSD9PqN4hQdBkMe-7ktg8QtP6
X-Proofpoint-ORIG-GUID: VaUxBaZXSD9PqN4hQdBkMe-7ktg8QtP6
X-Authority-Analysis: v=2.4 cv=P9c3RyAu c=1 sm=1 tr=0 ts=694ef0a1 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8
 a=esN6lJarwAe2O1dyRFQA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260193

Hi Dave, Simona,

Fixes for v6.19-rc3

The following changes since commit 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530:

  dt-bindings: display/msm/gmu: Add Adreno X2-85 GMU (2025-11-18 09:04:13 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2025-12-26

for you to fetch changes up to 66691e272e40c91305f1704695e0cb340cd162ff:

  drm/msm: Replace unsafe snprintf usage with scnprintf (2025-12-24
17:55:29 +0200)

----------------------------------------------------------------
Fixes for v6.19:

GPU:
- Fix crash on a7xx GPUs not supporting IFPC
- Fix perfcntr use with IFPC
- Concurrent binning fix

DPU:
- Fixed DSC and SSPP fetching issues
- Switched to scnprint instead of snprintf
- Added missing NULL checks in pingpong code

Also documentation fixes.

----------------------------------------------------------------
Abel Vesa (2):
      Revert "drm/msm/dpu: support plane splitting in quad-pipe case"
      Revert "drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case"

Alok Tiwari (1):
      drm/msm/a6xx: move preempt_prepare_postamble after error check

Anna Maniscalco (2):
      drm/msm: add PERFCTR_CNTL to ifpc_reglist
      drm/msm: Fix a7xx per pipe register programming

Evan Lambert (1):
      drm/msm: Replace unsafe snprintf usage with scnprintf

Neil Armstrong (1):
      drm/msm: adreno: fix deferencing ifpc_reglist when not declared

Nikolay Kuratov (1):
      drm/msm/dpu: Add missing NULL pointer check for pingpong interface

Randy Dunlap (19):
      drm/msm/disp: mdp_format: fix all kernel-doc warnings
      drm/msm/dp: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
      drm/msm: msm_fence.h: fix all kernel-doc warnings
      drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
      drm/msm: msm_gpu.h: fix all kernel-doc warnings
      drm/msm: msm_iommu.c: fix all kernel-doc warnings

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  13 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  52 ++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  13 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  38 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  29 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  84 ++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h         |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  20 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |  23 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |  20 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  47 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |  21 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |  16 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 137 ++++++---------------
 drivers/gpu/drm/msm/disp/mdp_format.h              |   6 +-
 drivers/gpu/drm/msm/dp/dp_debug.h                  |   2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   1 +
 drivers/gpu/drm/msm/dp/dp_link.h                   |   9 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   8 +-
 drivers/gpu/drm/msm/msm_fence.h                    |  36 +++---
 drivers/gpu/drm/msm/msm_gem_vma.c                  |   5 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  68 +++-------
 drivers/gpu/drm/msm/msm_iommu.c                    |   4 +-
 drivers/gpu/drm/msm/msm_perf.c                     |  10 +-
 36 files changed, 347 insertions(+), 372 deletions(-)

