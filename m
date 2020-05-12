Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13C221CED57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 08:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbgELGx6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 02:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726187AbgELGx6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 02:53:58 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A9DC061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 23:53:56 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id s69so756884pjb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 23:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wyNaJ3zN4Vkp26MdzcthIVdng2NufArv0F1CXYz6F90=;
        b=fmvWvZgbgLMar4pR1vmLZAtNWuAKGDNiThvpBT8BeYvKCG+/zU0Dxw6mDEEAz3ndcs
         1yhQlafBLMcvEqRlYnE0fpQa+Jz9jAWnTtvSPP007//HMIhEfwypWvAYJyaPVPP60smb
         s8GubIMYXMXKb6D1yvyDQ0QbEVEbMy8fM8BiJWC7opUuA9hPFmzw50VoM+UhspjjxkVB
         0DQ8LrbTuJl/LyJxaLQg6xLDAc797YJVBNCdVBqNLpFlnlgcRpmDoFgZ8kjATzG8egGR
         1Rk2xncKIwHkeyGrq6L7XLXLvUDxhTP1tb9pu/ZQ5qQVcify7A6RqiKELb51aVhsju4l
         zfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wyNaJ3zN4Vkp26MdzcthIVdng2NufArv0F1CXYz6F90=;
        b=Wg83tnljQtmALLNm02J81c/KV6I30krQ241gCYHvK8xFuiW/4sl28l4e2F1TFzqN9V
         epVQ1CbdnBDgluGmz5JMnCQ0s2vpnZ4K2RsOrHP1D64MLdoMxjhyMWhU2y44xrSrYE7D
         7ixbwbCDHywArVabgVIyrvXBKFfNMbQnYeg7Ip6bA0OBYxDf2ExXNmuFLQ2YHWRKe6uE
         rkKkRnQP9zOnep+wXQJYuxaKb2wRLZY0ep92namInxsX7jX1nRctDcStVqx3M2NySWFR
         meeceqDaOu9Lf34ThJFxbhFlDHQmN4+bjL93vm5kccm0VQ0TSMzHO3XxRmvqS+EBoKne
         g6Eg==
X-Gm-Message-State: AGi0PubJ6fia6Qv519QN/IK4I3/BdRYIkiFvUyHq4yj/Qz0CycghUyqT
        EmMiyaQu3N1kiGqJCIRI7LAIiT4bQQ==
X-Google-Smtp-Source: APiQypLd4Q8FRQeSS4aja8UQ+rcrF6uwdIZBUbTxU4Ll1+49mUWasLX1xXwdr42uvVfHoS4giHEaMg==
X-Received: by 2002:a17:902:9a95:: with SMTP id w21mr18607769plp.117.1589266435964;
        Mon, 11 May 2020 23:53:55 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6007:2f23:5151:5dd:ea86:4678])
        by smtp.gmail.com with ESMTPSA id g74sm11157775pfb.69.2020.05.11.23.53.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 23:53:55 -0700 (PDT)
Date:   Tue, 12 May 2020 12:23:49 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v1 3/5] bus: mhi: core: Skip handling BHI irq if MHI reg
 access is not allowed
Message-ID: <20200512065349.GE4928@Mani-XPS-13-9360>
References: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
 <1589248989-23824-4-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589248989-23824-4-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 11, 2020 at 07:03:07PM -0700, Hemant Kumar wrote:
> Driver continues handling of BHI interrupt even if MHI register access
> is not allowed. By doing so it calls the status call back and performs
> early notification for the MHI client. This is not needed when MHI
> register access is not allowed. Hence skip the handling in this case and
> return. Also add debug log to print device state, local EE and device EE
> when reg access is valid.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  drivers/bus/mhi/core/main.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 9ec9b36..467c0ba 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -369,22 +369,29 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
>  	return IRQ_HANDLED;
>  }
>  
> -irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *dev)
> +irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  {
> -	struct mhi_controller *mhi_cntrl = dev;
> +	struct mhi_controller *mhi_cntrl = priv;
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	enum mhi_state state = MHI_STATE_MAX;
>  	enum mhi_pm_state pm_state = 0;
>  	enum mhi_ee_type ee = 0;
>  
>  	write_lock_irq(&mhi_cntrl->pm_lock);
> -	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> -		state = mhi_get_mhi_state(mhi_cntrl);
> -		ee = mhi_cntrl->ee;
> -		mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
> +	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> +		write_unlock_irq(&mhi_cntrl->pm_lock);

write_lock is only used for protecting 'mhi_cntrl->ee' but here we are not
updating it if reg access is not valid. So there is no reason to hold this lock.

> +		goto exit_intvec;
>  	}
>  
> +	state = mhi_get_mhi_state(mhi_cntrl);
> +	ee = mhi_cntrl->ee;
> +	mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);

But it is needed here.

Thanks,
Mani

> +	dev_dbg(dev, "local ee:%s device ee:%s dev_state:%s\n",
> +		TO_MHI_EXEC_STR(mhi_cntrl->ee), TO_MHI_EXEC_STR(ee),
> +		TO_MHI_STATE_STR(state));
> +
>  	if (state == MHI_STATE_SYS_ERR) {
> -		dev_dbg(&mhi_cntrl->mhi_dev->dev, "System error detected\n");
> +		dev_dbg(dev, "System error detected\n");
>  		pm_state = mhi_tryset_pm_state(mhi_cntrl,
>  					       MHI_PM_SYS_ERR_DETECT);
>  	}
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
