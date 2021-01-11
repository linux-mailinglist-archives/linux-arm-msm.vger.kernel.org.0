Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 778D82F17E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 15:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbhAKOQR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 09:16:17 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:53953 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbhAKOQQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 09:16:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610374559; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=w+2uMNXxN112PxORtVsQZgALEbiYUkUvV/hiqVroduU=; b=ZRNngGXXJXrfoNj22TiZN2QdFNo2JYbvyN4IbHhINH19P9KrU5EY7ZfbBqcO9lGUnf2BLX2Z
 gPSMHhHAHUUEfjaoG+4ItvQgsImD5Kcb+p2fsQtYpb/Ht47dZyAowD57JXcMWCoxhDiVhiLj
 lWzxz0PB0ikwsLqFwoSv6+13iQE=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ffc5d7b415a6293c5090b18 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 14:15:23
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3B1C8C4346F; Mon, 11 Jan 2021 14:15:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ABEC9C433C6;
        Mon, 11 Jan 2021 14:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ABEC9C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        isaacm@codeaurora.org
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        freedreno <freedreno@lists.freedesktop.org>,
        Kristian H Kristensen <hoegsberg@google.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 0/3] iommu/drm/msm: Allow non-coherent masters to use system cache
Date:   Mon, 11 Jan 2021 19:45:02 +0530
Message-Id: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
the memory type setting required for the non-coherent masters to use
system cache. Now that system cache support for GPU is added, we will
need to set the right PTE attribute for GPU buffers to be sys cached.
Without this, the system cache lines are not allocated for GPU.

So the patches in this series introduces a new prot flag IOMMU_LLC,
renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
and makes GPU the user of this protection flag.

The series slightly depends on following 2 patches posted earlier and
is based on msm-next branch:
 * https://lore.kernel.org/patchwork/patch/1363008/
 * https://lore.kernel.org/patchwork/patch/1363010/

Sai Prakash Ranjan (3):
  iommu/io-pgtable: Rename last-level cache quirk to
    IO_PGTABLE_QUIRK_PTW_LLC
  iommu/io-pgtable-arm: Add IOMMU_LLC page protection flag
  drm/msm: Use IOMMU_LLC page protection flag to map gpu buffers

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 drivers/gpu/drm/msm/msm_iommu.c         | 3 +++
 drivers/gpu/drm/msm/msm_mmu.h           | 4 ++++
 drivers/iommu/io-pgtable-arm.c          | 9 ++++++---
 include/linux/io-pgtable.h              | 6 +++---
 include/linux/iommu.h                   | 6 ++++++
 7 files changed, 26 insertions(+), 7 deletions(-)


base-commit: 00fd44a1a4700718d5d962432b55c09820f7e709
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

