Return-Path: <linux-arm-msm+bounces-69538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97385B2A0C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 13:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1365A3AD517
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BAE31B10B;
	Mon, 18 Aug 2025 11:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U7PzZ3BV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636CA2E2282
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518004; cv=none; b=Wy9gwWL3RfmC+ZcIu/jUA63P3B2HdNNRWAGy6AmTFIr4k1hlE/vhf9Dz2L/2pHQHof/m5xwL3cQ3nivAA24ieUHCLLrgCELWYhadjGCsBQbSJIXZcYkOMhd+gPnVsMo2dtMW0oROVgw/PkSyiH1xUIqFIAT55Qik4ctzZ2b55Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518004; c=relaxed/simple;
	bh=ZCMXsVlHtqvHp9HOjuFdwqmzaSfIoEmF+vzlt2RxC6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYwXJT3k8wH9VgP99xjMMrBJwrLAxZa4rZwIVug1heJjJWOLwiwaZLepMCrTBhuV1ogiPFkDSEYfdmXmOPfMmOlgAuVcP2BPJi1hKOhrhGCmRhZBzGdnd65ZObe8J7thsKEUHNW5QYC10x1bSIq/IUNDtWxJWojorNbmV4JVa08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U7PzZ3BV; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-61a20bd7a72so65612a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755518001; x=1756122801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fuR6jAMBV4ZTTjPzdysECiSK5P/2INKf3lMZTVfus0Q=;
        b=U7PzZ3BVooxxh573KcLqW5cso69QHJ2g0rgR5bcsnPtDICP09FVwAWkr/fBjqY6D/E
         Mv7YAgPjIlVXUd6bjIwCgOnGQma4C0E8FoWGwImXftxNh2kc7dedLhh7TeCMIykO0c8A
         EyqYjOrZVrywCJSkugYeDmogrVN/YlxEIAgQeruo1id1+bekB3iR87GmxDBoG21p4RpY
         aDzz6FJ+M+zAXUf5xK/4MxOCvQcZt/FPBKKI8E92WPk9I5ViUk4TtnFeuOIe/l2mSEoy
         Txg6YduzMmqdhmddjIIxKVHbim9J/iYh/5crXCYWr4LNBjRxfcTpSUbmdiMhGcUSO6d0
         vgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755518001; x=1756122801;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuR6jAMBV4ZTTjPzdysECiSK5P/2INKf3lMZTVfus0Q=;
        b=PW7wSJnCspEU2WA2DNdKlejhPqcLIi1RQoXZA79hvDCnrZf4qtqYViFN61dZjJGpq7
         bknq667Eh/syL6mHUH0Grc28Wi+L3wbQcHm534RQ5zCEKJtU/izc/fcRIGzg7JbZTxjH
         IA8fzJK5f4hhpGpT90sl9GAqPpgnTccqWSwfZ5HUFZO20ncOa4hTXkhEwLJPbaMq6H+P
         ERzZ3tatOE2Z4cP5LUvFdAuCsp4LqEhPj+ArfkzkQVLefetzm47OUqowW3O1ymKmi2gK
         888Xem7ymi3fzoPOwRJKZdQa6Uj1Ra1SzdD+doXyFj6E201LgD/oWsqHN32BQ3C1tlvG
         zCCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU16hiBbYM/eNRzs+86F//ZiZIBHBYC4qMp7psm2eYOpzkr7Eo6MbdatHneqSHvn8ZaxuiDn+gDKxjJGvr4@vger.kernel.org
X-Gm-Message-State: AOJu0YwnbAQhz9ZKT5s/XrnJVm98WNLOePbFqXEParLe52NHyNqnRbZa
	3rZFVCY60+u6Ij6m/vsx+WRcR3r3U4Jt39GP7zBYvjYjffrfoCWX0qTNA41uGu3y0SQ=
X-Gm-Gg: ASbGnctSeCqC4M7yRu+Ui1e6/JFMRJOz/p0DqZ7uxiOg3fU9NhUwBF+rooLO2Aua/iy
	i3Uh0Wg6rid6N+5OWOvG1z83+Zt0WjwQjOkq8tgoso57rQ1KQt6aB+wJvorSKJgEt0aQ7njvF6H
	/vBa2dat7l8luHfdazsIk8TrgggresefKLbra41Z9wD3gQe6cHdSp/W1MyMf6NIYDU+kv888Mq2
	og5ed/89Lr9+LsE58euO4I3mfPiMA6H6c4gqQAiZHtAuwxmdOee36+K7c2K8QLjAba6Jx5dS4Qv
	YKRpCywG87euGMgIptsOYY6F1o8rWOmBoWjszPA6IRuPrZq/H8pzasLExZoQRjvqy46usquXBI4
	4V2gd76t0cbiEipfBF9ji0ZQJl2N2wiLhM8iwi1fES7M=
X-Google-Smtp-Source: AGHT+IF1APw03/g57XmrCRLPRGpzFqKfZPNAZEXzjhiiwCZgq4h8v9nOpxisxIx7dzP2ziBJeIDBXg==
X-Received: by 2002:a17:907:9627:b0:af9:a9ea:f42f with SMTP id a640c23a62f3a-afcdc1f4d0emr506220966b.9.1755518000578;
        Mon, 18 Aug 2025 04:53:20 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cfesm776327966b.46.2025.08.18.04.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 04:53:20 -0700 (PDT)
Message-ID: <f75a5ef0-d742-42a4-81c7-85b33028265d@linaro.org>
Date: Mon, 18 Aug 2025 13:53:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: qcom: audioreach: deprecate
 AR_TKN_U32_MODULE_[IN/OUT]_PORTS
To: srinivas.kandagatla@oss.qualcomm.com, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250818112810.1207033-2-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20250818112810.1207033-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2025 13:28, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> Deprecate usage of AR_TKN_U32_MODULE_IN_PORTS and
> AR_TKN_U32_MODULE_OUT_PORTS as the connectivity of modules is taken care
> by AR_TKN_U32_MODULE_SRC_OP_PORT_ID* and AR_TKN_U32_MODULE_DST_IN_PORT_ID*
> 
> Also this property is never used in the drivers.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  include/uapi/sound/snd_ar_tokens.h |  4 ++--
>  sound/soc/qcom/qdsp6/audioreach.h  |  3 ---
>  sound/soc/qcom/qdsp6/topology.c    | 10 +---------
>  3 files changed, 3 insertions(+), 14 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

