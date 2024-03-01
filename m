Return-Path: <linux-arm-msm+bounces-13127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF83B86ED08
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Mar 2024 00:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AEBF1F236E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 23:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323155F479;
	Fri,  1 Mar 2024 23:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HCOJ4EJA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5015F465
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Mar 2024 23:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709336893; cv=none; b=cqtJ3JPXguDGm3Al4AALGjiREW4hlYRMR4GuIf6yVW7i7/FTOGDSnQu0iftMV24x6oLWtFm8Agej50nh/LvBfEO4njHlu4vR4p5AqNvXkvmjaeH9dNX1GAgPLLSB54mQvzBXudpS/lpP5pI8mpm2dbt1rWzChse1rSkPly3LTcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709336893; c=relaxed/simple;
	bh=0/UewJ/LBSmQei2d9PD2fsivvU6tZqw9TcfvfI79dfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGhvoi9Q7B9qb1RrE/kxZsv9SFKZiHigpNH1OGsU0LmrPtA5X/Sm0/tURvag67JVBTSMacKdblGM3NbP3RqZ8LnmEH4JL9Vuged1r6IddjfpNWW8rCUGUoV7ZTyyD8rmZXzxV7ReP5SunOzQwId6p/NJaWbZbBqNAtk0K0NdRFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HCOJ4EJA; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a44628725e3so308807766b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Mar 2024 15:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709336889; x=1709941689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nW/0Ui52ofPVYcBMMFp0Lp3ZlLjOVfxV1T3jeVoBSmY=;
        b=HCOJ4EJA5VCUPvjjdJGxk+Rs6UlLt1V0V9A5k+SwJWelBkvLbIL/BaYs36hXxhjuxa
         8Y6PnjUIQXaByQqP4+inhKgAEuoRDnUYRQfeQ4w00rU1xoOxK6hxel1l65OwCOEruL+o
         ISjaCVSFqheYt/5G4/wapkbSxi901zEWCxXNjL0Kt+JvAzGiNCDsSOa1U8smrrDs6zmR
         ubfi2huyolaOx6Z55HKRZRc+cQbDT+lVMPEAa9TCs4LAMo8bXzQqw+eoVGls6oM8rAvr
         lB6tivgBMt88P6VzV40aftzUj8nBPgTfqjq002FBdMeZd7/9cSze9fTDtTACOJpnuM/X
         +Jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709336889; x=1709941689;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nW/0Ui52ofPVYcBMMFp0Lp3ZlLjOVfxV1T3jeVoBSmY=;
        b=t8BzqEJTZCFsD7x8gyWFZlqNQviGLneC2NQasLXCYaT1VlXA9PR/1Q0joVTaGwn66M
         sIma+AZhTCM98+V+G0IulRSrkBCeE6QHtwT3rlHXoD0OmAx6lGrtBIrxMXrrAVwXG5lu
         iesmkIwDfN1pl9rLQdtlIQ/zZ3DeHYGxHm1Wcrd8kuLZfW8NxrxoK6qBWrgqCoTeADXo
         Ctdp6b8MCazw+S+eA9chwpmbb4djEKUbQUJ+bqkODxLhibGJhMWB8kSXFEBHHFqD0UYz
         AHihyWs1Y1hVgQHdMFn1hbA/O3QkOVeB3Zb4EhxQO0XZChQDzkb+AvmNjoavPQXSqfgZ
         2Tig==
X-Forwarded-Encrypted: i=1; AJvYcCXn/lr7f17XZqi2TEBNvkYGyW0VfMi8ZMgcwtxrtuFkubZ8D4EtyzYbJOjFaWDBj1mwtd/If8ldkX8J8IDRpd3wtLMt1pAaDdU5df8Q/Q==
X-Gm-Message-State: AOJu0Yy82DfPSm9n8zFgG0Jpi6cZPpddRw+O2uNXn08AJYkTBlSisNQc
	g9Y73iqHgLb9Bn3DRsaGhaRY+0KI9OUtipTROJQxJ5an8dB7c7EhP6Bb7e0pcok=
X-Google-Smtp-Source: AGHT+IG7qIq5LG4xOshv4xPvBpBWyuxAIJBk3Gwp+Myf/v0aJdATjNBRVceiH5eQ9iWevGyboZ8oIA==
X-Received: by 2002:a17:906:a3cd:b0:a3e:42cf:f6ae with SMTP id ca13-20020a170906a3cd00b00a3e42cff6aemr2016196ejb.19.1709336889121;
        Fri, 01 Mar 2024 15:48:09 -0800 (PST)
Received: from [192.168.216.32] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id mc18-20020a170906eb5200b00a3f28bf94f8sm2147996ejb.199.2024.03.01.15.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 15:48:08 -0800 (PST)
Message-ID: <59e9aebf-e27d-4ea8-b798-b019ea1d57ae@linaro.org>
Date: Sat, 2 Mar 2024 00:48:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: alpha-pll: Fix the pll post div mask
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240229-camcc-support-sm8150-v1-0-8c28c6c87990@quicinc.com>
 <20240229-camcc-support-sm8150-v1-1-8c28c6c87990@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240229-camcc-support-sm8150-v1-1-8c28c6c87990@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 06:38, Satya Priya Kakitapalli wrote:
> The PLL_POST_DIV_MASK should be 0 to (width - 1) bits. Fix it.
> 
> Fixes: 1c3541145cbf ("clk: qcom: support for 2 bit PLL post divider")
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

This makes sense if 'width' is what it says!

The change also has an opportunity to fix a whole lot of bugs..
Please add `Cc: stable@vger.kernel.org`.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

