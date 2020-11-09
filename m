Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851432AB7AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 13:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729366AbgKIMCA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 07:02:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgKIMCA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 07:02:00 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57139C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 04:02:00 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id cp9so1189012plb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 04:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+I99G7tgQkdrntNWgn1ONEM9FouVVpt1lVbxnD7oT9s=;
        b=yhjoOxnxmoMyeo2yKG57kekJcFuyI+UcwKOlGzetpS/T9s/K1YMZjXJyxQ3+d5iINx
         K2PXenFhy8R8abHUaAhixtVz6W/JKhWKndkIqmcmgHGQNHWfSwGop2vmjEYZclOO7KYg
         lp4amHACMZkHVrXRMYc+z915c6NmIHi4qYJXIPXxnUOhnbPnVONSiwTeywwZrmC8GL6N
         804Uc1zxT0p5kp+qqkZ4BTgq61rHMEEc6P201Vru1wc5JKel4s6M92cGlloSvejKTKp9
         dBuLuMCrsLwmGnt4Jo8AaIZ65dPOYM+y1ixP4OgZvYgBcvLWCuISK4EmDyDjiyK1gw47
         DR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+I99G7tgQkdrntNWgn1ONEM9FouVVpt1lVbxnD7oT9s=;
        b=JhFEmweuINgYLqs2I69xwjGThBu3NTi7FJvgm6+u8Tb83aZR5ppZdmNVlFMX0U8gFd
         4ZisMyHbveOrR9c7ODk/HKgK0JmadN5ZAVktdRU2YFAoGlecYEvTzd9uMTpZaqr5+zcB
         aUG7yG2B5hFFtJ1laLdWE/HvksVwKwDz/MZwIEILp5a/b8ktUOLZSSKkTHJWdr3ujhOf
         v7QOV6nHcZfWHiKHCjny/wkz6njdYKFSzANgpLeDEZ2B2k4UtbK0Ey2HvRDXk7Jn9cBe
         qmBnTF/BhtLlKTChHv2/noJR0YbXivzMuDtVyTu08MF8vf0SjAa48wnOapC1AQBQz4Mu
         BVOQ==
X-Gm-Message-State: AOAM532SxQqHUzkem11OXRHhGXNfNAVTVBSymRRbx46MpJvyNZx9tzF7
        q5iK1R8ACdw1UXu5opI2xbAJgvFM+vqy
X-Google-Smtp-Source: ABdhPJzfryWf5ZbI/6KrmVgRdiUOnRVwF8egr3BvCjcd+xLFL0SbAchWdKKRsQ5C/D2vAY2vgDo0fw==
X-Received: by 2002:a17:902:d917:b029:d6:d1b8:5d9a with SMTP id c23-20020a170902d917b02900d6d1b85d9amr12141803plz.72.1604923319855;
        Mon, 09 Nov 2020 04:01:59 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id n11sm11087047pjv.52.2020.11.09.04.01.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 04:01:59 -0800 (PST)
Date:   Mon, 9 Nov 2020 17:31:53 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Fix channel close issue on driver remove
Message-ID: <20201109120153.GH24289@work>
References: <1602234434-924-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602234434-924-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 09, 2020 at 11:07:14AM +0200, Loic Poulain wrote:
> Some MHI device drivers need to stop the channels in their driver
> remove callback (e.g. module unloading), but the unprepare function
> is aborted because MHI core moved the channels to suspended state
> prior calling driver remove callback. This prevents the driver to
> send a proper MHI RESET CHAN command to the device. Device is then
> unaware of the stopped state of these channels.
> 
> This causes issue when driver tries to start the channels again (e.g.
> module is reloaded), since device considers channels as already
> started (inconsistent state).
> 
> Fix this by allowing channel reset when channel is suspended.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index d20967a..a588eac 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1232,7 +1232,8 @@ static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
>  	/* no more processing events for this channel */
>  	mutex_lock(&mhi_chan->mutex);
>  	write_lock_irq(&mhi_chan->lock);
> -	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
> +	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED &&
> +	    mhi_chan->ch_state != MHI_CH_STATE_SUSPENDED) {
>  		write_unlock_irq(&mhi_chan->lock);
>  		mutex_unlock(&mhi_chan->mutex);
>  		return;
> -- 
> 2.7.4
> 
