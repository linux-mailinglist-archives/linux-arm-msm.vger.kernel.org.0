Return-Path: <linux-arm-msm+bounces-50226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F895A4E882
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F0007A8B37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8D1280A5D;
	Tue,  4 Mar 2025 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsEOESVE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D437B281344
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107443; cv=none; b=QdAE2aDH6A5TMiJbl9wjGt88itLcKZIWR7V1oo4WyBuUd911skqfJakfJ7ElqsY7TdSYBSiK6PIpUF1w9a47RQfbmXdHjrxD/hAxnTRL+9qaFcoS9OLi2jZpz0ePp6KXuDGn+e3Ka193/Vhrrbnh85eLok2/tRQApSLhdYN/lN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107443; c=relaxed/simple;
	bh=msh5539EjP+JTGfOm7TmnwDK21yliTFnve+XoihROqc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cEWy3awEcoWyTmkLauV4h5WW+Y4EgZnU06kcdrfv4CVibbSxZw4awHo7Fusa+qKRKjlBLpaWyOpqhrIzBASNeyM+tWudlQ3lagWz1Y5zUSR9kmF+/OOGRTGndG53S87JORRZ6uP8nHevcQiYY3+18dKmZomD6GCffBKGJwzl77E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsEOESVE; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e88ee9dd84so9052276d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 08:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741107440; x=1741712240; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4N8VHwibUhruAck2dmF0TGYAITA4/2gddqUqD7otHMo=;
        b=BsEOESVENWvCMnB647b4Zhw3VIka+uOd3Ac6yLCplnnq0Fzf8ub7Rsrg82tyDRLp9B
         mP6keP9b0OtKv8i2l3bgOKJHIIvvACirAPjcu7XfiwWhDQinRpnZ1vJatJFlTWKx1vaH
         FblEy/8vCo7wcK+qo4TYUbZzTxMo3v3SuJCS/Aw35T+VrwTiZqEMAmUa0dH6O41z8LvQ
         Bf5t/k/JlhX7FXymXLm/Tn1mqUhTRvXwjqGszBdj4e1HeYTeAYQ9SKz/4BebXmElYv2w
         Mzd6qdlF8FoT0VWQEEujND8d5tnrjiAHmDX+0qfr1C+DbnX28aPMNgMVy7f4+pi4pT/q
         1tyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107440; x=1741712240;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4N8VHwibUhruAck2dmF0TGYAITA4/2gddqUqD7otHMo=;
        b=P+kS6cnWP5Tt5AXT9z4wD4CE1XJ89WYfJjWLk1xrdojQo+oa80/N/6OiRy+8qjhAt9
         ebu1TkH0EzmTZWJq6xPTlcOjOZXhC7EWTDEs2B2caqJV2GzYsDh/Y68oFLLuej+5BSZW
         uE4Ec2Jg8W2LHrdNGzs5CWC86Dcv0DwYnOGb8oYui09rPKNPNH5S04jzHwPBOXriBbPG
         5iUfQ5pwv2UwdiP2L16ggCIQ+G4asfCDqviySe15qKMYCL+Np2w3Y7eQ6fRfGiJDpabO
         fEY4ssu1Zrm4q2KREFuVRud4+Ohy4bHxa1XTRQdos4do26C1sK/GL5hI/0CJJPc5Ee1n
         6lHg==
X-Forwarded-Encrypted: i=1; AJvYcCWB/Lymy3d2JOHdlEdW4mbpZwuiVbm2RJy+ErX8FuP5hIz6HcfQMUCTOLxZ7LUaMzhe6pj6FlYfjkdOY4MK@vger.kernel.org
X-Gm-Message-State: AOJu0YyBmLaAbeeG3gVf9MncXEVU9je9HckjCvpmpX7h1td+dXe7O/j0
	FCB1t8eqleRF+zky7Q3o/3K36hJOYJhVYxbu7G9GfbH4igtcVVAn
X-Gm-Gg: ASbGnctT6ldgnVjDW+PufmS1rGCv6jCFD4FGvTavdsw4E2VbJngY46tIq/CkSZRdqFQ
	P1o9y/Aho0IXX6aJEU5QmKMf00iQelHrOxO4ddT58ZXpVEZoaN01FFjAGfJ3bsz5ZYWOfemOC2V
	08vsgY01mdbw9tf981gw64REDbXEarCb1ZqFyrum6oBuPu74kg5sjoA+K6y039/kl05Ge+JjgPf
	/cHZOFZBbJ4ziMo9c6GAJvu/YHTe5ac9eg8PoMd19A28Q7mYsVIuG8TYNnGc7CIzyOes2oQoo20
	qq+XBsagkUDi0HYWJG8LpWjpQVYvmzeqieZYeaLHKXFC8VT76YVK0SgK4ggcbmg337p+lqgAmU+
	jxfg=
