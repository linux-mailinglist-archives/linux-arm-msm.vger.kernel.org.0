Return-Path: <linux-arm-msm+bounces-30263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFC59665A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 877D2B23487
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 15:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA431B8E82;
	Fri, 30 Aug 2024 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+D+JTSh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1428F1B86CF;
	Fri, 30 Aug 2024 15:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725031997; cv=none; b=kSkSJu7eWIbcL1w79fvwYkrJaSfXholUet+GiEP31OTwQ6peawNcvA0uBT59uVIQCwq62qDfIAobpo99jDG0lDH2Me1Ct/tv3lWoWKuPIwDF/ZyqeC8jqckceD4kBUcZx0xofy7K+7lo+x9YOY0HDtCKo9mBedENJQq8SpbVosg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725031997; c=relaxed/simple;
	bh=+/XloqlmCsquY7kMKECVJCoaSk/Is6TefQiw2Wa+1Fk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rgKetLt3GP1rva5lbRIYQDnUlk/79wMrQy5uEEojqdNqCzJUzOCCkvBZMbS6r+CrgOyMqAU7wXShWj4e6t1pAr9Roxen/8LcbwxdbMc+s3pmpEepBW8t/kXCRLkHfPqoqeFNSgqt9AqSId4EE/aPt6qp534MH6gGlWSYvFC4Aws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+D+JTSh; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8695cc91c8so192722966b.3;
        Fri, 30 Aug 2024 08:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725031994; x=1725636794; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R1ZBcIcsd4bEjsD7xcbVzlCNWsKtjr2ojpG3+aHZkdM=;
        b=f+D+JTShkCsE0w+2OZLrH91O92MIke0vlo/5ePcOmXhjnRUB2EHAF8SWDS8mJ17zT2
         aib0DgvvJ4rml3PcgjZ0xD2o5hmwQxmLOcks7rMgArMC1ai3T0AaNScEH8u+GyZxTkyu
         X0qIEI7TD39QY/0jDrYXTqC14QCy/PRMdxfAkimWfYYBThcVyMM6Ia8xaiaX1DV8m1j0
         WbO40UEjN/Pbd9Lr7/Xn6kb6Z1Os+1BFMPqQNz5L03Petw2E5bZ9hE+z9lSnOEwHHN12
         rV+OoJuRxwzVe1SjZi02R7+IFdHYDn+rCSh4BsP84Y27dBKNZ8BtHxcBZV8rkdBKiZpo
         Moyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725031994; x=1725636794;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1ZBcIcsd4bEjsD7xcbVzlCNWsKtjr2ojpG3+aHZkdM=;
        b=cxGr3sbKlFXH7bCTk+j15SbSY8QC+iig7/9Q3Ysah3GOV1dRFRwb30vjcBMPsZVzui
         nFuWAMBdyMqSdT7VLJnuSedTResFGijn1AF7+h2hMxRmicksDsL2T2WAm8KL8gIBWymo
         68vMn0CcRSUX/nt253BRxgkwYN3LIrg1M31NiWEqq2VejhurC/k2OqXu4ICnLWPqYXtT
         rV2P5gM10xHFm7bF3kt3NEe+OJDCT5SUJ5jIAVHw2DYnFtRPU42Bc3xcXxqHIvwT3bHA
         61mcum9Z+4TUU5Yquyg2RdwB29guFQygB6+xEisLP9wGYntCxFk7rtb7pKzvLFGxe/xg
         6QIw==
X-Forwarded-Encrypted: i=1; AJvYcCWkVIizj2g+pE8aHmLruumNTYbhogFHg0mMakkB0FS4e553dUZT7hsP9d3aORORXO9QIMxJqENruQZ/2p8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOikHPgZhlAH2TwMy+A7qARxylpN0GPJ6t2qlG5w+tkIt1xutL
	TqQRuMFFDxNAKPmNYAtn8Lb9VbI03SJz6ViNMC1CnRIpDLRGujJRaUuxqEVu
X-Google-Smtp-Source: AGHT+IGr2l5cXWMITLg/oTe7o7MpKjteV67FsCYxIox8G4FTimM1Iyjbl6EHRnVPBUhpI84sgaosgQ==
X-Received: by 2002:a17:907:7e94:b0:a7a:a3f7:389e with SMTP id a640c23a62f3a-a897f78daccmr600062466b.6.1725031993536;
        Fri, 30 Aug 2024 08:33:13 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it. [95.234.170.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:33:13 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Subject: [PATCH v2 0/9] Preemption support for A7XX
Date: Fri, 30 Aug 2024 17:32:42 +0200
Message-Id: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABrm0WYC/32NTQ6CMBCFr0Jm7Zj+YcGV9zAsShlgEqGkJURDu
 LuVA7j8Xt773g6JIlOCe7FDpI0ThzmDuhTgRzcPhNxlBiWUEZUscYlE07LmGjpbClyx90S1q4x
 pdQ15lxs9v0/ns8k8clpD/JwXm/yl/2ybRIG27Zy6eW2Eto9hcvy6+jBBcxzHF0f9E6eyAAAA
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sharat Masetty <smasetty@codeaurora.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=2848;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=+/XloqlmCsquY7kMKECVJCoaSk/Is6TefQiw2Wa+1Fk=;
 b=w9oRe0fzxNWwC/eWWHvVBB6Yv22prxU4QaZz5P1TKaHgZzw762E/J40AjyHtsIWM/tFdIDRSd
 WSpN0PDPkx+AJrp9LYIholowKlxQ+RYnQci5ekgBaJcBY18hAAjWn4T
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

This series implements preemption for A7XX targets, which allows the GPU to
switch to an higher priority ring when work is pushed to it, reducing latency
for high priority submissions.

This series enables L1 preemption with skip_save_restore which requires
the following userspace patches to function:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544

A flag is added to `msm_submitqueue_create` to only allow submissions
from compatible userspace to be preempted, therefore maintaining
compatibility.

Some commits from this series are based on a previous series to enable
preemption on A6XX targets:

https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
Changes in v2:
- Added preept_record_size for X185 in PATCH 3/7
- Added patches to reset perf counters
- Dropped unused defines
- Dropped unused variable (fixes warning)
- Only enable preemption on a750
- Reject MSM_SUBMITQUEUE_ALLOW_PREEMPT for unsupported targets
- Added Akhil's Reviewed-By tags to patches 1/9,2/9,3/9
- Added Neil's Tested-By tags
- Added explanation for UAPI changes in commit message
- Link to v1: https://lore.kernel.org/r/20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com

---
Antonino Maniscalco (9):
      drm/msm: Fix bv_fence being used as bv_rptr
      drm/msm: Add submitqueue setup and close
      drm/msm: Add a `preempt_record_size` field
      drm/msm/A6xx: Implement preemption for A7XX targets
      drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
      drm/msm/A6xx: Use posamble to reset counters on preemption
      drm/msm/A6xx: Add traces for preemption
      drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
      drm/msm/A6xx: Enable preemption for A750

 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 353 +++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 462 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   8 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   7 +
 drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   8 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |  13 +
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
 include/uapi/drm/msm_drm.h                         |   5 +-
 12 files changed, 1062 insertions(+), 40 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240815-preemption-a750-t-fcee9a844b39

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


