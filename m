Return-Path: <linux-arm-msm+bounces-26335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 924B1932642
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 14:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B615C1C22CB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 12:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8534119A290;
	Tue, 16 Jul 2024 12:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="koNq9oN+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B762B198857
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721131794; cv=none; b=sg066a6OJaYT0dPe+BdL6XFIP5mloxZVy8U8hu6Q1w9wU86pSQBvmJJwjRfsNTRy5U9DY0MZcpy+Oyd1lbwLAwUQBYiXN2ZECsn/51R3Oktc8dZa4iPWGwaea/RH4CJ2Q1NxHALYL6xvNR4ikzIC/YEDGN10u5aRcotaokPV3lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721131794; c=relaxed/simple;
	bh=BNL9xfmru+xlaynuTe3brre09ZofiAu+ZGUkIKuel9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVmVt91J7rtwEnxhDIIwkNZh2z7iNX9GxGVbn7bbNp+9+mpFjCPhUhlIRz0Mv0sSArEKdYyBd66mM+StCA7X73XkikN5aWhbfdS+0m0TMQhmRwMxQA/ItEuu+PmgESQZ15Ax9QNgPryop7W2GO6J6/Ba0um1htTE4IJdvNymtK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=koNq9oN+; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ea5dc3c79so7602902e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 05:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721131791; x=1721736591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XJwiace0C0RrXaVWU9MXxXzi/aJ9SZxUn71Vk4+fUAc=;
        b=koNq9oN+i+rV2Sq/Wi2RNN8PVI/xggjv9mCnGyQsFEakBVOEIDO/FVcmy4AEBpIqLj
         pQ9KiETovi9MEOiiBmRMdGyk+ivasnWyHvFhCeKkai13k3EUpIh7i5wkznz1PBmP3eW9
         GC7OkHt8LqciX5Mp1mG2CX3sXwoUez5mHpdh6dkD/aHUaETeqEK+pU3GDT1Dzp8qylCV
         6WyAmEO93/Sxrq/AIz7Evti4XCM/T0MTR+Wvj1P25j67h89Kjw5GCFs4UuZ4CTzbcZHi
         UA/N+LXZyiioyxGdY9BuWW++NOzm1NttD1o0Wv92ac/VS8/TLER2hpwt8biibdDl07+Q
         dVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721131791; x=1721736591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJwiace0C0RrXaVWU9MXxXzi/aJ9SZxUn71Vk4+fUAc=;
        b=oO73hJAVxLAiELtS/t54hHmp4EmFqiAfLePILCcvxfNHVcScYar8dpN/DvwGiK1YhS
         Pa1cRN46tDH54yk+OieWFS7TMk08soO7q3Y8NEXVyvLdB3i0evADOMiKfQCRVgJpfv0H
         YPDz9wnAyRSNGcRnn+INF7QasYGr0hVlStw07K2d/33JNn05DesY5/Q3AzZ0r55wBzry
         ghlFLSyavotPeZlgYO/hF3sJTSS9f16egDTkMGA85k1sSeR6WCAJRIlfy+rjxyoy5Tc5
         BsruCbD4CiYoM8wgChJVAihRXsqDcYDajA93mPcNceC5BH/DJsyeXyJhORmJm7DNEwwm
         Wdig==
X-Gm-Message-State: AOJu0YzG1UuDBNs+/upgXuOVY8H0XW7I9lC1bLDDYoYjJo4XJT+/nzfP
	xq23B+eaV+XCZBxrueyQUD8+UvCIbAp+F+KpEsJWbomV0O3jm/xmXGSh25USzF8=
X-Google-Smtp-Source: AGHT+IG7C1TNMx7NHCUMXnw1EqOzzElmA0hmzDn0ZdPsWYCJ5cp/cC80KMfLd3HFmNCQdoUmzHUZqg==
X-Received: by 2002:a05:6512:b24:b0:52b:8ef7:bf1f with SMTP id 2adb3069b0e04-52edef1ee77mr1157682e87.17.1721131790554;
        Tue, 16 Jul 2024 05:09:50 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5a359asm311005166b.19.2024.07.16.05.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 05:09:49 -0700 (PDT)
Message-ID: <12be3f5a-5bc6-40cc-a7af-7f098a7be04e@linaro.org>
Date: Tue, 16 Jul 2024 14:09:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: Add support for multimedia clock
 controllers
To: Krzysztof Kozlowski <krzk@kernel.org>, Taniya Das
 <quic_tdas@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_imrashai@quicinc.com, quic_jkona@quicinc.com
References: <20240715-sa8775p-mm-v3-v1-0-badaf35ed670@quicinc.com>
 <20240715-sa8775p-mm-v3-v1-7-badaf35ed670@quicinc.com>
 <d40d540c-a3b9-449d-8f34-cb2972ddc2ef@kernel.org>
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
In-Reply-To: <d40d540c-a3b9-449d-8f34-cb2972ddc2ef@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2024 9:45 AM, Krzysztof Kozlowski wrote:
> On 15/07/2024 10:23, Taniya Das wrote:
>> Add support for video, camera, display0 and display1 clock
>> controllers on SA8775P platform.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 56 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index 23f1b2e5e624..8fd68a8aa916 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -2911,6 +2911,47 @@ llcc: system-cache-controller@9200000 {
>>  			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>>  		};
>>  
>> +		videocc: clock-controller@abf0000 {
>> +			compatible = "qcom,sa8775p-videocc";
>> +			reg = <0x0 0x0abf0000 0x0 0x10000>;
>> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
>> +				 <&sleep_clk>;
>> +			power-domains = <&rpmhpd SA8775P_MMCX>;
> 
> Not sure if these are correct. I had impression the clocks are going
> away from sa8775p?

Right, the patches look mostly good, but are still going to be on hold
until the 8775 situation is cleared out.. We recently had the gigantic
patchset [1] that shifted things around, and seemingly there was rather
little closure on that, so we're waiting for the dust to settle and
people to agree on things..

Konrad

[1] https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

