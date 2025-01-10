Return-Path: <linux-arm-msm+bounces-44742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2C4A092FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 15:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6222D16A2D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 14:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A40420E70F;
	Fri, 10 Jan 2025 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6X4Ck3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C8F20E701;
	Fri, 10 Jan 2025 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736518177; cv=none; b=ARnSXtSkHooPEWYUdByBT/M/OZW4dsthctPEDrkYQUluziaifhzhMOjSjGuOQYWGPvzB/VnBH7QURTALP2OYqeYihMsxYNuJk/yrY9Fg5diKy/HOSRXRAgwGmpRRSwyqc33gWb6x0J7tohpPPVeXSuuTMb1huG1yaKomWXnf4UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736518177; c=relaxed/simple;
	bh=BzqU8k0ICGCf9P2lsYRHW6RrSoUUVhJhmDeNcCF/upo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0TnM7gEWpZgggHfSrPg6xvdgHtqJ7c9w1JP6AQHIhGwiORPewFsR9EaI1uJTnA6YWexxfLD2fhf73KyzMUF9gEUt0BICPfPIUVEY/8T4b8o/jGAvlqIZx0BnDDYPpGh5E+AKlqVBTqwrTCwE6ysv3RqLhCoxobyWCdN/Vynd8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6X4Ck3D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57E6C4CED6;
	Fri, 10 Jan 2025 14:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736518176;
	bh=BzqU8k0ICGCf9P2lsYRHW6RrSoUUVhJhmDeNcCF/upo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6X4Ck3DIAaxq3dwu9LnBtCtQSYh1wtLY1sQXIYSQN56fTof/Xt1fvalaxdOFbTLi
	 Xwv27NKD1oxDtn6rSZxzZSxBEJOyFvIm9GhEQlykxWNvYlbtJ5WAeUuD/p03dP3Yrn
	 jOJehV+J3FPIWMqhSQtixHYW4fv6TN6peeBW7F1guMNAwVwWyK/hg0d/wLIdGsZ3qy
	 H9aSS2gzYJ29a3ssBvXWE/Uyq00zQxi+0Km5opq1OUpxzMim2zzufjoIcHKxC1qBBx
	 E/+7FbVph1WDoZuWuNt19NHrJQfzAfUiGIzKJcn+xuv1gpZ/GqNj1FDCKRxx8aRhBE
	 HcKWtu0yCHMJQ==
Date: Fri, 10 Jan 2025 08:09:34 -0600
From: Rob Herring <robh@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [RFC PATCH 5/6] bus: qcom-sc7180: Attach pm domain to watchdog
 device
Message-ID: <20250110140934.GB2630182-robh@kernel.org>
References: <20250108012846.3275443-1-swboyd@chromium.org>
 <20250108012846.3275443-6-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108012846.3275443-6-swboyd@chromium.org>

