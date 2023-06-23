Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF06473B109
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 09:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbjFWHFf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 03:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbjFWHFe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 03:05:34 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 235602132
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 00:05:33 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 487243F751;
        Fri, 23 Jun 2023 09:05:31 +0200 (CEST)
Date:   Fri, 23 Jun 2023 09:05:29 +0200
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
Subject: Re: [PATCH 2/2] drm/msm/dpu: fix DSC 1.2 enc subblock length
Message-ID: <4fn5y2bfhyr243yw4jdnyco5zkizl4o4xbmbtfmfc26nliq7pf@5tmbvriphw3h>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
 <20230623013731.1088007-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623013731.1088007-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-23 04:37:31, Dmitry Baryshkov wrote:
> Both struct dpu_dsc_sub_blks instances declare enc subblock length to be
> 0x100, while the actual length is 0x9c (last register having offset 0x98).
> Reduce subblock length to remove the empty register space from being
> dumped.
> 
> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0de507d4d7b7..dd2f89ada043 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -517,12 +517,12 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>   * DSC sub blocks config
>   *************************************************************/
>  static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
> -	.enc = {.base = 0x100, .len = 0x100},
> +	.enc = {.base = 0x100, .len = 0x9c},
>  	.ctl = {.base = 0xF00, .len = 0x10},

Hmm, these hexadecimals are still uppercase.  When do we get a
formatter/linter that automatically catches and fixes these?

- Marijn

>  };
>  
>  static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
> -	.enc = {.base = 0x200, .len = 0x100},
> +	.enc = {.base = 0x200, .len = 0x9c},
>  	.ctl = {.base = 0xF80, .len = 0x10},
>  };
>  
> -- 
> 2.39.2
> 
