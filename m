Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1AB61019D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 07:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfKSGx3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 01:53:29 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:37160 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKSGx3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 01:53:29 -0500
Received: by mail-pj1-f65.google.com with SMTP id f3so2300057pjg.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2019 22:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NVHXbZOZBXxiZKX3GBeHJYFk4c/WxyAtG65m0ugrmM0=;
        b=GdJtIXil0bjIVxjoqklp3hhWfkZgjD1rVeNy17TQZy5SkISD/Z1g+IsPLZGLFGGzT0
         j784s0fi0Chiw/MHPjGB6hFvcyu5/iOMEiLyHu5OcBeI4D6fIFnxbYV9lhiTZJpEfFRV
         goLDEN+cRhbdRvivs649Cd05kT9pBhkr9ChwtMf1OAD0cV0ccrvJhhDAoZ3WFohLMtpu
         VABFXugT0yLKPFPN7LLVKQp3lCNux8ddhKpcHjPBjNbPSgMZoLzNsHmozlqGJOu/sbKy
         avMvkr99s46Obi68WjllyjZiXZBbDTiEvxrDbyeIne6MaizCHeIDpKaDcHIviEIgrd8Q
         30dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NVHXbZOZBXxiZKX3GBeHJYFk4c/WxyAtG65m0ugrmM0=;
        b=LushfcqA3ChA1qxoQJlY/V+jnXQ7UVXf7x2E5GGU7294Qw8pLLs4vVAlGI88B/fncr
         YLPvblMaxuL5p9ZrV+0D7xuItSILM1wN60cz+38RMY9Qaq1LbzDXP9fbGOsSE47WaBgt
         ttowHnolq9To+20JiwQFgV4PLiPajXrLeYhmdKxlYcVy15YT+Re0CA8rx2a6x+SF0qPe
         iI8bBuG5b5W765CXSelAJ2iYuk+l7TGV6sNv8OusxeD2W5Md9abk7ug+b069cEG7LHyJ
         XuaZ2+xO56vGXEc+/XRyFi3B69o5emHJQsHcGe9ZaK4HYjdzci1dyUPsQo9p5ktAaeVw
         63Jg==
X-Gm-Message-State: APjAAAVFrS7UAE17pJLGOYV0TK2tACBF7/j9IqEoNcZZLrsCf1HdqFwU
        A5gw6JWHsfNgANw8bazIbsrYzA==
X-Google-Smtp-Source: APXvYqyo2oK2hAMFq1/V2OO+nv/wG1IJdRPM9KNkUwYbcn2xpLbU4OZVqkHErgLpjOcExdimgLJR2g==
X-Received: by 2002:a17:90a:b385:: with SMTP id e5mr4285353pjr.115.1574146408233;
        Mon, 18 Nov 2019 22:53:28 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y1sm25484599pfq.138.2019.11.18.22.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 22:53:27 -0800 (PST)
Date:   Mon, 18 Nov 2019 22:53:25 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH 3/3] soc: qcom: apr: Add avs/audio tracking functionality
Message-ID: <20191119065325.GF18024@yoga>
References: <20191118142728.30187-1-sibis@codeaurora.org>
 <0101016e7ee9d8b5-9759d0ba-4acf-4fc4-a863-fac9c738397f-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e7ee9d8b5-9759d0ba-4acf-4fc4-a863-fac9c738397f-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 Nov 06:28 PST 2019, Sibi Sankar wrote:
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
[..]
> +static void of_register_apr_devices(struct device *dev, const char *svc_path)
>  {
>  	struct apr *apr = dev_get_drvdata(dev);
>  	struct device_node *node;
> +	const char *service_path;
> +	int ret;
>  
>  	for_each_child_of_node(dev->of_node, node) {
>  		struct apr_device_id id = { {0} };
>  
> +		ret = of_property_read_string_index(node, "qcom,protection-domain",
> +						    1, &service_path);
> +		if (svc_path) {
> +			/* skip APR services that are PD independent */
> +			if (ret)
> +				continue;
> +
> +			/* skip APR services whose PD paths don't match */
> +			if (strcmp(service_path, svc_path))
> +				continue;
> +		} else {
> +			/* skip APR services whose PD lookups are registered*/

Missing space before */

> +			if (ret == 0)
> +				continue;
> +		}
> +
>  		if (of_property_read_u32(node, "reg", &id.svc_id))
>  			continue;
>  
> @@ -318,6 +365,37 @@ static void of_register_apr_devices(struct device *dev)
>  	}
>  }
>  
> +static int apr_remove_device(struct device *dev, void *svc_path)
> +{
> +	struct apr_device *adev = to_apr_device(dev);
> +
> +	if (svc_path) {
> +		if (!strcmp(adev->service_path, (char *)svc_path))
> +			device_unregister(&adev->dev);
> +	} else {
> +		device_unregister(&adev->dev);
> +	}
> +
> +	return 0;
> +}
> +
> +static int apr_pd_status(struct pdr_handle *pdr, struct pdr_service *pds)

Why is the pdr status function returning an int?

> +{
> +	struct apr *apr = container_of(pdr, struct apr, pdr);
> +
> +	switch (pds->state) {
> +	case SERVREG_SERVICE_STATE_UP:
> +		of_register_apr_devices(apr->dev, pds->service_path);
> +		break;
> +	case SERVREG_SERVICE_STATE_DOWN:
> +		device_for_each_child(apr->dev, pds->service_path,
> +				      apr_remove_device);
> +		break;
> +	}
> +
> +	return 0;
> +}
[..]
> @@ -343,20 +421,19 @@ static int apr_probe(struct rpmsg_device *rpdev)
>  		return -ENOMEM;
>  	}
>  	INIT_WORK(&apr->rx_work, apr_rxwq);
> +
> +	ret = pdr_handle_init(&apr->pdr, apr_pd_status);
> +	if (ret) {
> +		dev_err(dev, "Failed to init PDR handle\n");

You need to destroy apr->rxwq here as well.

> +		return ret;
> +	}
> +
>  	INIT_LIST_HEAD(&apr->rx_list);
>  	spin_lock_init(&apr->rx_lock);
>  	spin_lock_init(&apr->svcs_lock);
>  	idr_init(&apr->svcs_idr);
> -	of_register_apr_devices(dev);
> -
> -	return 0;
> -}

Regards,
Bjorn
