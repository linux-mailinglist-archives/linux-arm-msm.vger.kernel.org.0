Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47AA41CED5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 08:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgELGzN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 02:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725814AbgELGzM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 02:55:12 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC72C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 23:55:11 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r10so5238668pgv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 23:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=thG0NdAjl/JWYqpa7xMECyjYXc//YQa3pk594o/Fmy0=;
        b=sL2FkhX8UO15y2kAB9YOFayWTQgfadxV+JnLDYuaUtuQruo+Ft+E+dGf9dmGePTcv4
         tSm8DoukgPWphY5yZafHBXhjpMIcSu6iRIRnyCAf+51DjiGmBEg+0sGYn0jlnC0D0SmK
         kxV3EoCqFpNJIOP8MSOd57mF76O5sVy63myXRjgkiD7hamjLldv/1sDN+lTIOtUvxY17
         rAT25K9934EEoAdEeSa7qTKjUpgSyXFAWwm9HOc2X178YxSQhqkqBR6QJn+rTf9TgpVE
         6vrVx94d4a0tlIgopJ34GxzcAgG/ONyK2+wExi22+vXMyQ719XZDVy9N2WfakX7bQHBK
         Npjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=thG0NdAjl/JWYqpa7xMECyjYXc//YQa3pk594o/Fmy0=;
        b=PLgKFnPXX9llbb/qZj4QNe/GklXTb8hks+jZxGF/cMssyBrWrfzJRA1B8jSK6J+MGY
         GiEXgRj4n13srODjSCl2UuxBMEyukFAp/olY+oFBOnAlmnji3UmYpe4n8jMmiaHMoPp3
         CkZGI027n3hB60Myb+1QUQFS783O6fJgsAtXktXGxGJH5N6cLO0nW0YH3XyxBIy+BzPf
         zGa3S2A68bNM1Nvctotmv355ecJ7hFcD9y/d9wW8Wnr518hyZqxVlHrrxTkTBDGTcL0S
         ItmLMo5ITSpscdE2MkZNTdhsaaH0UqgKbb6wY+Ai09Kb67vOMwrzXbABaKihFaOMXymm
         GUbg==
X-Gm-Message-State: AGi0PuZmrAHjGag0Q9zuVHvRIBFrDKOAY3yHDihAhb1KdWLON8D609Gd
        TunlDCMBylDGTN3PatdNIw/GpEtKMA==
X-Google-Smtp-Source: APiQypIwxrllsz0oRpxXUO8wWz8cLjRl8MQ2jCdKf2yGJpbDO0qUEcWyXtdwuSs8FUqqzflA7f+Jwg==
X-Received: by 2002:a63:e843:: with SMTP id a3mr18433249pgk.383.1589266511099;
        Mon, 11 May 2020 23:55:11 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6007:2f23:5151:5dd:ea86:4678])
        by smtp.gmail.com with ESMTPSA id w192sm11466011pff.126.2020.05.11.23.55.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 23:55:10 -0700 (PDT)
Date:   Tue, 12 May 2020 12:25:04 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v1 4/5] bus: mhi: core: Do not process SYS_ERROR if RDDM
 is supported
Message-ID: <20200512065504.GF4928@Mani-XPS-13-9360>
References: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
 <1589248989-23824-5-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589248989-23824-5-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 11, 2020 at 07:03:08PM -0700, Hemant Kumar wrote:
> Devices that support RDDM do not require processing SYS_ERROR as it is
> deemed redundant. Avoid SYS_ERROR processing if RDDM is supported by
> the device.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 467c0ba..1f622ce 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -397,9 +397,9 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  	}
>  	write_unlock_irq(&mhi_cntrl->pm_lock);
>  
> -	/* If device in RDDM don't bother processing SYS error */
> -	if (mhi_cntrl->ee == MHI_EE_RDDM) {
> -		if (mhi_cntrl->ee != ee) {
> +	 /* If device supports RDDM don't bother processing SYS error */
> +	if (mhi_cntrl->rddm_image) {
> +		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
>  			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
>  			wake_up_all(&mhi_cntrl->state_event);
>  		}
> @@ -735,6 +735,11 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  			{
>  				enum mhi_pm_state new_state;
>  
> +				/* skip SYS_ERROR handling if RDDM supported */
> +				if (mhi_cntrl->ee == MHI_EE_RDDM ||
> +				    mhi_cntrl->rddm_image)
> +					break;
> +
>  				dev_dbg(dev, "System error detected\n");
>  				write_lock_irq(&mhi_cntrl->pm_lock);
>  				new_state = mhi_tryset_pm_state(mhi_cntrl,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
