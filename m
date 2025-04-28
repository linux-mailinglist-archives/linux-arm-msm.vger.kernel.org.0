Return-Path: <linux-arm-msm+bounces-55923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A52A9F3A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 16:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38A543BCBA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 14:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C174926B946;
	Mon, 28 Apr 2025 14:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Os21SPBw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1945268FEB
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 14:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745851319; cv=none; b=GApLlxHh9fByYj5hFng1F7BdRyRkQf36wTbUwurOaJMte4OhXYnGNiF6X5+ixjGNo2wt375QwZDepdsNWuj6rp/CzNGq4fh7R+eBGkTV79IEJB4pT/vJy0Zbnp3xIx7HS//ERUkSdthed1uGXet/3A+LhZhmqpCfJ3P9hf8O5Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745851319; c=relaxed/simple;
	bh=Pk4B8Z9F6DCzs0R6AaWas25DIan6wu6rgaYLPtHiOFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBlgE7dZv4jUy6L2yPDZKV7GR4K0QmHzBZfKbqCAOocd3pI0VVd9ZNlXPhgly7WwfwoGpWSQR+MZl29k/ocDSAgJz1ggvSJVLtOuWYVrEjn1P/QyExbOYMd8Rqjh1VzJQbqZs4sqzhf+CdZ9W2JM52No17B4QaRHFoIlJYDgyqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Os21SPBw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso297788f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 07:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745851316; x=1746456116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3C8ecqtlsWJdWnYmgKh1dE1AWagcaI57zvbzZiHqTQg=;
        b=Os21SPBweEmvnxSf7yqmOxbDQ2lSpOJp7RLLgfvSqBbaqGtAI7F4AcLxaDifIfeqq3
         Y0O0gCOIJ7qr3DRMVuBCJr0lYfvn/1Lgclx3heXm+km+h/1381GVHnGl1fL6cOiik1zT
         AtjsmXKHMX8TO67jQF+h+SE7fxujQ/OUZC6dDUO99jRXlwWxDTfO0VJT9C/KO0xxTm8s
         T5V25FwXJsZHUmx9ACMgR7Z3P7GXBC/6zfhmnOEbFl8MBDX9ftytZzshQ4sgMMsxTVvR
         Sf60KQG0cYzdskqJx6xGRpNMAC9DWKpHlOLtWGjAuNnqs6ScpseajaPvY59/vcYYpHLw
         814g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745851316; x=1746456116;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3C8ecqtlsWJdWnYmgKh1dE1AWagcaI57zvbzZiHqTQg=;
        b=lSh4plb3LIOBeVM2I1edJtbn4G8++o8sxgC7zyEtXT4xJ/MWlwoLBkE90eEdKHg/cD
         Q4b5gh4VioXn4jvPfom3Ct7P3q+LYW8VkdOrpIPZDnE3DtdfcxU9nv52lSHos80MGToK
         mTYu04qdzaMF2qF68w9P95cgUusY2ppRl2H4THaTBbB5BlcKRn6x9b9FaNDUzDjZ6Md5
         YHmi26RsVH1Mrai9F5tpNtpZRlyxuPDmAylfkq8aKNRNxBXKYnXycUluS5ClPDq/yF2O
         /xym71EajBSsTZ5O435zyxFPFCb6Gtf+8wUwitVezfufyFpxDBUs5p7EzUjBHgA+o8Hz
         zoTg==
X-Gm-Message-State: AOJu0Yw2bSwhqUdIe7SVZEtnjg6jHMkVB1c5AiEw0Pj9sMYFGkuMFbGd
	KHHTy9nMw3fwC4LXsd2yiqmJHUce0x8+ADi+8RBQOltQyBMSVtUapeMzmvyewjg=
