Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A25B120FC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 17:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfLPQia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 11:38:30 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:13320 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726191AbfLPQiG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 11:38:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576514285; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Vr7DeB6UN1uAvIEGB/iA7hx6Y0Q4rdMGj2xmO945Nsw=; b=Gti3OzSyO504AsFcnMO+BSoRAUju9kmJyv/Epg3jk/Lo1BiYRt0fuuDz/4coV5ymtlCjsow9
 q+6D0Hp1A9bQh/onGrJdieOsgkJKrOazdacmFX5foQzHzGESukKAUsiaKD3VsZ7HNsLdLc4V
 9MmgusrheVfmz9gWxbHw3N+hqmo=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df7b2ea.7f6221e54490-smtp-out-n03;
 Mon, 16 Dec 2019 16:38:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D1352C447A3; Mon, 16 Dec 2019 16:37:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DE5A9C433CB;
        Mon, 16 Dec 2019 16:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DE5A9C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     iommu@lists.linux-foundation.org
Cc:     robin.murphy@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
        Fritz Koenig <frkoenig@google.com>,
        David Airlie <airlied@linux.ie>,
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
        zhengbin <zhengbin13@huawei.com>, linux-kernel@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Drew Davenport <ddavenport@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 0/5] iommu/arm-smmu: Split pagetable support for arm-smmu-v2
Date:   Mon, 16 Dec 2019 09:37:46 -0700
Message-Id: <1576514271-15687-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Another refresh to support split pagetables for Adreno GPUs as part of an
incremental process to enable per-context pagetables.

In order to support per-context pagetables the GPU needs to enable split tables
so that we can store global buffers in the TTBR1 space leaving the GPU free to
program the TTBR0 register with the address of a context specific pagetable.

This patchset adds split pagetable support if requested by the domain owner
via the DOMAIN_ATTR_SPLIT_TABLES attribute. If the attribute is non zero at
attach time, the implementation will set up the TTBR0 and TTBR1 spaces with
identical configurations and program the domain pagetable into the TTBR1
register. The TTBR0 register will be unused.

The driver can determine if split pagetables were programmed by querying
DOMAIN_ATTR_SPLIT_TABLES after attaching. The domain geometry will also be
updated to reflect the virtual address space for the TTBR1 range.

These patches are on based on top of linux-next-20191216 with [1], [2], and [3]
from Robin on the iommu list.

Change log:

v3: Remove the implementation specific and make split pagetable support
part of the generic configuration

[1] https://lists.linuxfoundation.org/pipermail/iommu/2019-October/039718.html
[2] https://lists.linuxfoundation.org/pipermail/iommu/2019-October/039719.html
[3] https://lists.linuxfoundation.org/pipermail/iommu/2019-October/039720.html


Jordan Crouse (5):
  iommu: Add DOMAIN_ATTR_SPLIT_TABLES
  iommu/arm-smmu: Add support for split pagetables
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
 drivers/gpu/drm/msm/msm_gem_vma.c        | 37 +++++------------------
 drivers/gpu/drm/msm/msm_gpu.c            | 49 ++----------------------------
 drivers/gpu/drm/msm/msm_gpu.h            |  4 +--
 drivers/gpu/drm/msm/msm_gpummu.c         |  6 ----
 drivers/gpu/drm/msm/msm_iommu.c          | 18 ++++++-----
 drivers/gpu/drm/msm/msm_mmu.h            |  1 -
 drivers/iommu/arm-smmu.c                 | 40 +++++++++++++++++++++----
 drivers/iommu/arm-smmu.h                 | 45 ++++++++++++++++++++++++----
 include/linux/iommu.h                    |  1 +
 21 files changed, 215 insertions(+), 153 deletions(-)

-- 
2.7.4
