Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693B733C255
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 17:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhCOQlG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 12:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232689AbhCOQkq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 12:40:46 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929F3C061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:40:45 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y13so6961891pfr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3jJteUT5d63f1lmBVbrb4+qa/GBdQZNNjpiC3X3liYA=;
        b=rTu/BZ/kiWHQgHQywlxCUV0b5cy7i8RJHn4GntwU3FTTiEyGBMadoiEqkUsPtUuoUg
         ReKDj6SGRncILhTbrXQWnEg/pxHazloD0rbs970BE/2p35odbgD5jeftDfwEVD/3BKrf
         tlsdopjYaIGzXvO8kdmmgnvHuRnmSm/sNA8aLJ/m4ROhyIqXmUVtl+Cft/J065ZIJrBn
         OMSQrs8SbCPjKAfo0SEMGyxlhcmNlB58MB+FfxEUEa8NRYxkXOzdrgdr2ntVP7OYycKR
         oYYUKVwQyNehT/uu2Wi/syhtA8fNNOI74SSLY9RF7Zb4922Zin3Oco9TzwiXZ3IHRdZU
         4uSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3jJteUT5d63f1lmBVbrb4+qa/GBdQZNNjpiC3X3liYA=;
        b=AVZhoVn6XG71rpsuFp3RXYvGYWzB0+XwVw+Rg+UhZVsBAyUtSycdlebyJOjrqDIrYv
         zWKXEFQhUa76SGwTbqDB9q8Hrb10AcfVKO2Q3/SJI2Zj5ccdaMEFEK/FgGAnLENdx181
         q1jRfIjy3xOEI0cLP75jASoCfA8kklCAlsn5pmLz7q2UrlI3e6FmEMXcCk3QIQfGep+2
         NyUz101nci3Vb4dH5zffUlxPa1xUjt21SitJav8soyhw97k4lv3eZomJIR5LA/wb6FOh
         gX2ycawCyaY02Y45H4WB6qvQP3eV+fs840FubS+iGS24+U+dqbqVqDyNcCZyjuCSURq9
         wz8w==
X-Gm-Message-State: AOAM530ySJAwmeBToymL9ERBgruDeq81jBYgTLbA9O1EugZhB2z5+jqf
        si3BIyKkhQuHw8frpf9Ne+z9GK3/Nedw2g==
X-Google-Smtp-Source: ABdhPJzRzyypOTnxM6vdzj+sy4XJxHIvD4hA7gh/48KFHusr9/4g4Ba4xzuqhu0GeqtkF5g9zDazhg==
X-Received: by 2002:a63:4b04:: with SMTP id y4mr10336pga.245.1615826445025;
        Mon, 15 Mar 2021 09:40:45 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j20sm10823756pji.3.2021.03.15.09.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:40:44 -0700 (PDT)
