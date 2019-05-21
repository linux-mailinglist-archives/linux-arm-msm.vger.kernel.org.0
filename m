Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29D2F25540
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 18:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbfEUQOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 12:14:22 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57796 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbfEUQOU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 12:14:20 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7BAF261214; Tue, 21 May 2019 16:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455259;
        bh=XEaXjrXY1Q6Wd+gJ+WxNDOVUYRY8dVm52md5PI1E1n4=;
        h=From:To:Cc:Subject:Date:From;
        b=ik6eh05W5KR8dIOkZwS5x/+44oL5c7JEG1U158zWbPiS0Mw+pSU0P5PwWNLuWpdfA
         aI4tESub6TiMTESlfksmXGdNe9aOO+1dpl5F6rHUlzjfd5efOg43Xtzsq1KKGp8T9j
         wSQme0BKwEOf/zp2YhuvAYH4I/kSqTk0+ErIniCg=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E3EA6087F;
        Tue, 21 May 2019 16:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455250;
        bh=XEaXjrXY1Q6Wd+gJ+WxNDOVUYRY8dVm52md5PI1E1n4=;
        h=From:To:Cc:Subject:Date:From;
        b=PSPgUd79z8v7c0MBhbxiaVungiKnYR6C62UdL/lcaxsCYzg1sTL8UQQvzS2QpH7Y+
         i4ep3OTg7o2XVCF85yUuw4mca3UjOup1LdccPZf9s6IwXvycn1zgXApCCMN+m5fxdr
         6hXcxWeBPpVqXI0L+6UU2qQ54AOiDhZZzZGaM2Go=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5E3EA6087F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Kees Cook <keescook@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Wen Yang <wen.yang99@zte.com.cn>, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Will Deacon <will.deacon@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>
Subject: [PATCH v2 00/15] drm/msm: Per-instance pagetable support
Date:   Tue, 21 May 2019 10:13:48 -0600
Message-Id: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a refresh of the per-instance pagetable support for arm-smmu-v2 and the
MSM GPU driver. I think this is pretty mature at this point, so I've dropped the
RFC designation and ask for consideration for 5.3.

Per-instance pagetables allow the target GPU driver to create and manage
an individual pagetable for each file descriptor instance and switch
between them asynchronously using the GPU to reprogram the pagetable
registers on the fly.

Most of the heavy lifting for this is done in the arm-smmu-v2 driver by
taking advantage of the newly added multiple domain API. The first patch in the
series allows opted-in clients to create a default identity domain when the
IOMMU group for the SMMU device is created. This bypasses the DMA domain
creation in the IOMMU core which serves several purposes for the GPU by skipping
the otherwise  unused DMA domain and also keeping context bank 0 unused on the
hardware (for better or worse, the GPU is hardcoded to only use context bank 0
for switching).

The next two patches enable split pagetable support. This is used to map
global buffers for the GPU so we can safely switch the TTBR0 pagetable for the
instance.

The last two arm-smmu-v2 patches enable auxillary domain support. Again the
SMMU client can opt-in to allow auxiliary domains, and if enabled will create
a pagetable but not otherwise touch the hardware. The client can get the address
of the pagetable through an attribute to perform its own switching.

After the arm-smmu-v2 patches are more than several msm/gpu patches to allow
for target specific address spaces, enable 64 bit virtual addressing and
implement the mechanics of pagetable switching.

For the purposes of merging all the patches between

drm/msm/adreno: Enable 64 bit mode by default on a5xx and a6xx targets

and

drm/msm: Add support to create target specific address spaces

can be merged to the msm-next tree without dependencies on the IOMMU changes.
Only the last three patches will require coordination between the two areas.

Jordan Crouse (15):
  iommu/arm-smmu: Allow IOMMU enabled devices to skip DMA domains
  iommu: Add DOMAIN_ATTR_SPLIT_TABLES
  iommu/arm-smmu: Add split pagetable support for arm-smmu-v2
  iommu: Add DOMAIN_ATTR_PTBASE
  iommu/arm-smmu: Add auxiliary domain support for arm-smmuv2
  drm/msm/adreno: Enable 64 bit mode by default on a5xx and a6xx targets
  drm/msm: Print all 64 bits of the faulting IOMMU address
  drm/msm: Pass the MMU domain index in struct msm_file_private
  drm/msm/gpu: Move address space setup to the GPU targets
  drm/msm: Add a helper function for a per-instance address space
  drm/msm/gpu: Add ttbr0 to the memptrs
  drm/msm: Add support to create target specific address spaces
  drm/msm: Add support for IOMMU auxiliary domains
  drm/msm/a6xx: Support per-instance pagetables
  drm/msm/a5xx: Support per-instance pagetables

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c     |  37 +++-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c     |  50 +++--
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c     |  51 +++--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 163 +++++++++++++-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  19 ++
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  70 ++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 166 +++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   |   7 -
 drivers/gpu/drm/msm/msm_drv.c             |  25 ++-
 drivers/gpu/drm/msm/msm_drv.h             |   5 +
 drivers/gpu/drm/msm/msm_gem.h             |   2 +
 drivers/gpu/drm/msm/msm_gem_submit.c      |  13 +-
 drivers/gpu/drm/msm/msm_gem_vma.c         |  53 +++--
 drivers/gpu/drm/msm/msm_gpu.c             |  59 +----
 drivers/gpu/drm/msm/msm_gpu.h             |   3 +
 drivers/gpu/drm/msm/msm_iommu.c           |  99 ++++++++-
 drivers/gpu/drm/msm/msm_mmu.h             |   4 +
 drivers/gpu/drm/msm/msm_ringbuffer.h      |   1 +
 drivers/iommu/arm-smmu-regs.h             |  19 ++
 drivers/iommu/arm-smmu.c                  | 352 +++++++++++++++++++++++++++---
 drivers/iommu/io-pgtable-arm.c            |   3 +-
 drivers/iommu/iommu.c                     |  29 ++-
 include/linux/iommu.h                     |   5 +
 24 files changed, 1052 insertions(+), 184 deletions(-)

-- 
2.7.4

