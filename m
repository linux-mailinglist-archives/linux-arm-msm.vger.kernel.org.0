Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4467E2E68C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 22:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfE2UzI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 16:55:08 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55244 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbfE2UzI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 16:55:08 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 556C260E3E; Wed, 29 May 2019 20:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163306;
        bh=a10cqXD3K1rvMJw3L43nt+iaIhgdpjlzVZD15xJBhaA=;
        h=From:To:Cc:Subject:Date:From;
        b=Vp0ytwik6JEWAQFO/yG5VFu3Z6MkCfPENawBVa/y59bquj5SpgduvRjs2xXk0Pdrg
         xAShGzTeW+ZhTTQJhO/ke4tluOhH90QajK5uXiU5Odl6uJsGHhWHgplxm1hmnN+M9s
         WYMKWEjF49mjefdBuETfWF9op/mMPhoYsCjvOGFs=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 00F036030E;
        Wed, 29 May 2019 20:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163304;
        bh=a10cqXD3K1rvMJw3L43nt+iaIhgdpjlzVZD15xJBhaA=;
        h=From:To:Cc:Subject:Date:From;
        b=cSnhvA7BCJGATHq0sbtLanP6Lv34+whQEyH5M/1UWMBpLxrtk5CUaKV7c2SE1lSQd
         3/RMJ4i5inUbtIPaeQtlZgTz/sjprVqxt79t2tdd0hrHLlltv1Ng8V263HFJzEQIKv
         05ODYE8MeXimWoQrEpyB//MZ6ROo8rVnPKiBQOC0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00F036030E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org,
        Robin Murphy <robin.murphy@arm.com>,
        David Airlie <airlied@linux.ie>,
        Joerg Roedel <joro@8bytes.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Rob Clark <robdclark@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Will Deacon <will.deacon@arm.com>,
        Rob Herring <robh@kernel.org>,
        Wen Yang <wen.yang99@zte.com.cn>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Jonathan Marek <jonathan@marek.ca>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 00/16] drm/msm: Per-instance pagetable support
Date:   Wed, 29 May 2019 14:54:36 -0600
Message-Id: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is v3 of the per-instance pagetable support. Biggest change in this
revision is moving nearly all of the split pagetable support into
io-pgtable-arm and setting up specific ops to handle the unique behavior
of the split pagetables. Now that I've spent some time with it, I like how
it turned out.

For background:

Per-instance pagetables allow the target GPU driver to create and manage
an individual pagetable for each file descriptor instance and switch
between them asynchronously using the GPU to reprogram the pagetable
registers on the fly.

Most of the heavy lifting for this is done in the arm-smmu-v2 driver by
taking advantage of the newly added multiple domain API. The first patch in the
series allows opted-in clients to direct map a device with
iommu_request_dm_for_dev(). This bypasses the DMA domain creation in the IOMMU
core which serves several purposes for the GPU by skipping the otherwise unused
DMA domain and also keeping context bank 0 unused on the hardware (for better or
worse, the GPU is hardcoded to only use context bank 0 for switching).

The next several patches enable split pagetable support. This is used to map
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

Jordan Crouse (16):
  iommu/arm-smmu: Allow client devices to select direct mapping
  iommu: Add DOMAIN_ATTR_SPLIT_TABLES
  iommu/io-pgtable-arm: Add support for AARCH64 split pagetables
  iommu/arm-smmu: Add support for DOMAIN_ATTR_SPLIT_TABLES
  iommu: Add DOMAIN_ATTR_PTBASE
  iommu/arm-smmu: Add auxiliary domain support for arm-smmuv2
  drm/msm/adreno: Enable 64 bit mode by default on a5xx and a6xx targets
  drm/msm: Print all 64 bits of the faulting IOMMU address
  drm/msm: Pass the MMU domain index in struct msm_file_private
  drm/msm/gpu: Move address space setup to the GPU targets
  drm/msm: Add support for IOMMU auxiliary domains
  drm/msm: Add a helper function for a per-instance address space
  drm/msm: Add support to create target specific address spaces
  drm/msm/gpu: Add ttbr0 to the memptrs
  drm/msm/a6xx: Support per-instance pagetables
  drm/msm/a5xx: Support per-instance pagetables

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c     |  37 +++--
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c     |  50 ++++--
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c     |  51 ++++--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 163 ++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  19 +++
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  70 ++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 166 ++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   |   7 -
 drivers/gpu/drm/msm/msm_drv.c             |  25 ++-
 drivers/gpu/drm/msm/msm_drv.h             |   5 +
 drivers/gpu/drm/msm/msm_gem.h             |   2 +
 drivers/gpu/drm/msm/msm_gem_submit.c      |  13 +-
 drivers/gpu/drm/msm/msm_gem_vma.c         |  53 +++---
 drivers/gpu/drm/msm/msm_gpu.c             |  59 +------
 drivers/gpu/drm/msm/msm_gpu.h             |   3 +
 drivers/gpu/drm/msm/msm_iommu.c           |  99 +++++++++++-
 drivers/gpu/drm/msm/msm_mmu.h             |   4 +
 drivers/gpu/drm/msm/msm_ringbuffer.h      |   1 +
 drivers/iommu/arm-smmu.c                  | 176 ++++++++++++++++++--
 drivers/iommu/io-pgtable-arm.c            | 261 +++++++++++++++++++++++++++---
 drivers/iommu/io-pgtable.c                |   1 +
 include/linux/io-pgtable.h                |   2 +
 include/linux/iommu.h                     |   2 +
 24 files changed, 1082 insertions(+), 188 deletions(-)

-- 
2.7.4

