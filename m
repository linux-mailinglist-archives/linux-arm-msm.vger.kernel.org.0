Return-Path: <linux-arm-msm+bounces-10606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B278511CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 12:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B991C1F20FF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 11:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC89C39846;
	Mon, 12 Feb 2024 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hwh6mnEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FDC39843
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707736093; cv=none; b=rgGR69QfGOLEcOSvqi00MIFJvdpaoLSylfoLrimFrtGOjwF5kX1is38z5vRKA9EJV/E5ZV8scMYa0NVflFa4obzXJz+tTfFonXdu1DhEHuDTg/xLsTIo1fLN5MVp/gHPFsQBolEvK4c98lYHsrSYWfN/XCyxICSChRLhGnl2F+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707736093; c=relaxed/simple;
	bh=wmJNTFUDAyhFvNq/Se9rQfDDeAAa3Yq+I6hfGkYdBG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pnP915U5lHGLmUIyh21i8gMMXgtWUuIhK2QUyxHnJLgcqYwWKzl6eUrgEAFDwkb0GaYRfgNUlYeBfxwPvbc6lfC5J1sG7zImKsXBvfmA8264+d3M24FV8vapCqVxyY8TLDLkbKPnKDjKSJqi8nT6HjCqGJ58lnerS1geqSnMJNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hwh6mnEA; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33b4e6972f6so1568549f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 03:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707736090; x=1708340890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQU+9nMxtg490o2RfgUmMjlOUq5SlI61L9475wanmog=;
        b=hwh6mnEAhGrn7LcEyzqzjzQao8E6G9rKWxzRIN6Xe8/gB2+wAENNKEyySg9fZID8mo
         UM15O1RFirLqNF1OaskOo7+7JfPyQmh4AFRXLFXA/9kVx89e+XlY0P1LJA3G1/ClKqIJ
         Jkf+ufOS0SNWPQSc5MYvEwOIGJbxa0FP6z62PQ7jPaT8sbVGPBZfdKz6uoG7J/qC2x6i
         uAIV9nNyvm0Ii79qfCiux7jByXR8GsqqQX7+cNDHg+UzfeWrH3Bv3bWrEbS3B2xuNRJ5
         HiZB5ucQYJUaxhW/Xiv3pHZtSml/ZJnw6/Mme01Fe3NRz+AiIKAGxASCworDmzElDtmz
         Aucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707736090; x=1708340890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQU+9nMxtg490o2RfgUmMjlOUq5SlI61L9475wanmog=;
        b=n+NdVKzQwg1mX0GnvqETagtFEB5/ONfjtUR9Xg5/zgiLV5c7I8i/3YDb0QzcLncQZn
         ycajanAurYUn8L++cQjaHLyUIcjs2MULTSSMBKATN4vHtJIQM/onO4YApP5Ra4ZVUb/v
         kcgtqgbngAL4UMe1yY3j3+b3Z9aBoDHlIdYWS6SroaIwUMgvNwOMm7F6JWcLJSPSk5DI
         GaYyX+WmVrupHs17nJKFJZc8+7IDbFRL6rqiF3VX9oyammVJtQ18FpCX6ehsSmb6vVv8
         mlB4UQInrmVagIU/Men/KCNm/83E2oK4BtBPl4wEa/RPHQRvbdM88ZqAz8/DQQdLFhf2
         RJyQ==
X-Gm-Message-State: AOJu0YxYAHos3MBPxt689g3pPlMxJfkc4xa0mIeORFS6J7r2JX41Ex3t
	FX1G83UnFr68wEi1fOozZqC6a7WadBvmIv0+AkbOBu4+77bPrd9uOUTZ2Fu5YxA=
X-Google-Smtp-Source: AGHT+IGDgqjEia9SZUq6NoUGI2e5RtQlvMgCL08pbrSmBlkBQrp08qNa6/eTJWLeE/5qnqUfqtdT+g==
X-Received: by 2002:a5d:59ab:0:b0:33b:5f1d:5ef4 with SMTP id p11-20020a5d59ab000000b0033b5f1d5ef4mr6372739wrr.1.1707736090609;
        Mon, 12 Feb 2024 03:08:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzrMnDofJlRlNjgm2KNa50GSkyC9LSZkMKgIzQG08oK+y2bQVfAz1lWTjbihOAbrZz/TlaawYBcuyWFP556gnF3G1xj29t3PgWA6og3QAzxFSXfeNoPPfBUh+h1CU/vKAoMAzSVmscRa93dFXjnEdNrUdtN3Rg9IlsI7QZIQ34XfLTsPoJuG1NdTgdq/uVBgs0nZU661upSX1F4rJG/GgkhEmYc2RCT5KwXMPqy5QBhsw8gpFmaqP2z+VUXkCuDaYDP9QlivHdCd0SDExEZwN+jrgkPB8GlACO5pxjh4licktwwU7BEx6R19aDDfSk+wttVSnAmhaZhvKD6y7x4Q2rsfduE9rECyalTYOisdc8p+WHn8O7KT/Ptf8=
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id by16-20020a056000099000b0033b75e5bc13sm5083353wrb.1.2024.02.12.03.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 03:08:10 -0800 (PST)
Message-ID: <f44ea2d1-7381-487e-bd5f-33ffa6437a64@linaro.org>
Date: Mon, 12 Feb 2024 12:08:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: qcom,fastrpc: Compute callbacks can be DMA coherent
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240212110636.57945-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240212110636.57945-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2024 12:06, Krzysztof Kozlowski wrote:
> Apparently on Qualcomm SM8550 and SM8650 the FastRPC compute callbacks
> are DMA coherent:
> 

Incomplete subject prefix, eh.

Best regards,
Krzysztof


