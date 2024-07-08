Return-Path: <linux-arm-msm+bounces-25521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A36092AA98
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 22:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3BC02834A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 20:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829B814B959;
	Mon,  8 Jul 2024 20:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wFYsPSaD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E8A14B97B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 20:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720470593; cv=none; b=W3k1T+7KWulE8uInL6dGlQu0mLK9tYCQj0rz6HPqmejb4mWHuPsJV+Lj+SR08uLVaD205FmG34njhiuqogTgWxLXRZAZ/d6yuTtR8Faf2/izytQjtpP7C9Rag4q6Zq1jN5IkrgCBXy6F+zHju9ifnaEe0wqVVF1Qv/a555GnOYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720470593; c=relaxed/simple;
	bh=d5o7vwkdOY8+xogW61QIcmoRlrHHDp9JiJt0uIAaBJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEsBGFOHuv2jllobRGs3L51HXMwBU1udqrIICAZbvkqAp4ZneJ0iHuo2nYTx8rPR4SSxMnxipvtmnKbc75T46GcR8xiGRpDiaqnOz0evTfhmDB7BAUwULaC0YcPuE/VUQu75ghm1vTGTf5XYdwyeC604T4zCuefMqBJ9/w8Qthw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wFYsPSaD; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ea2f58448so5444881e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 13:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720470588; x=1721075388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AkgxCYGsYLWMcE448YaZfJ9W44wnGwUPOMuZLYPWud8=;
        b=wFYsPSaDgCJl9vv9oWF814CR0Tx6uAB9aqcCrNqbZAkcItyPKrFxz4Hpzpln9x/vZT
         4Ckf2mYNa9SCX1/b4XbD30JIZtHTNzn+41ddZBqXQ458FeKk5krkYVZNt0CufxpkYipF
         PnzkI0IqsebZGmBHOGEbx/8kvcDrLSBynr5dKUTBZkrNVEg0pbIhgS9gqyNkxPGsEKxh
         k+oswBiFWSmJUpkb1aWCFNEdeZgKDhNSwuS4sRrcxCq2jt8AoxykWSC1IyFWeiwrWoTt
         tAytaW9UwOmrlDrZq3bzXdSsxXBJhfzaH95TeyJJ2vL8WE2KywyfVhCtUb4Z+ql3UOWE
         DmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720470588; x=1721075388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkgxCYGsYLWMcE448YaZfJ9W44wnGwUPOMuZLYPWud8=;
        b=agXvzVcLfdvSmP5HQEhQeMfcbatP2KbcxxGVoGn5mvsg1bT1g//u0/ytMtX4C6rP+0
         Yfa5WgM6bJ/k0T2rq+AMbtHN131H0dlXbyRnGzZlZqVjXG+/rkKj06GM2Rwo6KJe7jNy
         DeNMG+doNLPTGhYfbECbuF14jzxt1psT3q0jg6zQ3sxXSH40qFDXNE47dhV031yM9rgU
         qu1m8D4OM0B4/MhGHJVZw7JHMRO8ZDr41Aw7RadzIn2htTJpmPG4t+T6LoXNlhfOvUJ4
         2t8PzvqIVt2L+umD/anYOHQwJNEU2fAA48VeEpAh/5gR+y4/wDf+QCRFAcmgzBXyz1pS
         MJmw==
X-Forwarded-Encrypted: i=1; AJvYcCVtWSIVnvjRr7rtzFyq7eXdbPmS/DCX5WzMdzVHIDj9dt30drmW2WuT0vzQyaoEG2xh+9ixffqGo5TMIKXR+kk8tbH2niBOPbwXEEZhTg==
X-Gm-Message-State: AOJu0YwmiAiS7+bC86Ory5YqzCo/rn/LY6jW5NOA5XRUFYjqKqOZx6CO
	LqANmkT+O2p4KdZEYqw/gQt6rD+GSaxLLIbTiQV+bU6jst2B+DLQDDjaakOgSv4=
X-Google-Smtp-Source: AGHT+IEBbhWBYOcaS6joBzDlzNMwaWeo83XO3feWz3mM89Vg7Fqlo+wJsWBRhc+Nes+lzZGSEHMrtA==
X-Received: by 2002:a05:6512:110e:b0:52d:b1e4:b337 with SMTP id 2adb3069b0e04-52eb999165cmr306053e87.21.1720470588245;
        Mon, 08 Jul 2024 13:29:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eb90625ccsm58017e87.127.2024.07.08.13.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 13:29:47 -0700 (PDT)
