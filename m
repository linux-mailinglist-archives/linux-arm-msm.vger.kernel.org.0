Return-Path: <linux-arm-msm+bounces-27863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C56946F66
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 16:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 133251C20B75
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 14:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80B756446;
	Sun,  4 Aug 2024 14:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xUu/hucV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE3054279
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Aug 2024 14:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722783305; cv=none; b=OH7weezjkbU6gliSEKhePiJ0oLHhtAxAsDiO3MbEtUNsJjo04iNA7UQJ+BquELHIvZ0QzgufbVVayg71NuLyHIek3/wYperUJYh83XLKHXtT/cPumec+VkKLheLbkU4sE6kVrcCzzycSwzjPVr89XTBTAo3cre19+AZz0JfLGPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722783305; c=relaxed/simple;
	bh=aoeez4UbnDIiYWVXN8PfCUQGMx5nIW6ilW2iWWHHax8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WRpys8hdTy02A9w4lWAqBmSpf9JOPQxzRdkT3bxakgccXJB6A/p02bOBvST7VkVC0Cw20n/XF+6E5jLhT3gO8xMJuBZ6coLbsu7xSLhaU5cHHvGEEFW7bV9f+IlyMPjxROehjtoBpqb+9GYwicl3pK/vKL8hVar7zwz2uWA3C/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xUu/hucV; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so15011213e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Aug 2024 07:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722783302; x=1723388102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lgpq8b4x2HVjyFJ/u2YgS4o8w03jI1WiBWpWAad59Qc=;
        b=xUu/hucVt6xssiwUfQBTdPqzty09ucELQWtb1FtQ9Brzzz9IrdNbnzE1YWuMK7VEjF
         +yofPH06+DpITXrcfhRzYerCTZDxazYst5RNAdItyedbAJnXvmmVnwaz16F+zJGaoOTE
         3lLxaeO4dP2iRC9R8jaCMzpX+fgix414qBNc57d82MRKiv23MhrVCfv+5W06PZ9S54EB
         3E4qqaDxyDNmMLH/7YpFMXkV4VfVjlEdMAg72lzDKz8AIBHUMxOZP3W6AgT15AA3k91Z
         KdDlmL+dsCeqrRMZbIEWEXOYu98GgbdyK2wr9Yd2RUJPKYZ4EdFYuC5ZIurHG8lXRnKO
         mpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722783302; x=1723388102;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgpq8b4x2HVjyFJ/u2YgS4o8w03jI1WiBWpWAad59Qc=;
        b=F3tSKHkTBzJTVipAHQz0E1Ft/YB+YCA5TOZvHa7tmg8hAiruiE28xOc+ysqY73cIiq
         hoBMhsCTAaI0jB1F/p8hPvE9uqNrOCP2Z9Xn4TWL/5c7fe71zZJVMay+/1Xj4UwNNOyy
         FfHQ6z8Bg0vDwK472L32V7NLVBPMXMG5lJ3a1sRZnLDLNLFESZqkXNTeGVw6igmRoTWn
         eyC9Sv73PIYqw67qVzMao/AUn9xV8l1qI4oGnuhhc1gxjhldk2XzL21CGbrmcDEmgrxH
         pary/9v3uvYZeLcCiUPQ+nx4Y/vYNOCNui5hRVaFGr5ltvMlHQWB7FDCpOApGqowwgnc
         PFLA==
X-Forwarded-Encrypted: i=1; AJvYcCV6cv5oRPTs7coQP29F+PuVFehIFRUqgq88ymxlWqErazLIsmLF8XujkB2PmM2OF+T6XHQ0ORMu5snmEMESFfyuNkxAiUv6ioidaRr3vw==
X-Gm-Message-State: AOJu0Yxjz+LPqUKjVfFMlaYNLFDgPQ0uvyjDVVLU2hC3IvBkHGjo1YrG
	rg7g9RViywb5SmmoLIzuxhoUlTJicPN5Cte9eaSIR1LL9GOidUTbfVNc5xCZ6S8=
X-Google-Smtp-Source: AGHT+IFbSKIq0z++LYBdxlLxwD8lp+AXdJ70fjsgzR4aoNtDgeyyWjGThzccoKbUkafxvkattHD/vg==
X-Received: by 2002:a05:6512:3f1f:b0:52c:e192:5f5f with SMTP id 2adb3069b0e04-530bb36f624mr6512858e87.19.1722783302105;
        Sun, 04 Aug 2024 07:55:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3bccsm342033366b.16.2024.08.04.07.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Aug 2024 07:55:01 -0700 (PDT)
Message-ID: <5b800ed4-da8b-4660-98c0-355fad96f857@linaro.org>
Date: Sun, 4 Aug 2024 16:54:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] dt-bindings: clock: qcom: Drop required-opps in
 required on sm8650 videocc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>, kernel test robot <lkp@intel.com>
References: <20240801064448.29626-1-quic_jkona@quicinc.com>
 <20240801064448.29626-2-quic_jkona@quicinc.com>
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
In-Reply-To: <20240801064448.29626-2-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/08/2024 08:44, Jagadeesh Kona wrote:
> On SM8650, the minimum voltage corner supported on MMCX from cmd-db is
> sufficient for clock controllers to operate and there is no need to specify
> the required-opps. Hence remove the required-opps property from the list of
> required properties for SM8650 videocc bindings.
> 
> This fixes:
> 
> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000:
> 'required-opps' is a required property
> 
> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000:
> 'required-opps' is a required property
> 
> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000:
> 'required-opps' is a required property

Considering that there is no bug being fixed, you really do not have to
stuff so many error messages. One error msg is enough. They are all the
same. Last time you had two, but now it grew to three... Write concise
yet informative commit messages.


> 
> Fixes: a6a61b9701d1 ("dt-bindings: clock: qcom: Add SM8650 video clock controller")
> Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Closes: https://lore.kernel.org/all/0f13ab6b-dff1-4b26-9707-704ae2e2b535@linaro.org/

Does not look right, Vladimir did not report videocc.

v4 for such simple fix is already too many, so I give up.
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


