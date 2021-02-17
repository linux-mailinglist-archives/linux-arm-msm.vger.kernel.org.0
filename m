Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A74031D438
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 04:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbhBQD12 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 22:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbhBQD1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 22:27:21 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15632C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 19:26:40 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id gx20so806879pjb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 19:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lqpKPAuFTnlqzaKcLpxAW0dfe7idpmGuNt67LqDJrAg=;
        b=BadlQ4HTgH7tGCQjEM21ttCoY2Zt2DNUT1d5tdRLB3k5Qb+HjBP0QsXRvz/l8rjngO
         x2w79tmkbpGGcA3EIdppr2/6sFNdnl/vwPtDbJq7OQlPH9AgXJPoabKLwncirVwJCOOT
         5Rylg9cIPePXrUjfmu4v7aREVSsz0bKGv+0r7Faut1Jb4mzKdRdri3tpUML0x9yNTZ1V
         7E/itaiN6lm0ka5fj52WgX2+9dRB6PH382+CPHyuBzzOYzipcR2dVbZf2bXw347ARxtx
         B9tvyeu9Ejf7R8HbrDkdvuKmRxD/wGySbz4/cEKUNYo8ozYUtSs07opeWMlCVGyrhuR8
         7UJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lqpKPAuFTnlqzaKcLpxAW0dfe7idpmGuNt67LqDJrAg=;
        b=JLHCbyYapckN0pj5EbVCK27iprKtKUBIHIGUpu6pI8n1OwPJ/d2E8ZdwaDb5k36Xr8
         Gk3PKr0kQ2INH3dwTT95QGfDNDBcZSmwPpE4HJ/EKRLQQiujBlc8mOMZV9kZSAPS2W0V
         r3jqICiVtWMb55fU9kJxgejBAk+yJ9WzVKlV6CkCj+iqk7w2zPgSb168nlHzXuYW6Qxg
         ntS6Wnx7DWrhLWrRzEtK90BelB8DjTt3KFlwNyBWaeV8JgoHflbu1MFr33IeyN14azJ/
         LPx1bTtAU9vB8as/1hAoMjdpw96uS14xnEFhFPOyoo8aEtO0ywBIzqHIGLf/jYd//MVh
         ja1g==
X-Gm-Message-State: AOAM532CShjqW9TmjlgLCk6UdgXPZY3AmFvQQ2iVwUqZHJta7aaGYVga
        r9bkG16DIMLlnJFDr2WCsVa/5fw81XTA
X-Google-Smtp-Source: ABdhPJy/2OpfXzzysI+oWH71XlYmtvwwQDXxCFgf5YyOdcmcDR3x8DHV0yEgVVZBySoEGp1rEJYTqw==
X-Received: by 2002:a17:902:be06:b029:e3:7031:bef with SMTP id r6-20020a170902be06b02900e370310befmr6344322pls.19.1613532400238;
        Tue, 16 Feb 2021 19:26:40 -0800 (PST)
Received: from thinkpad ([2409:4072:649c:b72c:a1c5:6cec:d098:f3f5])
        by smtp.gmail.com with ESMTPSA id jt21sm333900pjb.51.2021.02.16.19.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 19:26:39 -0800 (PST)
Date:   Wed, 17 Feb 2021 08:56:28 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fan Wu <wufan@codeaurora.org>
Subject: Re: [PATCH] mhi_bus: core: Return EBUSY if MHI ring is full
Message-ID: <20210217032628.GA3967@thinkpad>
References: <1613501314-2392-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613501314-2392-1-git-send-email-jhugo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 16, 2021 at 11:48:34AM -0700, Jeffrey Hugo wrote:
> From: Fan Wu <wufan@codeaurora.org>
> 
> Currently ENOMEM is returned when MHI ring is full. This error code is
> very misleading. Change to EBUSY instead.
> 

Please use the subject prefix:

"bus: mhi: ..."

Thanks,
Mani

> Signed-off-by: Fan Wu <wufan@codeaurora.org>
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  drivers/bus/mhi/core/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index f182736..21eb5fc 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -996,7 +996,7 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
>  
>  	ret = mhi_is_ring_full(mhi_cntrl, tre_ring);
>  	if (unlikely(ret)) {
> -		ret = -ENOMEM;
> +		ret = -EBUSY;
>  		goto exit_unlock;
>  	}
>  
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
