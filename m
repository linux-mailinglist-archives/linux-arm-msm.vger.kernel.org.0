Return-Path: <linux-arm-msm+bounces-25412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEEA929396
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 14:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8EAB1F21C1E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 12:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E3E4C62;
	Sat,  6 Jul 2024 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aaKOB4ok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA13412B17C
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jul 2024 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720269300; cv=none; b=rnXKDPEno6smePxXsZEb4Y9j2KMNDfQEczj4++UtSs8CjCj8m/VjvXFNzNVZESqAufsoytPfAaFOC5rfWMeN9GBiXABDjr5U0iF6CHgk8pVMPk/4D3adra337Whr08mvDi7v6Fd+YfjMWm6LRqDBdA7E7XyLBqYKfi5cMT/+4YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720269300; c=relaxed/simple;
	bh=N8qxiNxOzTF7l2a5E7y2OOw3RhrWWstM6g44ep0jE7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzNuvBXyhYNT7bd4jXifo2BnhRxIrk0gdoUqCvw9OGGsqySZNjK0Bgjufucw5q2VpL0yR0kJ4MUCd/Qptqllxa6DZjjXarrf192vsohb9DiYbTAtcTlpSZDM26ljlGELCMdm8kEIAL7ZGTW3fGRyeci6C9oNsij3/ds4oDQaMnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aaKOB4ok; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a77cbb5e987so168809366b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jul 2024 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720269297; x=1720874097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=08Kw+l4O9PQ6vVBW6VIbYgR+1zWbPaA4afAxHHCGvu4=;
        b=aaKOB4ok0OoKsU8nm6DjxpyPRa6o0BuAHfxi5u0w1Yjak8NNhXrQ+Ttq22bPZt5djd
         yf8jUZfNd4uE9/CrftsBvtpq1Mplq7GyRF6L+yIcCJkq/h3rLhz2lgkJDzC3TOJk1e9h
         LQvp3rhUrpa79I2kt/9+P/P6So81EHN1FXWR7snYMOG1xA9TxDsVCdHa4DKr9NPbH1Us
         pzdgEt3MlavKz7Mvh+0hTNrxKyiXtNitHxzh7/u4T8/duvTNs9NmeECV3ul6aBWwVexd
         zRTRuagHCSshhks3c6yNLQJGQG08HNgl2WLiIgwYQWVV4ow0YXYxyT+oU20oZY0g9ffx
         ZxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720269297; x=1720874097;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08Kw+l4O9PQ6vVBW6VIbYgR+1zWbPaA4afAxHHCGvu4=;
        b=RqpLomRA8QERLPpFYke1AcjUAU7nVMFPuoVEhrAHi8V8ra6zAfOJjeA0rnuCwCkNZD
         6APifsyQR8vG/DLSByA/Ffj8H5GHdjr/eSTRsx7U981TIFbrShzkigfaDAxnXpasiWtY
         KdVvQQqHl47xRWopDeA/4o4DgrLwtqUblPwMchV/7DffKZqelU5TMv+FG2a+iK8phbNW
         lQynetaKARtjTHAnN/Z0mUoTvciNK3etU40HeKqNDdGQk2qg5ptfKhjV9XsZhF2FhRu6
         CtgXlqgumwAWZ/GnGheiMjZ+aN/ruYnDC5wc4BFgS2pATs/9H23st7doWRbpC48zA6Yc
         47Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXric+/Q4iTGAUt3DhSyIFJNVmSLQ9gaq6/FwKAkeBWRL7OIu1oy9WCosjbVJVcDG55MUnf6bWULJx/is+tTjp76gj6m6UOV4vQP2ZfGg==
X-Gm-Message-State: AOJu0Yy9byU8KAmr0owKIQl1OuZ9YLYOtT2zO6m/G/RHgY8mrqsixVB6
	Aq9Iv90Xso4P4K69N+hEvNfyWatGQH8KRQreFSHGDsE6UnPDnFiqSrmnpWq4iSg=
X-Google-Smtp-Source: AGHT+IE9STNKNGTITDsmx9SEfaoEH9cr8oUJZP6k1jkdzI+oKS5bOvRwVpzbbyKMLhZyJ4dq0yK7Xw==
X-Received: by 2002:a17:906:c116:b0:a72:b361:41df with SMTP id a640c23a62f3a-a77ba72958amr530089566b.73.1720269297074;
        Sat, 06 Jul 2024 05:34:57 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77c3925a96sm177284766b.120.2024.07.06.05.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jul 2024 05:34:56 -0700 (PDT)
Message-ID: <d17ed113-9293-4286-ad75-4ce2c98e4d12@linaro.org>
Date: Sat, 6 Jul 2024 14:34:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Disable SS instances in parkmode for Gen-1 targets
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Baruch Siach <baruch@tkos.co.il>, Kathiravan T <quic_kathirav@quicinc.com>,
 Sivaprakash Murugesan <sivaprak@codeaurora.org>,
 Andy Gross <andy.gross@linaro.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd
 <swboyd@chromium.org>, Iskren Chernev <me@iskren.info>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_ppratap@quicinc.com, quic_jackp@quicinc.com
References: <20240704152848.3380602-1-quic_kriskura@quicinc.com>
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
In-Reply-To: <20240704152848.3380602-1-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4.07.2024 5:28 PM, Krishna Kurapati wrote:
> For targets that have only USB3 Gen-1 DWC3 controllers, it is recommended
> to disable SS instance in park mode to avoid HC died error when working
> in host mode in situations where the controller is stressed out:
> 
>  xhci-hcd.12.auto: xHCI host not responding to stop endpoint command
>  xhci-hcd.12.auto: xHCI host controller not responding, assume dead
>  xhci-hcd.12.auto: HC died; cleaning up

Thanks for looking into this!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

