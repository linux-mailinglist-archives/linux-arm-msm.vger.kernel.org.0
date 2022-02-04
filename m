Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18EFF4A9EB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377406AbiBDSLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377404AbiBDSLS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:11:18 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5586BC06173D
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 10:11:18 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id y23so9374554oia.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 10:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KvvUeoVHcQUYp9qLT8jpjKoPTGcQsG1JY55qsL8HqKs=;
        b=mIotiCIsWQXYCNFgz0cZQgzFq3TTWPa251evYCKReaZsjm/inViT4StAdpUsvXxwBy
         UeK9h1ASdEP9NmoZ0SqvdyywST6KrXWDY0RjxDvQdlGCKy7IRzo9qHTaYI2FENt5A4QD
         WddtrfqHZfTnurA8D4zzVr3x0oxJC7281RZddt/iHAnm2WLfMx6lmvS+i+OZkeiwyAYH
         SHDl/MOhnQcK18qdNQF8mZ5W8RNO3NP0TzC3UD30jQAly3CaSKTn8YLfosQK2EoudjZu
         vhIcUUARakunIqh5j87PcSESpve0j85ZHu3iYmeCeYheoyRbulXNwcjdJjyT9ZyYcCcC
         J7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KvvUeoVHcQUYp9qLT8jpjKoPTGcQsG1JY55qsL8HqKs=;
        b=WhZbCRSO+i1dPqfoozpUQ62+QKu89Jx19qR1b3luOpgfEdpyMutZwgR7zVrdN39kXV
         9SrzDUXjUJO8m+aVF7GbVRCfq+nso88jM+BCU4q/HFojDJGa0u2uEZC2Qg73WeRTWBWN
         XzEbsZfOoL3VGy2N7uM8JnHomOWmMKBW7EcV5MXNO01H8y3GWV57NhSMPhBuBU7RHxQU
         f9+qqiMKV9FO/+85QpYyuZHapicUfSd8GfZ5xZGJ3HBQ+RS6ApLbD5RqFMKalE9Uah4V
         0wBcV0UgSNM+NWwDp6WTTziiNiZ5SAURMeSTIFdCo/Xgcg8BJcv6ebL/h8YC5JO5OX+A
         n6BA==
X-Gm-Message-State: AOAM533vRrw3OPSv/zy6vM0SGorBA41tUWT5kRLKgsEcXc+6wYH0+vGi
        chvUVYgzEZoGtLEPp1bmu1ii8A==
X-Google-Smtp-Source: ABdhPJzfF7KqDkPs+dpT/MMjN3q3LxC06TVuIMMrcaHyklMmgKAePsUVYLe5xiZ8AQKtjlr6Lhxt2A==
X-Received: by 2002:a05:6808:1283:: with SMTP id a3mr1948942oiw.57.1643998277564;
        Fri, 04 Feb 2022 10:11:17 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id 71sm1022396otn.43.2022.02.04.10.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:11:16 -0800 (PST)
Date:   Fri, 4 Feb 2022 10:11:32 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/9] i2c: qcom-cci: don't put a device tree node before
 i2c_add_adapter()
Message-ID: <Yf1sVGfHwrSMX4WA@ripper>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164703.1712006-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203164703.1712006-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Feb 08:47 PST 2022, Vladimir Zapolskiy wrote:

> There is a minor chance for a race, if a pointer to an i2c-bus subnode
> is stored and then reused after releasing its reference, and it would
> be sufficient to get one more reference under a loop over children
> subnodes.
> 
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index fd4260d18577..cf54f1cb4c57 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -558,7 +558,7 @@ static int cci_probe(struct platform_device *pdev)
>  		cci->master[idx].adap.quirks = &cci->data->quirks;
>  		cci->master[idx].adap.algo = &cci_algo;
>  		cci->master[idx].adap.dev.parent = dev;
> -		cci->master[idx].adap.dev.of_node = child;
> +		cci->master[idx].adap.dev.of_node = of_node_get(child);
>  		cci->master[idx].master = idx;
>  		cci->master[idx].cci = cci;
>  
> @@ -643,8 +643,10 @@ static int cci_probe(struct platform_device *pdev)
>  			continue;
>  
>  		ret = i2c_add_adapter(&cci->master[i].adap);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			of_node_put(cci->master[i].adap.dev.of_node);
>  			goto error_i2c;
> +		}
>  	}
>  
>  	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
> @@ -656,8 +658,10 @@ static int cci_probe(struct platform_device *pdev)
>  
>  error_i2c:
>  	for (--i ; i >= 0; i--) {
> -		if (cci->master[i].cci)
> +		if (cci->master[i].cci) {
>  			i2c_del_adapter(&cci->master[i].adap);
> +			of_node_put(cci->master[i].adap.dev.of_node);
> +		}
>  	}
>  error:
>  	disable_irq(cci->irq);
> @@ -673,8 +677,10 @@ static int cci_remove(struct platform_device *pdev)
>  	int i;
>  
>  	for (i = 0; i < cci->data->num_masters; i++) {
> -		if (cci->master[i].cci)
> +		if (cci->master[i].cci) {
>  			i2c_del_adapter(&cci->master[i].adap);
> +			of_node_put(cci->master[i].adap.dev.of_node);
> +		}
>  		cci_halt(cci, i);
>  	}
>  
> -- 
> 2.33.0
> 
