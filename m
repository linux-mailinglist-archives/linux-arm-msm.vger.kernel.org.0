Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADAB2467364
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Dec 2021 09:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379270AbhLCIqe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Dec 2021 03:46:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379272AbhLCIqd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Dec 2021 03:46:33 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9DBAC061757
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Dec 2021 00:43:09 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id p18so1594489plf.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Dec 2021 00:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KCOdy3fLrIckFFP2lKLlpo99jfWSPyEX2EKLwlFJXHw=;
        b=YrjvB9g87wSHTK9Mpg7nHVtai4Wo1DQCQazzwpBlOmFmjdfdsMknpZEzX18EjDqxCt
         RYEhAX6yVLcwKjpd0dJp1ZUWPXu0+mYsSgmBrx/SXlKEwHVa6daFi3hy6EcRCJQj+j4p
         y90EfmmqRu77AHo/7g0abIkplntukPE5/or/L+Fn8JCo58RUc2Z0ngyf2l/KrtK/zBlI
         N5YZKOKm7TSlViU/o+8mFc4tQ3+SWNf3hH/A0hQ+s/VyAL6fUaGLM7Vfe9wyZIoBtzam
         uWu7WIGYKY6ATs2ocamX/VGmZgJDqPBQPHWeGzWEa2ZNbKJyBo9K4NhhPac5TcOhJkWS
         O1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KCOdy3fLrIckFFP2lKLlpo99jfWSPyEX2EKLwlFJXHw=;
        b=JNv6tJE5v3zihu7gFfaap+ezalLL+1Bn7h0zAZcZlifGMJcHOi8clJf9VIicHSvbPK
         cNFLrRnIz7wYox+v4xDVyHLGJGRWGMc/iLg4O+0jtjw7AUKt/Py3dzXm2lyOYa1Uk/Vv
         YhZqb4pqVBPCYAJGR+TnBGQ8i0sLk3We9ypT0+Jij1mtdNwFvsbxWOOOFtMt1WgRkdRf
         9hNR19+KYH3LkElVeRoOyTiuahwo0E3Uq3wTrybK+xjFt56L+m3omh6fdyley57KKZjk
         9xzkQNFXcuaA0jpwEZGc8f/iWXs+6TrVu3AarjR746w2VCMK3DpgAHI/r04FLDgdqk8d
         AG6w==
X-Gm-Message-State: AOAM533CHiA3iWUE3KidA1x9m3aMe9KjlfZWKsiW3+x0i/WXZgRmko5D
        1G6O98YoJy9QL0hqJ0HQNtF1
X-Google-Smtp-Source: ABdhPJxs7GG70chTt6hGwV8bD8adqdSCvTb07/634kDWLqsHtkwFyEvymQiBuqjImQU+fSX0eEHDSg==
X-Received: by 2002:a17:90a:fe0b:: with SMTP id ck11mr12221312pjb.15.1638520988875;
        Fri, 03 Dec 2021 00:43:08 -0800 (PST)
Received: from thinkpad ([117.202.184.5])
        by smtp.gmail.com with ESMTPSA id k18sm1706240pgb.70.2021.12.03.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 00:43:08 -0800 (PST)
Date:   Fri, 3 Dec 2021 14:13:01 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <quic_bbhatt@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, quic_hemantk@quicinc.com,
        quic_jhugo@quicinc.com, linux-kernel@vger.kernel.org,
        mhi@lists.linux.dev, stable@vger.kernel.org,
        quic_olgak@quicinc.com, loic.poulain@linaro.org
Subject: Re: [PATCH v2] bus: mhi: core: Fix reading wake_capable channel
 configuration
Message-ID: <20211203084301.GA18809@thinkpad>
References: <1638320491-13382-1-git-send-email-quic_bbhatt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1638320491-13382-1-git-send-email-quic_bbhatt@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 30, 2021 at 05:01:31PM -0800, Bhaumik Bhatt wrote:
> The 'wake-capable' entry in channel configuration is not set when
> parsing the configuration specified by the controller driver. Add
> the missing entry to ensure channel is correctly specified as a
> 'wake-capable' channel.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0cbf260820fa ("bus: mhi: core: Add support for registering MHI controllers")
> Signed-off-by: Bhaumik Bhatt <quic_bbhatt@quicinc.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> v2:
> -Update subject as per comments
> -Add fixes tag and CC stable
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 5aaca6d..f1ec3441 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -788,6 +788,7 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
>  		mhi_chan->offload_ch = ch_cfg->offload_channel;
>  		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
>  		mhi_chan->pre_alloc = ch_cfg->auto_queue;
> +		mhi_chan->wake_capable = ch_cfg->wake_capable;
>  
>  		/*
>  		 * If MHI host allocates buffers, then the channel direction
> -- 
> 2.7.4
> 
