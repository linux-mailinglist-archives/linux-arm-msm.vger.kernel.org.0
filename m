Return-Path: <linux-arm-msm+bounces-45615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E45A16F89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9626B1884481
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8265B1E9B19;
	Mon, 20 Jan 2025 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcRyaZKt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FDE1E9B06
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737388010; cv=none; b=Jke9yhdDU9kFCX2FjarwU73Sp3MS6Ytg4Y8pU31BvsrL8YWIeh7MUG4C+W4eDRK/lJeiEgmCs1Wsqi0uvVRutiGz170v8BPbSTjBvXdCt/DXhrw6QtUMSMdr+fIB2RJObC2PUkbOk1SWGTkxXdEY80hgue1GpPXSoaIwsrEnIik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737388010; c=relaxed/simple;
	bh=lKYxJxxQvusCy8B0sZYN2iP5UpseVkNuNGCfUBuNbWw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bQSLKlAZ+5dkPDRsNzLKmQKLCP6tQaCIMyqaKYaB4khQkraxsoRxN6aopH3wN2cV//gZ1stnw5Xy2lKLjfHeWV4DSIauJs/xGvheifTDD0AdBlJwS5CU/d8L6m3TK4Wc0LWFFY1CsIBf6+W54ff07JXJQgldMjL+Q+fO8R3RQw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcRyaZKt; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467aab3d15dso7265151cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737388008; x=1737992808; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyWkEYx8l19GBLVFTRZATObQ9E8Z6bbFOrHEmmyhtMk=;
        b=JcRyaZKtfPowhxOAqt5Rt0hjF5wQ9yixYRf06a8ztzJqHuqklb0SNWhdhZ4Pw8jT7b
         RgWScUSoDYPFc3fzFF9KXIL31yArO/N97W/lLsQdey3hGi4P9G/GdQvY1PRybV4XcsIF
         ZkiuSPEh3fJYhQja+uChLqVreNCpVOBlMYca1SwBPTI1EaQ5U2UHiwzIy2LIFMbdrtAW
         6Yc2KoY8Gryv65LnialKT8A8N4PV1NBM7WJXJaC38X+tjSfYzWI95PSILbaR+XtwSglD
         PDuaZ/u4QterPJ8XV2UcYgzvSyIx8obIQwKQoL3UXF4dPKWUHBj2X6Uj8AZLU2eWj/kF
         QaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737388008; x=1737992808;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyWkEYx8l19GBLVFTRZATObQ9E8Z6bbFOrHEmmyhtMk=;
        b=o06IpvPcVQl89ItkoW5LRKg36pxrTPnE72DLhcc3zU0E56xI7K4B9uKaUrZHiStnxd
         n6S8v5Ff3c5FtpmUNUxroiXYrfKiXId/0f/v9pqUch4KM3guzLGU0eKNst9um9mvYXM2
         XCK/fmXami12eHw03ou7pl4O3n8APuyVnQITsUwdYg7Z4skrK5KMukGkS5kCsVxkH2sD
         tPP/3P3byPrrBq51wmz6iN79NGdvnehRMpis0FjS7K926cTGB8IkjqEyQNRWu1hmJhA9
         ohBHLAtRie0SLQdt7l2cCVVFk86edbKgebwQPJEaTwYsy+VPvqsN0ujCqOauTaaPR2UB
         l5+w==
X-Forwarded-Encrypted: i=1; AJvYcCX143Q8qmmVWPw30/GpHi0/FJVZooAg6UAx0EhaTubPJ5wfxlKgOkjkqeM/AQBZVdMZTxSd5tK0nIZJIkv8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9xbhGvgiNCgPueeWqb1VS3KVnvbJ5Hisjwrx+RKQz2LbeFl+6
	jmqkBW4x5psC7YxqbvkdXUq4a10ZsE7frqlcJi0HUbZyBl4wCnIGvY/ERw==
X-Gm-Gg: ASbGncvQjuofl+hG3DcgEUNqaFnA2ZaBn+kUnPJutSNFovfIx221DBA6UWxn+dAxWdg
	rq4PY7oBgpmA1W2zYjnmOLwM6/yjkG1JDiogOl1HdIBwIlirgpTj6SMskqQX0QXv0YsVa/ZlEQN
	jDlztmGZFk93i4ve8LT439l9K8dSldUGyuqBTscJJj9/UOulCxS3G+5mbeCk4rfG1cxLCfxistf
	RRL0OpxQhjnzVCLEjIIo/sjJBLJADzIBYrxzXED4Sl8RFw4cozt3zP8kG5lqnrwliidE4bOmiAe
	4mUApzd218R016kCqsjyoGyAmbX3
X-Google-Smtp-Source: AGHT+IHR7cjTCixBLNtbAIMXQS0zWLEWtnuMbfw/UHe2dC10Tj90Pa0lJRvcim4eXFdZ/kNXVMOUoQ==
X-Received: by 2002:a05:622a:4ce:b0:467:6eee:1138 with SMTP id d75a77b69052e-46e12a4a7bamr72560861cf.6.1737388007681;
        Mon, 20 Jan 2025 07:46:47 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e258c82a6sm24230501cf.59.2025.01.20.07.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:46:47 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v2 0/3] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Mon, 20 Jan 2025 10:46:44 -0500
Message-Id: <20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAORvjmcC/42NTQ6CMBCFr0Jm7Zj+BBVX3sOwaMsAk1AgLRAM6
 d2tnMDl916+9w6IFJgiPIsDAm0ceRozqEsBrjdjR8hNZlBClULKO/rosZtXbM06LNjyThFH2he
 sbqRF9RBKk4Ssz4HONtvvOnPPcZnC53za5C/9Y3STKNC6ymqtbNkI++q84eHqJg91SukLjY83x
 cAAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737388006; l=2714;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=lKYxJxxQvusCy8B0sZYN2iP5UpseVkNuNGCfUBuNbWw=;
 b=f7olHGP2Z1qbp+CTIun177dJ1Ntn9nRXTPCjKXceI0rQQ0OUsCtI3Md/ssDJM/frqEjSzshHy
 hqtiuQ1+59vB8KCwoMHx8rX0iYy3xcsxCtrxJQKSpnIDad2eWBW4ik7
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

Patch 1 fixes the first problem and is independent of the rest of the
series. Patch 3 fixes the second problem and is dependent on patch 2, so
there will have to be some cross-tree coordination.

I've rebased this series on the latest linux-next to avoid rebase
troubles.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v2:
- Remove unnecessary _irqsave when locking in IRQ handler (Robin)
- Reuse existing spinlock for CFIE manipulation (Robin)
- Lock CFCFG manipulation against concurrent CFIE manipulation
- Don't use timer to re-enable stall-on-fault. (Rob)
- Use more descriptive name for the function that re-enables
  stall-on-fault if the cooldown period has ended. (Rob)
- Link to v1: https://lore.kernel.org/r/20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com

---
Connor Abbott (3):
      iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Temporarily disable stall-on-fault after a page fault

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  4 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 42 +++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 24 ++++++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c            |  9 ++++++
 drivers/gpu/drm/msm/msm_mmu.h              |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 45 +++++++++++++++++++++++++++---
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 30 ++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
 9 files changed, 152 insertions(+), 6 deletions(-)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


