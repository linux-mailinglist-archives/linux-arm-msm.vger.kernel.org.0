Return-Path: <linux-arm-msm+bounces-24568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F74691B88C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 09:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17EB828902D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 07:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84390140363;
	Fri, 28 Jun 2024 07:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNLGXE6U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C24513FD9C;
	Fri, 28 Jun 2024 07:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719560228; cv=none; b=pjvMxgZSIpcuxUAP27vQJ2+3u2/hWkYOBVIXlg1NV31XLjwPx4tYwUrsY+88DQhCjhRprMRnZ7orr9dY/hdyAidV8eOlxVn7aLQOoh7VrKpHrtY0+1FlQmI7OCUXuarXRbH8HuYx00b4ADHVE+VaYYbyXgHaZEwTT2Vd5UbXhCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719560228; c=relaxed/simple;
	bh=QBlR7GnZcN6qgyINm0DiIIkviU/2h+8xXxnQLmYEisE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCvPZptAA9Ry07LT/hy6u0Fo9O6IoOmcPFsbltV9E47Ob9S60bQJIX+Mh1aF8IvjwmiBzr4WtBjiNwuyqIBkQUeNAQYXoSUE8dPuDYcYihL1MN0FBDJT37cJYGX//XkMXT3rNDyovelETXTxQIkY+e6iAK4UOQSo2SXi70RQXIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pNLGXE6U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12186C116B1;
	Fri, 28 Jun 2024 07:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719560227;
	bh=QBlR7GnZcN6qgyINm0DiIIkviU/2h+8xXxnQLmYEisE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pNLGXE6U0kLFod9QkUEXU+iAEhEATgeCbicetOzsLuxPiqKRsM3flHuNE07l4FaLi
	 02REU2ARHwm7DFLfni0+y7kf6DCLk24VoV0eovrVTTUMzsWQVPE4tVtvJuQrRoAYwW
	 5+HAflk1iNTq/vb8g1Sy+myH676OXoEBhQrCjigU7FxrP4pOMOMXgUU63s7IcRWLz6
	 5RR433E1QF7dWGQkdpoKyKr9QjlL+YmTvaLRtKiJk92I21Ug9UXEx7wx70HKl5QxNN
	 BWikLO9NzRc0hffXIW3kFIGOhHwM+yOsCJEmfW4iARFlKC6NgWEDGnBpBREvHOUD/N
	 qx38CWOzrNleA==
Message-ID: <46d7c95f-20b0-4526-8583-1d8878afaa2f@kernel.org>
Date: Fri, 28 Jun 2024 09:36:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Marc Gonzalez <mgonzalez@freebox.fr>, Conor Dooley <conor@kernel.org>
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
 <2fe0c2c0-2f67-4549-b62f-3b9db005d3f7@freebox.fr>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <2fe0c2c0-2f67-4549-b62f-3b9db005d3f7@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/2024 18:45, Marc Gonzalez wrote:
> On 27/06/2024 18:25, Conor Dooley wrote:
> 
>> On Thu, Jun 27, 2024 at 01:13:03PM +0200, Marc Gonzalez wrote:
>>
>>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>>> It supports DVI 1.0, HDMI 1.4b and 2.0b.
>>> It supports 4 TMDS channels, HPD, and a DDC interface.
>>> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
>>> for power reduction. Several methods of power management are
>>> implemented to reduce overall power consumption.
>>> It supports fixed receiver EQ gain using I2C or pin strap to
>>> compensate for different lengths input cable or board traces.
>>>
>>> Features
>>>
>>> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
>>> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
>>> data rate, compatible with HDMI 2.0b electrical parameters
>>> - DisplayPort dual-mode standard version 1.1
>>> - Programmable fixed receiver equalizer up to 15.5dB
>>> - Global or independent high speed lane control, pre-emphasis
>>> and transmit swing, and slew rate control
>>> - I2C or pin strap programmable
>>> - Configurable as a DisplayPort redriver through I2C
>>> - Full lane swap on main lanes
>>> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
>>>
>>> https://www.ti.com/lit/ds/symlink/tdp158.pdf
>>>
>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>> ---
>>>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
>>>  1 file changed, 51 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>>> new file mode 100644
>>> index 0000000000000..21c8585c3bb2d
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>>> @@ -0,0 +1,51 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: TI TDP158 HDMI to TMDS Redriver
>>> +
>>> +maintainers:
>>> +  - Arnaud Vrac <avrac@freebox.fr>
>>> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: ti,tdp158
>>> +
>>> +  reg:
>>> +    description: I2C address of the device
>>
>> Is reg not required? How do you communicate with the device if the i2c
>> bus is not connected? Is the enable GPIO enough to operate it in some
>> situations?
>>
>> Otherwise this looks good to me, but given Maxime commented about the
>> complexity of the device, I'm probably out of my depth!
> 
> Valid question.
> 
> As discussed in my brilliantly expanded commit message (:p)
> the device can be configured in various ways, either through I2C registers
> or by pin strap. We use the device in its default settings, so we don't
> touch any I2C registers, thus I'm not sure the reg property is required.

But then how would it be represented in the DT? Where / under which parent?

If this is supposed to be always in I2C bus in DT, then you always need
reg. If you could place it in other place, then your reasoning is valid
- reg is optional.

Best regards,
Krzysztof


