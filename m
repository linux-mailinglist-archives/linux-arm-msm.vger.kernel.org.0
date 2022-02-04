Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE1254A9F0B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:31:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377543AbiBDSa7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377537AbiBDSa7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:30:59 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052C2C061714
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 10:30:59 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id q8so9489713oiw.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 10:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PIisD2u5+L5xGiAgk4a/+275QjZoX6MczpeabJV4hr4=;
        b=SH7aB20Tfen2FtRD/erGcdI/pEfIgqD9knH1bOP1jSTMS5dYvuWQLmnRKOEfseuVOP
         Y18EUrq077SI5LPsIAn01UDSsqpiDAnMl4CbxtGMVpeWW8iNO6IL/vU6KxtzmecCiICU
         NwhXGA4GIzn6SCkuFbJYYqCaJHjSy2MefowE1zWudvD8Og9WPoT4HJbqrS62ebyaGU1K
         bHSdl8zDNRdCj5bcGSdK1z1I80b9HVxcMd+KYOBTj7hfLYy1w08At37MbQa8DUH2tY7l
         6vmedPagFPapde8+XpwmRcpVXKy5eva8ve7aT9jS0jy1oyalYplF8/l4FME9gESwvvx1
         Gqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PIisD2u5+L5xGiAgk4a/+275QjZoX6MczpeabJV4hr4=;
        b=OVjIigZgR5koKlZhIPsNZ0EKqPKnnucpJebGYdc/sDZ9fY3r4aj7l08Ej6GbevgiUC
         xYsgiQx7mn+4cQpzmx4ofErGfiZHce4LNSh/ArnDJ81TPmVYgicwd0L9QB1zBadEN9XJ
         OuXLTWoCmCOl4x0dWDx1mJf7gjkF13FclKPlp3O6XsOSA1o+E0SeL8hJjDS+k5Kr+N7r
         eLzTSgnLoAkQ7IwZumwb6Ou7DBCZCfGPHUOAVKVT689jbVREsUh54is1hwHg2TOEzrgS
         kIrq3KT0qqdC8+cm6uTCzk6J5vtjVrHBb88OIcOJUl7owzp6q7eFSPwxid3FKI49EF9I
         YZ2A==
X-Gm-Message-State: AOAM531Cm/4Mn37X/dscBllY5ylnI4jLSTfJNi0iSGWpmCE2IxcH4otp
        yitXXjxMwDzjFBRSXGQUmg4qXA==
X-Google-Smtp-Source: ABdhPJxHdHl142/KkvjEf+2pUcj2LnzikFixljG+vY0oGVuBYGqLZteX3Fsprn76avsgzMhGGSk9cQ==
X-Received: by 2002:aca:eb03:: with SMTP id j3mr1528804oih.280.1643999458422;
        Fri, 04 Feb 2022 10:30:58 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id j11sm1038343otj.30.2022.02.04.10.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:30:57 -0800 (PST)
Date:   Fri, 4 Feb 2022 10:31:12 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/9] i2c: qcom-cci: initialize CCI controller after
 registration of adapters
Message-ID: <Yf1w8Os2g4VPAKfw@ripper>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164705.1712027-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203164705.1712027-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Feb 08:47 PST 2022, Vladimir Zapolskiy wrote:

> The change is wanted to postpone initialization of busses on CCI controller
> by cci_init() and cci_reset() till adapters are registered, the later is
> needed for adding I2C bus devices and get correspondent vbus regulators.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index cf54f1cb4c57..eebf9603d3d1 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -630,14 +630,6 @@ static int cci_probe(struct platform_device *pdev)
>  	val = readl(cci->base + CCI_HW_VERSION);
>  	dev_dbg(dev, "CCI HW version = 0x%08x", val);
>  
> -	ret = cci_reset(cci);
> -	if (ret < 0)
> -		goto error;
> -
> -	ret = cci_init(cci);
> -	if (ret < 0)
> -		goto error;
> -
>  	for (i = 0; i < cci->data->num_masters; i++) {
>  		if (!cci->master[i].cci)
>  			continue;
> @@ -649,6 +641,14 @@ static int cci_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	ret = cci_reset(cci);

i2c_add_adapter() will register and probe child devices, which might
want to access the bus in their probe functions. Don't you break that by
initializing the master after the children?

Regards,
Bjorn

> +	if (ret < 0)
> +		goto error_i2c;
> +
> +	ret = cci_init(cci);
> +	if (ret < 0)
> +		goto error_i2c;
> +
>  	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
>  	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_set_active(dev);
> @@ -663,7 +663,6 @@ static int cci_probe(struct platform_device *pdev)
>  			of_node_put(cci->master[i].adap.dev.of_node);
>  		}
>  	}
> -error:
>  	disable_irq(cci->irq);
>  disable_clocks:
>  	cci_disable_clocks(cci);
> -- 
> 2.33.0
> 