Date:   Mon, 15 Mar 2021 10:40:42 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anibal Limon <anibal.limon@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: wcnss: Fix race with iris probe
Message-ID: <20210315164042.GC1339147@xps15>
References: <20210312002251.3273013-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312002251.3273013-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 11, 2021 at 04:22:51PM -0800, Bjorn Andersson wrote:
> The remoteproc driver is split between the responsibilities of getting
> the SoC-internal ARM core up and running and the external RF (aka
> "Iris") part configured.
> 
> In order to satisfy the regulator framework's need of a struct device *
> to look up supplies this was implemented as two different drivers, using
> of_platform_populate() in the remoteproc part to probe the iris part.
> 
> Unfortunately it's possible that the iris part probe defers on yet not
> available regulators and an attempt to start the remoteproc will have to
> be rejected, until this has been resolved. But there's no useful
> mechanism of knowing when this would be.
> 
> Instead replace the of_platform_populate() and the iris probe with a
> function that rolls its own struct device, with the relevant of_node
> associated that is enough to acquire regulators and clocks specified in
> the DT node and that may propagate the EPROBE_DEFER back to the wcnss
> device's probe.
> 
> Reported-by: Anibal Limon <anibal.limon@linaro.org>
> Reported-by: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/qcom_wcnss.c      |  52 ++++--------
>  drivers/remoteproc/qcom_wcnss.h      |   4 +-
>  drivers/remoteproc/qcom_wcnss_iris.c | 120 +++++++++++++++++----------
>  3 files changed, 91 insertions(+), 85 deletions(-)

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index e8007cc01bfa..2f482ab6aade 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -142,18 +142,6 @@ static const struct wcnss_data pronto_v2_data = {
>  	.num_vregs = 1,
>  };
>  
> -void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss,
> -			    struct qcom_iris *iris,
> -			    bool use_48mhz_xo)
> -{
> -	mutex_lock(&wcnss->iris_lock);
> -
> -	wcnss->iris = iris;
> -	wcnss->use_48mhz_xo = use_48mhz_xo;
> -
> -	mutex_unlock(&wcnss->iris_lock);
> -}
> -
>  static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
> @@ -639,12 +627,20 @@ static int wcnss_probe(struct platform_device *pdev)
>  		goto detach_pds;
>  	}
>  
> +	wcnss->iris = qcom_iris_probe(&pdev->dev, &wcnss->use_48mhz_xo);
> +	if (IS_ERR(wcnss->iris)) {
> +		ret = PTR_ERR(wcnss->iris);
> +		goto detach_pds;
> +	}
> +
>  	ret = rproc_add(rproc);
>  	if (ret)
> -		goto detach_pds;
> +		goto remove_iris;
>  
> -	return of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> +	return 0;
>  
> +remove_iris:
> +	qcom_iris_remove(wcnss->iris);
>  detach_pds:
>  	wcnss_release_pds(wcnss);
>  free_rproc:
> @@ -657,9 +653,10 @@ static int wcnss_remove(struct platform_device *pdev)
>  {
>  	struct qcom_wcnss *wcnss = platform_get_drvdata(pdev);
>  
> -	of_platform_depopulate(&pdev->dev);
> +	qcom_iris_remove(wcnss->iris);
>  
> -	qcom_smem_state_put(wcnss->state);
> +	if (wcnss->state)
> +		qcom_smem_state_put(wcnss->state);
>  	rproc_del(wcnss->rproc);
>  
>  	qcom_remove_sysmon_subdev(wcnss->sysmon);
> @@ -687,28 +684,7 @@ static struct platform_driver wcnss_driver = {
>  	},
>  };
>  
> -static int __init wcnss_init(void)
> -{
> -	int ret;
> -
> -	ret = platform_driver_register(&wcnss_driver);
> -	if (ret)
> -		return ret;
> -
> -	ret = platform_driver_register(&qcom_iris_driver);
> -	if (ret)
> -		platform_driver_unregister(&wcnss_driver);
> -
> -	return ret;
> -}
> -module_init(wcnss_init);
> -
> -static void __exit wcnss_exit(void)
> -{
> -	platform_driver_unregister(&qcom_iris_driver);
> -	platform_driver_unregister(&wcnss_driver);
> -}
> -module_exit(wcnss_exit);
> +module_platform_driver(wcnss_driver);
>  
>  MODULE_DESCRIPTION("Qualcomm Peripheral Image Loader for Wireless Subsystem");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/remoteproc/qcom_wcnss.h b/drivers/remoteproc/qcom_wcnss.h
> index 62c8682d0a92..6d01ee6afa7f 100644
> --- a/drivers/remoteproc/qcom_wcnss.h
> +++ b/drivers/remoteproc/qcom_wcnss.h
> @@ -17,9 +17,9 @@ struct wcnss_vreg_info {
>  	bool super_turbo;
>  };
>  
> +struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo);
> +void qcom_iris_remove(struct qcom_iris *iris);
>  int qcom_iris_enable(struct qcom_iris *iris);
>  void qcom_iris_disable(struct qcom_iris *iris);
>  
> -void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss, struct qcom_iris *iris, bool use_48mhz_xo);
> -
>  #endif
> diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
> index 169acd305ae3..09720ddddc85 100644
> --- a/drivers/remoteproc/qcom_wcnss_iris.c
> +++ b/drivers/remoteproc/qcom_wcnss_iris.c
> @@ -17,7 +17,7 @@
>  #include "qcom_wcnss.h"
>  
>  struct qcom_iris {
> -	struct device *dev;
> +	struct device dev;
>  
>  	struct clk *xo_clk;
>  
> @@ -75,7 +75,7 @@ int qcom_iris_enable(struct qcom_iris *iris)
>  
>  	ret = clk_prepare_enable(iris->xo_clk);
>  	if (ret) {
> -		dev_err(iris->dev, "failed to enable xo clk\n");
> +		dev_err(&iris->dev, "failed to enable xo clk\n");
>  		goto disable_regulators;
>  	}
>  
> @@ -93,43 +93,90 @@ void qcom_iris_disable(struct qcom_iris *iris)
>  	regulator_bulk_disable(iris->num_vregs, iris->vregs);
>  }
>  
> -static int qcom_iris_probe(struct platform_device *pdev)
> +static const struct of_device_id iris_of_match[] = {
> +	{ .compatible = "qcom,wcn3620", .data = &wcn3620_data },
> +	{ .compatible = "qcom,wcn3660", .data = &wcn3660_data },
> +	{ .compatible = "qcom,wcn3660b", .data = &wcn3680_data },
> +	{ .compatible = "qcom,wcn3680", .data = &wcn3680_data },
> +	{}
> +};
> +
> +static void qcom_iris_release(struct device *dev)
> +{
> +	struct qcom_iris *iris = container_of(dev, struct qcom_iris, dev);
> +
> +	of_node_put(iris->dev.of_node);
> +	kfree(iris);
> +}
> +
> +struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
>  {
> +	const struct of_device_id *match;
>  	const struct iris_data *data;
> -	struct qcom_wcnss *wcnss;
> +	struct device_node *of_node;
>  	struct qcom_iris *iris;
>  	int ret;
>  	int i;
>  
> -	iris = devm_kzalloc(&pdev->dev, sizeof(struct qcom_iris), GFP_KERNEL);
> -	if (!iris)
> -		return -ENOMEM;
> +	of_node = of_get_child_by_name(parent->of_node, "iris");
> +	if (!of_node) {
> +		dev_err(parent, "No child node \"iris\" found\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	iris = kzalloc(sizeof(*iris), GFP_KERNEL);
> +	if (!iris) {
> +		of_node_put(of_node);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	device_initialize(&iris->dev);
> +	iris->dev.parent = parent;
> +	iris->dev.release = qcom_iris_release;
> +	iris->dev.of_node = of_node;
> +
> +	dev_set_name(&iris->dev, "%s.iris", dev_name(parent));
> +
> +	ret = device_add(&iris->dev);
> +	if (ret) {
> +		put_device(&iris->dev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	match = of_match_device(iris_of_match, &iris->dev);
> +	if (!match) {
> +		dev_err(&iris->dev, "no matching compatible for iris\n");
> +		ret = -EINVAL;
> +		goto err_device_del;
> +	}
>  
> -	data = of_device_get_match_data(&pdev->dev);
> -	wcnss = dev_get_drvdata(pdev->dev.parent);
> +	data = match->data;
>  
> -	iris->xo_clk = devm_clk_get(&pdev->dev, "xo");
> +	iris->xo_clk = devm_clk_get(&iris->dev, "xo");
>  	if (IS_ERR(iris->xo_clk)) {
> -		if (PTR_ERR(iris->xo_clk) != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "failed to acquire xo clk\n");
> -		return PTR_ERR(iris->xo_clk);
> +		ret = PTR_ERR(iris->xo_clk);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&iris->dev, "failed to acquire xo clk\n");
> +		goto err_device_del;
>  	}
>  
>  	iris->num_vregs = data->num_vregs;
> -	iris->vregs = devm_kcalloc(&pdev->dev,
> +	iris->vregs = devm_kcalloc(&iris->dev,
>  				   iris->num_vregs,
>  				   sizeof(struct regulator_bulk_data),
>  				   GFP_KERNEL);
> -	if (!iris->vregs)
> -		return -ENOMEM;
> +	if (!iris->vregs) {
> +		ret = -ENOMEM;
> +		goto err_device_del;
> +	}
>  
>  	for (i = 0; i < iris->num_vregs; i++)
>  		iris->vregs[i].supply = data->vregs[i].name;
>  
> -	ret = devm_regulator_bulk_get(&pdev->dev, iris->num_vregs, iris->vregs);
> +	ret = devm_regulator_bulk_get(&iris->dev, iris->num_vregs, iris->vregs);
>  	if (ret) {
> -		dev_err(&pdev->dev, "failed to get regulators\n");
> -		return ret;
> +		dev_err(&iris->dev, "failed to get regulators\n");
> +		goto err_device_del;
>  	}
>  
>  	for (i = 0; i < iris->num_vregs; i++) {
> @@ -143,34 +190,17 @@ static int qcom_iris_probe(struct platform_device *pdev)
>  					   data->vregs[i].load_uA);
>  	}
>  
> -	qcom_wcnss_assign_iris(wcnss, iris, data->use_48mhz_xo);
> -
> -	return 0;
> -}
> +	*use_48mhz_xo = data->use_48mhz_xo;
>  
> -static int qcom_iris_remove(struct platform_device *pdev)
> -{
> -	struct qcom_wcnss *wcnss = dev_get_drvdata(pdev->dev.parent);
> +	return iris;
>  
> -	qcom_wcnss_assign_iris(wcnss, NULL, false);
> +err_device_del:
> +	device_del(&iris->dev);
>  
> -	return 0;
> +	return ERR_PTR(ret);
>  }
>  
> -static const struct of_device_id iris_of_match[] = {
> -	{ .compatible = "qcom,wcn3620", .data = &wcn3620_data },
> -	{ .compatible = "qcom,wcn3660", .data = &wcn3660_data },
> -	{ .compatible = "qcom,wcn3660b", .data = &wcn3680_data },
> -	{ .compatible = "qcom,wcn3680", .data = &wcn3680_data },
> -	{}
> -};
> -MODULE_DEVICE_TABLE(of, iris_of_match);
> -
> -struct platform_driver qcom_iris_driver = {
> -	.probe = qcom_iris_probe,
> -	.remove = qcom_iris_remove,
> -	.driver = {
> -		.name = "qcom-iris",
> -		.of_match_table = iris_of_match,
> -	},
> -};
> +void qcom_iris_remove(struct qcom_iris *iris)
> +{
> +	device_del(&iris->dev);
> +}
> -- 
> 2.29.2
> 
