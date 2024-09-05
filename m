Return-Path: <linux-arm-msm+bounces-30953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE93196DC66
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F29261C20A54
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F7543169;
	Thu,  5 Sep 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSC/P0rz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5D71AAD7;
	Thu,  5 Sep 2024 14:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547889; cv=none; b=lctkDLju72ZnchQY9D/S3C3WeiNvMmpcXBvpXMmEIkChoOIra7R/Gky360aEiO8VftMBom7ER62QqS5IbJDO8ijKJYGF2OyFUmGnowYmEAi8LmDIbQe5VLu70+HiC9ZoPcOWIl0i0bUOfMBAdTHOyQttc84/8T50YD67xoMj+wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547889; c=relaxed/simple;
	bh=0370zKmzY2AWzHv1mdoNPa7o5cPmRzdjitFQ21GHXIc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qPNC6eLguz4KPaSlwmJw7qplvVH0xzY6a+txi8Jf/yXWF/JgpPDjuUnzAZFOLEKpfwjk8HehEpt1Vw1BX6tgLdeWJp7Wv78YVYG/x0LTtIvl67XOtol0xoT6ZrLmcm1s5iLGEkpCooERxqLWGJDW+CSjuASXgDA5zkGyfw9AwC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSC/P0rz; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5bf01bdaff0so994498a12.3;
        Thu, 05 Sep 2024 07:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725547886; x=1726152686; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=khBp+7bVE0pRYL+IURNeyyKfZwQKei0LfxEqGUBU3As=;
        b=SSC/P0rzAoylA/LA2c8EmRcc4uBVeAN0kegjjPbMpYBkxyWhbwQo/B66tcoakC5oMp
         jogLY7eB9pY9dDKVqxnwDku07zaNzyBHONvLF3wM7c9HsrugeRh/E2bXu8pOSkPDaCIJ
         CHaTs85njPJkNUPx0HeUKO/Izf9HbUL1HHLHOl/2Ko/OqwX95On5y/XdEN9bDkLigm84
         mrXdQw+wmSqt4/LhiDflCZ37P/rzgV2ApU3aAA1A0DLh70WxCQZMvLzbzREWIVfcMdwW
         0b7KWe1bH17xtwzqi4GBps7bUbyTNsXCr6hT4gTlOqGz58e0/ROFCiu9kb4DEpS7BP4N
         tNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725547886; x=1726152686;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khBp+7bVE0pRYL+IURNeyyKfZwQKei0LfxEqGUBU3As=;
        b=TR7nSNqRqtI688PAOV9Dxbgi8ysIPxaY7a26y1+JzhbB2Ano9vi8f5N12Za8hok+S8
         uEIgSTrhLdUmFY0/f2yX1uQ9NOOWpH6kch0LwUMTHKOhb1jURLpXGk3SThG6GJEmt338
         BI4NiMEfmQk8NH9pL67fZ1wxENfKn9PUfSL52msbgFKEopSGGaT9VPRfPsU25to5wMrM
         wACSM9ZkiB8xyh0uYvnr8+AKn7zQbcOMkizpqK98rWI9ae9X9Y7X9YRPqRzsO8F4oIVA
         0WvK1sG0aKsQ625xb0DUcgrkXNhuMLQm01kIPFWKFVAaprdTq6D38JywaTvdI0IzDqTH
         2d0g==
X-Forwarded-Encrypted: i=1; AJvYcCUG6ld5CVhvdkWYoM4guIon1NU2lpkul6N2F4/am3rK+RS55V3NtoBD3Pxa+g+gGPtorHHDSGng1KcjR54R@vger.kernel.org, AJvYcCXBCHLqPQ/0WZ9/isNprkgfIYNF0tKBWlkM/K5u3MqfBqsS9J45AUqL3dNCCUQbGocjGJN1ycYvilA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDT2LUcLPSFwpUYOy9K79EU1EpWDsjSfBi0AZllK/vooKqryIT
	I5eDZnzpOwtvxGLx82k6s2oijXxeQgVwnRg5G4p+vl7kW4o9KRK/
X-Google-Smtp-Source: AGHT+IFmlJ+ocz+T/WgmYTqPNQl/xNecdLVUrUif/9DJxq37qVefgp0MMq8SLucOpU0+y5Dvnw0LKQ==
X-Received: by 2002:a05:6402:848:b0:5c0:b33d:5fcc with SMTP id 4fb4d7f45d1cf-5c21ed52b2amr20478966a12.20.1725547884673;
        Thu, 05 Sep 2024 07:51:24 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it. [87.16.167.153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:51:24 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Subject: [PATCH v3 00/10] Preemption support for A7XX
Date: Thu, 05 Sep 2024 16:51:18 +0200
Message-Id: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGbF2WYC/33NTQ6DIBAF4KsY1p0GARW76j2aLhBGnaT+BAxpY
 7x70ZWLpss3ee+blQX0hIHdspV5jBRoGlOQl4zZ3owdArmUmeBCcZ0XMHvEYV5SDUxVcFigtYi
 10Uo1smZplxotvQ/z8Uy5p7BM/nO8iPl+/afFHDhUjTOitFJxWd27wdDraqeB7VoUJ0HyX4JIg
 i4NonHCOs3PwrZtX3ik/nn0AAAA
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
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=4165;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=0370zKmzY2AWzHv1mdoNPa7o5cPmRzdjitFQ21GHXIc=;
 b=mCl24BQ75phDXeT/B5kU0POxdwZ7HTJ42T58Nh/mIbwJGbUETSfM0cs6ORunMLC0gHfH3LAvQ
 ehiWRn83Kv+De33cw9aPnQ0ULw34nC1xKtqkWAePe81KAz7CSvkG2dQ
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
Antonino Maniscalco (10):
      drm/msm: Fix bv_fence being used as bv_rptr
      drm/msm: Add a `preempt_record_size` field
      drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
      drm/msm/A6xx: Implement preemption for A7XX targets
      drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
      drm/msm/A6xx: Use posamble to reset counters on preemption
      drm/msm/A6xx: Add traces for preemption
      drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
      drm/msm/A6xx: Enable preemption for A750
      Documentation: document adreno preemption

 Documentation/gpu/msm-preemption.rst               |  98 +++++
 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 331 +++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 166 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 430 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   4 +
 drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   8 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
 include/uapi/drm/msm_drm.h                         |   5 +-
 14 files changed, 1094 insertions(+), 42 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240815-preemption-a750-t-fcee9a844b39

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


