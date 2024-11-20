Return-Path: <linux-arm-msm+bounces-38500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B444F9D3D65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 15:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 752EF281CA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 14:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F591AA1DC;
	Wed, 20 Nov 2024 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KdSHDxSE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE0F1AA1FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 14:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732112346; cv=none; b=RRBZ/XJc0/5QFFDFPunUr3V+bGlM4j/S9aWh+1MK2k7LS3hEFLdXRlJvMGqZbNuUcgJNQytJNf/OVg0h4SHvhN0XnJ/69SwJjutk0NUzR1QaJJZs02+5+G3j8R44EPasMZIzYJp91aY6uZp3QSqZ0aen2iSU7KO2cfiFUX01W54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732112346; c=relaxed/simple;
	bh=x6MZoU7eyedwTGcl9VBhNOR2auU0fxwkG+2SL8SxAvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i12Q6b/Fu9sM9HrhP3HforHcDU/S0nS4E8AIx9Xgq0/SUX16QFcGpfaeTqfv47zTe8Jx39ohytg8A2lBg4+DxfeZy1W+hi1RoQGsnLVwIJuin/ty5h0QfDd4dV/jWgX9lUlPx0hk0XPibyMUaIHKnMzDQojRntMXqfvgP7PCZI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KdSHDxSE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38231f84d8fso323518f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 06:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732112343; x=1732717143; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lx56WyBXTgXtuce0NPq7L0ROTVdmVjkxGdZS1KIB1zQ=;
        b=KdSHDxSE6UegA/6jU/fLiAVhYsJYUIa/74fJtc9yX07XYTvIVnIZG4SzawwKTuZ3nf
         dEGtqUgiQFtMVu050/Toi3S7x3Oef2J07uqWM1syuKSG5ZH5zLpa6Gfh5vQrD52Drvuz
         WkoZ4WGrEs3z/APMsJhbdOwJ5jEh6CJjPQN7PusRr5t6MMEG5rSWstJnbyjN+68No0v5
         8cuveMwyO7qCS/V7q6cWOfb2VvrkIXm+xFcUUN+FIkzHkyHBanB2SFITFKuaKY5n0ULd
         5Rq9a+hYJiyhVDGpr1Sby5b1YNgu3ObO4wJesv6u0z9e2uyHqVRAQr6chdvStwnpr6K+
         2Y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732112343; x=1732717143;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lx56WyBXTgXtuce0NPq7L0ROTVdmVjkxGdZS1KIB1zQ=;
        b=ayew0he4T9jiCRj8dCQu3f8MP+ivCoHo8Q/q5wJw30zmC5vCdkbFgUOQSt11/5pPOp
         egdTxEfr1Je7/AJUYmUN9j3GHvbfiiT03Gem7AvOaGzEPNbQVBKRmI46uJkf8SB+ZaLq
         /N5hiH74I5O/w6q7C+LemJA0HK5ErUKUfT6pQNj2n1qRw88lLqtjYmyiNJHJTeDY1njL
         hmYVdXDtYBOunjkpdRwFRwPvpd1y9C5JmxxMKULATrguY+vCIQDng3M+guvfUmTUbYNk
         h3AWJrGe8jCPDvPhJ8aCu6Jg/+SPBpaqAHTPxEQoHLBKMWfaecLFWMTQVOXTYvU863KI
         5vKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnGhnVU1zxYRzRnJMBzdQsSlaSxByhxQObhi8ajt6lrnwvGlQdJC5lZ62i9dB65f4khzlWSUFkkqz1g9ef@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0yn+lExof1Yh31cdntCyszJ6IIIv5NvkrY0jNC9pwcT9M+1ic
	W1MNyhbMy5xtminHlmH5i3O9lg0uoBhPgGLQZgBwZlHB2SxlWPpfv97bvllxggE=
X-Gm-Gg: ASbGnctbUSmfwRduTdM5ZZvRKQbB91M2YdEkSJXk5rG72DHz55JbyFc2V3BMRAiz+Hm
	5HnQM9Tw5/ZYR0nTz2bX+7fM1zQwQ0s1pc4wQhVN8EZiRd9TbZ0MhQce1aFjmT9H1Jfxtkpk1eB
	N5lCNW+GJAwq6VspY83fOmWTPBVWCgFTxhfuVnJnXjFwM/b6ZdbEJjodousmgaGd1fQx2n5UsYv
	b0rmnlnjQKMgE5adOh87t9X3vEwUTzUOLa/wNuWcrIl9foJTklK96JGfe6qHSdl06ftWQ==
X-Google-Smtp-Source: AGHT+IGD8RpZxKWpShjz3sqfyvWOBlCeCXonyTIjtnVTLNRI8ijfGdDzmz5U1BMdJtd8lBeWSkojZw==
X-Received: by 2002:a05:6000:1a8a:b0:37d:52cc:c484 with SMTP id ffacd0b85a97d-38254b16604mr936553f8f.9.1732112342529;
        Wed, 20 Nov 2024 06:19:02 -0800 (PST)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254793404sm2319375f8f.0.2024.11.20.06.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 06:19:01 -0800 (PST)
Message-ID: <a5343627-a325-465e-b744-747d4c1b2cae@linaro.org>
Date: Wed, 20 Nov 2024 15:19:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] firmware: qcom: scm: Handle various probe ordering
 for qcom_scm_assign_mem()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Mukesh Ojha
 <quic_mojha@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Kuldeep Singh <quic_kuldsing@quicinc.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>,
 Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-0-7056127007a7@linaro.org>
 <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-3-7056127007a7@linaro.org>
 <CAMRc=Me=Eu6+SpdguKurWgQDrpuo4qTCwWO6GfzS=YuA9vUzOw@mail.gmail.com>
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
In-Reply-To: <CAMRc=Me=Eu6+SpdguKurWgQDrpuo4qTCwWO6GfzS=YuA9vUzOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/11/2024 15:07, Bartosz Golaszewski wrote:
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 5d91b8e22844608f35432f1ba9c08d477d4ff762..93212c8f20ad65ecc44804b00f4b93e3eaaf8d95 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -1075,6 +1075,9 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>>         int ret, i, b;
>>         u64 srcvm_bits = *srcvm;
>>
>> +       if (!qcom_scm_is_available())
>> +               return -EPROBE_DEFER;
>> +
> 
> Should we be returning -EPROBE_DEFER from functions that are not
> necessarily limited to being used in probe()? For instance ath10k uses
> it in a workqueue job. I think this is why this driver is probed in
> subsys_initcall() rather than module_initcall().
Uh, good point. To my understanding, every resource like function can do
it, e.g. clk_get. Whether drivers call it in probe() or somewhere else -
e.g. some startup call like there is plenty in the ASoC or DMA
device_alloc_chan_resources() - is responsibility of the
driver/consumer, not the provider of that resource.

With such explanation returning EPROBE_DEFER is ok, just like returning
anything else (e.g. EINVAL).

Now about this function: it is not exactly "get a resource" one, but
still the caller might want to call it again later, which is implied by
EPROBE_DEFER. Maybe this should be EAGAIN instead? Just like
power-supply is doing in power_supply_get_property().

Best regards,
Krzysztof

