Return-Path: <linux-arm-msm+bounces-25343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C4D9284D1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 100001F22342
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7A31465BF;
	Fri,  5 Jul 2024 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oHvNR3Fn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E19D144313
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170685; cv=none; b=oGUGOpTu+DZC1GHN/pnPtdKEfIUoFTv+K57kPU8ZlkhVCbMo2RML1Rw95VQz/AWfE0eoElcpwHlpBvZ5IL9VfWATRQNHhqryodtcZ5RbQgsigjouMvuVekJfnZN3QCraUGG/Ujuf8cJflsv8Rzqg/Og1Ac+UDdTHMdMUTmJtPXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170685; c=relaxed/simple;
	bh=Obcusb3z1OoJpJ4NO+mhAvNE7U/tycv2lZGobiVFHIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tXhGvrOGwGoh14F/iINj8TkZMsITttIrZ5jBh0b4yDN+1aU0/B2A/eBmofN3dRi9sFcNgYQUN+0QguNQ4NSpMk3FUMA4cn40djChd+a+F8EKNMYeOJTpzek5BhczTHDnIdhvbFeiYm/H5y+dh+JV7UxrciqOQkUGOWqvtRDaCc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oHvNR3Fn; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ec5fad1984so18509751fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720170682; x=1720775482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z1Tk2Un/Adzphb3H82iPl6Wyt2tLSdbxVdSmw4USudk=;
        b=oHvNR3Fnsipg3d4rU8xG7G4K9P2Etp+aLtxEF8c2Ekty37tisiAKD+/h/pdekMkYzW
         mqELaLgI8bvjd6GZINJOpG3a8EZeyHuZLfjB8pEn0+BN+AYNYSMy8vojOe7VK+aw3DKW
         NTV85bBy1s64qgg1LiwItOXWX3iFW8qEXBYTx9AuNCEZMLGDI1w5HYCNvkS3aF4hBgsR
         qoRimzIUY0FFTTZoRbTb5qK79LSbPG5KHbDsI9e1pStl7sGeX1lkbW3f3jbPyvSp6O5D
         OkWHNYN/yXIPRc+gOR1yx1HvrfirFVSGmxb2GAGICkeep1Q0p7FByuYTSkYUgmU2Vopb
         gvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720170682; x=1720775482;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1Tk2Un/Adzphb3H82iPl6Wyt2tLSdbxVdSmw4USudk=;
        b=UEythRf82Wv2XhEcyjtjumHoWOOJQMyKulMeWx3EuYExTeuSFSSRhjYtiu8+tR7qwY
         2w3JoVZSVVgwEOFFERk7y7gt3eeHOVRVAzp/N1s5348dVcFf6w8PvHgpxHBpyIOVnYWq
         vcD+zIoHmiEP/sOSPCyKoOG2nNyiD1ZE4Q9DB7pvHuF6/cJbvx3MKwzVtEdMNJQ4iweD
         WzQ9xNenbnNjirLw9RwF8+u+f5FOTvhA53u3uLWgLP1zdj5ZMs4MxlBnfFYdzowCyZfO
         eflpNlqG6paqUzA8KAbNYRGUuAoyOAUkeA3C0yfMgAeZKuN7elWhDuhkBvyWt5KGamz3
         +ktw==
X-Forwarded-Encrypted: i=1; AJvYcCWXMcgUE/k3oX+/lUkGrlNBcUMZT2URaZI1Mr6QSmthUHlrRjfLTRRj8RTj7hyyMuePwlOPE5HCCzLtPfHFICebUGi4dLN2T5Z5MOtCgg==
X-Gm-Message-State: AOJu0Yxc/7Gs2zcAr0nLGg8TnAF86jx/2sZ+PrY2inp4187bQvbXPLwT
	bR9qBD/qwv67eM3ISj+COLghLehB674QeuHR4mgqXh2QUVTxBqUGUEg89iqYvR8=
