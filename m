Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0894270CD11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 23:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234406AbjEVV6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 17:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234157AbjEVV6B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 17:58:01 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF1ADB
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 14:57:59 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9EA0B3F094;
        Mon, 22 May 2023 23:57:57 +0200 (CEST)
Date:   Mon, 22 May 2023 23:57:56 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/6] drm/msm/dpu: inline __intr_offset
Message-ID: <yrsznvh3iduylo6e44dswgmxfqaa2oqeotbcs2ut4ce3txy5ch@n7qugbshmgbh>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
 <20230522214527.190054-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522214527.190054-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-23 00:45:23, Dmitry Baryshkov wrote:
> Inline __intr_offset(), there is no point in having a separate oneline
> function for setting base block address.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 5e2d68ebb113..0776b0f6df4f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -435,12 +435,6 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
>  	return intr_status;
>  }
>  
> -static void __intr_offset(const struct dpu_mdss_cfg *m,
> -		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
> -{
> -	hw->blk_addr = addr + m->mdp[0].base;
> -}
> -
>  struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>  		const struct dpu_mdss_cfg *m)
>  {
> @@ -454,7 +448,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>  	if (!intr)
>  		return ERR_PTR(-ENOMEM);
>  
> -	__intr_offset(m, addr, &intr->hw);
> +	intr->hw.blk_addr = addr + m->mdp[0].base;
>  
>  	intr->total_irqs = nirq;
>  

We could also drop the two newlines here and make these member
assignments sit clearly/tightly together.

- Marijn

> -- 
> 2.39.2
> 
