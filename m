Return-Path: <linux-arm-msm+bounces-20182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BC98CBC46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 09:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C744281F41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 07:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADABB7BB15;
	Wed, 22 May 2024 07:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qI2eEKlg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BA5770E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 07:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716363970; cv=none; b=jYjkl7ptT6dez68Eos51HmCGWFqMDUB5lcPj0Lw5Z2bg/O1tMGkQKGnaiwXB6dQzUboJkDXdfc2UUhoRYNK00rui3ah5OGFU7x1o3ix9uhzXg132cXjDawOMzu/2FihY5rvrlkKx7YWgn0Yk4BRiB+HyrNN75ZlJow5LC548gvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716363970; c=relaxed/simple;
	bh=tLI1/TLS9lgL0S+7Aa/oJePgPCAr9RaWzgqRi5Nu1w0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Cfs60WGJkfXcoAFCDn17z7+LCJXOHh11/wlkhQQiuBpnYAiX+F3EpZ3+J1U6R0KkI5r0ZZKQtHk8O2POlhhwfJg3GAIgTJfopOvDVyTW2auLVULG2O7Tb3GJXW9ihPudkZj4IlChhuGyOJ4SJdwLoyZCzmNsdCf0UdsRNX/UaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qI2eEKlg; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-572669fd9f9so9829011a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 00:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716363967; x=1716968767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBM+jZUTYiUUTV5gkY6H6ON+yEQkLd9WRxTkpxE1iOk=;
        b=qI2eEKlgLOir2CtqKVILaIuM3bvkYcAT0IWtXUVOcix3V5MyGzpDFmNFfrrzdQDCjH
         RffvQbTr3nycZJS1snfg4lBHgLJGZLBfbD6BFZ7OL2UfSWN4LlnmpNc6NVAYRfzR7vtP
         AbiRzd5DDT4oBa5h4K1YimB3IrYIWt4Rf5Q3IrZvYCNSZbxEVjuRcPWEdeXKN+62qQND
         xzcn1QIfQtWpkIp4Or2rnXKThbCTmAKfI2x41oBFYjXsCtOOSzQR782vLnNSo9J/0tIf
         umNpRB0lt5hJ9QkyMFDR1UrWaD0QCRSr0euP5DB3JzwCCjt3eUPlerngmMuAVCqSOh6S
         cngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716363967; x=1716968767;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gBM+jZUTYiUUTV5gkY6H6ON+yEQkLd9WRxTkpxE1iOk=;
        b=CVrPW1OfAnlU80RRLUTKqHC06llUjXH1CjeW355A9/cqdZYc/a/mus6oxhG5Welky0
         6/KWlkU78PhqB5kOtRTZ2HSd5R8WSdyNsLV/tYOyPBSgu1FMZem5pwMgohBajYT0T2O+
         jpczENFi+zndDdrC/IIe65L/pbozIafnRJJzXZdLNMhMswPN28LKArcG3RKt2ofAFCfA
         4Dgoow0GxMnFH8TSrJqnpt5Kne2YQ5gdlaWk2Xh812u/r35syKWpE9VsHRRayoxPCGnS
         3ZP5oNaVyKi6SecUbYmujiUNJxzern3suJn1Qb8o/4eCKPo2/qnpTvz4wcCLHSdVbIr5
         5ndw==
X-Gm-Message-State: AOJu0YwmAkyNxNUH7ldToIx6OAx0dkcvtIjp0uyDbQOihXlz7knE7Idd
	jGRDw0whS1FPFFw0NHK1cU6QHiq0pv7XIH1IHy6nrPAp48e0oYw2p2xpY2vkazw=
X-Google-Smtp-Source: AGHT+IGZLSApaCXvQGxW0dsVfPo3k1iNOpL3wwK5gco9RO/JQwo8qJZoMUt8UyhYHnBdO5wDLTd9WQ==
X-Received: by 2002:a50:c355:0:b0:56c:5a12:ac53 with SMTP id 4fb4d7f45d1cf-57832bc92b0mr655224a12.24.1716363966909;
        Wed, 22 May 2024 00:46:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8b9d:52bd:4757:6b10? ([2a01:e0a:982:cbb0:8b9d:52bd:4757:6b10])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5751ada828esm6950621a12.62.2024.05.22.00.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 00:46:06 -0700 (PDT)
Message-ID: <0f784354-c5ca-4436-b5fd-b1744414bc3d@linaro.org>
Date: Wed, 22 May 2024 09:46:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] phy: qcom: qmp-pcie: restore compatibility with
 existing DTs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org
References: <20240521-fix-pcie-phy-compat-v1-0-8aa415b92308@linaro.org>
 <20240521-fix-pcie-phy-compat-v1-1-8aa415b92308@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240521-fix-pcie-phy-compat-v1-1-8aa415b92308@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/05/2024 22:30, Dmitry Baryshkov wrote:
> Existing device trees specify only a single clock-output-name for the
> PCIe PHYs. The function phy_aux_clk_register() expects a second entry in
> that property. When it doesn't find it, it returns an error, thus
> failing the probe of the PHY and thus breaking support for the
> corresponding PCIe host.
> 
> Follow the approach of the combo USB+DT PHY and generate the name for
> the AUX clocks instead of requiring it in DT.
> 
> Fixes: 583ca9ccfa80 ("phy: qcom: qmp-pcie: register second optional PHY AUX clock")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 6c796723c8f5..b4767b8cc014 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -3730,14 +3730,11 @@ static int phy_aux_clk_register(struct qmp_pcie *qmp, struct device_node *np)
>   {
>   	struct clk_fixed_rate *fixed = &qmp->aux_clk_fixed;
>   	struct clk_init_data init = { };
> -	int ret;
> +	char name[64];
>   
> -	ret = of_property_read_string_index(np, "clock-output-names", 1, &init.name);
> -	if (ret) {
> -		dev_err(qmp->dev, "%pOFn: No clock-output-names index 1\n", np);
> -		return ret;
> -	}
> +	snprintf(name, sizeof(name), "%s::pipe_aux_clk", dev_name(qmp->dev));

Should be "::phy_aux_clk"

>   
> +	init.name = name;
>   	init.ops = &clk_fixed_rate_ops;
>   
>   	fixed->fixed_rate = qmp->cfg->aux_clock_rate;
> 

With that:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

