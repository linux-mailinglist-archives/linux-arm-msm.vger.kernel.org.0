Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FD32A9CB3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 19:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgKFSwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 13:52:08 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:57526 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgKFSwI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 13:52:08 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 062A720071;
        Fri,  6 Nov 2020 19:52:03 +0100 (CET)
Date:   Fri, 6 Nov 2020 19:52:02 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Wang Qing <wangqing@vivo.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: Use IS_ERR() instead of null pointer check
Message-ID: <20201106185202.GA808798@ravnborg.org>
References: <1604629881-557-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604629881-557-1-git-send-email-wangqing@vivo.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=1WtWmnkvAAAA:8 a=e5mUnYsNAAAA:8
        a=u0hbGyvj-nib5C6JQ3MA:9 a=CjuIK1q_8ugA:10 a=-_UHfarfsM-RsASml2Jt:22
        a=Vxmtnl_E_bksehYqCbjh:22
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Wang.

Thanks for the fix.

On Fri, Nov 06, 2020 at 10:31:19AM +0800, Wang Qing wrote:
> a6xx_gmu_get_mmio() never return null in case of error, but ERR_PTR(),
> so we should use IS_ERR() instead of null pointer check
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>

In the future please put "drm/<driver-dir>:" in the subject.
See git log . in said directory for normal practice - this let the
readers see this is an msm related patch.



> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 491fee4..8c81a89
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -492,7 +492,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	void __iomem *seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
>  	uint32_t pdc_address_offset;
>  
> -	if (!pdcptr || !seqptr)
> +	if (IS_ERR(pdcptr) || IS_ERR(seqptr))
>  		goto err;

When the pointer is checked after the err: label the function
IS_ERR_OR_NULL() is used. Please update both places so they match.

	Sam

>  
>  	if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
