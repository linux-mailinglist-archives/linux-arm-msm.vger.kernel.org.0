Return-Path: <linux-arm-msm+bounces-24803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 762E691E29A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 16:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E43EBB209ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 14:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD4B1667EA;
	Mon,  1 Jul 2024 14:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="ccpl/lYg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FF716C426
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 14:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719844277; cv=none; b=OJRKPgvrk1LYiJPqP79UY805V56wXXHs0VIY2mR9IZSqNJc+dRa2e9/K7jdqI+94vYCR/jREf3zBSwFI17GpKxlb3EGRXk+4+i6JxUJ7cQ/ImZ6TPhV/IzkVmOAM5WwCnFMEMiYwEcXsH1diADvwGxni6XLt6v+fzw6xE9obM+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719844277; c=relaxed/simple;
	bh=JUSy6Ghvbyp8YbYmisUT1IMp4/UZFkRmvqybzhe2L48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OYIF8WgZQah/jwfuJ5qbxisbDhJtniYmc6AqLSYYyyRTK8zMJcY/W6JaYwiI3Oc5/AE1HVrHz286hn1T/pAM213I07gpznUYMtegSGWeeCn+20GmUq0qOEI7c/pKgQtnPLAemchN/rS0rrPFHajPOY8bB20aY6d92YSGwwrA8hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=ccpl/lYg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-424a3ccd0c0so22653735e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 07:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1719844273; x=1720449073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Id6HIAkhEJzVf6hGweWJ8Eidp8Rqbm4Blp5Z2wNFya4=;
        b=ccpl/lYglxo4miHkDBCEWcZ05GHSdf+i1QhEogi4bshhAOp1+MhRSMNqXt1YwG+ogK
         tYOyFa8oaF28c82zcayKR/Czu3jzPquFGc4vTuBGVI4SisvwCfAzQxRWixKCyETNEDTs
         j6M3v78jl9Jx8VvB/3Bqt2QSYNz7nkjBAKZCnSGNn8HLm3zkeIWhNB3n9gBIvGvsZa8H
         34k6CGMyMWsIP1Y3SmEdmXXDc0OD16/MK4ZNgsEjsrNIwvwjOIu60BFbfD4wMJiW51gV
         zKmYzz591i5Xmeasyk/PU8wUrM2RY30hh4+6CBzMF6I9XJs+JyWWbxLpXuzOh3Y8vdNk
         ICSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719844273; x=1720449073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Id6HIAkhEJzVf6hGweWJ8Eidp8Rqbm4Blp5Z2wNFya4=;
        b=mBbs8g7VwM4zpuFoNk9HyGr4VlzJ67ARR1f6v5T+pAVyEqmwxbjatCmebsAYarTX/n
         Au8TDRsvsGGHItDReBpSsoth1IjW9X+LgDRxyp84Klqrhop9k6bYKdQ6JL0BsV3a1X1O
         2GB+7zm4PQv0VO6mFFpuU3RmryEbD5jVsYYqDu4hNS5NI6p9+jpsyllEyLxERD4+RUIw
         pgeT1JHzwM2Dre4gQn2Pr1E+/iYQ24Ljuq0kpQkfyOKX5/lqvI12UYSgMaT2imgVuO87
         X1lHvgN9P3G8NTuEwHxi7o/55cdC9ddqhwM2FOQMxcKOXr1K5OiGRexbuUeiOxIsHcNW
         xh1w==
X-Forwarded-Encrypted: i=1; AJvYcCVMw6Ux+yDS4nIQ1MuMmgeX0/lhT2LY9XuKXew76psGBIz7JSM7Lf+vVthozKsiyYi6g/nPasKnnzGYZsUG+S48aTYNq82zyyrth4YHcw==
X-Gm-Message-State: AOJu0Yy+2Oxymgym3OgAYWvd5S2Y3kLJNI3tQtwPnVyBUPENn1kTFM4R
	dWhHfTvoS6DF9s7U8NbURZ1My2cUnQiPJqtkHHXrRqezYEu5P8l89LSrGzyGDvg=
X-Google-Smtp-Source: AGHT+IEwysNTKVXojrsAp0MycW5SXYQ6LKem1wRsjQx63ku/RzCh0wT8flIX/YdnkMJuNXYL2gqroQ==
X-Received: by 2002:a05:600c:4589:b0:424:abef:e952 with SMTP id 5b1f17b1804b1-4257a05fa08mr38100285e9.29.1719844272832;
        Mon, 01 Jul 2024 07:31:12 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d8ed0sm10223141f8f.28.2024.07.01.07.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 07:31:12 -0700 (PDT)