Date: Mon, 8 Jul 2024 23:29:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <pp3rc5zob3xeghlatw4vnpzplc4yjpjadkea465zmhft55dyl5@3cpoc2zovftv>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>
 <20240708-ethereal-romantic-piculet-d4ae66@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708-ethereal-romantic-piculet-d4ae66@houat>

On Mon, Jul 08, 2024 at 04:59:23PM GMT, Maxime Ripard wrote:
> On Mon, Jul 01, 2024 at 05:36:18PM GMT, Marc Gonzalez wrote:
> > On 01/07/2024 15:50, Maxime Ripard wrote:
> > 
> > > On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
> > >
> > >> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> > >> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> > >> It supports 4 TMDS channels, HPD, and a DDC interface.
> > >> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> > >> for power reduction. Several methods of power management are
> > >> implemented to reduce overall power consumption.
> > >> It supports fixed receiver EQ gain using I2C or pin strap to
> > >> compensate for different lengths input cable or board traces.
> > >>
> > >> Features
> > >>
> > >> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> > >> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> > >> data rate, compatible with HDMI 2.0b electrical parameters
> > >> - DisplayPort dual-mode standard version 1.1
> > >> - Programmable fixed receiver equalizer up to 15.5dB
> > >> - Global or independent high speed lane control, pre-emphasis
> > >> and transmit swing, and slew rate control
> > >> - I2C or pin strap programmable
> > >> - Configurable as a DisplayPort redriver through I2C
> > >> - Full lane swap on main lanes
> > >> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
> > >>
> > >> https://www.ti.com/lit/ds/symlink/tdp158.pdf
> > >>
> > >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > >> ---
> > >>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
> > >>  1 file changed, 51 insertions(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > >> new file mode 100644
> > >> index 0000000000000..21c8585c3bb2d
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > >> @@ -0,0 +1,51 @@
> > >> +# SPDX-License-Identifier: GPL-2.0-only
> > >> +%YAML 1.2
> > >> +---
> > >> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> +
> > >> +title: TI TDP158 HDMI to TMDS Redriver
> > >> +
> > >> +maintainers:
> > >> +  - Arnaud Vrac <avrac@freebox.fr>
> > >> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    const: ti,tdp158
> > >> +
> > >> +  reg:
> > >> +    description: I2C address of the device
> > >> +
> > >> +  enable-gpios:
> > >> +    description: GPIO controlling bridge enable
> > >> +
> > >> +  vcc-supply:
> > >> +    description: Power supply 3.3V
> > >> +
> > >> +  vdd-supply:
> > >> +    description: Power supply 1.1V
> > >> +
> > >> +  ports:
> > >> +    $ref: /schemas/graph.yaml#/properties/ports
> > >> +
> > >> +    properties:
> > >> +      port@0:
> > >> +        $ref: /schemas/graph.yaml#/properties/port
> > >> +        description: Bridge input
> > >> +
> > >> +      port@1:
> > >> +        $ref: /schemas/graph.yaml#/properties/port
> > >> +        description: Bridge output
> > >> +
> > >> +    required:
> > >> +      - port@0
> > >> +      - port@1
> > > 
> > > The device supports DVI, HDMI or DP input, with various requirements and
> > > capabilities depending on the input. Your binding doesn't address that.
> > > 
> > > Similarly, it can do lane-swapping, so we should probably have a
> > > property to describe what mapping we want to use.
> > > 
> > > The i2c register access (and the whole behaviour of the device) is
> > > constrained on the I2C_EN pin status, and you can't read it from the
> > > device, so it's also something we need to have in the DT.
> > 
> > We are using the device in its default configuration.
> > (Power on via OE, then it works as expected)
> 
> I know, but that doesn't really matter for a binding.
> 
> > Can we leave any additional properties to be defined by whomever needs
> > them in the future?
> 
> If you can guarantee that doing so would be backward compatible, sure.
> But that means being able to answer those questions with a reasonable
> plan.

I think proposed bindings are generic enough to cover other possible
usecases in future.

-- 
With best wishes
Dmitry

