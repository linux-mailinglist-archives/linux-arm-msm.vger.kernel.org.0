Return-Path: <linux-arm-msm+bounces-33232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F73991F5B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 17:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 916E2B20F3E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 15:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A456217C9BE;
	Sun,  6 Oct 2024 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/a9ul9Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFF017C9B4
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 15:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728228539; cv=none; b=OhzctwaVpsAYmvE5N5pPwd044guyzkKSYZGyBKDJ2KMsyQ4HhvvZBsKlhoiGpwtU2mUNITXp+PQxAF3Onl8WRNglc/7Ihx2zhGJJyGH73Bwy/dW23czCdatVYKCj7n5u/y4Qy8oK1H3lB1x2UA34J7G0+4QAKhuBo3aZYR+jNVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728228539; c=relaxed/simple;
	bh=Nx3HWT2Zr7VmN+DjiFf8rjZsEQjnvNf09OHEoSGc59Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swwakWZizcLzlo6CmfhlR3Gblqii9OZNSX/XtU5BP1fLVuDl3zhaZ7Gg3e5viK1tTyJpAQodvJrst3BKTYxX3Ttmg/jH6GzbwPd/gL4akqAPIIvfp2gzXlSSdpPv15ZoaGAhvnoEHglNGGL5c1pAhIvY3W7pbGezbTuTcDIPym0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/a9ul9Z; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso35587511fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728228536; x=1728833336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ThlZWj7Dx9fwP3BeAQPiHzm2d1SypJQ5DEsbdDuRU2s=;
        b=K/a9ul9ZfIv/qyRl6AZIdsvtbuogYXHbNwv5bjUI0OkAh6WIxJXZ8DAgCWHeFLqOmq
         XGTRexSG4Qf30TiiCxTxkP7OoPMvLpJ2HOwNrmAFVradi9UBBIGSaAnJn5+I6ieaoto7
         5/jTgzRxIZr8xO9RoeTz6aJ+GR3TMIal272t+/OZ+Zx02kCR4VMIl1gAr9+AnzNK7bGk
         /s6zrnmZzaKyLnhNI4e9ydsUhgoVOCenTHIpTE5ZvQ3bx1NypcKNG0WJVOrBHZiLoJfH
         WvQ97BeuYBvks2kMyPUt3xcWg2respsWNv5eWsO1Ft30vnm2mJlVnVC24kP5grnbKYCO
         2aQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728228536; x=1728833336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThlZWj7Dx9fwP3BeAQPiHzm2d1SypJQ5DEsbdDuRU2s=;
        b=CpuQmv6h7uKBYGLad2vOU+OXUTSFWcR0lm3uGp70dUYpOyvqtKwu/6JqCMB/zOZOV3
         Hj7oxRx9YEOSFl6r9e6Wmk3SoHE4BtxFgphho16SAaonQxncC6zPrhm8PuP5SuecbkYs
         4QEjbNbXglgslRK/v2KNiEwiLuM6i9EnZxvJ0u3bQVq9ZJUeXUgCxQim7fq95Fpo/BXs
         3XKN5j6JFSiSdIelMA5pAtGTGQj5DKFddDsX8k+sfRcrOkIAmWFWdlA3LSr8C7Rmh/bo
         0F2X7MyDlyCJwhquSDeUYoO2YQJKuf8S83wT7J5DTmOuXXq/Lv6Tkz7PPBIgqgAwau8+
         sRjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp7v6+hnz7PoAGLr3gkzxl0MxaInAiFlBNVvr3SS1vl7V26nc01w6qT8+p9sAZdMgFs174AFtlNY4oZwPb@vger.kernel.org
X-Gm-Message-State: AOJu0YzhD0GczgwprTpdwCngczDs3X8PjDT9AyxuKVnFbF1/kmie7UvR
	MBJy6xVLM0lW2i+PBjOGbhvtuulbsMsF1uD7Hygb8rA9Pu5//T8gNgm5AxY+ieQ=
X-Google-Smtp-Source: AGHT+IEJ8wxuoS6Go6cFGbv5TTVaMKmUAiBI7qUeJwG6vs5acx5f9vVLKLFZQLz0o4NTGs6UYlInUA==
X-Received: by 2002:a05:651c:220d:b0:2fa:d84a:bd93 with SMTP id 38308e7fff4ca-2faf3c6635fmr39135041fa.32.1728228535812;
        Sun, 06 Oct 2024 08:28:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9b3ace7sm5526791fa.132.2024.10.06.08.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 08:28:54 -0700 (PDT)
Date: Sun, 6 Oct 2024 18:28:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Parade PS8830 Type-C
 retimer bindings
Message-ID: <657a2qb727tm5ndz2wokxb5aiyqysppufm7evtwfbplu34yzmp@mlm4k775zm7a>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <20241004-x1e80100-ps8830-v2-1-5cd8008c8c40@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-x1e80100-ps8830-v2-1-5cd8008c8c40@linaro.org>

On Fri, Oct 04, 2024 at 04:57:37PM GMT, Abel Vesa wrote:
> Document bindings for the Parade PS8830 Type-C retimer. This retimer is
> currently found on all boards featuring Qualcomm Snapdragon X Elite SoCs
> and it is needed to provide altmode muxing between DP and USB, but also
> connector orientation handling between.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../devicetree/bindings/usb/parade,ps8830.yaml     | 129 +++++++++++++++++++++
>  1 file changed, 129 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f6721d6eee26c6d4590a12c19791b3d47a8145f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Parade PS8830 USB and DisplayPort Retimer
> +
> +maintainers:
> +  - Abel Vesa <abel.vesa@linaro.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - parade,ps8830
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XO Clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: power supply (1.07V)
> +
> +  vdd33-supply:
> +    description: power supply (3.3V)
> +
> +  vdd33-cap-supply:
> +    description: power supply (3.3V)
> +
> +  vddar-supply:
> +    description: power supply (1.07V)
> +
> +  vddat-supply:
> +    description: power supply (1.07V)

Any additional details?

> +
> +  vddio-supply:
> +    description: power supply (1.2V or 1.8V)
> +
> +  orientation-switch: true
> +  retimer-switch: true
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Super Speed (SS) Output endpoint to the Type-C connector
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: Super Speed (SS) Input endpoint from the Super-Speed PHY

or from another SS signal source, which can be a mux, a switch or
anything else. I'd say, just 'Input Super Speed (SS)'

> +        unevaluatedProperties: false
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Sideband Use (SBU) AUX lines endpoint to the Type-C connector for the purpose of
> +          handling altmode muxing and orientation switching.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: usb-switch.yaml#
> +
> +additionalProperties: false
> +

-- 
With best wishes
Dmitry

