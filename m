Return-Path: <linux-arm-msm+bounces-52173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A58CA6BAB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 13:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE8C9483D1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 12:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7025E1E98EB;
	Fri, 21 Mar 2025 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PylM+OmA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CF9226CF5
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742560158; cv=none; b=ZPl6Q5g1Yd149RXJrnRtS7VypqfhHJos2Tep2aJw6VCQraDyrcgBx4+rYXJjnhQuXwUVxxuDDPWIhabbfT5lrF9FZY2i4UXmzU+QSRHp5zqVzKvQ2sKMPMwBye8zXyABM74dsjPNnpc+ffIuHZSH3dkXaBgHxqmaJ86F41S5byU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742560158; c=relaxed/simple;
	bh=rVnQZXzA6JyIyOTUd7XuexNwWQ+JpNN7mt/BrTRTsVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQDwJe6iCcz4xiat3CMKUwjTMglWYt0lEl/5DROUPs0vsk0qNkK1WqeR6j7V7Yj/tzamODUzmbwq0QdVtHb7bneJsG2uMK9mYLbAnxFPCMxNjO+P3Lf6Ld8ilbd3jGDAJ+uUd2Dt4TrVVPf8dho0qf2HPpkSXPASxpIAop7w2b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PylM+OmA; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so1556866f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 05:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742560155; x=1743164955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3SbkmY/ZqJcTj/0FuWSzOs5OjdIbM9VrnkM1LTgh1k=;
        b=PylM+OmAE9PCm3Tcq1DmejBitqz3rSVDqWvS2+bvHjo98lkHGa+4hZnSzTWdX0qupE
         6rOSZRGk/g6r1+tz+RCcm950UcCVP9J66v32S+X79KEsYBqZhdb6urXm0vw/Mtz9lZFm
         G/CP3+fcOKvWI5k/5eltvrbg3rbXRL560ap9UhVskDfnQLo2kvUBPUau6HVaZafwWzWI
         vn0LFCcVkvlzbpwayU+OwG6oPeD4wzjw9fJFX1drprYK0Wc2qECIi17z0SMIpXbeNTpF
         c23lue4e5/c9MAdk+C0s3sVLsWPPiUT7y2hy+8v1OXbqMonMzJeU/dL48WzG0uedT2eG
         3J0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560155; x=1743164955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3SbkmY/ZqJcTj/0FuWSzOs5OjdIbM9VrnkM1LTgh1k=;
        b=ji1LwBNRTrWMH9kwFDJoU9jibDmIJu2WVG6lNZ2RM/Vjkn0MkaxwrrXOm3thRz3zc/
         1cyrzbE+G3CMmdPp2pUQMfz5m/SwoVFsPs10rYo4JoCUV2w3TfV8HHfhzKhlwgSTfsgo
         SBDNI6YNFFi/YiU86P/aHDH+aUwzmna8arpYmmj4OKIurLsK+gefguRDdWEUNcn9MOUi
         K+vJ8Y5DtFQqPv6x4Mf1WYRuTd+jjodwyPV7MOsTq2SPAqmb6JnKm6CZ/Wiw7mZUUD9c
         xfCQW8brnwWiKqnH8eZvEJRYSrZbhsFi3kN7+q8s9NeyZLrmEPVerfBtXsRJeU03De7r
         5RWg==
X-Forwarded-Encrypted: i=1; AJvYcCWz5AsCztiQ2uUus9sqt6V7rrZuHWHDTmvt0MZiMUUTgeLdVrhHEd79sGQ5Ut2yquZO2PeP3cAFL/toHrXu@vger.kernel.org
X-Gm-Message-State: AOJu0YykNveM/mfJfIJTjozfQ5M6uyAnknfIZyG/QkEBESrv0qS47Qz2
	jSa33Tkc6eykZYgt+CekaHmVbwO30f46BkIVu12FaeNvTWh8XD6w00184jsiU/o=
X-Gm-Gg: ASbGncvns32aCvUHJ0qJ4OrVmi2l347vCCTUEdfvzANXY1x+5R29XV/Sxre8ibmLcTh
	A3H8fn4WfcMXJWmM2tj5rW1fPh2T5aPVB+r0kO3Z2VJ/9perzkIcEuastQ2UIZ1X8bvl0TlmbIr
	chn5MKUe8Q3tdwT3ertnQSu+rpo7X7FI+0KJw49cf7hqpLogQYc31XaxjdXAYCSe6KwmXXHBWpV
	kvSqSf6XL7Kw0NDM9bCpxLvFkneCRFiujaT1M+yxg6DuDuwo1x1B5x1xMVQNOXDRj9Ls9HuH0f7
	R9vxZlQVjahJFNPlVHNdKOIsppRmNrNtL+kkhsP7mbyrwk7vAx8gI2fN7TNhrMw=
X-Google-Smtp-Source: AGHT+IFBZoh/8u7yI73Eo6y4FHWJpjFIM1ekg9sKkOS3yKX2k4UHIdny93pk+Zu+zSOxe3lYxYq5TA==
X-Received: by 2002:a5d:47c6:0:b0:38d:d371:e04d with SMTP id ffacd0b85a97d-3997f937cd7mr3013030f8f.34.1742560154684;
        Fri, 21 Mar 2025 05:29:14 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3997f9b25c9sm2225387f8f.42.2025.03.21.05.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 05:29:13 -0700 (PDT)
Message-ID: <c276c310-c6af-4ee6-8635-73430aeb4bbf@linaro.org>
Date: Fri, 21 Mar 2025 12:29:13 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] ASoC: dt-bindings: wcd93xx: add bindings for audio
 mux controlling hp
To: Krzysztof Kozlowski <krzk@kernel.org>, peda@axentia.se,
 broonie@kernel.org, andersson@kernel.org, krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 johan+linaro@kernel.org
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
 <20250320115633.4248-4-srinivas.kandagatla@linaro.org>
 <e2dc0587-28c1-4294-9bce-e18952ba645d@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <e2dc0587-28c1-4294-9bce-e18952ba645d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/03/2025 09:29, Krzysztof Kozlowski wrote:
> On 20/03/2025 12:56, srinivas.kandagatla@linaro.org wrote:
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
>> index 10531350c336..e7aa00a9c59a 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
>> @@ -23,8 +23,13 @@ properties:
>>         - qcom,wcd9380-codec
>>         - qcom,wcd9385-codec
>>   
>> +  mux-controls:
>> +    description: A reference to the audio mux switch for
>> +      switching CTIA/OMTP Headset types
>> +
>>     us-euro-gpios:
>> -    description: GPIO spec for swapping gnd and mic segments
>> +    description: GPIO spec for swapping gnd and mic segments.
>> +      This property is considered obsolete, recommended to use mux-controls.
>>       maxItems: 1
> 
> 
> Assuming intention is to really obsolete/deprecate, then please add:
> 
>    deprecated: true

Thanks, I was looking for this flag..

v3 will fix this.

--srini
> 
> 
> 
> 
> Best regards,
> Krzysztof