X-Google-Smtp-Source: AGHT+IHBBdABka3YMuRBJYPjTxRuL3X0L0+YkBKA8/jh33DITaHzCTUN4Ihmx3cNZrqxmFFRYaz/2A==
X-Received: by 2002:a2e:960a:0:b0:2ee:52d5:c4a3 with SMTP id 38308e7fff4ca-2ee8edff069mr29849661fa.39.1720170681673;
        Fri, 05 Jul 2024 02:11:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367938a6e97sm6054962f8f.109.2024.07.05.02.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 02:11:21 -0700 (PDT)
Message-ID: <9b502ba5-7042-424e-b0a2-5659e4064462@linaro.org>
Date: Fri, 5 Jul 2024 11:11:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] Coresight: Add Coresight Control Unit driver
To: Jie Gan <quic_jiegan@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 James Clark <james.clark@arm.com>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>,
 Song Chai <quic_songchai@quicinc.com>, linux-arm-msm@vger.kernel.org
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
 <20240705090049.1656986-4-quic_jiegan@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240705090049.1656986-4-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/07/2024 11:00, Jie Gan wrote:
> The Coresight Control Unit hosts miscellaneous configuration registers
> which control various features related to TMC ETR sink.
> 
> Based on the trace ID, which is programmed in the related CCU ATID register
> of a specific ETR, trace data with that trace ID gets into the ETR buffer,

....

> +static int ccu_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct coresight_platform_data *pdata;
> +	struct ccu_drvdata *drvdata;
> +	struct coresight_desc desc = { 0 };
> +	struct resource *res;
> +
> +	desc.name = coresight_alloc_device_name(&ccu_devs, dev);
> +	if (!desc.name)
> +		return -ENOMEM;
> +	pdata = coresight_get_platform_data(dev);
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +	pdev->dev.platform_data = pdata;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +	drvdata->dev = &pdev->dev;

Use stored dev variable.

> +	drvdata->atid_offset = 0;
> +	platform_set_drvdata(pdev, drvdata);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ccu-base");
> +	if (!res)
> +		return -ENODEV;
> +	drvdata->pbase = res->start;

Drop.

> +
> +	drvdata->base = devm_ioremap(dev, res->start, resource_size(res));

Use proper wrapper for this two.

> +	if (!drvdata->base)
> +		return -ENOMEM;
> +
> +	desc.type = CORESIGHT_DEV_TYPE_HELPER;
> +	desc.pdata = pdev->dev.platform_data;
> +	desc.dev = &pdev->dev;
> +	desc.ops = &ccu_ops;
> +
> +	drvdata->csdev = coresight_register(&desc);
> +	if (IS_ERR(drvdata->csdev))
> +		return PTR_ERR(drvdata->csdev);
> +
> +	dev_dbg(dev, "CCU initialized: %s\n", desc.name);

Drop.

> +	return 0;
> +}
> +
> +static void ccu_remove(struct platform_device *pdev)
> +{
> +	struct ccu_drvdata *drvdata = platform_get_drvdata(pdev);
> +
> +	coresight_unregister(drvdata->csdev);
> +}
> +
> +static const struct of_device_id ccu_match[] = {
> +	{.compatible = "qcom,coresight-ccu"},
> +	{}
> +};
> +
> +static struct platform_driver ccu_driver = {
> +	.probe          = ccu_probe,
> +	.remove         = ccu_remove,
> +	.driver         = {
> +		.name   = "coresight-ccu",
> +		.of_match_table = ccu_match,
> +		.suppress_bind_attrs = true,

Why?

> +	},
> +};
> +
> +static int __init ccu_init(void)
> +{
> +	return platform_driver_register(&ccu_driver);
> +}
> +module_init(ccu_init);
> +
> +static void __exit ccu_exit(void)
> +{
> +	platform_driver_unregister(&ccu_driver);
> +}
> +module_exit(ccu_exit);

Why this is not just module platform driver?

Best regards,
Krzysztof


