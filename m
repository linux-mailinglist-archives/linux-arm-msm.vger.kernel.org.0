Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDAA017308A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 06:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgB1Fih (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 00:38:37 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36264 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgB1Fih (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 00:38:37 -0500
Received: by mail-pl1-f196.google.com with SMTP id a6so801123plm.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 21:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cmj60uSH7xooz04S/6FkeWZRv3V/9gwpZ+q8SsW3lxE=;
        b=bA8OKIcVfhBiK6Aq9uQYGtGH+W7HI16uTIMyyh6hpXdM9ZFivv06m7GsVJ6161JiV0
         XFT4Z1Cr9RM+Rpyt4Q0hNW7JUjJZU1BCwYzcwivSX81Fqob1PlYi533yFxrwgPMAjRTO
         5UdOYdwko1KS2foSQAqWnZbHjzSHOMAanpTK+nVaTd7QfpSbDE8BXirACDHVUZkwCzre
         78oKnKIxQHVO5umOFqScZThByfwCPijKdbEXHOZ4OoO9vwr7nIvS8NwBqQnPGhZvH5Ah
         tFiScBpxGcPQQ0uLgT6VKPdq4zUk/mXfzx7nPT5ofLctVQiBoX7XVxsKhf1w44Bb14FP
         7ZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cmj60uSH7xooz04S/6FkeWZRv3V/9gwpZ+q8SsW3lxE=;
        b=YuFwwyt9PdTcc+QkcyIIh90jwXCWn/UqzredCvUwLqep+mfc4XcM0HVYOIOkwZeSBf
         nDB42/U3ZcIHjGia3VSUV52UsvMjuKnP/K57e703rh3PN75EE5MpspjFFGRmiJIV/MfV
         yE930UuikdhovAtl8sYDslXbWrQhBZ/iHJmNThbGI92NViQCRub1nRIxim8FAKYqcMh8
         dwZsG7z1ttjtzzyuPKzAd6SlpzYHuxauh6jimdz/Hu/+eFX2WJ6D9XFLEaPnMPbenvYv
         OyAGzpQ2VUTHlsxdG/AhNOB+5oafWIVJbf6U8/TGlTuYTeIIrsYuIezKUT0SRrA+c8D5
         4mkQ==
X-Gm-Message-State: APjAAAX869IncP3oZw+c4um88I6wq/nTJN+25K/2CmuemdgGy5Yz+g5O
        dSdA3hIRG3hm0BfJjZqHQDjItA==
X-Google-Smtp-Source: APXvYqyfpfd4TEeeIVODb74++OYHjVe30yswx8ej5H3IfT1zlKHQXtdE20LLh4hOMRcKr5An7L+WwQ==
X-Received: by 2002:a17:90a:cc10:: with SMTP id b16mr2664623pju.55.1582868315988;
        Thu, 27 Feb 2020 21:38:35 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v22sm5150896pfe.49.2020.02.27.21.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 21:38:35 -0800 (PST)
Date:   Thu, 27 Feb 2020 21:38:32 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tsoni@codeaurora.org, vnkgutta@codeaurora.org
Subject: Re: [PATCH v4 3/3] soc: qcom: apr: Add avs/audio tracking
 functionality
Message-ID: <20200228053832.GE210720@yoga>
References: <20200226170001.24234-1-sibis@codeaurora.org>
 <20200226170001.24234-4-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226170001.24234-4-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 26 Feb 09:00 PST 2020, Sibi Sankar wrote:

> Use PDR helper functions to track the protection domains that the apr
> services are dependent upon on SDM845 SoC, specifically the "avs/audio"
> service running on ADSP Q6.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---

Please do include a changelog as you respin your patches.

Regards,
Bjorn

>  drivers/soc/qcom/Kconfig     |   1 +
>  drivers/soc/qcom/apr.c       | 123 ++++++++++++++++++++++++++++++++---
>  include/linux/soc/qcom/apr.h |   1 +
>  3 files changed, 116 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index cca6a43e771d9..57000f1615ada 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -202,6 +202,7 @@ config QCOM_APR
>  	tristate "Qualcomm APR Bus (Asynchronous Packet Router)"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on RPMSG
> +	select QCOM_PDR_HELPERS
>  	help
>  	  Enable APR IPC protocol support between
>  	  application processor and QDSP6. APR is
> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> index 4fcc32420c474..1f35b097c6356 100644
> --- a/drivers/soc/qcom/apr.c
> +++ b/drivers/soc/qcom/apr.c
> @@ -11,6 +11,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/of_device.h>
>  #include <linux/soc/qcom/apr.h>
> +#include <linux/soc/qcom/pdr.h>
>  #include <linux/rpmsg.h>
>  #include <linux/of.h>
>  
> @@ -21,6 +22,7 @@ struct apr {
>  	spinlock_t rx_lock;
>  	struct idr svcs_idr;
>  	int dest_domain_id;
> +	struct pdr_handle *pdr;
>  	struct workqueue_struct *rxwq;
>  	struct work_struct rx_work;
>  	struct list_head rx_list;
> @@ -289,6 +291,9 @@ static int apr_add_device(struct device *dev, struct device_node *np,
>  		  id->svc_id + 1, GFP_ATOMIC);
>  	spin_unlock(&apr->svcs_lock);
>  
> +	of_property_read_string_index(np, "qcom,protection-domain",
> +				      1, &adev->service_path);
> +
>  	dev_info(dev, "Adding APR dev: %s\n", dev_name(&adev->dev));
>  
>  	ret = device_register(&adev->dev);
> @@ -300,14 +305,75 @@ static int apr_add_device(struct device *dev, struct device_node *np,
>  	return ret;
>  }
>  
> -static void of_register_apr_devices(struct device *dev)
> +static int of_apr_add_pd_lookups(struct device *dev)
> +{
> +	const char *service_name, *service_path;
> +	struct apr *apr = dev_get_drvdata(dev);
> +	struct device_node *node;
> +	struct pdr_service *pds;
> +	int ret;
> +
> +	for_each_child_of_node(dev->of_node, node) {
> +		ret = of_property_read_string_index(node, "qcom,protection-domain",
> +						    0, &service_name);
> +		if (ret < 0)
> +			continue;
> +
> +		ret = of_property_read_string_index(node, "qcom,protection-domain",
> +						    1, &service_path);
> +		if (ret < 0) {
> +			dev_err(dev, "pdr service path missing: %d\n", ret);
> +			return ret;
> +		}
> +
> +		pds = pdr_add_lookup(apr->pdr, service_name, service_path);
> +		if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
> +			dev_err(dev, "pdr add lookup failed: %d\n", ret);
> +			return PTR_ERR(pds);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
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
> +		/*
> +		 * This function is called with svc_path NULL during
> +		 * apr_probe(), in which case we register any apr devices
> +		 * without a qcom,protection-domain specified.
> +		 *
> +		 * Then as the protection domains becomes available
> +		 * (if applicable) this function is again called, but with
> +		 * svc_path representing the service becoming available. In
> +		 * this case we register any apr devices with a matching
> +		 * qcom,protection-domain.
> +		 */
> +
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
> +			/* skip APR services whose PD lookups are registered */
> +			if (ret == 0)
> +				continue;
> +		}
> +
>  		if (of_property_read_u32(node, "reg", &id.svc_id))
>  			continue;
>  
> @@ -318,6 +384,34 @@ static void of_register_apr_devices(struct device *dev)
>  	}
>  }
>  
> +static int apr_remove_device(struct device *dev, void *svc_path)
> +{
> +	struct apr_device *adev = to_apr_device(dev);
> +
> +	if (svc_path && adev->service_path) {
> +		if (!strcmp(adev->service_path, (char *)svc_path))
> +			device_unregister(&adev->dev);
> +	} else {
> +		device_unregister(&adev->dev);
> +	}
> +
> +	return 0;
> +}
> +
> +static void apr_pd_status(int state, char *svc_path, void *priv)
> +{
> +	struct apr *apr = (struct apr *)priv;
> +
> +	switch (state) {
> +	case SERVREG_SERVICE_STATE_UP:
> +		of_register_apr_devices(apr->dev, svc_path);
> +		break;
> +	case SERVREG_SERVICE_STATE_DOWN:
> +		device_for_each_child(apr->dev, svc_path, apr_remove_device);
> +		break;
> +	}
> +}
> +
>  static int apr_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *dev = &rpdev->dev;
> @@ -343,28 +437,39 @@ static int apr_probe(struct rpmsg_device *rpdev)
>  		return -ENOMEM;
>  	}
>  	INIT_WORK(&apr->rx_work, apr_rxwq);
> +
> +	apr->pdr = pdr_handle_alloc(apr_pd_status, apr);
> +	if (IS_ERR(apr->pdr)) {
> +		dev_err(dev, "Failed to init PDR handle\n");
> +		ret = PTR_ERR(apr->pdr);
> +		goto destroy_wq;
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
>  
> -static int apr_remove_device(struct device *dev, void *null)
> -{
> -	struct apr_device *adev = to_apr_device(dev);
> +	ret = of_apr_add_pd_lookups(dev);
> +	if (ret)
> +		goto handle_release;
>  
> -	device_unregister(&adev->dev);
> +	of_register_apr_devices(dev, NULL);
>  
>  	return 0;
> +
> +handle_release:
> +	pdr_handle_release(apr->pdr);
> +destroy_wq:
> +	destroy_workqueue(apr->rxwq);
> +	return ret;
>  }
>  
>  static void apr_remove(struct rpmsg_device *rpdev)
>  {
>  	struct apr *apr = dev_get_drvdata(&rpdev->dev);
>  
> +	pdr_handle_release(apr->pdr);
>  	device_for_each_child(&rpdev->dev, NULL, apr_remove_device);
>  	flush_workqueue(apr->rxwq);
>  	destroy_workqueue(apr->rxwq);
> diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
> index c5d52e2cb275f..7f0bc3cf4d610 100644
> --- a/include/linux/soc/qcom/apr.h
> +++ b/include/linux/soc/qcom/apr.h
> @@ -85,6 +85,7 @@ struct apr_device {
>  	uint16_t	domain_id;
>  	uint32_t	version;
>  	char name[APR_NAME_SIZE];
> +	const char *service_path;
>  	spinlock_t	lock;
>  	struct list_head node;
>  };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
