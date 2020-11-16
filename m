Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7292E2B3D8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 08:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbgKPHNs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 02:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbgKPHNs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 02:13:48 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A8FC0613D1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2020 23:13:48 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id f18so12401765pgi.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2020 23:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=l2bSY9WlU5lc2DfnpO44O14MxA4pcoXlRl5Cy2DxvQ8=;
        b=YwTPqcph+gHMFI1XrgFqiQAF7ekxmPFcPuYN2ccqa4Gk/mrerN7PNERD6e7z4rNWEu
         MIGLzn+h/Rud0brzcDtMbGpNZUWU6nGxWeN7J71j8kL4QxAO9iEbB2IGHVz51JoOSt7Z
         TD6/7c9TeI7egpbYMyrWd1W2ESgtRUIEGV+EyW+dyUJZmulbSneyyTWMG/sx71folXyp
         fBeB4/iIEdQAR/HJgK9cr70gHzSM6y9meQPiLxOt9k22FjwsfARVTmspl5sS8f0K1H8K
         NyFn74WLfzM7l1d1lm1RYaXRFoCDdhvnqQ+OSzN33Q1mmiHz6p14tyQwNeALNx1p5dTc
         oVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l2bSY9WlU5lc2DfnpO44O14MxA4pcoXlRl5Cy2DxvQ8=;
        b=hVAIWY73IS3U181WfHtkDF0Ss8hXaC8a9Y4pYoqSlV5QI+k1FzZx4d1odGDII02H3R
         75i8yWOBIess5wlpSdo6FuotOXPwnod9hcj2qIvpwpIlX60zLdPmEgEoxkWaF/fgjZa+
         XUwVXbYwQB3O7HVEnTVh7JQuX809wlQtmuXfBkAe5us8MEicujUtZomGy24UfX/0Yo3L
         VnDZCYHwD4FIGvYH/HTAyQ/bNCHbK4Cntxd0qomwsvMZguQPvMquVd40fyKDauLP0ghm
         laZKRgh3IkPNdH0PqStiUMuLc+58PCyA3C221b8RZYBRFaR0PveJaGdrHoqqRtLwtkFc
         shWA==
X-Gm-Message-State: AOAM531CXKayz8qS/aLCL/kkHh/8I1hshySDv648PTrS15LwbuY3SQwd
        OwIoZc46OXTH5bWdwZ+lBe93
X-Google-Smtp-Source: ABdhPJwsWzRulnaEBp013ssLQ2e/Xv9f+s/1CvV8js3fYwJ/lYFsfN2rzaWu459RPBAS6bJKQnsBqw==
X-Received: by 2002:a17:90b:100f:: with SMTP id gm15mr13664333pjb.63.1605510827491;
        Sun, 15 Nov 2020 23:13:47 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:618e:9b0a:75fd:1290:bf5c:a350])
        by smtp.gmail.com with ESMTPSA id y3sm14846130pgq.40.2020.11.15.23.13.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Nov 2020 23:13:46 -0800 (PST)
Date:   Mon, 16 Nov 2020 12:43:39 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] bus: mhi: core: Allow receiving a STOP channel
 command response
Message-ID: <20201116071339.GI3926@Mani-XPS-13-9360>
References: <1605122473-12179-1-git-send-email-bbhatt@codeaurora.org>
 <1605122473-12179-2-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605122473-12179-2-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 11, 2020 at 11:21:08AM -0800, Bhaumik Bhatt wrote:
> Add support to receive the response to a STOP channel command to the
> MHI bus. If a client would like to STOP a channel instead of issuing
> a RESET to it, this would provide support for it.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/init.c | 5 +++--
>  drivers/bus/mhi/core/main.c | 5 +++++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 8cefa35..4d34d62 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -1267,8 +1267,9 @@ static int mhi_driver_remove(struct device *dev)
>  
>  		mutex_lock(&mhi_chan->mutex);
>  
> -		if (ch_state[dir] == MHI_CH_STATE_ENABLED &&
> -		    !mhi_chan->offload_ch)
> +		if ((ch_state[dir] == MHI_CH_STATE_ENABLED ||
> +		     ch_state[dir] == MHI_CH_STATE_STOP) &&

This enum is not defined in this patch so it'll break. Please add a separate
patch which introduces the new state enums alone and then have patches 1/2
as a followup.

Also this change is not belonging to this commit I believe.

Thanks,
Mani

> +		     !mhi_chan->offload_ch)
>  			mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
>  
>  		mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index f953e2a..ad881a1 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1194,6 +1194,11 @@ int mhi_send_cmd(struct mhi_controller *mhi_cntrl,
>  		cmd_tre->dword[0] = MHI_TRE_CMD_RESET_DWORD0;
>  		cmd_tre->dword[1] = MHI_TRE_CMD_RESET_DWORD1(chan);
>  		break;
> +	case MHI_CMD_STOP_CHAN:
> +		cmd_tre->ptr = MHI_TRE_CMD_STOP_PTR;
> +		cmd_tre->dword[0] = MHI_TRE_CMD_STOP_DWORD0;
> +		cmd_tre->dword[1] = MHI_TRE_CMD_STOP_DWORD1(chan);
> +		break;
>  	case MHI_CMD_START_CHAN:
>  		cmd_tre->ptr = MHI_TRE_CMD_START_PTR;
>  		cmd_tre->dword[0] = MHI_TRE_CMD_START_DWORD0;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
