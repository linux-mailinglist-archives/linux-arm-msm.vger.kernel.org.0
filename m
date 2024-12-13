Return-Path: <linux-arm-msm+bounces-41971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A519F0A0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57589188BC91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574AB1C3C02;
	Fri, 13 Dec 2024 10:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vratCu3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B3C1C07F0
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734087030; cv=none; b=PK/Bi2gZW6WslZGImuztmb8cSPX6Hz2Vw6uktThowX5NV6Fjjh46oYF5An4Q44m4vpbSuiJLmuJrno/bmOg6kGWqHDtl5oUjX6EAwfEsBpvIBr2y3ko+BM62ffg1LHbCnzqkWpEP/nSvkDqAx7lU987HHBB5nybhMxAqYTm78J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734087030; c=relaxed/simple;
	bh=gA3Q4ub77tN7sCgmbLmkx712qJth2K3MCOGVKBn36q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cnBYqnIFzL5thT26gurZ9pjiJGV+Mi1Js9IyfhI7P9Azn+EY0f35kO8nUmQZn4ASsdUrUDryeONW0wjz2g4vy9CkO0XxdFLAFCDSMmOPfFjJhMSXishSbbxXF0iN0arv9KOgOSiOQWx67K01M9WGoY0u2rgRmvUtVVj2Z8n8ir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vratCu3Z; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e3c3e38d0so252666e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 02:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734087024; x=1734691824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsMZoEd++TbxWw8duLL2sE2JWkwl2EC+I98Ex9pn+ng=;
        b=vratCu3ZOK2VjDZsyyhZXVv9HNetkP/G4PvP+34XY1/d+M2FUCE7vzT1LnnU2g6+Fl
         IOTvH5GXU/PjR8LtEF4LsaM1hQd5p7EFaIHDjNWmaHcZ4zdLjZDYR9mVgm8KbXwWiMLy
         m0NTcUV7sj8tLlFzUrKU3vyd6rJH9ESvg4Zb7uSfRcNJdYux600bygK421n5ybWhpZF1
         YIOeLHaILcPxIQ15A4Pa5G1QfbCZDIqTzkOMdGhrCvJHQY/wxXo/0AYkqNrRE6SwJ4ti
         IS7AnupvBIzj/Rw5sr1BB6Lj0lvBSUDy1K7xdfUqJP7BIIJyBVlMf+aw/nO8PpuelNJ1
         KqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734087024; x=1734691824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zsMZoEd++TbxWw8duLL2sE2JWkwl2EC+I98Ex9pn+ng=;
        b=wLyTRs4f4yNkDb+Bkhc0WmsEQeRc/6EZuehAk23WmzapY4WCKdZ2qayKVi2uRynCSS
         +hvC7YtLF3vK9ra7THaXiF7Y8iWEr+NUCakjOFwlWi1bn1laXp2NukWS8cz5LwQSTUVE
         F5tGAF14WzbtFQZyYrwCB1ht0RreXvVUyCcRxPgsmYGKwnkE+Krbdyp1JTiKU/KLLunl
         6icwwxxac4PNTSoqSY2TdFcEzDGx3gjWPw6fN6ot4NUuhHml5PAilDgVsvswH/+tl8qa
         WfmS5AA1twJgVj6g93G/xdTJPW2vpbdGm2hUdC8d297zQP761nvH0jRFgchWXsbcESk0
         TNmw==
X-Forwarded-Encrypted: i=1; AJvYcCVp4zgD4RMWT29CpUWruJWZLJhyOeP/CI5wWc72ZHJqZ91OSlpGpyeFHm5XbknjUoBGdxIejzrZdPZ3BRbj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyosg+oqY517n5kemikbh/e9GdBZlX4qf9/kNLJyCs1Kaz4xC9
	UqOCrmreCIRLNKeu5oexpA3UL7gtHj9VO8X0bXV9+JdH4SqF2LTK9Hsr3jMrTRA=
