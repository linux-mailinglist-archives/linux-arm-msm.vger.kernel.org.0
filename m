Return-Path: <linux-arm-msm+bounces-9184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3908B843813
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 08:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B98341F2524A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 07:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B665578D;
	Wed, 31 Jan 2024 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HqXq/2uf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8204A53E25
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 07:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706686916; cv=none; b=pRuMIQ3z7npbECsEsPfE5xbiUOAgaQjZSSW60nJabb3spA8HrolNFNVK2LHWwGfzUReknRGlUrwqxdCDM49YKtqdg5m/5Q40yIdDtDT5M3oYvuKlSkanRGHiIp1ajbQeKClAjwQ8RYcJVrvV8sy6B3jtfWjhv3V/x9WDLGmnl20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706686916; c=relaxed/simple;
	bh=NOyLoCawcsMObxWNelTokNi7Fz/djxsX8kp4Q9E3sTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G9Pc0mG11DxbkREw0BjqaEM6ilvcWzLdVEgbO2focJu//fOjz4D54oY80Sdvl1CYRZK+R1L7MQ0hutp6hflfX/qpkDR2+hvzqu6UpS9VE6YtgvJpWmsFRttnjcrqnAVYUYp+6tTbmM7clrfcpleL+CmU2xrh9TT39wpRTlpFZ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HqXq/2uf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a357cba4a32so439869766b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 23:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706686912; x=1707291712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0v+Z03GSTlSfxtBgakq1a7TipNM6Rdkt1tyPtHyHcIc=;
        b=HqXq/2ufByhHNJGfOf5YixgSDyVx7z5LCPcrLvKdABNa65bDurEA3V16t+bzz0gH3A
         iJquoR5CvlbZtlDrczEd+ucRS16DijxGRi3Ckrkzg7QqUuwM3lm0nDrgVllSkPY64a5V
         pX0YULbRFj5y+/y4D7l6nKDo1Zsapo+tr/kfg2DEs26cvnCmOrpGExFfJGtaa9t+7qGr
         xG1Nt4h3Vh8SHwe4u1QoCPTlmvgp6oE9Zp3tYdYO6s87/jDiAUO5c83/43b3OojfC9JB
         bg+OQVlsU9+k6pAA0TODBMPLuEEHfoHXePU/OJ7KJYQHU95D21Xm0L2Yb2sFa4mQSVB6
         rpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706686912; x=1707291712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0v+Z03GSTlSfxtBgakq1a7TipNM6Rdkt1tyPtHyHcIc=;
        b=adLgjLgB/wwqKXR5mxvlR9o6Gc/dLpS5SyAwfFUTU8544fWSaTRMS8ow4J1qk8oXOt
         7Kf6EsnsqpuglJlA7XRpeboUtsaAI9gqx4HA0xnZ+xj3reZ9/3lQmKtZ/s3wcbiwIxnW
         9f9ysAHJroNzdX8bU4o0wm8wgfT8JtOjFgM683uYsRR+bvmbGqCFSmGc8EL3UUHh2VEK
         BAPhtEsgm/hvHY4EZAK4RM59ZkdQSc2HwJF3dU1+u0yJ+kMF1y7Mj0CyWUuCiBM5R85v
         dKg9N4T+gOT9msAAiSrbEJzd4e2XKF3cNIhwPXWwPjsaZuUt75wm1plDO7AZpuGTYG9y
         mEGQ==
X-Gm-Message-State: AOJu0YxDcfPrHFZAYH+PDm4c62UbKR+mbZC+kuWn4eaumtrkEdR/zYqR
	qYpMecQtER4J0Q4CgN8oSYTX/u50XFbJY6pfD5hDSL3UHHtzLrViWTbQwSM7F58=
X-Google-Smtp-Source: AGHT+IFIZWFwqmWAqZNOO8+QAw/aks4TW/bYHmCQzKX0cwyl8xm9ADUDSqdTBiduVBNG7thUSYhMgw==
X-Received: by 2002:a17:906:4e8c:b0:a35:a7ba:c642 with SMTP id v12-20020a1709064e8c00b00a35a7bac642mr550927eju.51.1706686911727;
        Tue, 30 Jan 2024 23:41:51 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV6TZ7PDybr9+ovqIBEwqG7r5yOFwzmNW7bZmO6f0l4055zP4C7ctwj13F9RuO9xsMYUiGscTfa7cKJ2neLyIGk8YH+7Uhdy3jHPlbvJMh4hXUAKHN5fUdCBaBdRpk35J95czAtQi38J3LYcAPfOfPPznTgdweNIEFnE/cLYjXm5kOMGFO5Gq56ZYixSCovrS86XbGYMEdbk368087lff/65+VIgZMd6S1gP1qsiInE172w5VtIQ+ZqV0eKj/9bvJE3MLcbNDREuy/0oF6rzip03xiHJtS1VLMACayNpcaFnOzaQL7673yibaqCFBinmY/OIqNCyFxTvcL9vHKobRENxBQiKYNAIpy3bJuC9S3JEFXHG7cRA5GzZkMlAPjYy5OkwWj1XPlFuqzBb7Udj9CyUtz76PNUCZZL801mIrR+qbfUkZmYAk+TIt7+1af23u2bkj5vVNFdtuHKff4z6Hy8hpk10yZL3U7TqiEP/WXNSTCLQsKsLpeeYm86SGXhYj/DcZBWIyNp7gLh0X61KwWx4AWaZIu91gRMVWSOg8kK3qPKntqVKX+gGFonJeura94U6qKAm6QzglaFO4ZKa5i1AOI+99TfAZXKSvKldHAoxGDcqTOPXcP015GtHmcu65+7t6571rc+D796cy/83iH46JpJ6uIKKx7AZtzkYQEPTEifDvsCunXgSavh7DgOKH4=
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id sf5-20020a1709078a8500b00a353bfdd411sm4774695ejc.59.2024.01.30.23.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 23:41:51 -0800 (PST)
Message-ID: <378befa5-d211-42c1-97fc-47c1d8bb0f95@linaro.org>
Date: Wed, 31 Jan 2024 08:41:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add coresight nodes for sm8450
Content-Language: en-US
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Leo Yan <leo.yan@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>
References: <20240119092500.7154-1-quic_jinlmao@quicinc.com>
 <20240119092500.7154-3-quic_jinlmao@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240119092500.7154-3-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/01/2024 10:24, Mao Jinlong wrote:
> Add coresight components on Qualcomm SM8450 Soc. The components include
> TMC ETF/ETR, ETE, STM, TPDM, CTI.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---


> +		funnel@13810000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +
> +			reg = <0x0 0x13810000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +
> +				port {
> +					funnel_apss_in_funnel_ete: endpoint {
> +						remote-endpoint =
> +							<&funnel_ete_out_funnel_apss>;
> +					};
> +				};
> +
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_apss_out_funnel_in1: endpoint {
> +						remote-endpoint =
> +							<&funnel_in1_in_funnel_apss>;
> +					};
> +				};
> +

You have several redundant lines, everywhere. Clean up to match coding
style. There is no blank line between trailing }; and another trailing };.

> +			};
> +		};


Best regards,
Krzysztof


