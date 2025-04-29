Return-Path: <linux-arm-msm+bounces-56163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCDBAA1A08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 20:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E79919C3978
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 18:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2EE227E95;
	Tue, 29 Apr 2025 18:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tuHrNqHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AA224E4BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745950285; cv=none; b=kSlv7FPpXvLrvQPS8ONJ9ksYG4an8lU8e8IO8JI8Arg8o4jvrirMPeigVTPwA/QLb2yEk+LVLQYWBcW/y9iYKSX/pmUdWXrVrl5/rT8AlU5i51vnesMAvQ6Ztw3iQkjBdx2vo+Iw24cB9T2Ac/Bjvd3vgFIbr+hB1f/5nLoBl+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745950285; c=relaxed/simple;
	bh=8nlQZ01meXAQovrWPUtgBPn4TiJlNkxbKf3AFLR5N9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BOrvfTQpbrDYTJd4/SQKFh+jBU+jnU2ZWnGIQ2tGnDcS7UteR0IByIZDp3rdhLg2oF5lzHi3bPaUlw9PMJReP4cWMj8Ax3LJaXuH355yzuwBp0tHCr7SD/uFLPjsNx+DxxbtnDbRc2bKR3b/KySh09mM+x2xXZSMBHfm800tGyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tuHrNqHj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so6275525e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745950282; x=1746555082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WpzMXP2ebJurBwWCQQJKn8JOxCKSR5wXSej+qM9myxI=;
        b=tuHrNqHj/GV7g7LAejOB0DdFNoR8dm29FfTwI3CxebPwT1nGGwyjrs/7iVgEacLamM
         PT5gwWL0zkLyvbV1OJL0HzuTHh4b3YpMYRMlQ2bBOAFDuY9BYukFvihzYtJJGTsUtcv6
         CdVExFDJH0sS0estMcvQOIGKMz9P59dSAKrIzsricpCL/t+Bie2BQIawUVSKCkE4cixi
         4ESvW+eRsEhO6J5PBlrcQ8r6GWSzI7bG6Tk18JYWLxW2JjYab95adaO4TrKPRL6wI4+Y
         8IUqmKtNG22Wp5SnZnPt/BkCxqGRuexIpQHF6cNW/5FSgGFzrSEVTrwlyKrsh+ActZKF
         X0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745950282; x=1746555082;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WpzMXP2ebJurBwWCQQJKn8JOxCKSR5wXSej+qM9myxI=;
        b=BvusGttXQ7rWtMKunVXhv21nRqMIe0UFYSWTQ0TD3F89dBw4KFy67uAC6/SjJSTFR1
         ZwMZlmb3amJqQ1ceE5zlrMg4iiU+jqnvA4VteHbeC0rP+M8b8viIqDQlZs26d2V+2m/2
         06oMG3OX7+J4Zb5QauvfxOHE0pSR9aOe2YYzO0RwuQcJVjqqqNedUYtkjfAWS2GoCQN6
         eLLlR3StzsfRB2LnF9zJAl+uEProAGQKPyxiHGEbL567uaRqu+1xVEsM9oSuL65Fx6RC
         aB2MhJPNqB5Qe9w38jklFQJlWYlog1MPvXX3K/Hdo61jYwhfDPHdXLcIOfCwAdy7mBeS
         P7/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYArkeFjFzCQdoOpXMfhsfG+wWc23zh6Sgw9Gqxi0frD4ZKXW9TqpXIwz4ohL/hSELLu8ozMC11bRUEgZc@vger.kernel.org
X-Gm-Message-State: AOJu0YzlNcBF3aVXZvycXZagn9lMEYAaMeqO2Lf41ST9xn6NRlxHbQAq
	y/UWVShtJFrH4KdsHx7pzAmLh+17Gx83YrvvZKVsft1DbzT4mH8V2P44mFEx9p0=
X-Gm-Gg: ASbGncs6geNQSu5vSOxsLHpYvYfFnhJ+bztuYt5PrhWl0QNjPTwY0xkpyeNU3KfaB88
	CXIOqoRqHB3iWvUpTQ3EbxK4CA7OR2zCACUykOhrs9a1ylbo0MJyazpRGa1mO/k42p0LT9JiXPq
	9m4ajj91Xx8cZDkjmDCaIdCBhPYn8CmWTz4XszZjXUL475SXmjHCw+63XMYieyIteTOqL/zTS1O
	16xyQvWmJIN6W3A7KJYpcXNps11CF86bDqBb7m5Oys1q+bowZm4wy4ffFArJ+pnm9/lLC5doCWP
	IUzU8mAtRIL2NXZKzoJsbl6iUKxVdHEthyyG8FckO1ZwT4/ez3qj9Rrw1zY=
X-Google-Smtp-Source: AGHT+IGiABOqbvJkbP41Qm4+kiQsibytk1cuFX7drGFVhTzSVNIIdtTnMsB9pfxA/Wo1LjL2hhJStw==
X-Received: by 2002:a05:6000:2510:b0:39c:30d8:a44 with SMTP id ffacd0b85a97d-3a08f763806mr110452f8f.5.1745950282389;
        Tue, 29 Apr 2025 11:11:22 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cc4025sm14849988f8f.56.2025.04.29.11.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 11:11:21 -0700 (PDT)
Message-ID: <50fa46da-2a6b-42dd-a8a2-0431cbeeac61@linaro.org>
Date: Tue, 29 Apr 2025 20:11:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2025 20:08, Krzysztof Kozlowski wrote:
> Camss drivers spam kernel dmesg with 64 useless messages during boot:
> 
>   qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
>   qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
> 
> All of these messages are the same, so it makes no sense to print same
> information 32 times.
> 
> The driver does not use read version at all, so if it was needed for any
> real debugging purpose it would be provided via debugfs interface.
> However even then printing this is pointless, because version of
> hardware block is deducible from the compatible.
This is how the dmesg looks after camss:


qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:3 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:3 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:3 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:3 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:3 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:3 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:3 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:3 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:3 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:3 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:3 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:3 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:3 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:3 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2
qcom-camss acb7000.isp: VFE:0 HW Version = 3.0.2


Best regards,
Krzysztof

