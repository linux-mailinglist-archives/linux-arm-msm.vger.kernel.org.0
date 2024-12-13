Return-Path: <linux-arm-msm+bounces-42003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A3C9F0BB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89D9B1889352
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD371DEFF1;
	Fri, 13 Dec 2024 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="trhYqVBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D38F1DF276
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734090905; cv=none; b=BK5W1UthuRKfMGNB3s9d5BMOfoJ1U60HKA2r5aNna0BMgn6tRDNVYEqjOjGTTfEou9NDrpYAkJG85uEje2fpX6JU/LvK7ElgPSzwAGXTunDQ6OGWTKDolh9eAEkx4Px756uiCyi4Y/dZadgklwItygBspu3ml0BnQEJS0AN9pSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734090905; c=relaxed/simple;
	bh=cm5icUi+sGrOEhIGQ1zzIb3GehhAkBun86ehhroxOkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bex4jfiFdnLl6dFjLpFrSjxS8BMTsqu4PWeyrCXKWWGFHunfGTSk5bbXxqKLl59bO7pUJRRLMnSnZvGjMJtW4DGGNKZvU3VZPPt2Bnpijaogau4fecpqzkgQdGAm+tcDm52Womrcq5/h+iD+MMjKDz4s3W/O5oxvR4iqY5E7YOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=trhYqVBU; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30224cee64dso737541fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 03:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734090901; x=1734695701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2F3dU7OsF77ENdouZE5VjBEoGAwdDiEqe/G1nbxNLpk=;
        b=trhYqVBUkmMfN2kG1osEhNbww1Gu7a3EV34B339p4IRX8ZlczOWUX0peFPbWNbX1ia
         zLR32uEdDx099B852sbHC1XztZFJF3shiqZSXKexo5xEGmCDfbF0EuWTg5kibrpPrmw1
         /EuVvxB2JmIhtBqY5fB4u0x6JdiK8o0umlnHGztn0qZMB1bLCaQ5BaaTw6xKoFXi/+p1
         +2VR+Xy0m0IgVsWFNxdytgiLi44Bhuod1BY9V+PZ10WLEYPlWOjB1E5DKqbvf5YAVvdY
         8+sw572STWXXcIACzgyO/uWPrrHLnU4B2M+W78Y8t0cngh7DWoxFnFDpHHfHJK8G/fC6
         azOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734090901; x=1734695701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2F3dU7OsF77ENdouZE5VjBEoGAwdDiEqe/G1nbxNLpk=;
        b=uUvoYw6SplRDeGkl10WbJ0EUvpJ52G5fBevVwPETMBfKvJfrhuRQnKNfRMHYc5owZA
         uOoCLvrvCVAbAwKVlVcxWQhWjrA/YQYNKvYgs5ril5qkdvOLMIbi620OEe5OA5GV1lfQ
         N0zLjc4kLyK6WVzuHHMdoRIOOi/IsVaHlpeNx5h0kp+fSiDMsCikx2i2/jR7nf87sv/G
         ftefuT3lqgUecjXJNeIuRYIwzs6UUEe7NmZFQ2fj3vuNuRIg/995fXHVwaNLVmIlD9UA
         VeqnagJFoemjaSy2En8pon4pLQpszqCzFt6LTepfbNqRWMONi7nkEMvhY70P0RSlhsMM
         wsMA==
X-Forwarded-Encrypted: i=1; AJvYcCV3A62oNyypm5/wJf5ag12ykthIptvRO09xozPE5L2/KqDShbFkoZfPV1bS/ELtdzdDQRZyEXFKfztCZP6u@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8FBZdWz0guNxX/10gx0kZrDDqeiQhdbj8qdWK4FgxqSGVrXMA
	hd5r8y4e+AmNTyNbt9ztDaauZ1ZnYZ9neTuiOJjSrKvD1imH/BiTe4jZZm6tpn4=
X-Gm-Gg: ASbGncuUh3pdJs+7IjM/r5yTAFDtSBoEpU0hEfSrXEBycB1PKEJ/wNuHwhuESf7qPbd
	mozRBrtOBOYG0KVVbfLwUDOG7OxNqX+2u5uWXu7BPAM9L6ndQuPV8ZE4leFfSG6AXxsarRMHVkT
	Jjs7Hhk64pxbriSAs2tzaXX5H8VqSI4J1gQizUpD5LKOfUuWcOFkmWcUrfM0GD1dDKUXd8aSEJa
	Zx2/BYooQVIPZi13UiKaolbJ/rOOlon06UG3TN1Ulea70p4jKF/CYVZAYwmJnNMGeBnmpFEk9O6
	0zj+UPW4fLvbqI2ZI4Yyg2kd8ntYlUltSQg=
