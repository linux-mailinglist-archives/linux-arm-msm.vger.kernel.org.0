Return-Path: <linux-arm-msm+bounces-32608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CF0987A62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 23:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A06F01C21E58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 21:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8016718660C;
	Thu, 26 Sep 2024 21:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWHui/ii"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01A4183CD6;
	Thu, 26 Sep 2024 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385419; cv=none; b=MOgA4YFRR1pm0noje9LjsLKS+gBlDa5rDUAJI7IXMy2gRgLHH6d3E9meKKJcr/YNMyhVORi9Icl1vFNnEktWnuqjUumvF7Z9LSm7YBTIgcNkinmfC1cP5JFlTy+QWuv5vGmKDexylFqVbTd6vfYX2QLKiE1uNKjkM8qANDhb0K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385419; c=relaxed/simple;
	bh=llt84Q6uMYWCeZIr3VX1MJmLnn+TqCHJ3rAalKWCkW0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sEoI/cCoCVN+a8U68dknmiO0cpH0q6e9FAuI62Nsh31b2J4ME01YOXSDabyQjqbiI7ppIEyVCoEJKZPEw9yZ4m2n1THpPbMLFJptJvYjHYXZkqIDs70UxAprSMw7t0nVm1Ce8smfadzFRV7WCNZixVs+PtN9eKpBVQhacAcA7Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWHui/ii; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso209577366b.0;
        Thu, 26 Sep 2024 14:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727385416; x=1727990216; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NojhDIYPtboEQKV1eWDp7ZxFNsRiRa7KgSjISOFHh/I=;
        b=XWHui/iiGfknzPuZ8jgXANYUIUYkz2eAxs7DeNIFkGlP6wGzF6q7NdKxKIL9TTWOFK
         e1tXrt/h6N9T4KHCvClv3oV9WEQj+P9jPdmaXOqppK3ys9E9ru/EsynGHu6sPX5TukIm
         twyI/AU0iFySFS8DXhThY4B64kHN94mxXhrohTzk1lfIz+J4d0t29PDKqa7KjFr83vB3
         1pGPHJReHNRwZj30QRKRFnKuIg414hQR+Gq9cMqZ721XteL5byyOkcMWNakUqjBNTroa
         GOVJJ7ESXLC3nDvlJoBTIrqJo/okDQqX4HKkrRdP5RG9IIe7kq5IKf4NE6IFKptEZ6Mj
         YyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727385416; x=1727990216;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NojhDIYPtboEQKV1eWDp7ZxFNsRiRa7KgSjISOFHh/I=;
        b=dRdDiPk4szFti2+ulsZkM+YjD8EiQIeNz5DgsIblLIK1cfJe3o7/XlppjQTnywuy1F
         1NZeHrWQKmUPi11+QrUlocs98YXgoUaXHb3hyUaeWUOq2IzuRy/OegSWhEmgic9qIyfm
         cZSlYDoAuV/l+8n3OBtSmpe1Jk5OjWpmeAraX8vQEkCIzE3qGd9Fs0RSL7vWscoJFVev
         C9IgbRHnFsNZefrZ6Vh5UatljzpCJUGYHvXyYHwq2NvtEMb6Gw/eIjRgqtUfZmcMJ69m
         4hqibR4pDps6uKMDczFz08HASQyp1fiJN3VsGkCtBHEhppFEvRt5cMUyNyTNhi/bLHa/
         /9gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUavotxV+6REFSn1BBHBsoYbxRZaOxcxZPA+zVNcsbTcVDf7NIrCRXtTPGZ+q89l85R31lCpCal5Z6j+ygR@vger.kernel.org, AJvYcCUicb70n1C+tqQikOMkquQvwdH6BlxkXN6skcp10+oXIG4GSIswXzcSg+HCfrMrLxyEnlIp6fKZs9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+NBl0dLuPsqXqa3by3vAlIXjUK/wHL6bZgOvdXzSsP7bLZoGE
	2Mbc+FmgzEv+UmUS/WRLJkZrhKPPGlVD7fBom6zqzi80Mekpjhms
X-Google-Smtp-Source: AGHT+IEoUPZWhRhr6gFwOKPa+IiSxa+7PEGOS3oE3z3+UnO4GGBxERCNrzpZAGZuRg7MITGapW+C8A==
X-Received: by 2002:a17:906:f5a8:b0:a8d:2faf:d329 with SMTP id a640c23a62f3a-a93c48e8175mr71194666b.2.1727385415536;
        Thu, 26 Sep 2024 14:16:55 -0700 (PDT)
Received: from [192.168.1.17] (a-lu6-5.tin.it. [212.216.221.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297b7d6sm38862166b.162.2024.09.26.14.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 14:16:55 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Subject: [PATCH v6 00/11] Preemption support for A7XX
Date: Thu, 26 Sep 2024 23:16:42 +0200
Message-Id: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADrP9WYC/33QzU7DMAwH8FeZcibIcZIm4cR7IA75cLZIdJ3aq
 gJNfXe8XSij4vi37J8tX8VEY6NJvByuYqSlTW04c+ieDiKf4vlIshXOAgENeGXlZSTqLzO3yeg
 syFnWTBSiNybpIHiOO2r7vJtv75xPbZqH8eu+YlG36n/aoiRIl0rELmsD2r0e+9g+nvPQi5u24
 EbQsCcgC76LRLFgLh4eBf0jBNi9QbNQSzCuC6G6lB8FsxGU2xMMC8EW40EhQfwj2I2AZk+wLEA
 iTNWrrPyvP6zr+g01xYN4ugEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727385413; l=5602;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=llt84Q6uMYWCeZIr3VX1MJmLnn+TqCHJ3rAalKWCkW0=;
 b=hSRK6Lng9//YujRYScGmiLTiNjOh/1xaVPtDJXe8flZhsK+FoJOrwi3FpvOTrPuqKmfuk/o/6
 /DvLWHzdlypA/UsYnQl6TTJUKg2ECOHgd0PEAZLioI8DBQ4RlLyosei
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
Changes in v6:
- Fixed commit message prefix (A6XX->a6xx)
- Allow preemption to be disabled at run time
- Link to v5: https://lore.kernel.org/r/20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com

Changes in v5:
- Made preemption documentation more detailed
- Added ring ID to preempt_record BO name
- Added Neil's Tested-By tags
- Added Akhil's Reviewed-By tags
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
Antonino Maniscalco (11):
      drm/msm: Fix bv_fence being used as bv_rptr
      drm/msm/a6xx: Track current_ctx_seqno per ring
      drm/msm: Add a `preempt_record_size` field
      drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
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
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 325 ++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 440 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
 drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |   7 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
 include/uapi/drm/msm_drm.h                         |   5 +-
 20 files changed, 1122 insertions(+), 66 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240815-preemption-a750-t-fcee9a844b39

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


