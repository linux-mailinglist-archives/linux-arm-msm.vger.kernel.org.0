Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE5462578F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 11:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbiKKKC0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 05:02:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbiKKKCZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 05:02:25 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6191FB872
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 02:02:24 -0800 (PST)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A0E6F3EE66;
        Fri, 11 Nov 2022 11:02:20 +0100 (CET)
Date:   Fri, 11 Nov 2022 11:02:18 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     james.qian.wang@arm.com, liviu.dudau@arm.com,
        mihail.atanassov@arm.com, brian.starkey@arm.com, airlied@gmail.com,
        daniel@ffwll.ch, robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
        mripard@kernel.org, vladimir.lypak@gmail.com,
        quic_akhilpo@quicinc.com, dianders@chromium.org, olvaffe@gmail.com,
        angelogioacchino.delregno@somainline.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in
 msm_icc_get()
Message-ID: <20221111100218.6h47vtyu67ovda3d@SoMainline.org>
References: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
 <20221110094445.2930509-4-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110094445.2930509-4-cuigaosheng1@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-11-10 17:44:43, Gaosheng Cui wrote:
> The of_icc_get() function returns NULL or error pointers on error path,
> so we should use IS_ERR_OR_NULL() to check the return value.
> 
> Fixes: 5ccdcecaf8f7 ("drm/msm: lookup the ICC paths in both mdp5/dpu and mdss devices")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/gpu/drm/msm/msm_io_utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index d02cd29ce829..950083b2f092 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -133,7 +133,7 @@ struct icc_path *msm_icc_get(struct device *dev, const char *name)
>  	struct icc_path *path;
>  
>  	path = of_icc_get(dev, name);
> -	if (path)
> +	if (IS_ERR_OR_NULL(path))

NAK. This path should be returned if it is NON-NULL, otherwise we defer
to of_icc_get() on the parent device.  See the code-comment below.

- Marijn

>  		return path;
>  
>  	/*
> -- 
> 2.25.1
> 
