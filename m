Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58E4333FE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 15:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbhCJOER (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 09:04:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbhCJOD6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 09:03:58 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1156FC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 06:03:58 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id z5so8534716plg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 06:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZX+dRDCmoR6npNBettLD41vngFiphZtYudO/sZ6aEiU=;
        b=kbEonC5Qtok1BT89z+mvh15wdrcvIQqwWzwsPsbUR8obyibC4/Mn+JpWXiOD+UiyN0
         Lzfg4j0ZC45tjx2MveQr6GQQ/VOOApDZeNx2cbsmAqz5K2TprjSgZn7ptJalSK2KQBm4
         AK9HX/JQABrwwtyd0u32r5Hc/oswQbWkS3htA2Y6zYcsgyqwQR4YjNAp5nsevlr/i8YD
         SV21qCiv91X18Q/Iy9PtwlFR3A4ClappR9FOddx0wuNhhANWtdQ/yPNlzhmfKOaVHjxM
         JkJLg9Ot9rGHW3S5hJqxdtzA9LJYz4lL9Wg6OkCSwMabTfs990o8tJXNq6rRmomafbGp
         khww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZX+dRDCmoR6npNBettLD41vngFiphZtYudO/sZ6aEiU=;
        b=ix8tDv0HAQm3JiZO2bsrM6SolzJGOKQHF3B2GQ86/9kWtSINO627rTAHrtt7tgePyA
         Phf4KfDqTngtWvj+YYygfotWcGxbm38WqAByaXj1iFlfefTtjsu5lfm/eZqnM0hCp6A8
         7z9aFxBNYYhHo471MQvjVgjMjoE5fWSn3ZXkVCgyU7m4FEKnCAb9gT/HlMlvuz08NTtU
         5pp5MvKF8S1QjIQmkmSD8imdmK1zQn6lw0/tWDb0zKLyosge7tb+LZ0apG71DuICMoX/
         xJO1Ldd0cuO9fqu/nHu9A19115uNBQsevH0CbmYw/DL6UrUVE/GxE7F4DCYz12vd8RDK
         1OhA==
X-Gm-Message-State: AOAM531xZCOUacN09UgM9UJR6BwAos3fdtecqkpz4/IBdSGu8dLjxRxR
        kovXAMNEzev+/DRbiIv+Qm10
X-Google-Smtp-Source: ABdhPJw2FpC9HsdCQSD5UbGCgtNqUJlUmpXbC/kzGzwIZSXICAGM/+5knnt05nRttLDF7httagVbHQ==
X-Received: by 2002:a17:90a:1642:: with SMTP id x2mr3964216pje.88.1615385037494;
        Wed, 10 Mar 2021 06:03:57 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id b14sm16385727pfi.74.2021.03.10.06.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 06:03:56 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:33:51 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com
Subject: Re: [PATCH v6 1/4] bus: mhi: core: Destroy SBL devices when moving
 to mission mode
Message-ID: <20210310140351.GP30275@thinkpad>
References: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
 <1614208985-20851-2-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614208985-20851-2-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 24, 2021 at 03:23:02PM -0800, Bhaumik Bhatt wrote:
> Currently, client devices are created in SBL or AMSS (mission
> mode) and only destroyed after power down or SYS ERROR. When
> moving between certain execution environments, such as from SBL
> to AMSS, no clean-up is required. This presents an issue where
> SBL-specific channels are left open and client drivers now run in
> an execution environment where they cannot operate. Fix this by
> expanding the mhi_destroy_device() to do an execution environment
> specific clean-up if one is requested. Close the gap and destroy
> devices in such scenarios that allow SBL client drivers to clean
> up once device enters mission mode.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 29 +++++++++++++++++++++++++----
>  drivers/bus/mhi/core/pm.c   |  3 +++
>  2 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 4e0131b..7a2e98c 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -244,8 +244,10 @@ static void mhi_del_ring_element(struct mhi_controller *mhi_cntrl,
>  
>  int mhi_destroy_device(struct device *dev, void *data)
>  {
> +	struct mhi_chan *ul_chan, *dl_chan;
>  	struct mhi_device *mhi_dev;
>  	struct mhi_controller *mhi_cntrl;
> +	enum mhi_ee_type ee = MHI_EE_MAX;
>  
>  	if (dev->bus != &mhi_bus_type)
>  		return 0;
> @@ -257,6 +259,17 @@ int mhi_destroy_device(struct device *dev, void *data)
>  	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
>  		return 0;
>  
> +	ul_chan = mhi_dev->ul_chan;
> +	dl_chan = mhi_dev->dl_chan;
> +
> +	/*
> +	 * If execution environment is specified, remove only those devices that
> +	 * started in them based on ee_mask for the channels as we move on to a
> +	 * different execution environment
> +	 */
> +	if (data)
> +		ee = *(enum mhi_ee_type *)data;
> +
>  	/*
>  	 * For the suspend and resume case, this function will get called
>  	 * without mhi_unregister_controller(). Hence, we need to drop the
> @@ -264,11 +277,19 @@ int mhi_destroy_device(struct device *dev, void *data)
>  	 * be sure that there will be no instances of mhi_dev left after
>  	 * this.
>  	 */
> -	if (mhi_dev->ul_chan)
> -		put_device(&mhi_dev->ul_chan->mhi_dev->dev);
> +	if (ul_chan) {
> +		if (ee != MHI_EE_MAX && !(ul_chan->ee_mask & BIT(ee)))
> +			return 0;
>  
> -	if (mhi_dev->dl_chan)
> -		put_device(&mhi_dev->dl_chan->mhi_dev->dev);
> +		put_device(&ul_chan->mhi_dev->dev);
> +	}
> +
> +	if (dl_chan) {
> +		if (ee != MHI_EE_MAX && !(dl_chan->ee_mask & BIT(ee)))
> +			return 0;
> +
> +		put_device(&dl_chan->mhi_dev->dev);
> +	}
>  
>  	dev_dbg(&mhi_cntrl->mhi_dev->dev, "destroy device for chan:%s\n",
>  		 mhi_dev->name);
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 681960c..3bd81d0 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -377,6 +377,7 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>  {
>  	struct mhi_event *mhi_event;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	enum mhi_ee_type current_ee = mhi_cntrl->ee;
>  	int i, ret;
>  
>  	dev_dbg(dev, "Processing Mission Mode transition\n");
> @@ -395,6 +396,8 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>  
>  	wake_up_all(&mhi_cntrl->state_event);
>  
> +	device_for_each_child(&mhi_cntrl->mhi_dev->dev, &current_ee,
> +			      mhi_destroy_device);
>  	mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_MISSION_MODE);
>  
>  	/* Force MHI to be in M0 state before continuing */
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
