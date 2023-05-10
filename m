Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 514AD6FD6FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 May 2023 08:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjEJGZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 May 2023 02:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233875AbjEJGZr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 May 2023 02:25:47 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF38B3A93
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 23:25:46 -0700 (PDT)
Received: from SoMainline.org (unknown [89.205.225.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5C5A81F578;
        Wed, 10 May 2023 08:25:44 +0200 (CEST)
Date:   Wed, 10 May 2023 08:25:42 +0200
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
Subject: Re: [PATCH v7 8/8] drm/msm/dsi: update hdisplay calculation for
 dsi_timing_setup
Message-ID: <ju7647tlogo25fnhswgp7zn67syvsjy2ldjugvygh3z4rxtdrx@kb76evjvulgw>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-8-df48a2c54421@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v7-8-df48a2c54421@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-09 15:06:54, Jessica Zhang wrote:
> hdisplay for compressed images should be calculated as bytes_per_slice *
> slice_count. Thus, use MSM DSC helper to calculate hdisplay for

For most intents and purposes, these values are the same when
bits_per_pixel=8.

We should find a place where we can assert that
slice_width*slice_count==hdisplay, though.

> dsi_timing_setup instead of directly using mode->hdisplay.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 508577c596ff..d60403372514 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -952,7 +952,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  		 * pulse width same
>  		 */
>  		h_total -= hdisplay;
> -		hdisplay /= 3;
> +		hdisplay = msm_dsc_get_bytes_per_line(msm_host->dsc) / 3;
>  		h_total += hdisplay;
>  		ha_end = ha_start + hdisplay;
>  	}
> 
> -- 
> 2.40.1
> 
