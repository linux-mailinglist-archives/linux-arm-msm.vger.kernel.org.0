Return-Path: <linux-arm-msm+bounces-61203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C30AD8751
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 11:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCC207AF91B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 09:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532E3279DC2;
	Fri, 13 Jun 2025 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HkWxwgKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD9E279DCC
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805906; cv=none; b=DGAxAPtQBu7QGOnGDAbOpvozS27r9Lx6RnadoUC01tQKGdAPvfjztfp4nf0NdH8JTI/5g0j3E44hJcWvoYYRVpxoJLISwy2rEmmSOJflDxfiB4po9Lc12nt2zT6RemmoUNzU1wH3seOoHKG8wONfE5FX0QSiJa2X/zFemVY12c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805906; c=relaxed/simple;
	bh=TV1FztWZiEx8Nmx82z1NsBxnQPMDh5iMV+BMlvNojEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPY+IpIhHcBBmHp5Pyn1FJXQBYTnP86Jro+wex95LoZ3Uf/3V+bfhBTnnqZ4B8FaVWs7AGbEEW6jB9IobNQrbRd3LaO1YZvoA4HP/PaxHQ2nEIE8CJaJo5nYB0oQwEHiaNBhyodp3+paW0Ljq6sNMG88vGGQN3VnsZgLMqxrs6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HkWxwgKX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so14537575e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749805903; x=1750410703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3O6NptWpipTQWlr/fPbc6lvca1xldNu8/PQfnl8OHYY=;
        b=HkWxwgKXufj3F6VkmSKYrAaxl2Ssr/uf1WvZcabxXMWkrDh++T+ObZtVRACUJVba4b
         FYzw0Ki0tcITAgFCCRuLUurklx8oeFLybpDsBuotE1mwLpMy9CtFmV3pKp0JMCaybjF0
         +aXal1qTWLAjNWZK/zmojOF83Y/41piXjnmKStyL12yfnsgDLrR/j159Hv1U/MZBh8oV
         wS5VFZJp00DZyfO61TI2wnmkDdU/YYyOcFZviz3lnYj0d7JRr6yiAgqiA4e1Cv+nJ9xB
         snPQRWFvxO7B255DNJT83vIyb0wrgbJXAbzV2Cr1qg/xK/AVc65iU/NLOvnFzIJF1F/R
         cDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749805903; x=1750410703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3O6NptWpipTQWlr/fPbc6lvca1xldNu8/PQfnl8OHYY=;
        b=YMFMWY3V8g8xjwOR5GJhYtAvOzSajhHVsxhHoWffv99YAwnfLQ243XYI6czL0YnVwg
         w9FFrO3r28GDym/K0muQS3V17PYKT2HsDznCh+/440bJFs8mtKPCHQ7S2Tc1u4Xms3+m
         Gx1SQwY1ELJr+mjCvyVegs1+j7/jZ3Bv2R5g/C+N6CCTjf7ipNJ7LWVZnJ9vtjOmnfyT
         cfjSsVGSYBwsgix7REBqGkAIVIVSJFNnuSX0NAfHlwY8lqfjJ8DXMGaAvyhix65Ck7lp
         5UIk3J6SZCNt4iBiPpVlJypKf4eXn9o1wt1q3yKcnfdj+pPMggSVWkAAcdN8Q52gedy1
         izFg==
X-Forwarded-Encrypted: i=1; AJvYcCWC9ZYIHlkOF7DHqstl5uKz1dQy0O0sQbiJYNsddKGntH1gzveZHNrUuFokRp5HTZr/gx+sbrKkwXtPwulm@vger.kernel.org
X-Gm-Message-State: AOJu0YzFPatBjGQIxNqFSI2TPkd0tQ+IX8uYDegBu988R7jSTJU4JcVv
	Lw/sVL0b3REUIsV8yzEpU3icd+KKqXUE+vUc86m/jBjoNwG56B0oxlfDnHkxaE5XZ3A=
X-Gm-Gg: ASbGncsSregX3tGmArRp4IiiuS6Hl9zfCfzTBcLznOVgabJBbaWxy2AdyqiwrXZgId1
	uidvB34X5kyjPGMdXZgjPyRXWEkUdulczzq0763VaxIa+jlHWMvBXmw5BMK7R3FwWkSVSni0Cwb
	3Pta/lOMm4t1TrMkWcibJg6uhyLzO7CkG6E0DOH/a3LyvzVGPgloBfXvlHzVhcx2+bgxbjdAF1a
	qXopjtlSS3KxaFHcMorNq2hjOWh0AkwZ0TdC/n2j2312T5sH99aMWgojGRYgKbY/iAqoN3pq9Rc
	5MjyPgrHp/ZUfeIdLimVTdJU2T2TuqXYZJV/l/cbFMJeF3Cbac8sJ1VoG76KpPf4GzwNIEc8Xp+
	jU5sYC6p+exsoYAZVY7IfH8vT7LA=
X-Google-Smtp-Source: AGHT+IEzGoAxSrX5B4bAAH+4miTpPGNl7GoNX7sspn9ukMqVx2E+rcl0sYAz9i1eJmygYV9ut9AlDg==
X-Received: by 2002:a05:600c:3f96:b0:453:a95:f07d with SMTP id 5b1f17b1804b1-45334a80815mr27028255e9.10.1749805902651;
        Fri, 13 Jun 2025 02:11:42 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e1838fasm45585435e9.38.2025.06.13.02.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:11:42 -0700 (PDT)
Message-ID: <91792283-8b61-42f8-b16d-e7f468325b42@linaro.org>
Date: Fri, 13 Jun 2025 10:11:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] media: qcom: camss: unconditionally set async
 notifier of subdevices
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <zBer3I3HLlZQo2k4k2sL3uFKCBxznED-ZHOnvQLXBVcNUBIy9DndjcOE1TxMSdb8Kkpj9xCmWGPpX9mdLHE-uA==@protonmail.internalid>
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

Degenerate is an odd word to use.
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
I'm a little concerned about changing the current flow. Have you tested 
this out without sensors attached, the TPG on rb5 for example ?

---
bod

