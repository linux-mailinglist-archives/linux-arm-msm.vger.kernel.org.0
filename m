Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E00D507BA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 23:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357892AbiDSVHA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 17:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357459AbiDSVG7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 17:06:59 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9CBBD31DCD
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 14:04:15 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62A6113D5;
        Tue, 19 Apr 2022 14:04:15 -0700 (PDT)
Received: from [10.57.41.251] (unknown [10.57.41.251])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A408C3F766;
        Tue, 19 Apr 2022 14:04:12 -0700 (PDT)
Message-ID: <6f3e772f-73aa-17b1-8cca-082039a905f1@arm.com>
Date:   Tue, 19 Apr 2022 22:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm: Revert "drm/msm: Stop using iommu_present()"
Content-Language: en-GB
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20220419130422.1033699-1-dmitry.baryshkov@linaro.org>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220419130422.1033699-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-10.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-04-19 14:04, Dmitry Baryshkov wrote:
> This reverts commit e2a88eabb02410267519b838fb9b79f5206769be. The commit
> in question makes msm_use_mmu() check whether the DRM 'component master'
> device is translated by the IOMMU. At this moment it is the 'mdss'
> device.
> However on platforms using the MDP5 driver (e.g. MSM8916/APQ8016,
> MSM8996/APQ8096) it's the mdp5 device, which has the iommus property
> (and thus is "translated by the IOMMU"). This results in these devices
> being broken with the following lines in the dmesg.
> 
> [drm] Initialized msm 1.9.0 20130625 for 1a00000.mdss on minor 0
> msm 1a00000.mdss: [drm:adreno_request_fw] loaded qcom/a300_pm4.fw from new location
> msm 1a00000.mdss: [drm:adreno_request_fw] loaded qcom/a300_pfp.fw from new location
> msm 1a00000.mdss: [drm:get_pages] *ERROR* could not get pages: -28
> msm 1a00000.mdss: could not allocate stolen bo
> msm 1a00000.mdss: [drm:get_pages] *ERROR* could not get pages: -28
> msm 1a00000.mdss: [drm:msm_alloc_stolen_fb] *ERROR* failed to allocate buffer object
> msm 1a00000.mdss: [drm:msm_fbdev_create] *ERROR* failed to allocate fb
> 
> Getting the mdp5 device pointer from this function is not that easy at
> this moment. Thus this patch is reverted till the MDSS rework [1] lands.
> It will make the mdp5/dpu1 device component master and the check will be
> legit.
> 
> [1] https://patchwork.freedesktop.org/series/98525/

Oh, DRM...

If that series is going to land got 5.19, could you please implement the 
correct equivalent of this patch within it?

I'm fine with the revert for now if this patch doesn't work properly in 
all cases, but I have very little sympathy left for DRM drivers riding 
roughshod over all the standard driver model abstractions because 
they're "special". iommu_present() *needs* to go away, so if it's left 
to me to have a second go at fixing this driver next cycle, you're 
liable to get some abomination based on of_find_compatible_node() or 
similar, and I'll probably be demanding an ack to take it through the 
IOMMU tree ;)

Thanks,
Robin.

> Fixes: e2a88eabb024 ("drm/msm: Stop using iommu_present()")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index b6702b0fafcb..e2b5307b2360 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -263,7 +263,7 @@ bool msm_use_mmu(struct drm_device *dev)
>   	struct msm_drm_private *priv = dev->dev_private;
>   
>   	/* a2xx comes with its own MMU */
> -	return priv->is_a2xx || device_iommu_mapped(dev->dev);
> +	return priv->is_a2xx || iommu_present(&platform_bus_type);
>   }
>   
>   static int msm_init_vram(struct drm_device *dev)
