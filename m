Return-Path: <linux-arm-msm+bounces-15387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC0788E2A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 14:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A49001F2B22C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 13:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE9E1741D0;
	Wed, 27 Mar 2024 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GdR1d+DB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893161741D9
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711542145; cv=none; b=gQn9TwDnH7bopYppGDMxMz6IGsG8KsB1Fow4b97mWZQFDzdozWE3aJqD66P5z89Zpuhevf8xx2rsg8Xg27JE+m9Oz5s7NHjW7QmMtd12s/IH5/BwIZ1DW1jEcvyX2XuSk+oWusJh1J2ClMKsiDzZ9S1rrFp7mdEtZt+ZKZE40sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711542145; c=relaxed/simple;
	bh=mgHimy+byUwgB5+ODcBJAyj/keJcA2B3A9AbHPUV5vA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EiKTaifdNT18uHJ7iqdzhydtDa6d/Qgq3/zRRnPihD9oWcWB4Mcgz1tbYRzPrQRF0xskmV1bpGZV0778zRz45XpYQUa8iUsxlw41K0tC8LVLPf92Ju+KoduZmSTQBDUuSNMezfGarjo3gdW0oG8s2LCFu06ogROJDtwNcBlJblI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GdR1d+DB; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-515a86daf09so5001025e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711542142; x=1712146942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OmcRGS5TlQaotd06qJrgXX+1RvodsZtckupwlgr6QW8=;
        b=GdR1d+DBMMLPY1iV0mVibGjQjF6n5G21mB/igxMSrqqz36aHFPZM0n3iq0iaG+V7BZ
         c7VTis/wMhN5CBTfqzkkhkZ+KY+CLYjdv8K7nvWXrwRhi7f2qxh9/uGq54v7udqzp9cl
         bWycb92dOXu15OaCTrF6TIf92fOEhn1hSbHYbbN4ZstfD2mH6dnv575LgO3OxJJpp/D+
         ZqC1lb1d8LQH4MB0WiQpMllEJblXBoDSj3IeLLyIBl3ky+nva68E3TbZVYx8h8q9mENH
         iyYu/WGeQYvgGQDVBqhBAn0N/6dEOse9JFEVcRk4bPQuVx4lbrLtXnvZp3TYc4cckulg
         1rSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711542142; x=1712146942;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmcRGS5TlQaotd06qJrgXX+1RvodsZtckupwlgr6QW8=;
        b=WMue9RvDjUFVy1eatIKH7+r5Z6vI5rRJokiqRwbwBT0RjDjQb1292FbA4PsryoZxSX
         LqBzix2Vh2oLlDUQP2Gcb+tdu4s4/OrZGzy/MYL5BKuryu+nVL5XIUG0obemZ+FQdsKu
         xWApm5NwbhLPtLaw8tutcsGF+wIyAPLWJKeo2+qt5CoUKue7O3jzm4fheuyuPa1ulC/U
         0QJGPtlrMXzBZB9eZZoDeC/gle46RTdsTMGaFgqlMj/zoS9Fjcx99hpZGELw/AKTuYBm
         7D2PeEdjsWWhBJp9DyaLNI1+kRkHB/boWvKcTitHd2iokv3ykeMoc1Eo9tcc31WnNltN
         cq+w==
X-Forwarded-Encrypted: i=1; AJvYcCVUHaY+5LIHYSZxhIcTFQDFiHXHLNbh2lXTr5E1DSkfUKdHX0s04KH31Pu0W56PW7G2pC1qhQUN9KT1wyci74MnvuXYIizwL1QBh6hMzw==
X-Gm-Message-State: AOJu0YzkXbcgsrlTV8SoaCm7TF7DrY0QhCOMe06AJuTIjQ4lEqPNPIA/
	ecVsumOkOfGO2a4LeXealU+u+h3vbODzmIU6zuiFZ/FqXgI6/Qbbo5z9TKuBwZ0=
X-Google-Smtp-Source: AGHT+IHtBSxEVchSrE3xWoYzGCiDQD4FtHnKvLyASr4Du/viFPqbbyU6bNRNsqaYfG4X7z5dzSQv4g==
X-Received: by 2002:ac2:4983:0:b0:515:c00d:7766 with SMTP id f3-20020ac24983000000b00515c00d7766mr851252lfl.54.1711542141717;
        Wed, 27 Mar 2024 05:22:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id n6-20020a05640204c600b0056b8dcdaca5sm1382464edw.73.2024.03.27.05.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 05:22:21 -0700 (PDT)
Message-ID: <3dbb428f-0265-4741-a28e-5613799133e9@linaro.org>
Date: Wed, 27 Mar 2024 13:22:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: qcm6490: Add machine driver for
 qcm6490
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, lgirdwood@gmail.com, tiwai@suse.com,
 quic_rohkumar@quicinc.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240327113228.1706975-1-quic_mohs@quicinc.com>
 <20240327113228.1706975-3-quic_mohs@quicinc.com>
Content-Language: en-US
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
In-Reply-To: <20240327113228.1706975-3-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2024 12:32, Mohammad Rafi Shaik wrote:
> +
> +static int qcm6490_snd_hw_free(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct qcm6490_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
> +
> +	return qcom_snd_sdw_hw_free(substream, sruntime,
> +				    &data->stream_prepared[cpu_dai->id]);
> +}
> +
> +static const struct snd_soc_ops qcm6490_be_ops = {
> +	.hw_params = qcm6490_snd_hw_params,
> +	.hw_free = qcm6490_snd_hw_free,
> +	.prepare = qcm6490_snd_prepare,
> +};

I think you leak sdw_stream, because of missing shutdown.

Except that everything looks like sc8280xp, except the snd_init(), so I
wonder how important that difference is? Cannot be combined into sc8280xp?

Best regards,
Krzysztof


