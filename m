Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA282001A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 07:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbgFSFeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 01:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgFSFeA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 01:34:00 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26EFC06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 22:34:00 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id n2so3464624pld.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 22:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ab8+1YMk6qjzS4WRHwARDFcpXcgAOo18p41t0NQx6jc=;
        b=NYZ9yPCYhNcCISQU8JivT8GyG4YIK2LHpuB3yOr0WOnekmzKbKXvKnaIathUoNvN1f
         KEqFtz3fL9PjzxXH8TRyQKSczxPuZ3vS8xA5yTgsG7Ik7G39w6E/Q9wLeohO5vkzWILA
         MUj+YO2v3CSj99s5Yhykj3b6Xjqr2eGtpNM/76VsK2baIGvviy3zRVPJvhk6XeCfEWji
         acMqT7fOvAY8TOTMJMAChP8P8X9YBs48yDCUfsVCm4v3p4q52uxbUtop4+wnjNSt3OUO
         /i4hTWVJ6vAZMJ3Ce2VfAC4QaMuYoZmdQ67qBFT5ucbaYsp5YdupvTS6TJZHiteIIz6a
         q9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ab8+1YMk6qjzS4WRHwARDFcpXcgAOo18p41t0NQx6jc=;
        b=rRtkXHDut5DQxY1n5bGfBkWUDy02anomlVNUW5VgAKy9djxbY6CuRxfQWdE44uh4Xn
         1axHXdbIgN/N8+3XKs480p4Pgy2YC/uB7KGA/l2O5jus3ymawMpxt/SQPZ7h44NiB2Mw
         UY4qTwe/bpg4muVWXEUqUOTKMUwn3aMqajHTnhvM/VOA6HuuMObGG0/hn2FoELuYihhC
         avhime60zF2a4hGyV5sb68z5AWj4yTKxuCdsr6S+PFq3JiQZE79zQ9Zr1H94dmyTrQHx
         j/OCuZIrr0Vg0yE8cBzUF3e6Ko79hkscqorfHs3I+MX5e619UYr9i6y6cGPdGOz4jWWP
         lTZw==
X-Gm-Message-State: AOAM532YLCETuUjeyLM/LunNza5JoOMZxpsDg1JxAA2Ush+QZzIFOZPZ
        7ZANMlRG11nXYiXzkaKwe3pe
X-Google-Smtp-Source: ABdhPJwbqUV4rSkjtmLB7sxVU1E9G9lR6L4110+rxIdkoT+3XVyK3pZE+So8AwwRmjRnOJWVuHor1A==
X-Received: by 2002:a17:902:a50e:: with SMTP id s14mr68845plq.334.1592544839966;
        Thu, 18 Jun 2020 22:33:59 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:59f:c065:651a:bc24:a9bb:ff41])
        by smtp.gmail.com with ESMTPSA id p12sm4566629pfq.69.2020.06.18.22.33.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 22:33:59 -0700 (PDT)
Date:   Fri, 19 Jun 2020 11:03:53 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v3 2/4] bus: mhi: core: Move MHI_MAX_MTU to external
 header file
Message-ID: <20200619053353.GB3245@Mani-XPS-13-9360>
References: <1591899224-3403-1-git-send-email-hemantk@codeaurora.org>
 <1591899224-3403-3-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591899224-3403-3-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 11, 2020 at 11:13:42AM -0700, Hemant Kumar wrote:
> Currently this macro is defined in internal MHI header as
> a TRE length mask. Moving it to external header allows MHI
> client drivers to set this upper bound for the transmit
> buffer size.
> 

So we have 2 definitions for MHI_MAX_MTU now? Why can't you remove the one
available internally?

Thanks,
Mani

> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> ---
>  include/linux/mhi.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index a39b77d..ce43f74 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -16,6 +16,9 @@
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  
> +/* MHI client drivers to set this upper bound for tx buffer */
> +#define MHI_MAX_MTU 0xffff
> +
>  #define MHI_VOTE_BUS BIT(0) /* do not disable the mhi bus */
>  #define MHI_VOTE_DEVICE BIT(1) /* prevent mhi device from entering lpm */
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
