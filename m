Return-Path: <linux-arm-msm+bounces-58772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BE4ABE366
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 809E9160E68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E21227FB14;
	Tue, 20 May 2025 19:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqCMNweY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0F3267F41
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 19:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768142; cv=none; b=nxxgwUs50uKKsUyKj4DCGr9Z/mNj0HBglLuR0Xf+F/6FQTLqKfKTD+C03QVUZecq83HDYJCVU3iIAb7l2656ThdxKjbAXfYqt70vuMtSEV60BhscU3VkBmNdAlB9LY7bBPoQ+Nzf7bF9uA4+qzLlMRAG1myGsveB96khM83Es7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768142; c=relaxed/simple;
	bh=I1cIbwom2B32IbSq72YVeQcGdq7m4R+PKVkZdFMEOLQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YEL4mf7UsX2JQt5LwAJSMt+vNUJnGVBmvDR0De7PDKqKu1pKtG+dsXREhRMX8I4YK4C9ubFxbzuHVq1R7t9KTY8pKOOph+msrWhk/gwYbsfT1T5FAwIEPx7gtG0lXLKCro4ueRLQymOPF4hVmwKjSoobgdv52umz3Yfg4C7bI/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqCMNweY; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c57f2f5a1bso64257385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 12:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768139; x=1748372939; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TiPFN3JOGIK1F9o5An3myfiKGu5aOmMHw/+V8iz5ZMA=;
        b=SqCMNweYWPUyxSy5v9RMka3BGF6A1SDR8jd8E8np/8dzlYyrURRiTdLXEl/CQUQr3n
         EaQv6rkxML5IGJy0Flol4ynFR6OGUedlxnAftrAf7KAnCXtkcW8J885KOqUpW60UGqcc
         z74xkeAoov0UitB9tQGZNE3JBoqkvXSmkXQP5jxJl8yFkv7Vcuvb33E0WlwO4z5w7j/E
         RM++/Vwd0Ll3P9HVFNx9yLkmWREoAixVFJlISWN/OfNSHRnjfcopJQp71AZWleYB/L74
         FBaC2bIwRw59vHNmGD5vp8KQKpx56vn1GoYdInXg4CYzgPJNQH1tGy1s88mKHrSxVzMA
         lANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768139; x=1748372939;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiPFN3JOGIK1F9o5An3myfiKGu5aOmMHw/+V8iz5ZMA=;
        b=by80ve+A/0EmQPf/DDYQVTqz14JgUXsVLSLX6dCt1OS2jQQMXpmxnaLVlq7nIEC2MC
         8HRmpUp1TQM54vC2SeFGUAM9p3M0msWa9xpl6cRry4G77LmnS8/iyruKwKcNKS0TksAI
         dIm60cnLv2GkZEobUdr81lFvGyiRs9f58UwsTZd3eLr7n6oGbhRjLVaBNOPnDeSzjkVB
         bNm0nV58DdDCiFzNsliqJKucZqKl3Z63gtzTZqqItYJjNHBENdvLVgkacf8ZB8gJNgKX
         JwCZ8ktmY6Gm1piW+uAftQImn/X+05pZ5jPzj85kbzfGEnxDIMLRyxaAIDgEukCldNpH
         LzSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD2wd6nkeVBRYhS3zL1nj+jtiDekNS6Jsr0veDMY5BiiGJgfQJBF3PKpXLquEB3ScFe5uO0sbB745PQ2Kv@vger.kernel.org
X-Gm-Message-State: AOJu0YzcXv+xAfKmsDXDs2ddrYHtgbvnBhPfVQS0Xaf9qNUtoMVDMred
	3mITZGycylvZACsX44CoQjGls2PtEVj4mgETCXB+akPpkm6J0ILpPL5I
X-Gm-Gg: ASbGncunf4HXQNJWjLkktXnqAdQuNrFaehRrVzG+Bcw/esfzzLMYybjGJenZHvetrZv
	3qj4B79v6gum81eYuHnlXIpLzpAjf/NWdWj7qVfaFbo09Jvjr4B2jUkQ+nCJQULXAfr9na8RBSR
	/Fd59oQscL8+N9yFV1+PCRUTegH0/ensSEsI1IJZynpsFt0t6L7EQzouGqrrVYlWh0si+N+kDfp
	nrU8EJ2B+E74Em0BbpinCs7ZHYHpOTUi004xf+HBrGL22sC84HZ/qY15AQXSrOMfOrWIesMw38Y
	RbsjHX7en7dCMdGGv1Py5x4ziX2iv/RGL5xWBv7hzMLB08z8mlt80fTZ2xEVbvGP8X+u/CoWgau
	VWUOf9W0/mc6nTJkWBIU=
