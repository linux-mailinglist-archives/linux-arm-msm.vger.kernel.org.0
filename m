Return-Path: <linux-arm-msm+bounces-25838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088A192D10E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 13:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C8C01C22B65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 11:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0F3190485;
	Wed, 10 Jul 2024 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oc8SSteq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632FE1CA87
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720612447; cv=none; b=dk/IxwfiUW/2Yv1kr1wnktjF5vxDRU7+tjhUy6VkzXjMa+ZKj6t1Wn/6cDL2GapGXXgrXUg2wnz/ZRVtAToxTr723HAXbnq0uQSRNgD3RBn3Uny/0vxqcPDQQUEdmx0ZYNXRsxN0p6oxZbCOxdbvJ3HNfhYmLHA5TaKg7vxu02E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720612447; c=relaxed/simple;
	bh=Z/1v+ajFwgk68ZoOdTML/bJUtuJ0rVxj6ycaaeGv+70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rcRi4qJSMzYP9e4JReFb47kcDvnZPIY3BQK8ajipyuVp7w26O3BRi4h5m1dqcSyUKa6nPe3bmbHqG/++vmXTgDyFXn1H/GzVMAbL4H53Rq6lhcLvYnot88TJfK9Ev2Aj1ooVxtxn9rc2FEQgDWB1ZU67NhBnk0/e7MrY1wtFbS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oc8SSteq; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6fd513f18bso655514666b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 04:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720612445; x=1721217245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vOYBQQHhZ0i9pMGgOvADs2RB7vvBi7I1faqvtDEOg4E=;
        b=oc8SSteqLEeJOEgF7C/uGaDDhUMq63WqSG3fOql5k57uWp1LXDYs3ScR59HNvYdfBN
         qBgj18yKcYu5aakmCqUKKY7nii1I0qDpLYR9FLNTvjTqc9HKha9V2tUeFr8KiFzIdr+5
         MDRTDhp0g9dwTlcQ1aUqfFdQ6ahy8ubsa055C5+3jecqmQJUb2cTv0OWNBsL5FGekMwP
         jPyU9CPugwYj+IUACkeasJ0cw6NzLWw50zNPt4mmSzHH9IwS4F8OlErBocBLr3aaZS4B
         JpmgD9unZ4xrmeWC5wy4lFI2XYSKoROLtaawDhXF0vKwdV9ExOovYwkZ3YH5MqcKTmbV
         QXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720612445; x=1721217245;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOYBQQHhZ0i9pMGgOvADs2RB7vvBi7I1faqvtDEOg4E=;
        b=ey1AepcYesrkGDzBKVg1PCqdn8htwmaqyc8akuXKyTA/UE3SAb0hEfFk99RWomxQpb
         h/o4iBbyivrxIlnA/x13DBHhCRIZiTN025vCqUL1CpzsUrXdPGDeKB6mSsXlN18vKMzK
         ki7kOgYMZi8sFAKP2Ljfb/ywrl2Y5ofNQ0aK8za5rDGqlZQn1+vfmF3kmOhTGJUtvkau
         GTDx5Grxd60BEb5Yo/ylbs8VT9w9xQnZNLUrkVcUwF972gaT0HiLg5onUZfcGNSdHgEy
         o3FVnkfzwtuQxMBzg2v2mdMvCB0k1i06Zv3ypGlfSRriWxa9iCRFlo8YEJP5+R6WRVMl
         RXuA==
X-Forwarded-Encrypted: i=1; AJvYcCW66bcIS0tw3RWYLmdc1jcIpxh57qgAHHzqxdXamgjKHBjwb1vPXyKIq3timHGda/e1yOVIh1wqzwTaadGHQzL8/HgUzQ2ovAoQdca7+g==
X-Gm-Message-State: AOJu0YydhIPw5IFEIgLhqvBb8Dji5SeHiriupGRP4IGVvlh9RFQ753H4
	spkcM/mk2GRZFDuvH+V/5RDEb2yPFNgN2UILiKn7l0pjxkwOm57/cwtAG95gkrA=
X-Google-Smtp-Source: AGHT+IHCqy5FcBAlGp2S+L/aTjQnjagbwGchyL/xCIl3cUfPe6NoMgCG+lMOUJXaCTA7LWIHDLae9g==
X-Received: by 2002:a17:906:c305:b0:a72:b471:143b with SMTP id a640c23a62f3a-a780b6fef6fmr322542866b.33.1720612444551;
        Wed, 10 Jul 2024 04:54:04 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a854592sm153867466b.146.2024.07.10.04.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 04:54:03 -0700 (PDT)
Message-ID: <2a3561cc-c6b3-4823-b488-fc8ebc53e1a6@linaro.org>
Date: Wed, 10 Jul 2024 13:54:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/clocksource/qcom: Add missing iounmap() on error
 when reading clock frequency.
To: Ankit Agrawal <agrawal.ag.ankit@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240710110813.GA15351@bnew-VirtualBox>
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
In-Reply-To: <20240710110813.GA15351@bnew-VirtualBox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.07.2024 1:08 PM, Ankit Agrawal wrote:
> Add the missing iounmap() when clock frequency fails to get read by the
> of_property_read_u32() call.
> 
> Signed-off-by: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
> ---

Or even better, you can extract:

drivers/platform/x86/intel/pmc/core_ssram.c
32:DEFINE_FREE(pmc_core_iounmap, void __iomem *, iounmap(_T));

into a common header, call it something less intel-specific and use
it with __free() here

Konrad


