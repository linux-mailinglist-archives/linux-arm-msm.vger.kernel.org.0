Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7374D624705
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 17:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231829AbiKJQbL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 11:31:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231826AbiKJQbJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 11:31:09 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D0DD3326E6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 08:31:07 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD8F31042
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 08:31:13 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 689153F703
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 08:31:07 -0800 (PST)
Date:   Thu, 10 Nov 2022 16:30:45 +0000
From:   Liviu Dudau <liviu.dudau@arm.com>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     james.qian.wang@arm.com, mihail.atanassov@arm.com,
        brian.starkey@arm.com, airlied@gmail.com, daniel@ffwll.ch,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
        mripard@kernel.org, vladimir.lypak@gmail.com,
        quic_akhilpo@quicinc.com, dianders@chromium.org, olvaffe@gmail.com,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 4/5] drm/komeda: Fix IS_ERR() vs NULL check in
 komeda_component_get_avail_scaler()
Message-ID: <Y20nNWA1U+vJBl9y@e110455-lin.cambridge.arm.com>
References: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
 <20221110094445.2930509-5-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221110094445.2930509-5-cuigaosheng1@huawei.com>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 10, 2022 at 05:44:44PM +0800, Gaosheng Cui wrote:
> The komeda_pipeline_get_state() returns an ERR_PTR() on failure, we should
> use IS_ERR() to check the return value.
> 
> Fixes: 502932a03fce ("drm/komeda: Add the initial scaler support for CORE")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for the fix!

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> index 3276a3e82c62..e9c92439398d 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> @@ -259,7 +259,7 @@ komeda_component_get_avail_scaler(struct komeda_component *c,
>  	u32 avail_scalers;
>  
>  	pipe_st = komeda_pipeline_get_state(c->pipeline, state);
> -	if (!pipe_st)
> +	if (IS_ERR(pipe_st))
>  		return NULL;
>  
>  	avail_scalers = (pipe_st->active_comps & KOMEDA_PIPELINE_SCALERS) ^
> -- 
> 2.25.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
