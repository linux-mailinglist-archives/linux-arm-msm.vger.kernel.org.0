Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95C9268978
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 12:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgINKmx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 06:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726499AbgINKmP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 06:42:15 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC21C06178B
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 03:41:54 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id f18so12276584pfa.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 03:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VzUJ3QPwLIyZw2XJ1DUOnt1YFGGU679pflIuplZS5Vc=;
        b=faM9KOaXot7aaeNdDMC+kriUxTiU+vo4oAUOtAdkG/T0JG7z/QcsJdCnD1LzHp3d87
         +5mHP4zpfSvsCJviNJ52+D2/BYhigUPM6nlFFvRA7XLir8kpceLPzUKPnKx10dYCBeEO
         iW967zHIEyDZzbVOKM4ymL3Q2r3skUW3RH9Tv6mdgEf61cy050ELEP2sXNs93b0tvVth
         wybhHcnMKO7cVsWfhXER58If6yVpECTnqySOF7V8eBP29TD1DZ8P/bXah6KXJukeIcZX
         uMXRsOIuwhV0XwJphtau0YVxmMw9MUU6IXSreTowG5yLZZBdS2NulJRz8eqa5uk2PkA0
         ZrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VzUJ3QPwLIyZw2XJ1DUOnt1YFGGU679pflIuplZS5Vc=;
        b=QxvyyboiwKM8ldNFeUJhetRO655Epab6qXCg2YPkr2QVR0Q4NwMJ6HOJo1A/AyLllm
         PsujM02TqMVg1iDjebLV+YbS6Gwd7b+/BTK+eEYmwHxZRY1ipWmTW/t7tM36BQK+oT5P
         vFBi1621wtXn6IMb/VwxBFrPW1jHmFLo3YytN//SDnwdOebSC/AsXrER4J29+5jYJGsf
         PBjmRqV4jufKMu73eMKWmuD50N+IZ7hC16/xy5oNQJSYQYseqYuAH7dpwtuqsV6a7YvB
         KccrH3JLRU0mGWnjTlLKOVgj0KbVHgHqPZjlzHkjN35nlBulrAVUPGabA0ajP/Tqwnas
         V45g==
X-Gm-Message-State: AOAM5304JsyzYSynMdBbBFllX3mg1q/dnjSm4VZAXEA4axOqntHMOJDN
        OYH/B7Ke9U2eKA/1wwk2qj8Q
X-Google-Smtp-Source: ABdhPJzcqYfof2QYGKpvcDvRE/7SVhF988fdSrLLieXNNnc79kqVletbRP2wG3ita4ituhekmmbndA==
X-Received: by 2002:a63:5561:: with SMTP id f33mr10245956pgm.13.1600080114229;
        Mon, 14 Sep 2020 03:41:54 -0700 (PDT)
Received: from mani-NUC7i5DNKE ([2409:4072:6d84:8e8a:d537:f870:596d:5afa])
        by smtp.gmail.com with ESMTPSA id y13sm10019753pfr.141.2020.09.14.03.41.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 03:41:53 -0700 (PDT)
Date:   Mon, 14 Sep 2020 16:11:45 +0530
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
        devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 06/10] iio: adc: qcom-spmi-adc5: use
 of_device_get_match_data
Message-ID: <20200914104145.GD19867@mani-NUC7i5DNKE>
References: <20200910140000.324091-1-dmitry.baryshkov@linaro.org>
 <20200910140000.324091-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910140000.324091-7-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 10, 2020 at 04:59:56PM +0300, Dmitry Baryshkov wrote:
> Use of_device_get_match_data() instead of hand-coding it manually.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/iio/adc/qcom-spmi-adc5.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi-adc5.c
> index c2da8f068b87..ae27ed7a26ff 100644
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
> @@ -827,24 +826,21 @@ static int adc5_get_dt_data(struct adc5_chip *adc, struct device_node *node)
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
> +	if (!adc->data)
> +		adc->data = &adc5_data_pmic;
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
