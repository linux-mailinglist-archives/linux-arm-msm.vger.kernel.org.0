Return-Path: <linux-arm-msm+bounces-6502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F4382516D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 11:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B27B1C22B74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 10:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E5524B2F;
	Fri,  5 Jan 2024 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b0vRR7zs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A880024A1C
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jan 2024 10:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a28aa47bd15so164959566b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 02:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704449154; x=1705053954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Xd1Z6iLTxN3FGv4QwEP+gpZbn66m6te2k95J2YN3OM=;
        b=b0vRR7zskDhWI6LQ0HDas4If/ofbVKf9y1JbpFZd2SWXcbop5Xvzx1Z2i9xa+S/zJ1
         2rjCK6KMk0QBlOSwmYV3MZhUa9KnQKt48l2M0O+GgpG0CQ0w9nt82RQPuP+rejz7zcIB
         rTPGwofxKGnFntjzkvqZZ+OWH/ZRuuyfBBWAKToAdvMSDG9zVd2w37Htpdp8RMhhBBQ3
         IcpVXewFVk/p2LWOnUuZad5BGwhQK1MBDL8sySqcPWcBYpUPJG6pKAzfIHHE8SqsB9KI
         1X6P+aHPYUAobTrisGPlY/2kCOA5EB1C1IKuY5ODo2I5tA5126bVhVLVrWIQGS5pQosp
         sHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704449154; x=1705053954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Xd1Z6iLTxN3FGv4QwEP+gpZbn66m6te2k95J2YN3OM=;
        b=mPZLIQNmS/Sffzk0NiKvpm3z+5IrV729O5Zi0DzDc4o7IvK1UU+oZ+knWTNguRsr3k
         cmxoC+zvvLetLZCW+weKYqU8+9/0QZBVrL9ApGteqWT9U2CIRNi91l1uM7f8tnCG9z7L
         EmCD9VpIY+ICSoPgeeuGGaIDJZoDx+NTeGepQA8iis6iPwVvAXm3dTmKehucbIl9AgJM
         WljLx2AtNJ3MuEFAlmka+56KXQXarNfLnCCTJMA9gQ4rDzEMG+WKYvzFl8l/mtNO5+R2
         qhLS2xtIL1rooGzxm+kcjeMlxxNvcA5IFRnZ7ElKTfYtAJvaPAW2KTrFFES+odyNCdM+
         vwJQ==
X-Gm-Message-State: AOJu0Yz+l9aaIEcwZ7zEZxbKQhSU4s1eUcwF1CmyQFSu4VsxxVzIJ3Ub
	gC4kC1kfa0YewvvxYn6VmcytWFdJJO9Wxw==
X-Google-Smtp-Source: AGHT+IEfSbe/I8xCoiaaPkPumbzzOTEwOCMV/5ttqE7WjjCGB7YkcHiCn8qo4NX77GggwuNJWcFYOg==
X-Received: by 2002:a17:907:980b:b0:a23:6c6a:41a5 with SMTP id ji11-20020a170907980b00b00a236c6a41a5mr1173582ejc.45.1704449153904;
        Fri, 05 Jan 2024 02:05:53 -0800 (PST)
Received: from [192.168.199.125] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id wh5-20020a170906fd0500b00a294c744fcasm459156ejb.182.2024.01.05.02.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 02:05:53 -0800 (PST)
Message-ID: <9e79a460-9a1d-493c-a430-63c416e3d992@linaro.org>
Date: Fri, 5 Jan 2024 11:05:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490: Update PSCI suspend param for
 cluster sleep
Content-Language: en-US
To: Maulik Shah <quic_mkshah@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, luca.weiss@fairphone.com,
 cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, quic_lsrao@quicinc.com
References: <20240105070223.11415-1-quic_mkshah@quicinc.com>
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
In-Reply-To: <20240105070223.11415-1-quic_mkshah@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.01.2024 08:02, Maulik Shah wrote:
> QCM6490 uses Trustzone as firmware whereas SC7280 uses arm trusted
> firmware. The PSCI suspend param is different in Trustzone for cluster
> sleep. Update the same for qcm6490 based idp and fairphone fp5 boards.
> 
> Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
> ---

Nice spot!

For things that are chrome-specific, I'd prefer them to be moved to
-chrome.dtsi and then the "normal" (LA+LE+WP+friends) values to
stay as default.

>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 4 ++++
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts           | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 176898c9dbbd..b56f6f26d96f 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -446,6 +446,10 @@
>  	};
>  };
>  
> +&CLUSTER_SLEEP_0 {
> +	arm,psci-suspend-param = <0x4100b344>;
>

I think the residency times should also be updated here.

Moreover, I'm seeing additional sleep states here (APSS PC, CX RET
and this one being AOSS SLEEP), with values 0x4<<4, 0x134<<4,
0xb34<<4 (the one you added here) respectively.

Could you please add them as well, similar to [1]?

Konrad

[1] https://lore.kernel.org/linux-arm-msm/20230619-topic-sc8280xp-idle-v2-1-cde50bf02f3c@linaro.org/

