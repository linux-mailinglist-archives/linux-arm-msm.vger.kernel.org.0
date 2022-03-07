Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57AEA4D01D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Mar 2022 15:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243404AbiCGOvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Mar 2022 09:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237706AbiCGOva (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Mar 2022 09:51:30 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C7C85BE1
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Mar 2022 06:50:35 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id 195so17355336iou.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Mar 2022 06:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sEpDC/ynny7PhhFyoZeZTcKx4U+48NvRbDORJ2XRjJ4=;
        b=j+0CEXXO8ZnYJf0T5m9RbzeiYWJ3Ww+Ef67WcdAjmY2iJ24OC6+FGwOfXswmbwYB6D
         baRvH7FNd4Wct/dY9mGjydPQmpu27lHGz5HUMEx607OXjZb2TJ35jECQHCmtAggKJ9W5
         lAc/gXxjfzFNJuJXYcnCWSFhcWz3cEbDtK7V5cCh+4RCG2OVAqQv5mNBTgPbFMsuuQnl
         ysZjRStVA2ub6hAZtq+Pr/OtX1NbXpt8zahqtwhEKr7Ylp0F8krF5ajPWoxLOZ+WAD37
         W1gi6SsArNDY5AEZt0HOi3FM8jOrWvSpEFff72P8GO2E1MVUxYDrGoh/OMNZMbgcHFNF
         4SfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sEpDC/ynny7PhhFyoZeZTcKx4U+48NvRbDORJ2XRjJ4=;
        b=KH6cclcJaKCsPpFRB73NKHLPpS51T2FdvyOuBunjyfj/BN0KOdHXAqMy0JnhEoSfZb
         Kh0lGbjaGdOlEb6mig/CX6JJlSGzTYpJBElofTVQxn6lFvhKOiL44mE4bZwXtobJTyJj
         cEXH5xpC1vOvUBaJBk5jViAAYw1NAYI2Igo2imwTBf9wGGpDuOIYrqToR34/JWUPkHS8
         SWrtdKGWUMHK/AnD+kJOvUk+yFQXf83t3kx/94knJiYkFKJtWgbcya/7V8BUAlHtsJtq
         cR1KppQmnz4l/efJBVryHWyD5f1GVc9qVuVDvHxiwOmDIl9JDE6rtQsWS6lw/KwOz1tC
         1p0w==
X-Gm-Message-State: AOAM530UJTt8JZNQSqnq3zsAUZllF3Ys13SN8TG68/LthRG8txHVSlBf
        8DGLaWAA+cHIqw3SL0VHoAEYoA==
X-Google-Smtp-Source: ABdhPJxGFMWVVa7nlFp599lcFlh436gEkLRUtgcUd75YtRdpvQg1rQQyQaDPNieM4HjQq2XEL6smxA==
X-Received: by 2002:a05:6638:1453:b0:30e:cf95:3c34 with SMTP id l19-20020a056638145300b0030ecf953c34mr11629360jad.221.1646664634661;
        Mon, 07 Mar 2022 06:50:34 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id a8-20020a923308000000b002c268520d16sm10195960ilf.22.2022.03.07.06.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 06:50:33 -0800 (PST)
Message-ID: <62773196-bf38-258c-8537-4baa84959a6c@linaro.org>
Date:   Mon, 7 Mar 2022 08:50:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] bus: mhi: ep: Fix signedness bug in
 mhi_ep_register_controller()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20220307142822.GC19660@kili>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20220307142822.GC19660@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/7/22 8:28 AM, Dan Carpenter wrote:
> The "mhi_cntrl->index" variable is unsigned so the error handling will
> not work.
> 
> Fixes: 10f0ab9c6787 ("bus: mhi: ep: Add support for registering MHI endpoint controllers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good fix.  Is this code upstream somewhere?

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/bus/mhi/ep/main.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 3e98107f08c4..879071b021d5 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1418,11 +1418,10 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
>   	mhi_ep_mmio_set_env(mhi_cntrl, MHI_EE_AMSS);
>   
>   	/* Set controller index */
> -	mhi_cntrl->index = ida_alloc(&mhi_ep_cntrl_ida, GFP_KERNEL);
> -	if (mhi_cntrl->index < 0) {
> -		ret = mhi_cntrl->index;
> +	ret = ida_alloc(&mhi_ep_cntrl_ida, GFP_KERNEL);
> +	if (ret < 0)
>   		goto err_destroy_wq;
> -	}
> +	mhi_cntrl->index = ret;
>   
>   	irq_set_status_flags(mhi_cntrl->irq, IRQ_NOAUTOEN);
>   	ret = request_irq(mhi_cntrl->irq, mhi_ep_irq, IRQF_TRIGGER_HIGH,

