Return-Path: <linux-arm-msm+bounces-24805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EC091E446
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 17:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C84421C22D67
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 15:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F190716CD2A;
	Mon,  1 Jul 2024 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="ZCkNohcu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC3C16CD03
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 15:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719848200; cv=none; b=l9YtnnT5OMZYsEaClT+q5Z4m4hq5QXEz5StuS5nZKEuBPettPki42SQdbqwfSQgi3w/m9ODoaC8znlQ+thQhedp0fpYhPHtJwU6ljyoum/N1A/fpu77HnQiSlP7bfYvl6MTX/m1lJuqyRtgQh/DJFQKc2YiIHswoO5BwC012wFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719848200; c=relaxed/simple;
	bh=COABjvRahnJ6IgnpJ9NfNtQpmwvpDATkNl/kHBcCiIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XjwpN+QXXNSXe0OGXukvHKMbYBgQCl2bF+im1jbzQsPUHF1ZVxTOj58+JHX5bmPy9luOpdhaMjh5KUk/vWFHgwM6sZvH3jA7ZYDQMoSxW8PlVPYAo9jt0bgSHS3sYsygjO1fBeLjEz+pUalvMNaBtBfmE3J0RS3vhgx/twP2Ams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=ZCkNohcu; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebe6495aedso33118291fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 08:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1719848196; x=1720452996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bvfSKmQBY9o32fhoQH9rUnJzU5eNp6hOXWuH3dxG8cI=;
        b=ZCkNohcuBXYhjMYG3yL0FeBlIKuAvYZKj3AKKSayGlGedLcXuiPP6k0qZ0xKrPUrQA
         Xv5C32CHXtgPK7La3ZCjlAw2AzAu9AjEOI/0cBUqKYXZx/MoQA54kQdkzLnrSJc8EkQA
         VF2mroHt8CUFCOOh1AmSWUxRbO9xFvC272U3F/iO/nj7N1sXpslFA0Yhlbo8/s6TOz+d
         RiQEainu/BAd64Dw7ZNPzXZ+pFSV8ahwSGnedFh9FIkjjsF3VGI+PXOp4EmLeWghiv/r
         q6CEJnSvYO2bMoEzj2cfo4hRXtRVyD1mi0MCWAd+qbEykQazJElj0VmFBzMj4NyiPN0z
         uIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719848196; x=1720452996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvfSKmQBY9o32fhoQH9rUnJzU5eNp6hOXWuH3dxG8cI=;
        b=dormewV6HvbRfNJnWkAxclQ2jYvkE6a1gklKkugPIIqBEi4sW1HvntKHS2mP67pezn
         hSfz15oTuHJgg4zp+57/ykwq1GEGDdmNYJz7GE1fTvonQiOn8Yfn3lKmpd91LglQ+eHc
         g1UddyczLUkhx8t+HcEYcUqgggjXcl6lM4eGaWiYvdd/WuTdxo2rBeSV1CPXJa4X7aON
         K2xoZR/x9nbSAEg3gM+EfL2AmrEs+3DCc32sQfzbMBJLBBU6n+Sd+teBukEzO4H3nD8j
         Watyl04ZFU1zLcnG0/56i54QagM9JB6FuksA1I+ECOWlR/V0J5u+kqxmZLw+/jDtUEyi
         Figw==
X-Forwarded-Encrypted: i=1; AJvYcCVSq2Dd6GMBjpRFxpH2kBeciOMMwPjE+wSaHeHm1kMgAFxwV9+Zs0T4k4fJInw0HmKrF90isoQ9+itTGsj8h4/0+jE5mpqdl4mBlgnvSg==
X-Gm-Message-State: AOJu0YwC4z8ULtQbh51xXYk8ngH3injSs/Zg0TU/VAF+tpNuWcapQ/WQ
	iuE5i8sYN9qACIq869xujvE2uBaaBSJ0zFY3JS5gP2EkvNaVmkjH5kZ3rrfVw8E=
X-Google-Smtp-Source: AGHT+IEDSC4uaaLDJAS21ejjh/FE4t1bkWMHxfeTl3h0IkEGfg8lVFkE7MXRxv+Fq3Es3bKHHc6Kng==
X-Received: by 2002:a2e:7809:0:b0:2ec:5a0d:b2dd with SMTP id 38308e7fff4ca-2ee5e6e0279mr37769401fa.39.1719848195577;
        Mon, 01 Jul 2024 08:36:35 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af5ba51sm156852355e9.12.2024.07.01.08.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 08:36:35 -0700 (PDT)
Message-ID: <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>
Date: Mon, 1 Jul 2024 17:36:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240701-bug-of-great-honeydew-cfb6ef@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/07/2024 15:50, Maxime Ripard wrote:

> On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
>
>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>> It supports DVI 1.0, HDMI 1.4b and 2.0b.
>> It supports 4 TMDS channels, HPD, and a DDC interface.
>> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
>> for power reduction. Several methods of power management are
>> implemented to reduce overall power consumption.
>> It supports fixed receiver EQ gain using I2C or pin strap to
>> compensate for different lengths input cable or board traces.
>>
>> Features
>>
>> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
>> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
>> data rate, compatible with HDMI 2.0b electrical parameters
>> - DisplayPort dual-mode standard version 1.1
>> - Programmable fixed receiver equalizer up to 15.5dB
>> - Global or independent high speed lane control, pre-emphasis
>> and transmit swing, and slew rate control
>> - I2C or pin strap programmable
>> - Configurable as a DisplayPort redriver through I2C
>> - Full lane swap on main lanes
>> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
>>
>> https://www.ti.com/lit/ds/symlink/tdp158.pdf
>>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
>>  1 file changed, 51 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>> new file mode 100644
>> index 0000000000000..21c8585c3bb2d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: TI TDP158 HDMI to TMDS Redriver
>> +
>> +maintainers:
>> +  - Arnaud Vrac <avrac@freebox.fr>
>> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
>> +
>> +properties:
>> +  compatible:
>> +    const: ti,tdp158
>> +
>> +  reg:
>> +    description: I2C address of the device
>> +
>> +  enable-gpios:
>> +    description: GPIO controlling bridge enable
>> +
>> +  vcc-supply:
>> +    description: Power supply 3.3V
>> +
>> +  vdd-supply:
>> +    description: Power supply 1.1V
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Bridge input
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Bridge output
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
> 
> The device supports DVI, HDMI or DP input, with various requirements and
> capabilities depending on the input. Your binding doesn't address that.
> 
> Similarly, it can do lane-swapping, so we should probably have a
> property to describe what mapping we want to use.
> 
> The i2c register access (and the whole behaviour of the device) is
> constrained on the I2C_EN pin status, and you can't read it from the
> device, so it's also something we need to have in the DT.

We are using the device in its default configuration.
(Power on via OE, then it works as expected)

Can we leave any additional properties to be defined
by whomever needs them in the future?

Regards


