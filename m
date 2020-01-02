Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1232C12E54D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 12:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbgABLC2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 06:02:28 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:51448 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728044AbgABLC2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 06:02:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577962947; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=tkKCPLe79npIk6waelmBeTcR6XDop2zkLNOKqt/0Dq0=; b=vqtR9tmy8Bzb2zM8BZPnIcLzZgo8YCHm5IFn1xDUdajTkmkRfqeZ6zlgTBBjoeY/cFHhV6lZ
 t5xOSzcjxXfhQswauhJWgrLmgUT1jvt6MRdTRezQ1fHuwM5aQ9J+3mBp/l0tZvgpGUc7+7YU
 f45RTAI+nRRmXKz6mKPVkxeeq3Q=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0dcdc2.7f9514158618-smtp-out-n01;
 Thu, 02 Jan 2020 11:02:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4CBD6C447A0; Thu,  2 Jan 2020 11:02:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9813C43383;
        Thu,  2 Jan 2020 11:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9813C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux-foundation.org, jcrouse@codeaurora.org,
        saiprakash.ranjan@codeaurora.org,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH v2 0/7] drm/msm/a6xx: System Cache Support
Date:   Thu,  2 Jan 2020 16:32:06 +0530
Message-Id: <1577962933-13577-1-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some hardware variants contain a system level cache or the last level
cache(llc). This cache is typically a large block which is shared by multiple
clients on the SOC. GPU uses the system cache to cache both the GPU data
buffers(like textures) as well the SMMU pagetables. This helps with
improved render performance as well as lower power consumption by reducing
the bus traffic to the system memory.

The system cache architecture allows the cache to be split into slices which
then be used by multiple SOC clients. This patch series is an effort to enable
and use two of those slices perallocated for the GPU, one for the GPU data
buffers and another for the GPU SMMU hardware pagetables.

v2: Code reviews and rebased code on top of Jordan's split pagetables series

To enable the system cache driver, add [1] to your stack if not already
present. Please review.

[1] https://lore.kernel.org/patchwork/patch/1165298/

Jordan Crouse (3):
  iommu/arm-smmu: Pass io_pgtable_cfg to impl specific init_context
  drm/msm: Attach the IOMMU device during initialization
  drm/msm: Refactor address space initialization

Sharat Masetty (3):
  drm: msm: a6xx: Properly free up the iommu objects
  drm/msm: rearrange the gpu_rmw() function
  drm/msm/a6xx: Add support for using system cache(LLC)

Vivek Gautam (1):
  iommu/arm-smmu: Add domain attribute for QCOM system cache

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c    |  16 ++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c    |   1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c    |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c    |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 124 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h    |   3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  |  23 ++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |   8 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  19 ++---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  19 ++---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c |   4 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  19 +++--
 drivers/gpu/drm/msm/msm_drv.c            |   8 ++
 drivers/gpu/drm/msm/msm_drv.h            |   9 +--
 drivers/gpu/drm/msm/msm_gem_vma.c        |  37 ++-------
 drivers/gpu/drm/msm/msm_gpu.c            |  49 +-----------
 drivers/gpu/drm/msm/msm_gpu.h            |   9 +--
 drivers/gpu/drm/msm/msm_gpummu.c         |   7 --
 drivers/gpu/drm/msm/msm_iommu.c          |  22 +++---
 drivers/gpu/drm/msm/msm_mmu.h            |   5 +-
 drivers/iommu/arm-smmu-impl.c            |   3 +-
 drivers/iommu/arm-smmu-qcom.c            |  10 +++
 drivers/iommu/arm-smmu.c                 |  25 +++++--
 drivers/iommu/arm-smmu.h                 |   4 +-
 include/linux/iommu.h                    |   1 +
 25 files changed, 269 insertions(+), 158 deletions(-)

--
1.9.1
