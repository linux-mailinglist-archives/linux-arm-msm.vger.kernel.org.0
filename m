Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61023AC104
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 04:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhFRCxs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 22:53:48 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:24291 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbhFRCxr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 22:53:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623984699; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=h94uAFwOguwZLJlxTLEP5BFckVyjb0G/BGZn9OAppnU=; b=cq93cQdS3uJ0swZyLW4HEtCm/o9yL+XW0hzL78xMxfY5rPc9IyEcY7Vt9gBv5ys9hQhSL0/8
 hP6UZGso9i50G0MCCQDpm4UMtRP1K7k3RgejMarvCGek6OJy7xMB71Ag36M4GM7HWNDgmh5N
 bT63/95WZ8DysLOABD1W8tHf5H4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60cc0a2aed59bf69ccb33bfa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 02:51:22
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 56AE8C43217; Fri, 18 Jun 2021 02:51:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A7DFBC433D3;
        Fri, 18 Jun 2021 02:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A7DFBC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 0/3] iommu/io-pgtable: Optimize partial walk flush for large scatter-gather list
Date:   Fri, 18 Jun 2021 08:21:02 +0530
Message-Id: <cover.1623981933.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently for iommu_unmap() of large scatter-gather list with page size
elements, the majority of time is spent in flushing of partial walks in
__arm_lpae_unmap() which is a VA based TLB invalidation invalidating
page-by-page on iommus like arm-smmu-v2 (TLBIVA) which do not support
range based invalidations like on arm-smmu-v3.2.

For example: to unmap a 32MB scatter-gather list with page size elements
(8192 entries), there are 16->2MB buffer unmaps based on the pgsize (2MB
for 4K granule) and each of 2MB will further result in 512 TLBIVAs (2MB/4K)
resulting in a total of 8192 TLBIVAs (512*16) for 16->2MB causing a huge
overhead.

So instead use tlb_flush_all() callback (TLBIALL/TLBIASID) to invalidate
the entire context for partial walk flush on select few platforms where
cost of over-invalidation is less than unmap latency using the newly
introduced quirk IO_PGTABLE_QUIRK_TLB_INV_ALL. We also do this for
non-strict mode given its all about over-invalidation saving time on
individual unmaps and non-deterministic generally.

For this example of 32MB scatter-gather list unmap, this results in just
16 ASID based TLB invalidations (TLBIASIDs) as opposed to 8192 TLBIVAs
thereby increasing the performance of unmaps drastically.

Test on QTI SM8150 SoC for 10 iterations of iommu_{map_sg}/unmap:
(average over 10 iterations)

Before this optimization:

    size        iommu_map_sg      iommu_unmap
      4K            2.067 us         1.854 us
     64K            9.598 us         8.802 us
      1M          148.890 us       130.718 us
      2M          305.864 us        67.291 us
     12M         1793.604 us       390.838 us
     16M         2386.848 us       518.187 us
     24M         3563.296 us       775.989 us
     32M         4747.171 us      1033.364 us

After this optimization:

    size        iommu_map_sg      iommu_unmap
      4K            1.723 us         1.765 us
     64K            9.880 us         8.869 us
      1M          155.364 us       135.223 us
      2M          303.906 us         5.385 us
     12M         1786.557 us        21.250 us
     16M         2391.890 us        27.437 us
     24M         3570.895 us        39.937 us
     32M         4755.234 us        51.797 us

This is further reduced once the map/unmap_pages() support gets in which
will result in just 1 TLBIASID as compared to 16 TLBIASIDs.

Real world data also shows big difference in unmap performance as below:

There were reports of camera frame drops because of high overhead in
iommu unmap without this optimization because of frequent unmaps issued
by camera of about 100MB/s taking more than 100ms thereby causing frame
drops.

Changes in v2:
 * Add a quirk to choose tlb_flush_all in partial walk flush
 * Set the quirk for QTI SoC implementation

Sai Prakash Ranjan (3):
  iommu/io-pgtable: Add a quirk to use tlb_flush_all() for partial walk
    flush
  iommu/io-pgtable: Optimize partial walk flush for large scatter-gather
    list
  iommu/arm-smmu-qcom: Set IO_PGTABLE_QUIRK_TLB_INV_ALL for QTI SoC impl

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 11 +++++++++++
 drivers/iommu/io-pgtable-arm.c             |  3 ++-
 include/linux/io-pgtable.h                 | 11 +++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

