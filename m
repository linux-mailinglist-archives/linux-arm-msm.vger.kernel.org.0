Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E50F26EA4E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 09:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjDUHgA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 03:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjDUHf7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 03:35:59 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC54D139
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 00:35:57 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 67E053ED5F;
        Fri, 21 Apr 2023 09:35:55 +0200 (CEST)
Date:   Fri, 21 Apr 2023 09:35:54 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: stop mapping the regdma region
Message-ID: <cwy7eyop2heahqvlijp6a66acwhpfcg6feq2khfw2detul6fxk@qnkhj4iwo23k>
References: <20230420222558.1208887-1-dmitry.baryshkov@linaro.org>
 <20230420222558.1208887-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420222558.1208887-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-04-21 01:25:58, Dmitry Baryshkov wrote:
> Stop mapping the regdma region. The driver does not support regdma.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Should you add a third patch to remove this from dt-bindings?
(msm8998 has it in both dpu and mdss files)

Regardless, the patch itself is:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 ------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 2 +-
>  2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0e7a68714e9e..28d74d4d2c1d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1033,12 +1033,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  		DPU_DEBUG("VBIF NRT is not defined");
>  	}
>  
> -	dpu_kms->reg_dma = msm_ioremap_quiet(dpu_kms->pdev, "regdma");
> -	if (IS_ERR(dpu_kms->reg_dma)) {
> -		dpu_kms->reg_dma = NULL;
> -		DPU_DEBUG("REG_DMA is not defined");
> -	}
> -
>  	dpu_kms_parse_data_bus_icc_path(dpu_kms);
>  
>  	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index aca39a4689f4..15111e433f21 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -71,7 +71,7 @@ struct dpu_kms {
>  	const struct dpu_mdss_cfg *catalog;
>  
>  	/* io/register spaces: */
> -	void __iomem *mmio, *vbif[VBIF_MAX], *reg_dma;
> +	void __iomem *mmio, *vbif[VBIF_MAX];
>  
>  	struct regulator *vdd;
>  	struct regulator *mmagic;
> -- 
> 2.39.2
> 
