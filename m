Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CEF23CFEB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 18:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236594AbhGTP0b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 11:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242841AbhGTPMs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 11:12:48 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC0AC061766
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 08:52:46 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id b24-20020a9d60d80000b02904d14e47202cso4556677otk.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 08:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Walcc93S0Gr05g0IhulInQ/Cw8QbGOXukB2N6LJ3+Tk=;
        b=xEJ1qDxDIzGBjx0jNFiWHrs9TNJ4UHztUudPOL5sF2K8e5d/w6TJi0I4CfREwXGWQE
         AZOw1XITpr//UuJiLOqGocyI+LWqOyO8ZWlSQa/bmUzdMUj+VKxCB5MOLU/kiRoQK6y3
         /HY0kDJn1X2NOhZXFsc8n28eGro1lMwjLsD58u1uLyBVaykWJr6DmGld3FNkPmbFdsLa
         xlf3coWQOS0vfBAfxF2VsmXSlJ3sHg8ZRovmGmdAIgZY+uSL0fEO7tDaYyRCY3ixz3/8
         zALjuoLKwVaULZaziMzWTeSjQeTUIyOwIJCCTfRZSRKVHC7I6OyLfuX90oFwJbfaVT4Q
         nDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Walcc93S0Gr05g0IhulInQ/Cw8QbGOXukB2N6LJ3+Tk=;
        b=h3/L8s1GsIb4GrJe4nkFoBNXpVH0Ix4ygGOayX4ipKqJdm2oN98clueiIoBwGca46a
         GTvx3gCaSL0uuM2YAXSvQyERe7dFDi2gE3gVEb6JQ8gEjZTjPV0VNprZQ3U/9Xw+QAOf
         HVIO6r5U73a6/Dm5nW6bsxwyer91iiAlwdx4dA5N7ZOsF3lw9W3+jYiWBCMPEe8B8oX8
         Xb0ArRmHzFxyEwmUv9F/Drcl2IsqhIiQJxcXh2ZFoGDTTiri1clCNCnBFn8E5wNWflFC
         bIHKZ++2/Dq9nn8MZni/7ClxlA1Ig6pOQ9ywoFVHp3jKKdj4bNPPEPoezHdZhy8tzqjp
         IWpg==
X-Gm-Message-State: AOAM530XKfxHsJqIVsuiB3N0n9MMDjXgszAtxEBgfi8D3cX1eaus+Lab
        ywJWd79CjngWnWFYvxvP/pThzw==
X-Google-Smtp-Source: ABdhPJyb4yFdL9Q4uvdT65qV5B7tMOJW3NpSLII118Ct3t+4szV/WE3LyJqYygW/2V40uJFEYtG+LA==
X-Received: by 2002:a9d:6750:: with SMTP id w16mr7136785otm.177.1626796366037;
        Tue, 20 Jul 2021 08:52:46 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q15sm233294otf.70.2021.07.20.08.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 08:52:45 -0700 (PDT)
Date:   Tue, 20 Jul 2021 10:52:43 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     agross@kernel.org, sre@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Subject: Re: [PATCH] power: supply: qcom_smbb: Remove superfluous error
 message
Message-ID: <YPbxS4KV+Fx01p7G@yoga>
References: <20210720141539.7716-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720141539.7716-1-tangbin@cmss.chinamobile.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 20 Jul 09:15 CDT 2021, Tang Bin wrote:

> In the probe function, when get irq failed, the function
> platform_get_irq_byname() logs an error message, so remove
> redundant message here.
> 
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

This says "Zhang certified this patch's origin, then you took the patch
and you certified it's origin" - per Documentation/process/submitting-patches.rst

But you, Tang, is the author or the patch, so how can Zhang have touched
it before you wrote it?

Perhaps you worked on it together? In which case you should include a
Co-developed-by to indicate this.


Both commit message and patch looks good though!

Regards,
Bjorn

> ---
>  drivers/power/supply/qcom_smbb.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/power/supply/qcom_smbb.c b/drivers/power/supply/qcom_smbb.c
> index c890e1cec..84cc9fba0 100644
> --- a/drivers/power/supply/qcom_smbb.c
> +++ b/drivers/power/supply/qcom_smbb.c
> @@ -929,11 +929,8 @@ static int smbb_charger_probe(struct platform_device *pdev)
>  		int irq;
>  
>  		irq = platform_get_irq_byname(pdev, smbb_charger_irqs[i].name);
> -		if (irq < 0) {
> -			dev_err(&pdev->dev, "failed to get irq '%s'\n",
> -				smbb_charger_irqs[i].name);
> +		if (irq < 0)
>  			return irq;
> -		}
>  
>  		smbb_charger_irqs[i].handler(irq, chg);
>  
> -- 
> 2.20.1.windows.1
> 
> 
> 
