Return-Path: <linux-arm-msm+bounces-45461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 744E9A15793
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 19:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8562D3A79C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 18:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F751A2545;
	Fri, 17 Jan 2025 18:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y40tqP+D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636F31A4B69
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 18:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737139660; cv=none; b=ArqkD3az9YliBQZXSIZyvZ8YoWDUXToYSAmxnqwQujjJV2nlASYEUR0ebbA7ZT/rNI/sUGCW3Fgi59FnXJTAYNGQStoK7on69CgQIQ1ej2OGg2nk2vn2b6Xew00Aj7bsdBPJ0M1HHAl+m7Ms4j5w5lcIMfWht0Us6z2a5riDIt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737139660; c=relaxed/simple;
	bh=wufxwIG7SZVGT+NpZWvu5eUyVT71GkroNC9AubeD6sU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KH7LRUZUfDlkyREjZZlD9vqmYCdCeawG/vKVuueE0h3Pml+++VAs5JRMFNYnxdYepxK9cr6DAS1DJXK/0cNc45fO0iFKbMEuCE75NW1Rh5eJGNBUu0QQp2fSIcp7vEtn9iY/4K3BjMHQKmpU+D164G9W/NTCn02U0i8mlyVNZ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y40tqP+D; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d8eacc4194so3396556d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 10:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737139657; x=1737744457; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ra6/FwxtS9APR+DM5MjQWhKeuNW85TPSbzZLBgVdyU=;
        b=Y40tqP+DDKHfOq9g+hYHCKz1Xgc7Lr83tbxT3g34ACpU+GWYBCFe7kn87FXQ0pPMs/
         7MANAH1MHiP28qKYTeK4mG4LXx8Tn+bHSdKTLnRawZlO2Gv7yhTjAW9QJ78WMKmhdy6c
         wMgFcgQIFKuWt8kjWT1YojPjGIAEh78pjz49Cp2d4pGeERo3IxReeXAAVvTN7uI5xkME
         9+qyWq/LLVIZVnBn3VS270KIMMeW2NNT18AhLr4J9XMHuboQvxydsZWsKEVIZPmAwkgB
         Z8lVYTDIj2+ol69IP1W4wlrMKtnYSdpuXCwxIUTcTpzentkWSiOWm9T0M22gCq6bmCw4
         8k3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737139657; x=1737744457;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ra6/FwxtS9APR+DM5MjQWhKeuNW85TPSbzZLBgVdyU=;
        b=YXRHymabPkPZN0Rr271yp19jhq4499Lhshb1z+PDZggLeZaZefoe/0m5xpeSbJMPxv
         9+ABObcxI3dphPYrJSMHM8ityYXxvS2sZTCt3B3ShYzcnFVhTsHAO58rC32fP1t9xAtU
         9DfMahvvWT/RX6ExSeIUz++84Y3A3MVmxTQnl6aVp0+LeN/y7Uy1ula2df7V5v5k6jN7
         T4zU3W72JrZj61grJTa9zB1ZJtuqVMZxwQkc2y2Wnr1lsNbnvRrjFFFKqkouYzGqqKpm
         5+wgFbP8wZ+RczsJPUkXfrm+6cR0KODSmxDMbnKSixG7nnXUv6GMBeUrS8Oc4MxZisQ9
         GSJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpjHZqopbga/1aACi06Rp3+u7TsXjzLrIAhhxE75uGqZhguCUY/bUEEuIo5gQbdHoxScIkEZzRgEF5MKhr@vger.kernel.org
X-Gm-Message-State: AOJu0YwBJlVj9xlaxXwLj6oo7s5tXmfjaMnwSrEFf8fgfBA/9N6XLJHk
	Bc9TV9FlJn9bYRG2rXSG5I7xC4wFyH0Jha+cL3wAqumSH5SogdM9
X-Gm-Gg: ASbGncsmJ49Dq1WXW8oerm7X/sMo7wjFLmg/jKwhK02H50hJicAXxCXw6T9tPoAJGzL
	9Gz4drXx7OGyu5gQXkaSIqOcWNEdrbAiuJrvvzJOdc9FOxVLdxl/rHJ/xEa42dO4R77ldBdih8c
	7s+WtCY5KzZCf8XFL4B4m/AcZ2NF6xlxdb3CrmdJChLvLaQK1Iiuzw3YnTVXeFE1J9ur25n8RHZ
	sbDrKc1EnFbkTE9qgxvbPo81dUQgG1DI3OtkU9MbRt5OLh+h0G/xCTiSUDs/KJylaY03ar6rT4y
	A6hfdU8dAcIwolA=
X-Google-Smtp-Source: AGHT+IHEGS3WMZchQKb6AiaCl+4ohD5OQ+8Gq4AMLYPZ/+pdqcNLdTJ3oItGfaDD1AJRyHaTYAAAVQ==
X-Received: by 2002:a05:6214:c82:b0:6d9:2fe3:bf0c with SMTP id 6a1803df08f44-6e1b2158965mr20166666d6.4.1737139657265;
        Fri, 17 Jan 2025 10:47:37 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd3859sm13992176d6.74.2025.01.17.10.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 10:47:36 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 0/3] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Fri, 17 Jan 2025 13:47:06 -0500
Message-Id: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKqlimcC/x3LSwqEMBBF0a1IjS1IIn63Ij0QfWqBRklpI4h7N
 zg8XO5NiiBQapKbAv6isvkImybUz52fwDJEkzMuN9aWvOrK037y2J3LwaNcUPa4Dq4LZKaujMt
 gKe57wFfj3f6e5wViwNJ/agAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737139656; l=2214;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=wufxwIG7SZVGT+NpZWvu5eUyVT71GkroNC9AubeD6sU=;
 b=RzjUDIZzgJrcKPPHCBVN/rS1IQljrG9wOjACFFGTOV2ahU8dMokrXTl3UGiT9YmU29Wrd+Hio
 +pb1RkanhupDPC3GvaEwsdahnKSFbIIkGWx35my0A19lFaiS/f1vahd
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
Connor Abbott (3):
      iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Temporarily disable stall-on-fault after a page fault

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  4 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 56 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 21 +++++++++++
 drivers/gpu/drm/msm/msm_iommu.c            |  9 +++++
 drivers/gpu/drm/msm/msm_mmu.h              |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 46 +++++++++++++++++++++---
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 32 +++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 +-
 9 files changed, 167 insertions(+), 6 deletions(-)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


