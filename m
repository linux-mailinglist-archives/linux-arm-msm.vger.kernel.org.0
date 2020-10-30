Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3F12A074E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 15:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgJ3OBD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 10:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbgJ3OBB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 10:01:01 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 823C4C0613D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 07:01:01 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t22so2975482plr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 07:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2MSAeCH3QM276fplDLnVy7fqn4yS738m2GKwo7OKqjI=;
        b=AoS23AjEXc9VutDc6Sicyfm/RLV0v2wlGhaN4jb1UdGMvyCa4djxbO0WZzhJG9naKX
         IJHdqs/WU+V5qK1JIWBk8k1ZTgE9iAW5oPi3aSG2Q0bIXUIbFBo106ART/EafHLjuW1Q
         get6UyUTj0oRolOCm/KMGpC33kVwv2glcw5IPY9xquatCEuYx1cN1FgP4TKwVavMy0EV
         AMiUOcZ3Nu+naUZngfLlB2BqeFKv9RcRTHz08X7AMn/Pc5Iqhg6S94l5/PSuFrdY1XkO
         PCmwNteckYpVuXZWp7FkkTPikXAKXQvBrnFDXBEZKG9m6zFNTS+m8hEQYPBTCnVEZ4VR
         n8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2MSAeCH3QM276fplDLnVy7fqn4yS738m2GKwo7OKqjI=;
        b=hR/rAc/Pfx5B2d5XP8sJ8e/txLg6EGbdrlqKrl9pZJM/DD1PFyyEzz7FGkfBGxyZkI
         HP0ZLtp3I+AyeXdyqtVXYBgUybatF0Uz0tW+wy0u0LxmgPcsuHdE729GkR8zeJPeCmmC
         1oT1regZ+DfCos//6qr4bgRuNVt2DXBwYb2I797/f/k51G5Q08kk19edCW4NM+haf+Y1
         NjMwh46ucSUhrVxlgCnIbU+JNcC19JcDEh3kNNypzqJJ8vdPbhP9T6LzZXgSnGXM2us8
         qReFc3x+4nKRskQE6BmvC3d3OapE6K1DgIoC5OJ6GxjQRugRfb5A/j63ZTx/GOUcHVKx
         eJjQ==
X-Gm-Message-State: AOAM533HSfAeSj4UtbDsNl1ioy+z5ZTRsDv+PDjCXkRjm13sQ1jfHvaQ
        a47zNNZirL5akmHr0M0+sB38
X-Google-Smtp-Source: ABdhPJwvUhTxBXYf3P8x5mixVdH5x4naFfc0F2KhmuqfeHFEQ1aUhjl/79mviAspjEYXF0exYKOpfg==
X-Received: by 2002:a17:902:788a:b029:d6:b9f:820a with SMTP id q10-20020a170902788ab02900d60b9f820amr8810013pll.76.1604066461007;
        Fri, 30 Oct 2020 07:01:01 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:918:28fe:10d5:aaf5:e319:ec72])
        by smtp.gmail.com with ESMTPSA id 15sm5705121pgs.52.2020.10.30.07.00.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 07:01:00 -0700 (PDT)
Date:   Fri, 30 Oct 2020 19:30:54 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/12] bus: mhi: core: Use appropriate label in
 firmware load handler API
Message-ID: <20201030140054.GJ3818@Mani-XPS-13-9360>
References: <1604031057-32820-1-git-send-email-bbhatt@codeaurora.org>
 <1604031057-32820-8-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604031057-32820-8-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 29, 2020 at 09:10:52PM -0700, Bhaumik Bhatt wrote:
> Correct the "error_read" label to say "error_ready_state" as that
> is the appropriate usage of the label.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/boot.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index cec5010..6b4c51e 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -494,7 +494,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  
>  	if (ret) {
>  		dev_err(dev, "MHI did not enter READY state\n");
> -		goto error_read;
> +		goto error_ready_state;
>  	}
>  
>  	/* Wait for the SBL event */
> @@ -505,7 +505,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  
>  	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>  		dev_err(dev, "MHI did not enter SBL\n");
> -		goto error_read;
> +		goto error_ready_state;
>  	}
>  
>  	/* Start full firmware image download */
> @@ -521,7 +521,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  
>  	return;
>  
> -error_read:
> +error_ready_state:
>  	mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>  	mhi_cntrl->fbc_image = NULL;
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
