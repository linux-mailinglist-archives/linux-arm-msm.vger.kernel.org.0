Return-Path: <linux-arm-msm+bounces-45861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF90A19969
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 21:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA9997A084E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 20:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F991B6CE0;
	Wed, 22 Jan 2025 20:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/dxhnqi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5BA1607AC
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 20:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737576071; cv=none; b=SbAcpt10G76OTeCefBwETktqswEnHGf0UpOfGmOjircuZFVcHLDgSyam5Hb7DFjYLthfs1GawGD99XHy2epSj/G4WfZjacC0kmjUcrsZw8KyI1arf/jfCrsk0qM7wHmK2gKEFo5eM3sbeaabrFLHw8SG6mgQpsBcwzbqEZQxp58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737576071; c=relaxed/simple;
	bh=+WyN8FK5rY7qRc7VsIGAiJo2lnVpGPEuUicLFpDWETs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b7qjIdMakC82U4xUshLZAk+5t3f96czaMY05WnXo49v4Y6w+1Ufv8SlxPrtmMCtS936cAMmuXUmT14lmybYTVTUMaYWG8ggxn2FC9UfGKmsRxAqNS13pcehMrMpqUt9j5Y9ebcC1WHVypNHtU0S1Gk4goU3221tAWbr4XRba7w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/dxhnqi; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b6eadd2946so1362385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 12:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737576068; x=1738180868; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jurTTxyZurW5GCpnwp6J13h1Jad371IuO/OxoFLazdE=;
        b=R/dxhnqiXAUmWlHI7r4e/rQv0f92g2PLM0/PWINqZLjuWQh9MCSDZ7jDoqZ2KrIeTf
         W5p7xna22lKM7qBfErzj92Wd+Gpl6O55IbTkSkkPuhffS7tr6Rqboak2Nh8NxG9YwA+m
         E16Lg02Z4Zd4DiFvIkEHqqyekyu+uM3tVH2aBFJer5gsZXQhCMDW8fH+E6ZgpNtz0fY6
         QSXutdma+Z0mnDlq5PJlqKIuq6AnixuB3lv0EK8u1nfmPJU13l0LUsEqYOScO2FhilFw
         TrNOXDZMSWQD+EboS5dL690Z+tGOsORn4sdvAPRV7SWU6CvgJaNfpnK0yHH3LaNvCq4n
         OawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737576068; x=1738180868;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jurTTxyZurW5GCpnwp6J13h1Jad371IuO/OxoFLazdE=;
        b=X/yxkZR5dhZGWYhoEhj2JUJFZntv1IbBFd5zvcVUu2zW0XCs0MBwpbnPCSe6asyx+i
         PsYF/mA6PP0mlNSO1qLBpiB0qaT3RBtZf9nfRNs+JdI03dHL5RHeivt2hmwJiNEyV3sM
         3zx5oF8ykHIDMhj33JGJuDRHiKwWRwPhrDuimvQmTedEXKG1LWa3DiYI/Wrz8uieVah0
         76iH1uC6hEYPyzi6775348k8yl+uYlfuzu5Z9pAUuizEtzVM2n/Bpk3GBxgKWYRmTzor
         ixX9/kJ0+7kyPjBuWn5L6S7z7cA5omfWn0qGSxr1Ya/JNDo4GnasdTXuxLMmCT/D+aFm
         hdhA==
X-Forwarded-Encrypted: i=1; AJvYcCUzQBaFRyTpC2KfNPTo5VXIr78WnEHpMT+wKUZkqG9XM/BLvXzhSNEIveByiY90gB+Zibe8ihudkI/4dHuO@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+u4cg6W/Ya1PAdfp0ZDuxDQIIzB0W/gMP+ln6B2XIZ98VUYA
	8FTpWdLjJlBSp1ztTTdKDKboUQfKk4GaneKOMEvTy9KzybIRnpr1
X-Gm-Gg: ASbGnct05ECWbUrMAb4eYTlG5AWyH0+21qLMscovIwbogTts3w8k+ISg0C5paSRVUks
	D75TpITXpRml+evzdhqmnVS6Emi1oKNyaOp47t11hGj8e0BalHZh3Wd1qmEoTIzVI8zxwACHxCO
	KV9r+2f/GEKaNc4jIzqiscTwjx8gVR2sP15qmJHrVf4I9bJgn+FOtA/rghqm0/vRTL716CWNT17
	huCLbJsE1uQTzyZ7QnLZB9nF2GUKjNLONTLekOuw9WzLDebZsSvAjFoqTRL/v7H0WE1EGdNGgdS
	qKo44kjowQxcklODcVaB3APRvPpL
X-Google-Smtp-Source: AGHT+IHPM76iU6Z5PtzDIriPWj/nNzCyP2ix3l+fnM7JVaz7sX/vP0vOsO1NLQa7vmhO30zGz8RV4Q==
X-Received: by 2002:a05:620a:28ca:b0:7a9:a632:48ad with SMTP id af79cd13be357-7be6324e361mr1073763385a.11.1737576068474;
        Wed, 22 Jan 2025 12:01:08 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be6147e30asm694606385a.31.2025.01.22.12.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 12:01:08 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v3 0/3] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Wed, 22 Jan 2025 15:00:57 -0500
Message-Id: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHlOkWcC/43NPQ6DMAwF4KtUmevKcfgpnXqPqgMBA5EIoAQQF
 eLuDUxMVcf3rPd5FZ6dYS8el1U4no03fReCul5E0eRdzWDKkAUhxShlCtZbqIcJqnxqR6jMwh4
 6XkbIElaY3ZEUSxHmg+PjGtavd8iN8WPvPsenWe7tH+gsAUEXmVaKdFyiftY2N+2t6K3Y0ZlOE
 OEPiAJUJiopIqQUIzpD27Z9AdUaNRoJAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737576067; l=2962;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=+WyN8FK5rY7qRc7VsIGAiJo2lnVpGPEuUicLFpDWETs=;
 b=a4zT3xeEwtyC9Lok7bYUo82pNV1IICFMNUHKvQZdQPpSD93+dLg1/j5KSWHZfEPg9D0yl3UG5
 I8IDAG+Ikk+BU8oBibWzReXFAvKresl7KM82p7INLVNp/P+OYQJ5ccX
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
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 41 ++++++++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
 9 files changed, 162 insertions(+), 7 deletions(-)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


