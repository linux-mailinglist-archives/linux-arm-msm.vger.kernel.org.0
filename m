Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C363F2BC376
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Nov 2020 04:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgKVDrN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Nov 2020 22:47:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgKVDrM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Nov 2020 22:47:12 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CAB8C061A4A
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 19:47:12 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id s18so14507875oih.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 19:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9bzkqkqMFaR/ganaOll7ayccgMCfPXmcey+XH9oBqhg=;
        b=aa2/Rh+JjXLKi8OUwog4xO9t4g+KNYkAfuuj+e4dn2+GJUV22FxyxOP+W+aSsUQHJd
         /J5tCHlSjhPU07SuSg/IaUNdNm9Sz9R5vdXBjLm0oEepLDdsguvbfbpTn+mquJgpJaGn
         HRWye9BotTzdyGxQMmKCOKwbXLqWS4mbjal7C1UlQctSOS9OqSW3eeBtk1VQdlbiiwpe
         fNC9p8EpUyyYsk9BCNZRaSyiGbc7P4Od3QuZbrn0OZYK7OTVDyfnyj3FdxF8YA6G8pf+
         E9mFUn2m8kzTorSZ+pTa4jMAH7yv7hr1QCYLeh79trK/UrwnQMmsiolrATRkEnrcGK8c
         LQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9bzkqkqMFaR/ganaOll7ayccgMCfPXmcey+XH9oBqhg=;
        b=YyyYOHyIY8aZJIcOJDLCWRX5ZSm2We2YJQENtPqjc6T3h88JM4dtZ74og+8U9bgEus
         3fSsV8HCNGt9O/TFkaMCOx3bm69iVIeIQ2iOVckfOREhtp19RN+aMonKKw35dQrrU9Ij
         YEcVHsnbx31/MWzBgtt/Yz2sqzZMCmaP+O6aVj1oSmbj5cWvmjAPb3PZ+2geBq5zEnEV
         b2wQtKKihJcVPIrsJLj95zmV06YPHWJg9VD110mmutqc7kBhcstulWXJTn86jUJn30vZ
         3zWB+1Wp1Oa76yBAl/6OXUw2XL6JE7vsTZ5Gkkc7wt5FFTsJueeBCkGqXW01As9h5uQj
         7oDg==
X-Gm-Message-State: AOAM531n0r76B4ZaRaE37mqWVDJpSq+9Skw6tor1/xRm0ieCnCCUWQQq
        DIfL27+KK+7GRlgkR2I+mf1vLg==
X-Google-Smtp-Source: ABdhPJyK8ijYdJrAvlJEIIfbU4CWi7ihqn3hpJ/dtK2uPElIoEjnF4OG5E6lHALphvX6ezKY3qBNZw==
X-Received: by 2002:aca:ecca:: with SMTP id k193mr11308974oih.27.1606016831704;
        Sat, 21 Nov 2020 19:47:11 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 1sm4720133oig.16.2020.11.21.19.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 19:47:10 -0800 (PST)
Date:   Sat, 21 Nov 2020 21:47:09 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] i2c: geni: sdm845: dont perform DMA for OnePlus 6
 devices
Message-ID: <20201122034709.GA95182@builder.lan>
References: <20201112161920.2671430-1-caleb@connolly.tech>
 <20201112161920.2671430-6-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112161920.2671430-6-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 12 Nov 10:22 CST 2020, Caleb Connolly wrote:

> The OnePlus 6/T has the same issue as the Yoga c630 causing a crash when DMA
> is used for i2c, so disable it.
> 
> https://patchwork.kernel.org/patch/11133827/
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 8b4c35f47a70..9acdcfe73be2 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -357,7 +357,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	struct geni_se *se = &gi2c->se;
>  	size_t len = msg->len;
>  
> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
> +	if (!of_machine_is_compatible("lenovo,yoga-c630") &&
> +	    !of_machine_is_compatible("oneplus,oneplus6"))

This hack seems to have been working around two separate issues. First
with iommu active the GENI wrappers needs to have their stream mapping
configured. Secondly there was a bug in the transaction setup that was
recently fixed by Doug Anderson.

So can you please give the following patch a go? I've yet to test it on
the Lenovo machine, but I think it allows us to remove the quirk.

https://lore.kernel.org/lkml/20201122034149.626045-1-bjorn.andersson@linaro.org/T/#u

Regards,
Bjorn

>  		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>  
>  	if (dma_buf)
> @@ -399,7 +400,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	struct geni_se *se = &gi2c->se;
>  	size_t len = msg->len;
>  
> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
> +	if (!of_machine_is_compatible("lenovo,yoga-c630") &&
> +	    !of_machine_is_compatible("oneplus,oneplus6"))
>  		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>  
>  	if (dma_buf)
> -- 
> 2.29.2
> 
> 
