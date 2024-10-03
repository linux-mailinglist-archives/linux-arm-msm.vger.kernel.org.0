Return-Path: <linux-arm-msm+bounces-33027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3515E98F3BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF16D1F21F06
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B221A7062;
	Thu,  3 Oct 2024 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSVJdDpW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172FE1A704D;
	Thu,  3 Oct 2024 16:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971980; cv=none; b=ONCTIcVtQlqTqXh0IK7+LU878HnMv0E6/vDneZP20irv06f45UPnlkak3s8FWdNqJ5FJS+n4OPdPLgX2wLSn/HYHhssr66SSoJ0hePBgBYrxunIbGWm24fwnp1IRwy5hFYTRbxGlNs69ehDPkAEJ6rZtkW0rldP2Q+yVFZaQMdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971980; c=relaxed/simple;
	bh=rkp7RZ94GbN8pEuZecJnFPn4wVK/JYzqYxT1p88HKmw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gewjtcF3EgomEgUUPQBkf/dCAU1tXlzE7J7z9LpdgDHbDtmKKenFV4FuaVVYYNDpXMcR+MMzKeLrKhvWfGMUn+qKMGUpJz/7uexfuOym/5xLmzWAkkFe0e3cuvGAU6+74SVNCIIab/f6RcG4OrzrOhzcsfNc2Cq4sVXxD7/72no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSVJdDpW; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a86e9db75b9so176442666b.1;
        Thu, 03 Oct 2024 09:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727971977; x=1728576777; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lpeWjYXsrE4ZMwk6NM8ToxrdkcEn2cV2v/O/0qLRmyk=;
        b=DSVJdDpWdYihLz73GqL2n/joFtZ8HkEzUDkv9Z/57pVd9DtVDBWL0anXmtvdSaSj/o
         Lk1HO0huWBoQR7l03FgU7GWN3Mhby2e6yrQq2I4H9dxEtErBMjU1DAj0qXm4y3R5FVeS
         NTskexc9dHJDO7xLp/ypZPXiymVGy3/hFpSRldNbIAOWhafqvVFb4PMWmJtfKHmogfo5
         3CbuGYTb+2f7dJqDoG2QqQ2znSyicpWpv5KQY3s9Axp13eLv6Uw6rcBL5yTSqAvKq8zm
         q3ImmW+nrrbOQUNRx9RXBIN9oYrfNj841xH+Ah4A+j0o0OvxpkxuEyhFPDbahUOjX9pL
         inyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971977; x=1728576777;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpeWjYXsrE4ZMwk6NM8ToxrdkcEn2cV2v/O/0qLRmyk=;
        b=LINyUJT812HycokNssILubT+YA16OhdrY6wMEQpMbJYmoxtLxoWY/drrrYsMKzfDCz
         AiEmyDcMtqf5l1QR8/stQPGJbaKmmqX3Zw51P0kqyGm1WXr/uysdecsQvJicOwvo5E+6
         fFmAoQg/Nzjg7l+/6VoDQo1UE+kI1fs2RTnUSVOPINcr5elSrv0CCOgzx/uTXIVD1IUv
         8ZIz8sNBB+Zkwo3O2sEpePkBNfx+3x6/F763LQO8lkh6DecFYlnwn2S6M24v1kZKUqwF
         v0sZAJufYQ00OQSdNnYGz50+lR0HQYSu2d2oEYbmh62njAryojA2WKZLJvARYgItePfc
         8ftg==
X-Forwarded-Encrypted: i=1; AJvYcCU1Px9yFfIaeuZzXT5fRdWaYcI91Mjc88ZTbcJVbTdprtLWJnip3WRjNEsNWQVZTROLiFpklDWQ/y8=@vger.kernel.org, AJvYcCVJt5j03WAvhAGi/pTaZWdDkMcMLm5xgtlDf/IUJCNAS/KzOY/44Uq1gEPoFA+rPO3XgBkLp/+hj58P41I1@vger.kernel.org
X-Gm-Message-State: AOJu0YzDcoDZF9Ik3Cl1AZw9u9Z8yUBew9kOo4W/MPonxwGPuZePfEmE
	8y0FTESA8pOedIdJjXaHZKv+LPGBfHQX2lBcHO28rvb1pobqXB3B
