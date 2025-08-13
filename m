Return-Path: <linux-arm-msm+bounces-69039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36390B25301
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 20:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C72717E81C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2702E54D8;
	Wed, 13 Aug 2025 18:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PCj7LPDe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32EA19F424
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 18:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755109568; cv=none; b=mN/hTjWMXJVlVY8YvZl0Q/eNgBDtoTDVzyd0F1t3EgFrJDsbiudG0WlrAqHZ2Pp5wKwJcsm0PBEwLnzSgZciRGrPIF1Nt1ap4FWpRVcJFythvvYw/5miATyHI3DfsYzm8Feif8HAxwwq0EfctGvPvspFQjP5lrZnA/cmjio7KgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755109568; c=relaxed/simple;
	bh=kjaqRalQ6f+VnPUzPJ3lUTMCHNI4Mqln+f9A2PCWars=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=chmbhp74BTkzuRNnnU0ds2LVGEBDF9wdgsy7dCTmGUnQBitg5Ojia7PQZFJO9+5v0wvJ9mQe7Puiffj+09ybWC+c8LBNJeSEYFZyVwj0NVQw6vD+kP411gX78ol5lbr0tEl9OqoX8IxB3xHqneH+yPtzIRq1Rh1dfcR9WfGuI5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PCj7LPDe; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb79fb221so1858466b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755109563; x=1755714363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PG2XQ09YxGQDAljbZJ1dBpExZdNgeyI6Zcz42FxK4Mc=;
        b=PCj7LPDeYAXaowVBmpom8m5uScmjxGfFgqFzlR1fSVb7AeboS5eohYmo4ywE9kL95V
         aBSePNtjlvdtnNb7TpI9Mnlx8jwf/fiRrpOW7gnAFidJ89cxI2K6EU8LOqokfsWw+CKB
         Su8w9jKFsZwsWgpxnHoIRECsy0coAmxZ+/vy3VoS6lGL9STAMfTx/YcV4ADduNDn39AF
         /F20vkcFco2SLmIUkRL7DcSjYsWs8QeK6AvFs8gOitpDcfwsjX6MsPWvltJmeLEnLQJz
         ZGDFOiVjYYeFJdekSgGnTDLNR3FuIjZfm3KiF7DEo/XQFoimthpHVan+uOmjVMvp5g7c
         yxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755109563; x=1755714363;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PG2XQ09YxGQDAljbZJ1dBpExZdNgeyI6Zcz42FxK4Mc=;
        b=oTbgUshvpV4f/lDD/QIBkC3AkVScosWVnWQ7Qfma+4+s2djmcf8jlHv88tuRkjREUq
         AMZc0oAFvFMEy61rniCL6+fV1PAl2oWm5enR685KB2p+cvlp/4NwhWaUNmP3lShUkI/H
         tn0Y6zFZSnDWPhPl+BYGkvJTUZ3LLM4MSTI2Wv1JYymhx/EgF8SIoavF5Pv36tggXTEW
         4QyZJzC176Ol9L38rMW37fS/jZw+DAFrcBQS3sDdmuOl35X0e3oSq/gWD7foJ3ENCLmD
         g3kX2HoFze1DLriDpCpNIwADeIuwhrmvmVevYhFo6AKsjxZbTFSVj+cJQGHAIN8vRRrq
         8ZRw==
X-Gm-Message-State: AOJu0Ywij7uoiKzbNeH23R4E3yAayPCn995gnoyuQyaipyqsSjKErzK0
	00N1+JXPW0oM/Nhf2EifXP26EoDi4qgoHzVEpzMenVSFoQzeDyBz3r3q4c31IEICOxA=
X-Gm-Gg: ASbGncsMwWT8H8rxsS8ywmrYAArAxeYf86wsipLUZiPICmIpWP5BA8Tbsg2MEBRUMED
	B1rvhuLR44EK2yX5QXpHV6VFfcgtSrYhd/wiUHQlO4Ggvgwd4K/bz9FrEW0Qo9a/z/xJ/HkhjvL
	O8hupYUXbL2EtWM/5z8owB/5khj74ZyRLyHklM9D+wmAQkl99dgYEpKqBwL8dtpfiKSL99XTyYa
	IlxgaNXzUDBRyEBB+dfZ6lGx/FjW+pVLVBlOHprlwQ3ir1fiuMx/oa12O90FeohZmCQ61zgMD5p
	BfXCyYOqM8x4iumXJscmEBlF5lusKd4J262bla83hh7PCsa8u0APk2IVkh1C+DicONpT95CFby2
	mzv4nZC+p4AOvYoviJ5/Cujxu+yKvFuI+WQ3VvRybRW0=
