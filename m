Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7A814C279
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 23:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgA1WAr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 17:00:47 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:15103 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726257AbgA1WAj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 17:00:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580248838; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Mf6gK8Pui4SYiZYwgie2fpyV4QvxBlRoxDwIb21t6R0=; b=cTtOAObTzso2VFF5OMRg4MkjhB2JCC52OFc+Hjjq7xgMjQNFPlGa210qs0hFK534XTOGHqoD
 qTU1sSyeN2wgS5MKbG1bThOXUWKx8bCo2RSq9mYiJV1nXmAgXT5G6cTO7rEaWitOpo1Wzyj3
 7vY+ru8NDm5NN9NRV/JuIuxbjkE=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e30af04.7fa9e5dc7880-smtp-out-n02;
 Tue, 28 Jan 2020 22:00:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4BE32C447B3; Tue, 28 Jan 2020 22:00:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 914EAC43383;
        Tue, 28 Jan 2020 22:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 914EAC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     iommu@lists.linux-foundation.org
Cc:     robin.murphy@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
        Fritz Koenig <frkoenig@google.com>,
        David Airlie <airlied@linux.ie>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Allison Randal <allison@lohutok.net>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Wen Yang <wen.yang99@zte.com.cn>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Enrico Weigelt <info@metux.net>,
        zhengbin <zhengbin13@huawei.com>, linux-kernel@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Drew Davenport <ddavenport@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 0/5] iommu/arm-smmu: Split pagetable support for arm-smmu-v2
Date:   Tue, 28 Jan 2020 15:00:14 -0700
Message-Id: <1580248819-12644-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is another iteration for the split pagetable support based on the
suggestions from Robin and Will [1].

Background: In order to support per-context pagetables the GPU needs to enable
split tables so that we can store global buffers in the TTBR1 space leaving the
GPU free to program the TTBR0 register with the address of a context specific
pagetable.

If the DOMAIN_ATTR_SPLIT_TABLES attribute is set on the domain before attaching,
the context bank assigned to the domain will be programmed to allow translations
in the TTBR1 space. Translations in the TTBR0 region will be disallowed because,
as Robin pointe out, having a un-programmed TTBR0 register is dangerous.

The driver can determine if TTBR1 was successfully programmed by querying
DOMAIN_ATTR_SPLIT_TABLES after attaching. The domain geometry will also be
updated to reflect the virtual address space for the TTBR1 range.

Upcoming changes will allow auxiliary domains to be attached to the device which
will enable and program TTBR0.

This patchset is based on top of linux-next-20200127.

Change log:

v4: Only program TTBR1 when split pagetables are requested. TTBR0 will be
enabled later when an auxiliary domain is attached
v3: Remove the implementation specific and make split pagetable support
part of the generic configuration

[1] https://lists.linuxfoundation.org/pipermail/iommu/2020-January/041373.html

Jordan Crouse (5):
  iommu: Add DOMAIN_ATTR_SPLIT_TABLES
  iommu/arm-smmu: Add support for TTBR1
  drm/msm: Attach the IOMMU device during initialization
  drm/msm: Refactor address space initialization
  drm/msm/a6xx: Support split pagetables

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c    | 16 ++++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 51 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 23 ++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  8 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 18 ++++-------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 18 +++++------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c |  4 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 18 +++++------
 drivers/gpu/drm/msm/msm_drv.h            |  8 ++---
 drivers/gpu/drm/msm/msm_gem_vma.c        | 36 ++++------------------
 drivers/gpu/drm/msm/msm_gpu.c            | 49 ++----------------------------
 drivers/gpu/drm/msm/msm_gpu.h            |  4 +--
 drivers/gpu/drm/msm/msm_gpummu.c         |  6 ----
 drivers/gpu/drm/msm/msm_iommu.c          | 18 ++++++-----
 drivers/gpu/drm/msm/msm_mmu.h            |  1 -
 drivers/iommu/arm-smmu.c                 | 48 +++++++++++++++++++++++++-----
 drivers/iommu/arm-smmu.h                 | 22 ++++++++++----
 include/linux/iommu.h                    |  2 ++
 21 files changed, 198 insertions(+), 155 deletions(-)

-- 
2.7.4
