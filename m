Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34A1E2B43E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 13:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgKPMnm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 07:43:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgKPMnm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 07:43:42 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43747C0613D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 04:43:42 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id d17so6804643plr.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 04:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hzIkr1PGmJSmnpkluYdeJ6kws69fWOgunLbcgLydCjE=;
        b=XEzs8XNgzzcBbve6IQ4WR5Lmi9aKtzMhCzKZQ6tYPgJZvLOfR9TctZEaxyOCtiKyPZ
         3J4bPWTXrvCF3KIv72nfYLIe4ICJX22xQsmDgvCCkQfYddezdMT6zw3iu9QYVYAf2d7U
         UqTnr5+qLXHtE6zqsBQJ3sP761SrKPYmow88+HcFGwQykMG1lQcsVDKqVCFRFeSoEmbs
         aoPeUoqzc3TdJo+E9ykLWIyySzS+Zidhp0Cvng9BAhxrxTTGUiyDba3OIl6YcR/9Y1Ls
         6gA8CBf2+zisHicZNjqqsFz4rc/gMB6aggmHuBr7JeLn5D9Jo++Jgi/fZzdrSTNYL5fA
         waZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hzIkr1PGmJSmnpkluYdeJ6kws69fWOgunLbcgLydCjE=;
        b=SwGmQ7FEjOx6EF1+atHkGoDn84aJAKHjeHFLYcfV8mwf6J0QCOeCV05dVDmEZ/0fZN
         61ZQJw13sPD8/4892hUsAaYwr0Spu5rw9v2ttaeh5kiqBOXz8B8viqaU+ZSkZCXK11GU
         QMM97S8dtfSYhXcQi3bWph5NMtQ+LYeY5fsDnx+mLX2AvAB/W+4pWc+HhtmfRxTUYPVk
         OMvIG0a/cxYFKTKtFqhhPqQH8YjdOKb1skT9hhuVA2wjlKCUwtGDZNrlURbOpn2jrcA8
         WOHJVbTFqQIjYUptqBmZIDLTaK1C8EFwT8RV8DZvK1xLPgmc0sTDeNOUBWpJETjj/ATR
         eIeQ==
X-Gm-Message-State: AOAM5310G8hd1QKUUSljhXHCQ+j2vQ5VbFQrm9LnrY77nMwzdXGMs2VN
        7DktG7KtOGytzTtzA2nYgGMNC0pO8k6M
X-Google-Smtp-Source: ABdhPJyMR162mCy3sZjRcJn/62V15QusACXsYwb2psjiIMeW3J/hiLOBLe1xLn3PHDH3ccCwsmeTnA==
X-Received: by 2002:a17:902:e788:b029:d6:dc69:80a8 with SMTP id cp8-20020a170902e788b02900d6dc6980a8mr12967315plb.59.1605530621700;
        Mon, 16 Nov 2020 04:43:41 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:618e:9b0a:75fd:1290:bf5c:a350])
        by smtp.gmail.com with ESMTPSA id t9sm20526789pje.1.2020.11.16.04.43.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 04:43:40 -0800 (PST)
Date:   Mon, 16 Nov 2020 18:13:32 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] bus: mhi: core: Add support to stop or start
 channel data transfers
Message-ID: <20201116124332.GK3926@Mani-XPS-13-9360>
References: <1605122473-12179-1-git-send-email-bbhatt@codeaurora.org>
 <1605122473-12179-4-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605122473-12179-4-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 11, 2020 at 11:21:10AM -0800, Bhaumik Bhatt wrote:
> Some MHI client drivers may want to request a pause or halt of
> data transfer activity on their channels. Support for this does
> not exist and must be introduced, wherein the channel context is
> not reset or cleared but only the STOP channel command is issued.
> This would need to be paired with an API that allows resuming the
> data transfer activity on channels by use of the START channel
> command. This API assumes that the context information is already
> setup. Enable this using two new APIs, mhi_start_transfer() and
> mhi_stop_transfer().
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/main.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/mhi.h         | 19 +++++++++++++++++++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 1226933..1a969f4 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1560,6 +1560,47 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
>  }
>  EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
>  
> +static int mhi_update_transfer_state(struct mhi_device *mhi_dev,
> +				     enum mhi_ch_state_type to_state)
> +{
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +	struct mhi_chan *mhi_chan;
> +	int dir, ret;
> +
> +	for (dir = 0; dir < 2; dir++) {
> +		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
> +
> +		if (!mhi_chan)
> +			continue;
> +
> +		/*
> +		 * Bail out if one of the channels fail as client will reset
> +		 * both upon failure
> +		 */
> +		mutex_lock(&mhi_chan->mutex);

Hmm. The documentation about wait_for_completion*() used in
mhi_update_channel_state()says below,

"As all variants of wait_for_completion() can (obviously) block for a long
time depending on the nature of the activity they are waiting for, so in
most cases you probably don't want to call this with held mutexes."

> +		ret = mhi_update_channel_state(mhi_cntrl, mhi_chan, to_state);
> +		if (ret) {
> +			mutex_unlock(&mhi_chan->mutex);
> +			return ret;
> +		}
> +		mutex_unlock(&mhi_chan->mutex);
> +	}
> +
> +	return 0;
> +}
> +
> +int mhi_stop_transfer(struct mhi_device *mhi_dev)
> +{
> +	return mhi_update_transfer_state(mhi_dev, MHI_CH_STATE_TYPE_STOP);
> +}
> +EXPORT_SYMBOL_GPL(mhi_stop_transfer);
> +
> +int mhi_start_transfer(struct mhi_device *mhi_dev)
> +{
> +	return mhi_update_transfer_state(mhi_dev, MHI_CH_STATE_TYPE_START);
> +}
> +EXPORT_SYMBOL_GPL(mhi_start_transfer);
> +
>  int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
>  {
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 52b3c60..aee8494 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -702,6 +702,25 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
>  void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
>  
>  /**
> + * mhi_stop_transfer - Pauses ongoing channel activity by issuing the STOP
> + *                     channel command to both UL and DL channels. This command
> + *                     does not reset the channel context and the client drivers
> + *                     can issue mhi_start_transfer to resume activity.
> + * @mhi_dev: Device associated with the channels
> + */
> +int mhi_stop_transfer(struct mhi_device *mhi_dev);
> +
> +/**
> + * mhi_start_transfer - Resumes channel activity by issuing the START channel
> + *                      command to both UL and DL channels. This command assumes
> + *                      the channel context is already setup and the client
> + *                      drivers can issue mhi_stop_transfer to pause activity if
> + *                      required.
> + * @mhi_dev: Device associated with the channels
> + */
> +int mhi_start_transfer(struct mhi_device *mhi_dev);
> +
> +/**

Align the comment header properly.

Thanks,
Mani

>   * mhi_poll - Poll for any available data in DL direction
>   * @mhi_dev: Device associated with the channels
>   * @budget: # of events to process
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
