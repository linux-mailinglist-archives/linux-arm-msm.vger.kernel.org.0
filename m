Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52A3896903
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 21:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730774AbfHTTHE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 15:07:04 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45040 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729833AbfHTTGo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 15:06:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6D55660DAA; Tue, 20 Aug 2019 19:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566328002;
        bh=JVOA+N1GY0FZQY7fgH8GBUcQtg09RuZemNa9uGbRUB4=;
        h=From:To:Cc:Subject:Date:From;
        b=GhcQ6qV6B8kUwkoMoqFmXdP63+d43ElRbdPfJYL4xk/YM9xcOLLnl0LYYps5D2CDD
         Esz6sMkXkB4SZufol9P10r5OLOwicA5bJsfHdUZgeKorPp0SP4okjKShVgVGDv0goI
         yiEwTPGL6q5UPU0Ebt8/TFBJgF1zf9RvlxUn/BmM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E2A2A608FC;
        Tue, 20 Aug 2019 19:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566327999;
        bh=JVOA+N1GY0FZQY7fgH8GBUcQtg09RuZemNa9uGbRUB4=;
        h=From:To:Cc:Subject:Date:From;
        b=M3Z+8dS+lEFL8B05ojyqH3qIFG+culCff2FSu0EKY/ry/7K1KKZg7C+hKtsTsrbnv
         r7SpMsyJIV9oQxPSzEoaALo1KWXvI5skX+lAVXXVB5SrxlSgeY4eBsNUb67pkptlr6
         71/65oHOvbmE6FBMuD0JfkDviPqBoXzhgDZmtu5M=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E2A2A608FC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org,
        Fritz Koenig <frkoenig@google.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Joerg Roedel <joro@8bytes.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
        Wen Yang <wen.yang99@zte.com.cn>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        Bruce Wang <bzwang@chromium.org>, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Boris Brezillon <bbrezillon@kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/7] iommu/arm-smmu: Split pagetable support for Adreno GPUs
Date:   Tue, 20 Aug 2019 13:06:25 -0600
Message-Id: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is another iteration to support split pagetables for Adreno GPUs as part of
an incremental process to enable per-context pagetables.

In order to support per-context pagetables the GPU needs to enable split
pagetables so that we can store the global buffers in the TTBR1 space leaving
the GPU free to program the TTBR0 register with the page address of a context
specific pt.

Previous revisions of this series can be found at [1] and [2].

This iteration is built on top of the arm-smmu-impl and arm-smmu-v2
rework code from Robin Murphy [3] and [4].

This code is based on the realization that when split pagetables are enabled the
configuration for the T1 address space is identical to that of the T0 space,
so we can just take the TCR configuration provided by io-pgtable, duplicate it
and shift it by 16 bits.

Since the current split pagetable implementation is specific to the Adreno
GPUs we can also take a small shortcut and only allow split pagetables for SMMUs
with a 49 bit upstream bus which allows us to use the default configuration
for the sign extension bit and we can avoid a lot of extra code to handle
different upstream bus sizes that will never get used.

The first patch implements the split pagetable support for arm-smmu-v2.

The second adds a SMMU model for the Adreno GPU SMMU and enables the split
pagetables if conditions warrant.

The 3rd and 4th patches add a domain attribute to query the status of split
pagetables.

The remaining patches modify drm/msm slightly to allow a6xx targets to
recognize if split pagetables are enabled and adjust the address space
accordingly.

This series only includes support for split pagetables because I wanted to get
this out for discussion and I haven't ported over the aux domain code to this
kernel version, but I don't suspect it will end up being much different than
previous versions [5].

[1] https://patchwork.freedesktop.org/series/63403/
[2] https://patchwork.freedesktop.org/series/64874/
[3] https://lists.linuxfoundation.org/pipermail/iommu/2019-August/037905.html
[4] https://lists.linuxfoundation.org/pipermail/iommu/2019-August/038244.html
[5] https://patchwork.freedesktop.org/patch/307601/


Jordan Crouse (7):
  iommu/arm-smmu: Support split pagetables
  dt-bindings: arm-smmu: Add Adreno GPU variant
  iommu/arm-smmu: Add a SMMU variant for the Adreno GPU
  iommu: Add DOMAIN_ATTR_SPLIT_TABLES
  iommu/arm-smmu: Support DOMAIN_ATTR_SPLIT_TABLES
  drm/msm: Create the msm_mmu object independently from the address
    space
  drm/msm: Use per-target functions to set up address spaces

 .../devicetree/bindings/iommu/arm,smmu.txt         |  7 +++
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              | 28 +++++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |  1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 56 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            | 43 ++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 16 ++++---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           | 16 ++++---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |  4 --
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           | 13 ++++-
 drivers/gpu/drm/msm/msm_drv.h                      |  8 +---
 drivers/gpu/drm/msm/msm_gem_vma.c                  | 30 ++----------
 drivers/gpu/drm/msm/msm_gpu.c                      | 51 ++------------------
 drivers/gpu/drm/msm/msm_gpu.h                      |  4 +-
 drivers/iommu/arm-smmu-impl.c                      | 15 ++++++
 drivers/iommu/arm-smmu.c                           | 46 ++++++++++++++++--
 drivers/iommu/arm-smmu.h                           |  2 +
 include/linux/iommu.h                              |  1 +
 20 files changed, 237 insertions(+), 111 deletions(-)

-- 
2.7.4

