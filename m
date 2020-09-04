Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FF825D779
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 13:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729753AbgIDLfJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 07:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730022AbgIDLX7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 07:23:59 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDC3C061249
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 04:12:40 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 2so3032227pjx.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 04:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+wP+hTfHw3tFWF69FWuDIBtcVlOWelrnovHW8JL/Z34=;
        b=EFpav4wUW88JS+tQ/U0d9ZsC0A4R0fvGWc05kBkPJdEehiMUnpD6XarbOJkUr6Mbhi
         A8yngsVXQnUILWJX0qID9Ez4BEoyXPQX/5IxHzvhdbbbWe6/sg1+4jx6jkPW86zXhMuh
         XcQc/JDhaDnMO8UftkA7ImE5+2Iud+Q5wPJog6XHSKxMglZvDjhoSElUpl+RLXkElY6W
         abs/79kUVSlVY2YiYsa8qioTtpkulT0AHQcUbWd0O39mhAS+aclTbeATSBGiVenPDUNp
         +IDKyS9HSMSPrcT7leE7NhJZE/QXL0xYZ3z+fNjHIRjocTlwoDs/XXxFVDPFUIUEOH2x
         1GBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+wP+hTfHw3tFWF69FWuDIBtcVlOWelrnovHW8JL/Z34=;
        b=Ef3QPMxuojwYGc3jJ63cKneKBJn4rRM0NeAF81AqGZ6LLzmk6AS1geUkHe8fe1AGlZ
         4ZfHMpReUh6xFD5LK1x9sIqZP114Zu1EQbSv4fTYgA4L6VCKf14svAHZhNx6Mayd2x6c
         bjKoTRkDhqsuyGlu2OJ+yUmMFFqA7cCwRR7nh4D5GkzsE0epyg10Up7EBJdUkxD+dsyZ
         FqwaOH9xw8zioervQBkGLho5WuYg6TdNkSUzKJvhwZwudfXiLsxx7vjZrqg6N8lVyyBh
         cdFWDmbM4lyK1TQ5wvGrCBYJsNmJ5m7Xt6us6W1Z9PagCJ8k6dJOW6tY1y8p7qm14M3a
         EZMw==
X-Gm-Message-State: AOAM531BB2J0pbYk8j7YQd20h1nIjO2AN9OJFGX1A4iBM4jxP6Hx/2LK
        1p5O4g6rjpVb8DYomstaS1o3
X-Google-Smtp-Source: ABdhPJxzQziJffgqrKM2Bdo+9xFsr0/Mrl5dmbLD/H9MMnY6rkl08uJ6vsvMXWeeQzFvVFEhyaeO1Q==
X-Received: by 2002:a17:90b:693:: with SMTP id m19mr7452832pjz.111.1599217953011;
        Fri, 04 Sep 2020 04:12:33 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r144sm6874730pfc.63.2020.09.04.04.12.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 04:12:32 -0700 (PDT)
Date:   Fri, 4 Sep 2020 16:42:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 6/9] iio: adc: qcom-spmi-adc5: use
 of_device_get_match_data
Message-ID: <20200904111223.GB4056@mani>
References: <20200903132109.1914011-1-dmitry.baryshkov@linaro.org>
 <20200903132109.1914011-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903132109.1914011-7-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 0903, Dmitry Baryshkov wrote:
> Use of_device_get_match_data() instead of hand-coding it manually.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/iio/adc/qcom-spmi-adc5.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi-adc5.c
> index c2da8f068b87..0ac0b81bab7d 100644
> --- a/drivers/iio/adc/qcom-spmi-adc5.c
> +++ b/drivers/iio/adc/qcom-spmi-adc5.c
> @@ -14,6 +14,7 @@
>  #include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> @@ -807,8 +808,6 @@ static int adc5_get_dt_data(struct adc5_chip *adc, struct device_node *node)
>  	struct adc5_channel_prop prop, *chan_props;
>  	struct device_node *child;
>  	unsigned int index = 0;
> -	const struct of_device_id *id;
> -	const struct adc5_data *data;
>  	int ret;
>  
>  	adc->nchannels = of_get_available_child_count(node);
> @@ -827,24 +826,19 @@ static int adc5_get_dt_data(struct adc5_chip *adc, struct device_node *node)
>  
>  	chan_props = adc->chan_props;
>  	iio_chan = adc->iio_chans;
> -	id = of_match_node(adc5_match_table, node);
> -	if (id)
> -		data = id->data;
> -	else
> -		data = &adc5_data_pmic;
> -	adc->data = data;
> +	adc->data = of_device_get_match_data(adc->dev);

I think you're missing the else condition to fallback to default dev data incase
the device is not part of of_device_id.

Thanks,
Mani

>  
>  	for_each_available_child_of_node(node, child) {
> -		ret = adc5_get_dt_channel_data(adc, &prop, child, data);
> +		ret = adc5_get_dt_channel_data(adc, &prop, child, adc->data);
>  		if (ret) {
>  			of_node_put(child);
>  			return ret;
>  		}
>  
>  		prop.scale_fn_type =
> -			data->adc_chans[prop.channel].scale_fn_type;
> +			adc->data->adc_chans[prop.channel].scale_fn_type;
>  		*chan_props = prop;
> -		adc_chan = &data->adc_chans[prop.channel];
> +		adc_chan = &adc->data->adc_chans[prop.channel];
>  
>  		iio_chan->channel = prop.channel;
>  		iio_chan->datasheet_name = prop.datasheet_name;
> -- 
> 2.28.0
> 
