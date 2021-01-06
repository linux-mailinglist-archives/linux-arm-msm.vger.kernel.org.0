Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84E92EBE8C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 14:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbhAFNVX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 08:21:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbhAFNVW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 08:21:22 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81937C06134C
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 05:20:42 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id i7so2213159pgc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 05:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zshYAUeaIMxu10pOVwfzuhXOQWxwmR9rRD4fCZ9uu2s=;
        b=eA4WyocOWaKiucfqvSTrDyNw0ie325AG20tdzYRnRow0TikbLqnZ3an78+YvUL8qxK
         KZUVhOTNBnoNzZUtyZIg+pZOY3gAVL1DLxnYCV3r1WcdVUTI0o8ifZe7YpW7ifNcuWes
         A/3YqtIU7Y9h5bNUWPtV4l23ElSyuAosgoZSXqPGTJzL59ciXsaFuo87hfbXzqnTycy1
         n+Qda7uBF7WCQN3hlAQcFEWThZJV21oIGS1oQbkISuQS1emf2zt7DS/QFOl4XXC3k/sS
         bnJE/l1NKUFJ4bHCql63UtrBpdj5US6XL3nJatbSzFQ0kB3WgHau5IrxmV3R0R89y6cI
         cvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zshYAUeaIMxu10pOVwfzuhXOQWxwmR9rRD4fCZ9uu2s=;
        b=IoQY+VlksqC7qTvrSYx2XV2MAHoZUdAP5mmB1JBEO/SIRIlW2kInXVmLYwCeHmYpFn
         Z8Fs3l7rODtSeQgMMJ1+9C65ucVdDvl78wD6XRSX8AHkoW0cDQ8ABG3azlhBUmWKkjuJ
         e8QLSkrJKrCBV5mX1R31yRXZJcrYqe1SV0N2gaoh4uViy1Pk8esycocG/BCereY4kX9Z
         7FZctY0odjJCEeBYOCHDEceQ146aL8dvQTwhpbWP34eUCGYD3WFenKD8DS3Ip1zq9ggi
         qiyckIMllx5BMzj+YPTBUQ/kftKVPEMvwulrNrYlPxYQ8g0OHs+CiALidUZ+9kMhPp3J
         QvkQ==
X-Gm-Message-State: AOAM530lg+/fp23oqj9F5KadsUvo6znvr/4Xv0nHTTQ27gnhak4Vv1Ql
        cDDAm44NA9RtVPdqCRXiw6tr
X-Google-Smtp-Source: ABdhPJwajJg9AASbam1sCfCP4+4ZKeuJAPhCGmzXp+SFNBDc1I13ukC9pIKYyIJE/riQFqMFonHb0g==
X-Received: by 2002:a05:6a00:22d4:b029:19d:13f0:3a40 with SMTP id f20-20020a056a0022d4b029019d13f03a40mr4132444pfj.50.1609939241900;
        Wed, 06 Jan 2021 05:20:41 -0800 (PST)
Received: from thinkpad ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id a8sm2671659pfo.209.2021.01.06.05.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 05:20:41 -0800 (PST)
Date:   Wed, 6 Jan 2021 18:50:35 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mhi: unconstify mhi_event_config
Message-ID: <20210106132035.GH3131@thinkpad>
References: <1609865076-13890-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609865076-13890-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 05, 2021 at 05:44:35PM +0100, Loic Poulain wrote:
> Some parameters may have to be determined at runtime.
> It is the case for the event ring MSI vector.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: no change
> 
>  include/linux/mhi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 62da830..48b1b2a 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -290,7 +290,7 @@ struct mhi_controller_config {
>  	u32 num_channels;
>  	const struct mhi_channel_config *ch_cfg;
>  	u32 num_events;
> -	const struct mhi_event_config *event_cfg;
> +	struct mhi_event_config *event_cfg;
>  	bool use_bounce_buf;
>  	bool m2_no_db;
>  };
> -- 
> 2.7.4
> 
