Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C583021F6AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 18:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgGNQFB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 12:05:01 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:27773 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgGNQFA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 12:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1594742695;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Spezz/C6//ge5H/J9Y8FNwVYQDRFbPkYkD8EuMVrEEA=;
        b=DgIOeDcHYCL9DqC1yJlnGeiQyI4agtDlAtG7qjJwwlQBjkiHva6QZLyCwL/v22IchC
        nMt6aozEOALnNok42Uab4bokRM/rTomeIY9dInjoszOnYW+U/1x/AQmUuYFf1qqCL8EE
        NHCL03NU2DkMAIk6pIaE8YqFIqeCSzgeOcWzREzM6UQWL4s62wiVQ44YfZcVYQZumzst
        HYTZRtS8UVJct7x6iIJ7laaaGGvdA7Sbtd8+HUe7MsBIMtLBNpzmRnWg1yJeQiYwMk19
        fzFgJXIi27DX9gcM0bGx4diSkF5zqXuQ/G5+PXGvdvx9K4xxhPUvcx+zp5mupGwjITRq
        b+UA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IcfFBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew6EG4t8mh
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 14 Jul 2020 18:04:55 +0200 (CEST)
Date:   Tue, 14 Jul 2020 18:04:45 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 3/4] hwspinlock: qcom: Allow mmio usage in addition to
 syscon
Message-ID: <20200714160445.GA3848@gerhold.net>
References: <20200622075956.171058-1-bjorn.andersson@linaro.org>
 <20200622075956.171058-4-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622075956.171058-4-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Mon, Jun 22, 2020 at 12:59:55AM -0700, Bjorn Andersson wrote:
> In modern Qualcomm platforms the mutex region of the TCSR is forked off
> into its own block, all with a offset of 0 and stride of 4096, and in
> some of these platforms no other registers in this region is accessed
> from Linux.
> 
> So add support for directly memory mapping this register space, to avoid
> the need to represent this block using a syscon.
> 
> Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Use devm_platform_ioremap_resource()
> 
>  drivers/hwspinlock/qcom_hwspinlock.c | 70 +++++++++++++++++++++-------
>  1 file changed, 54 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
> index f0da544b14d2..364710966665 100644
> --- a/drivers/hwspinlock/qcom_hwspinlock.c
> +++ b/drivers/hwspinlock/qcom_hwspinlock.c
> @@ -70,41 +70,79 @@ static const struct of_device_id qcom_hwspinlock_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, qcom_hwspinlock_of_match);
>  
> -static int qcom_hwspinlock_probe(struct platform_device *pdev)
> +static struct regmap *qcom_hwspinlock_probe_syscon(struct platform_device *pdev,
> +						   u32 *base, u32 *stride)
>  {
> -	struct hwspinlock_device *bank;
>  	struct device_node *syscon;
> -	struct reg_field field;
>  	struct regmap *regmap;
> -	size_t array_size;
> -	u32 stride;
> -	u32 base;
>  	int ret;
> -	int i;
>  
>  	syscon = of_parse_phandle(pdev->dev.of_node, "syscon", 0);
> -	if (!syscon) {
> -		dev_err(&pdev->dev, "no syscon property\n");
> -		return -ENODEV;
> -	}
> +	if (!syscon)
> +		return ERR_PTR(-ENODEV);
>  
>  	regmap = syscon_node_to_regmap(syscon);
>  	of_node_put(syscon);
>  	if (IS_ERR(regmap))
> -		return PTR_ERR(regmap);
> +		return regmap;
>  
> -	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 1, &base);
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 1, base);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "no offset in syscon\n");
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  	}
>  
> -	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 2, &stride);
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 2, stride);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "no stride syscon\n");
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  	}
>  
> +	return regmap;
> +}
> +
> +static const struct regmap_config tcsr_mutex_config = {
> +	.reg_bits		= 32,
> +	.reg_stride		= 4,
> +	.val_bits		= 32,
> +	.max_register		= 0x40000,

Where does the 0x40000 come from?

It seems like this driver has QCOM_MUTEX_NUM_LOCKS = 32 hardcoded.
With a stride of 4096 = 0x1000 you get 0x1000 * 32 = 0x20000.

This is also the reg size used in msm8996.dtsi and msm8916.dtsi for
example, while sdm845.dtsi and sm8250.dtsi specify 0x40000.
Are you not exposing all available locks on the newer SoCs?

I'm not sure how important max_register is... But I guess it should be
either correct for all SoCs or not specified at all (since it's
optional)?

(That is assuming the hwlock can be also used directly via MMIO on
 MSM8996 and MSM8916. It looks to me like it has its own register
 space there as well...)

Thanks,
Stephan
