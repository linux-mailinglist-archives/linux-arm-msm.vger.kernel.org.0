Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33042A0758
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 15:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgJ3OCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 10:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgJ3OCX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 10:02:23 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFD5C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 07:02:23 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id k9so3588274pgt.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 07:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ISc5nQBiPKBkCUD0FqPQMI951i0fgSS+JWuYWbfTpnY=;
        b=CDE7axVNdhoy5/LK4tU1qT7/Fx3gwf+MspndSl9kEbfCu1go9OeqU5OhMOpGGsZwcy
         tkMoqBENa0JBjlpwDqjyWihbNb1mPqPhWMzOXby0h77FPv0+XyUHg6BS96BHCPGw58iJ
         2S7OahIEXYG2XHAskuQl2MiYfbkPNBs3WBhkAaxHxtGoJ60cj2MubOtf/KmA5XQQi8zE
         yTyvg7tLMqXW74XfLROKBrU037+7gNkvC+w8AHf0/usaCFXViX0RXpMgHLtT1jiJfcru
         sJM+QpkZFFX8nS3wNv6yXT8eE/gUV9Eq6F9s3vdKSsgYsDRHoaoFK8KjGmZ0/LNJDrA/
         lrqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ISc5nQBiPKBkCUD0FqPQMI951i0fgSS+JWuYWbfTpnY=;
        b=h26Qp+q9K2haA64RcjHhekj70ylfPe8WLwXSZ29pQrhRI15hhOwgoL4xjetQJEeDzA
         91OfXX4rt5k2Q63eJ6Bqk2oAX5nDbYGdxCnI0fYvn0zE91mqCIsZRRszcfMPdoyAlv6P
         ZJaZVZ2y9y+nZDt8cmhBEmR+uqH91vIAexzi+PbysrhSbheofrG3Y/Kkqk/HZuV8GSbb
         Aztab92FhHzQZHbwC4/eq0vPY59bhRHjekzj/Jy6sEYXlOQ/XcwkbEDKr8Kv1uG7l6tC
         pfBfrcx7Cf4YzemE+0qFd31PuGSQ50fiWBjKYeEOrKZA5tmME5ALP9/uXfPyb/ev5JeH
         KzLg==
X-Gm-Message-State: AOAM532ebE7E7wNXVmjpj3R7DTn1n6N1SGWHyCbrFFNhppDFyQyjTv4e
        zJXxxxwGwvbz3wrUwVWn9t9L98QKou93
X-Google-Smtp-Source: ABdhPJz3mAEMgeCOEShXfqH3OmH8DVLWhr8g930CTupxAYubNAWZX+b4xJhQ1ys5HTjNpJxZ2n70XQ==
X-Received: by 2002:aa7:9891:0:b029:161:690b:8dcf with SMTP id r17-20020aa798910000b0290161690b8dcfmr9560238pfl.65.1604066542713;
        Fri, 30 Oct 2020 07:02:22 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:918:28fe:10d5:aaf5:e319:ec72])
        by smtp.gmail.com with ESMTPSA id n2sm4096563pja.41.2020.10.30.07.02.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 07:02:21 -0700 (PDT)
Date:   Fri, 30 Oct 2020 19:32:16 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/12] bus: mhi: core: Check for IRQ availability
 during registration
Message-ID: <20201030140216.GK3818@Mani-XPS-13-9360>
References: <1604031057-32820-1-git-send-email-bbhatt@codeaurora.org>
 <1604031057-32820-10-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604031057-32820-10-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 29, 2020 at 09:10:54PM -0700, Bhaumik Bhatt wrote:
> Current design allows a controller to register with MHI successfully
> without the need to have any IRQs available for use. If no IRQs are
> available, power up requests to MHI can fail after a successful
> registration with MHI. Improve the design by checking for the number
> of IRQs available sooner within the mhi_regsiter_controller() API as
> it is required to be specified by the controller.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 2 +-
>  drivers/bus/mhi/core/pm.c   | 3 ---
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 23b6dd6..5dd9e39 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -858,7 +858,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  
>  	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
>  	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
> -	    !mhi_cntrl->write_reg)
> +	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs)
>  		return -EINVAL;
>  
>  	ret = parse_config(mhi_cntrl, config);
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 06adea2..1d04e401 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -926,9 +926,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  
>  	dev_info(dev, "Requested to power ON\n");
>  
> -	if (mhi_cntrl->nr_irqs < 1)
> -		return -EINVAL;
> -
>  	/* Supply default wake routines if not provided by controller driver */
>  	if (!mhi_cntrl->wake_get || !mhi_cntrl->wake_put ||
>  	    !mhi_cntrl->wake_toggle) {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
