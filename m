Return-Path: <linux-arm-msm+bounces-49949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E8DA4B3DD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 18:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 584DF1891819
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 17:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4A01EA7F0;
	Sun,  2 Mar 2025 17:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b="Dzin1JeI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB0A1C174A;
	Sun,  2 Mar 2025 17:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.76.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740937863; cv=none; b=uVBFVLdve3o2zwgYF+2pFh2IyvbLsCy8pBUoXlEi5+O3WupX5WlhzSpDXLmSZ0XEDEyjBLzHqLZtuL3DEQpN3z7oKN9SQVsI2OsHNKMVuUOuFAzLfo+/wk1/4Co0ynAM9SqK9ODzfjFRJ2thZZa7JqjlMgh7uKcIkqWb03x7IiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740937863; c=relaxed/simple;
	bh=ICAxiJHnVQwCRmL5zZ4EFvYM72/ECGdWdm5L5gBE8Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=szfl7rs54JIbI5Sgkc8hjCNx+bnnavEWW7+dUjb2jY3p1bdLRxvxZeOoSscukDu/uK6hJy6r9ctabrh4IFnPy1pzUou9mLshkVbdvVmkGgVxQ1RSo8NIn3kfeis28Dtvp9C7byn4NY/m0Im1xLjfAkx06+XL3pgxL9Yc//ONbdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz; spf=pass smtp.mailfrom=seznam.cz; dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b=Dzin1JeI; arc=none smtp.client-ip=77.75.76.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seznam.cz
Received: from email.seznam.cz
	by smtpc-mxd-6786f7f9fd-wrmb6
	(smtpc-mxd-6786f7f9fd-wrmb6 [2a02:598:96:8a00::1200:712])
	id 2d0c3500760261692ca5f95e;
	Sun, 02 Mar 2025 18:50:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
	s=szn20221014; t=1740937856;
	bh=WkqVeVDjwGLX/zODAkt/FUNn6SDbwu2B0XHW4KyKjSE=;
	h=Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:Content-Type:Content-Transfer-Encoding;
	b=Dzin1JeIU49gZzMI7noPE/iBmf/IOlq2D3GM+WC4CYBD8VQXmypyE9EeKGiSsLrK9
	 tWQYxWDgmC6v+mxiedrqtuBaDXPq84W8qcYy1TT3cirJCGdpylJbA/kCYCPfIgNXno
	 +c+Do4ieFp07PQ7SNYRhF6VUDNc0/AXu6eZKmalYhIgTj4RB4qzs0rRVKdAECgrwSw
	 LtuM+lmLD1y/26PemPr8brza44jbarZdHRiMD9YKK3QsA5C0E70AwIVLtBE9rBLbjJ
	 UXYk74JZlCeKZq572jaSLts9fdoS81JGxlN8Jzy3jK3QdSnlOzU8TkwC5/z4JzNGEx
	 eDq/WHJV28/5Q==
Received: from [192.168.0.240] (ip-111-27.static.ccinternet.cz
	[147.161.27.111])
	by smtpd-relay-dd695557-59gb8 (szn-email-smtpd/2.0.31) with ESMTPA
	id 6deb8026-90ad-450f-828a-6caf96f3825f;
	Sun, 02 Mar 2025 18:48:52 +0100
Message-ID: <164b21fb-2ba9-42a4-9964-5e4f051df37a@seznam.cz>
Date: Sun, 2 Mar 2025 18:46:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] bus: qcom-ssc-block-bus: Fix the error handling path
 of qcom_ssc_block_bus_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, andersson@kernel.org,
 konradybcio@kernel.org, jeffrey.l.hugo@gmail.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <cover.1740932040.git.christophe.jaillet@wanadoo.fr>
 <1b89ec7438c9a893c09083e8591772c8ad3cb599.1740932040.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Michael Srba <Michael.Srba@seznam.cz>
In-Reply-To: <1b89ec7438c9a893c09083e8591772c8ad3cb599.1740932040.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

iirc it took me quite a long time to figure out the correct sequence for the bus to come up, so I'd be careful with that indeed. Sadly I can't easily test this on the original device right now, when I have time I want to upstream support for sdm845 which I could test more easily, but the sdm845 case is simpler so idk if testing on that would be sufficient.

On 02. 03. 25 17:21, Christophe JAILLET wrote:
> If qcom_ssc_block_bus_pds_enable() fails, the previous call to
> qcom_ssc_block_bus_pds_attach() must be undone, as already done in the
> remove function.
>
> In order to do that, move the code related to the power domains management
> to the end of the function, in order to avoid many changes in all the error
> handling path that would need to go through the new error handling path.
>
> Fixes: 97d485edc1d9 ("bus: add driver for initializing the SSC bus on (some) qcom SoCs")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is compile tested only.
>
> It is also speculative. Power management interaction can be sometimes
> tricky and I'm not 100% sure that moving this code in fine.
>
> Review with care.
> ---
>   drivers/bus/qcom-ssc-block-bus.c | 31 +++++++++++++++++++------------
>   1 file changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/bus/qcom-ssc-block-bus.c b/drivers/bus/qcom-ssc-block-bus.c
> index c95a985e3498..7f5fd4e0940d 100644
> --- a/drivers/bus/qcom-ssc-block-bus.c
> +++ b/drivers/bus/qcom-ssc-block-bus.c
> @@ -264,18 +264,6 @@ static int qcom_ssc_block_bus_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, data);
>   
> -	data->pd_names = qcom_ssc_block_pd_names;
> -	data->num_pds = ARRAY_SIZE(qcom_ssc_block_pd_names);
> -
> -	/* power domains */
> -	ret = qcom_ssc_block_bus_pds_attach(&pdev->dev, data->pds, data->pd_names, data->num_pds);
> -	if (ret < 0)
> -		return dev_err_probe(&pdev->dev, ret, "error when attaching power domains\n");
> -
> -	ret = qcom_ssc_block_bus_pds_enable(data->pds, data->num_pds);
> -	if (ret < 0)
> -		return dev_err_probe(&pdev->dev, ret, "error when enabling power domains\n");
> -
>   	/* low level overrides for when the HW logic doesn't "just work" */
>   	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpm_sscaon_config0");
>   	data->reg_mpm_sscaon_config0 = devm_ioremap_resource(&pdev->dev, res);
> @@ -343,11 +331,30 @@ static int qcom_ssc_block_bus_probe(struct platform_device *pdev)
>   
>   	data->ssc_axi_halt = halt_args.args[0];
>   
> +	/* power domains */
> +	data->pd_names = qcom_ssc_block_pd_names;
> +	data->num_pds = ARRAY_SIZE(qcom_ssc_block_pd_names);
> +
> +	ret = qcom_ssc_block_bus_pds_attach(&pdev->dev, data->pds, data->pd_names, data->num_pds);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "error when attaching power domains\n");
> +
> +	ret = qcom_ssc_block_bus_pds_enable(data->pds, data->num_pds);
> +	if (ret < 0) {
> +		dev_err_probe(&pdev->dev, ret, "error when enabling power domains\n");
> +		goto err_detach_pds_bus;
> +	}
> +
>   	qcom_ssc_block_bus_init(&pdev->dev);
>   
>   	of_platform_populate(np, NULL, NULL, &pdev->dev);
>   
>   	return 0;
> +
> +err_detach_pds_bus:
> +	qcom_ssc_block_bus_pds_detach(&pdev->dev, data->pds, data->num_pds);
> +
> +	return ret;
>   }
>   
>   static void qcom_ssc_block_bus_remove(struct platform_device *pdev)