X-Google-Smtp-Source: AGHT+IFaN9KUjjqPxBrud3j7rI49y4RZJJQ73wRUqjRKrKs4uhIrrRPKHQ6crcL+1sNOlr+nwDLI0Q==
X-Received: by 2002:a17:907:d88:b0:ae3:5d47:634 with SMTP id a640c23a62f3a-afcb98e24d8mr8259266b.9.1755109562455;
        Wed, 13 Aug 2025 11:26:02 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0766f9sm2488355966b.24.2025.08.13.11.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 11:26:01 -0700 (PDT)
Message-ID: <c0864d4f-fede-4d2e-8f93-c52d870adb5d@linaro.org>
Date: Wed, 13 Aug 2025 20:25:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/17] drm/msm/dsi/phy: Toggle back buffer resync after
 preparing PLL
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-6-ee633e3ddbff@linaro.org>
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
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+AhsD
 BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmgXUEoF
 CRaWdJoACgkQG5NDfTtBYpudig/+Inb3Kjx1B7w2IpPKmpCT20QQQstx14Wi+rh2FcnV6+/9
 tyHtYwdirraBGGerrNY1c14MX0Tsmzqu9NyZ43heQB2uJuQb35rmI4dn1G+ZH0BD7cwR+M9m
 lSV9YlF7z3Ycz2zHjxL1QXBVvwJRyE0sCIoe+0O9AW9Xj8L/dmvmRfDdtRhYVGyU7fze+lsH
 1pXaq9fdef8QsAETCg5q0zxD+VS+OoZFx4ZtFqvzmhCs0eFvM7gNqiyczeVGUciVlO3+1ZUn
 eqQnxTXnqfJHptZTtK05uXGBwxjTHJrlSKnDslhZNkzv4JfTQhmERyx8BPHDkzpuPjfZ5Jp3
 INcYsxgttyeDS4prv+XWlT7DUjIzcKih0tFDoW5/k6OZeFPba5PATHO78rcWFcduN8xB23B4
 WFQAt5jpsP7/ngKQR9drMXfQGcEmqBq+aoVHobwOfEJTErdku05zjFmm1VnD55CzFJvG7Ll9
 OsRfZD/1MKbl0k39NiRuf8IYFOxVCKrMSgnqED1eacLgj3AWnmfPlyB3Xka0FimVu5Q7r1H/
 9CCfHiOjjPsTAjE+Woh+/8Q0IyHzr+2sCe4g9w2tlsMQJhixykXC1KvzqMdUYKuE00CT+wdK
 nXj0hlNnThRfcA9VPYzKlx3W6GLlyB6umd6WBGGKyiOmOcPqUK3GIvnLzfTXR5DOwU0EVUNc
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
 DFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92Vcmzn/jaEBcq
 yT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbThLsSN1AuyP8wF
 KChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH5lSCjhP4VXiG
 q5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpFc1D/9NV/zIWB
 G1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzePt/SvC0RhQXNj
 XKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60RtThnhKc2kLI
 zd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7qVT41xdJ6KqQM
 NGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZv+PKIVf+zFKu
 h0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1qwom6QbU06ltb
 vJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHpcwzYbmi/Et7T
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250610-b4-sm8750-display-v6-6-ee633e3ddbff@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/06/2025 16:05, Krzysztof Kozlowski wrote:
> According to Hardware Programming Guide for DSI PHY, the retime buffer
> resync should be done after PLL clock users (byte_clk and intf_byte_clk)
> are enabled.  Downstream also does it as part of configuring the PLL.
> 
> Driver was only turning off the resync FIFO buffer, but never bringing it
> on again.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---


BTW, this and two other fixes from this thread were for some reason not
picked up.

One fix got comments, but it does not stop rest of the fixes,
considering they were reviewed.

Best regards,
Krzysztof