Message-ID: <0028683d-efaf-478c-b226-cc60daaacda9@freebox.fr>
Date: Mon, 1 Jul 2024 16:31:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240627-display-quantum-48c2fa48ed1a@spud>
 <2fe0c2c0-2f67-4549-b62f-3b9db005d3f7@freebox.fr>
 <46d7c95f-20b0-4526-8583-1d8878afaa2f@kernel.org>
 <3wwp34miu2pibsylv3v2sjzyeso2ugslutm2zqnddlx4ipily2@bcrfetrjngft>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <3wwp34miu2pibsylv3v2sjzyeso2ugslutm2zqnddlx4ipily2@bcrfetrjngft>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/06/2024 09:49, Dmitry Baryshkov wrote:
> On Fri, Jun 28, 2024 at 09:36:57AM GMT, Krzysztof Kozlowski wrote:
>> On 27/06/2024 18:45, Marc Gonzalez wrote:
>>> On 27/06/2024 18:25, Conor Dooley wrote:
>>>> On Thu, Jun 27, 2024 at 01:13:03PM +0200, Marc Gonzalez wrote:
>>>>
>>>>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>>>>> It supports DVI 1.0, HDMI 1.4b and 2.0b.
>>>>> It supports 4 TMDS channels, HPD, and a DDC interface.
>>>>> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
>>>>> for power reduction. Several methods of power management are
>>>>> implemented to reduce overall power consumption.
>>>>> It supports fixed receiver EQ gain using I2C or pin strap to
>>>>> compensate for different lengths input cable or board traces.
>>>>>
>>>>> Features
>>>>>
>>>>> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
>>>>> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
>>>>> data rate, compatible with HDMI 2.0b electrical parameters
>>>>> - DisplayPort dual-mode standard version 1.1
>>>>> - Programmable fixed receiver equalizer up to 15.5dB
>>>>> - Global or independent high speed lane control, pre-emphasis
>>>>> and transmit swing, and slew rate control
>>>>> - I2C or pin strap programmable
>>>>> - Configurable as a DisplayPort redriver through I2C
>>>>> - Full lane swap on main lanes
>>>>> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
>>>>>
>>>>> https://www.ti.com/lit/ds/symlink/tdp158.pdf
>>>>>
>>>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>>>> ---
>>>>>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
>>>>>  1 file changed, 51 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>>>>> new file mode 100644
>>>>> index 0000000000000..21c8585c3bb2d
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>>>>> @@ -0,0 +1,51 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: TI TDP158 HDMI to TMDS Redriver
>>>>> +
>>>>> +maintainers:
>>>>> +  - Arnaud Vrac <avrac@freebox.fr>
>>>>> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: ti,tdp158
>>>>> +
>>>>> +  reg:
>>>>> +    description: I2C address of the device
>>>>
>>>> Is reg not required? How do you communicate with the device if the i2c
>>>> bus is not connected? Is the enable GPIO enough to operate it in some
>>>> situations?
>>>>
>>>> Otherwise this looks good to me, but given Maxime commented about the
>>>> complexity of the device, I'm probably out of my depth!
>>>
>>> Valid question.
>>>
>>> As discussed in my brilliantly expanded commit message (:p)
>>> the device can be configured in various ways, either through I2C registers
>>> or by pin strap. We use the device in its default settings, so we don't
>>> touch any I2C registers, thus I'm not sure the reg property is required.
>>
>> But then how would it be represented in the DT? Where / under which parent?
>>
>> If this is supposed to be always in I2C bus in DT, then you always need
>> reg. If you could place it in other place, then your reasoning is valid
>> - reg is optional.
> 
> As far as I understood, the device is connected to I2C bus, it just
> doesn't need to be programmed. So I'd conclude that reg is required.

Just to be clear (and as far as I understand),
the TDP158 can be configured via 2 different methods:
- dynamically at run-time, through I2C registers (requires an I2C bus)
- statically at layout-time through pin straps (no I2C bus required)

On our board, the TDP158 is connected to blsp2_i2c1.

So, in my understanding, the "reg" property would be required
for the first method, but is not applicable for the second method.

I don't feel strongly about the issue, so I can mark the "reg"
property as required if it makes more sense.

Regards


