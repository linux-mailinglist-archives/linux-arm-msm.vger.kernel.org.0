Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83EF0294FED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 17:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502452AbgJUPXy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 11:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502328AbgJUPXy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 11:23:54 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32BACC0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 08:23:54 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id bh6so815999plb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 08:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VJt9mpGw3XVLr896N5J+yAHDMbRZltPHKTigqN+nL2A=;
        b=gACjmOgPvCkWNF7wjR5zlSrIOcPkspaajkYXUm27/lMdpQgZC6kA8xfliZmASpA4sd
         x1/SxpB7Vcc2Zx2bW7/Aqo4qeiTjg+vYSt8wZJUoCWrm/13vqk+T31WCsnsY+rUFDQ8E
         xOhY6dN6aBQZL1cX12GfJCfPT8J9GOXjuw8Ks83sRt9+F2xOMB6V3NvyLlqm11wxi7xk
         NAMflSjrgUHQpAOr13ym/NOAvq/PQyzLppAuEp+8OjUGSe5vGbTmoZ3Bje1RfE/ZmdUH
         /J/u0WUKwD2WSN1adturfNYbdx8QDdJxV8aDf5xNhbqv1LnJBwbzPW+7/3iPLiQ6hj3h
         SaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VJt9mpGw3XVLr896N5J+yAHDMbRZltPHKTigqN+nL2A=;
        b=MGmk319UNmZ1UX+4rveUDHvRaXwuEqJi/wZimQfXAVSXkiwuHg0ChND4TYigOae4+X
         b7lqCebmIh1OORP5YmB50imhupKg/UgfwSFKHbYCq2mpm7Z09C+yZewo2CY7TlTabvTV
         byYdYmhpCq7l0XhKuxuQBV+wqNXhdxnDr3yI4FczRtGF6zY+0uvnDeKKMe5j23K2cZXt
         D7B9u2sIHgs3UcIOBhevmi4uZTrJrRAkcekK5E2zlIgiPZTsgZUEZK7ZdNWolzXS4dx5
         kDEMXPDavOPG0aWzNXxOcdaX+fvz6nHiDKYzyXBMrz7yPxAaAy4754M4fIbgWgR6IRNX
         nazw==
X-Gm-Message-State: AOAM533xtRdllZRnGNGrZpzpitMdB5leNMwB87F6uy7hvzJvrYQha5gv
        P9VTp1v9OUFBBIgpKLO+xMb5sF0RyPrm
X-Google-Smtp-Source: ABdhPJybEqWhquCChr+znUy67PAOtl0jxYpXKn2UoKv0jw6Hp8vNIki/CWSLvezi74dVRjn7ONVyqg==
X-Received: by 2002:a17:90a:aa90:: with SMTP id l16mr3865288pjq.0.1603293833626;
        Wed, 21 Oct 2020 08:23:53 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:70e:2a27:314a:6d22:ec47:a603])
        by smtp.gmail.com with ESMTPSA id z5sm2615951pfn.20.2020.10.21.08.23.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 08:23:52 -0700 (PDT)
Date:   Wed, 21 Oct 2020 20:53:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, loic.poulain@linaro.org
Subject: Re: [PATCH v7 2/4] bus: mhi: core: Move MHI_MAX_MTU to external
 header file
Message-ID: <20201021152345.GC3334@Mani-XPS-13-9360>
References: <1602907457-13680-1-git-send-email-hemantk@codeaurora.org>
 <1602907457-13680-3-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602907457-13680-3-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 16, 2020 at 09:04:15PM -0700, Hemant Kumar wrote:
> Currently this macro is defined in internal MHI header as
> a TRE length mask. Moving it to external header allows MHI
> client drivers to set this upper bound for the transmit
> buffer size.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

I've already reviewed this patch. Please make sure to collect reviews while
posting incremental revisions.

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
> index 7829b1d..6e1122c 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -15,6 +15,9 @@
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
