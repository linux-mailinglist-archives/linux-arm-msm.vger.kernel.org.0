Return-Path: <linux-arm-msm+bounces-7767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA9D836025
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 11:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C8601F21B6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 10:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7289E3B19D;
	Mon, 22 Jan 2024 10:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="feMF+B0k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC483AC16
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 10:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705920820; cv=none; b=sukHMEXK/tct+VIDyuWGgA+h26mLeWSEJq6BFbPQ+gIPox6Ad40ILccNA+OBJx3zIxi//tV2WVTjw3wsLunLwMaea2T78Oz6ulnGZacqpMOl0namsR4SBT6w/0hGYSiXwZzUPk/McC8uzP0HinxfCYf4MWQBptqs/uX2+dQmxlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705920820; c=relaxed/simple;
	bh=HvqtdsUNHvvysDTN07Znf26i8cKDghYMJxajcRlaWck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CUgQUE6AEDqjBioy/gcg7iJWtpAEml2LzVDom/xKeN3wJvnZ/d76mitpr0E6Bh0AOL2rZCsNJ/kgxu8Uzs60Mx5KGiZNMhHDLxnlthwnGF7dsl6ipZZXSEPO+Mk8vAMyV69sXYPhj89WGfIn8DrHbiNHPF0FEBsmGmJcgKew+eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=feMF+B0k; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a27733ae1dfso306425466b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 02:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705920816; x=1706525616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+PzbzDTvNuVALaQbY0SrUthp/gsyxFLfouvwcaglfa0=;
        b=feMF+B0kR7RoHRvVJ8mp/PAkzWu0JRf8c5yqvNyQgRR0FTxdRhxdrQJJCa/+AdHERr
         lYRFUzTPKxUWHUfqg824fAfScNiWpTL3xKTZ9mT7GeCiUq4pJxW3vNX28HkeL8N8R+ZN
         imimCMeZM7KeFCorNAD4L72umVKRj63SUGLlodevoSq2t0kU9aHsO5jVT2W7uJlzPXEe
         i5EHw6TQx+McZ5VOZjp4q5UmyoJuw4TcSEhfAuCjjOjqZGeIstCT76pU1Xw8HkAgai0P
         L1kltpiMoyTCXXHBOtdrYQISn7Ajt7BijVvSSUSj9OBIlfiHJyGmf9D4bZwDL2tPh1S0
         Ld6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705920816; x=1706525616;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PzbzDTvNuVALaQbY0SrUthp/gsyxFLfouvwcaglfa0=;
        b=V4snWKxcj7ZhmkTm6z0zFl/U1eOk83BVnBil+XGqSTS3gpv7wyQhb+CMUSuEaYNzSm
         NwAupqM8KmNkZ2E9kbm4l8bwkltIrXelD56X2ektuJsGj5QY7B/Gac+nU6zBmyCUIvG9
         JAU2cuV766sAam/wivgBv5mRvz4xSJqHFDsbhADgEfERkMlG37Tpnmej99VKY1QlJ9G3
         JxnzouYGxP6o4gpV1cm/IeixVV17NqVCfT3+ZwuKTSefNNwZ4/M7lpK4M7rolfkE8yiq
         7WUNX/ntM9ClR8bT2bT9Z7V66vfPMcl4nluwI1iDgAQ2hUXSXJHTAZY9+2e6+Yc5fv0w
         SFLw==
X-Gm-Message-State: AOJu0YxLFiMSDZtUeWLKdoAsN5yFSWlDaEin9YxIzAEUGHT5/v8Zkx3h
	P5jFOEIKqJyBPy0auRRimUpTsZJJy0InaSscTxc8Zw3rjj4Oqxa78e5Tgl1qS0g=
X-Google-Smtp-Source: AGHT+IGVVH6NZaZvBaWo+ZsNgMlULvxvy3TRd9ITIzY70Q9BIggeGYLQaVF7dW/aNORMtZRoldadNA==
X-Received: by 2002:a17:907:3a45:b0:a2c:cda6:e73a with SMTP id fc5-20020a1709073a4500b00a2ccda6e73amr1025140ejc.98.1705920815747;
        Mon, 22 Jan 2024 02:53:35 -0800 (PST)
Received: from [192.168.231.132] (178235179218.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.218])
        by smtp.gmail.com with ESMTPSA id q5-20020a170906388500b00a28a297d47esm13243272ejd.73.2024.01.22.02.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 02:53:35 -0800 (PST)
Message-ID: <e57f3274-46a8-4c42-af29-ff2009127886@linaro.org>
Date: Mon, 22 Jan 2024 11:53:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8926-htc-memul: Add rmtfs memory node
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240121-memul-rmtfs-v1-1-e9da29b1f856@z3ntu.xyz>
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
In-Reply-To: <20240121-memul-rmtfs-v1-1-e9da29b1f856@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.01.2024 11:21, Luca Weiss wrote:
> Add the rmtfs-mem node which was part of one of the "unknown" memory
> reservation. Split that one, make sure the reserved-memory in total
> still covers the same space.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Could you please test dynamic rmtfs alloc, which should be possible
on some (most?) boards after 9265bc6bce6919c771970e5a425a66551a1c78a0?

Konrad

