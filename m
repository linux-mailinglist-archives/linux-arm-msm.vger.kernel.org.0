Return-Path: <linux-arm-msm+bounces-25937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E9F92E3D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 11:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81C7C1F21B2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 09:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12063156641;
	Thu, 11 Jul 2024 09:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KaDW49lf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A22E1514D1
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720691661; cv=none; b=sP5OA/pm+J82eKf+6f4BozDy8sVuD60AeZrJjK5qjXEwhVZuMdllTTAOJC3+mHMcPzzSUJFqylmgDMt0CFgzhn4OE9km5r+9vAFv+UX8YaGF4SxijYqZy5iw+39jqf8We0a3HE5grN323Gx4yw9G50xncbVWiQUnsCJUTymPek4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720691661; c=relaxed/simple;
	bh=z3ooFGk+30/6d0gH3j6dKCFAQFbvQqy+Ng4+DJCLTZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6FjdqH8bMkoTroopr/M272VuPmACr2Rdy+keOKagDngJYB6Na8r07n3sTbfGKT+jEDw28MQEAzbsie/NhYT+TBoe2mt8NqxpJBFPk2Hz+6weJhtq8DIyPQ9UGpEfQdgfLXtlJgIzOh9Twt1iTsLpxJeReUum/0hHbPPuHoQUlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KaDW49lf; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a77c9c5d68bso90447066b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720691657; x=1721296457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rflfF89mnaGUwsOUbWFbwm+vHjkEPbCoIeMCDr/D35k=;
        b=KaDW49lfbbNCWXALlzc9u0eqqbhZbudKmNCYMosnl21fHQ+WXPl5K++dh6cR47rfKe
         iyBIWylnBYm8Vm5ptkfDT1d5oktQu3wE/25PPG2jCoU50vCHzd+k9XCfRrg6Bp/BDpUY
         YBQgcJKMCL1I7pAjqouKpam2/DhIbB0KFRXkEMmLamLTWXgjbRlQlb1PPDPjLmpdXtAw
         eIsRzK4NUYxhmv/+ZYEtpTEI55l3o6PnBWNIKBonap7Jk+cmV+jEOP0nuuAiqWNs+1SX
         tY9K3sLIozpPU+YpTWN8Aw4j/d/JYMHOh+HmiiDUYulRe03qDztSS5o6VDKga1kIoKyQ
         Wm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720691657; x=1721296457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rflfF89mnaGUwsOUbWFbwm+vHjkEPbCoIeMCDr/D35k=;
        b=Jv8ACcXh4CoAvorr7LZSivXrsM6R2O0t2Y9NHs8JQDsNjyJ10+tsYU3lcsfhtREy84
         iMIVfgR4W727PLgOQ8KSwjK0ISX7iG7OKTcnbhNhE8BowVhSLoJio1qtulz7a+2QNKCg
         IN7QKpIDTo9513NipbntGirqzxCGoajqCLFsGr7FzL89Wgj3VGjjajxrOB/n8PQLPppM
         VYqUfks4FwFZyb7zqwbFUx0lGx/iJWFLz+Xx4q8O+JccpLG1Nnf0cdWCiFExdtaFtilM
         +VCbRhipBsTi09g7hmkuB5a30IMEOCCyhyFNorDvOaqnEL5vj12B2dvL9G8qCWhSdD40
         iq0w==
X-Forwarded-Encrypted: i=1; AJvYcCURVAtFOWfxPvI/L7gne60l+N/EiXlap6TO/KnofvwUP96tZLJbsY4uegnyDFx0hgIQF9fst+6xGB1kLrMylRwn8yVVh3g5ewtEhugrZg==
X-Gm-Message-State: AOJu0YwATZ2Y1Tca7p9fqcEQq7ylZjuteIkbyW0OY+BPBZltofVDwxoM
	XhMk4rSyXI7gF2ZO/aDmT3h6Ti95JwKxxjOzQ3D+T4ssTzITaaw1OMZmuqaJ06g=
X-Google-Smtp-Source: AGHT+IFJqVNMH0G65HNZ8nrvlDVl1kNOmg2hHwZpuBhi1DGG0KAFX3zxnz+5KOq1+jXNumtT49tcqA==
X-Received: by 2002:a17:906:4957:b0:a6f:bf0f:4209 with SMTP id a640c23a62f3a-a780b7052b9mr547940366b.42.1720691657303;
        Thu, 11 Jul 2024 02:54:17 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a855ec8sm243057166b.179.2024.07.11.02.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 02:54:17 -0700 (PDT)
Message-ID: <f7e74a6f-0548-4caa-a8fc-8180c619c9aa@linaro.org>
Date: Thu, 11 Jul 2024 11:54:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240711090250.20827-1-johan+linaro@kernel.org>
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
In-Reply-To: <20240711090250.20827-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2024 11:02 AM, Johan Hovold wrote:
> The DWC PCIe controller can be used with its internal MSI controller or
> with an external one such as the GICv3 Interrupt Translation Service
> (ITS).
> 
> Add the msi-map properties needed to use the GIC ITS. This will also
> make Linux switch to the ITS implementation, which allows for assigning
> affinity to individual MSIs.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

X1E CRD throws tons of correctable errors with this on PCIe6a:

[    9.358915] pcieport 0007:00:00.0: PCIe Bus Error: severity=Correctable, type=Physical Layer, (Receiver ID)
[    9.358916] pcieport 0007:00:00.0:   device [17cb:0111] error status/mask=00000001/0000e000
[    9.358917] pcieport 0007:00:00.0:    [ 0] RxErr                 
[    9.358921] pcieport 0007:00:00.0: AER: Multiple Correctable error message received from 0007:00:00.0
[    9.358952] pcieport 0007:00:00.0: AER: found no error details for 0007:00:00.0
[    9.358953] pcieport 0007:00:00.0: AER: Multiple Correctable error message received from 0007:00:00.0
[    9.359003] pcieport 0007:00:00.0: AER: found no error details for 0007:00:00.0
[    9.359004] pcieport 0007:00:00.0: AER: Multiple Correctable error message received from 0007:01:00.0
[    9.359008] pcieport 0007:00:00.0: PCIe Bus Error: severity=Correctable, type=Physical Layer, (Transmitter ID)
[    9.359009] pcieport 0007:00:00.0:   device [17cb:0111] error status/mask=00001001/0000e000
[    9.359010] pcieport 0007:00:00.0:    [ 0] RxErr                 
[    9.359011] pcieport 0007:00:00.0:    [12] Timeout  

Konrad