X-Google-Smtp-Source: AGHT+IH63OWRK6OqdMqx/AZ7QzH3uPE/mpjI7459Kq2yzE6mImLT+aHputdeHkan1Do6z15rHgQvPw==
X-Received: by 2002:a17:907:7e94:b0:a8b:6ee7:ba1e with SMTP id a640c23a62f3a-a98f83873d3mr636587366b.60.1727971977010;
        Thu, 03 Oct 2024 09:12:57 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it. [79.12.161.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 09:12:56 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Subject: [PATCH v8 00/12] Preemption support for A7XX
Date: Thu, 03 Oct 2024 18:12:49 +0200
Message-Id: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAILC/mYC/33QTW7DIBAF4KtErEs1wPDXVe9RdYFhSJDqOLItq
 1Xku5d4U+RYXT40fDN6dzbRWGhib6c7G2kpUxmuNbiXE4uXcD0TL6lmJkEiOKH5bSTqb3Md48F
 q4DPPkcgHh9gpz+q/OpHL92Z+fNZ8KdM8jD/bikU8Xv/TFsGB2y4FaaJCUPb93Ify9RqHnj20R
 TaCgiNBVsGZQBSSjMnBXlB/gofDG1QVcvJojffZdnEvYCMIeyRgFbxO6EBIgvAk6EaQeCToKkB
 HsstOROGeejCtYI4EszVpSFBWBl3eC7YRjpu0VUDrQEUbdDDYCuu6/gJPwLNMPgIAAA==
X-Change-ID: 20240815-preemption-a750-t-fcee9a844b39
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sharat Masetty <smasetty@codeaurora.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=6265;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=rkp7RZ94GbN8pEuZecJnFPn4wVK/JYzqYxT1p88HKmw=;
 b=aFlFHevyD+QE1so4ObJaxnEoxJsHXL440+3PXsAztqmYAwRp22wnI+HJyQ+dsw6nAMorSoMZX
 BEOV8lKUSarBLaF+9afDm74tQakeQDUqJYM92ZaqhE9PX3p+yiJTJ6v
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

Preemption is currently only enabled by default on A750, it can be
enabled on other targets through the `enable_preemption` module
parameter. This is because more testing is required on other targets.

For testing on other HW it is sufficient to set that parameter to a
value of 1, then using the branch of mesa linked above, `TU_DEBUG=hiprio`
allows to run any application as high priority therefore preempting
submissions from other applications.

The `msm_gpu_preemption_trigger` and `msm_gpu_preemption_irq` traces
added in this series can be used to observe preemption's behavior as
well as measuring preemption latency.

Some commits from this series are based on a previous series to enable
preemption on A6XX targets:

https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
Changes in v8:
- Updated commit message on 11/12 to reflect the fact that we are
  enabling on more targets
- Fixed typo in documentation
- Link to v7: https://lore.kernel.org/r/20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com

Changes in v7:
- Enable preemption on more targets
- Move pwrup reglist to a6xx_catalog and get rid of ifpc list
- Split out smmu_info from preemption record in separate GPU_RO
  allocation
- Make postmable buffer GPU_RO
- Link to v6: https://lore.kernel.org/r/20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com

Changes in v6:
- Fixed commit message prefix (A6XX->a6xx)
- Allow preemption to be disabled at run time
- Link to v5: https://lore.kernel.org/r/20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com

Changes in v5:
- Made preemption documentation more detailed
- Added ring ID to preempt_record BO name
- Added Neil's Tested-By tags
- Added Akhil's Reviewed-By tags
- Added Rob's Tested-By tags
- Moved preemption module params to adreno_device.c
- Link to v4: https://lore.kernel.org/r/20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com

Changes in v4:
- Added missing register in pwrup list 
- Removed and rearrange barriers
- Renamed `skip_inline_wptr` to `restore_wptr`
- Track ctx seqno per ring
- Removed secure preempt context
- NOP out postamble to disable it instantly
- Only emit pwrup reglist once
- Document bv_rptr_addr
- Removed unused A6XX_PREEMPT_USER_RECORD_SIZE
- Set name on preempt record buffer
- Link to v3: https://lore.kernel.org/r/20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com

Changes in v3:
- Added documentation about preemption
- Use quirks to determine which target supports preemption
- Add a module parameter to force disabling or enabling preemption
- Clear postamble when profiling
- Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
- Make preemption records MAP_PRIV
- Removed user ctx record (NON_PRIV) and patch 2/9 as it's not needed
  anymore
- Link to v2: https://lore.kernel.org/r/20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com

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
Antonino Maniscalco (12):
      drm/msm: Fix bv_fence being used as bv_rptr
      drm/msm/a6xx: Track current_ctx_seqno per ring
      drm/msm: Add a `preempt_record_size` field
      drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
      drm/msm/a6xx: Add a pwrup_list field to a6xx_info
      drm/msm/a6xx: Implement preemption for a7xx targets
      drm/msm/a6xx: Sync relevant adreno_pm4.xml changes
      drm/msm/a6xx: Use posamble to reset counters on preemption
      drm/msm/a6xx: Add traces for preemption
      drm/msm/a6xx: Add a flag to allow preemption to submitqueue_create
      drm/msm/a6xx: Enable preemption for tested a7xx targets
      Documentation: document adreno preemption

 Documentation/gpu/msm-preemption.rst               |  99 +++++
 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  42 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 235 ++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 170 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 457 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  22 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
 drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |   7 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
 include/uapi/drm/msm_drm.h                         |   5 +-
 20 files changed, 1090 insertions(+), 69 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240815-preemption-a750-t-fcee9a844b39

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


