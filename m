Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41FA726A08F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 10:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgIOIUt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 04:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgIOITe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 04:19:34 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47BDBC061788
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 01:19:24 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mm21so1373306pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 01:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QP+gA7sgySMAzlQtxJ9wc0X27q/HlusnRQDfASv/Vyw=;
        b=l4AAgwXNgSYzVZqVsju4Tp5NWDBnThSRqRtlG4Qxgcv99tDe8Dk6a5LgaXWQvCLzqn
         vrcAY3Kr90gTUZZfQ897H9AEdsVNYUX6EOt7p0WZ8PULsNbrJB0bWEK8ySoyRhE0t7gO
         Y4Eavhkj0/WNLh3JgsYWIfhSLzdY4VPTyZtKqkaAVc60v5jAsUIJ6QXvqHGSaoYbPCFs
         /Kc3Yvft/pdNVFH7d4pa+75v/SvFay5h4Tig4iq6PFKlVoB6Q6DyghGMycq9vgFBOaXU
         7mNvLU+aJwTQy/s5Og3q6QkFCXsuFaFoiBHEaG0Q8bv+Bt9HeOagph58zmxyvenaZPWF
         pzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QP+gA7sgySMAzlQtxJ9wc0X27q/HlusnRQDfASv/Vyw=;
        b=iTOOVLSzmczRF3IEnUXuTWltPZm1aMEwZsMRH0XHs7AwZ30BsQgE2OsM65rhP96SvC
         235IbUp2dGDtFauoPcX92h2QAhbzy2LR7J0Q7YYJoUjGFrSRopwjU+4jcBV4Q5Nti0+y
         jK8UJyLkJ3OrLdy7u4ebx49okHzRJWMhquSnmpagSuL+8tHMp2SHRvifC0uRrdhE0Ssl
         mYh/niBCa11IsI/TxpBZxJY82mJgrRtJyeXlDwB8nzdyukf/KI22g7B7vn5uKy63tYk2
         vLFKA8KVYkWA0iEC9pnDswA65jTXNWngGtFikOLSaUELWKLvexqvL5eEbi+2nuG1SwIB
         3FCw==
X-Gm-Message-State: AOAM531g62h7nyksm+8oAE8VfD8yR4MiXiuJOyKKhTxF2eQ2mz+4mtxs
        2wCRGqSQGABUnekXrVay1z1Wetzzqe1sgSo=
X-Google-Smtp-Source: ABdhPJzJeGD54tp+TQ6/pm3xWErPkMups7SYx0cHC02PtVzxGqQG7J7eeDn8F/bMH9M7Wcdtd5cYNg==
X-Received: by 2002:a17:90a:1903:: with SMTP id 3mr3153766pjg.74.1600157963636;
        Tue, 15 Sep 2020 01:19:23 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id i9sm10348675pgb.37.2020.09.15.01.19.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 01:19:22 -0700 (PDT)
Date:   Tue, 15 Sep 2020 13:49:17 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v1] bus: mhi: core: Add const qualifier to MHI config
 information
Message-ID: <20200915081917.GB12395@mani>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
