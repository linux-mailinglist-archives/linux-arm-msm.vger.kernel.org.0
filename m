Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B9E288D9A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 18:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389259AbgJIQCY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 12:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388719AbgJIQCX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 12:02:23 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC157C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 09:02:23 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id a200so7225370pfa.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 09:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jf5uJCkR2pGYYWW7ysALIOH0+03x/e4heJfln5Wey8Q=;
        b=WL9UHWz7TTBOKdFZODKBsbw9a5xS4QsOiC2fvHv1G3JJ+XspRsWRpMH3aBIKX934jJ
         1KTUhC1tClh9Y69hrdOj+ufis3oX7sJ1QKdTG9WAZ7r9m+LsKXWIXli6SRDoLyJDYYoi
         bL2tceoV03aTMinIEHkRUV0gQim9MeQ8SuGIS7HlwgKpTyp0lJDsWlqsAjGb5IODRdOm
         KdtdByt4IRRpWyaoNGWz4mhIZMXLCfFreT8LUQQwDv2GIWlF3az/w9loqsi7G8tQLs3s
         qaFQvHfe9+uhFe3aOMEuqipzRvuswls1dmAr2+gq2bZTis1udnXH1WB4GBs7sGHNcqUM
         WiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jf5uJCkR2pGYYWW7ysALIOH0+03x/e4heJfln5Wey8Q=;
        b=lDwuyfvm0DA1JUE+FAvrzpn42LamB/iNwibX+uNgfDXkMhWbBfGgwEIn/SXh5y8Xns
         /jKLwrOUN+SZKKltVnjXXUO61UzbHwz0HYRCoymBs9u+0fabkhN5U4aYqoeL62oYbS7S
         K7P/D7yNoHFkcycKzbedTtCq2KlZmvuchNFE8u37w4voHlHKFxGgkhOROc+orBnDXR8S
         mQ02NHtPaP71WhrvwFZOlfoHhoCQ1169j/hNAKel4Rg2WbKQqlzTK2ioteb045mf2vEg
         biBPT80t4IUyLtScXRYaxjnEM90f8bIjkbDXOoQx9t6+21EtlrsJPlYKBhe/A3WBtop8
         hkWw==
X-Gm-Message-State: AOAM5327Spf2HhtM1TKUZa3G1b0J3Tj85AUGCUQdASH8jtuA48wAsVq1
        8XFKqrOHkqhEMkBbW6vD6cY17IjcDW3k
X-Google-Smtp-Source: ABdhPJxuOLZrPCjADgAmEmw8P9rDrfWZoxPS5/IKevXwdbNI9rofTIGJK92ODzlCeC5VMzz762V/1g==
X-Received: by 2002:a17:90a:8c91:: with SMTP id b17mr3422456pjo.178.1602259343147;
        Fri, 09 Oct 2020 09:02:23 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6292:5a21:d5ff:f3e8:fcf2:ccc7])
        by smtp.gmail.com with ESMTPSA id q4sm13059272pjl.28.2020.10.09.09.02.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 09:02:22 -0700 (PDT)
Date:   Fri, 9 Oct 2020 21:32:16 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 05/10] bus: mhi: core: Disable IRQs when powering down
Message-ID: <20201009160216.GF4810@Mani-XPS-13-9360>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-6-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600480955-16827-6-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 07:02:30PM -0700, Bhaumik Bhatt wrote:
> While powering down, the device may or may not acknowledge the MHI
> RESET issued by host for graceful shutdown scenario which can lead
> to a rogue device sending an interrupt after the clean-up has been
> done. This can result in a tasklet being scheduled after it has
> been killed and access already freed memory causing a NULL pointer
> exception. Avoid this corner case by disabling the interrupts as a
> part of host clean up.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/pm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 1862960..3462d82 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -517,6 +517,7 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>  	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
>  		if (mhi_event->offload_ev)
>  			continue;
> +		disable_irq(mhi_cntrl->irq[mhi_event->irq]);

No need to disable irq[0]?

Thanks,
Mani

>  		tasklet_kill(&mhi_event->task);
>  	}
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
