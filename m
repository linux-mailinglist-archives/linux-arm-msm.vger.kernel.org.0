Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A5920E690
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404312AbgF2Vsl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:48:41 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:59599 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726710AbgF2Sfm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 14:35:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593455742; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=MMgpD5DCLQ6JjRpMGo318xv/+oipR7QB8aPXFQoSC2I=; b=Wx4C/jltK/bKfrhrmVziMkUyLwQUcSz0LR3m6+JGUdF08s1pD7CwY/HE2b53zAA4Ss5lvQg6
 ocv5t3ComfEZsmoUODb9qbm2xlLM0CnguWTA8qw5zDfqaaUlYpYn9+mE7nK5exTHl7vBG3sn
 58PgimDu8pN16NtW2F6gmupok6E=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5efa0e694c9690533a5f0fc0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Jun 2020 15:53:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8BDA9C433B1; Mon, 29 Jun 2020 15:53:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 467E3C433CA;
        Mon, 29 Jun 2020 15:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 467E3C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv3 0/7] System Cache support for GPU and required SMMU support
Date:   Mon, 29 Jun 2020 21:22:43 +0530
Message-Id: <cover.1593344119.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some hardware variants contain a system cache or the last level
cache(llc). This cache is typically a large block which is shared
by multiple clients on the SOC. GPU uses the system cache to cache
both the GPU data buffers(like textures) as well the SMMU pagetables.
This helps with improved render performance as well as lower power
consumption by reducing the bus traffic to the system memory.

The system cache architecture allows the cache to be split into slices
which then be used by multiple SOC clients. This patch series is an
effort to enable and use two of those slices perallocated for the GPU,
one for the GPU data buffers and another for the GPU SMMU hardware
pagetables.

Patch 1 adds a init_context_bank implementation hook to set SCTLR.HUPCF.
Patch 2,3,6,7 adds system cache support in SMMU and GPU driver.
Patch 4 and 5 are minor cleanups for arm-smmu impl.

Changes in v3:
 * Fix domain attribute setting to before iommu_attach_device()
 * Fix few code style and checkpatch warnings
 * Rebase on top of Jordan's latest split pagetables and per-instance
   pagetables support [1][2]

Changes in v2:
 * Addressed review comments and rebased on top of Jordan's split
   pagetables series

[1] https://lore.kernel.org/patchwork/cover/1264446/
[2] https://lore.kernel.org/patchwork/cover/1264460/

Jordan Crouse (1):
  iommu/arm-smmu: Add a init_context_bank implementation hook

Sai Prakash Ranjan (4):
  iommu/io-pgtable-arm: Add support to use system cache
  iommu/arm-smmu: Add domain attribute for system cache
  iommu: arm-smmu-impl: Remove unwanted extra blank lines
  iommu: arm-smmu-impl: Convert to use of_match_node() for qcom impl

Sharat Masetty (2):
  drm/msm: rearrange the gpu_rmw() function
  drm/msm/a6xx: Add support for using system cache(LLC)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 23 ++++++-
 drivers/gpu/drm/msm/msm_drv.c           |  8 +++
 drivers/gpu/drm/msm/msm_drv.h           |  1 +
 drivers/gpu/drm/msm/msm_gpu.h           |  5 +-
 drivers/gpu/drm/msm/msm_iommu.c         |  3 +
 drivers/gpu/drm/msm/msm_mmu.h           |  4 ++
 drivers/iommu/arm-smmu-impl.c           | 13 ++--
 drivers/iommu/arm-smmu-qcom.c           | 13 ++++
 drivers/iommu/arm-smmu.c                | 46 +++++++++-----
 drivers/iommu/arm-smmu.h                | 13 ++++
 drivers/iommu/io-pgtable-arm.c          |  7 ++-
 include/linux/io-pgtable.h              |  4 ++
 include/linux/iommu.h                   |  1 +
 15 files changed, 198 insertions(+), 28 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

