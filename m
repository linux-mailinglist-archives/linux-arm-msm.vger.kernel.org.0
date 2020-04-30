Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9FD81C0337
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 18:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgD3Qz6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 12:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726272AbgD3Qz5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 12:55:57 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DCEC035495
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 09:55:56 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r4so3017055pgg.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 09:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IkRC+FQqxQAModbwkeMMyhs5RSaTy9rWO/DCP0foYTE=;
        b=rRg2l8P1/u3mc8/lpCDvRoC7tiQm7zvhfMdHXk4E9lVs+36fbJw2rrgqdexVLR6VTL
         7/YZZfpJF0hAf9Cr4ZJUFCANK0QU2EymYkq9wuHwkAaBACbOOXsg0+Sw6bzVfBcLkuaW
         FpKDqmFT5gHvIETNtpNOnMkvk0LiT/wEAQHUYQS0N5nqD/mWbjXxLk4H+5GqZ8Uv/2nO
         gDmWh/XQtyVLKVmTQN/TpxkgNMUTl6ZfWnq73ssmfJsHiphj3qvQjSvT31frUB84S2LI
         SUKF1EMw8HFcVekxPOU+N37rC6eN8CsNUYGJmaeQkTViIfFwnE+TGE0pLQbA3e8rzHO+
         zIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IkRC+FQqxQAModbwkeMMyhs5RSaTy9rWO/DCP0foYTE=;
        b=JVp59FTgKMnbARow8nFxKfav1dfqMHJHogqs8SsT1PDPn519yu2IgvjltmEmr/U9xK
         FKQOabMu0jKHN1D6YQBQtQeJBOKrZSjCLKu6qe1nKdof3cLc3+Sdwqa78I2xOjPqR++Q
         IANrN91m0VMMGewpRAsTISd3XSXvHGmkR6/WGX4/pdVnTIQWTzZpGCKrtI5oRpT3IUqn
         0sRBZVZ/bzu+7bKiPQtEnnBgunPiSOdF6C4KxEqChK7/bw6nQTS3P39zYynxKSgn/btj
         YunHXfiZ+fvZQWH4u+F0aLAfOw/A1xr8XlrzXkID137By/M7qeZBEeJfjtXHLAZz3tCm
         /oaA==
X-Gm-Message-State: AGi0PuZI3vYRzJx8g0ocaF0p87EnXDDda2NSvvR16zAax1tOeOrns+0t
        6J1u3XlGehHhbRBsVgzMtD8h2/7VZtsy
X-Google-Smtp-Source: APiQypImaqWpQO0pPoEzrFvNS29Qt/uPSBc5P7AZyu76+6F7gYdErHMZWXJRSXTWPQwXwWL3+d1lIg==
X-Received: by 2002:a62:24a:: with SMTP id 71mr249508pfc.98.1588265755643;
        Thu, 30 Apr 2020 09:55:55 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6081:946c:419e:a71:7237:1613])
        by smtp.gmail.com with ESMTPSA id m6sm275649pgm.67.2020.04.30.09.55.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 09:55:54 -0700 (PDT)
Date:   Thu, 30 Apr 2020 22:25:48 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] bus: mhi: core: Make sure to powerdown if
 mhi_sync_power_up fails
Message-ID: <20200430165548.GE9449@Mani-XPS-13-9360>
References: <1588003153-13139-1-git-send-email-jhugo@codeaurora.org>
 <1588003153-13139-2-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588003153-13139-2-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 27, 2020 at 09:59:08AM -0600, Jeffrey Hugo wrote:
> Powerdown is necessary if mhi_sync_power_up fails due to a timeout, to
> clean up the resources.  Otherwise a BUG could be triggered when
> attempting to clean up MSIs because the IRQ is still active from a
> request_irq().
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 52690cb..dc83d65 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -902,7 +902,11 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
>  			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
>  			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
>  
> -	return (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -EIO;
> +	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;
> +	if (ret)
> +		mhi_power_down(mhi_cntrl, false);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(mhi_sync_power_up);
>  
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