On Tue, Jan 07, 2025 at 05:28:42PM -0800, Stephen Boyd wrote:
> Find the watchdog device described as a child node of the sc7180 SoC
> node and attach a generic pm domain to the device before registering the
> device with the platform bus. The domain simply gets the clk and turns
> it on when the pm domain is powered on and turns it off when the pm
> domain is powered off.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/bus/qcom/qcom-sc7180.c | 122 +++++++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/drivers/bus/qcom/qcom-sc7180.c b/drivers/bus/qcom/qcom-sc7180.c
> index a615cf5a2129..7dfe6b32efef 100644
> --- a/drivers/bus/qcom/qcom-sc7180.c
> +++ b/drivers/bus/qcom/qcom-sc7180.c
> @@ -3,18 +3,140 @@
>   * SoC bus driver for Qualcomm SC7180 SoCs
>   */
>  
> +#include <linux/cleanup.h>
> +#include <linux/clk.h>
>  #include <linux/device.h>
> +#include <linux/dev_printk.h>
>  #include <linux/init.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_domain.h>
> +
> +struct qcom_soc_pm_domain {
> +	struct clk *clk;
> +	struct generic_pm_domain pd;
> +};
> +
> +static struct qcom_soc_pm_domain *
> +gpd_to_qcom_soc_pm_domain(struct generic_pm_domain *gpd)
> +{
> +	return container_of(gpd, struct qcom_soc_pm_domain, pd);
> +}
> +
> +static struct qcom_soc_pm_domain *pd_to_qcom_soc_pm_domain(struct dev_pm_domain *pd)
> +{
> +	struct generic_pm_domain *gpd;
> +
> +	gpd = container_of(pd, struct generic_pm_domain, domain);
> +
> +	return gpd_to_qcom_soc_pm_domain(gpd);
> +}
> +
> +static struct qcom_soc_pm_domain *dev_to_qcom_soc_pm_domain(struct device *dev)
> +{
> +	struct dev_pm_domain *pd;
> +
> +	pd = dev->pm_domain;
> +	if (!pd)
> +		return NULL;
> +
> +	return pd_to_qcom_soc_pm_domain(pd);
> +}
> +
> +static struct platform_device *
> +qcom_soc_alloc_device(struct platform_device *socdev, const char *compatible)
> +{
> +	struct device_node *np __free(device_node);
> +
> +	np = of_get_compatible_child(socdev->dev.of_node, compatible);
> +
> +	return of_platform_device_alloc(np, NULL, &socdev->dev);
> +}
> +
> +static int qcom_soc_domain_activate(struct device *dev)
> +{
> +	struct qcom_soc_pm_domain *soc_domain;
> +
> +	dev_info(dev, "Activating device\n");
> +	soc_domain = dev_to_qcom_soc_pm_domain(dev);
> +
> +	soc_domain->clk = devm_clk_get(dev, NULL);
> +
> +	return PTR_ERR_OR_ZERO(soc_domain->clk);
> +}
> +
> +static int qcom_soc_domain_power_on(struct generic_pm_domain *domain)
> +{
> +	struct qcom_soc_pm_domain *soc_domain;
> +
> +	pr_info("Powering on device\n");
> +	soc_domain = gpd_to_qcom_soc_pm_domain(domain);
> +
> +	return clk_prepare_enable(soc_domain->clk);
> +}
> +
> +static int qcom_soc_domain_power_off(struct generic_pm_domain *domain)
> +{
> +	struct qcom_soc_pm_domain *soc_domain;
> +
> +	pr_info("Powering off device\n");
> +	soc_domain = gpd_to_qcom_soc_pm_domain(domain);
> +
> +	clk_disable_unprepare(soc_domain->clk);

How's this going to scale when there are multiple clocks and it's not 
just turn on/off all the clocks in any order? Or when there's ordering 
requirements between different resources.

I'm pretty sure I've seen attempts to order clock entries in DT based on 
the order they want to enable them.

> +
> +	return 0;
> +}
> +
> +static int qcom_soc_add_clk_domain(struct platform_device *socdev,
> +				   struct platform_device *pdev)
> +{
> +	struct qcom_soc_pm_domain *domain;
> +	struct generic_pm_domain *pd;
> +	int ret;
> +
> +	domain = devm_kzalloc(&socdev->dev, sizeof(*domain), GFP_KERNEL);
> +	if (!domain)
> +		return -ENOMEM;
> +
> +	pd = &domain->pd;
> +	pd->name = "wdog";
> +	ret = pm_genpd_init(pd, NULL, false);
> +	if (ret)
> +		return ret;
> +
> +	/* TODO: Wrap this in a generic_pm_domain function similar to power_on() */
> +	pd->domain.activate = qcom_soc_domain_activate;
> +	pd->power_on = qcom_soc_domain_power_on;
> +	pd->power_off = qcom_soc_domain_power_off;
> +
> +	dev_info(&socdev->dev, "adding pm domain for %s\n", dev_name(&pdev->dev));
> +	dev_pm_domain_set(&pdev->dev, &pd->domain);
> +
> +	return 0;
> +}
>  
>  static int qcom_soc_sc7180_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> +	struct platform_device *sdev;
> +	int ret;
> +
> +	sdev = qcom_soc_alloc_device(pdev, "qcom,apss-wdt-sc7180");

We're going to have to have an explicit call for every child node?

> +	if (!sdev)
> +		return dev_err_probe(dev, -ENODEV, "Failed to alloc sdev\n");
> +
> +	ret = qcom_soc_add_clk_domain(pdev, sdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add clk domain to sdev\n");
> +
> +	ret = of_platform_device_add(sdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add sdev to bus\n");
>  
>  	return of_platform_populate(np, NULL, NULL, dev);
>  }
> -- 
> https://chromeos.dev
> 

