Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55DB22A32C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 19:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbgKBSVr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 13:21:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbgKBSVr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 13:21:47 -0500
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E19CC0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 10:21:47 -0800 (PST)
Received: by mail-oo1-xc41.google.com with SMTP id j6so3582255oot.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 10:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xRQ0CcPYOKhYGnMLgxmXXhFo34bjmKd0lXwyZmV5goY=;
        b=pMjqPLADOae/tAXYMIGENJtu4YmHlq1z4uQT2H7/S8VZEulMPLPBOCVMkQLErEAkN5
         7cWln7Ih2Toagjj9H1v1zRPCVbc0HJcUxAGANyLOn/FfBQIY6fVM625nfDDkQ8XVfYlt
         KzlErXfYI4xN/QyURH2sX/suWRpDJ85f/bVDNjh7qr0dt6UKRvOp5y5WCo0XYR/8cJWO
         5+fYnIL1JeDTDm5ySd2ULLIZdPrwE1wGCXPAZRDjSps8bM/lpJsO0ZRExJn4bk8Fj8+q
         rxv/GTkNF5526s06R3YUsCDLmjcfYXyZzPtYUaUXIeIwIqzX+MfeT7RN0g5vZbeVsl/F
         N8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xRQ0CcPYOKhYGnMLgxmXXhFo34bjmKd0lXwyZmV5goY=;
        b=jFo9VRXRuyah0TD+bASBFeyTmqlqgL4AtAo8pzQ2o9/oXMI0jdfs/WaUgpqfhZAC6H
         jlXQ0LVm4z/M2UbawHU8VzS/mrc4QUv8Q+/DsUP1P0HHuXYl20OXxNkT/IAb+Nct48hv
         7Cb4JkwCjyeb+5snylP4PoxMdo1swfZGZ45NiVeB9N0VbGOAu8TOjKIJbUSof9Rs7jm1
         cC/6uBPVJKzk93QJhyX61oeE1NXjvMhkUzADqrBXZTX92r6agi4KO6GeguZ7iOJ6P/tb
         pv86uhfeOwQkzqYtfPsw3iaOvz5h09tjkmfUz0do4BgEBIEtr7foiaNOWrjt4SMMmXN0
         XXgg==
X-Gm-Message-State: AOAM530vijn1CQenwefrEeJLAoIdRbC5fAJk0JWR8XreeAq1oJgcJ5/v
        /25Hse5GiWeCl78wuXztp5zyyw==
X-Google-Smtp-Source: ABdhPJzMMVGvhuvlkpsuzCCvBxYHqtTOzTsVqRH582t2kvcDB0+hJcsYmcZrjoWbMCQ9LZ/9XEzZBg==
X-Received: by 2002:a4a:d554:: with SMTP id q20mr12886552oos.23.1604341306983;
        Mon, 02 Nov 2020 10:21:46 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b8sm3555544oov.29.2020.11.02.10.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 10:21:46 -0800 (PST)
Date:   Mon, 2 Nov 2020 12:21:44 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dpu: fix clock scaling on non-sc7180 board
Message-ID: <20201102182144.GK3151@builder.lan>
References: <20201027102304.945424-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027102304.945424-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 27 Oct 05:23 CDT 2020, Dmitry Baryshkov wrote:

> c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for
> display") has added support for handling bandwidth voting in kms path in
> addition to old mdss path. However this broke all other platforms since
> _dpu_core_perf_crtc_update_bus() will now error out instead of properly
> calculating bandwidth and core clocks. Fix
> _dpu_core_perf_crtc_update_bus() to just skip bandwidth setting instead
> of returning an error in case kms->num_paths == 0 (MDSS is used for
> bandwidth management).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks Dmitry,
Bjorn

> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 393858ef8a83..37c8270681c2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -219,9 +219,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>  	int i, ret = 0;
>  	u64 avg_bw;
>  
> -	if (!kms->num_paths)
> -		return -EINVAL;
> -
>  	drm_for_each_crtc(tmp_crtc, crtc->dev) {
>  		if (tmp_crtc->enabled &&
>  			curr_client_type ==
> @@ -239,6 +236,9 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>  		}
>  	}
>  
> +	if (!kms->num_paths)
> +		return 0;
> +
>  	avg_bw = perf.bw_ctl;
>  	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
>  
> -- 
> 2.28.0
> 
