Return-Path: <linux-arm-msm+bounces-57724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4915AB58FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 17:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2F713B079F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 15:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6722BE7DB;
	Tue, 13 May 2025 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9wDUak4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870A42BE11F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151207; cv=none; b=EMarDnD0bs9RvDQUt8mgJdb0y4jFA9TMcuxCnJ/Y1jYnIbhuLcvdxqwmRKb51bBr9Y7SJMQ3osGvTUdwCxNDNDA4zEKmDfVaJdQJNdMnJZBgtdkAfIy66LobIXu010AcPUEYW5kj7uRmPvMWoQADFa+SHZqEvvNrNG30VAE/aPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151207; c=relaxed/simple;
	bh=EXf8CXJA+KGF4MTIP8ZW5RfW4nXpg3xQrdGF82ut11k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0hA9r+tqt/3moc5WkCBYgvyQYKUEDsfZPupaOgVnHZb7AXsFvKcVjgz1YxTew9q5RbJ/bTCa85AZ9K8ldaQNK14OJEFhHXNu5p2Ga3njjC9pyzzR0dbuYAV/BJ4QaRPPDEElxeBFQGrHL1SFTdoE7+cNzsB2eOZ9UjbORgZ6iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9wDUak4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-440685d6afcso64317885e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747151204; x=1747756004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGm1s4FjOQu15fzsHG9ZhyojliSZSAlqCmPExLub3gA=;
        b=m9wDUak4gfy/NH5K8y3ZnxV6yn3uZMQOHRAsCriQVm82SypIDT1eYx5AeQVL0SYjZ9
         fGVC7SthUW69CJiQP6gFxdixFz6oWmnm3TgIzvZqJnv8AFzmDIcWtmmC83NqFQDhY1Bl
         xg80qQSNdpixauJAQTBbN2c+A68ZNBlWztSx4GU52jImwDBMO+J1VIDP4Ch59/zMss0K
         A+DwO2D/b2dNUvsqb7Gc5mwz3fGSP0E4kPcjEMK6saJV4wkXDmkSZL8o6fZzmMsKIRuv
         1pIiLeL/74/GBmMqnWE83bjdqny8gBOHfyrkMLFG+qCg3hpUP84eF6CmwWT+mu9xM4Gh
         NO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151204; x=1747756004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGm1s4FjOQu15fzsHG9ZhyojliSZSAlqCmPExLub3gA=;
        b=hJtoTkX1F2MQKnxrQywAlYR3lU7P5nkqQXQfNcBOWZNwZ06P9tQ6hd3cWoZOT7R+xt
         fTYZwrKBFa84TlraUIiqpKJtDJfzFpC/GQ32rWDY5TudCkFPyBRwQQHeyHwdRIikUa9P
         16xQh8PG3yXEmd6MQ7vEeYD8b9E9AMW4pKLKju2GsVc/xYL/mRCCSweCnasmqJHxa1qy
         RW1gKwmqYh1HruDQANLlEI8MRhmAlBps08m9NhTV6xlJPTyqpF/TpZPtLs0hcKqsPVSG
         I1wNqlUt6Eb1+4yHAI/xb97mCDKs/RE8PdJdmUjQ+xR39PnZmZbIeOMNz+7MESRC46q9
         XEwA==
X-Forwarded-Encrypted: i=1; AJvYcCUdbHcvZX8VL1ZlFkREc8C620hpNCeQDVRW2GwiGEAWcIDDbwl8yUdSFgz5xHX8G3K/Xd2HwRN9NMZCUhWK@vger.kernel.org
X-Gm-Message-State: AOJu0YwyacOwtbs1cLI/GUKLhUKO/fv5j7kwQEutLc441FYWuBHzSVqw
	NCKXCnBkoPaMokcG5X1mJF0pBweA2IstR5MatnfaxHzN10jmzvzN+u8Ta/8aPtY=
