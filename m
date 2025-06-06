Return-Path: <linux-arm-msm+bounces-60487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 993CAAD04DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 17:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B60DC1649E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 15:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A64D289350;
	Fri,  6 Jun 2025 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hve9braA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAB1126C17
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 15:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222435; cv=none; b=RbgZExpmBAxwkiiKJUWO9ZvS+LDz2Sy3mZ8Gkg9/95lYrNWFaIDZYKIMyxp5oBK+Mro+XtH19sdmh3YHZELIdXmscmedpcwX68olVlXi9KLrihqF80KZALwyiK7+2QwijlWUvHnQaW6N9L+cPyVoPl+wL1JH0OBrhPzdJ8YRWtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222435; c=relaxed/simple;
	bh=ADVJJCRcmD0mLAlYAE92zYCKME0YhADfudgXzeyCt+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mozOgaYExvzmgpESY399KWFL/XODWIxPC8czlWHsGIF7s0igLgUsbsU4WZUEEKdf1Cr5WpknI2bmGJRuzc3wgx3qrFTgYYwQQp8MY0UXjzb954YduS2rtsWzpk7XHONU2c9gHIfsOPiSay/QtwfokCSz6rG9gU33HVM3lLAhr4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hve9braA; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-addfe17ec0bso568265566b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222431; x=1749827231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pc/SK1Fvfl7qYXo204AzZDmTFG30IXxvBddG6FvY2z4=;
        b=Hve9braA/Xw2ZtkTjBqpKh1ShWZQe0+Kj2zPfQSihjN+7rzlCIqzRSBj13BhEG4JOJ
         FC1S2PHg6yWK3G1JyaU/Z3clV9VkIw2OeCYQiGnh5ldadlpRbE11vTFMw+f8vKbY58MW
         hH9Vc7lw474waRGL23HF6DksydN1F/p0RhoWnPwHcD3NSt8uSkoa+Rknjtesu66hLKHW
         MB1CFsvR3ADgQWWYnckAaRvZ5AOLNXSYUtXRKY614f6ew+JHfbIxFiBg3SpNcJLO2mnL
         SvQjJvVz+ybzrW0X63shQ6A5Iamexypiv4XK53ul4VCYuJSpnnuRSAFIaoZDEBmt6ovK
         LHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222431; x=1749827231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pc/SK1Fvfl7qYXo204AzZDmTFG30IXxvBddG6FvY2z4=;
        b=D13ioVthLry/Gx0iXzHlImAsKoEIngkd0Xns7N6iJ2lSospM7iHNHZJlbkuGFETBkP
         MeSUXIkYUbfHMHCv7uOwwfKDV6WMq9hJLsEZovlcL0p0LoGe9Mq3TFwR1+LFs7xV3ec3
         4Z6SGzDZdmw1bq9Q/s4/DhB0KN/7eBwB7J4E68Jfg8CL5OPnQKchr4ojgxduBO53GD93
         Kr4j40uftlNZGhnALDp0DdAYC28jrmobUl09N1g3QR+e0WLsQKYeth8lN+wY7IUmOsDs
         P3lUw8WKjRHb5hEUsqGPa6JBrJcYXPSZU5V5QNZHOmdwDLG5vNPfuyVma50ANsRXrBca
         nEBw==
X-Forwarded-Encrypted: i=1; AJvYcCUFJJl9+2CbI6+jzwkgWGoMmKCrYbFE5sl2kRsmEl4Mujx9ILcKklZQsyvIqivX9zUuuybJJoE3dbvGno2Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxfXUuIYO/kvj2GofHIU7ioFsQLMTL2OL4+KEdML2J+sGdW1UC8
	ZoOQLLhy8jK9CAoldBBYzgVcwIcXY5IWMA3q/5Vc8LHJnGgo9Qox18ibyhYr3wq+oc9lB5GtywN
	G5gyT
