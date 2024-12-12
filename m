Return-Path: <linux-arm-msm+bounces-41824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB039EFB0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2B0918827A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4216D223C79;
	Thu, 12 Dec 2024 18:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WA2Du/js"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E454218594
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028505; cv=none; b=mIBJC3P8/EcUrREJplJIFyI+zxdEvQaLl0oOFE6QH0JicjW/eyLuMgELuNFK+ANKLZ/63bv++1vw+q7E9K9EnidHjp1nv8K/X1LnjTVZ+np6p4cnw8kqVzQByOvY0FvTwx2QxbbCh87gOO7ZrFP5P9tsDIkFslJO7r7Fpf/F7UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028505; c=relaxed/simple;
	bh=SeIAm+lZ2yOlHpZcR3VFAU3156D2ZaJCh011sYSMRuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uo3hX9b43yD4cCamUbjKDuLfKzIt1Zzq2k7IptFWVkZdeYCfD4Cm1h40zdmmjfm7gB72V+f90fXlzpo3464uJ8JKpjVCvKieNQ1GpLYqCNXOMzF20H2/ONXX0KDabiI9EdMm4ecvISLAV6gOQYa9VhBHijIOywNR6MeHxBqGUGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WA2Du/js; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54019dfd772so135578e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734028501; x=1734633301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6jLloTkAIqpAn2QEcEftcJWKOiGXTO1BOvV7Fm46HeA=;
        b=WA2Du/jsY+o2TaZqof5Hkr97YkQKfe6MyWpQ82XrmnBHd+0S0ttkE3T4WJZeP2+38c
         HPlrz/3gsXy7WPnI2RiUAvgP29GeromcBAoHjiG5OYlW8E+f/osrSwhWHL8426vmnVRo
         mW7jGoutorglVVksZyyqEEKhlcOt9AS/8/67M7aIHnDWGqwuDamu4xTwICLPuBpx7px9
         g26DVN0tcY2qbk028LenMQn4S2Duob0iIqbpMV9eaQNl9fKGM8fLTc3ENRskjbzxyp8G
         9e3/3+wW/ykJUEGS23G2ivsb3YRImlPqBMgEEreTFlxy3XlgbpxEYmWJ919CORLlZY4D
         FQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028501; x=1734633301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6jLloTkAIqpAn2QEcEftcJWKOiGXTO1BOvV7Fm46HeA=;
        b=DE3Tb1eTYfyKc5IV5J//VCzYVcvk6UEkdr8ccJYADoHaz03fE8CKwghgj+W/qVkXRW
         MdAIQiaB1XmkmwPndqOtBw3fMIIkY/YvbJWIog13VoTpc6cd5TZeLYwMNKTMJlAe7chw
         TEDeTkZCdeEWHXdnq+V4dM73jUrNIJ34LGzCS1cEP/zdjzFfi42AmtuU6zTtGscFwIJx
         7G5t30MbI0x8XZOoXdOMlWGlAjXCzJjRvBtoVBDbztbaMKZkHrItZ7AOc8TxiqbXBAEp
         O6Nk0hs7adKdgiXyplJqFekbdHRCuOB8j59abFWWvyx62OA8OgB8s4HiXZ6Uh0zL0OS9
         9e+w==
X-Forwarded-Encrypted: i=1; AJvYcCUCbDybVEIPlRt+cb3M4QOz3Uern4ozQC52LLYy9jT1PQTlk/EsMXSOfV4IrqeyEu4r5a8ORjH8Y+9Nmzm5@vger.kernel.org
X-Gm-Message-State: AOJu0YyWvoePLpdXmMX4Wlo4PRbJXbeMC+//HxYSxz3I1fktKM8PXxfY
	9JAdeCP+e4jANyDR1ZOcmkrxS+vhO2W+2nxUhv76v/G+yuFIMvSem1Hio6tfQpiJqGFWaZzDUqn
	M
X-Gm-Gg: ASbGncvrWg69Po9WJHyAFiXCzpBhe1zjMUlCDx7BFp5TWpcFX84AKrUlas71IBsrRjB
	vkX+OUmGaGxwTlksr77dt5rdOsy6aYPiwesDfq7NMmCO5Yan+dU751FBvBClNcFuLQqdjjvBshT
	uv/HuL3rXb3gsVeTH2daVHUpbNVicCgezTCebst+11hrKVNpiQ6eu2cmfZV26tByexhrxelzQAG
	kksMn1HxYASzPFM37+CqjqbVoAJFTpw4BHD83yMYlsfd1pGec7/zWC8H1MgxKKW6QZKUjlAhD5F
	t17Io7qooVliVd7msVREI2PcE4nuM7/hZNE=
