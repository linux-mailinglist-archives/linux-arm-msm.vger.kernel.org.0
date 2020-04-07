Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE301A0738
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 08:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgDGG0u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 02:26:50 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41416 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgDGG0t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 02:26:49 -0400
Received: by mail-pl1-f194.google.com with SMTP id d24so842537pll.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2020 23:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ONLftnGsLl++P31s2gjavTkjMaFjGxacNpYiF6aPBEQ=;
        b=OprSWA3K1+DI82/GVLD9pVzmKVKvVfeO4Tz9H3QiOUDtsw81ckghYK6DmWwGFoyB9X
         Ftt1C2XBTnGx5FJ4C3dZaR72V0ZRplOEfo6sldDkl31sFjawtkBr01zebwSXsX1vs2xq
         Jf4YZfmwVGrWaOKs+bev2CeGKwbjQl5bUcBSSP+sPhhCYPi5rgtyPyRcroE5/FHTAaAe
         y4Rfvb8ZIGhtJFvkztdIoQJD3759m2Dq//g5xGG7N3blFCWa/zcUvFaqm78M6g+28EEi
         CF1rPQ4TtLDmvYPusnpFRFLs4itFj8ojJRYgzJZlEA3SeFgTP8WegMwDQZFYMJKLmMSc
         ZQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ONLftnGsLl++P31s2gjavTkjMaFjGxacNpYiF6aPBEQ=;
        b=EH9q/NRIXcxuWEi+/mmgLJLOa3suuxqkk0qqs9oEqLeHl7dOBLuPOyzRP+wCw6Xari
         /ijDE6seRxzfvhaVUOl2bMwOe6jNb1EpA8b5TATMlivfgpQlHWfhXN6m/LUSjB7jAQ17
         k0X5GBJhUVU3gLzWrDwRI3/SZmT/D0DzmsSos+XUlZluPO2kwXKyNbu49DB207ly5+vS
         GjSfyjca2KLS4r6tUorfyHMHThekHvkJdFXBLjZIcISLGBPtrnyHS1gIyBDSJq/nVoYz
         1Z6NYXRrrRKHSE/5UvhiAeQZ3jQ58OmsAn1qhVwI2SR+aQYQS0hVCMHzBCXXcSFtqaCI
         hDBA==
X-Gm-Message-State: AGi0PubZDNee5Ek7wQQ9TJxAeKnXYcbyZmztncL1kwEygKNJLhvfHMSO
        GlCNdyqT8yNdndS3PPf9nenc6A3nrg==
X-Google-Smtp-Source: APiQypI9BlB6ZX2djP+LrPTOJe/2qMnYzGoY4h/zCFG5I5AcCjtUrVcQEj8zGgLQmIIj8cftH5wVGA==
X-Received: by 2002:a17:902:c595:: with SMTP id p21mr1008197plx.17.1586240806501;
        Mon, 06 Apr 2020 23:26:46 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e86:d03b:80dc:a9ff:fe0a:9bd3])
        by smtp.gmail.com with ESMTPSA id mu15sm716327pjb.30.2020.04.06.23.26.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 23:26:45 -0700 (PDT)
Date:   Tue, 7 Apr 2020 11:56:41 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] bus: mhi: core: Handle syserr during power_up
Message-ID: <20200407062641.GC2442@Mani-XPS-13-9360>
References: <1586207077-22361-1-git-send-email-jhugo@codeaurora.org>
 <1586207077-22361-2-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586207077-22361-2-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 06, 2020 at 03:04:35PM -0600, Jeffrey Hugo wrote:
> The MHI device may be in the syserr state when we attempt to init it in
> power_up().  Since we have no local state, the handling is simple -
> reset the device and wait for it to transition out of the reset state.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  drivers/bus/mhi/core/pm.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 52690cb..cd6ba23 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -9,6 +9,7 @@
>  #include <linux/dma-direction.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/interrupt.h>
> +#include <linux/iopoll.h>
>  #include <linux/list.h>
>  #include <linux/mhi.h>
>  #include <linux/module.h>
> @@ -760,6 +761,7 @@ static void mhi_deassert_dev_wake(struct mhi_controller *mhi_cntrl,
>  
>  int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  {
> +	enum mhi_state state;
>  	enum mhi_ee_type current_ee;
>  	enum dev_st_transition next_state;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> @@ -829,6 +831,24 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  		goto error_bhi_offset;
>  	}
>  
> +	state = mhi_get_mhi_state(mhi_cntrl);
> +	if (state == MHI_STATE_SYS_ERR) {
> +		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
> +		ret = readl_poll_timeout(mhi_cntrl->regs + MHICTRL, val,
> +					 !(val & MHICTRL_RESET_MASK), 1000,

Hmm. Do we really need a max 1ms delay between each read? I'd prefer to have
100ns to reduce the wait time.

> +					 mhi_cntrl->timeout_ms * 1000);
> +		if (ret) {
> +			dev_info(dev, "Failed to reset syserr\n");

dev_info(dev, "Failed to reset MHI due to syserr state\n"); ?

Thanks,
Mani

> +			goto error_bhi_offset;
> +		}
> +
> +		/*
> +		 * device cleares INTVEC as part of RESET processing,
> +		 * re-program it
> +		 */
> +		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
> +	}
> +
>  	/* Transition to next state */
>  	next_state = MHI_IN_PBL(current_ee) ?
>  		DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
