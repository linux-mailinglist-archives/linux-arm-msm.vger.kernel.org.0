Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C29926A090
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 10:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgIOIUs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 04:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgIOIUm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 04:20:42 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF34C061788
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 01:20:42 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id s14so2389438pju.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 01:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JXi3eWzHsacG9MiKaF2epjpO9JenzGDAlAFqx0AKKoQ=;
        b=lMpB1pljYp1umVqCH0/XJPiTF6/6bIG3bYmmiUuO+hfVVvMfXcZzIG2wIzO+aUdune
         gt7pQRZsiMV9ZINKbXVoN7z96ofijXZ0W+YuxeHNtYr8BbDloBxasvXzhOB11uNt6NFD
         qAaRznxO7XaqXNWTM4RcyTsZ6ylbAZWLFfp7iP575gSFhoujhfJUvAgMMvwQG09A1sP8
         p2LWIFXBvyww8HgN2H10NTpPmTWprwnjm5U0RafHklbGvJvSFXJtIZjtVt3MqCkEedr+
         AGLsRJVID+odElWiNdOnDp02g9vUBZu8TzQBPLO+ILSQru8etSDAd5iDs5HvvHq+9nQR
         9xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JXi3eWzHsacG9MiKaF2epjpO9JenzGDAlAFqx0AKKoQ=;
        b=pozvd7jSGWnJyKzbpGdOW0uBYIxCudUiko86t5JzvwOb75WHuRlOxsJuxt5geksHD5
         J2DfBkIyYSS1TK0axRuguGrYd/Rns97R6dPkByzwkaFrrTVwwjmRRHCsCCY6PwIMRVW8
         Y1CeTYMECs34VzOVq01+1lYzeULPwL3quzp4ceCNwAZfdFPmxfsXoVfjOZN2B4KGViSA
         7GnSk4SC4CI3gYxeHkQpT2LDLF1b4KLleH19Nxa99AP5j+FsYD8UMZhk0WZvm4VcwOtU
         QSjXmYRUWsj3aoY2Bongol7lAZfkoeQMTTFK6wewTwsdhVoEp89no8iSfQxBXFwhCOPv
         g3UQ==
X-Gm-Message-State: AOAM532yPKAYDd5SIhpZ2nRbDdpWlObfnZUXD5XsO0Jtuw5jHrPngg5V
        xEuorQzn5i0mRr6dbG1mda0d
X-Google-Smtp-Source: ABdhPJziTUpzkuItTYtzGErbjHDEGCPJyaSXVak38t6wpYZcMjlnt3KOFIp//8zvV7ab1gFWMGtt5A==
X-Received: by 2002:a17:90b:1988:: with SMTP id mv8mr3183054pjb.23.1600158042010;
        Tue, 15 Sep 2020 01:20:42 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id y202sm13045064pfc.179.2020.09.15.01.20.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 01:20:41 -0700 (PDT)
Date:   Tue, 15 Sep 2020 13:50:36 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v1] bus: mhi: core: Add const qualifier to MHI config
 information
Message-ID: <20200915082036.GC12395@mani>
References: <1599812017-32680-1-git-send-email-hemantk@codeaurora.org>
 <010101747c3a6fdd-33efa632-e20c-476d-9e39-01cb1f2d1cea-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010101747c3a6fdd-33efa632-e20c-476d-9e39-01cb1f2d1cea-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 11, 2020 at 08:13:58AM +0000, Hemant Kumar wrote:
> MHI channel, event and controller config data needs to be
> treated read only information. Add const qualifier to make
> sure config information passed by MHI controller is not
> modified by MHI core driver.
> 
> Suggested-by: Kalle Valo <kvalo@codeaurora.org>
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 12 ++++++------
>  include/linux/mhi.h         |  6 +++---
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index f69a2f3..d232938 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -562,10 +562,10 @@ int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
>  }
>  
>  static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
> -			struct mhi_controller_config *config)
> +			const struct mhi_controller_config *config)
>  {
>  	struct mhi_event *mhi_event;
> -	struct mhi_event_config *event_cfg;
> +	const struct mhi_event_config *event_cfg;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	int i, num;
>  
> @@ -648,9 +648,9 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
>  }
>  
>  static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
> -			struct mhi_controller_config *config)
> +			const struct mhi_controller_config *config)
>  {
> -	struct mhi_channel_config *ch_cfg;
> +	const struct mhi_channel_config *ch_cfg;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	int i;
>  	u32 chan;
> @@ -766,7 +766,7 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
>  }
>  
>  static int parse_config(struct mhi_controller *mhi_cntrl,
> -			struct mhi_controller_config *config)
> +			const struct mhi_controller_config *config)
>  {
>  	int ret;
>  
> @@ -803,7 +803,7 @@ static int parse_config(struct mhi_controller *mhi_cntrl,
>  }
>  
>  int mhi_register_controller(struct mhi_controller *mhi_cntrl,
> -			    struct mhi_controller_config *config)
> +			    const struct mhi_controller_config *config)
>  {
>  	struct mhi_event *mhi_event;
>  	struct mhi_chan *mhi_chan;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 6b987e8..b2c0214 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -280,9 +280,9 @@ struct mhi_controller_config {
>  	u32 timeout_ms;
>  	u32 buf_len;
>  	u32 num_channels;
> -	struct mhi_channel_config *ch_cfg;
> +	const struct mhi_channel_config *ch_cfg;
>  	u32 num_events;
> -	struct mhi_event_config *event_cfg;
> +	const struct mhi_event_config *event_cfg;
>  	bool use_bounce_buf;
>  	bool m2_no_db;
>  };
> @@ -545,7 +545,7 @@ struct mhi_driver {
>   * @config: Configuration to use for the controller
>   */
>  int mhi_register_controller(struct mhi_controller *mhi_cntrl,
> -			    struct mhi_controller_config *config);
> +			const struct mhi_controller_config *config);
>  
>  /**
>   * mhi_unregister_controller - Unregister MHI controller
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
