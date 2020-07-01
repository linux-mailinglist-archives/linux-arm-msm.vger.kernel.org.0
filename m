Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081C32108FD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 12:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729847AbgGAKLH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 06:11:07 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:26034 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729793AbgGAKLH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 06:11:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593598266; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=amiqoJGPjX9RNHOLVHTe5Q2mOjhh5iGIl3d/MtXJOIs=;
 b=klJWoWQj2Memq5yCwOsgscVbjLRTXuQKSZKwTXxTsBas6yfpx/UCmToaAzbt3H0QdzS9u/Ws
 m40mWJw3jNTzr50hjGX25nE5felUcxTK4nYuFy0kKmoVpSYGyvzJg3tjwojh74D7nlpmiA8E
 Qnl9QzhpdwqI6A8m9GWHIK3frrk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5efc6139117610c7ff405ea8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Jul 2020 10:11:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2A470C433AD; Wed,  1 Jul 2020 10:11:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B6F35C433C8;
        Wed,  1 Jul 2020 10:11:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 01 Jul 2020 15:41:03 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>,
        freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Shawn Guo <shawn.guo@linaro.org>, Takashi Iwai <tiwai@suse.de>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v9 0/7] iommu/arm-smmu: Enable split pagetable support
In-Reply-To: <20200626200042.13713-1-jcrouse@codeaurora.org>
References: <20200626200042.13713-1-jcrouse@codeaurora.org>
Message-ID: <bdc2a4348230f430138d320e49e188c0@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Will, Robin,

On 2020-06-27 01:30, Jordan Crouse wrote:
> Another iteration of the split-pagetable support for arm-smmu and the 
> Adreno GPU
> SMMU. After email discussions [1] we opted to make a arm-smmu 
> implementation for
> specifically for the Adreno GPU and use that to enable split pagetable 
> support
> and later other implementation specific bits that we need.
> 
> On the hardware side this is very close to the same code from before 
> [2] only
> the TTBR1 quirk is turned on by the implementation and not a domain 
> attribute.
> In drm/msm we use the returned size of the aperture as a clue to let us 
> know
> which virtual address space we should use for global memory objects.
> 
> There are two open items that you should be aware of. First, in the
> implementation specific code we have to check the compatible string of 
> the
> device so that we only enable TTBR1 for the GPU (SID 0) and not the GMU 
> (SID 4).
> I went back and forth trying to decide if I wanted to use the 
> compatible string
> or the SID as the filter and settled on the compatible string but I 
> could be
> talked out of it.
> 
> The other open item is that in drm/msm the hardware only uses 49 bits 
> of the
> address space but arm-smmu expects the address to be sign extended all 
> the way
> to 64 bits. This isn't a problem normally unless you look at the 
> hardware
> registers that contain a IOVA and then the upper bits will be zero. I 
> opted to
> restrict the internal drm/msm IOVA range to only 49 bits and then sign 
> extend
> right before calling iommu_map / iommu_unmap. This is a bit wonky but I 
> thought
> that matching the hardware would be less confusing when debugging a 
> hang.
> 
> v9: Fix bot-detected merge conflict
> v7: Add attached device to smmu_domain to pass to implementation 
> specific
> functions
> 
> [1] 
> https://lists.linuxfoundation.org/pipermail/iommu/2020-May/044537.html
> [2] https://patchwork.kernel.org/patch/11482591/
> 
> 
> Jordan Crouse (7):
>   iommu/arm-smmu: Pass io-pgtable config to implementation specific
>     function
>   iommu/arm-smmu: Add support for split pagetables
>   dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
>   iommu/arm-smmu: Add a pointer to the attached device to smmu_domain
>   iommu/arm-smmu: Add implementation for the adreno GPU SMMU
>   drm/msm: Set the global virtual address range from the IOMMU domain
>   arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
> 
>  .../devicetree/bindings/iommu/arm,smmu.yaml   |  4 ++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 13 +++++-
>  drivers/gpu/drm/msm/msm_iommu.c               |  7 +++
>  drivers/iommu/arm-smmu-impl.c                 |  6 ++-
>  drivers/iommu/arm-smmu-qcom.c                 | 45 ++++++++++++++++++-
>  drivers/iommu/arm-smmu.c                      | 38 +++++++++++-----
>  drivers/iommu/arm-smmu.h                      | 30 ++++++++++---
>  8 files changed, 120 insertions(+), 25 deletions(-)

Any chance reviewing this?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
