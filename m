Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 585FE855AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 00:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbfHGWVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 18:21:49 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37748 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbfHGWVt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 18:21:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B6CA6608BA; Wed,  7 Aug 2019 22:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565216507;
        bh=JrXJYfR7OdbsMs6A8nQtELu4a/CLP38j/wkYUh2M0hU=;
        h=From:To:Cc:Subject:Date:From;
        b=lEEILuS/jBLqLBROfvI0SUyogMjpBVWybpjyoEM3L7mba+dAAkw+J0flxZsqVDAib
         mg9Su7aICL22vL7xc5+1My5FyrOBqsTVYjU+uqEZfI1dowyiLdMxCwyxgC8GUzQ4jg
         H3FyrbnJavZo6zKXq4WslfLLUW/H9M9PO138WgnE=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 906AF60208;
        Wed,  7 Aug 2019 22:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565216504;
        bh=JrXJYfR7OdbsMs6A8nQtELu4a/CLP38j/wkYUh2M0hU=;
        h=From:To:Cc:Subject:Date:From;
        b=BMz2D2uMljPCVrJz3Hv0xbOq51J/gbDucu3HyzydzaCDx7CBDj0OClpGor3Ps7DW9
         /DI9yx9PRBSlyd8ry1fY+4PxD5lOn6j5P/+yXSl1/+wvKFfCCo4Kkhn0bmv0VXU3hG
         9u51P08ZTEqNKWQ+8dsANbmCK1hxTGV1B25pIwsw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 906AF60208
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        robin.murphy@arm.com, Will Deacon <will@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/2] iommu/arm-smmu: Split pagetable support
Date:   Wed,  7 Aug 2019 16:21:38 -0600
Message-Id: <1565216500-28506-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

(Sigh, resend. I freaked out my SMTP server)

This is part of an ongoing evolution for enabling split pagetable support for
arm-smmu. Previous versions can be found [1].

In the discussion for v2 Robin pointed out that this is a very Adreno specific
use case and that is exactly true. Not only do we want to configure and use a
pagetable in the TTBR1 space, we also want to configure the TTBR0 region but
not allocate a pagetable for it or touch it until the GPU hardware does so. As
much as I want it to be a generic concept it really isn't.

This revision leans into that idea. Most of the same io-pgtable code is there
but now it is wrapped as an Adreno GPU specific format that is selected by the
compatible string in the arm-smmu device.

Additionally, per Robin's suggestion we are skipping creating a TTBR0 pagetable
to save on wasted memory.

This isn't as clean as I would like it to be but I think that this is a better
direction than trying to pretend that the generic format would work.

I'm tempting fate by posting this and then taking some time off, but I wanted
to try to kick off a conversation or at least get some flames so I can try to
refine this again next week. Please take a look and give some advice on the
direction.

[1] https://patchwork.freedesktop.org/series/63403/

Jordan


Jordan Crouse (2):
  iommu/io-pgtable-arm: Add support for ARM_ADRENO_GPU_LPAE io-pgtable
    format
  iommu/arm-smmu: Add support for Adreno GPU pagetable formats

 drivers/iommu/arm-smmu.c       |   8 +-
 drivers/iommu/io-pgtable-arm.c | 214 ++++++++++++++++++++++++++++++++++++++---
 drivers/iommu/io-pgtable.c     |   1 +
 include/linux/io-pgtable.h     |   2 +
 4 files changed, 209 insertions(+), 16 deletions(-)

-- 
2.7.4

