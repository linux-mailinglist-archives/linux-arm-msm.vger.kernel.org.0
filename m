Return-Path: <linux-arm-msm+bounces-48013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9319A35BDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 11:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A58216F723
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 10:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563BE25A634;
	Fri, 14 Feb 2025 10:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lwG3hx99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70205245B0B
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 10:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739530292; cv=none; b=RKaX3ccfshKx8b3s3MlsyAYN5cPTYGAc+BFP3Ondjt79jTOVo8PMi4DIgrhA4cic5c0M3v/vrl6zGY6xukNqmn+Jg+3T4fi59kCUzZ9xsdk1C+mtXjH7A/J0xT4Mw1ux6auBmjhYJ5IA/Q/2/A7bF7vW2ldFEjUxKzCVrZTr5/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739530292; c=relaxed/simple;
	bh=xlu6JZFPWbF2FiHQ/Hlqaos69NWLFvlcOgyvx7faeQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PM3j2iWHSk2KsygRAbToh7jXenFGhhneliPqvVe73EdvO6rIbhnOwBSijxEYy37enYdiWvZOuLc35UTu4a/jpCg9gcCwoTgQ5SAo07HnaKbH/X+RCzfFxzkDSp7l6tW2zAliyDyymMnArq0WL7zNTvja/IwZnsNY76UJTq8IsPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lwG3hx99; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4396590c614so1664775e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 02:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739530289; x=1740135089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MiMW0QhMGWxPdrht6/cv/0ycp5QHgV+RbmVMJuGgUZw=;
        b=lwG3hx99OmyEGaoVvd4eeKJyyBnhexTnPyMB7/sT8/Lf0AwilGVKt5nkI4+rn2P+lJ
         IcJl5+e4KvLva3SxI1SXO8a0Z4WSCgEsEdTkj6nXAsaZz11mrfzsqB9e9KHq1I1Nu7z8
         UpGCmNYKP4k7mhTVg0UMx8vHPPZHZ35Eg9DCsah+hZ8/ZbLdW7c6MAHl3xm010t+e4Z4
         kwSJu1SNh8BUMj2nKEIwCDt992RydFoH/8XaRMzTKXck519QHlA5Qp8/6zyg47qQB15y
         FMS2o2YFzkoC+mmSQrXJU1Mbg9QHNZF6rlptzC3kaF+VnWN9T5B9uV5cVbTr4BJ6HsoT
         +54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739530289; x=1740135089;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MiMW0QhMGWxPdrht6/cv/0ycp5QHgV+RbmVMJuGgUZw=;
        b=RkchAkgTwfjmKZzk0M38F4VNy2Ez2xEwEl62nisrHvQtABjIUmk4wTF37FtuZ9mbYy
         bzed7HqnWwGJHf9vjvphrepL3ALI1WmpJUULhtiBAqES9dfF+tyNApwXkfbXERO+iuPO
         RclIdjY1hKiOr0ctnpMV3fQ+YKY2/3W9ESwDEjDU1dGmY7mqlBG8QZWCSPVP5szdDlML
         3AtUWw6HPuHDufg5F/qRUWx2zqBhXb/8dmd9RNqx3B8H3f3eUIj9yE8PrVmIWZU57jpZ
         H58DFg6vzta1ZZCoHsJU6c2yjPLaEe4zot4L5Z1bKwfJKm5sdutm53OX1n+VHyOAyDa5
         LNXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl13/1tKvU/FGTtS+O1VPnCNA+o+lmvci7CVCIx+HDeijw4naeZ3mm+yZD9xjdo8cOdQX5K0ykIKoerwEV@vger.kernel.org
X-Gm-Message-State: AOJu0YxMK033e1QCdGM9CnuDNybY3GHuSxPDztsBjBaoffEhjCxCO4PZ
	IehW+tM1nLfgh3qqaYddYuuNFS8ei4p0u9vd8tnhdqaBW27bLhYKLxRpqap4kZGXSLY36sjKg//
	O
X-Gm-Gg: ASbGncu3A+BT5fUOWzBxQxfzBhKxkiOQPKMjZQlv0cTkdVqy/RQIYFtiJePzRD+y/hB
	OwBFpui9aKnPKqnH3IRvOyjsbAr/2BEqJS1Nvy+bepLfiskTty5u+IjwCcDGgF0opcaEARh4ZG8
	WvMUluEJs+oDR5z/sTn8ytqsWsXsWK2vr4HUeOUxmNY9h9dfeSMmjgYuZyOF8w6lhkg6VIHBvPc
	ivUXvQgTbcV97PUf+zdosh2ta4JTInS73VJQImdVod8Ac6dvSWyE7YgnuS9pTgW3h2FbOrhVfvN
	2xIKCDcwUF9JAh69fdiIAeosYJfS5FgJwdU=
X-Google-Smtp-Source: AGHT+IGj3lp30mMQmhn2Nwm2xrXwZKp+DSJuAZImDZifrTofRvZy/ByzLpQZCA/s6uO45lAm9nj4qA==
X-Received: by 2002:a05:600c:3556:b0:434:f1d5:144a with SMTP id 5b1f17b1804b1-43966fe1dcamr13597475e9.0.1739530288682;
        Fri, 14 Feb 2025 02:51:28 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439618ab352sm41162525e9.40.2025.02.14.02.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 02:51:28 -0800 (PST)
Message-ID: <19d422de-d2da-481c-a5b7-529f6aa49242@linaro.org>
Date: Fri, 14 Feb 2025 11:51:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Simplify using local 'ctl' variable
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250114155959.583889-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250114155959.583889-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/01/2025 16:59, Krzysztof Kozlowski wrote:
> In few places we store 'phys_enc->hw_ctl' to local 'ctl' variable so use
> it everywhere.  No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 ++++++++++-----------
>  1 file changed, 16 insertions(+), 16 deletions(-)

Any more comments from DRM side? Can it be merged?

Best regards,
Krzysztof

