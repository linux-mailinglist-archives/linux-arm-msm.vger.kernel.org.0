Return-Path: <linux-arm-msm+bounces-26919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E63A93A3A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 17:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D4982813BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 15:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC0B153824;
	Tue, 23 Jul 2024 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="qvSXdRjC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D75614F9F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 15:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721747837; cv=none; b=cG1PKR68EGudyb4ovgId4qI/2OD1nBPqt2+doUK6cW+FVpcDAD72MYZ+kCeA6jZ70kB8LWYB243+GbTH9Uauq0AWckvfQcUjcoU/4afK1eNQWMcvHlbIIPXSNrkrmCfZwO8YyjwEBHKgswzU50X7TEiH77ViqXXkbZbt0D5btoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721747837; c=relaxed/simple;
	bh=k4BLloF5clv2a5Kq+UyoZgTDDctx+BVkEwa4h8tIOIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j9n2GfAJwlneoO8nIUNiZ+3t6FzO1trUzHzYT06nkM1wEZcevR5dRPbzJVpuYxufCnf8CjRcGbQ3EoyP5TZBXWS2V1+QPixGl8EAp1O3vrM62IxcpgB4z67eDz1Hfo/mQGm8CvTgwzvSRgrKpVc7LdtNp4uqxmdp6n4PgnG0q7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=qvSXdRjC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-426717a2d12so29113595e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 08:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1721747833; x=1722352633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uea7fpwFzsLB/1iqowl2rAELpCia/ExDlWK7awEvfuY=;
        b=qvSXdRjCkBG13g5mgnLNNc4hglm/SiXhBjvHhQ4PNzMeQegcsoTbvDEqj0St7CZcp4
         t8iQpZbkxyJvx1oxunqN2TkdOiDVkM4kTUVuQV7Bts+J4FpW1UfJ4XoSb24EOG+tc9jb
         MnO+3tkFVFL/cWgrCUrvEsBFKh/vp8ymtLk6IeUNgf4ovFg3ZeUkje0rSAYbOz6s4co4
         VMa6TWjhrdHvdpwDrsGr6I5eM/spR6Y3JOfu39gTko5UPZibc/WPXus1pxhQs1kK4Vlj
         AHqffq732A/Ibz3vc/oLP/nYo9jny9yYaa16XEfwzNyahwN6LY9YcWBMbc5NDO4BRg5v
         gqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721747833; x=1722352633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uea7fpwFzsLB/1iqowl2rAELpCia/ExDlWK7awEvfuY=;
        b=eBPYPl3YJ9oa2ZpodQpvavfsquaBPNXmhbT9dIPUMf3rOUBUNB9Cthqwrry5HZA4B8
         wtGaRPDFAfHn43bM8DtCEarxjP87s7E8JcPlKwVo1SqNDiXFY0HlncWujLj9yRXBzq/k
         oAsUumpTtoZyI49a6OBERwxnh6nBho4wDQ0a9DinIFJ4Rhs1bUvhf155Kx3HJz/2vhGl
         rCgfRU0Sd3CvR/rdsPLWNpB7KchakqQ6xFi0awuKlovn7aE5rmZcv+jUPQNq0Hm9my3O
         JnKkS5FMOE2vDRYve2cCgc3TdX+o+NwvGKwwHfHpykqpw0wGl2J5Epc8s8ZsKiuFSRtX
         L29Q==
X-Forwarded-Encrypted: i=1; AJvYcCXs7l7BkaIYQTDobkLTxFqTtXb6Q+E6CWj8V0elPN/D89qW6UN1idAm8Bx+sk7pgUoInOsH9RlOeW7uUFicNfaSrt0u+4IxRI0TdB8Ckw==
X-Gm-Message-State: AOJu0Yz0sf0mH5+t/23Idw+ID8MOGFuT3jECDzKVtlsxIIJWsye4+VZd
	Xe3CWH16yu2HakxpMEap5Qoshz1g3ebNHnDuavhsHZGoTm3LkjbjviqrjJPz5AE=
X-Google-Smtp-Source: AGHT+IH9roU7SNg3lKjUnvzKa5IVDcJhlS9aYo3/Vqu5EDsOfZaYrMKcTKOzd1KQB0CGXudZUT579g==
X-Received: by 2002:a05:600c:5122:b0:426:618a:a092 with SMTP id 5b1f17b1804b1-427ef3a873emr17950635e9.13.1721747833567;
        Tue, 23 Jul 2024 08:17:13 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a5c3d4sm204304085e9.17.2024.07.23.08.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 08:17:13 -0700 (PDT)
Message-ID: <e9d53545-80fc-46d2-83a1-79842a729688@freebox.fr>
Date: Tue, 23 Jul 2024 17:17:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Conor Dooley <conor@kernel.org>
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
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240627-display-quantum-48c2fa48ed1a@spud>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240627-display-quantum-48c2fa48ed1a@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/2024 18:25, Conor Dooley wrote:

> On Thu, Jun 27, 2024 at 01:13:03PM +0200, Marc Gonzalez wrote:
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
> 
> Is reg not required? How do you communicate with the device if the i2c
> bus is not connected? Is the enable GPIO enough to operate it in some
> situations?
> 
> Otherwise this looks good to me, but given Maxime commented about the
> complexity of the device, I'm probably out of my depth!

Hello Conor,

A cycle has been detected:
Above, you defer to Maxime.
Yet later, he wrote:
"DT maintainers have required that reg is always present"


I propose we NOT mark the "reg" property as required.
(Thus, keep the binding as proposed in v3.)

Rationale:

- The device can be statically configured by pin straps,
in which case it is NOT connected to an I2C bus.

- Even if the device IS connected to an I2C bus,
no I2C accesses are required if the default configuration
meets the ODM's needs.

Is that OK with you? Can I get your Amen?

Regards


