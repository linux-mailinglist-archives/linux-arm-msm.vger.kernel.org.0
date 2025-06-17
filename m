Return-Path: <linux-arm-msm+bounces-61607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 476B4ADCFEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 16:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42C4C3A423F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 14:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BA52EF650;
	Tue, 17 Jun 2025 14:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIyeNQqd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F19A2EF64C;
	Tue, 17 Jun 2025 14:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170301; cv=none; b=PZKEMF7J0rIPIkSP6NwsQGuE0H9JhzhMjn3tVYQx/hrJ5rH2KZLcuIWHwoazsXOEVmuhhHUuBG3tblnAHg6EG7g40qY5rxGx9mAk4bMAEIpapjJ7TIomYoBGciSS1Kg/qi0QCfmmSJauVqr3xUcbK6H1PsO+V2UFhKogHh/iOuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170301; c=relaxed/simple;
	bh=RKp0dSWKgDenpsXCZCvzvHN8SLhhM9lokbjMKsoO5ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6USRnaxWiXCzIfKLmTl7AGCWemu5sszAS7o4iEOD/l6NPDZ+xdD5HSGiGaqbixtgBC1m3LtIYmxXyjNZmIOMgpxX55URyoQsDkTAfsdWJAUSuVzJhrEsL0oqH/gu9zGAd9AzZbCcfdm7jDbaDP/cgJbkybZYL/ibu6nAYMbQEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIyeNQqd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5819C4CEE3;
	Tue, 17 Jun 2025 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750170300;
	bh=RKp0dSWKgDenpsXCZCvzvHN8SLhhM9lokbjMKsoO5ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XIyeNQqdJi42s3GLrTWVJiA9ldEF6TQB1VgOWYIkFcnZPgXIvvdOuAUjFH9ZAezBy
	 16VsCgej3Fg8e58rWMKQAnqCSckI6RRa2/XtlrWgEjM1/mQLP9LTyGgAnoGais4edQ
	 Q+OEM8m7lnJC4ssINvEXmcuZcaryB9Kndt8zuYdG1pOl3E53x5iF49a75hCH31HGuq
	 sv86Fm4lvWlw5H9Uw6YcO/VzzMIOqv5hGEcqCKsq4lTOEjNEi6NQ4F5jan5VtHLKjl
	 6KhuRhtCU25ChgQx0RJWpXYD5MtGJXd5E9MWOnOxqsqD78VLr+03ReQqYRpjnGmUN7
	 LiJrSr+z83WBg==
Date: Tue, 17 Jun 2025 09:24:57 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, psodagud@quicinc.com, 
	djaggi@quicinc.com, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, 
	quic_arandive@quicinc.com, quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH v6 3/8] soc: qcom: geni-se: Enable QUPs on SA8255p
 Qualcomm platforms
Message-ID: <52elmnb77a4kvlnmy5bhheypfyyw6x5qn4k45u22mvzybax7ti@wmpi2ww5uqsg>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-4-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606172114.6618-4-quic_ptalari@quicinc.com>

