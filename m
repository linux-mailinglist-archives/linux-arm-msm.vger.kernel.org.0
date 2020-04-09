Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07E9D1A3CE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 01:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgDIXeC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 19:34:02 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:63896 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727072AbgDIXeC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 19:34:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586475242; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=HLu3LXKVdwRi2myzF6VISXReouVgdhBst/ZOPq5Z52I=; b=eNbe1pDptanY0FYy2/b1d0ZtgZwGVTyMxjjOXcsWvwgdFtq9JOmQyjwHoh70UDkRxWlr8GMz
 at7+QlwcFTy343vZ15nTWoGAlItWXXxEEogiHjFnoCNUU5q7og4q4IhZ8UUsLwPMMMblkxT2
 kBXkb1zr0JwXotyKqBV4OLZXCJQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8fb0ea.7f4d407926f8-smtp-out-n05;
 Thu, 09 Apr 2020 23:34:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 93CC8C38557; Thu,  9 Apr 2020 23:33:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from localhost.localdomain (c-71-237-101-98.hsd1.co.comcast.net [71.237.101.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A0FF5C433D2;
        Thu,  9 Apr 2020 23:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A0FF5C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     iommu@lists.linux-foundation.org
Cc:     linux-arm-msm@vger.kernel.org, robin.murphy@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Drew Davenport <ddavenport@chromium.org>,
        Enrico Weigelt <info@metux.net>,
        Fabio Estevam <festevam@gmail.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Joerg Roedel <jroedel@suse.de>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Wen Yang <wen.yang99@zte.com.cn>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, tongtiangen <tongtiangen@huawei.com>,
        zhengbin <zhengbin13@huawei.com>
Subject: [PATCH v6 0/5] iommu/arm-smmu: Split pagetable support for arm-smmu-v2
Date:   Thu,  9 Apr 2020 17:33:45 -0600
Message-Id: <20200409233350.6343-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
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

This patchset is based on top of linux-next-20200409

Change log:

v6: Cleanups for the arm-smmu TTBR1 patch from Will Deacon
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

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c    | 16 ++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 51 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 23 ++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  8 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 18 +++------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 18 ++++-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c |  4 --
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 18 ++++-----
 drivers/gpu/drm/msm/msm_drv.h            |  8 +---
 drivers/gpu/drm/msm/msm_gem_vma.c        | 36 +++--------------
 drivers/gpu/drm/msm/msm_gpu.c            | 49 +----------------------
 drivers/gpu/drm/msm/msm_gpu.h            |  4 +-
 drivers/gpu/drm/msm/msm_gpummu.c         |  6 ---
 drivers/gpu/drm/msm/msm_iommu.c          | 18 +++++----
 drivers/gpu/drm/msm/msm_mmu.h            |  1 -
 drivers/iommu/arm-smmu.c                 | 48 ++++++++++++++++++----
 drivers/iommu/arm-smmu.h                 | 24 ++++++++---
 include/linux/iommu.h                    |  2 +
 21 files changed, 200 insertions(+), 155 deletions(-)

-- 
2.17.1
