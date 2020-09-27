Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD42279DAA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Sep 2020 05:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbgI0DOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 23:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgI0DOW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 23:14:22 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A606FC0613D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 20:14:22 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id md22so977294pjb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 20:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=l+d6MJHsVJnmGlH0O2IkJ1VifMVJbP89kc5QzKS4YXc=;
        b=SLiKyRvGZGWO+RQwPfkQ0TD1MCGeKiepuJsOrIsOaUpqc+4mfUy/SwoD554osUIbrk
         3b+TgMvhH2GE6L/p60DhJRvN3mxTXQDd99ye4iXvxfChvSS1T0OSJs4+4y687fZzt8+C
         5JMIPwwsGVM6FWuM0d0gwfmzUmji8Iq/ymXOv0EpIN2yUT5i5MC7xoXE7bNKET6+MlQ+
         RykFNBEm60j0jXn9rtkNUpBWApxeZf0YyE7wpKR66MYZAUjF5AuNyh2JY3YErye+C67B
         Bd3tNy2Jkw87LDpjhSvStPeuSG4nUnsGv4SA+qifVQGoIEQDR9vMMng/JcgRvn24Kcip
         JEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l+d6MJHsVJnmGlH0O2IkJ1VifMVJbP89kc5QzKS4YXc=;
        b=q/Kw3FQcLehDyYR+aZdHEncWgY1rSwk1jCX4+IKevUth6dn0+ySnvRrtXvzByJhpCU
         WJnyqW3cmzqRR5uVFmMUU+ggnS41ntRaWHWQTjzWq5fjVIGQn0+/OTfyBOy158qQujw7
         +Is8O5J1bfNP6sL8nfdcUNVl3HJKnRtqfU2PhdGAmhYZ4KwHFwSuYTy2yguJzvMVD5Yw
         zPTMwITq5oz7bz8lYifIJ4T9A0A7xkqsLNmkOv3eybWr0uVL/1hXjuwagPxB9kuJbch6
         053dJBxV0iqe3TqPCHb6yy5+xcQ+lT4d5mdiCipJyBNnTSXZDUo2eBDulyFA68OMAt/6
         rV6w==
X-Gm-Message-State: AOAM530fCaNUi+k11lBGA04BC0Ibwh8aa47rmXXtx2j1Pt2eGefuOw/C
        UPfui0wIc0exnJb9qhwrBYWD
X-Google-Smtp-Source: ABdhPJxppMQt/uFjVJXkCvar8TSf/LjNz7OulS16I1duHVfAZ7x1BK1/cFf4cUyCfoKFErbe6kwYOw==
X-Received: by 2002:a17:90b:115:: with SMTP id p21mr4125594pjz.198.1601176462102;
        Sat, 26 Sep 2020 20:14:22 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:198:cd53:8f:5b5c:829a:cfde])
        by smtp.gmail.com with ESMTPSA id k11sm2989080pjs.18.2020.09.26.20.14.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 26 Sep 2020 20:14:21 -0700 (PDT)
Date:   Sun, 27 Sep 2020 08:44:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v6 2/4] bus: mhi: core: Move MHI_MAX_MTU to external
 header file
Message-ID: <20200927031415.GE3213@Mani-XPS-13-9360>
References: <1600286167-4432-1-git-send-email-hemantk@codeaurora.org>
 <1600286167-4432-3-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600286167-4432-3-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 16, 2020 at 12:56:05PM -0700, Hemant Kumar wrote:
> Currently this macro is defined in internal MHI header as
> a TRE length mask. Moving it to external header allows MHI
> client drivers to set this upper bound for the transmit
> buffer size.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/internal.h | 1 -
>  include/linux/mhi.h             | 3 +++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 7989269..4abf0cf 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -453,7 +453,6 @@ enum mhi_pm_state {
>  #define CMD_EL_PER_RING			128
>  #define PRIMARY_CMD_RING		0
>  #define MHI_DEV_WAKE_DB			127
> -#define MHI_MAX_MTU			0xffff
>  #define MHI_RANDOM_U32_NONZERO(bmsk)	(prandom_u32_max(bmsk) + 1)
>  
>  enum mhi_er_type {
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 6565528..610f3b0 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -16,6 +16,9 @@
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  
> +/* MHI client drivers to set this upper bound for tx buffer */
> +#define MHI_MAX_MTU 0xffff
> +
>  #define MHI_MAX_OEM_PK_HASH_SEGMENTS 16
>  
>  struct mhi_chan;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
