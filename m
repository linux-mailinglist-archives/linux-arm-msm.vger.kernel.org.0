Return-Path: <linux-arm-msm+bounces-21269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D218D61F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 14:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11CF1B234A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 12:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614D9158DC1;
	Fri, 31 May 2024 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CZ74ppkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A756E158A37
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 12:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717159091; cv=none; b=tC+306Gh31PPSEComJbIHPn9cuRDy4gBoiRPuL538W6WpfA7NbiC90cwpgkHQPhX+Pf+I8WCoCEVl8D1wTf3GjnEhRAj+GgAxWU/ChytfWFcLSPaST039J4qhrys3otjPiizs6i5BGc7DsiRjW55nvT3LplSht28EM1kkkO9xNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717159091; c=relaxed/simple;
	bh=4vLBGvVnHAnKmOa4OubUm5uxUfa+Q+USI+QFNvbihRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sAGc1MomKyY+QnpLhsAl8WUkpxFCmN+ZA8MqgrYkBHRJ9hMecExptob1Lre6h9OQWjkEnz0zjq0pDZfE7rkT2Pwna5zWWYKQymaxJtvXTY61jDXBMxYLvZEtc5G4FPB8iljOBn1rY6RqFI8mATFHDFmdfv92jjWD+cmEQ57OdEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CZ74ppkH; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6890ace9b6so29915066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717159088; x=1717763888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bKfOxPrq22Dykg9czPhtJUcNoZdQTkpeJKshafenJHk=;
        b=CZ74ppkHcQGmkTxNWR8I0Gk/camysgG/HF9yvtzlpkaDgKqCqqnLUJ6n+2lXLX68mP
         iE60xesSyjPsK+BVqIEb1nqx5nEEILVsuO8et9bcpOrRIMjhszD4YW4dcjiUmt8uODpk
         74+hMtfFKGEt3Pj/Gx7e3LWCJqt5kjELKxMBosZ7OEabYKrp+DAe2vQVEXyLz1odBZ0C
         JZCXcJN9kXNy7Ei68vXZwWRWFIPNItb9RUMC+/OwMMk4hf6Kf2Mi4VdVVjahXDRJSCEi
         3/tgAR3Mzxl5PE55ht0fx7Q6QOUglqlSU4ButK6IKSNhR843TmYqz0202svXPJwgoWVB
         /7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717159088; x=1717763888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKfOxPrq22Dykg9czPhtJUcNoZdQTkpeJKshafenJHk=;
        b=qp6f6lhcDpoFV1P5IIm4Rz/oHZvJ7GKoXF2m/fFLODT37R0ZFA046f5ub4hCsU6c1Z
         nHaNQPdlC3EHVvHuxwVtoUR3MwmOc0J31HzLKVYBunm1Ob+M7L3DUzccGt6ZXKD1anT3
         VEeRr9yYBjIgIGtMU6ATBAumixHMFdCKPfkTtolGdPCik6GJuzbXWJ0tTwP6AvMK7xH7
         bnZmzj3r71q6JoXHqz33LMWBeiUpCnmsXS0JcrGfaWT9Ak1eKpWJkuO1qqlNQp76d6DO
         +O7SSX4fmciQ1zc8Am/QNnKioJQM+ymb+c88ccTPz8rCVsEdFSBMXaNzD1jXJbaw2BFa
         Q4+g==
X-Forwarded-Encrypted: i=1; AJvYcCVOk8j4+mxZQTTwzGzOjishWhdzxRAGfigJmRJH5BwziPIX10918uUTV/9awN+tcM3/XGh+SMHAv72+CmAmFBfCVKQlBvI2AsinYt2SAQ==
X-Gm-Message-State: AOJu0Yz7TdyO6TBM0CC9NOPeY+n9I/zFeEkSUt1NLlFMzE79i1zxUtRr
	oxixdL0YtfV337B5POj9ynkw5yoLWOIX0lNpppE2WLVJAbGQHMC/5p6HvdUq10QgHDQTDOau3q/
	7MUU=
X-Google-Smtp-Source: AGHT+IHuwxxm+rWgogEQN0YtMEo9BZiQVwkTCW9oGhNmBCYwplNp5EbKHHR2d5KwoRmDCRzbM5FccA==
X-Received: by 2002:a17:906:1e55:b0:a63:36c0:eaaf with SMTP id a640c23a62f3a-a682022c9f4mr127263466b.20.1717159088042;
        Fri, 31 May 2024 05:38:08 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73f9bacsm82754766b.59.2024.05.31.05.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 05:38:07 -0700 (PDT)
Message-ID: <eaa0c93a-ed28-421e-8302-c98f862d1149@linaro.org>
Date: Fri, 31 May 2024 14:38:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: pm7250b: Add node for PMIC VBUS
 booster
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20240530-fp4-tcpm-v3-0-612d4bbd5e09@fairphone.com>
 <20240530-fp4-tcpm-v3-1-612d4bbd5e09@fairphone.com>
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
In-Reply-To: <20240530-fp4-tcpm-v3-1-612d4bbd5e09@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2024 5:05 PM, Luca Weiss wrote:
> Add the required DTS node for the USB VBUS output regulator, which is
> available on PM7250B. This will provide the VBUS source to connected
> peripherals.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

