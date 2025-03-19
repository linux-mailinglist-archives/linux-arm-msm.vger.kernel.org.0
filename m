Return-Path: <linux-arm-msm+bounces-51966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A96A691F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A96717B8F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9331D7E5B;
	Wed, 19 Mar 2025 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLIwHVuS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50E01E1E12
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395450; cv=none; b=RqhzhzdhqmirflpaW5d5YEdhnNojwayyBRXA4cvvW4h3PCLU5eMMfM3LQX0ZOKfqqgHPar+cw3+CMPYtmMUkHGq1KKPgkWHo3MYPp2EMpeKvP9D/pXIe/wIMnHldFtDeQm8/Gl5M1Tf1LSujfWhcyz2/F2UGDSFsIePH2dEI2LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395450; c=relaxed/simple;
	bh=W+2qxiUePPwUKrcvsCPyy4DS+hrPlZHy31bDsxo4fQg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DTRISgfGTr9iDZWcOKBjA2ZEiS0RZyCjRWTirjOtUTv9SlwN6l4oNJ1CGYvK0sUMqfkxRzPhs6YDuDDDOD2sxcDRVUMbCHGA0KDrLnZ6CLJd/GyG13uXwEHDcCB/J7PYSN+fYKgKGSfzq0HU9+TwNuiLtema9YA3pWDi4HOQiOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLIwHVuS; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c0ca5e6d45so118661585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 07:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742395447; x=1743000247; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DZvJrb+zBc9tB4E4JhmrwjQA5QPEwUV+8PpbNLpgvNM=;
        b=KLIwHVuSAw23Hh7oURKi/ftMMDdDYS8bydsuPyqxP7LdcKnZ2W9t1R7oc0I0eP8cbV
         Y/QiB026gaI5YS5NejXZh0erKJrYz4g21Sw/gSD098Hm5AUO/hVbxSZ09+KsL3YQRSbo
         fYvLJT3u2HGm5tR7aMlPJ+gq6vYtvbmZwfbVz6PntWSMYEp0ZqkygKv1MeW/jfMfnCu0
         ripVqRtX8toksDlMr/Bu08LHWvmlPuDawF/UsUGA6xqCCNMhlF1jxPiaQdBtfGPh0bIV
         LPTXRXSexLANsVWK/EyHW74OXSuD8bUhx4ah2yGIxB7d14eHY/poAMkIHmRv4ZflOnVi
         JamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742395447; x=1743000247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZvJrb+zBc9tB4E4JhmrwjQA5QPEwUV+8PpbNLpgvNM=;
        b=BZExdUANI5ry9p9gYrPabBeyXo7by4yXdiFIM99hfJaCBI4kk3n3pFNind4x6ChdXs
         Gqt6N/21tyFWZLMbUgjnXHCZknbBrUPPM9DAVWddJ23PMLfu9amw7xwRnmQX3ZhK0mEV
         JazbpxJdOntIM/yAAU8KLm5jjSaYoN3PVNujqDoBGMEcD7CngoH/4YZj8XEuHT6p9nA1
         hfcF7Y1xhJb1KbSVHGFFr2U10EuKPkjLElAT6254B1xXYk/8bqBhZ6jLemau47PFXPDN
         ZSbkpbmgnya56JZjw7dM/NhSy1ZQ/hOExmF29homXAM+Qk53QJgOkguAxf6JXaQAltNo
         Kryw==
X-Forwarded-Encrypted: i=1; AJvYcCUg6y9m/Dfw+DwhsYuQi++lfOyVnOtdLKkaOHKD2JCe8zXWtgu6Bzti+q2QoVyZ5Epi4OVLZ349dDEsVRB8@vger.kernel.org
X-Gm-Message-State: AOJu0YxV06W3/adyK0tJfOmK4Aig6t9+cHvtEWQHWXfeeftcAi3638vv
	31ec6HoZEBYKQ2iudr99CGjSfp0vf4Ywtum6Ss4+A8/xP7FaiosD
X-Gm-Gg: ASbGnctzWOLMYktyv0ZtkwFT3zGxJ1Uo2UsnNeFzujrTpNLDG6oLQCUyBJrOcS0uI0q
	FTZpQV1JuaIRQ+aV64g+qFtMGBwlFISoJuuCTeSfUAPiAR714Yw1aJ5ZHSxRBnZj8uwJnlnuhVC
	Hsl1XhfpNJyde4TQ6MAeRe23sEwtdyJp/AIqEtd/zGiQDuxXWMjh8ZSWYmibZgANV3y1urFxfrn
	fm3rulnSIcJYRSVMcqlS483W/BxmyK4IgXsB7l2ljIZ9ZCwAZeK0bMsOavvAeiRsviMvwJe2BFn
	DHdQjzr00sCYM5UE8SqK2aiwmJBLL5QFFTa859vpvU4JIJGJg2XjUAmV+2/aM8m3Deyh3hRe0vj
	S6VbqFTgUO//tjA==
X-Google-Smtp-Source: AGHT+IH8wFR2r4P4bYD39ofrHSl4H2gYM7bk1WgoKLisHaottHVJmyfq/MFmaRHVPdil7K8nUd/zNA==
X-Received: by 2002:a05:620a:472c:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7c5a8454c75mr149047885a.12.1742395447329;
        Wed, 19 Mar 2025 07:44:07 -0700 (PDT)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c5201fsm868587485a.23.2025.03.19.07.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:44:06 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v5 0/5] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Wed, 19 Mar 2025 10:43:59 -0400
Message-Id: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC/Y2mcC/43PwW6DMAwG4Fepcp4nx06g7LT3mHZIgqGRClSEo
 lYV797Qy1APaMff1v9ZfqgkY5Skvg4PNcocUxz6HOzHQYWT61uBWOesCMmi1iV0qYP2coXGXc8
 TNPEmCXq5TVAVwlgdkVi0yvXLKK9tbv/85nyKaRrG++vSrNfpP9BZA4IPlWcmb2v0323n4vkzD
 J1a0Zk2EOEORBmqCy6CQSrR0DvEW4h2IM4QusYhanu0pN8h8wcxmh3IrK+JNl64bEzgLbQsyxM
 DZl6smwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742395446; l=3767;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=W+2qxiUePPwUKrcvsCPyy4DS+hrPlZHy31bDsxo4fQg=;
 b=KuiYN+2L5L9ZTkYhp2nQbTVJiw0RI+ulKpDIosj5jHuAWlohXExldKuu0bne/raFKDh/osyLf
 wtodUGcp3MSBERRMcHsuvuYsQDtGtaxFLRVCv768rnsZMtcPy0a/I1z
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
Connor Abbott (5):
      iommu/arm-smmu: Save additional information on context fault
      iommu/arm-smmu-qcom: Don't read fault registers directly
      iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Temporarily disable stall-on-fault after a page fault

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c            |  2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c            |  4 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c          | 42 +++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h          | 26 ++++++++
 drivers/gpu/drm/msm/msm_iommu.c                  |  9 +++
 drivers/gpu/drm/msm/msm_mmu.h                    |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  6 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 67 +++++++++++++++----
 drivers/iommu/arm/arm-smmu/arm-smmu.c            | 84 ++++++++++++++++++------
 drivers/iommu/arm/arm-smmu/arm-smmu.h            | 21 +++---
 10 files changed, 216 insertions(+), 46 deletions(-)
---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


