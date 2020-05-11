Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0A21CD699
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 12:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729287AbgEKKbf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 06:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728209AbgEKKbe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 06:31:34 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F251C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 03:31:34 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id f7so4549738pfa.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 03:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CqplYl+v02aohkq5RzICqUNP1BB3Vo0bAlpeWACTjsg=;
        b=OIBL1c2oNzdA2PW88y02Kjfx9QecMEVWtmhdOX5GmiAkqxQPazll/DY7jcMX0QhJBJ
         kD2Wm8bk/cKnXsWcaOGX6KZsLXPiDPI4ErKmMPTADvrqBOlc1FZx/RXhvdU4vOWYUUdi
         1AQwqke7d04b99Jcov11RRnRbbzPEGE7WzlCmM053XTdZvxp1WwW9r3ZRaHMqB5SxByq
         vitkEBdX1YsCPq2PyK/HYpU62qi8Br2QwOm1Ab7E7CFCaxirT8iYzHdcXsMYiKRao16z
         1ZmcJH1AUORI81vKWaLUPYsAECPrag5WjRYvJCfTMSg32l9743Vc1BT3cdJbhzJY5CCi
         JWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CqplYl+v02aohkq5RzICqUNP1BB3Vo0bAlpeWACTjsg=;
        b=cUCHDaFWR/ZYigJghs/F6V4VC3CrRRAxPVJemxu6tDJuUjMwBCu1KAcAk/mKs89wY3
         z2VouT9y07EZ2p2vAZybCAIkMSB2BbdtFPG5udqT4t2OP2lYTyndaAs2i6pbUS225ZES
         uJHM8UYwd+sgnNYZFestXBdQNY5kHG/kUkB4n8jRJCVdY23n1JJCZ1+45ZcpAisPk7cR
         KAESmUFM3skaFmLe8/c9rJO3V3JPRkscUfCkVGSuITkLr1bq8LGoiK5A/ZQ/7nBIwnBZ
         PyBOP7/gyr4JB1TWxzKvzZfUbZwkKpwDKGH6s2raWY5DVZYN5Dx5pZ0Blyr7fJoSfczu
         ooTA==
X-Gm-Message-State: AGi0PuYd1DZ/ejy1L5YvHkCGDqztLL4GsghDFgiztY4kw5kfGDB+MoBw
        cJNcS9B1ZUDWbchmLOmAhqMC
X-Google-Smtp-Source: APiQypKT9DJXaUsGN5QsdS+95yeBUKH3QXCgmQXSohCAoBOYC3R8g/K5YAe87nP1a2HOXw9ax/ANdg==
X-Received: by 2002:a62:1789:: with SMTP id 131mr15905969pfx.287.1589193093396;
        Mon, 11 May 2020 03:31:33 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id n23sm9552826pjq.18.2020.05.11.03.31.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 03:31:32 -0700 (PDT)
Date:   Mon, 11 May 2020 16:01:24 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] bus: mhi: core: Fix some error return code
Message-ID: <20200511103124.GA12753@mani>
References: <20200509075654.175002-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509075654.175002-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 0509, Wei Yongjun wrote:
> Fix to return negative error code from the error handling case
> instead of 0 in mhi_init_dev_ctxt() and mhi_driver_probe().
> 
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index eb2ab058a01d..1f8c82603179 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -291,6 +291,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	}
>  
>  	/* Setup cmd context */
> +	ret = -ENOMEM;
>  	mhi_ctxt->cmd_ctxt = mhi_alloc_coherent(mhi_cntrl,
>  						sizeof(*mhi_ctxt->cmd_ctxt) *
>  						NR_OF_CMD_RINGS,
> @@ -1100,6 +1101,7 @@ static int mhi_driver_probe(struct device *dev)
>  		}
>  	}
>  
> +	ret = -EINVAL;
>  	if (dl_chan) {
>  		/*
>  		 * If channel supports LPM notifications then status_cb should
> 
> 
> 
