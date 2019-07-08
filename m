Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA3B627FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2019 20:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729552AbfGHSKZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jul 2019 14:10:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53710 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728921AbfGHSKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jul 2019 14:10:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0499B602F0; Mon,  8 Jul 2019 18:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562609425;
        bh=RYakAtzfd68XjS32CGKsM0PJUck7IxLNDzXB/YezXpk=;
        h=From:To:Cc:Subject:Date:From;
        b=nzo2HGF31VxQFTF3dOkr3lAawdIBm572BTtiysNdUUrDlfsnj7MgSOZSCr2qYJZyu
         WTzxV9tpJKAmoWRFcBRJAMo/6k27R/u4ZCGaByfef0HdwP4bFuJtzIkIOYdQoEvdO0
         YOOzk22d7pEeBHVs3/rQVTY1jDYrPhzSPGSsz9tM=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D16A0602F0;
        Mon,  8 Jul 2019 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562609424;
        bh=RYakAtzfd68XjS32CGKsM0PJUck7IxLNDzXB/YezXpk=;
        h=From:To:Cc:Subject:Date:From;
        b=Ad8kI3O0+s4YwlFbID8kBOAt4b+HDkQfXy2QX0s0abp4uoLt2JeVkl/JMoUFDReJx
         QcUmPJrxrh2tq5JHtIuKztBpxSxPNlycZqPUsd7JE2ThrlOES8O+KGPYSfOAjdK2/g
         eM6KtmEGxjI1Fjn3YPRMS2eXN4+9Rr+RgTxFDfmk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D16A0602F0
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        dianders@chromimum.org, hoegsberg@google.com,
        baolu.lu@linux.intel.com, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] iommu/arm-smmu: Split pagetable support
Date:   Mon,  8 Jul 2019 12:10:15 -0600
Message-Id: <1562609418-25446-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series implements split pagetable support for arm-smmu-v2 devices. You have
seen this code before as part of [1] but I split it from the other features
to make it easier to review / merge.

This series adds a new format type to io-pgtable-arm to enable TTBR0 and
TTBR1. Because of the way that the registers are mixed up it makes the most
sense to enable them together instead of trying to create two different
pagetables and merge them together later in the arm-smmu drive.

This will be used later by the drm/msm driver to enable split pagetables
as part of the effort to implement per-context pagetables [2].

Thanks,
Jordan

[1] https://patchwork.freedesktop.org/series/57441/
[2] https://patchwork.freedesktop.org/patch/307616/?series=57441&rev=3

Jordan Crouse (3):
  iommu: Add DOMAIN_ATTR_SPLIT_TABLES
  iommu/io-pgtable-arm: Add support for AARCH64 split pagetables
  iommu/arm-smmu: Add support for DOMAIN_ATTR_SPLIT_TABLES

 drivers/iommu/arm-smmu.c       |  16 ++-
 drivers/iommu/io-pgtable-arm.c | 261 +++++++++++++++++++++++++++++++++++++----
 drivers/iommu/io-pgtable.c     |   1 +
 include/linux/io-pgtable.h     |   2 +
 include/linux/iommu.h          |   1 +
 5 files changed, 256 insertions(+), 25 deletions(-)

-- 
2.7.4

