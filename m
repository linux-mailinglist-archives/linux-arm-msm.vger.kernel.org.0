Return-Path: <linux-arm-msm+bounces-26830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB329396E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 01:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1BD61C21883
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 23:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05AF549644;
	Mon, 22 Jul 2024 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z2V5gxTu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2204145BE3
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 23:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721690575; cv=none; b=AmcVRZ0UOgJmPjsHfUyI9jggk1ZGUP4hbLC0eEpcU5UtddIp2EsMscv3uFgt1LYRDP1twtrbje/P17VjgCFpK65zmHZVRc90WzwhdxgdFa1zwsqXha04TjTSczXlry5koGcka1YRhxFPLQWMJWDYy8jji2dl495PxHKSNiEhBXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721690575; c=relaxed/simple;
	bh=TcYljSFqXl7Jb0OT4IPat1dqAzX2nxQAVUCDYwbWnBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K16CjeTm9VPxGRmHhyTRjKlLyyd9NMw1iqqEz+Vae+641bUwEstWtfVr4ncFF9387VVOqB8kXc5hfYP1Kl9GN65hS/H+JJwJHL51TgPeUyao66Nbbx0xDmA5e3QZM/5oGaGcNxERJ7NaAB/w4Hvaih5MCRNydH9GhOWJMcnT3Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z2V5gxTu; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5a3458bf858so3319381a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 16:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721690572; x=1722295372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t+jM/IsbWS9TXRuDvqwtVn1m5MDOFVE7HjSSz5AGLpI=;
        b=z2V5gxTuuTOT4r96jDHrhFQF2YhSGUNLFP+NohZFjkNC4SUrQRdPIv4S7sxllYY5Lc
         jCn9eUnRpuKM+9dUiBWEpjOmQIGgg8S0Aqq5m1yreIBpQq7fF1oeLlsj23SLdBHt7mSm
         Q3LPrzIP2D4pyKqEqAAuiZHJ7m2iSEf8wpwEHi9B22noGXsmyUxQ/FuiXorMiSLyjvGz
         CgGA6xnLA6nlBtOCE4wEM6s9aipf9hP8EhVCOsKRdOoUkSUXSvCp1vF3+/DQKDEg8PfJ
         bPcYtK9tO73joJKTfVuC4XEGY9PtDVftGL9TLf8la96AAeyMphPuQBrbVklWeESUE0kT
         poww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721690572; x=1722295372;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+jM/IsbWS9TXRuDvqwtVn1m5MDOFVE7HjSSz5AGLpI=;
        b=WbZB3TBU0nYPWGvv5R9zvlQBfVaKSPD1lnNWj1gQXamFHXswsfk5UmpF9R6aYCvgEr
         5D35jJegEIYrZVhhcix7iyWipwXyD3RvtCvivKwx1hrjpe4inh2KgAyFFuWEgM1gVBmg
         Xldz38y/vFFRtDLqe9Ca/px1SNXuWzD20FMFpypMvUtk3p7pfAvoL2MUiJifLmVO29WZ
         zQ9Sh/gZhbFtQEi/WCJd36TmvrBqRmu4aOLI2EeayA2Gvc06NNZYrAYWKJxI8DqYOBP+
         /UO+hCv0WiBfjnqUc3B9JqLF23MkOtVo+KXqFRHrwzlAgMVJmxv7V44zA4gc7nDqOGQw
         2Kog==
X-Forwarded-Encrypted: i=1; AJvYcCXlYaEFFfSDaREBNfNL+2DxoyE4lS9pMeC9aBR2iher/CjBoPqTZMR8cWOhvE1ommmP+WDNaYsqn4QBDeUPbuOiq/3nYdn2Dk+jL4CXbg==
X-Gm-Message-State: AOJu0YxVnKbCAdnF8HL3hVzHr9Q7V/9niCBRmyr4hbFfcQ/L3skG5z3E
	nySba5FMu0yW/OQqE+vmvHPoNveOsrq9CZO3DLFv+nzENIIUDXeMBDa7+Wi+Mos=
X-Google-Smtp-Source: AGHT+IEx40B/5YwLpgdHxe49fMK0wig0HiOlBXtGXt+jBQAnrdyUWKm92AyHTbaCB9A57zFddPvPXw==
X-Received: by 2002:a05:6402:42c3:b0:5a0:f7ca:5e97 with SMTP id 4fb4d7f45d1cf-5a478f67488mr6168374a12.12.1721690572137;
        Mon, 22 Jul 2024 16:22:52 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a77d8be58csm2735784a12.4.2024.07.22.16.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 16:22:51 -0700 (PDT)
Message-ID: <cac3d7ba-2a62-479d-94c2-c6dc4d7a5ba2@linaro.org>
Date: Tue, 23 Jul 2024 01:22:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: msm8998-lenovo-miix-630: enable
 touchscreen
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240722-miix630-support-v1-0-a6483cfe8674@linaro.org>
 <20240722-miix630-support-v1-1-a6483cfe8674@linaro.org>
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
In-Reply-To: <20240722-miix630-support-v1-1-a6483cfe8674@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 1:57 PM, Dmitry Baryshkov wrote:
> There is no point in keeping touchscreen disabled, enable corresponding
> i2c-hid device.
> 
> 04F3:2608 Touchscreen as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input1
> 04F3:2608 as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input2
> 04F3:2608 as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input3
> 04F3:2608 Stylus as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input4
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> index a105143bee4a..118c55f5bcfd 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> @@ -11,6 +11,24 @@ / {
>  	chassis-type = "convertible";
>  };
>  
> +&blsp1_i2c5 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	tsc1: hid@10 {
weird (and unused label)

very non-specific node name too

> +		compatible = "hid-over-i2c";
> +		reg = <0x10>;
> +		hid-descr-addr = <0x1>;
> +
> +		interrupts-extended = <&tlmm 125 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&i2c5_hid_active>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;

double tap to wake? tap to wake?

> +	};
> +};
> +
>  &blsp1_i2c6 {
>  	status = "okay";
>  
> @@ -35,3 +53,13 @@ &remoteproc_mss {
>  &sdhc2 {
>  	cd-gpios = <&tlmm 95 GPIO_ACTIVE_HIGH>;
>  };
> +
> +&tlmm {
> +	i2c5_hid_active: i2c5-hid-active-state {
> +		pins = "gpio125";
> +		function = "gpio";
> +
> +		bias-pull-up;
> +		drive-strength = <2>;

Since there are no other pin definitions, you can do better and not
copy the old rotten style ;)

Konrad

