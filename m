Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5D229C7CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 19:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1829150AbgJ0St4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 14:49:56 -0400
Received: from z5.mailgun.us ([104.130.96.5]:32145 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1781685AbgJ0StX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 14:49:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603824562; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=onN6cnFqDOSCbb9Mxt8SddPJFHmruGIv8WFUjOBVlaQ=;
 b=P6ww0lp6HbowTBFC4LfetE2HHzkAe/FnqRUwQjpLD0+hRGMfT0tY82qXgXObp629Bm34jean
 IxIfgUE3vGOhlD46vgRxllJfKyPvjBx60nP02cmpr9vRf/z2yDVGYUqagT8/hBhMeggPu8MG
 ZUEUeF2wkZJ/UcCUAjlk6oqizH8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f986ba4da4f4647737e5e3b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Oct 2020 18:49:08
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11FAFC43382; Tue, 27 Oct 2020 18:49:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 34CFFC433C9;
        Tue, 27 Oct 2020 18:49:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Oct 2020 11:49:07 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: fix clock scaling on non-sc7180
 board
In-Reply-To: <20201027102304.945424-1-dmitry.baryshkov@linaro.org>
References: <20201027102304.945424-1-dmitry.baryshkov@linaro.org>
Message-ID: <20ac1894035103cc989cbfad3f07d885@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-27 03:23, Dmitry Baryshkov wrote:
> c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for
> display") has added support for handling bandwidth voting in kms path 
> in
> addition to old mdss path. However this broke all other platforms since
> _dpu_core_perf_crtc_update_bus() will now error out instead of properly
> calculating bandwidth and core clocks. Fix
> _dpu_core_perf_crtc_update_bus() to just skip bandwidth setting instead
> of returning an error in case kms->num_paths == 0 (MDSS is used for
> bandwidth management).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling
> for display")
> ---
Looks fine to me, thanks for the fix.
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 393858ef8a83..37c8270681c2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -219,9 +219,6 @@ static int _dpu_core_perf_crtc_update_bus(struct
> dpu_kms *kms,
>  	int i, ret = 0;
>  	u64 avg_bw;
> 
> -	if (!kms->num_paths)
> -		return -EINVAL;
> -
>  	drm_for_each_crtc(tmp_crtc, crtc->dev) {
>  		if (tmp_crtc->enabled &&
>  			curr_client_type ==
> @@ -239,6 +236,9 @@ static int _dpu_core_perf_crtc_update_bus(struct
> dpu_kms *kms,
>  		}
>  	}
> 
> +	if (!kms->num_paths)
> +		return 0;
> +
>  	avg_bw = perf.bw_ctl;
>  	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
