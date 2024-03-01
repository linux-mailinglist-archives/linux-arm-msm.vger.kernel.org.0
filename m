Return-Path: <linux-arm-msm+bounces-13129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E4C86ED1E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Mar 2024 00:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B7492871F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 23:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2995F473;
	Fri,  1 Mar 2024 23:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IbgGIMwN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453CD5EE9D
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Mar 2024 23:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709337542; cv=none; b=HvgsmGK09eIRRNMuw87CGJ33IWn6numURkRWLee0TWaQuaY+dBWmB/EukbTB0aDPkAlyryc+dktkP6yzvKwu34dBB/ZnTT/RsUT/rpVfz6dzrnuUKy7V8whr0eUAFKxgYrQsbaIQCR3Pm0QVwMR9M4ARpDIW81+PjPZ+oN7Y34U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709337542; c=relaxed/simple;
	bh=ETU0ZgkCoYAe6Z7VTDx08sZijKjkIDe8qT9lyHO3Dps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eC41fDgp+FUrtYRtGuA3/2qn08iGUnLh69NIav4hIs6NOQEbMGtZzBgcmGGGzOfj/cOJxT0w3jiY2t/f6eXg+47MDmSZmawaaSFjbt7ZDflYJJlqmN4p8YgjpzLPz0zqurIVwd7y2vbnAHMMszEo2A85bf0eXcMcybDcWES4Axw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IbgGIMwN; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso3616737a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Mar 2024 15:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709337540; x=1709942340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YA1O7kLB3C42ZIvzHJ983LhvtPhH5S4z7eGI8/yXF6Y=;
        b=IbgGIMwNcfgw0Lpo/e5WIMtirGrC9J1p/5aPwI3PheLI52g9v17NjgFtxDuYR5ot3H
         W6QPhcbm0eAb13IGZ/bnDIaIN/sdWHJk7LtFGe0AZHkgRt5vUgBRX1lYXTh+CNS4rCPx
         G+ZA2VKPNRzfRh6LIjPdnEfUYy9cfoLdHOSn0A1VRrrHIeSyeA0epWPHuVbdfLczDMY5
         BfhWuqWVCpWCMdTXgzPN48GbVhq6TOmtptQNeSzmdl6VdFnFOzjiTU//pDf5NrG4O1va
         XhVe4H53VTZgHYfGz40yDcwJHQfmM0Y1vZOZRijqH7tVMba45/KLvyC2JSzNVzx+M1SJ
         E+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709337540; x=1709942340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YA1O7kLB3C42ZIvzHJ983LhvtPhH5S4z7eGI8/yXF6Y=;
        b=t8lcQcVHYTfEnqHpCCXmZPT9al96mJPXdjR48JppJYL8EJbMxria54BcuXawa25xOn
         N6FyN4/Ct6EonMMOtSk3rnqMdT0eUIaLiyqhc4CF2aWqVobAi8xlIFWnCGbBiDPORnZO
         TW/Wf1MJ/rmIu0UsG53G6zCOH3L+u3+kfSEQCkCn84ZNNgaRUvNtUdBz/9LODXCxej/n
         Y4AJ4+GCGee484sPe8Rau4JLS2OgwGNukRPOHOwFofKXrp5zYgtSYdmrpjzevmamJ+k9
         ombZsW7vxkTWLWf7MGaFN49HNVTag5/Pv2F7ObvkKJ/bCwvRy8yLR6C2RoxsAUXfxP5U
         HN4A==
X-Gm-Message-State: AOJu0YxMwI/knlLUVcAkxErjS2qhqLFMPpOdR+gyTKBRoWsYSvhU01l3
	YsTczZxaud6GX+TpVYpBzWeSmkKdv2+hxSQKjg6uQh3HE9XcEiLm0GoW3fTOvm0=
X-Google-Smtp-Source: AGHT+IHwnfAnGr5O8kASzxqPfzRoY7ABHUTooFv/fIASs/MHqBMyWJpUwEDEXapcV/UhGZL43xXDXQ==
X-Received: by 2002:a17:906:f194:b0:a3e:9231:fe7e with SMTP id gs20-20020a170906f19400b00a3e9231fe7emr2440937ejb.71.1709337539658;
        Fri, 01 Mar 2024 15:58:59 -0800 (PST)
Received: from [192.168.216.32] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id w23-20020a170906131700b00a432f3bc3a5sm2157029ejb.76.2024.03.01.15.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 15:58:59 -0800 (PST)
Message-ID: <2f6a5c83-69a4-480b-a235-c0d51feac31e@linaro.org>
Date: Sat, 2 Mar 2024 00:58:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8250-xiaomi-elish: add usb pd
 negotiation support
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240227124529.12926-1-lujianhua000@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <20240227124529.12926-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.02.2024 13:45, Jianhua Lu wrote:
> Add usb pd negotiation, but charging is controlled by pm8150b pmic,
> so it can only charge battery with 5W,
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> index 6f54f50a70b0..ed103b90f4e6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> @@ -636,7 +636,8 @@ &pm8150b_typec {
>  	connector {
>  		compatible = "usb-c-connector";
>  
> -		power-role = "source";
> +		op-sink-microwatt = <10000000>;

Is 10W really the minimum value for this tablet to function as a sink?

Is that what the downstream kernel sets?

> +		power-role = "dual";
>  		data-role = "dual";
>  		self-powered;
>  
> @@ -645,6 +646,12 @@ PDO_FIXED_DUAL_ROLE |
>  					 PDO_FIXED_USB_COMM |
>  					 PDO_FIXED_DATA_SWAP)>;
>  
> +		sink-pdos = <PDO_FIXED(5000, 3000,
> +					 PDO_FIXED_DUAL_ROLE |

Please align the PDO_.. against the open brace

> +					 PDO_FIXED_USB_COMM |
> +					 PDO_FIXED_DATA_SWAP)
> +					 PDO_VAR(5000, 12000, 5000)>;

60W max? This is not unheard of, but I'm just making sure you know..

Konrad


