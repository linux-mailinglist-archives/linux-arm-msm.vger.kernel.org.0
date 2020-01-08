Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80922134D24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 21:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgAHUYW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 15:24:22 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40429 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgAHUYW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 15:24:22 -0500
Received: by mail-pg1-f195.google.com with SMTP id k25so2087271pgt.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2020 12:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UIXqgaiVWae8Bhi+dC+q5rSp1vgGUZgQyrqPawYppjo=;
        b=V7BfQX1BvUdYAxjWvcUf0XpDhT5nkjUkA7/08jlIQRhx+EBJ7vNuiDz6uNW55ElOpD
         hsXEXbULovv6CtYsUmmP6cBFmWd6MywDjCJSYYeSc8ucQtBommmqdgUbP6EJ6zN+e1eP
         dtZfTyZo4b40dD/x8Wkw0t+Dicv6+qPrkDRiqVXQqL1rmT4sV/U77jQgOXrxyZP5vDfp
         4q5GRwgZS5ACG6mznYllo0kxC96dCRgRlbhgId72HAuWs2GYQim0s3NTfCVKOHLLC0K8
         LjfoRs4N9OgE7vdhs5A0MOWe13w9B3OJN7hy28OuVnrgbcmXEyDz5l5FySrOn+8tbCBQ
         CqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UIXqgaiVWae8Bhi+dC+q5rSp1vgGUZgQyrqPawYppjo=;
        b=rRvhUQZYdYgAOzb4lFNEZ3r+hYkWZLvdKu3B0Q4AOefKDdNUPkrX85nbHwfJdJYJvw
         /hCEdxX1nIwejuAzqVJAcvdYj5w3Lk1sXAA8S+HhdomwIIuJJtj2Ha6zZLOA1h3NS7/w
         9tBWHPgZgFyyfOeBjnFTTcDS1IE8wF33M3qWfx+0I6DeHlzKX+39gue+Qs9+z3OYyChy
         MnqYX2xn5b6rAk9/0JhTbRH2/qDBHeExQbofTMzeXaUwt9mU2Al8ehGu09glJSl4PQaT
         6x+9qa9i1hDUBnpcZJF+yNQO8C/D5PnocBCb0pRBQDzh7LWgpFnhsHJzXhaP3GiRri8N
         WEgw==
X-Gm-Message-State: APjAAAUm7AcdLzm9tXkqXqn+Ux1cOVF/PSSlcCviLT/iPGGEkW+76Y9Q
        axN259uowvOKETjSFUFZe/CTvw==
X-Google-Smtp-Source: APXvYqx2eKy9DIhvgEVT2MvULvpoa3Atkfrm2Z7BVw2iAsxFD2KZjXe9EH7giHcTvLfHMGKdOcqaGA==
X-Received: by 2002:a63:1f0c:: with SMTP id f12mr7346558pgf.247.1578515061913;
        Wed, 08 Jan 2020 12:24:21 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b98sm135319pjc.16.2020.01.08.12.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:24:21 -0800 (PST)
Date:   Wed, 8 Jan 2020 13:24:18 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: wcnss: Allow specifying firmware-name
Message-ID: <20200108202418.GA28145@xps15>
References: <20200108055252.639791-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108055252.639791-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Tue, Jan 07, 2020 at 09:52:52PM -0800, Bjorn Andersson wrote:
> Introduce a firmware-name property, in order to be able to support
> device/platform specific firmware for the wireless connectivity
> subsystem; in line with other Qualcomm remoteproc drivers.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,wcnss-pil.txt     | 6 ++++++
>  drivers/remoteproc/qcom_wcnss.c                           | 8 +++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
> index d420f84ddfb0..00844a5d2ccf 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
> @@ -34,6 +34,12 @@ on the Qualcomm WCNSS core.
>  	Definition: should be "wdog", "fatal", optionally followed by "ready",
>  		    "handover", "stop-ack"
>  
> +- firmware-name:
> +	Usage: optional
> +	Value type: <string>
> +	Definition: must list the relative firmware image path for the
> +		    WCNSS core.

Perhaps mention that if omitted the firmware name will default to "wcnss.mdt".

> +
>  - vddmx-supply:
>  - vddcx-supply:
>  - vddpx-supply:
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index dc135754bb9c..a0468b3cc76f 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -457,6 +457,7 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
>  
>  static int wcnss_probe(struct platform_device *pdev)
>  {
> +	const char *fw_name = WCNSS_FIRMWARE_NAME;
>  	const struct wcnss_data *data;
>  	struct qcom_wcnss *wcnss;
>  	struct resource *res;
> @@ -474,8 +475,13 @@ static int wcnss_probe(struct platform_device *pdev)
>  		return -ENXIO;
>  	}
>  
> +	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
> +				      &fw_name);
> +	if (ret < 0 && ret != -EINVAL)
> +		return ret;
> +
>  	rproc = rproc_alloc(&pdev->dev, pdev->name, &wcnss_ops,
> -			    WCNSS_FIRMWARE_NAME, sizeof(*wcnss));
> +			    fw_name, sizeof(*wcnss));
>  	if (!rproc) {
>  		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
>  		return -ENOMEM;

That is in line with what was done for q6v5_mss and q6v5_pas.  With or without
the above:

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> -- 
> 2.24.0
> 
