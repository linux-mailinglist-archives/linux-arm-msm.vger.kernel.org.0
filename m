Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28131771662
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Aug 2023 20:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjHFSEo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Aug 2023 14:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjHFSEn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Aug 2023 14:04:43 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9AB91716
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Aug 2023 11:04:40 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 40D971F533;
        Sun,  6 Aug 2023 20:04:36 +0200 (CEST)
Date:   Sun, 6 Aug 2023 20:04:33 +0200
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
Subject: Re: [PATCH v5 1/8] drm/msm/dpu: fix the irq index in
 dpu_encoder_phys_wb_wait_for_commit_done
Message-ID: <ydpbdzuesywyhvdp4te4xyzzb3blykbfftkuieqjtr5ujjtlwx@rhmxsmfnbbwz>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
 <20230802100426.4184892-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802100426.4184892-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-08-02 13:04:19, Dmitry Baryshkov wrote:
> Since commit 1e7ac595fa46 ("drm/msm/dpu: pass irq to
> dpu_encoder_helper_wait_for_irq()") the
> dpu_encoder_phys_wb_wait_for_commit_done expects the IRQ index rather
> than the IRQ index in phys_enc->intr table, however writeback got the
> older invocation in place. This was unnoticed for several releases, but
> now it's time to fix it.
> 
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index a466ff70a4d6..78037a697633 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -446,7 +446,8 @@ static int dpu_encoder_phys_wb_wait_for_commit_done(
>  	wait_info.atomic_cnt = &phys_enc->pending_kickoff_cnt;
>  	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
>  
> -	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_WB_DONE,
> +	ret = dpu_encoder_helper_wait_for_irq(phys_enc,
> +			phys_enc->irq[INTR_IDX_WB_DONE],
>  			dpu_encoder_phys_wb_done_irq, &wait_info);
>  	if (ret == -ETIMEDOUT)
>  		_dpu_encoder_phys_wb_handle_wbdone_timeout(phys_enc);
> -- 
> 2.39.2
> 
