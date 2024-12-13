Return-Path: <linux-arm-msm+bounces-41997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 218179F0B5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E355188D05B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3441DFD80;
	Fri, 13 Dec 2024 11:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t8yg3K4H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88561DF723
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089671; cv=none; b=Opf/0OkujSm0IEoSiro9e+hLCfVqKv4WRYeSSzhtZCglugY7n/P+U/82bQyESD1Pw6n4UkFReGEhN7MNRKzGCjQ0pQk7YgR+Si1JEpHGEKdnYKZPL1ezkBa+31hwweo160DFhv2V+mMXLFdopDR1TvKVDoOrD1ojH/P23uUHThI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089671; c=relaxed/simple;
	bh=4XfO9sgRR89Q+W9l3UVT/d7WgRINh0RFlj7iisUzSSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5t0Z6v/YVuMlxoHNmI+s1nbdIbgKVxU+VXPcNPu3lLsw5aEEM9KLAoc26KY5kHszMSrVSSDlRuHqGMKv9L5+PZsUBmvh6JhsJTsUlHGF3Ij4oJ87YxWaYFp/Qul+6DosLeMXCZi2BglFYJ9Wu9+0oeTpnf54OQ/4htOUifDj0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t8yg3K4H; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso15582515e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 03:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734089666; x=1734694466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VoLSaqzOSgXTHhnrnBIXiVWZQerMmrmkF4OQm6gfaXQ=;
        b=t8yg3K4HuJOQUWWwhafEpqBrJaKiZKZmA5y1s36J0W4dUmZmLI6y0nzF0S3u5eBbyU
         thHcVU5L+OdrrnXZft4OTJK6APLOMrD7jaWmsFZvZZiPKuCTFXsk9h6NiezLuJej3QYj
         fTrLxnSXOFrlgQGNxRbrA3KuUWmqK9Y6lx64vnsvFfEuZ6aGYDwNZ0YJGQyfi/0dtdVS
         6fGEyGW7vBg3j/yLwMHqZjiRs2PIIU4wUQ+qjAR6irmZU/EowyNM7Ph7/KEky7hXLM2L
         ZkiKZldsU9dpj2bvjOPaPHH5jYUF5dd15Lv/1UzXWDk1w458WwHAQfhAXRL3DZaBJL+D
         v0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734089666; x=1734694466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VoLSaqzOSgXTHhnrnBIXiVWZQerMmrmkF4OQm6gfaXQ=;
        b=XxksxjZaAnWXHdOjEsbBi0d7IlYdg0uMnjhZkL9xWDqpWq7fNAudvhRRh2TrffFnug
         M2jOmVajrwNXYRZIk6F0a+fxl6nybeWB/1F1ZVmxlLc+LsL6Fa1QoqLeiXrMt3Vvoxuu
         zV2gc3knBcubko+UeYVje0I8KgKArYGQN7BVFYPt8f5UaXgqP102vOYiFN88Sdfu93Gp
         bzzJCygkG03L41dUIX2X8HGoO8PJ5ZyYgfq8Yjwt55FnqnaBfZwxMRPswod6+KAmG44+
         uMEDhG8hMipOJ9OaIFP/EXaBnfLbYxDvAxWqMA8OA5CtmrbVmlZHyqR8uTeE5afivxlT
         AoAg==
X-Forwarded-Encrypted: i=1; AJvYcCVg4fZktUp0+BhlWlWsdZBTPKLuFtmfmCErVkGeJaRoJqMPQ2OZeJ4A66+87I6na2dpOJWKvD04bv1cnh/n@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo83uoiBCyeSSDnC8hz9w0eGy46AS93bnDtJitgSb4NB1bdkHg
	dCy5/FlF2hqp0m+xYmzWpIFP1MYQlU55KNYVbakslEx0w6LG+jzWUsbbHTw3FYY=