X-Gm-Gg: ASbGncsO+Js+UCIGEZ1lY3ey3dzwphsmBtOfiJrnrTU+wM3bW+dZtcI+1zm/ZxqVBfc
	c+1zj3P/6yPZQI2Sl25rMxhtmnVsbgzfj7LScnn2P/77T2t2O58kSWGvH1a3SOwvT/cKzuFDoVO
	QjRhSob0kA9cRCXQDMXHdsZSSjHKu6Cn1H7JzD1GLy6nb4mpU05ixeiUl5QU23HsMtEUq+hLMeW
	7RgyqY1apZ1h+ZB4DaOPMV33k2KFu8ChGjE76XjS7nhGne9eXkcawCZR2dc1DU7+zO6Prf96UKp
	fphGLiqFLxsxvuTzyL/BYOCQr8zIR0pn+k8=
X-Google-Smtp-Source: AGHT+IGw9a1uX5hBegI8/sPSllQufUgfjzOPxBgUy3/5ZZqbN7RuVYinY4oCJlX1bIMH1dO35Vhc1Q==
X-Received: by 2002:a05:6512:1594:b0:540:1b7e:c8ee with SMTP id 2adb3069b0e04-54090557f27mr229332e87.4.1734087023952;
        Fri, 13 Dec 2024 02:50:23 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54016a1cea6sm1888692e87.41.2024.12.13.02.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 02:50:22 -0800 (PST)
Message-ID: <e4bd515a-eb98-4ea1-8d73-4ba5e7c9b66e@linaro.org>
Date: Fri, 13 Dec 2024 12:50:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: media: camss: Restrict bus-type
 property
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
Content-Language: ru-RU
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <nqggstwkytqxpxy3iuhkl6tup5elf45lqi3qlgyv6eaizvnfdr@2uy57umdzqfa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 11:34, Krzysztof Kozlowski wrote:
> On Mon, Dec 09, 2024 at 01:01:05PM +0100, Luca Weiss wrote:
>> The CSIPHY of Qualcomm SoCs support both D-PHY and C-PHY standards for
>> CSI-2, but not any others so restrict the bus-type property describing
>> this to the supported values.
>>
>> The only exception here is MSM8916 which only supports D-PHY. C-PHY was
>> introduced with newer SoCs.
>>
>> Do note, that currently the Linux driver only supports D-PHY.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   .../bindings/media/qcom,msm8916-camss.yaml         |  8 ++++++
>>   .../bindings/media/qcom,msm8953-camss.yaml         | 15 +++++++++++
>>   .../bindings/media/qcom,msm8996-camss.yaml         | 20 +++++++++++++++
>>   .../bindings/media/qcom,sc8280xp-camss.yaml        | 20 +++++++++++++++
>>   .../bindings/media/qcom,sdm660-camss.yaml          | 20 +++++++++++++++
>>   .../bindings/media/qcom,sdm845-camss.yaml          | 20 +++++++++++++++
>>   .../bindings/media/qcom,sm8250-camss.yaml          | 30 ++++++++++++++++++++++
>>   7 files changed, 133 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>> index 9cc0a968a401836814560c1af3ee84d946500b4f..3de2a3d2b5b761106975aab65ff614b2ef579ef5 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>> @@ -94,6 +94,10 @@ properties:
>>                   minItems: 1
>>                   maxItems: 4
>>   
>> +              bus-type:
>> +                enum:
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>>               required:
>>                 - data-lanes
>>   
>> @@ -113,6 +117,10 @@ properties:
>>                   minItems: 1
>>                   maxItems: 4
>>   
>> +              bus-type:
>> +                enum:
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +

But is it really needed to specify the single supported bus-type?

I believe it is not, at least it's not ever done for other media devices
like sensors.

Here I would prefer to get a comment from Linux Media and/or DTB experts.

--
Best wishes,
Vladimir

