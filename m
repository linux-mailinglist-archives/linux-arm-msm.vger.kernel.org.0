Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D224820B999
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 22:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbgFZUBL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 16:01:11 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:46131 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725952AbgFZUBL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 16:01:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593201669; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=2y+LNzdtIXMVi5k8g41Y/QCp9p15+fIgDTNq1kYZi3c=; b=BZxCep74p8HzWXyDrDDWdGo0Bg4ewQWGnuOhx+dZI2dos8ChmPMB2i943M0YkhZmcCu639rB
 FS83z6FlS4PyuqXdPM+lnJS335/PTwzUzkO4m7pzjuNkT1UBb9Jbr+AJgqLW1Bi7+X5LQIrc
 G6AyzTl4kKEXTanIp/pF2hd2Qq8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5ef653f0e144dd5115d681ef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Jun 2020 20:00:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A3E24C43395; Fri, 26 Jun 2020 20:00:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 13B03C433C8;
        Fri, 26 Jun 2020 20:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 13B03C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     John Stultz <john.stultz@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sean Paul <sean@poorly.run>, Shawn Guo <shawn.guo@linaro.org>,
        Takashi Iwai <tiwai@suse.de>, Will Deacon <will@kernel.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/7] iommu/arm-smmu: Enable split pagetable support
Date:   Fri, 26 Jun 2020 14:00:34 -0600
Message-Id: <20200626200042.13713-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Another iteration of the split-pagetable support for arm-smmu and the Adreno GPU
SMMU. After email discussions [1] we opted to make a arm-smmu implementation for
specifically for the Adreno GPU and use that to enable split pagetable support
and later other implementation specific bits that we need.

On the hardware side this is very close to the same code from before [2] only
the TTBR1 quirk is turned on by the implementation and not a domain attribute.
In drm/msm we use the returned size of the aperture as a clue to let us know
which virtual address space we should use for global memory objects.

There are two open items that you should be aware of. First, in the
implementation specific code we have to check the compatible string of the
device so that we only enable TTBR1 for the GPU (SID 0) and not the GMU (SID 4).
I went back and forth trying to decide if I wanted to use the compatible string
or the SID as the filter and settled on the compatible string but I could be
talked out of it.

The other open item is that in drm/msm the hardware only uses 49 bits of the
address space but arm-smmu expects the address to be sign extended all the way
to 64 bits. This isn't a problem normally unless you look at the hardware
registers that contain a IOVA and then the upper bits will be zero. I opted to
restrict the internal drm/msm IOVA range to only 49 bits and then sign extend
right before calling iommu_map / iommu_unmap. This is a bit wonky but I thought
that matching the hardware would be less confusing when debugging a hang.

v9: Fix bot-detected merge conflict
v7: Add attached device to smmu_domain to pass to implementation specific
functions

[1] https://lists.linuxfoundation.org/pipermail/iommu/2020-May/044537.html
[2] https://patchwork.kernel.org/patch/11482591/


Jordan Crouse (7):
  iommu/arm-smmu: Pass io-pgtable config to implementation specific
    function
  iommu/arm-smmu: Add support for split pagetables
  dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
  iommu/arm-smmu: Add a pointer to the attached device to smmu_domain
  iommu/arm-smmu: Add implementation for the adreno GPU SMMU
  drm/msm: Set the global virtual address range from the IOMMU domain
  arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU

 .../devicetree/bindings/iommu/arm,smmu.yaml   |  4 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 13 +++++-
 drivers/gpu/drm/msm/msm_iommu.c               |  7 +++
 drivers/iommu/arm-smmu-impl.c                 |  6 ++-
 drivers/iommu/arm-smmu-qcom.c                 | 45 ++++++++++++++++++-
 drivers/iommu/arm-smmu.c                      | 38 +++++++++++-----
 drivers/iommu/arm-smmu.h                      | 30 ++++++++++---
 8 files changed, 120 insertions(+), 25 deletions(-)

-- 
2.17.1

