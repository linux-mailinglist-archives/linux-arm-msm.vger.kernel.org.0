Return-Path: <linux-arm-msm+bounces-19054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 949C78B88B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 12:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E831B220AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 10:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D3A54675;
	Wed,  1 May 2024 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MizIcAJK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA4353E2B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714560149; cv=none; b=ZEqsSgezuBekEQlXFoxUof0WsqFplN4sTMlOfT0WTxgtQXnwdhkpdXo2ZhWgdff12m7VsZIvPec6hvMiguwoEXLV/Uy8jdwPNpXWA7ubOIwefVfcBhmdCFzS2C137m80nUyHezuPkaLBWnSwq5oLO0sPpPMxfqC37cDA9cHYrLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714560149; c=relaxed/simple;
	bh=KqP//zXSMMYwMX07TpkYRVKV5evikdqY7eNayjNM3O4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2ehozxx4I/UFjHq0gcV6JxyOpR1/tIfID4w/BYFU40XVzx/E0/ghT08OJB65eyeE6MbqYbHzryk+lkwy9hNNsbD36kj2JHaG04jfVuIlX9GpWjJ8JszvzL/LW17BvVoT5s30GGV/KzHIpy/+HenqlMr95PDEEVoBhGuNDxpyt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MizIcAJK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-34d0aa589a4so2033219f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 03:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714560147; x=1715164947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZRLL+HB9HbIggjRHEEHhzaeeMPBAxxAanvwH2etHPw=;
        b=MizIcAJKmaASBueLClj8FAc+gDju1oI7Opx5yOc0rODnVSXv4WEB3M2yqNbvm4hkZQ
         au7z++tMtRDmpLSH9tIXDQCV+Z0L2Iaosr5Oxdqy31ku6z3wPJ3Q4jeG91tV0scTVmph
         udaAq0mHx+/Ee4U6ooczCmQDDfMaGi4TRNZyWw7ynJz8QoXv+aevjiQlKMOiVQo7/LSp
         8YSOLnolzj+6kramRzDaf91olnk5oOmOTTqNOEko3ID220NXiUN9PTd6MfkWYzF65IzO
         MAq9PL49NO8IRz1gbe7D3nzLsumwBhMLkSC27ygR37If2F4im55XGNtFZo7YzQmaCq3e
         zOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714560147; x=1715164947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZRLL+HB9HbIggjRHEEHhzaeeMPBAxxAanvwH2etHPw=;
        b=r+PHg0Oyks6+dDXHkehJOv/3ul4P9b9iucjn+DPAYMgdINTbYYQLfyz7jThkSQ94OK
         Qjctdv5pfTfmF4F/mZjK7JqXLWU7+C/5C/pO4FNx+trtKZnTQKm0o/619yLk1j2A3rDB
         lKVZ7u4emPzQ+2iOgcgQZ7TF664NrV48C56P5SIj1pNi1uAhdBiWGUIRyHObr6dMO+Xb
         h4qk3fWk8Sk963IUgPnWbMPnuejIRyZ+MN3k4Vnd2qxISa8ckUpT7hz/oUDeZfp5Sc8I
         ySJ1vO1LRFQgR3y5NVC9p3qLDwbwDo2fcNOak71jhI01AdqOp6sRbhdb4ioS9L7OMXJd
         M6gA==
X-Forwarded-Encrypted: i=1; AJvYcCWpblb0byeI2GPvsBciGKOfvIeZxCAJdqM4xXxqPhOfalQ2hbYALWTfWR18RB6IucO1f3udopdV7e0F/Yyl8lWdbB0qLR0zXMMYY43TuA==
X-Gm-Message-State: AOJu0YyiPnqsS1DPsyOAaC1KJgWrD6/smWHP2FZYMzGpHOVNeVoBCh4D
	srcMh7E4xreSfhVLD4XCyZ5nTWNxvIZVgLiRO4YbeIdVqiexcHQhzAfn33ieBts=
X-Google-Smtp-Source: AGHT+IFDZK3tB64O9qe5N4VAS8EvYDgaowjyHbKLOl+cnO1NcGhqlxPVfgFSDsBWmT8uyiiMd8d/JQ==
X-Received: by 2002:a5d:4845:0:b0:34b:b50:3689 with SMTP id n5-20020a5d4845000000b0034b0b503689mr2082402wrs.10.1714560146874;
        Wed, 01 May 2024 03:42:26 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d43cf000000b0034da966c3d8sm2560538wrr.16.2024.05.01.03.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 03:42:26 -0700 (PDT)
Message-ID: <d1e755b7-b6f8-4e59-a1af-1a5f692c70a4@linaro.org>
Date: Wed, 1 May 2024 11:42:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/8] dt-bindings: clock: qcom: Fix the incorrect order
 of SC8280XP camcc header
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>
References: <20240430142757.16872-1-quic_jkona@quicinc.com>
 <20240430142757.16872-6-quic_jkona@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240430142757.16872-6-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2024 15:27, Jagadeesh Kona wrote:
> Fix the incorrect order of SC8280XP camcc header file in SM8450 camcc
> bindings.
> 
> Fixes: 206cd759fbd2 ("dt-bindings: clock: Add SC8280XP CAMCC")
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index fa0e5b6b02b8..bf23e25d71f5 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -14,9 +14,9 @@ description: |
>     domains on SM8450.
>   
>     See also::
> +    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>       include/dt-bindings/clock/qcom,sm8550-camcc.h
> -    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>       include/dt-bindings/clock/qcom,x1e80100-camcc.h
>   
>   allOf:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

