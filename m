Return-Path: <linux-arm-msm+bounces-53324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D069A7D070
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 22:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15000168105
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E472E628;
	Sun,  6 Apr 2025 20:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SOilooSb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA331A8F6D
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Apr 2025 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743972222; cv=none; b=KmjM+6bHAP8Ngi6pKIygy2GS3k+qPJUWs9vVxU405YkaGaGEGnhzqZlSO4NhteQ31d2ARVUnt0Fky4WfDI2o/g1sbjhqn6yCSg4dPGKB5+HydC8USS2+2n1+TXOfAvDzDnsZeyXlhw40HTubuLzrwN+JT5130E4zqkjNeJ9/RZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743972222; c=relaxed/simple;
	bh=d6bYm3H0AB/8JnPY7he8qhl0pRKL7vjCFhKWhq9OkIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tgf/Eh5nyk8ixoe6/Z72sfZ7xORbvLq5epu9hk45XwdJ3/5vHeYzNKp6iD1GE38kfvfUepLwTCqK+X4/fEHy9o9UOwtmML6qE5ERlE8whSwMF73rcyDTtqwR1kO0C9tXqo/C5T79hMEwvKTOfTpeNVNj22aUDCSPiXcIJTaiXXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SOilooSb; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3913290f754so449289f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743972219; x=1744577019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g8zDIVuy80YH/rRDWBlPbxEYPGWNtYFLKORvNJEi3UU=;
        b=SOilooSbaFx7BvC/oRwdufsWa14c1p6+rxyiB3CuHFN0YzijMpPkMwBAmS74BEbr4b
         EpREk0KJ6aJKMtqiJPLDnKeYM7f/iEqTjyc55C9CmTaJgqlOCuSuNwFOqzlVifAWQKYc
         D/tcl1csJBH0pf9ThdQ0MSdTCuadadgPQUIYGnJq22FScKTMguLrxbQmrJLiSYhrF0ng
         JF+ZOa2hLJ1w/eDi7IUlYNlAtNxxbCdOIuYYB9IuktOJHXrsClgo5qT/tAK/vy1ofg2W
         1qK8tmvJp2PnAY7akrJvLreeXry9G7Jt7sLx7x0RnjzfnDfKCqCVdlXH53t8NVqRg8+a
         +ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743972219; x=1744577019;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8zDIVuy80YH/rRDWBlPbxEYPGWNtYFLKORvNJEi3UU=;
        b=rDA6GV5rKADKALskbRALiVFbkTvNPbnoBz8cdM5WBSG1YQ7RSPqL3v2dopn/uU76IJ
         4lyb1MhIvgSraJhDweI6OoLRfIJ7PG0Kx0uKRxmttgmwH/+3/qhj1hNzpsPnLU+aX3MV
         iANzpzcBsD1F4MRS/x624HDG1VvxGQjG8fnvE/+VtXtKFPhW34J4GxxvNaBaLuFiKMEI
         Ff6IAj3wrHQv3NGvoGb7GcRwwe77jkLcoXRn+WbN/YhJY9a0LBV+v5fgLUmzuWo+A1AN
         G1JIW2vcSz8HBLm6C0SIss0igMfV1gBozt/mAnsBQIdyUkwQ/qz8F6hSLtTXxXroPrR4
         OKhw==
X-Forwarded-Encrypted: i=1; AJvYcCWBBCZYTR054YfkdWlTDmuPVWxZRFY2q+/MSr3U1ZqYPDu6793CFm/NZJShhOfWO+GIPOKC4kiIvGLIj9xt@vger.kernel.org
X-Gm-Message-State: AOJu0YwmN2fMFD1ez83EdM6EJMXA95bEnFhymaEeG1XMxHmX97he0/Kj
	SfSgdQThPwHsJiwyFPPK/Q4+eIMTZxN4IISQA5vfg435nCoNE4HrdxL1zSBG2nA=
X-Gm-Gg: ASbGnctIvBDn/9GB75DjSv8IcxxozUoffeMEwr+msap1WwhWumtFzpIijSoWKUxfgG7
	Ct6CG4oGHbbLrhZkT1VjJ3W5T+s5+GnvVSUUR4HYWUKcSC/Z6v7C3C1GrXbjQTPVDBBfljDy2A2
	zJlp8T/n3tU6qabij8l442nfBRnwmPmIeZu6yby7Zm/C/LI/HZUw2YBroWKP0k/vtZU98lBvMNT
	eLXjSGjFwFxsFPSjPDXu8RIbc0x1oI2sEhDgIRrnqn1Ll16tIGBBj65V0zEbC8xrY+m17Hm2ULo
	SvJOiPeS427lx7PAj1Xh+613zWZuzB5Og58ZXyhjF2nMg95SGiLh1tKbAzIUOSdp
X-Google-Smtp-Source: AGHT+IEEIqfJRkJEFFMQjpsRmXMjTgzDMhvcASmNd1Im3/VH8FACTFDXyzQleWxatsS1LXz36WPINQ==
X-Received: by 2002:a05:600c:1d03:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-43ecf9c6b4dmr32493705e9.5.1743972218628;
        Sun, 06 Apr 2025 13:43:38 -0700 (PDT)
Received: from [192.168.1.106] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a92desm109174745e9.14.2025.04.06.13.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 13:43:38 -0700 (PDT)
Message-ID: <80a8a1c5-843c-46e3-83ac-93e5af3aad67@linaro.org>
Date: Sun, 6 Apr 2025 22:43:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] extcon: adc-jack: Fix wakeup source leaks on device
 unbind
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
 <20250406-device-wakeup-leak-extcon-v1-1-8873eca57465@linaro.org>
 <xosjgzwpwz3rnqt4wybekzuaag4na7vbfn6et46omkqyy6nvs7@zqoswpjy6srh>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <xosjgzwpwz3rnqt4wybekzuaag4na7vbfn6et46omkqyy6nvs7@zqoswpjy6srh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/04/2025 22:27, Dmitry Baryshkov wrote:
> On Sun, Apr 06, 2025 at 10:16:39PM +0200, Krzysztof Kozlowski wrote:
>> Device can be unbound, so driver must also release memory for the wakeup
>> source.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/extcon/extcon-adc-jack.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/extcon/extcon-adc-jack.c b/drivers/extcon/extcon-adc-jack.c
>> index 46c40d85c2ac89599ffbe7b6d11b161b295d5564..d7e4b1418d7e6b242780b3511f2a49def3acb7a6 100644
>> --- a/drivers/extcon/extcon-adc-jack.c
>> +++ b/drivers/extcon/extcon-adc-jack.c
>> @@ -164,6 +164,7 @@ static void adc_jack_remove(struct platform_device *pdev)
>>  {
>>  	struct adc_jack_data *data = platform_get_drvdata(pdev);
>>  
>> +	device_init_wakeup(&pdev->dev, 0);
> 
> s/0/false/

Sure

> 
> It might be better to use devm_ though

Entire driver would need to be converted, otherwise you got entirely
different order of cleanup. I explained this in cover letter.



Best regards,
Krzysztof

