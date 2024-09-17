Return-Path: <linux-arm-msm+bounces-31902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C8B97AF52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 13:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24B0C281996
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 11:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B34716193C;
	Tue, 17 Sep 2024 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NG98e+nE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216AC14BFA3;
	Tue, 17 Sep 2024 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726571658; cv=none; b=feLIuFOpa0i3r2tLKmUsIjJqSH9M2D+Q/n5et5OZcs4VEqvTgAgOwA2Crz5AsOlpfn0hT2Phl40dAhiLFUsRAyz4rom2CbnXwksggn5jC79Ir3B6Il0tNqyWNdCxzuAwIUzCgpojv7XkpIElQysVyZOUX1sYv8yVyqW8ROMR7tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726571658; c=relaxed/simple;
	bh=p43bASK1vfwUMiWcV6qCQue61/vpDXfDQ0kldeq7A80=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qklIWa73yuKtAcZIXJV82+c3P6rKNZH25yHAukKX4Kg1KN1QfGXnuSGV9hmQ2b0V39V4CFXDquhCvehNDre0Q3FJ+M9mnAjoSKDeEdvEtZaPaO5ZO9ee4JmNCjJ1OKgzEtTMa4w3ZLPGt7waqCZ4ZmZ/B9v3UHlFw7oW2HVnt/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NG98e+nE; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8ce5db8668so955376566b.1;
        Tue, 17 Sep 2024 04:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726571655; x=1727176455; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UayKS1Ryd/2ZU19LR8Ae6STsmhjtxW8blequ0WcRifc=;
        b=NG98e+nE/394kSHocrspPoR3B/Jz3d5NkNSwaem9FHiW5WVZ4SDxAILSDwKOlwy1oP
         XHih9A+eytefI2Nvtr+Ye475+AFA7Ldq7SW91NuEYq+p2325VbDCokBaKJbXuh6Fvonk
         x9rpGLffTYiqq4kFHKwYfWfU54nGec/uoHPfXHkCkGyiGMhfiG/FCnmxKVwbXrJXSgsF
         rT/ecgmZfu1uzVR9S3itdvotPxwMS/u3iIYOVpwAmJJbo3TEiHqmOswSYxX5cg07NllL
         vYh0+RN37D/p0PbAyqxdmbiCTr0BXUuGLBUF5IxG9RIF7D2mpS1XzbRhRvApR/m9Rq5n
         aPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726571655; x=1727176455;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UayKS1Ryd/2ZU19LR8Ae6STsmhjtxW8blequ0WcRifc=;
        b=NRbeGiqGVgUxD0k6r5JI4paWVL+WCTIxfYcSOIspVTmXbtplI9CyX7MU0ZptzCwMY0
         FtfFY1xc+HtWS9QOPp1Pea4uRtrEN5UXlzDN3g4x6Lzc6Kqa9pMgQoQmFIJVvsVpfHHi
         P1jNP7C/N/7aQsN6Z7YZgSJpXgkglnKbcROo//OIcqKBBcOfKAMmBqydIfL6kI6qb4HU
         mquP3US2/t6odykc9RmjXVEySGKDEK/uON1K7ZNGnhmMohCE7oEhqygu3GROQRIONJ2o
         Rb51XKoHp3R7zoRcHgE1D8Acre2R0rfd5WX4nFqKRPn2oy9B4EHEKh3YXNOvcUUfo1Wt
         oUfg==
X-Forwarded-Encrypted: i=1; AJvYcCVk6ssAIcVbSY3SgvH7eaRd3XrWPwC/QBPu6jhaE8/XvJ6YLBMH/KZ/E21ne21m6z3EMYElJwJ4Lczy8uGy@vger.kernel.org, AJvYcCWyLq0Zg9K48fPD8swfkfbN5Z7VBXL2naDpcL2tFWKxtSl6+DNM3mr0Dva6UhLo56QAdKv8P86PEXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmeNYChficrhi7/5K72H5WatRR9tLs0jNJQgwkSn05ydD6zfyQ
	c/8hteCCsxoB9n6GX0jOfrdWeMJ6OzWQ6ULpzxkxxZQtZvk8ETeY
X-Google-Smtp-Source: AGHT+IECSFVHLSs2BEa6gNEYukMuwIRh8+PAJowLHgFybu70GwUbv7gOL7Z/0OHAwrPcrtKgysbISw==
X-Received: by 2002:a17:906:730d:b0:a86:ab84:7fc1 with SMTP id a640c23a62f3a-a9029620359mr2320985366b.50.1726571654929;
        Tue, 17 Sep 2024 04:14:14 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it. [82.51.105.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 04:14:14 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Subject: [PATCH v4 00/11] Preemption support for A7XX
Date: Tue, 17 Sep 2024 13:14:10 +0200
Message-Id: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJk6WYC/33OTQ7CIBAF4KsY1mIo0AKuvIdxQWFoSexPoCGap
 neXdmNjGpdv8uabmVGE4CGi62lGAZKPfuhz4OcTMq3uG8De5owooZzIosRjAOjGKdewFiXBE3Y
 GQGnJec0Uynu54fxrM++PnFsfpyG8txOpWKf/tFRggkVtNa0M44SJW9Np/7yYoUOrluhOYORIo
 FmQlQbQlhorya/AvoIihz+wLDiruKiUcqI2e2FZlg/ji2hINgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=5075;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=p43bASK1vfwUMiWcV6qCQue61/vpDXfDQ0kldeq7A80=;
 b=hk5Iub5XOWrLjQszZCzHusnMkYZMvOSGsyYwmJgPjMZhgjDUDdjGbekIQLR9r72L6BMNoffeD
 XKuvlYiVfcWCTqekKi63nJNgN73JaxnMY4NUpexaqmORj/amq7uhrBu
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
Antonino Maniscalco (11):
      drm/msm: Fix bv_fence being used as bv_rptr
      drm/msm/A6XX: Track current_ctx_seqno per ring
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
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 325 ++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 440 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   4 +
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
 drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
 include/uapi/drm/msm_drm.h                         |   5 +-
 20 files changed, 1117 insertions(+), 66 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240815-preemption-a750-t-fcee9a844b39

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


