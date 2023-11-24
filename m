Return-Path: <linux-arm-msm+bounces-1784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8BA7F6D19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 08:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC2651C20DF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 07:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78EB524E;
	Fri, 24 Nov 2023 07:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vZwESXh0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE64D40
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 23:47:14 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9fa2714e828so215498366b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 23:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700812033; x=1701416833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c1oqGOV3sK0okfh0VYo3enK5A8g5yVob7aq+ycBKw3E=;
        b=vZwESXh0SGoCOt7XwVDjQl3MyOIhkys8HCwqpFBWdaaHISoNTgBI8oXNYs+q9JQNUo
         2WFoOKFmSgBGfdCAmvKDLR0FejAxM+R6GZoJNKKPw0mEnChrXgeMWZHaJ11Cq8Df7IUB
         KmbIcMq3V+lIkY+y4oaanuBjaYa0Uh1jE6uhaLaM6ydmXd1x3UIwkN383atVWVsVgbJ/
         eJV9LGTOWulcg8MvlKYaTAYPy+IphT6oN7UvLb3a/Tw3BEkjqW4mgFccXDnRGGdgotqR
         l9nm6/4dZSS0vhuwtblQJXTQxueyRjE+YCOtZMcXRlFcag9N3oZ+H5AQrQdUH6HDZ3Jx
         Q2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700812033; x=1701416833;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1oqGOV3sK0okfh0VYo3enK5A8g5yVob7aq+ycBKw3E=;
        b=D4ayYelmxspEHIX7Oa165ydNgsl+6TmxTujpDFhYIqccTFZ7hjW6IdQsV0MZG2EL3d
         N9F5T6WVg59sITF+mV13g1A+x7ANfai2R1pqEqBJ8wfjcvGdZYGdpmwSH8lGEv39+0XG
         XKzRsfrt/I8XLyns4Yo67rJD9WjNuGeJFlyeTLFB+lTUYsmYFtfAsJkcsL2pwg7is0Jn
         l7kwjvVLpKek058boat4+lMdJ3g4bkfnzYlGFv0qi5kjnF5CGVMyAxZ6a5CjhzjEhV56
         UC82wkd6elIuIAChAlHCKIHouIJXQ8dMGmOUx+jRi8iXax9VK4WBDcs8/zDlBSirY8P7
         F1EA==
X-Gm-Message-State: AOJu0Yxt/BR7yGcJvuDdOTHzdNJ0M7xAiK929k8zzjlKqNgkfUMEGsW3
	kumO7hyTdyNYicBcZfrBI2t8gw==
X-Google-Smtp-Source: AGHT+IHB0ylzHTxA7oYKFiO9BheP45s0Ym7Jjc6lo6e9mfiC6QJvD0TsCwZZgTdOtm1RQCL0L3oeKg==
X-Received: by 2002:a17:906:209e:b0:a02:bc2d:e026 with SMTP id 30-20020a170906209e00b00a02bc2de026mr1352363ejq.46.1700812032887;
        Thu, 23 Nov 2023 23:47:12 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id z2-20020a170906434200b009ad7fc17b2asm1724771ejm.224.2023.11.23.23.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 23:47:12 -0800 (PST)
Message-ID: <6221657b-0c01-44cf-817c-a54bd2cede07@linaro.org>
Date: Fri, 24 Nov 2023 08:47:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] dt-bindings: arm: qcom: add SM8550 AIM300
To: Tengfei Fan <quic_tengfan@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, tglx@linutronix.de
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
 <20231117101817.4401-2-quic_tengfan@quicinc.com>
 <519b89a2-550e-44a2-bff0-a6a86c50d073@linaro.org>
 <54b68923-f670-482b-b4a2-ff5f5c867a91@linaro.org>
 <7bf18b1e-463d-4030-99cd-4fcf2126fda2@quicinc.com>
 <4eb76d38-93b5-424b-adce-3cc296fa03fb@linaro.org>
 <6e399854-40a2-412b-8c41-4f9e6b17e38b@linaro.org>
 <35dba126-0a0c-4f27-8b49-39de4d2cb797@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <35dba126-0a0c-4f27-8b49-39de4d2cb797@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2023 03:31, Tengfei Fan wrote:

>>>> AIM (Artificial Intelligence Module). This hardware platform can be used
>>>> to develop AI related software based on Qualcomm chipset. I also will
>>>> update this message to patch commit message.
>>>
>>> Does "Module" means it is physical module?
> Yes, AIM300 is a physical module.
> 
>> Moreover, does it have anything specific that makes it different from
>> a MTP/QRD/regular 8550 SoM?
>> In general, you can develop AI software on any computer, there are no
>> runtime checks for "AI" presence in the naming ;)
>>
>> Or is it perhaps like QRB5165N [1], a base soc with what seems to
>> be a fat AI accelerator connected to it?
> 
> AIM300 is something like C5165N SOM.
> AIM300 Series is a highly optimized family of modules designed to 
> support AIoT applications, intergrated with qualcomm qcs8550 SOC inside. 
> The Module is mounted onto Qualcomm AIoT carrier board to support 
> verification, evaluation and development.

Then you send patches for wrong board. AIM is not a board.
> 
> In next patch series, AIM300 AIoT carrier board will be a DTS, AIM300 
> will be a DTSI, qcs8550 will be a DTSI.


Best regards,
Krzysztof


