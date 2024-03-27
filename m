Return-Path: <linux-arm-msm+bounces-15413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB44688EC6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 18:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6031C29F984
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 17:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89F014E2D3;
	Wed, 27 Mar 2024 17:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ceIN2Pv7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A1414E2EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 17:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711559983; cv=none; b=Zx5H2doDqrzMi2/Td8kCLLrViqXxDL6zMaF1SU7u+/TSaZ6Z33+axd6y95ztA/aMkj0uAm1CtGfmy0IF9hdwzTKn0AQRz1CKPCJIo4u6RI+cjc0LnZ2WxnLdE1kJLFsQVSydlViLNMHcN9PSk1vEDnGiyj6LrsZR1o1JJKeX9xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711559983; c=relaxed/simple;
	bh=EACyQ0dCN1p5NBiTEuE07Oir5iuNHSD9x/x2VQSMiYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOYZ9Y+P9VUHWtZmbPfAWdD1GYgW735Hojk5Yy73CXvQQNa+H6Z1nS6C7FbuVKONuk8bhB9ec+G+epmTDwUckPqWYgAsNhweodUFDh6oZw4V93Y0ArUJXLkxttxx9bjETyUKD1HwSYF+FdpQXznFT9YgarJ7R0/ox3fCv3l4bFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ceIN2Pv7; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56c441e66a5so96379a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 10:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711559980; x=1712164780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kQtgzA5CXrcP9fG7SMoOjnla5ydIx1T+KyWoBJs/UBI=;
        b=ceIN2Pv7P3Czgt1c3nGVfnNNwXgml1Sc0HABaCjSEUa5qA7fRtUTYsbEAJ2gRevM+8
         +ZobNtmrs/hsjxNeAOBBWK0rf2ONwRZkSioBKWWg9jCWR7J1YZdH6Ejxa3+nsjllFGOT
         RwMh7g8uOwgE+QcIxFbAAIyC6by3MzzC1cwfQyXA+sTDi3WwvT+f3LdFSAMpbywf+ndK
         /2cp7PKQJfc1jajXl/62xOWv072nfhHAmbcPU7xaIq2MoKNaX9xoXyC8GPdGSlx/B4HG
         8PDvmZrOmZ+YrEhS2D7d4/FrTTi6FTivxyQXUdb9tlKP7QytaBZzyhejfdBqpIaqblYX
         fRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711559980; x=1712164780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQtgzA5CXrcP9fG7SMoOjnla5ydIx1T+KyWoBJs/UBI=;
        b=lmoVEpbY15j+cFdMKCph2udWUr/514i1qGxeKgF1TDKfvTmPPCyAjvpa8r7PHI6twN
         JqZgmch0TA4+6lvSQ8WLKsLRxzcRnNfTidNCpl1KECh46kJqJJ7quhUbsIisaxilj5g9
         nEVYgEgaCq+P0aI5hOTOC++/0fOABUv+z8lNiMbC5Oi6zZtUebKM1HM+ccuBtDdJ+kRl
         G9XWDbGKMBRJoF6ph+/croxKtuJGLINz1YiBcoXBIxYE+x/CWo2eyqE3ddufVomdhzCt
         orQDJv95aai0h2rNXBDFMkMrgPvn/KOKHIG3Nd02R23TLQEbwQV7pYxYnGksXUdpJldi
         U+Rw==
X-Gm-Message-State: AOJu0YxibpZkYJKGCkJPBQ6ZgrTB3cU3bmXvt4p+//7M5xxJsZVjkJb6
	buTwPCtVxOhwyoTO1Oby/o3SGKJPZHzx7mZyJO5n6Z3BKNaWV1lau8Y5MytrhS4=
X-Google-Smtp-Source: AGHT+IEZXjMNpIU2AYuz4S9ZE4vfAo0A6M9d+eYLiCGrnPbrhVwWQ3VS40d1kNVmTGM7HbBQFro7bQ==
X-Received: by 2002:a50:ba8c:0:b0:566:13a2:3008 with SMTP id x12-20020a50ba8c000000b0056613a23008mr350991ede.6.1711559979994;
        Wed, 27 Mar 2024 10:19:39 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id o22-20020aa7dd56000000b0056c07b6924csm4517254edw.41.2024.03.27.10.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 10:19:39 -0700 (PDT)
Message-ID: <85ee1029-39df-472f-81cb-518c2191fe2b@linaro.org>
Date: Wed, 27 Mar 2024 18:19:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: clk-alpha-pll: fix rate setting for Stromer
 PLLs
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan R <quic_srichara@quicinc.com>,
 Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240326-alpha-pll-fix-stromer-set-rate-v2-1-48ae83af71c8@gmail.com>
 <87af7b7e-9c2f-41e1-af97-01d3f29f5970@linaro.org>
 <d81eb0dd-f1ee-4a54-aa04-9ebe8b8eff88@gmail.com>
Content-Language: en-US
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
In-Reply-To: <d81eb0dd-f1ee-4a54-aa04-9ebe8b8eff88@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.03.2024 11:16 PM, Gabor Juhos wrote:
> 2024. 03. 26. 21:51 keltezéssel, Konrad Dybcio írta:
> 
> ...
>>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>>> index 8a412ef47e163..8e98198d4b4b6 100644
>>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>>> @@ -2490,6 +2490,10 @@ static int clk_alpha_pll_stromer_set_rate(struct clk_hw *hw, unsigned long rate,
>>>  	rate = alpha_pll_round_rate(rate, prate, &l, &a, ALPHA_REG_BITWIDTH);
>>>  
>>>  	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>>> +
>>> +	if (ALPHA_REG_BITWIDTH > ALPHA_BITWIDTH)
>>> +		a <<= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
>>
>> Uh.. that's not right, this is comparing two constants
>>
>> Did you mean to use pll_alpha_width()?
> 
> No, not in this patch at least.
> 
> The clk_alpha_pll_stromer_set_rate() function assumes that the alpha register is
> 40 bits wide, and currently it does not use pll_alpha_width() at all.
> Originally, I have converted the function to use it, but that made the change
> unnecessarily complex since it was a mix of a fix and of a rework.
> 
> The current patch is a simplified version of that, but i forgot to drop the
> comparison at the end of the process.
> 
> In order to keep this fix as simple as possible and backportable to stable
> kernels, I would rather remove the comparison to reduce the change to a
> single-line addition. Then modifying the code to use pll_alpha_width() can be
> done in a separate change.

Sounds good

Konrad