X-Gm-Gg: ASbGnctXQ6R5F/XKXseqjQYBE5RGRgn8LyyPPQgFU/OezecyGVfIGWlVZZecBMDFcmt
	1Ohmy4pjJ1EEhSlaZHj+7WD4TDp4xhbfwY1DWVNk8VZwwdvvrUXfwN6rS6OyLiJFfFAKpezzWmF
	KfhVk3U0bXkKCujQKAXsD10lw7Eeya50TMAXB1hbxOPC6pBVCdZTq/q2P+o7jU7RDCSHYGaLNks
	AaPPELesnXu1S9GvQWpoFmUa0/clxdhhDioQ7inXneqp81LEO7dKAsVOhJsOrx1SJ80clUkIHrR
	a1n78Rnf9nB0MQ19MdqWh+9mWq4avbK1YFX4ndWTp1Z0A/DvLgotvIWvyqk=
X-Google-Smtp-Source: AGHT+IFC+L5dCQlISR/Rww5twRXYbVZ4XdccxceQoYvuWU8bkAImIc6lkhMr2QVI1yTHoBwXcLCOIw==
X-Received: by 2002:a05:6000:1a8e:b0:38d:b090:a0c4 with SMTP id ffacd0b85a97d-3a074ef34abmr3565710f8f.10.1745851316104;
        Mon, 28 Apr 2025 07:41:56 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbeda3sm11463839f8f.50.2025.04.28.07.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 07:41:55 -0700 (PDT)
Message-ID: <e61e17ca-fed7-4712-96fc-a9a2339de1fb@linaro.org>
Date: Mon, 28 Apr 2025 16:41:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750-mtp: Add sound (speakers,
 headset codec, dmics)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-2-50133a0ec35f@linaro.org>
 <dd271e8c-e430-4e6d-88ca-95eabe61ce94@oss.qualcomm.com>
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
In-Reply-To: <dd271e8c-e430-4e6d-88ca-95eabe61ce94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2025 11:30, Konrad Dybcio wrote:
> On 4/24/25 11:40 AM, Krzysztof Kozlowski wrote:
>> Add device nodes for most of the sound support - WSA883x smart speakers,
>> WCD9395 audio codec (headset) and sound card - which allows sound
>> playback via speakers and recording via DMIC microphones.  Changes bring
>> necessary foundation for headset playback/recording via USB, but that
>> part is not yet ready.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> [...]
> 
>> +	sound {
>> +		compatible = "qcom,sm8750-sndcard", "qcom,sm8450-sndcard";
>> +		model = "SM8750-MTP";
>> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>> +				"SpkrRight IN", "WSA_SPK2 OUT",
>> +				"IN1_HPHL", "HPHL_OUT",
>> +				"IN2_HPHR", "HPHR_OUT",
>> +				"AMIC2", "MIC BIAS2",
>> +				"VA DMIC0", "MIC BIAS3", /* MIC4 on schematics */
>> +				"VA DMIC1", "MIC BIAS3", /* MIC1 on schematics */
> 
> Is this a mistake in what the codec driver exposes, or just a fumble
> in numbering $somewhere?

Which mistake? MIC4? Schematics call name things differently. They
always were, so to make it clear for people without schematics I wrote
which MIC it actually is.

> 
>> +				"VA DMIC2", "MIC BIAS1",
>> +				"VA DMIC3", "MIC BIAS1",
>> +				"VA DMIC0", "VA MIC BIAS3",
>> +				"VA DMIC1", "VA MIC BIAS3",
>> +				"VA DMIC2", "VA MIC BIAS1",
>> +				"VA DMIC3", "VA MIC BIAS1",
>> +				"TX SWR_INPUT1", "ADC2_OUTPUT";
>> +
>> +		wcd-playback-dai-link {
>> +			link-name = "WCD Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
>> +			};
>> +
>> +			codec {
> 
> 'co'dec < 'cp'u
> 
> [...]

That was the convention so far, but we can start a new one, sure. Just
ask the same all other patch contributors, because each of them will be
copying old code, which means cpu->codec->platform

> 
>> +		/*
>> +		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
>> +		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
>> +		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
>> +		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
>> +		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
>> +		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
>> +		 */
>> +		qcom,rx-port-mapping = <1 2 3 4 5 9>;
> 
> Does this deserve some dt-bindings constants?

No, because these are hardware details/constants. Drivers do not use them.

Best regards,
Krzysztof

