Return-Path: <linux-arm-msm+bounces-6146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8FD8206B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Dec 2023 15:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B8FD280F71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Dec 2023 14:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE178C0B;
	Sat, 30 Dec 2023 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PhQEzXsa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E328BF6
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 14:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a22f59c6ae6so902887866b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 06:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703945495; x=1704550295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8D+6OD5768CMC9lV5VrV9hKQqRaZdZu6kBM6LK1mwKM=;
        b=PhQEzXsanQYyQFSr3ZmngCGGoNvtzTDzFcEFs6rP68UNBGjq8gRPgsoy+BYQGzpthZ
         cHHF5bsJ9Es4lt71Vk3NcyOnswPp04VubPEj3eGQBnwt75uXgPjnwp+XAeJkdg7u/P2C
         E44JI8I9DeyLMwDE96ZXWhRhl8VlIhrTMJ82zk9zXRk/4lq7z/z87Zb5x4edtOjnepQF
         evunM38DF2ToDminyiS/+1F7eUidl59H4osMbvqaSSLmqmTQze0nRJZ6wlbpXDiOwjJl
         Mj2zc9+Qu394jjg3hGTv8yi2UPPM8+Qci10zh4ICwwQARiZoSnWcjpKOd/QS3AFKhmGO
         KJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703945495; x=1704550295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8D+6OD5768CMC9lV5VrV9hKQqRaZdZu6kBM6LK1mwKM=;
        b=D8EzGyu3+Jxn3nH85VGVHAZnCQpwpW04D+Y9d5rZr9xOQVYQBDOQNutNkKG8umSPFC
         QXt3+Y3OaPavF+cQNbB5jJCH2ozZ6laKu+/k6CfNt9ufKQOti/y+Ybhgw6HMfTWG0kfl
         sESjvTsLYaGNXFcFKcsg0J/9yGdJHAJTWAUOzvIkVO2lsEA478wdh2hJ8fl2hWy08sql
         4kxDauXZumiMP8+KowKrsBkwBwH4WFWJo+werNWJVz7vN0MUqZ4rr8tYKuQc5ieAoBHR
         aGenDgrDHDvYBEcSgtbOS6gfAezNGSZVNAc30Jr1JWs5AHf4HppaGUagruVzU2VwDH0t
         A/0Q==
X-Gm-Message-State: AOJu0Ywefx9XVurMRUvTsKKCsQNI2OJm9NhK6hrTbkgTjpU/0jp9dgPt
	OXmnrOG1uv1rNzpy2v5ew2lCFFsZtqNqKXye/TYnhcGrh/8=
X-Google-Smtp-Source: AGHT+IGF34YfcXh8ZKfYGRWf52qQT9WIItnrZ/pMDd2s7/cltqWSEOnh4mIv2WeT19MpWQzzXf6R2A==
X-Received: by 2002:a17:906:1807:b0:a26:e492:da8f with SMTP id v7-20020a170906180700b00a26e492da8fmr2474055eje.176.1703945495458;
        Sat, 30 Dec 2023 06:11:35 -0800 (PST)
Received: from [192.168.199.125] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id p9-20020a170907910900b00a26ac5e3683sm8529380ejq.100.2023.12.30.06.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Dec 2023 06:11:35 -0800 (PST)
Message-ID: <240a1791-cb81-49e5-960b-9c960c0c15de@linaro.org>
Date: Sat, 30 Dec 2023 15:11:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp-crd: Add PCIe CLKREQ#
 sleep state
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20231227-topic-8280_pcie_dts-v1-0-13d12b1698ff@linaro.org>
 <20231227-topic-8280_pcie_dts-v1-3-13d12b1698ff@linaro.org>
 <ZY7BqLJZ0btpuL4b@hovoldconsulting.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <ZY7BqLJZ0btpuL4b@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.12.2023 13:55, Johan Hovold wrote:
> On Wed, Dec 27, 2023 at 11:28:28PM +0100, Konrad Dybcio wrote:
>> The CLKREQ pin should not be muxed to its active function when the RC
>> is asleep. 
> 
> You forgot to explain *why* you think this is needed.
You're right, I was in a flurry of patchsending..

> 
> Note that this is only appears to be done for one upstream Qualcomm SoC
> (msm8996) currently, and that, notably, there is no driver support for
> actually changing the pin state.
Please see my reply to Mani.

> 
>> Add the missing pin sleep states to resolve that.
> 
>> Fixes: d907fe5acbf1 ("arm64: dts: qcom: sc8280xp-crd: enable WiFi controller")
>> Fixes: 17e2ccaf65d1 ("arm64: dts: qcom: sc8280xp-crd: enable SDX55 modem")
>> Fixes: 6a1ec5eca73c ("arm64: dts: qcom: sc8280xp-crd: enable NVMe SSD")
> 
> So not sure these Fixes tags are warranted either.
Agreed!

Konrad

