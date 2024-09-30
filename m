Return-Path: <linux-arm-msm+bounces-32775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E29D98A5F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 15:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FB2A1F24153
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AE918FDC3;
	Mon, 30 Sep 2024 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJjW0FiL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEE14F8BB;
	Mon, 30 Sep 2024 13:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704364; cv=none; b=LqWcYP8efZ6bmvEJwCxEwZaalnN82SVQSVdcwntVuxWqazksqL/OBJjv+TP7QmnSyj0z9G00r3TJXPLsp6jCCC/Vp2y+an50l7qwWkfB3iMSOGddBUOkc6eSy+EHeVdXy+MF345xuavqhjbFAObuZqiFSopVewJB5YsxXgCb4hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704364; c=relaxed/simple;
	bh=C9HvIpNjNeaznQ0MpKwwi8H/OpfNyuIbOnAsOMiC53c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H9TEoOTqN2U2L8M5KmvpSh4sWgCR+KlOQTsqkPb6Rf/YSTptvL7WXq3QTU0Gt0O++6kyT+odqZczmo24FOLveMUqt+YSWLEeesmicXh4E/bdv51wgUsTpX00vJsDdd1ISj2ZH8VHx5sqmz2x37+uSukbbMhPQx3pAjsprEvS0g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJjW0FiL; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c896b9b4e0so1960983a12.3;
        Mon, 30 Sep 2024 06:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727704360; x=1728309160; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m1Yaj1emHXeiVt+escUx1dJSR3jSAkcCaxo+65UzPS0=;
        b=TJjW0FiLX3qDuPbH9r8dEP4sp/6114PjKQq4yYqkNpzfBNxbC4nMRzsS714JZw8S5i
         XmjYK2M/G8nKghpfUggXq3Yyt+jCrngSQqe8NlUGqzYGBnvlu/1t1BnhbVBQHzVfmypc
         tMuTMXFyphuFU0MsRVL0U00AKHVK3Qy5zFT4w2/wPTBCdko42Upg70atkXxFRdgHpOQB
         BFhSYpS8l16tMhaoMQZC8oOTZ62tsvMMDl7rY48crBEAwQxY79zLSt5G50GLrlt7QNw6
         LHFuzyBIylL4qaEpCYefBsRrWaBv0v3PXHksKnMNVlCmxzsyBp46C2MNBemSXFPUozAa
         DlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704360; x=1728309160;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1Yaj1emHXeiVt+escUx1dJSR3jSAkcCaxo+65UzPS0=;
        b=tge30D3GcTJf6wYRbVUKRW1SWLKxkTeaz7/xniSb9mbMGJmf6qFm0CsI2CGOIEtRbg
         JJzyBFxOxPKLq++C/AZAXUndE7LXjXd+fe/XvM/5jXGOxfwc2nDODMdEjDMP6QTOZh5S
         T3HX5D3mDm5BjRyaIdA2ocZIAIiee89BK1+8xhV5o4BoHFgKE112S3Eexo/X9jq9BlLK
         WLy01uZmmCUVMLN3tn5KuLDlzUuglNc0budTw5ySREAdZW3G/PSpNzzIfgkZuvGtFFnQ
         houoz2l9KjsSBP10n40zOQvRwIBU0k9DMMLcFFcQymX6OTJGh/2ZBK7ZUYBfuSsNOzi+
         RjEg==
X-Forwarded-Encrypted: i=1; AJvYcCUXT6CcqmPR7quuA47/vWoVXQb9m90vSkQir2HMWRsvs5ophYKiBfSipBbCPNaHHOrLm+nV+W3wBDE=@vger.kernel.org, AJvYcCWWt7tIXxXzFKHW4X1a6ANB9TlDglsaS+pS9w2tKblalszisM5M0MIgs9Ud9AhIqMGDuRGKP8E1o+q/XJMp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/yhSa1ZTn16fqTt7QkuNoaOnwFtSt6QNsHCwTfFO/gCql6i/b
	pMshk8bT/QoN+xw0BgVOtGC37t7ohRtpYThm2otpXfe/qjQpgVfW
X-Google-Smtp-Source: AGHT+IHphhp0QM/xcUftLTNQsVQV0LaSqp1tKGukf2qQrSbPCSCdTcjXgoNlLh56IND7C1V2YuWpag==
X-Received: by 2002:a05:6402:34c4:b0:5c8:8381:c1bf with SMTP id 4fb4d7f45d1cf-5c88381c226mr8679919a12.3.1727704359537;
        Mon, 30 Sep 2024 06:52:39 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it. [95.250.55.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:52:39 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Subject: [PATCH v7 00/12] Preemption support for A7XX
Date: Mon, 30 Sep 2024 15:52:35 +0200
Message-Id: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACOt+mYC/33QzWrDMAwH8FcpPs9D/rZ32nuMHvwht4alKUkIK
 yXvPjeXmdbs+BfST0J3MuNUcCYfhzuZcC1zGS81mLcDiWd/OSEtqWbCgUuwTNHrhDhcl9pGvVF
 AF5ojovNWyiAcqXO1I5ef3fw61nwu8zJOt33Fyh7V/7SVUaAmJM91FBKE+TwNvny/x3EgD23lj
 SCgJ/AqWO0RfeIxWXgWxJ/goHuDqEJOThrtXDYhPguyEZjpCbIKTiVpgXEE/yKoRuCyJ6gqQEA
 esmWR2Zc/6FbQPUHvn9TIMAstbW6Fbdt+ASjaYy78AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=6010;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=C9HvIpNjNeaznQ0MpKwwi8H/OpfNyuIbOnAsOMiC53c=;
 b=6dOUv5VIPtbiaHxFmr6UvOkF+bC2pXfM2L4ibF1oJqJcAs9mDfMkLgmp57EVwHHH4mz7fCOFs
 GbQU7RY5k6xA8yxEUND4ItTe7YysPwO+UkiLk2UBpcN6z3w0CLbNViX
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
      drm/msm/a6xx: Enable preemption for a750
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


