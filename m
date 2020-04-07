Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 393721A06D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 07:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgDGF6Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 01:58:16 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36429 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgDGF6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 01:58:16 -0400
Received: by mail-pl1-f193.google.com with SMTP id g2so831911plo.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2020 22:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mkkw7HsdsJ8ydDnLOtRctgaXg7Haji601TbSqQUyjew=;
        b=T4LH1noLUmRLe2l2HO15LEtgTf4lyQiuoIRXqKDmj9g6n9SvAQGTMugQrNhl75a42C
         /iz9SFRSo4ZqSL/jxCXQQTgjvxYkpuIrM8Oy18cR8Lw3TxKKRV64/Hh8K8Tw5UuUa7H4
         2Awb5m2UhpSifx0B2gznOlTDcgw0OMB87F7mMN1GMw1A+D27giVr1XOU8CemGd1DLdaM
         Q3TrHETs3KdMVYJ9jb2HcT4p/J/l/qCX9tuMm4fixZzncSXSL5jMVT4cndH6DxMlvV+t
         Y52EYcvsPiD6pxXmizTO4TjwgnC8B4uM+dlBi7Sx3SCyIFZYs3YEW+ASg6HYZMsa8lBg
         l88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mkkw7HsdsJ8ydDnLOtRctgaXg7Haji601TbSqQUyjew=;
        b=Wcx76f/kgPIOxo6R2aKPleDj0jfbkel7FpTiD8HsFqbyDdcAIcdVQcn5E65VajTUSR
         mk3ufCUapF8A6EJEV3pW0WHe4OzYwoIyTFrD4tuNOZVS6wJMn0tU82zxGLMovl/R7Fv+
         lfEW76H3G57jIRHdPz47JcOE0gB3o3z7T6qEL5uLpN4YBh683mlv3hTX3rt2Y3Yw+2Xw
         WEEvQI8zeYoW0RF2/NtYWSCifZu8igOoIM/M+jPZKSfBdqjr8FYm6ggQhS1kVRtmZBWD
         JyVAo7jXpZdJhpIWOcPQjTHvHfOcBkzoxlNY0MqLPGq+stBrLiI/E7xQqj6gEHKnzHH6
         6B6g==
X-Gm-Message-State: AGi0PubVL9knJ3fZ9/P9jhuoWBDwuilir1hjhe3/trioEe8HnrcxoWDF
        rOmNDA7gULJ36uXFHyWTdfvn7dJeeg==
X-Google-Smtp-Source: APiQypKJvimi7K4OYZ1ob9edTMz1xawkbUnf1BMEqllLXelvAPrGFk7X7/IadWa+IrHsVoNjWE/aww==
X-Received: by 2002:a17:90a:bf84:: with SMTP id d4mr822823pjs.82.1586239094202;
        Mon, 06 Apr 2020 22:58:14 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e86:d03b:80dc:a9ff:fe0a:9bd3])
        by smtp.gmail.com with ESMTPSA id b133sm13264940pfb.180.2020.04.06.22.58.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 22:58:13 -0700 (PDT)
Date:   Tue, 7 Apr 2020 11:28:09 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] bus: mhi: core: Remove link_status() callback
Message-ID: <20200407055809.GA2442@Mani-XPS-13-9360>
References: <1586207077-22361-1-git-send-email-jhugo@codeaurora.org>
 <1586207077-22361-4-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586207077-22361-4-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeff,

On Mon, Apr 06, 2020 at 03:04:37PM -0600, Jeffrey Hugo wrote:
> If the MHI core detects invalid data due to a PCI read, it calls into
> the controller via link_status() to double check that the link is infact
> down.  All in all, this is pretty pointless, and racy.  There are no good
> reasons for this, and only drawbacks.
> 
> Its pointless because chances are, the controller is going to do the same
> thing to determine if the link is down - attempt a PCI access and compare
> the result.  This does not make the link status decision any smarter.
> 
> Its racy because its possible that the link was down at the time of the
> MHI core access, but then recovered before the controller access.  In this
> case, the controller will indicate the link is not down, and the MHI core
> will precede to use a bad value as the MHI core does not attempt to retry
> the access.
> 
> Retrying the access in the MHI core is a bad idea because again, it is
> racy - what if the link is down again?  Furthermore, there may be some
> higher level state associated with the link status, that is now invalid
> because the link went down.
> 
> The only reason why the MHI core could see "invalid" data when doing a PCI
> access, that is actually valid, is if the register actually contained the
> PCI spec defined sentinel for an invalid access.  In this case, it is
> arguable that the MHI implementation broken, and should be fixed, not
> worked around.
> 
> Therefore, remove the link_status() callback before anyone attempts to
> implement it.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>

LGTM. But as per the IRC discussion I'd like the mhi_reg_read() to be
implemented as a callback in mhi_controller struct inorder to truly make MHI
a PCI agnostic bus.

Since we don't have any controller driver in mainline, I think it is the
good time to do this change.

For this,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 6 ++----
>  drivers/bus/mhi/core/main.c | 5 ++---
>  include/linux/mhi.h         | 2 --
>  3 files changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index b38359c..2af08d57 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -812,10 +812,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	if (!mhi_cntrl)
>  		return -EINVAL;
>  
> -	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put)
> -		return -EINVAL;
> -
> -	if (!mhi_cntrl->status_cb || !mhi_cntrl->link_status)
> +	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
> +	    !mhi_cntrl->status_cb)
>  		return -EINVAL;
>  
>  	ret = parse_config(mhi_cntrl, config);
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index eb4256b..473278b8 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -20,9 +20,8 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
>  {
>  	u32 tmp = readl(base + offset);
>  
> -	/* If there is any unexpected value, query the link status */
> -	if (PCI_INVALID_READ(tmp) &&
> -	    mhi_cntrl->link_status(mhi_cntrl))
> +	/* If the value is invalid, the link is down */
> +	if (PCI_INVALID_READ(tmp))
>  		return -EIO;
>  
>  	*out = tmp;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index ad19960..be704a4 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -335,7 +335,6 @@ struct mhi_controller_config {
>   * @syserr_worker: System error worker
>   * @state_event: State change event
>   * @status_cb: CB function to notify power states of the device (required)
> - * @link_status: CB function to query link status of the device (required)
>   * @wake_get: CB function to assert device wake (optional)
>   * @wake_put: CB function to de-assert device wake (optional)
>   * @wake_toggle: CB function to assert and de-assert device wake (optional)
> @@ -417,7 +416,6 @@ struct mhi_controller {
>  
>  	void (*status_cb)(struct mhi_controller *mhi_cntrl,
>  			  enum mhi_callback cb);
> -	int (*link_status)(struct mhi_controller *mhi_cntrl);
>  	void (*wake_get)(struct mhi_controller *mhi_cntrl, bool override);
>  	void (*wake_put)(struct mhi_controller *mhi_cntrl, bool override);
>  	void (*wake_toggle)(struct mhi_controller *mhi_cntrl);
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
