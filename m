Return-Path: <linux-arm-msm+bounces-17233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063E38A1458
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 14:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACAC12840B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 12:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA88014A603;
	Thu, 11 Apr 2024 12:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fs65TK7c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074B4149C75
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 12:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712838094; cv=none; b=cDgm0h4JtW0z6P3UQ7F2HCpAs7bj9lNi5jLjWV3Yd3YicYqkkzmRWDHKQT6HDWVQW6ZR/pAle0PhluhKZfGwt0tD5URhCxOaOBo9UnZ6/24TRfKe2LtiY5jz2JX2qI88Y6LGrrgVolRr6GQmJuI2H2ejJbqB3VGKCtIBAfOZIFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712838094; c=relaxed/simple;
	bh=zHf2UPOwKhqPAUHf4IDMeXXXGq8rIrMH8W8XCAOwke0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+bptIGZIsdAT22vSrTgs4CvKyQtB0IA3MXI2nKb+ABc9gqqsb5dUPVIx0+iNUBVoVa/kCjwja0jb8aNt6GJEl+OSiIo+Mfg3gIV78HCgmJZJlD/g8Hiusj2gJG7jz+Y6vZkhyD1RLyzPggRpVpciteJ5lKIpmcVCyNZKs/UY5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fs65TK7c; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-343eb6cc46bso4179802f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 05:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712838091; x=1713442891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kh1g/uh+n+SvXBwe7LtwyhGlbTwxyPzRKTm4XGWj4zM=;
        b=Fs65TK7cDys3ePxBYQMS8uvCNjIXf3GaGORZa08Im1m9fb6bzfhlxsMimdgiXD97So
         b/aA+CSJVc7wA//4NpU//lE9gCkfYNY8irevoWwvx1O2Abh4jGQWthlISEadmZ5MxwTr
         tyq7IN1lq6bw119PxaqMYcQoASKYf9lMHPGRmGiMMd7y7ZYPLUB0KH/DeOcFU6ZrU8wj
         oO08UoL41QaJA7k1r83cC1wak1uei+opgVJmQKNjIJBg1ym3nSpuks++Mt/FrLLnab4e
         vsPvQF183h8rVYU3iI14w0hdByPvz11BstQZcFzH9MO8bNSsPjGGo/Wwb9/EmkAU6jQE
         /VCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712838091; x=1713442891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kh1g/uh+n+SvXBwe7LtwyhGlbTwxyPzRKTm4XGWj4zM=;
        b=njXqIbo8FVPokRw8R/lQgKAEe6qCYt3JWnzYrkSQTeKpoe7lbp0vVxPx5mhoeTMYp8
         jp0fUxitgXYuoISQekVJa4ufxSX8w1KUy328mwnEpRWeF6LxMbN5G0/SubGTWc1W8C40
         TO3mnlAGK7ceW1PLuofGtDDUwLurFVdAkNJ761s0yBMNhrHlauTo+ibebqdmb50Ulr/O
         sw+zXWbg0OEkBzFe6yahOoJs3eQQnYhyyFz8KDyGeBVW97gjq+qmqSHZoO4vBhWrUEio
         D186HNhoLtfcALn9HUuCZsac5+xLfif7AWxKkuKMtcxcXBut0Uv2tZLwsoEJWHaiDDUF
         6ywA==
X-Forwarded-Encrypted: i=1; AJvYcCW/6o0ByXgtAqxbEMEWTrkxZyzvgivT80xnwPT/EAW6zbluS6U2BrPuwkEhVBfrgI9Y6GBc7d5Tm2xacVc/0sSES7RKj5jA4mbKBYfN7A==
X-Gm-Message-State: AOJu0Ywlcta+PzcKsDBHEqVt7uAJiXOBcWBVNk+fEMD+zFnr/huP0B/D
	/50OskUGxc7LGMje/7Aw6kZ+tK8RSIAJ0xe/pNrkAqFKuwTfV9d5EDCmWmu21d4=
X-Google-Smtp-Source: AGHT+IEjuGMWfNFQ2RmwlzRXwcHh6dCuyCwEecfbbkGiJlJuwbowxBn8PEE6OGlSZab/hPjUISQMuw==
X-Received: by 2002:a5d:525c:0:b0:343:5e64:ea54 with SMTP id k28-20020a5d525c000000b003435e64ea54mr3709721wrc.61.1712838091399;
        Thu, 11 Apr 2024 05:21:31 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id r9-20020adff109000000b00341de3abb0esm1655188wro.20.2024.04.11.05.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 05:21:31 -0700 (PDT)
Message-ID: <7098c454-6a1d-46ae-aef9-63bb9ee82c6a@linaro.org>
Date: Thu, 11 Apr 2024 13:21:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "Revert "dt-bindings: i2c: qcom-cci: Document
 sc8280xp compatible""
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Wolfram Sang <wsa@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240411085218.450237-1-vladimir.zapolskiy@linaro.org>
 <0b810e39-b82f-4cca-87b0-6e586690b242@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0b810e39-b82f-4cca-87b0-6e586690b242@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:03, Krzysztof Kozlowski wrote:
> On 11/04/2024 10:52, Vladimir Zapolskiy wrote:
>> This reverts commit 3e383dce513f426b7d79c0e6f8afe5d22a581f58.
>>
>> The commit ae2a1f0f2cb5 ("dt-bindings: i2c: qcom-cci: Document sc8280xp compatible")
>> was correct apparently, it is required to describe the sc8280xp-cci
>> controller properly, as well it eliminates dtbs_check warnings.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> Subject:
> dt-bindings: i2c: Revert ....
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof

Reversion is not the right fix.

I'll send a proper fix asap.

cci0: cci@ac4a000 {
         compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";

          clock-names = "camnoc_axi",
                        "slow_ahb_src",
                        "cpas_ahb",
                        "cci";

   - if:
       properties:
         compatible:
           contains:
             enum:
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci-no-bueno
               - qcom,sm8250-cci
               - qcom,sm8450-cci
     then:
       properties:
         clocks:
           minItems: 5
           maxItems: 5
         clock-names:
           items:
             - const: camnoc_axi
             - const: slow_ahb_src
             - const: cpas_ahb
             - const: cci
             - const: cci_src

---
bod