X-Google-Smtp-Source: AGHT+IE2ocauVfm8XXiFjr4T+1nEbJ4gNzDYCuilLYc/huPuG5NlGDRbLG6NiLujBuzRSXAGzjoNDw==
X-Received: by 2002:a05:6512:3195:b0:53e:fa8b:821e with SMTP id 2adb3069b0e04-5403412c712mr174340e87.9.1734028501312;
        Thu, 12 Dec 2024 10:35:01 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e38c31b0fsm1973118e87.277.2024.12.12.10.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:35:00 -0800 (PST)
Message-ID: <4353688e-61f8-4a45-b35f-c297575769e3@linaro.org>
Date: Thu, 12 Dec 2024 20:34:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] i2c: qcom-geni: Use dev_err_probe in the probe
 function
Content-Language: ru-RU
To: Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
References: <20241212135416.244504-1-andi.shyti@kernel.org>
 <20241212135416.244504-2-andi.shyti@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241212135416.244504-2-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/24 15:54, Andi Shyti wrote:
> Replace classical dev_err with dev_err_probe in the probe
> function for better error reporting. Also, use dev_err_probe in
> cases where the error number is clear (e.g., -EIO or -EINVAL) to
> maintain consistency.
> 
> Additionally, remove redundant logging to simplify the code.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 33 +++++++++++++-----------------
>   1 file changed, 14 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 7a22e1f46e60..01db24188e29 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -823,11 +823,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   		return gi2c->irq;
>   
>   	ret = geni_i2c_clk_map_idx(gi2c);
> -	if (ret) {
> -		dev_err(dev, "Invalid clk frequency %d Hz: %d\n",
> -			gi2c->clk_freq_out, ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Invalid clk frequency %d Hz\n",
> +				     gi2c->clk_freq_out);
>   
>   	gi2c->adap.algo = &geni_i2c_algo;
>   	init_completion(&gi2c->done);
> @@ -837,11 +835,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	/* Keep interrupts disabled initially to allow for low-power modes */
>   	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
>   			       dev_name(dev), gi2c);
> -	if (ret) {
> -		dev_err(dev, "Request_irq failed:%d: err:%d\n",
> -			gi2c->irq, ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Request_irq failed: %d\n", gi2c->irq);
> +
>   	i2c_set_adapdata(&gi2c->adap, gi2c);
>   	gi2c->adap.dev.parent = dev;
>   	gi2c->adap.dev.of_node = dev->of_node;
> @@ -870,16 +867,14 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   
>   	ret = geni_se_resources_on(&gi2c->se);
>   	if (ret) {
> -		dev_err(dev, "Error turning on resources %d\n", ret);
>   		clk_disable_unprepare(gi2c->core_clk);
> -		return ret;
> +		return dev_err_probe(dev, ret, "Error turning on resources\n");
>   	}
>   	proto = geni_se_read_proto(&gi2c->se);
>   	if (proto != GENI_SE_I2C) {
> -		dev_err(dev, "Invalid proto %d\n", proto);
>   		geni_se_resources_off(&gi2c->se);
>   		clk_disable_unprepare(gi2c->core_clk);
> -		return -ENXIO;
> +		return dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
>   	}
>   
>   	if (desc && desc->no_dma_support)
> @@ -894,7 +889,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   		if (ret) {
>   			geni_se_resources_off(&gi2c->se);
>   			clk_disable_unprepare(gi2c->core_clk);
> -			return dev_err_probe(dev, ret, "Failed to setup GPI DMA mode\n");
> +			return ret;

I believe the removal is intentional, since setup_gpi_dma() reports better messages.

>   		}
>   
>   		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
> @@ -907,10 +902,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   			tx_depth = desc->tx_fifo_depth;
>   
>   		if (!tx_depth) {
> -			dev_err(dev, "Invalid TX FIFO depth\n");
>   			geni_se_resources_off(&gi2c->se);
>   			clk_disable_unprepare(gi2c->core_clk);
> -			return -EINVAL;
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid TX FIFO depth\n");
>   		}
>   
>   		gi2c->tx_wm = tx_depth - 1;
> @@ -924,7 +919,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	clk_disable_unprepare(gi2c->core_clk);
>   	ret = geni_se_resources_off(&gi2c->se);
>   	if (ret) {
> -		dev_err(dev, "Error turning off resources %d\n", ret);
> +		dev_err_probe(dev, ret, "Error turning off resources\n");
>   		goto err_dma;
>   	}
>   
> @@ -940,7 +935,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   
>   	ret = i2c_add_adapter(&gi2c->adap);
>   	if (ret) {
> -		dev_err(dev, "Error adding i2c adapter %d\n", ret);
> +		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
>   		pm_runtime_disable(gi2c->se.dev);
>   		goto err_dma;
>   	}

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

