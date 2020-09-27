Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5BE5279D9C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Sep 2020 04:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729661AbgI0C7c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 22:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgI0C7c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 22:59:32 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CA4C0613CE
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 19:59:31 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id jw11so1600624pjb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 19:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wrAXaRSLMHSQPgKB88ZIhk8ER2Udvga4E8Aj14PBxMA=;
        b=qR2CxxcvgA91vyftRSBEzrfQJhyf2OfdE7NZNAAQqO48nJ8uGVHg3ZCXzTeGQPEL5s
         54oWVGRG0W6jHKRJXNKAEk6hj4vA4dynasAVDLBveqPAArUrn5cbXHmcDT4DDzh+x8vc
         NISQMURelKu/NnAB3hEWTln30Q65h4Wf0qoCpouMqsTwrBlz2qTdrilWXL0r2GjPHz6m
         UTwxTlCcY4xJkXptTbMYk3G7LIIL89HN+XH0FgyMOPexseevWLjI97mP3zdSEZ5T4mwS
         xhhbnV17JoymEPWtNG64DAZtvEOdMYSThyX9PrpbE1sJxRYKWhviNo80TlQpjfpI+Lep
         l9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wrAXaRSLMHSQPgKB88ZIhk8ER2Udvga4E8Aj14PBxMA=;
        b=bzXxSQoVrtkK8VpgIx+pm1Q7SORJ7CiyQFVDtd51dVfUvCextGM3BEkG7N+SyOGd8j
         CsnB+r7bB6c+2JhuXnq2MRZFb7JgQ+WyRcfk0QFeJFF1e9l+BNuY5I0E+FnbX3q/TXpb
         kwZUCKtT8CQkvGfsKSmbn8I4WZU7TclP1Unx94djIRjFUiPgSwkNdEB0IfdwJbCYiNzO
         Rh24I6+huJbSKdedpJ5mx3rh79CoUDHkbycW2kc8uTCI7qXZligJETtSMuNadIsmulCc
         HxiR18q7l7udYafzpZRVMHWgDZlQu/17Y3Mh8z8oxf+7AF2rt4F3iLvEZb1KY+Oht1zz
         R71g==
X-Gm-Message-State: AOAM531LOfdeDEEL/qrFzJAYmYrPLXQtU6uGiZdi15TlrV3mC+nHvrjO
        prJVYN9CfyKR4qIocMQwc6lCAONF3r0h
X-Google-Smtp-Source: ABdhPJwE8R+cvVY7LxolMxx4fzUQEjH7HlyP4wvZHS/6vTBwPAlgAulev1qYKJnrI+U+TLbnz7DPEQ==
X-Received: by 2002:a17:902:c692:b029:d0:90a3:24f4 with SMTP id r18-20020a170902c692b02900d090a324f4mr5851987plx.12.1601175571269;
        Sat, 26 Sep 2020 19:59:31 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:198:cd53:8f:5b5c:829a:cfde])
        by smtp.gmail.com with ESMTPSA id cf7sm2783404pjb.52.2020.09.26.19.59.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 26 Sep 2020 19:59:30 -0700 (PDT)
Date:   Sun, 27 Sep 2020 08:29:25 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH] bus: mhi: debugfs: Print channel context read-pointer
Message-ID: <20200927025925.GA3213@Mani-XPS-13-9360>
References: <1600867828-26881-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600867828-26881-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 23, 2020 at 03:30:28PM +0200, Loic Poulain wrote:
> This value was missing in the channel debugfs output.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/debugfs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
> index 53d05a8..2354c09 100644
> --- a/drivers/bus/mhi/core/debugfs.c
> +++ b/drivers/bus/mhi/core/debugfs.c
> @@ -115,8 +115,9 @@ static int mhi_debugfs_channels_show(struct seq_file *m, void *d)
>  		seq_printf(m, " type: 0x%x event ring: %u", chan_ctxt->chtype,
>  			   chan_ctxt->erindex);
>  
> -		seq_printf(m, " base: 0x%llx len: 0x%llx wp: 0x%llx",
> -			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->wp);
> +		seq_printf(m, " base: 0x%llx len: 0x%llx rp: 0x%llx wp: 0x%llx",
> +			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->rp,
> +			   chan_ctxt->wp);
>  
>  		seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
>  			   (u64)ring->rp, (u64)ring->wp,
> -- 
> 2.7.4
> 
