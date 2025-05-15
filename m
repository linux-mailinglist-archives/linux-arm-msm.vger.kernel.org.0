Return-Path: <linux-arm-msm+bounces-58133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 885ADAB906D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 22:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78A8A9E6CBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F3D25A646;
	Thu, 15 May 2025 19:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2Rcfx24"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51723266B66
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 19:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747339180; cv=none; b=bqgbDni1n9zmjyFlCWfZhDVRaQMNZ6seZuumqFstbNVutmjiVTxhkZVCLH6BlAHVN2apNGAqRFHCRNi4+/avg+1qlaHwN67c0bdUdmrFovjgK8/XASsyKZ+TC0xkRdQd6GkBl/RkXMhN0z8IqTHkzTj3Q2nnkqTgYWayol5O9XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747339180; c=relaxed/simple;
	bh=tPRz/qaPPPGzFEJkum9i4zbHqAmQAXcIYUP29tajErg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aTCtf0+sfL91jCv9P2yqL3JUa1ybbJ21mHMrZ2a2vu9ao1tNe4obyuXXIBmr1RNCeVVEiZV4zMWFkrc/4TboX6eOXAAVinGQ/MVeMct+mtJ2rKy98R51UKTnhX2QCHbGoq1nw0dN9eM1SW3rrgr0lrN26HAVeAt4cCyRPFtebJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2Rcfx24; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-476a2b5dffcso2164151cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 12:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747339177; x=1747943977; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NfCE0CRwqEB66mE3f4XfDEo+9BNN5CkqWUyTjXC1/vs=;
        b=A2Rcfx24HNYd1AmYZE6+ZrzjyTtiKIJXE3leX8NcksiOFpBXIjcq2GUQkBjjTHQUw/
         QDCnF08bvHolEake5Lp9c7afWCCYq3q8xVzp1skY4nq3E32orslMyIS3JCrF53XETHMv
         vX8B2AUv/ZaBXaqi4y+iQkCPoBIWs+elVEiw73hsnmQmxN21NplCtfl9xswPN/o8QPsT
         JyPHwxnWD2NuqoQGXwhbYeujYsiuflU9jI8wtl5trvY/8HGQtSUfNZvrU/VubRIsguj5
         BuppBFCc9lh06/t28a3kxQuUZNmDoLaPrOojkA3SJzcjpE5lj3CJhvUmbNa1rUHfIB/c
         Wwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339177; x=1747943977;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NfCE0CRwqEB66mE3f4XfDEo+9BNN5CkqWUyTjXC1/vs=;
        b=rITv2M+yE4qYii+Su+S2pfeHt5h/vQdOMg3wTuqaZijPjU5XBDLEd2coGMdYazNjCv
         Sxgul1Dl/EMThBtA28ZVMk94RLKvdG67JqgfnmlS4hILwegfhe+2bMr+ljwHE3O9CSNO
         423ptWGJ0uBpvk6bygd6UYXCpTAIauPgmBLx244V/QcYe/t8YK4H2CeX3hOZPe6FuFYy
         d0D7+a0TBlb/EGt/7/a5fYuL5KmNIuaC9SOUARVsq/t+TxF2LaVxyTb0wUiru0dHXRQO
         aTTA5NSV576EgT7KggD9337TwjC+evADHW3/xzuP6w2fVZezYTlp/B2Ky2YRGNmAzOxW
         7ZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7l6MC8ybkhdqIVf2nuWBksstqQ+gskpf8umvrdwMuZrfGoDr31/MsGYDx2o3C1NCXzUwTll2DAZROUkpn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9NawRpX7+jp50aeF3CKD3kClPJ5/L5OoVFiK+7nwJfZ79AMG0
	AdDga/Hvk2MOI3ZoMYFb7BXoWkeA3KtJYQGf5Pqy8rjkW7xWB4W9UkjFh9WKjdxy
X-Gm-Gg: ASbGncsX5nV3uFGswBqLg6eSdIWr+ViLUf6PlJqDZG1q9/mvt5ec7n8XAjwo0N5RTt8
	7kD04I9RjhkA19Ud5RUKjCITSsUZx/jETi97G1B6E9LNJoo9eQ3XWUWevg2WSpBpLmD0dVAcUYn
	rAHyZeWyT03wCeVSjFOYHqcGOReGCWYuNacoPbqVnLjlsn+9wK6+32cHmVTfuF4UP5nHPvI0e0r
	aqQ/vgh0SjjypFdFpAfJwks5wr5mlaWivhDNfiQjR+Y/yHXjymG33k2RnObZ02FiRX+rrR7TkBi
	oYvMJSNIYL3e8EC/SlY6tudU1E6K61NT+lAFtN8rqVVlN/GBFVlXoezbpOeqP5YtXWY+LoFKqsf
	FG/MgdNkS4GFQ8/+Sw/z3Ke9G5LVR6w==
X-Google-Smtp-Source: AGHT+IFkWsAtsnmpyECLquD3Wa6v/pzDjQozponzgbbsKAxLTCxAPwg0uZaNb19m2I0jkfrktlGd7A==
X-Received: by 2002:ac8:5893:0:b0:48b:6eeb:f983 with SMTP id d75a77b69052e-494ae3f8ce4mr3492181cf.10.1747339176983;
        Thu, 15 May 2025 12:59:36 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:59:36 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v6 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Thu, 15 May 2025 15:58:42 -0400
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJHJmgC/43QzW6DMAwH8Fepcl4mx/mA7LT3mHbIh6GRClSEo
 lYV797QyxAHtOPfln+W/WSZxkSZfZ2ebKQ55TT0JZiPEwtn17fEUyyZIaAGISre5Y631xtv3O0
 y8SbdKfOe7hO3hiTYGlCSYGX8OtK7W6Z/fks+pzwN4+O9aRZr9R/oLDhwH6yXEr2O4L/bzqXLZ
 xg6tqIzbiCEAwgLFI00QQFWoHAPyS2EB5AsELjGAQhdaxR7SP1BEtQBpNbTSChPsmpUkHtIbyB
 hDyBdIFtpUx5gY6zDFlqW5QXYuTBv5AEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339175; l=5041;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=tPRz/qaPPPGzFEJkum9i4zbHqAmQAXcIYUP29tajErg=;
 b=YGyiTwfgHlzfazV4WclXmbRcevdot3iPngddWcCaEcAOVt7KIRcRU/+h+G7G5r/mqZKEIVsK9
 E4OvOStUg9sDLtIr2UXwulTAF3g2OVbiqGPUA4uJiI5PDOzT0sTNKgt
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
 drivers/gpu/drm/msm/adreno/adreno_gpu.c          | 56 +++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h          | 26 +++++++++++
 drivers/gpu/drm/msm/msm_gpu.c                    | 20 ++++-----
 drivers/gpu/drm/msm/msm_gpu.h                    |  8 +---
 drivers/gpu/drm/msm/msm_iommu.c                  | 12 ++---
 drivers/gpu/drm/msm/msm_mmu.h                    |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  9 ++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 43 ++++++++++++------
 drivers/iommu/arm/arm-smmu/arm-smmu.c            |  6 +++
 include/linux/adreno-smmu-priv.h                 |  8 ++--
 13 files changed, 140 insertions(+), 61 deletions(-)
---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


