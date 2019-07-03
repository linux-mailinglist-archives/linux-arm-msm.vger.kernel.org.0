Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7E15DEA6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 09:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfGCHRF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jul 2019 03:17:05 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44455 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbfGCHRE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jul 2019 03:17:04 -0400
Received: by mail-pl1-f193.google.com with SMTP id t7so703544plr.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2019 00:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gD99gW/9Dg7lSZ/4ExF0SOAREijwbKmAygBAmas+l1E=;
        b=Xs4/fc3wUU0BjPfez//n1hFSTApxGZt/f5sN8ydx3jr2T+YuwntUIRbP00ajGFtjd9
         pqAgn6jbVIFdSl6Sky9lsttNNv+PwgG6kDXqSKUk4NDJFhXfs0Qqw3wMMRDH1ptU3QeE
         OOBEL4Kkln9iaRo7wwBh0UB6Op1nbZ/fOu/MYHLekuTyISo2lTPJ4DwHf56XL7k8nK/3
         4F+DYAp2O8dLLSh61YrKewlq7iqfO1e8LaIOAhenP9S5Xg9OYqMWv3m/DPIENzY6sOzx
         vrvb/B+lqnOkI+5FmcNT22x9AR/QHZmESNgYCZcJipcnPkjMeB27MoJGyoCixk8RgdG4
         ndUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gD99gW/9Dg7lSZ/4ExF0SOAREijwbKmAygBAmas+l1E=;
        b=Y04hZXs3/7GuR88GEL5cdUv5FinMfcbivQ1LiJNIOF1sEChxBT4zS+kWV+EgYt6Qkr
         QPiPGMzPUHP5jygOBm9FLquBfGTXyVn5OErUNRiks8B0rD+DSRER5cPHkL47u2ayiDsc
         1xlTRtIgbeTrKQYoUShNf3Htm7oWdJFmWaMBJZbFOUxE1fgcw4XfsYlRIVGNmZ7VDDHW
         y1D657GmDVEXRt4vDt3zSxrfRHaztTQcKWHlsjTKJO04re+S7QA1nS62lwqMuE7XNTsL
         mkQpKtB33VvRMIjQolYy2YITK1ZtgrDfbSHe00LkX98+Vn9XqwgJYvDRymTJ9Ff6moB9
         DmDw==
X-Gm-Message-State: APjAAAXVQbUAtGRNU9cDcAFq/KXVesOYKv8cXxckgZ9iN7Eotf2Hqbmz
        klxFvYxTndbXF9ac9KBPIlCa1g==
X-Google-Smtp-Source: APXvYqz6a7i3FBX0Z/mT9l7rrv9hlBKZdLz5qbZnHXqJktyXNzhS0O8tKhenjnDF5zoastU4pcmleA==
X-Received: by 2002:a17:902:2aa8:: with SMTP id j37mr38737100plb.316.1562138223442;
        Wed, 03 Jul 2019 00:17:03 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q144sm1662568pfc.103.2019.07.03.00.17.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 00:17:02 -0700 (PDT)
Date:   Wed, 3 Jul 2019 00:17:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: qcom: Document missing gpio
 nodes
Message-ID: <20190703071755.GG12249@tuxbook-pro>
References: <20190702105045.27646-1-vkoul@kernel.org>
 <20190702105045.27646-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702105045.27646-2-vkoul@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 02 Jul 03:50 PDT 2019, Vinod Koul wrote:

> The bindings for msm8998-pinctrl was missing gpio-ranges and
> gpio-reserved-ranges, so document them as well
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  .../bindings/pinctrl/qcom,msm8998-pinctrl.txt          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
> index e70c79bbbc5b..280af41eb86e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
> @@ -40,6 +40,14 @@ MSM8998 platform.
>  	Definition: must be 2. Specifying the pin number and flags, as defined
>  		    in <dt-bindings/gpio/gpio.h>
>  
> +- gpio-ranges:
> +	Usage: required
> +	Definition:  see ../gpio/gpio.txt
> +
> +- gpio-reserved-ranges:
> +	Usage: optional
> +	Definition: see ../gpio/gpio.txt
> +
>  Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
>  a general description of GPIO and interrupt bindings.
>  
> @@ -175,6 +183,8 @@ Example:
>  		interrupts = <0 208 0>;
>  		gpio-controller;
>  		#gpio-cells = <2>;
> +		gpio-ranges = <&tlmm 0 0 175>;
> +		gpio-reserved-ranges = <0 4>, <81 4>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
>  
> -- 
> 2.20.1
> 
