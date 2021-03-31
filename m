Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD99A34FF4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 13:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235136AbhCaLLv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 07:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235150AbhCaLLZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 07:11:25 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87AB2C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 04:11:25 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id w11so7725745ply.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 04:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j/gM991lZTd/ImaiNRskHUHX82pe8kq8L29GxFJ2778=;
        b=scOefJ4A0Kz/hS96jZs6v9Fe8bQcYq3Pves7AFWF2xsH/Z9bWbDT/AfRTOHUHIfrxB
         CsZBIXhZIT4BjW9MqI+PkFyJKHo+3z7w+p9oQgcl9X4bsFSjqzwUHDSrH9RU1vxYy0Fy
         LdSJUn/4K5jpEAszaAmq0Yz7nX81LdjYiiWjIT1YTjSPNJfoSuT86R3uhp+6OxWZvHB0
         0eXHlxEBrL3v87WtgqdM7o1FNHK8axVSziWvMmOtmjEf/Vlu8haY267OR6XzmOdLVCUv
         nyTuzyeYrwB93QGAzXssJbL39HJW5SAyP3wOSYPCAwukEQp1sOjaouTxfmmf9XJo/DZx
         GrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j/gM991lZTd/ImaiNRskHUHX82pe8kq8L29GxFJ2778=;
        b=HIzmXOK/RNQdbe5DlBu5yTgYMaCdwPO7NjxIYVEGo4maZNMSSXcVwGZQ6wtDpDDesd
         KA5/XBno0PoXtUxkBfJkmeCcDZEqKHFtZNhDj6ilrTTjU3WnaYtXWq9WzQpITou5J/iN
         R9B5N4mtBu0NLxagRJejJnCDtXrVXUIx7ukgLXvMA4AXW51XPDKL7o7jnv9Z4i5mL85m
         gRlYgE7Ij5qIhRBFWvrF6Ts03qe97ZU5ol1QYyxbtYSzWi/j+UFY0kDvm0Egt+JmTgqD
         qff0EveniaOcAAZugQuhPDFzhw4l8xqVK/Xqx+55tuCWt4FXGUZKgm36PFHXzYsMOY2F
         w+Jw==
X-Gm-Message-State: AOAM530BugLJCJpxZ9jWyB24NE+MqrGz9WDjHtAgwaauiua1xJwHUs3v
        Cq5P/Jey3R4sclRIiFgwr29zAfxicnMAlPw=
X-Google-Smtp-Source: ABdhPJwKT+OKhLws6uvlh8vH3XS20E6wdjkC9OHiEkn90BCIrJ4FeOrxk4RPBbfE0RZDpuby3aVUzw==
X-Received: by 2002:a17:90a:5587:: with SMTP id c7mr2861207pji.5.1617189084979;
        Wed, 31 Mar 2021 04:11:24 -0700 (PDT)
Received: from work ([103.77.37.129])
        by smtp.gmail.com with ESMTPSA id y15sm2879471pgi.31.2021.03.31.04.11.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 04:11:24 -0700 (PDT)
Date:   Wed, 31 Mar 2021 16:41:20 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, abickett@codeaurora.org
Subject: Re: [PATCH v1 4/7] bus: mhi: core: Add support for Flash Programmer
 execution environment
Message-ID: <20210331111120.GC15610@work>
References: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org>
 <1617067704-28850-5-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617067704-28850-5-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 29, 2021 at 06:28:21PM -0700, Bhaumik Bhatt wrote:
> From: Carl Yin <carl.yin@quectel.com>
> 
> MHI WWAN modems support downloading firmware to NAND or eMMC
> using Firehose protocol with process as follows:
> 1. Modem boots up, enters AMSS execution environment and the
> device later enters EDL (Emergency Download) mode through any
> mechanism host can use such as a diag command.
> 2. Modem enters SYS_ERROR, MHI host handles SYS_ERROR transition.
> 3. EDL image for device to enter 'Flash Programmer' execution
> environment is then flashed via BHI interface from host.
> 4. Modem enters MHI READY -> M0 and sends the Flash Programmer
> execution environment change to host.
> 5. Following that, EDL/FIREHOSE channels (34, 35) are made
> available from the host.
> 6. User space tool for downloading firmware image to modem over
> the EDL channels using Firehose protocol. Link to USB flashing
> tool: https://git.linaro.org/landing-teams/working/qualcomm/qdl.git/
> 
> Make the necessary changes to allow for this sequence to occur and
> allow using the Flash Programmer execution environment.
> 
> Signed-off-by: Carl Yin <carl.yin@quectel.com>
> Co-developed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c     | 2 ++
>  drivers/bus/mhi/core/internal.h | 1 +
>  drivers/bus/mhi/core/main.c     | 3 +++
>  drivers/bus/mhi/core/pm.c       | 6 ++++++
>  include/linux/mhi.h             | 4 +++-
>  5 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 706484f..ee67712 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -29,6 +29,7 @@ const char * const mhi_ee_str[MHI_EE_MAX] = {
>  	[MHI_EE_WFW] = "WFW",
>  	[MHI_EE_PTHRU] = "PASS THRU",
>  	[MHI_EE_EDL] = "EDL",
> +	[MHI_EE_FP] = "FLASH PROGRAMMER",
>  	[MHI_EE_DISABLE_TRANSITION] = "DISABLE",
>  	[MHI_EE_NOT_SUPPORTED] = "NOT SUPPORTED",
>  };
> @@ -38,6 +39,7 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
>  	[DEV_ST_TRANSITION_READY] = "READY",
>  	[DEV_ST_TRANSITION_SBL] = "SBL",
>  	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
> +	[DEV_ST_TRANSITION_FP] = "FLASH_PROGRAMMER",
>  	[DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
>  	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
>  };
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 6f37439..b1b5f2b 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -386,6 +386,7 @@ enum dev_st_transition {
>  	DEV_ST_TRANSITION_READY,
>  	DEV_ST_TRANSITION_SBL,
>  	DEV_ST_TRANSITION_MISSION_MODE,
> +	DEV_ST_TRANSITION_FP,
>  	DEV_ST_TRANSITION_SYS_ERR,
>  	DEV_ST_TRANSITION_DISABLE,
>  	DEV_ST_TRANSITION_MAX,
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index d377d07..8b68657 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -831,6 +831,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  			case MHI_EE_AMSS:
>  				st = DEV_ST_TRANSITION_MISSION_MODE;
>  				break;
> +			case MHI_EE_FP:
> +				st = DEV_ST_TRANSITION_FP;
> +				break;
>  			case MHI_EE_RDDM:
>  				mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
>  				write_lock_irq(&mhi_cntrl->pm_lock);
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index b65222e..7ac9dfe 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -782,6 +782,12 @@ void mhi_pm_st_worker(struct work_struct *work)
>  		case DEV_ST_TRANSITION_MISSION_MODE:
>  			mhi_pm_mission_mode_transition(mhi_cntrl);
>  			break;
> +		case DEV_ST_TRANSITION_FP:
> +			write_lock_irq(&mhi_cntrl->pm_lock);
> +			mhi_cntrl->ee = MHI_EE_FP;
> +			write_unlock_irq(&mhi_cntrl->pm_lock);
> +			mhi_create_devices(mhi_cntrl);
> +			break;
>  		case DEV_ST_TRANSITION_READY:
>  			mhi_ready_state_transition(mhi_cntrl);
>  			break;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 8f5bf40..b16afd3 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -117,6 +117,7 @@ struct mhi_link_info {
>   * @MHI_EE_WFW: WLAN firmware mode
>   * @MHI_EE_PTHRU: Passthrough
>   * @MHI_EE_EDL: Embedded downloader
> + * @MHI_EE_FP: Flash Programmer Environment
>   */
>  enum mhi_ee_type {
>  	MHI_EE_PBL,
> @@ -126,7 +127,8 @@ enum mhi_ee_type {
>  	MHI_EE_WFW,
>  	MHI_EE_PTHRU,
>  	MHI_EE_EDL,
> -	MHI_EE_MAX_SUPPORTED = MHI_EE_EDL,
> +	MHI_EE_FP,
> +	MHI_EE_MAX_SUPPORTED = MHI_EE_FP,
>  	MHI_EE_DISABLE_TRANSITION, /* local EE, not related to mhi spec */
>  	MHI_EE_NOT_SUPPORTED,
>  	MHI_EE_MAX,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
