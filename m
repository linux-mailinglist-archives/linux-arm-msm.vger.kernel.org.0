Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9D72C3096
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 20:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404232AbgKXTQK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 14:16:10 -0500
Received: from z5.mailgun.us ([104.130.96.5]:16726 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404228AbgKXTQK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 14:16:10 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606245369; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=5buuSHSoW4H28tI/ERKmRVeWEk8S64oetvKCFJleVEE=; b=gquk5NRgRn60YDSsDKrHOhUmsaCMTxigGMiE077OGKyIQ+DDAcpXyGhVa+aV38FIfUakUHR4
 EiAFgAbBmF1uoXUBWRb4Zogxf0TbCIIGENobomp+Gh5drGrSuHoFtu3YpoiqkDYyIeckwplF
 de+FxYmDW7Wm85wLGecO3g/6erk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fbd5bf91dba509aaeaf72df (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 19:16:09
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A8E6EC4331D; Tue, 24 Nov 2020 19:16:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5FE67C433ED;
        Tue, 24 Nov 2020 19:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5FE67C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] iommu/arm-smmu: adreno-smmu page fault handling
Date:   Tue, 24 Nov 2020 12:15:57 -0700
Message-Id: <20201124191600.2051751-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a stack to add an Adreno GPU specific handler for pagefaults. The first
patch starts by wiring up report_iommu_fault for arm-smmu. The next patch adds
a adreno-smmu-priv function hook to capture a handful of important debugging
registers such as TTBR0, CONTEXTIDR, FSYNR0 and others. This is used by the
third patch to print more detailed information on page fault such as the TTBR0
for the pagetable that caused the fault and the source of the fault as
determined by a combination of the FSYNR1 register and an internal GPU
register.

This code provides a solid base that we can expand on later for even more
extensive GPU side page fault debugging capabilities.

v2: Fix comment wording and function pointer check per Rob Clark

Jordan Crouse (3):
  iommu/arm-smmu: Add support for driver IOMMU fault handlers
  drm/msm: Add an adreno-smmu-priv callback to get pagefault info
  drm/msm: Improve the a6xx page fault handler

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 76 +++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_iommu.c            | 11 +++-
 drivers/gpu/drm/msm/msm_mmu.h              |  4 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 ++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 16 ++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 +
 include/linux/adreno-smmu-priv.h           | 31 ++++++++-
 8 files changed, 151 insertions(+), 12 deletions(-)

-- 
2.25.1