X-Gm-Gg: ASbGncsoEZdn2weaYGzQRmYQzRExe4iHaOS6D6HxOTYYKzAwMJCmnMBpeA8ahkMhJpm
	hKWz3e9oR7uaDoncWnBXW7Wmt785D/o0jp3FzU7NgJIiFSL3WxSlISn+E5KKX139UKa9w8Wmqyj
	q3pjrYCeAWFvi4caZ03Xkf3UgfqF8ZHrP0CkFSGtYNHKMsmEX+qKaNZgDUcDv30/sRyOOzgVP8x
	6ltfUlbk8SrgFNc4YTaOwiRUiCXzIOyOpwRJX1g3Gf8+CvuEJngME4xPwrBCgi0jbCVew==
X-Google-Smtp-Source: AGHT+IFa8ec15w1W+mCJa8qiRjb8wSbVwQDAXu4RYHaXXbcgV53ag8xsVJvsFwXS3y/+5di8npaPTQ==
X-Received: by 2002:a05:600c:384e:b0:431:12a8:7f1a with SMTP id 5b1f17b1804b1-4362aa52e39mr20921645e9.16.1734089666146;
        Fri, 13 Dec 2024 03:34:26 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824ca9absm6818336f8f.61.2024.12.13.03.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:34:25 -0800 (PST)
Message-ID: <d7e3076e-5b32-4ab8-afe8-f52458769f23@linaro.org>
Date: Fri, 13 Dec 2024 11:34:24 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: media: camss: Restrict bus-type
 property
To: Luca Weiss <luca.weiss@fairphone.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <D6AJ9U23ANWI.1DLHNPU5A6HQ4@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/12/2024 11:24, Luca Weiss wrote:
> On Fri Dec 13, 2024 at 11:50 AM CET, Vladimir Zapolskiy wrote:
>> On 12/13/24 11:34, Krzysztof Kozlowski wrote:
>>> On Mon, Dec 09, 2024 at 01:01:05PM +0100, Luca Weiss wrote:
>>>> The CSIPHY of Qualcomm SoCs support both D-PHY and C-PHY standards for
>>>> CSI-2, but not any others so restrict the bus-type property describing
>>>> this to the supported values.
>>>>
>>>> The only exception here is MSM8916 which only supports D-PHY. C-PHY was
>>>> introduced with newer SoCs.
>>>>
>>>> Do note, that currently the Linux driver only supports D-PHY.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>    .../bindings/media/qcom,msm8916-camss.yaml         |  8 ++++++
>>>>    .../bindings/media/qcom,msm8953-camss.yaml         | 15 +++++++++++
>>>>    .../bindings/media/qcom,msm8996-camss.yaml         | 20 +++++++++++++++
>>>>    .../bindings/media/qcom,sc8280xp-camss.yaml        | 20 +++++++++++++++
>>>>    .../bindings/media/qcom,sdm660-camss.yaml          | 20 +++++++++++++++
>>>>    .../bindings/media/qcom,sdm845-camss.yaml          | 20 +++++++++++++++
>>>>    .../bindings/media/qcom,sm8250-camss.yaml          | 30 ++++++++++++++++++++++
>>>>    7 files changed, 133 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>>>> index 9cc0a968a401836814560c1af3ee84d946500b4f..3de2a3d2b5b761106975aab65ff614b2ef579ef5 100644
>>>> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>>>> @@ -94,6 +94,10 @@ properties:
>>>>                    minItems: 1
>>>>                    maxItems: 4
>>>>    
>>>> +              bus-type:
>>>> +                enum:
>>>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>>>> +
>>>>                required:
>>>>                  - data-lanes
>>>>    
>>>> @@ -113,6 +117,10 @@ properties:
>>>>                    minItems: 1
>>>>                    maxItems: 4
>>>>    
>>>> +              bus-type:
>>>> +                enum:
>>>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>>>> +
>>
>> But is it really needed to specify the single supported bus-type?
>>
>> I believe it is not, at least it's not ever done for other media devices
>> like sensors.
> 
> Through video-interfaces.yaml 'bus-type' is already allowed but not
> restricted to the values that actually make any sense on such hardware,
> so in my opinion this makes sense to have here.
This is additive not prescriptive.

New additions should include this bus-type number as we will need it 
when we add CPHY support and the subsequently move to the PHY API for 
CAMSS PHYs.

So still in favour of this amendment.

---
bod

