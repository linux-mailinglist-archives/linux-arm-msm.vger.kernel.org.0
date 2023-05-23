Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 868F870DDE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 15:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbjEWNtC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 09:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235087AbjEWNtB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 09:49:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5441109
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 06:49:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5CAA561FDF
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 13:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71F3C433D2;
        Tue, 23 May 2023 13:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684849739;
        bh=NTXNAEYRC729bO09Athl6/NXyhWGp0b1YxIqNLFCfKs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s1GnXgYwXOPH9hJGCEDmGxo1RLtnRrKDRKAaHV0I7pS09+AaDfItwvZhDrZMK43zT
         wmsr0yeyepMxuaGGuwABAC+TAbX17jzmS63xaIexMyTm4t4cbbL9fafXLiTNhVf0DK
         boGxcEvTVkAZbvHvR5S7bloIkEsChED96znIJ8D4OmxPo0Gztw9TVAdZyJm+W5TYWv
         g/4C0sCLSJGw86nOGbB7bBDXdRxCrvzpemMUaIOO88mINcYFXajM9xxuiRPXqRHD7t
         XKZk4wvd5wamtd0bxy/H84cL9Efo/asn+ojc7bzqd1QAXfLcqgLsIo/hmj9J70RdrB
         SG2qZ06hbEf0A==
Date:   Tue, 23 May 2023 08:48:56 -0500
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] drm/msm/a6xx: don't set IO_PGTABLE_QUIRK_ARM_OUTER_WBWA
 with coherent SMMU
Message-ID: <7omqnqomhvyqu6md4pqcj74nuh6btrsua4od66hx245fyc2477@rdpvskytxmud>
References: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 10, 2023 at 09:52:26PM +0300, Dmitry Baryshkov wrote:
> If the Adreno SMMU is dma-coherent, allocation will fail unless we
> disable IO_PGTABLE_QUIRK_ARM_OUTER_WBWA. Skip setting this quirk for the
> coherent SMMUs (like we have on sm8350 platform).
> 
> Fixes: 54af0ceb7595 ("arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes")
> Reported-by: David Heidelberg <david@ixit.cz>

I don't see this patch in linux-next yet, would it be possible to get it
picked up? I ran into this on sc8280xp as well.

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2942d2548ce6..f74495dcbd96 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1793,7 +1793,8 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>  	 * This allows GPU to set the bus attributes required to use system
>  	 * cache on behalf of the iommu page table walker.
>  	 */
> -	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> +	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice) &&
> +	    !device_iommu_capable(&pdev->dev, IOMMU_CAP_CACHE_COHERENCY))
>  		quirks |= IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
>  
>  	return adreno_iommu_create_address_space(gpu, pdev, quirks);
> -- 
> 2.39.2
> 
