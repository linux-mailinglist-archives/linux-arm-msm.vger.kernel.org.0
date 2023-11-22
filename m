Return-Path: <linux-arm-msm+bounces-1580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BCD7F5107
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 21:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8A55B20CC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 20:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDBA5AB8B;
	Wed, 22 Nov 2023 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DsZxie95"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ADCB1B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 12:02:02 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50aabfa1b75so115623e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 12:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700683320; x=1701288120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=djatJ3Vp6RvGD0vpR/bYiaNyQS4CYn4DKmm7Wr4Zamk=;
        b=DsZxie95JgqIfP2k3qlKyrWeYeKjE64mDmdxovLJJmBV/uRO2AINwuQGwx7O6v7Zp7
         jfY4b+sqrRv16GBQj8LpeUL7pjJYcuewllWNpNdkmqOyr9bOOktX7qR+oHq3u6ROvQ7i
         9dJhe/7aFclWs0/+9NxKiPahgquPtNCtFTZQixn9BiLr5M4Sr3EAwZiG7ujQwSnRRjZK
         Eacxhd0JLRvvJ4dfMw6J1YfbpPmNW9F20WZk5tt3uSWf2OUQpf051gReYWdYGPkKm93F
         SVVBlr5El9R+nEcWNXSWcIbHqH+Y68Q5JT5Y/Xdszi2N2WB6jmsqYkpeKiIQAf4D0Jtu
         f9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683320; x=1701288120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djatJ3Vp6RvGD0vpR/bYiaNyQS4CYn4DKmm7Wr4Zamk=;
        b=H7M+NNJOk5SjseUAjJLcYsVyRzgklyFILh4ZOYwEnxlK83RbSgdM3EN5vLG9IHx/30
         KrHQwk8ovN7aqGDEXQbuaGF82pGvgLr+zHlIMU5+muQ/XwbwB6dBbz3I4yxpBfyjtgRX
         FOs5Yjo8/U4NsZN8XfSeiruRx4T/r6DxhJkYBCj7/SHnNuT/JPJ8F53LqANA0WKq4CnP
         GFml1yyhAgH15y3vVfn0zgKtNkm6xh/X6bY+blCwW+m4K57nA1M3tzUJ4F7g0jAS+tRr
         8Yx1Ax271Mo7n7JPe6ZBOY650ChmkzlgfS/hYnNhEd17UkQwj8RcnDLEKsI5TjczZQJN
         uTQQ==
X-Gm-Message-State: AOJu0Yz3jn6uKV1lySgKv6YmnSN58wG1jPnQg+pQ/4lHT6PLUR4nGMfS
	/miv8CAfOcOoYCZ/TSLVCjGggA==
X-Google-Smtp-Source: AGHT+IFevzid6Jw5jIixd6QvffRaZvAlI+flmP98ng7vE52jllr/Edj4c+9Juh477ucTouU+k0Z8BA==
X-Received: by 2002:ac2:5159:0:b0:507:a9e1:5a3b with SMTP id q25-20020ac25159000000b00507a9e15a3bmr2427941lfd.0.1700683320345;
        Wed, 22 Nov 2023 12:02:00 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u19-20020a05651220d300b0050300e013f3sm1935876lfr.254.2023.11.22.12.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 12:02:00 -0800 (PST)
Message-ID: <9710258c-3419-41f2-9b30-f818b031ae5f@linaro.org>
Date: Wed, 22 Nov 2023 21:01:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/4] clk: qcom: videocc-sm8150: Add runtime PM support
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20231118123944.2202630-1-quic_skakitap@quicinc.com>
 <20231118123944.2202630-5-quic_skakitap@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231118123944.2202630-5-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/18/23 13:39, Satya Priya Kakitapalli wrote:
> Add runtime PM support to ensure the supply rails are enabled
> when necessary.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
> Changes since v1:
>   - None.
> 
>   drivers/clk/qcom/videocc-sm8150.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
> index 52a9a453a143..b57df5ff96c4 100644
> --- a/drivers/clk/qcom/videocc-sm8150.c
> +++ b/drivers/clk/qcom/videocc-sm8150.c
> @@ -6,6 +6,7 @@
>   #include <linux/clk-provider.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/regmap.h>
>   
>   #include <dt-bindings/clock/qcom,videocc-sm8150.h>
> @@ -240,17 +241,32 @@ MODULE_DEVICE_TABLE(of, video_cc_sm8150_match_table);
>   static int video_cc_sm8150_probe(struct platform_device *pdev)
>   {
>   	struct regmap *regmap;
> +	int ret;
> +
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret)
> +		return ret;
>   
>   	regmap = qcom_cc_map(pdev, &video_cc_sm8150_desc);
> -	if (IS_ERR(regmap))
> +	if (IS_ERR(regmap)) {
> +		pm_runtime_put(&pdev->dev);
Shouldn't this be _sync?

Konrad

