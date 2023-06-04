Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 715BA721A82
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 00:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjFDWAa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 18:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjFDWA3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 18:00:29 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34053AC
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 15:00:28 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F38743E761;
        Mon,  5 Jun 2023 00:00:25 +0200 (CEST)
Date:   Mon, 5 Jun 2023 00:00:24 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: clean up dpu_kms_get_clk_rate() returns
Message-ID: <kpxutvwb57ufiveujewgzqotnnx6xgdcws5e5r6lpl6qipadh7@umn3l2l2z3j3>
References: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-26 14:51:59, Dan Carpenter wrote:
> Static analysis tools complain about the -EINVAL error code being
> stored in an unsigned variable.  Let's change this to match
> the clk_get_rate() function which is type unsigned long and returns
> zero on error.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: In v1 I change the type to int which was wrong.  This is a different
>     approach.  CC the freedreno list this time too.

Just like v1, should we clean up the <= in
dpu_encoder_phys_cmd_tearcheck_config (to just `if (!vsync_hz)`),
because doing a <=0 on a u32 has a more limited meaning?

> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0e7a68714e9e..25e6a15eaf9f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -979,13 +979,13 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
>  	return 0;
>  }
>  
> -u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
> +unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
>  {
>  	struct clk *clk;
>  
>  	clk = msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, clock_name);
>  	if (!clk)
> -		return -EINVAL;
> +		return 0;
>  
>  	return clk_get_rate(clk);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index aca39a4689f4..961918e5a5b3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -201,6 +201,6 @@ void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
>   *
>   * Return: current clock rate

Or 0 if this clock is not available/present.

- Marijn

>   */
> -u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
> +unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
>  
>  #endif /* __dpu_kms_H__ */
> -- 
> 2.39.2
> 