X-Gm-Gg: ASbGncsOvWWq4IX7+8LrdMCempiJoQyIWKZqvSvaqFwP5iWDnnVB4Ccu9DVsP3Fo8p9
	eylJE7rIlsOqKm4H6hdaWHSbieoILSOK/hPWW5cFeFl5q6ru/NM+5p0h0U3iro23/KFi2AdKU4K
	eFjgedA23f0tX52HvrX4uvosMIRPhoh4TFxcRVpHV4B+81qLXrJCH7CxBEvROx3NhS5X6KeRr84
	mb7TEIc5WaufqsmC1nNLtIP1RTr/u1cftWeEYB9LhFjFT7FHMtg1DMZMPIbPybzDv/HuNXx2THd
	7N/a2K8b4q0XOdFjCXsaC7OzFAJHuVu96a4KA0V0nRHV+j4KT4CWmiuB3kisdFlgv1Sjgb+8R4y
	zmdRiIDAcBTpp
X-Google-Smtp-Source: AGHT+IHp/EyEZ33e67Om03bIuE88oWOcEc2nr1b1QY7mJTKv5Gt8XxFki5LkpJlMAoKHk8KDU1xxxA==
X-Received: by 2002:a05:600c:3e8c:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-442d6ddec16mr149637965e9.29.1747151203876;
        Tue, 13 May 2025 08:46:43 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7dc1sm211862865e9.34.2025.05.13.08.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:46:43 -0700 (PDT)
Message-ID: <33caa974-75f7-4054-9f75-9b97981335f1@linaro.org>
Date: Tue, 13 May 2025 16:46:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 5/9] media: qcom: camss: unconditionally set async
 notifier of subdevices
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <20250513142353.2572563-6-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250513142353.2572563-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
> For sake of simplicity it makes sense to register async notifier
> for all type of subdevices, both CAMSS components and sensors.
> 
> The case of sensors not connected to CAMSS is extraordinary and
> degenerate, it does not deserve any specific optimization.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 30 ++++++-----------------
>   1 file changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 976b70cc6d6a..4e91e4b6ef52 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3556,7 +3556,6 @@ static int camss_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct camss *camss;
> -	int num_subdevs;
>   	int ret;
>   
>   	camss = devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
> @@ -3627,11 +3626,9 @@ static int camss_probe(struct platform_device *pdev)
>   
>   	pm_runtime_enable(dev);
>   
> -	num_subdevs = camss_of_parse_ports(camss);
> -	if (num_subdevs < 0) {
> -		ret = num_subdevs;
> +	ret = camss_of_parse_ports(camss);
> +	if (ret < 0)
>   		goto err_v4l2_device_unregister;
> -	}
>   
>   	ret = camss_register_entities(camss);
>   	if (ret < 0)
> @@ -3647,23 +3644,12 @@ static int camss_probe(struct platform_device *pdev)
>   		goto err_register_subdevs;
>   	}
>   
> -	if (num_subdevs) {
> -		camss->notifier.ops = &camss_subdev_notifier_ops;
> -
> -		ret = v4l2_async_nf_register(&camss->notifier);
> -		if (ret) {
> -			dev_err(dev,
> -				"Failed to register async subdev nodes: %d\n",
> -				ret);
> -			goto err_media_device_unregister;
> -		}
> -	} else {
> -		ret = v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
> -		if (ret < 0) {
> -			dev_err(dev, "Failed to register subdev nodes: %d\n",
> -				ret);
> -			goto err_media_device_unregister;
> -		}
> +	camss->notifier.ops = &camss_subdev_notifier_ops;
> +	ret = v4l2_async_nf_register(&camss->notifier);
> +	if (ret) {
> +		dev_err(dev,
> +			"Failed to register async subdev nodes: %d\n", ret);
> +		goto err_media_device_unregister;
>   	}
>   
>   	return 0;

If I've understood the intent here, don't think this is right.

For cases where we want to run CSID TPG or standalone TPG we would not 
necessarily have a sensor connected.

---
bod