X-Gm-Gg: ASbGncsFYBJGJT56CET7wnfo2Wsk/JzXWaNxJPB0mY17VIpc/cWeIXiqDaRUWwo9qdJ
	GRNYdQrp/wt24h5oPDe6BI0CNTA61q8xDeA3G3yji2bcXeOlKrUFyYFttboJ/O10ZxxVYMOMLO5
	g/lGMY7i3zxoQL6wDUingd6lbvc07YgNywKqjuOZ7uYyjnAtdZIkydsxA27V0sXW93OZrDVdkKh
	PRG3MysLMNSb8owuB9ZzzlUVzBzbglxrOlm/nUR+NcDNyDk6ms96nSPxd+EEb2b3pF448DHGyL8
	3Ge9Br36RKbq99UD3CwkyaEWSY7w/pnmvpQ+6FLyra4fG3YDyGqqT7mRTdIkX/tWB/bbqap5yQ=
	=
X-Google-Smtp-Source: AGHT+IHAKCgU6k68iC6QxjWSvfB5F/Whj3LvE9iYIb5LO7mQImUC1Ui1uT3AEHCwbJX5msacoU1mJA==
X-Received: by 2002:a17:906:830f:b0:ade:31bf:611c with SMTP id a640c23a62f3a-ade31bf657cmr104820766b.9.1749222431322;
        Fri, 06 Jun 2025 08:07:11 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:fec5:df29:72db:ff36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d7542c8sm130047266b.21.2025.06.06.08.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:07:10 -0700 (PDT)
Date: Fri, 6 Jun 2025 17:07:05 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: quic_utiwari@quicinc.com
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, bartosz.golaszewski@linaro.org,
	quic_neersoni@quicinc.com
Subject: Re: [PATCH] crypto: qce - Add suspend and resume support
Message-ID: <aEMEGZhGamnRD6_I@linaro.org>
References: <20250606105808.2119280-1-quic_utiwari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606105808.2119280-1-quic_utiwari@quicinc.com>

On Fri, Jun 06, 2025 at 04:28:08PM +0530, quic_utiwari@quicinc.com wrote:
> From: Udit Tiwari <quic_utiwari@quicinc.com>
> 
> Add basic suspend and resume callbacks to the QCE platform driver to
> manage interconnect bandwidth during system sleep and wake-up cycles.
> 
> Signed-off-by: Udit Tiwari <quic_utiwari@quicinc.com>

Can you add runtime PM support instead, so we can also reduce the
bandwidth/power consumption at runtime when QCE is not used?

Also, what about the clocks? They should also be disabled, not just the
bandwidth.

Thanks,
Stephan

> ---
>  drivers/crypto/qce/core.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index e95e84486d9a..2566bdad5d4a 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -249,6 +249,21 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  	return devm_qce_register_algs(qce);
>  }
>  
> +static int qce_crypto_suspend(struct platform_device *pdev, pm_message_t state)
> +{
> +	struct qce_device *qce = platform_get_drvdata(pdev);
> +
> +	return icc_set_bw(qce->mem_path, 0, 0);
> +}
> +
> +static int qce_crypto_resume(struct platform_device *pdev)
> +{
> +	struct qce_device *qce = platform_get_drvdata(pdev);
> +
> +	return icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
> +		QCE_DEFAULT_MEM_BANDWIDTH);
> +}
> +
>  static const struct of_device_id qce_crypto_of_match[] = {
>  	{ .compatible = "qcom,crypto-v5.1", },
>  	{ .compatible = "qcom,crypto-v5.4", },
> @@ -259,6 +274,8 @@ MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
>  
>  static struct platform_driver qce_crypto_driver = {
>  	.probe = qce_crypto_probe,
> +	.suspend = qce_crypto_suspend,
> +	.resume = qce_crypto_resume,
>  	.driver = {
>  		.name = KBUILD_MODNAME,
>  		.of_match_table = qce_crypto_of_match,
> -- 
> 2.34.1
> 

