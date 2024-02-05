Return-Path: <linux-arm-msm+bounces-9778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FFA84962F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 10:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1CBD282C6A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 09:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1305E125B8;
	Mon,  5 Feb 2024 09:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bfSPgbGk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F30125AF
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707124632; cv=none; b=sDrvmu4tZgBPnZQi8KWyGov3VGnL83cYawW9M32dLx4kLooYu8b7judod8lUVVNVvQ6GhmOTp08WvC6Sdx7MFx/+ZVPkYz3ySxBRmRATcznKo3T15i8KIIgGH0B6DujD7E8uTXnCkRk0PAhz2EE/xDIVlbxibCK1iuC41pfBeSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707124632; c=relaxed/simple;
	bh=XWd9xLylyBT5M2/7A5vWEGIu3STuJdYfP6gbM9CuVeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVyxpDcn96CsjcLeDziGtgGsqZwOu5O2say9F36iahDbYnPlqOwDaW+XuehqxUsDmGpl155Rwr67E5bLvvJBJ4wXzJxovAAg5Kupn0d2vQk0UdU+crKDGrTZu2kDUYSEJ8vjtx81eB/y6Uay4J92OWo3YWVQIvsur937TIDI+xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bfSPgbGk; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5606f2107ebso883985a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 01:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707124628; x=1707729428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uW7j7d5sbc2SmZcVmQSuT/FkqOppes1I54urMyUkMBw=;
        b=bfSPgbGk0DTiq7G0x6RnZidSpYiEyAqMQo9Qy1lYjkw74UH95ERA/ONrIR0Y1LAuL5
         zy/Mzx03aZJK4zLBjB8XnB2ke7VpaDhsgKGWfyIR0CNpAQxjgHyCQynZHQY08qLovxGD
         f7vmGctO9joq0BpdLpwRWiibHFksaVfn8DM+wd7+yOUr7xQ+hxgUkw6+vusU+seb7xyr
         71oK1FsJ1rshjMat0EzeZtK42lAmEj2Ku6399f/zaBGLA1UBhHd1x5Bdqtxax0647eCX
         7QiNfwXebHup8TWr3vohP92w4Akf/M4VEThEqk+fDIz+Be4jku66Z+xFcnzSfbpI2qt1
         UHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707124628; x=1707729428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uW7j7d5sbc2SmZcVmQSuT/FkqOppes1I54urMyUkMBw=;
        b=amiPc+fRtSrNCft9X2Q2G8djeHA6NeL6kygEiD+49cAybgIsIYKNNbbWIeZ8E2b0o0
         Sf/4ryV9itElILGZ4belLGoMFWxuNWgP2cR8se1Ydlyri/z6/If/SFWKjVU1grvAM0mx
         vzmgdKylLyHbanfVCe3vN5whqN1kZtYcf+o/eXYlzbKo/wKl1DwWx38idNw6IcChClfR
         Yjd9WN8aZloPJtMKL5dDuvf8ty4NCHpGtv2PgMm8bj70AzLhu3JoNotIvk0aIBpUqkg2
         hLOSYuuCiozejtoI/qtkfzjPaVVYofWhZzqwpNhWP8Zy4WF0NYJ0SLv9OR/0BIRluCBi
         kR9g==
X-Gm-Message-State: AOJu0YzG3lJ+2fjpShHsh9ANHIOyfoS12tpcIv5o0nqyT4vgUZdwbIFE
	Vmqn5UlOhIUIKHSjVCU1suNZX1F45S2X+A22QwHMAB9hQ2x1oqK7bMj9LDjoO+k=
X-Google-Smtp-Source: AGHT+IHnj9U9lbDBD85awyLuSi3vUQNcSa2u1OEiNYT/3QWWa+mAuSgIgnVUSpnMm2XMmMHP6zpQgA==
X-Received: by 2002:a17:906:6849:b0:a35:3718:997c with SMTP id a9-20020a170906684900b00a353718997cmr5303367ejs.28.1707124628451;
        Mon, 05 Feb 2024 01:17:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWxGC3PgVm6l/xGP/xoxc36Nku/wr2DzIIOZsrTE5XBc3AOiKJKcpf12ica5EhunbM+POqURgj13zIJJcMl6EVlHbQgeUyexrp2rZBProMEvdmhXO7gxeKo+vnS+rKOp8cOUAntNc1kRZgQjnGF4fQBQ1aQCrelG8iIOQ4r+xx8OaUYXAPZCcld08l+slrF3xSoSUU+0gcTpcLiIf+aWhO3v1AAhrBUoHYXMp6d9jPOCqu3czezJ+tPTR+UmPBxHHrXFE+xixO4pBNCAQ93AA5ved8TCH6fYswWJDP+EcEGh9atvsyjcpaMW9Njk1GoqUuccK2nbxQ1CyVJCrBr+kdTc9j+KJx4o+p7X0IwiogmHs0U0WhOMKPPW4k2AbTuu3iSitLT7AHAL4JpPZo=
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id vh11-20020a170907d38b00b00a36fdfd5f52sm3973064ejc.204.2024.02.05.01.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 01:17:07 -0800 (PST)
Message-ID: <e3844aed-6e23-4a5f-ade8-61bb3e6c06a9@linaro.org>
Date: Mon, 5 Feb 2024 10:17:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: google,sc7280-herobrine: Drop bouncing
 @codeaurora
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, judyhsiao@chromium.org, quic_bjorande@quicinc.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240202174313.4113670-1-quic_jhugo@quicinc.com>
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
In-Reply-To: <20240202174313.4113670-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/02/2024 18:43, Jeffrey Hugo wrote:
> The servers for the @codeaurora domain have long been retired and any
> messages sent there bounce.  Srinivasa Rao Mandadapu has left the
> company and there does not appear to be an updated address to suggest,
> so drop Srinivasa as maintainer of the binding.  The binding still
> appears to be maintined as Judy is listed.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


