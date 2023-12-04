Return-Path: <linux-arm-msm+bounces-3234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF71803195
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 12:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05F3E1C203A3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 11:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB2722F02;
	Mon,  4 Dec 2023 11:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5mV7AdT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3ACCF0
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 03:35:48 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a00c200782dso597410566b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 03:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701689747; x=1702294547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lKw30wabV9RDC1M3FU7Q361J3G01Sj0GwWGP1s2QAhg=;
        b=o5mV7AdTy4o3BOaoFeXIlLwqKZu9F85PZhrtIOY18/qPajH46yXvyRPYlk9GMt7Qpm
         NeYMb1/C932JjCZeuHxGG+YjAJ1yVzS6xQWB9q7Yfp+lvhcofatRpotHbtaa3tU6G2R9
         i4ecfaU5cK7hPFJaQtgGDv2WPmvnkn3y2Dj4u6fUnd5bD4OMKHNP2Pyklg6AWNNjGVXH
         BPMeFRYt/mO9Ej4K/ianRWBk+9pH4S48vDGYtndfr2R/avI+ngRjHCmbUliwgICyaTfA
         OvoZ1CaPUZ74rMe0/QBb/bCbrRfSKC8657AFO2gARCFhBwuy931lUK6UHd35kYfNNZnj
         /ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701689747; x=1702294547;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lKw30wabV9RDC1M3FU7Q361J3G01Sj0GwWGP1s2QAhg=;
        b=okFOtcZdxVdQM4VMc6+7dW6IZbAD8i1nBUP1Q6apSlXzz6QeyA5/KmSLVBj5gGjIPi
         caVgFMY8k7DvGS91PJUQN0KJYHwQXlx3YfuRF5N4x041HuRW2X0Pu581U73A8U4XJaXb
         ucT0IfX8Op5qH9FR/UzixMMAv6l39bJh14a9RtAN7XXxT29p4HK5nWRJcvgEHQ4qhLT/
         55AfKGjbaSxQylCV46RuNYLY7LwPasq455aVIo2rxukdMqmcSIjB3LeABoGKMDxaX08M
         onQ4lZo4ysHFzwuY9VBk5cjuU4aZiJ35ayAy75VtpVnfjThDpMvY7sbieN+hKqlqT1jK
         xypQ==
X-Gm-Message-State: AOJu0YxValyvktwA4dzOnkJengTYcf4shbodkUjIQrL9bzYTMNP5Jnax
	YhWgr3+MMGCc7MSAtvt672Bffg==
X-Google-Smtp-Source: AGHT+IE+DwtiyYhlL+cy0lkib4e4DN8vfBr16OgFrPelrdOA7LaOAr9wJh3ZY6/2f33WN/s+MmBbFA==
X-Received: by 2002:a17:906:1096:b0:a19:d40a:d20c with SMTP id u22-20020a170906109600b00a19d40ad20cmr1402481eju.216.1701689747343;
        Mon, 04 Dec 2023 03:35:47 -0800 (PST)
Received: from [192.168.209.83] (178235179097.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.97])
        by smtp.gmail.com with ESMTPSA id gs20-20020a170906f19400b00a18374ade6bsm5190690ejb.67.2023.12.04.03.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 03:35:47 -0800 (PST)
Message-ID: <31914a93-27ea-456e-b502-903ca806bbbf@linaro.org>
Date: Mon, 4 Dec 2023 12:35:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: qcom: msm8226: Sort and clean up nodes
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Matti_Lehtim=C3=A4ki?=
 <matti.lehtimaki@gmail.com>
References: <20231203-msm8226-cpu-v1-0-d18e83340b32@z3ntu.xyz>
 <20231203-msm8226-cpu-v1-1-d18e83340b32@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231203-msm8226-cpu-v1-1-d18e83340b32@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3.12.2023 23:38, Luca Weiss wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Quite a few nodes haven't been sorted correctly by reg, so let's do this
> now so that future nodes can be added at the correct place.
> 
> Also at the same time, move the status property last.
> 
> No functional change intended.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> [luca: add more text to commit message]
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

