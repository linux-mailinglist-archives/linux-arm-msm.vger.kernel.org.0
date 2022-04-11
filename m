Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDF34FB374
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 08:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234670AbiDKGJs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 02:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbiDKGJr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 02:09:47 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34848201B3
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 23:07:34 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id t13so13286141pgn.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 23:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PWqAIkYRm7SmifWe/7drS52hYoC4wdPuEFToJYiCsAE=;
        b=WGtOnUOmsWIel1m2HSNjY75x7b3P4RBjKAYwu9UG79g+g53GdoT/I0fErF7H7zrVv6
         WYom4d5XxA/JEfxF3RakTeidwiS1KNFkcxISAcEX2DT826jVa6qtF6zVkRfDtRr5CEKR
         XH1lIPPAgJFJMKfuNCpeM2MPdjRBXL+VLqWFQyowXRj1nZndBIZ76kLJX3rpkrtxbgFE
         r84pKC+jQILjHzrEBrXOkTmSCmu0C7SLco3tqqq8VVA12Kn0/3NTLLC/Tz2dYNKG+9+W
         3E+pBKWhQbjt6MUStNkkTSsLCMJkbuUF1z0cVjNQCG3YAyoX3anmS/gp8f3csnGTmymk
         fhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PWqAIkYRm7SmifWe/7drS52hYoC4wdPuEFToJYiCsAE=;
        b=J/GIQM1BFoQwXHU+UV8SC6b1dm1rTd/ATJtH20xZ9M27ZxyzWid/43XhWmozIWi+kO
         dQQAHcmY0ok/w7Cdf/oz1l7dCwKxVutJRiCxrtcLIEj/+YSv1J6QUAKuPua6IoC3lTkd
         Vz+XcFVwm/j/iJP7kO+626g4UclZddkh5O2U58oYtAQOM+8kEy4Umkx9U/Tf7OpjwcZK
         zmVUPzNr5Gcb47lGQh9Ae6ZWDBdYVWc0FOAPhMLk3t5vOTgEYrBV63xZa4E9d5SQRGBr
         WlEfEEnz0ZWvvReTyjK+Q0CuZztFe+dy2mLFRyd5yW5WZxlIXwh0FXqB9xN2s8DDKWAI
         1TPg==
X-Gm-Message-State: AOAM531KKthMGtIQFG92cUpdJ+R5DntLLmw5GFrBBT1y/1uwb3eQ7ZpJ
        VwOH5IU78OH4zx3ZacXXPZVT
X-Google-Smtp-Source: ABdhPJy7cg+mNVULnll8KLZJPGNs7ywhHgutWmQurZLtCq5xZUguGJUbaovTVQ8SAMrdJliynhDiYg==
X-Received: by 2002:a63:541f:0:b0:399:3007:e7a2 with SMTP id i31-20020a63541f000000b003993007e7a2mr25147316pgb.568.1649657253611;
        Sun, 10 Apr 2022 23:07:33 -0700 (PDT)
Received: from thinkpad ([117.217.182.106])
        by smtp.gmail.com with ESMTPSA id k92-20020a17090a4ce500b001ca69b5c034sm18849503pjh.46.2022.04.10.23.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 23:07:33 -0700 (PDT)
Date:   Mon, 11 Apr 2022 11:37:28 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add missing poweroff()
 PM callback
Message-ID: <20220411060728.GB16845@thinkpad>
References: <20220405125907.5644-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405125907.5644-1-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 05, 2022 at 06:29:07PM +0530, Manivannan Sadhasivam wrote:
> During hibernation process, once thaw() stage completes, the MHI endpoint
> devices will be in M0 state post recovery. After that, the devices will be
> powered down so that the system can enter the target sleep state. During
> this stage, the PCI core will put the devices in D3hot. But this transition
> is allowed by the MHI spec. The devices can only enter D3hot when it is in
> M3 state.
> 
> So for fixing this issue, let's add the poweroff() callback that will get
> executed before putting the system in target sleep state during
> hibernation. This callback will power down the device properly so that it
> could be restored during restore() or thaw() stage.
> 
> Cc: stable@vger.kernel.org
> Fixes: 5f0c2ee1fe8d ("bus: mhi: pci-generic: Fix hibernation")
> Reported-by: Hemant Kumar <quic_hemantk@quicinc.com>
> Suggested-by: Hemant Kumar <quic_hemantk@quicinc.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to mhi-next!

Thanks,
Mani

> 
> Changes in v2:
> 
> * Hemant suggested to use restore function for poweroff() callback as we can
> make sure that the device gets powered down properly.
> 
>  drivers/bus/mhi/host/pci_generic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9527b7d63840..ef85dbfb3216 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1085,6 +1085,7 @@ static const struct dev_pm_ops mhi_pci_pm_ops = {
>  	.resume = mhi_pci_resume,
>  	.freeze = mhi_pci_freeze,
>  	.thaw = mhi_pci_restore,
> +	.poweroff = mhi_pci_freeze,
>  	.restore = mhi_pci_restore,
>  #endif
>  };
> -- 
> 2.25.1
> 
