Return-Path: <linux-arm-msm+bounces-35345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B79A9A68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 09:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFB821F224A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA291494D9;
	Tue, 22 Oct 2024 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UtB/SN+6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593CE13C8F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 07:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729580547; cv=none; b=EmvRMigaPFRZaJvnOjBg5Pc+2PjQDx/AesvvixZj80e3ic9lXm71jKghYrE1Ed87LLy6f2KudHNtGIb7eDFiO6vlfCwFGI5oLnchKyNNFr2b/oTBlDgxccY/jiNclEZy2qFbf6o1IiHkETMxTgKRH0Vqw7PmYbGX1NTLdLpovL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729580547; c=relaxed/simple;
	bh=4yE8s5Gg/D7Mg1mfXzs4xFsiwPIVCKqduCQJUZDhtGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hx9BvpJgnaOGNbEKGqhngeQc/g95lXauudo5KFKdZFRpIvjoQUkQRgXA3WhX/DO2qPR2tn3oeOBc9qarftFoAO1XpdKjwDllWiBnrrFOw2fc+AEk8t70g3o0NAvbM0liPBJ4QS9pzRc5WyIhLlWGpRcb6m/O6xIg/aiHAiomY+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UtB/SN+6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so61762365e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 00:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729580543; x=1730185343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zo0xOmZ3bF1XOgnsXVyn+rFyT/PuDvUbKaYAetJa4ms=;
        b=UtB/SN+6Aqhrz6c63vBySYEAqogw7sBk/gBj9MhWxQofZXnmprhmpdzI0mUp1eJpk5
         c1C22idsUoMAt++oxTy3kFXXuz9q3dmomzII2e3ad4FJ90boRX++XCRf8pd49uEc/mjR
         8FycVbZY9OTtwe7FkD3sLAFbChmiz7mZOad8+53NRP/1CzOt7V9DpSV9+fdjHRYalu6c
         q/9l55AoNBc67kgboiJv+kRjLaeWnccllyBQYfihWBc31rJ2j7OpTWwI4xV7ecgvpd4n
         2UcdWBYZ3n+g3NOV9F8QfXhAT7s6O3OJLlL9Zfxg9y/DjN0/PUkY+RNFgCckgF5lAI3t
         yFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729580543; x=1730185343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zo0xOmZ3bF1XOgnsXVyn+rFyT/PuDvUbKaYAetJa4ms=;
        b=WRuOo4j5xZzA61wGwthCTTQQkdRcOxBPZSjRUCuuaJ0A66oLi79Tt6ZoXhi9yhov05
         xOa6AxiWSrPJ3Q7WV22JWYix6USGDRoUiQFnTcxQabY8BZAt2B97DLjYIBSnQN7T6N5O
         Gll5pXWEmI6i5iqrDXQ3dGAGhM+bsCPP0rvub7lN6vqZKdNRLe8sSQIKvRJ7OJcB0nsM
         02eSVR0LG4JAVeejOQUHIuZ520d2l/5eu3Zx23+SCDVAm65U9lmddRAldMpMow+lvhCK
         kqxRxNg9Aze/ZuCOuiaXCOBh91F9dpql2ab2KT2xdlBzlsEeBA9yssbPIqsn3l1bfARm
         F/rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkuqaFzV1FiAdvcWr/znSOC/qZ9imIkNBcvPhsSWZXVCHu7hvRniCY2gaAoaEXkkKCqXQo0sEK2o9hQJc6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Dp7pSiCtni5i3kYRpx3nT0kOT+aUdjU0FI19a9YiA3V0Zq83
	yWnew5y9eJVB2ocYAvHirUgGcHFV98+igNGKUvdMy9R3zuuKoHTRCoI4EWB77fU=
X-Google-Smtp-Source: AGHT+IEb/90ZLK03pt7rWCnU1U7KPmd5ONg5GXEb+jncfPIGAWGKj/2uCiifR3O1/uN1UB+cMvzzSA==
X-Received: by 2002:a5d:4e0e:0:b0:37d:61aa:67de with SMTP id ffacd0b85a97d-37eab7555a4mr11958766f8f.42.1729580542648;
        Tue, 22 Oct 2024 00:02:22 -0700 (PDT)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b93f92sm5881454f8f.76.2024.10.22.00.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 00:02:22 -0700 (PDT)
Date: Tue, 22 Oct 2024 10:02:20 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Parade PS8830 Type-C
 retimer bindings
Message-ID: <ZxdN/Kr5ej2YFv9T@linaro.org>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <20241004-x1e80100-ps8830-v2-1-5cd8008c8c40@linaro.org>
 <657a2qb727tm5ndz2wokxb5aiyqysppufm7evtwfbplu34yzmp@mlm4k775zm7a>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <657a2qb727tm5ndz2wokxb5aiyqysppufm7evtwfbplu34yzmp@mlm4k775zm7a>

On 24-10-06 18:28:52, Dmitry Baryshkov wrote:
> On Fri, Oct 04, 2024 at 04:57:37PM GMT, Abel Vesa wrote:
> > Document bindings for the Parade PS8830 Type-C retimer. This retimer is
> > currently found on all boards featuring Qualcomm Snapdragon X Elite SoCs
> > and it is needed to provide altmode muxing between DP and USB, but also
> > connector orientation handling between.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  .../devicetree/bindings/usb/parade,ps8830.yaml     | 129 +++++++++++++++++++++
> >  1 file changed, 129 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..f6721d6eee26c6d4590a12c19791b3d47a8145f3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
> > @@ -0,0 +1,129 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Parade PS8830 USB and DisplayPort Retimer
> > +
> > +maintainers:
> > +  - Abel Vesa <abel.vesa@linaro.org>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - parade,ps8830
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: XO Clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: xo
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> > +  vdd-supply:
> > +    description: power supply (1.07V)
> > +
> > +  vdd33-supply:
> > +    description: power supply (3.3V)
> > +
> > +  vdd33-cap-supply:
> > +    description: power supply (3.3V)
> > +
> > +  vddar-supply:
> > +    description: power supply (1.07V)
> > +
> > +  vddat-supply:
> > +    description: power supply (1.07V)
> 
> Any additional details?

Documentation doesn't say anything more than this.

> 
> > +
> > +  vddio-supply:
> > +    description: power supply (1.2V or 1.8V)
> > +
> > +  orientation-switch: true
> > +  retimer-switch: true
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Super Speed (SS) Output endpoint to the Type-C connector
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        description: Super Speed (SS) Input endpoint from the Super-Speed PHY
> 
> or from another SS signal source, which can be a mux, a switch or
> anything else. I'd say, just 'Input Super Speed (SS)'

Will use that.

> 
> > +        unevaluatedProperties: false
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Sideband Use (SBU) AUX lines endpoint to the Type-C connector for the purpose of
> > +          handling altmode muxing and orientation switching.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +allOf:
> > +  - $ref: usb-switch.yaml#
> > +
> > +additionalProperties: false
> > +
> 
> -- 
> With best wishes
> Dmitry