X-Google-Smtp-Source: AGHT+IEjBShiUHTmpe9BMjUgMebZZwGJVd8KDtAxwtvq24tPACT0iVbZHCMtbB96Yct3APfYOpiThw==
X-Received: by 2002:ad4:5ca3:0:b0:6e8:8f31:3120 with SMTP id 6a1803df08f44-6e8a0d8b6cbmr87598206d6.8.1741107440528;
        Tue, 04 Mar 2025 08:57:20 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976ec3b6sm68915966d6.125.2025.03.04.08.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 08:57:19 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v4 0/5] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Tue, 04 Mar 2025 11:56:46 -0500
Message-Id: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4wx2cC/43NSw6DMAwE0KugrOvKcfh21XtUXQQwEImfCCAqx
 N0bWKEuUJcz1jyvwvJg2IqHt4qBZ2NN17rg3zyRVbotGUzusiCkAKWMoLENlP0EhZ7qEQqzsIW
 WlxGSkBUmMZJiKdy8H/i4uvXr7XJl7NgNn+PTLPf2D3SWgJBmSaoUpUGO6bNstKnvWdeIHZ3pB
 BFeQOSgPFRh5iNF6NMvpM4QXUDKQagLjSiDOCB5hrZt+wLr0SnRUgEAAA==
X-Change-ID: 20250117-msm-gpu-fault-fixes-next-96e3098023e1
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741107439; l=3515;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=msh5539EjP+JTGfOm7TmnwDK21yliTFnve+XoihROqc=;
 b=Yavv0d1CLCCiAkzMuG0FSXiwmFR5GAOb6ZI7nc0yBLbQYtJjjJMoJ6ZB5l36VedPILL/LfxB/
 3FVj0xLJBQtCu9H3ML69818ww2mDXCQabfOEhSJAL5M0FYjXXvbU03/
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

drm/msm uses the stall-on-fault model to record the GPU state on the
first GPU page fault to help debugging. On systems where the GPU is
paired with a MMU-500, there were two problems:

1. The MMU-500 doesn't de-assert its interrupt line until the fault is
   resumed, which led to a storm of interrupts until the fault handler
   was called. If we got unlucky and the fault handler was on the same
   CPU as the interrupt, there was a deadlock.
2. The GPU is capable of generating page faults much faster than we can
   resume them. GMU (GPU Management Unit) shares the same context bank
   as the GPU, so if there was a sudden spurt of page faults it would be
   effectively starved and would trigger a watchdog reset, made even
   worse because the GPU cannot be reset while there's a pending
   transaction leaving the GPU permanently wedged.

Patches 1-3 fixes the first problem and is independent of the rest of the
series. Patch 5 fixes the second problem and is dependent on patch 4, so
there will have to be some cross-tree coordination.

I've rebased this series on the latest linux-next to avoid rebase
troubles.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v4:
- Add patches 1-2, which fix reading registers in drm/msm when
  acknowledging the fault early. This was Robin's preferred solution
  compared to making drm/msm's fault handler tell arm-smmu to resume the
  fault.
- Link to v3: https://lore.kernel.org/r/20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com

Changes in v3:
- Acknowledge the fault before resuming the transaction in patch 1.
- Add suggested extra context to commit messages.
- Link to v2: https://lore.kernel.org/r/20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com

Changes in v2:
- Remove unnecessary _irqsave when locking in IRQ handler (Robin)
- Reuse existing spinlock for CFIE manipulation (Robin)
- Lock CFCFG manipulation against concurrent CFIE manipulation
- Don't use timer to re-enable stall-on-fault. (Rob)
- Use more descriptive name for the function that re-enables
  stall-on-fault if the cooldown period has ended. (Rob)
- Link to v1: https://lore.kernel.org/r/20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com

---
Connor Abbott (5):
      iommu/arm-smmu: Save additional information on context fault
      iommu/arm-smmu-qcom: Don't read fault registers directly
      iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Temporarily disable stall-on-fault after a page fault

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c            |  2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c            |  4 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c          | 42 ++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h          | 24 ++++++++
 drivers/gpu/drm/msm/msm_iommu.c                  |  9 +++
 drivers/gpu/drm/msm/msm_mmu.h                    |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 64 ++++++++++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.c            | 78 ++++++++++++++++++------
 drivers/iommu/arm/arm-smmu/arm-smmu.h            | 19 +++---
 10 files changed, 204 insertions(+), 43 deletions(-)
---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


