Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8274A538A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 00:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbiAaXuw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 18:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiAaXuv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 18:50:51 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 153FFC06173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 15:50:51 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id q186so29990365oih.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 15:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gTAeI8IjixWxxmk/O216bYEztBap5QYeV09m70/fKjM=;
        b=ElGx/wzWu026fb4wDsiYfNF9RiRignkWNApNUAEldJKoSTjD/d+mCimkgmAYiLftGk
         KMY3pGK80krPmrx0DAE5i93Nq08ARGHTyArvx+C4f8W+agwbKpFJGe4dLwOTyaJUCKMd
         lgm0j430yMEy3jV0+HficY5b3Ng02gs5tXhNrtsWpdrw2biwShY8SPA+BlSj+zxQdW3m
         5cCIqWVzWrEtDO88INIx1A0/94jn0znqFMbhZ/E3rLEN+R7VvUX77REM/mNs75FNO3xT
         zKPcEx/gZPcQwHdRsJF9q9TFT41n5iwZKEb62rCKo7/Jg+ck+IhncJzGjlwt+xKttG/p
         fk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gTAeI8IjixWxxmk/O216bYEztBap5QYeV09m70/fKjM=;
        b=I0R2yDneJWKy9INwfn0/sEpktzMAMA9DBjk35HcPRCluh5DtoilO0/++ZNgB0wiYG/
         eR/6Q6LR+RGsvYOhJMQolBLFVhFTNYBL5NU1xPYpD7be8hq3x4DQiASoogJrN4qaKTMM
         sIMjG10lmHXGFhlCXv0cvc+iz6CvE49EvehpLLdf/pJxzVFGv/5ElHDzHvp0Dwu+ySt8
         4cgxd5lpQuIRqBE6V5ZFHZ98pIm/Cyfzm/RDhleygxKf46cbRuI4xdhqk5xur0WXOR0i
         VHFhbQCDtan2WH6jgqi/6zePRyCh68mBaJyV+pEdxB2+JWIjRzETXMTtnsTDi7TBOosP
         viWQ==
X-Gm-Message-State: AOAM530pEykS32VKMzDiNLYBMFpuMEFEnH9kNUZ+sMHbsBhvGE1EN7Fd
        tur/alAO2bSQDMQTh/lPl6TjBGTXVW9agQ==
X-Google-Smtp-Source: ABdhPJw3YE39Hle0GY939lffQTmXSEsDz7BM1tfX3kk97cLz9YGcmQHsTJtQWzRLkO8F7ZC6DIvS/g==
X-Received: by 2002:a05:6808:229f:: with SMTP id bo31mr14171210oib.107.1643673049898;
        Mon, 31 Jan 2022 15:50:49 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id w20sm6033506ooe.3.2022.01.31.15.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 15:50:49 -0800 (PST)
Date:   Mon, 31 Jan 2022 17:50:47 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rayyan Ansari <rayyan@ansari.sh>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: qcom: spmi-mpp: Add PM8226 compatible
Message-ID: <Yfh116roOPZL4kV5@builder.lan>
References: <20220124171538.18088-1-rayyan@ansari.sh>
 <20220124171538.18088-2-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124171538.18088-2-rayyan@ansari.sh>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 24 Jan 11:15 CST 2022, Rayyan Ansari wrote:

> The PM8226 provides 8 MPPs.
> Add a compatible to support them.
> 
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> index b80723928b7e..6937157f50b3 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> @@ -961,6 +961,7 @@ static int pmic_mpp_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id pmic_mpp_of_match[] = {
>  	{ .compatible = "qcom,pm8019-mpp", .data = (void *) 6 },
> +	{ .compatible = "qcom,pm8226-mpp", .data = (void *) 8 },
>  	{ .compatible = "qcom,pm8841-mpp", .data = (void *) 4 },
>  	{ .compatible = "qcom,pm8916-mpp", .data = (void *) 4 },
>  	{ .compatible = "qcom,pm8941-mpp", .data = (void *) 8 },
> -- 
> 2.34.1
> 