X-Google-Smtp-Source: AGHT+IEmBMiK5D6gNzmXfrX761lWGStYxNBrJZvudJzvab7Rp2ElyIbOXSVquGxbCO8PBrAmoeTxGA==
X-Received: by 2002:a05:620a:2781:b0:7c3:d752:f256 with SMTP id af79cd13be357-7cd4674630bmr1041365885a.7.1747768139243;
        Tue, 20 May 2025 12:08:59 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:08:58 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v8 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Tue, 20 May 2025 15:08:53 -0400
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEXTLGgC/43QzW7DIAwH8FepOI/JfENPe49pBwJOitQkVUijT
 lXefaSXRjmgHf9G/hn7STJOCTM5n55kwiXlNA4l2I8TCRc/dEhTLJlw4AoYM7TPPe1ud9r6+3W
 mbXpgpgM+Zuo0CnAWuEBGSvttwtdr6f7+KfmS8jxOv69JC9uq/0AXRoE2wTVC8EZFaL663qfrZ
 xh7sqEL30EcKhAvUNRCBwncgORHSOwhXoFEgcC3HoApqzg7QvINCZAVSG6rIZMNCtPKII6Q2kH
 MVSBVIGeULgdwMdpwhPQbUkxVIF0g2SL3ygpvjT1CZgdVj222H+kQWQjOI6g9tK7rH2oL/4h2A
 gAA
X-Change-ID: 20250117-msm-gpu-fault-fixes-next-96e3098023e1
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=5755;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=I1cIbwom2B32IbSq72YVeQcGdq7m4R+PKVkZdFMEOLQ=;
 b=i1oEoJC+lvHNjZGNrXyp+vl7Kutp44g7VBEaagMi5W0nsmizVrnl+FpNsaYxO69uzPtgHKPz5
 hsBP1dMI420AFEb+9PUrzKPDwASpVZR3eErIWOjvpKBFjzflOpeMf3d
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

Patches 1-2 and 4 fix the first problem by switching the IRQ to be a
threaded IRQ and then making drm/msm do its devcoredump work
synchronously in the threaded IRQ. Patch 4 is dependent on patches 1-2.
Patch 6 fixes the second problem and is dependent on patch 3. Patch 5 is
a cleanup for patch 4 and patch 7 is a subsequent further cleanup to get
rid of the resume_fault() callback once we switch resuming to being done
by the SMMU's fault handler.

I've organized the series in the order that it should be picked up:

- Patches 1-3 need to be applied to the iommu tree first.
- Patches 4-6, which depend on 1-3 should be taken by drm/msm. We will
  probably want to create an immutable tag and merge it into drm/msm to
  be able to take them in the same cycle and avoid the temporary
  regression noted in patch 2.
- Patch 7 can be applied to the iommu tree later, it's just a smaller
  cleanup dependent on the changes landing in drm/msm.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v8:
- Make stall-on-fault debugfs file a wait time instead to make use in
  igt easier (Rob).
- Link to v7: https://lore.kernel.org/r/20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com

Changes in v7:
- Rebase on v6.15-rc2.
- Add debugfs entry for whether stall-on-fault is enabled to help igt
  tests that want to wait until the cooldown period is over to collect a
  devcoredump (Rob).
- Link to v6: https://lore.kernel.org/r/20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com

Changes in v6:
- Rewrite to use a threaded IRQ instead in iommu/arm-smmu (Will). As a
  result we can drop most of the previous changes and instead move
  writing RESUME to the fault handler.
- Link to v5: https://lore.kernel.org/r/20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com

Changes in v5:
- Don't read CONTEXTIDR for stage 2 domains.
- Clarify that we don't need TLB invalidation when changing
  SMMU_CBn_SCTLR.CFCFG.
- Link to v4: https://lore.kernel.org/r/20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com

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
Connor Abbott (7):
      iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno SMMUv2/MMU500
      iommu/arm-smmu: Move handing of RESUME to the context fault handler
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Don't use a worker to capture fault devcoredump
      drm/msm: Delete resume_translation()
      drm/msm: Temporarily disable stall-on-fault after a page fault
      iommu/smmu-arm-qcom: Delete resume_translation()

 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c         |  5 ---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c            |  2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c            |  4 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c          | 54 +++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h          |  2 +
 drivers/gpu/drm/msm/msm_debugfs.c                | 32 ++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c                    |  4 ++
 drivers/gpu/drm/msm/msm_drv.h                    | 23 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.c                    | 20 ++++-----
 drivers/gpu/drm/msm/msm_gpu.h                    |  8 +---
 drivers/gpu/drm/msm/msm_iommu.c                  | 12 ++----
 drivers/gpu/drm/msm/msm_mmu.h                    |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  9 ++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 43 +++++++++++++------
 drivers/iommu/arm/arm-smmu/arm-smmu.c            |  6 +++
 include/linux/adreno-smmu-priv.h                 |  8 ++--
 16 files changed, 173 insertions(+), 61 deletions(-)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


