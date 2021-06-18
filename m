Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5863AD1AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 20:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234239AbhFRSCg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 14:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234022AbhFRSCf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 14:02:35 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8D3C061768
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 11:00:23 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id r9-20020a4a37090000b029024b15d2fef9so2412879oor.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tndc8/YoubrngPO80WRBzN5JUUqrFLRPVW3UQ0+dyU4=;
        b=fX8WY9Za/VkVD96Ig0BQ5FPO5SiPtkqWHDQ8Z6UDDOXa9wQxYrC2G7Ww8fKeT3L/Ds
         R6nNSDrtIRRrxm1xz50UY3eP0h5v4OOErQQjhF3JJUmo0rJsMpqmAnVhcL9Qpz6wFLZD
         IOfz2mhtUJKxDw2drMB36V2cOFFcfiif8yOLLD3UZInvmcurQ9nJuZCDTK1+pydZ69q+
         iCS7pP895hLgAXbShB6k8gWbw4I1WyeLjxw6ipHYxwFHlVJ2qgZVcoyIbPXfBXM5sC7s
         vpVCkve4pFfsUi8LhLeEGbF6xqQlfwDhn9CCW7RAnmLQcWv5R5HokvMx5UYpX+PXe91+
         NE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tndc8/YoubrngPO80WRBzN5JUUqrFLRPVW3UQ0+dyU4=;
        b=Aq9+ZG9Uxm5ipIwU6QKttmkTF30pm2Dzdmi2YTwGJ+M+jxWIYR4qTN9iIXHC1Nkktj
         OJFd1KPKzPTujBQ2/aiqpv4F86z3Gf+5bltq75E8+RxwJdg+JNPrwv9enAftJWynntvy
         nDuTKBL2G3qP1E3Exz3qaJv8GeWxXjVVeu3oLFAKV39WoE18/wadoRyQJipbNL0FP9Ui
         qMEjdNZJStblo0jEDs4ToznLX+j6yDIDsvxMl+g+yOGOuptM7ep7BvcUsrQYh693+fnk
         iDzMxKATeQPjQ9EHCGixIQH83ceRMdWB7+jggT0w9DRhSGd9vZgfXLnuXszssRxyxffK
         AJlA==
X-Gm-Message-State: AOAM531FWqJS3QcyjwG6Gt8UFC5tz2AMoUnqFAo1P1Nx26AEe4mWqlU3
        yx+Tyi7cuFDsk57XhaXjoIA/Cw==
X-Google-Smtp-Source: ABdhPJxvTtrBP+2wM7344ZOeiwUglW55Q6qGutghiofPTh9DHiPImt8IOpUivLfAg0RuMyrHMtqRDA==
X-Received: by 2002:a4a:d781:: with SMTP id c1mr10059372oou.23.1624039222942;
        Fri, 18 Jun 2021 11:00:22 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 22sm2168449otv.8.2021.06.18.11.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 11:00:22 -0700 (PDT)
Date:   Fri, 18 Jun 2021 13:00:20 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 compatible for SA8155p-adp
Message-ID: <YMzfNGhdKRABGmQ6@builder.lan>
References: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
 <20210617053432.350486-3-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617053432.350486-3-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 17 Jun 00:34 CDT 2021, Bhupesh Sharma wrote:

> Add pmic-gpio compatible string for pmm8155au pmic
> found on the SA8155p-adp board.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index 10f049e21264..95d158848546 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -33,6 +33,7 @@ PMIC's from Qualcomm.
>  		    "qcom,pmi8994-gpio"
>  		    "qcom,pmi8998-gpio"
>  		    "qcom,pmk8350-gpio"
> +		    "qcom,pmm8155au-gpio"
>  		    "qcom,pmr735a-gpio"
>  		    "qcom,pmr735b-gpio"
>  		    "qcom,pms405-gpio"
> @@ -122,6 +123,7 @@ to specify in a pin configuration subnode:
>  		    gpio1-gpio2  for pmi8950
>  		    gpio1-gpio10 for pmi8994
>  		    gpio1-gpio4  for pmk8350
> +		    gpio1-gpio10 for pmm8155au
>  		    gpio1-gpio4  for pmr735a
>  		    gpio1-gpio4  for pmr735b
>  		    gpio1-gpio12 for pms405 (holes on gpio1, gpio9 and gpio10)
> -- 
> 2.31.1
> 