X-Google-Smtp-Source: AGHT+IEw9CbAiCn1zybvAh6eWtC/7CZTeXbl9zppPNXp3e2y976kH/LkaKh1sfGg5XjVH3qSYyz7kw==
X-Received: by 2002:a2e:b954:0:b0:2ff:bdef:88b5 with SMTP id 38308e7fff4ca-302544ca4b6mr2241771fa.12.1734090900693;
        Fri, 13 Dec 2024 03:55:00 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-302292959c0sm13482671fa.94.2024.12.13.03.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:55:00 -0800 (PST)
Message-ID: <244ab38d-762f-4860-b38e-51b08389ee6a@linaro.org>
Date: Fri, 13 Dec 2024 13:54:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: media: camss: Restrict bus-type
 property
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Barnabas Czeman <barnabas.czeman@mainlining.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, David Heidelberg
 <david@ixit.cz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <20241209-camss-dphy-v1-1-5f1b6f25ed92@fairphone.com>
 <nqggstwkytqxpxy3iuhkl6tup5elf45lqi3qlgyv6eaizvnfdr@2uy57umdzqfa>
 <e4bd515a-eb98-4ea1-8d73-4ba5e7c9b66e@linaro.org>
 <D6AJ9U23ANWI.1DLHNPU5A6HQ4@fairphone.com>
 <d7e3076e-5b32-4ab8-afe8-f52458769f23@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <d7e3076e-5b32-4ab8-afe8-f52458769f23@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 13:34, Bryan O'Donoghue wrote:
> On 13/12/2024 11:24, Luca Weiss wrote:
>> On Fri Dec 13, 2024 at 11:50 AM CET, Vladimir Zapolskiy wrote:
>>> On 12/13/24 11:34, Krzysztof Kozlowski wrote:
>>>> On Mon, Dec 09, 2024 at 01:01:05PM +0100, Luca Weiss wrote:
>>>>> The CSIPHY of Qualcomm SoCs support both D-PHY and C-PHY standards for
>>>>> CSI-2, but not any others so restrict the bus-type property describing
>>>>> this to the supported values.
>>>>>
>>>>> The only exception here is MSM8916 which only supports D-PHY. C-PHY was
>>>>> introduced with newer SoCs.
>>>>>
>>>>> Do note, that currently the Linux driver only supports D-PHY.
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>     .../bindings/media/qcom,msm8916-camss.yaml         |  8 ++++++
>>>>>     .../bindings/media/qcom,msm8953-camss.yaml         | 15 +++++++++++
>>>>>     .../bindings/media/qcom,msm8996-camss.yaml         | 20 +++++++++++++++
>>>>>     .../bindings/media/qcom,sc8280xp-camss.yaml        | 20 +++++++++++++++
>>>>>     .../bindings/media/qcom,sdm660-camss.yaml          | 20 +++++++++++++++
>>>>>     .../bindings/media/qcom,sdm845-camss.yaml          | 20 +++++++++++++++
>>>>>     .../bindings/media/qcom,sm8250-camss.yaml          | 30 ++++++++++++++++++++++
>>>>>     7 files changed, 133 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>>>>> index 9cc0a968a401836814560c1af3ee84d946500b4f..3de2a3d2b5b761106975aab65ff614b2ef579ef5 100644
>>>>> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>>>>> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>>>>> @@ -94,6 +94,10 @@ properties:
>>>>>                     minItems: 1
>>>>>                     maxItems: 4
>>>>>     
>>>>> +              bus-type:
>>>>> +                enum:
>>>>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>> +
>>>>>                 required:
>>>>>                   - data-lanes
>>>>>     
>>>>> @@ -113,6 +117,10 @@ properties:
>>>>>                     minItems: 1
>>>>>                     maxItems: 4
>>>>>     
>>>>> +              bus-type:
>>>>> +                enum:
>>>>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>> +
>>>
>>> But is it really needed to specify the single supported bus-type?
>>>
>>> I believe it is not, at least it's not ever done for other media devices
>>> like sensors.
>>
>> Through video-interfaces.yaml 'bus-type' is already allowed but not
>> restricted to the values that actually make any sense on such hardware,
>> so in my opinion this makes sense to have here.
> This is additive not prescriptive.
> 
> New additions should include this bus-type number as we will need it
> when we add CPHY support and the subsequently move to the PHY API for
> CAMSS PHYs.

This particular reason is invalid IMO, since dtb changes are not relied on
drivers and shall be kept agnostic.

The open question is if it is really needed to specify non-variable
bus-type property. As I've said it's not done for other media devices,
so that's at least the established policy on practice.

--
Best wishes,
Vladimir

