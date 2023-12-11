Return-Path: <linux-arm-msm+bounces-4204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE5280C700
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 11:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB06F1C20996
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 10:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774422577A;
	Mon, 11 Dec 2023 10:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pIbMGNa6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02752D6
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 02:46:41 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54c67b0da54so5614519a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 02:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702291599; x=1702896399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjvDfi/cuWO6dqNzkqRQalH8N/rXJAc3rgskfrO4N00=;
        b=pIbMGNa6teEwV3edSwIw1WxD+f9yotj2mUeuiXy+wH5b6S8ynSEEVFkdSI1L71IFg0
         TTTbSQfpCHirethyMkqbfXn/cHxJYq5F2uohPozlAl00mj8rvpWt0n6KGgPbQMfHk8s5
         oqz97pekI7ntGDdPdkbTZVCD1bvgma7SvAdxgCEv2cF2UiFZTMIYcGyn163UTS+/DDDb
         iCJWEF6bTZ5CXqDXvOUWtMM7bcMT1llhnZQYIZGCMw2BQd5eoJ+iej0c82yfyXtT9vjZ
         8iPqrV0uofh2l3tshquVeQOio6R87VOCt9OC8kg/LeO3FQeWb5DBEor39NYWjrAvKFEP
         c4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702291599; x=1702896399;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjvDfi/cuWO6dqNzkqRQalH8N/rXJAc3rgskfrO4N00=;
        b=EFEg9WV1IedYI/JBM3bd1VKepKw00N8yotdl8PHH+ku6eqKJmQRqFWPTlQJ7jrptPB
         4RWvwJWBf1ZRtxf3HOyf22uCRqemuBkqLLiisBXcnfuBtLlG5B2KO6HiC03eq9wo1sOn
         jIBXg41ui+o/3VaISh/qwTt6V/BVFcKiHwjoB3gxWtM/N3XGm1NOXXQfUWiNzS3ZAgYL
         jH7s1j2/dlP3G/CuYSxhzzASkOgHlIgRheDcHuCTlFUOO0qDXvAbcj3OjsgGzHx379Xx
         7Ykw7PWcsFSIXGL4puHVOccV7OXPGlhdePhVKKEK/3Q6P2jEaqH0dPanYPiF7hMm2+yP
         pAuQ==
X-Gm-Message-State: AOJu0YxwUwc6DLVYH+7R4rrku2rAZ/3hcTPwem9qMvPQDpZq2BJNoMUT
	u3WIAKi/cplRKaSk7lZ1u7ilEQ==
X-Google-Smtp-Source: AGHT+IG1/X88ByefGaiYhe59oVlonj2gjYGsu9RPVcE3s6teuX2e+miyDO6ItaqEXF0gzCB8+WqQJQ==
X-Received: by 2002:a17:907:2d8c:b0:a1e:7770:2c7c with SMTP id gt12-20020a1709072d8c00b00a1e77702c7cmr3025387ejc.100.1702291599498;
        Mon, 11 Dec 2023 02:46:39 -0800 (PST)
Received: from [192.168.36.128] (178235179179.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.179])
        by smtp.gmail.com with ESMTPSA id cu12-20020a170906ba8c00b00a10f3030e11sm4619393ejd.1.2023.12.11.02.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 02:46:39 -0800 (PST)
Message-ID: <730b81ae-1fc5-4d23-9a18-04d41e40a579@linaro.org>
Date: Mon, 11 Dec 2023 11:46:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: qcom: stats: support SM8150 platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20231209215601.3543895-1-dmitry.baryshkov@linaro.org>
 <20231209215601.3543895-3-dmitry.baryshkov@linaro.org>
 <48a7c36e-2fa2-4be6-970d-a4a301fdf8f7@linaro.org>
 <CAA8EJpqw+hC05QP1mWkA-SsKEehjp7ipb_HzUW2nyWjqZ8WkXQ@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAA8EJpqw+hC05QP1mWkA-SsKEehjp7ipb_HzUW2nyWjqZ8WkXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2023 10:43, Dmitry Baryshkov wrote:
> On Mon, 11 Dec 2023 at 11:11, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 9.12.2023 22:56, Dmitry Baryshkov wrote:
>>> On SM8150 the RPMh stats have 3 data records, but no DDR sleep stats,
>>> which demands platform-specific compatible and data.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> I don't think it makes sense considering the driver could detect the
>> presence (or possibility of presence) of DDR stats at runtime.
> 
> No, it can not really. We have safety nets for checking the offset
> value and then checking the magic number. But I'd prefer to be
> explicit here. It's not that the 'invalid' data at this offset is 0 or
> ~0.
> So, I'd prefer to be explicit here.
I'd say we're quite covered:

if (ddr_stats_offset)
	if (offset is within the range) // your latest patchset
		if (ddr_stats_magic)
			if (entries)
				"show stats"
			else
				"show nothing"
		else
			"no ddr stats"
	else
		"no ddr stats"
else
	"no ddr stats"

Konrad



