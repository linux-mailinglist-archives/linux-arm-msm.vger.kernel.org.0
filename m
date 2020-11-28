Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F5C2C73B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387637AbgK1Vty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731777AbgK1SzT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 13:55:19 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94842C061A47
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 21:44:23 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id m9so5901371pgb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 21:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8AgebrAVJqCj0HehK/NmeYt3IEJsYqHkNb9Jv5TxbIw=;
        b=ztA2sqLNeNbdHxvDlMO4P7VxzZojTSLsRgrEmOovp75U/hMfKW3SRIQIMPX7ru8N2n
         5Fo7LFb0jFv6FbBB7ScT7ZSIakzw4BG717S26cp16EPT3b2I5JhRLgipX9qHkp/PoTmI
         FntXw4i5usfnAKJz9omkyh4Dw/YnT+Ia9+4zCr6pW+b0yr778Bxqim9YhEnfLLVgc49m
         b43wSmrBUyaGZHdkkQgUJnHGoXO375ysIjkx62bl3oL9HhDLXVmKvW83UQ/b9Ae4ObYF
         ZmLf67ARn6Wq4cIOuwWebfJ7IWe0d4Mk3ljVWUxsdvCBmBvT/CNeZjB/iQ3UZWSj0lM/
         D8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8AgebrAVJqCj0HehK/NmeYt3IEJsYqHkNb9Jv5TxbIw=;
        b=GiZToGI7j9H/jzkCSjOGLrD87e2+onGYwNJ39Nxs80x7EZCGASV6QPol98niO2y662
         9kB61aHnlnW6rPseqZRux2Ahsa2He2aBpnJCwbetIsn2130UAtHOOz7OuIhJgualbLjy
         mfJSxVKogUF1EhpE9kAcbkaOfpq4kM1YDNQSrbrykTNHJTweL/XAhO09QYr6CNj9C1oO
         N3i4Dj5EEdhcCFGpbUnYLfG0YDbyCo1MiUhk8/j81Yttf6vcLhTGJNJhvyzEe60CGpcg
         wuvDc18xbzMD6XrzB2eeCmsffYqEWI7gqv+sLMqb/sR53XBCSX6hW213tBzCFVzAGAt4
         W3Xg==
X-Gm-Message-State: AOAM530hqpDB/x/lFYXtuzlzh7hf8fB0kRcGiiR7HzX3DYhzM9sN3FUf
        9DrPfZHolZJ8p7snGUhg9sLZ
X-Google-Smtp-Source: ABdhPJwTsFDABSJPFLm03TsxCdGm1D+6h4dr0zuCkNTHDeQyPXROguRtjOgi2uXM8qCFt2iMKMoZnQ==
X-Received: by 2002:a63:a109:: with SMTP id b9mr9520174pgf.368.1606542262935;
        Fri, 27 Nov 2020 21:44:22 -0800 (PST)
Received: from thinkpad ([2409:4072:15:c612:48ab:f1cc:6b16:2820])
        by smtp.gmail.com with ESMTPSA id m204sm9414938pfd.118.2020.11.27.21.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 21:44:22 -0800 (PST)
Date:   Sat, 28 Nov 2020 11:14:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v3 2/9] mhi: pci-generic: Increase number of hardware
 events
Message-ID: <20201128054415.GB3077@thinkpad>
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
 <1606404547-10737-3-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606404547-10737-3-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 26, 2020 at 04:29:00PM +0100, Loic Poulain wrote:
> If the IPA (IP hardware accelerator) is starved of event ring elements,
> the modem is crashing (SDX55). That can be prevented by setting a
> larger number of events (i.e 2 x number of channel ring elements).
> 
> Tested with FN980m module.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index f5bee76..d3896ef 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -91,7 +91,7 @@ struct mhi_pci_dev_info {
>  
>  #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
>  	{					\
> -		.num_elements = 128,		\
> +		.num_elements = 256,		\
>  		.irq_moderation_ms = 5,		\
>  		.irq = (ev_ring) + 1,		\
>  		.priority = 1,			\
> -- 
> 2.7.4
> 
