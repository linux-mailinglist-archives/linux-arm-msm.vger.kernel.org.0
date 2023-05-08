Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2BE46FBA1F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 23:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbjEHVnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 17:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234232AbjEHVn3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 17:43:29 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607DB83E3
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 14:43:20 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F3DA63F409;
        Mon,  8 May 2023 23:43:17 +0200 (CEST)
Date:   Mon, 8 May 2023 23:43:16 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 4/7] drm/msm/dpu: Fix slice_last_group_size calculation
Message-ID: <g55ej2gfdytjytzr66ngh4sg4yaqb4p6l2qjiqbmlplhz2jx75@sqj5iruga6c2>
References: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v6-4-cb7f59f0f7fb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v6-4-cb7f59f0f7fb@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-04-12 16:25:18, Jessica Zhang wrote:
> Correct the math for slice_last_group_size so that it matches the
> calculations downstream.
> 
> Changes in v3:
> - Reworded slice_last_group_size calculation to
>   `(dsc->slice_width + 2) % 3`
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index b952f7d2b7f5..ff1c8f92fb20 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -56,9 +56,10 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>  	if (is_cmd_mode)
>  		initial_lines += 1;
>  
> -	slice_last_group_size = 3 - (dsc->slice_width % 3);
> +	slice_last_group_size = (dsc->slice_width + 2) % 3;
> +
>  	data = (initial_lines << 20);
> -	data |= ((slice_last_group_size - 1) << 18);
> +	data |= (slice_last_group_size << 18);

Agreed, this matches the calculation found in newer downstream.  This
older calculation is only present in an older fbdev driver, and was
working for the only panel I was able to test because the new and the
old calculation result in the same value:

    3 - (720 % 3) - 1 = 2
    (720 + 2) % 3 = 2

The other two outcomes are flipped, and match the downstream switch-case
on slice_width % 3:

    0 -> 2
    1 -> 0
    2 -> 1

More importantly it is one of the fixes necessary to get DSC working on
my SM8150 and SM8250 devices [1].

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Thanks!

- Marijn

[1]: https://gitlab.freedesktop.org/drm/msm/-/issues/24#note_1899310

>  	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
>  	data |= (dsc->bits_per_pixel << 8);
>  	data |= (dsc->block_pred_enable << 7);
> 
> -- 
> 2.40.0
> 