On Fri, Jun 06, 2025 at 10:51:09PM +0530, Praveen Talari wrote:
> On the sa8255p platform, resources such as clocks,interconnects
> and TLMM (GPIO) configurations are managed by firmware.
> 
> Introduce a platform data function callback to distinguish whether
> resource control is performed by firmware or directly by the driver
> in linux.
> 
> The refactor ensures clear differentiation of resource
> management mechanisms, improving maintainability and flexibility
> in handling platform-specific configurations.
> 
> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> ---
> v5 -> v6
> - replaced dev_err with dev_err_probe
> - added a check for desc->num_clks with MAX_CLKS, an error if
>   the specified num_clks in descriptor exceeds defined MAX_CLKS.
> - removed min_t which is not necessary.
> - renamed callback function names to resources_init.
> - resolved kernel bot warning error by documenting function
>   pointer in geni_se_desc structure.
> 
> v3 -> v4
> - declared an empty struct for sa8255p and added check as num clks.
> - Added version log after ---
> 
> v1 -> v2
> - changed datatype of i from int to unsigned int as per comment.
> ---
>  drivers/soc/qcom/qcom-geni-se.c | 77 +++++++++++++++++++++------------
>  1 file changed, 49 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 4cb959106efa..5c727b9a17e9 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -101,10 +101,13 @@ struct geni_wrapper {
>   * struct geni_se_desc - Data structure to represent the QUP Wrapper resources
>   * @clks:		Name of the primary & optional secondary AHB clocks
>   * @num_clks:		Count of clock names
> + * @resources_init:	Function pointer for initializing QUP Wrapper resources
>   */
>  struct geni_se_desc {
>  	unsigned int num_clks;
>  	const char * const *clks;
> +	int (*resources_init)(struct geni_wrapper *wrapper,
> +			      const struct geni_se_desc *desc);
>  };
>  
>  static const char * const icc_path_names[] = {"qup-core", "qup-config",
> @@ -891,10 +894,47 @@ int geni_icc_disable(struct geni_se *se)
>  }
>  EXPORT_SYMBOL_GPL(geni_icc_disable);
>  
> +static int geni_se_resource_init(struct geni_wrapper *wrapper,
> +				 const struct geni_se_desc *desc)
> +{
> +	struct device *dev = wrapper->dev;
> +	int ret;
> +	unsigned int i;
> +
> +	if (desc->num_clks > MAX_CLKS)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Too many clocks specified in descriptor:%u (max allowed: %u)\n",
> +				     desc->num_clks, MAX_CLKS);
> +
> +	wrapper->num_clks = desc->num_clks;
> +
> +	for (i = 0; i < wrapper->num_clks; ++i)
> +		wrapper->clks[i].id = desc->clks[i];
> +
> +	ret = of_count_phandle_with_args(dev->of_node, "clocks", "#clock-cells");
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "invalid clocks property at %pOF\n", dev->of_node);
> +
> +	if (ret < wrapper->num_clks) {
> +		dev_err(dev, "invalid clocks count at %pOF, expected %d entries\n",
> +			dev->of_node, wrapper->num_clks);
> +		return -EINVAL;
> +	}
> +
> +	ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
> +	if (ret) {
> +		dev_err(dev, "Err getting clks %d\n", ret);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
>  static int geni_se_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct geni_wrapper *wrapper;
> +	const struct geni_se_desc *desc;
>  	int ret;
>  
>  	wrapper = devm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
> @@ -906,36 +946,12 @@ static int geni_se_probe(struct platform_device *pdev)
>  	if (IS_ERR(wrapper->base))
>  		return PTR_ERR(wrapper->base);
>  
> -	if (!has_acpi_companion(&pdev->dev)) {
> -		const struct geni_se_desc *desc;
> -		int i;
> -
> -		desc = device_get_match_data(&pdev->dev);
> -		if (!desc)
> -			return -EINVAL;
> -
> -		wrapper->num_clks = min_t(unsigned int, desc->num_clks, MAX_CLKS);
> -
> -		for (i = 0; i < wrapper->num_clks; ++i)
> -			wrapper->clks[i].id = desc->clks[i];
> -
> -		ret = of_count_phandle_with_args(dev->of_node, "clocks", "#clock-cells");
> -		if (ret < 0) {
> -			dev_err(dev, "invalid clocks property at %pOF\n", dev->of_node);
> -			return ret;
> -		}
> +	desc = device_get_match_data(&pdev->dev);
>  
> -		if (ret < wrapper->num_clks) {
> -			dev_err(dev, "invalid clocks count at %pOF, expected %d entries\n",
> -				dev->of_node, wrapper->num_clks);
> +	if (!has_acpi_companion(&pdev->dev) && desc->num_clks) {

Reading this again, the only functional change I can spot is the
addition of this desc->num_clks check. (And the addition of the new
compatible)

The rest of the patch is just moving things out of this if statement
body, introducing the flexibility of a function pointer with a single
possible value etc.


As I've said before, function pointers are useful to create
abstractions, but they make it harder to follow the code (both for me
and the CPU) so you need to provide some value in return - and I'm
failing to see what that value is.

> +		ret = desc->resources_init(wrapper, desc);

In other words, you can replace this line with:

	ret = geni_se_resource_init();

Or, if this is all we get, then you can do nothing and just add the
additional expression to the condition and be done with it.

> +		if (ret)
>  			return -EINVAL;
> -		}
> -
> -		ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
> -		if (ret) {
> -			dev_err(dev, "Err getting clks %d\n", ret);
> -			return ret;
> -		}
>  	}
>  
>  	dev_set_drvdata(dev, wrapper);
> @@ -951,8 +967,11 @@ static const char * const qup_clks[] = {
>  static const struct geni_se_desc qup_desc = {
>  	.clks = qup_clks,
>  	.num_clks = ARRAY_SIZE(qup_clks),
> +	.resources_init = geni_se_resource_init,
>  };
>  
> +static const struct geni_se_desc sa8255p_qup_desc;

This looks like a forward declaration, it took me a while to realize
that this is giving you the actual all-zero geni_se_desc.

Add a = {}; to make it clear that this is where you declare the
variable.

Thanks,
Bjorn

> +
>  static const char * const i2c_master_hub_clks[] = {
>  	"s-ahb",
>  };
> @@ -960,11 +979,13 @@ static const char * const i2c_master_hub_clks[] = {
>  static const struct geni_se_desc i2c_master_hub_desc = {
>  	.clks = i2c_master_hub_clks,
>  	.num_clks = ARRAY_SIZE(i2c_master_hub_clks),
> +	.resources_init = geni_se_resource_init,
>  };
>  
>  static const struct of_device_id geni_se_dt_match[] = {
>  	{ .compatible = "qcom,geni-se-qup", .data = &qup_desc },
>  	{ .compatible = "qcom,geni-se-i2c-master-hub", .data = &i2c_master_hub_desc },
> +	{ .compatible = "qcom,sa8255p-geni-se-qup", .data = &sa8255p_qup_desc },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, geni_se_dt_match);
> -- 
> 2.17.1
> 

