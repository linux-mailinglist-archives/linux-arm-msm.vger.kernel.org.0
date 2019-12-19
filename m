Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1C812632A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 14:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbfLSNPf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 08:15:35 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:12092 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726701AbfLSNPf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 08:15:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576761334; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MatkvjJ++f5xYHSRzGDp53AIHwv/yYm+qCfukmt6X8c=; b=WBEsie5qD8V1QFu0vEUNXyOIBhTPqPzkbz5gXWG5W+2oTNbCoU4L1eDqpVhZPjzYRJFbQH6f
 f0v7xcrusPUWITE59ruu6a800pv+rTIu3B3w44R1z2EcrneHYJUUCq0Y+4ur7slaRcSD3C1y
 0Ap1gDVdWKeIk1NI/RQrDMDAgA0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfb77f3.7fc3d169fe68-smtp-out-n03;
 Thu, 19 Dec 2019 13:15:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0DE6BC447A4; Thu, 19 Dec 2019 13:15:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 15F0AC447A3;
        Thu, 19 Dec 2019 13:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 15F0AC447A3
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
Subject: [PATCH 0/5] drm/msm/a6xx: System Cache Support
Date:   Thu, 19 Dec 2019 18:44:41 +0530
Message-Id: <1576761286-20451-1-git-send-email-smasetty@codeaurora.org>
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

To enable the system cache driver, add [1] to your stack if not already
present. Please review.

[1] https://lore.kernel.org/patchwork/patch/1165298/

Jordan Crouse (1):
  iommu/arm-smmu: Pass io_pgtable_cfg to impl specific init_context

Sharat Masetty (3):
  drm/msm: rearrange the gpu_rmw() function
  drm/msm: Pass mmu features to generic layers
  drm/msm/a6xx: Add support for using system cache(LLC)

Vivek Gautam (1):
  iommu/arm-smmu: Add domain attribute for QCOM system cache

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 122 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |   9 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |   2 +-
 drivers/gpu/drm/msm/msm_drv.c           |   8 +++
 drivers/gpu/drm/msm/msm_drv.h           |   1 +
 drivers/gpu/drm/msm/msm_gpu.c           |   6 +-
 drivers/gpu/drm/msm/msm_gpu.h           |   6 +-
 drivers/gpu/drm/msm/msm_iommu.c         |  13 ++++
 drivers/gpu/drm/msm/msm_mmu.h           |  14 ++++
 drivers/iommu/arm-smmu-impl.c           |   3 +-
 drivers/iommu/arm-smmu-qcom.c           |  10 +++
 drivers/iommu/arm-smmu.c                |  25 +++++--
 drivers/iommu/arm-smmu.h                |   4 +-
 include/linux/iommu.h                   |   1 +
 19 files changed, 216 insertions(+), 20 deletions(-)

--
1.9.1
