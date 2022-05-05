Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCCB51BD32
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 12:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355552AbiEEKb0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 06:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355944AbiEEKbY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 06:31:24 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 98A6D53B45
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 03:27:35 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16515106F;
        Thu,  5 May 2022 03:27:35 -0700 (PDT)
Received: from [10.57.80.111] (unknown [10.57.80.111])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 247E73FA27;
        Thu,  5 May 2022 03:27:33 -0700 (PDT)
Message-ID: <91f3c385-9d6d-faef-384e-1d87e507c1f2@arm.com>
Date:   Thu, 5 May 2022 11:27:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 5/5] drm/msm: switch msm_kms_init_aspace() to use
 device_iommu_mapped()
Content-Language: en-GB
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
 <20220505001605.1268483-6-dmitry.baryshkov@linaro.org>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220505001605.1268483-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-05 01:16, Dmitry Baryshkov wrote:
> Change msm_kms_init_aspace() to use generic function
> device_iommu_mapped() instead of the fwnode-specific interface
> dev_iommu_fwspec_get(). While we are at it, stop referencing
> platform_bus_type directly and use the bus of the IOMMU device.

FWIW, I'd have squashed these changes across the previous patches, such 
that the dodgy fwspec calls are never introduced in the first place, but 
it's your driver, and if that's the way you want to work it and Rob's 
happy with it too, then fine by me.

For the end result,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

I'm guessing MDP4 could probably use msm_kms_init_aspace() now as well, 
but unless there's any other reason to respin this series, that's 
something we could do as a follow-up. Thanks for sorting this out!

Robin.

> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 98ae0036ab57..2fc3f820cd59 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -272,21 +272,21 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>   	struct device *mdss_dev = mdp_dev->parent;
>   	struct device *iommu_dev;
>   
> -	domain = iommu_domain_alloc(&platform_bus_type);
> -	if (!domain) {
> -		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
> -		return NULL;
> -	}
> -
>   	/*
>   	 * IOMMUs can be a part of MDSS device tree binding, or the
>   	 * MDP/DPU device.
>   	 */
> -	if (dev_iommu_fwspec_get(mdp_dev))
> +	if (device_iommu_mapped(mdp_dev))
>   		iommu_dev = mdp_dev;
>   	else
>   		iommu_dev = mdss_dev;
>   
> +	domain = iommu_domain_alloc(iommu_dev->bus);
> +	if (!domain) {
> +		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
> +		return NULL;
> +	}
> +
>   	mmu = msm_iommu_new(iommu_dev, domain);
>   	if (IS_ERR(mmu)) {
>   		iommu_domain_free(domain);
