Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62142A8081
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 15:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730791AbgKEONJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 09:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729113AbgKEONJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 09:13:09 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94905C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 06:13:07 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id i26so1512520pgl.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 06:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5UuZzeGQfBQQ8ri5zKvxcs8SpoLtbPsWaz4LhKSBtCI=;
        b=xKtLuwuiMdsTKVy5mfc8UkzzwH8TvFeD+K5QA+Ixeg/DWYfd21zlM6JTJezYMCjgkA
         w6nVXiV6BBUBtjuJPw7LV1z+udXZCFOikb1YTosi/G+VeevyKQWpauQWBwJ2WRjnX66S
         Biz+DMBZGbqlcDoT70kaJL1W6T3R/RVdOP+Xv39IGRzPhhhYWAmXjf7RsURVMWk6kl0Z
         qTNFT67BJyi81pioM8ZhzAB7q88zgDfKtT8wCTlmSZsW3O74YAdPGtjuewPO0DPWrJNy
         S8AhxU0AMjQKcOsQc8YEdHvNiMvh1DrMlFzEbCA5MT5IMG6pwDrDZ7eOFVNPylMVbTAq
         i4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5UuZzeGQfBQQ8ri5zKvxcs8SpoLtbPsWaz4LhKSBtCI=;
        b=az340OWLW1jEZJ+0jlqvniLqTapuiW59Ocza8MMBokSKRmFYHu3p3g2FoI3h7Ti6AA
         26fAfy7t+YlbyeUNYuLdesjUGqsAZcjP4pTs3+VfHfRryNi+nL9VMR7OL82VtQfzzBQo
         KEmQ3+gTkmTDmF4ZAdptZl9o5mbbo1O6SzYVIBP/pmck+G5q2JYEbL0LxX6IKNfUn3kq
         0rhtN8k9JW4Z8EJGFLlCQNF6XysiZKMwUI1C7PXQ6do5chv1M3LmbNuuD0IFwtzkbRym
         mVeYADvCrNd7p0W4OyN+XS+kGLuCtpVuxE3/aCb6cUswj4wmfjPfCu0vRZcO3E+Vg8X3
         PDOQ==
X-Gm-Message-State: AOAM530xZg4YSYBcEvtIBJBhbRrvW/7Y4Emy2oFblVsO/iAoC9Fxr027
        ZaGKeOZkguIUPtKHmg2kDNNp
X-Google-Smtp-Source: ABdhPJyRP48GT1hJI2tQA7hHQE6x4fqodX/4TnhObDrQaJxymfuKLJGdYeet+yGph51alKZkxFupRQ==
X-Received: by 2002:a63:5804:: with SMTP id m4mr2513254pgb.31.1604585587098;
        Thu, 05 Nov 2020 06:13:07 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id o4sm2418791pjs.53.2020.11.05.06.13.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Nov 2020 06:13:06 -0800 (PST)
Date:   Thu, 5 Nov 2020 19:43:01 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: fix potential operator-precedence with
 BHI macros
Message-ID: <20201105141301.GD7308@work>
References: <1603225785-21368-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603225785-21368-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 20, 2020 at 02:29:45PM -0600, Jeffrey Hugo wrote:
> The BHI_MSMHWID and BHI_OEMPKHASH macros take a value 'n' which is
> a BHI register index. If 'n' is an expression rather than a simple
> value, there can be an operator precedence issue which can result
> in the incorrect calculation of the register offset. Adding
> parentheses around the macro parameter can prevent such issues.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/internal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 7989269..78e4e84 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -153,8 +153,8 @@ extern struct bus_type mhi_bus_type;
>  #define BHI_SERIALNU (0x40)
>  #define BHI_SBLANTIROLLVER (0x44)
>  #define BHI_NUMSEG (0x48)
> -#define BHI_MSMHWID(n) (0x4C + (0x4 * n))
> -#define BHI_OEMPKHASH(n) (0x64 + (0x4 * n))
> +#define BHI_MSMHWID(n) (0x4C + (0x4 * (n)))
> +#define BHI_OEMPKHASH(n) (0x64 + (0x4 * (n)))
>  #define BHI_RSVD5 (0xC4)
>  #define BHI_STATUS_MASK (0xC0000000)
>  #define BHI_STATUS_SHIFT (30)
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
