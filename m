Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F092A90DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 09:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgKFIAV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 03:00:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgKFIAV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 03:00:21 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE6CC0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2020 00:00:21 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id a18so396493pfl.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2020 00:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OUDJWBRHwmYg5tlx0f56mWuGsqX70lEgfuyCu6MGgDY=;
        b=drBTIQeZXlaXVlJsp27DBaPcuBEycKjamPfhc6zYwpws6xfRK9vfgZiWkV4rNEi7M5
         OWrmw4f3RSK30h82lZrWg1X+YsHJy/tE9Dsz47/UmJ0/mT7HxZu/b9lbjmfPzjoFdNw6
         A/4gZ3r9bwpgfdaUM8bgOuTf9zzZJxt2nHtTrd9G454SzIEz0OXannaDks1IW1GuVQw9
         mvkNK1oWCp4q139za+bDu/4H+zQKgMUlNHDiG7rblNCObYMnhLP2eY4a3Zj/SVWdqo7m
         idV07qkN/Nvy08s84lPX0sax058qONlFSIjttgXhUiETxNR1JCnD0RQwy56A3jAkpMMs
         fg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OUDJWBRHwmYg5tlx0f56mWuGsqX70lEgfuyCu6MGgDY=;
        b=Zp2Rwf09I90BY8aFasLIbYsVkfmZ9nnt71mfHlSJPbX0RKjicv3IPiwMkIxv9IxM+C
         14bjIPBQxp3THb0RQpwMhrqPChagwXOkpuS6gdW9jX5ABI2IPwzPePCjfzZ6pUMZGg0Q
         N5j/HmKKg4slXMnqmMwxrwRuLlJcyfupTCNreXFMZHDnDm8QBERDp4ac5JNK4FgAKVxA
         IeRJNHOA9MqFPXiVrwjwIDB3SRo8ZdRNpYDwMj7yL3xZm1+S2dbSH4AtyY4iKWsBs5/f
         GKepoqg97FjAyAgxpUzTP6+5WOoJHZcoWysQsL7rB4lv3B7OOTs96uOeKia2osJDLKD6
         P6Gg==
X-Gm-Message-State: AOAM532gNIl2kx/4sCCgQNm68dYNxt8mEoKxnwgAVbhcKDBfLjJxfP+9
        yIR8rORLplqjSE/cNrDHgWO8
X-Google-Smtp-Source: ABdhPJzpUZPKJ5GpbKAVaCk3jBB0uvT90VUsltjwg18aA8NK1aKQ4VNqj1ekuYKQdtox2ZiEh6M/1Q==
X-Received: by 2002:a17:90b:a51:: with SMTP id gw17mr1125617pjb.218.1604649620738;
        Fri, 06 Nov 2020 00:00:20 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id a23sm810149pgv.35.2020.11.06.00.00.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Nov 2020 00:00:19 -0800 (PST)
Date:   Fri, 6 Nov 2020 13:30:14 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v1 1/2] bus: mhi: core: Count number of HW channels
 supported by controller
Message-ID: <20201106080014.GH3473@work>
References: <1603504843-38557-1-git-send-email-hemantk@codeaurora.org>
 <1603504843-38557-2-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603504843-38557-2-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 23, 2020 at 07:00:42PM -0700, Hemant Kumar wrote:
> Device provides the total number of HW channels it supports using MHI
> configuration register. Host supported HW channels shall not exceed
> that value. In order to make this check, a counter is needed to store
> total number of HW channels required by host.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> ---
>  drivers/bus/mhi/core/init.c     | 2 ++
>  drivers/bus/mhi/core/internal.h | 1 +
>  include/linux/mhi.h             | 1 +
>  3 files changed, 4 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 0ffdebd..70fd6af 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -725,6 +725,8 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
>  		mhi_chan = &mhi_cntrl->mhi_chan[chan];
>  		mhi_chan->name = ch_cfg->name;
>  		mhi_chan->chan = chan;
> +		if (chan >= MHI_HW_CHAN_START_IDX)
> +			mhi_cntrl->hw_chan++;
>  
>  		mhi_chan->tre_ring.elements = ch_cfg->num_elements;
>  		if (!mhi_chan->tre_ring.elements)
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 7989269..3d8e480 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -454,6 +454,7 @@ enum mhi_pm_state {
>  #define PRIMARY_CMD_RING		0
>  #define MHI_DEV_WAKE_DB			127
>  #define MHI_MAX_MTU			0xffff
> +#define MHI_HW_CHAN_START_IDX		100
>  #define MHI_RANDOM_U32_NONZERO(bmsk)	(prandom_u32_max(bmsk) + 1)
>  
>  enum mhi_er_type {
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index d4841e5..ea441d2 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -389,6 +389,7 @@ struct mhi_controller {
>  	struct list_head lpm_chans;
>  	int *irq;
>  	u32 max_chan;
> +	u32 hw_chan;

Please add Kdoc for this member. With that,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

>  	u32 total_ev_rings;
>  	u32 hw_ev_rings;
>  	u32 sw_ev_rings;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
