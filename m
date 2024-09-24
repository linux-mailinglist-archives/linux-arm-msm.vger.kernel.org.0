Return-Path: <linux-arm-msm+bounces-32326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAD99849D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 18:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B63B1C22B26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 16:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7DC1A4F16;
	Tue, 24 Sep 2024 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jfjQhOMn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41CD1AB6F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727196106; cv=none; b=jt2XN48D58KMFLFhCyY2UdTIfwyLujai0o7TQ17RGZdLq84u/qCIIMW5hgTscjd+4+8iAM1vX9Q1Cu9WYV7cO2vg0PjDJwjV1tYK1jR/zHOK9FLu0qXLzboTAgqsFTPpZYtz3Io6PMDTCtmKDNBqvAgTrbGp++w+Ltw/qUNwIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727196106; c=relaxed/simple;
	bh=Prh+3j7UaMsFa6Z08/GrdXNcF2VkeTu8GBdMUK87Lo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojl12zTOR2vmqwKG3+wXjuzbzpfQf+jAQTcaZPc/rrlqDbahJt3cTkr9rJePcbmC1yj6vTWAIcgMU9RZt/u8JwzrSQbEKTfNJiqQ5QGWlXnoBHa3zO2jhYV3XYj/1qfD1EqPJPs0cwextJJ05c4+sqpblGFVOpLpQboDLiW3apc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jfjQhOMn; arc=none smtp.client-ip=209.85.217.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f66.google.com with SMTP id ada2fe7eead31-49bcbf7bdb9so1930648137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 09:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727196104; x=1727800904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wKFcq68krKcoUA32HXrqc6ME7X0w/Gnspu3t4IYxZ54=;
        b=jfjQhOMntQ5t/ywzfQqO0x9ejAxlNJbuDPCLjKgBiznqt4lDo6ZhEQlZQKlNLvwObG
         hS7PluPQ4W9xHnOPakFocXcMSK9K5YL8Oh7mLv9dMtcE1FQjm1A5H0LoEFyQF2h/ftW7
         bKRVsLccuZAq42YZca3IvYxKn2JF5RA+apc9CJtzPlAA8VwHtlq5D+TWAV1k7UR7Dmfw
         fnbE2EaUhza+5/j+Ca/3YPHYHND6r4m4bnNGV9z0M7SV9RaDy3AcM4LdmuCJKxQBHXos
         y0d7he0V5Jce7yD+0Ed9eMBdna9MUdUaDzXSEeWL72Tgloy0jGtq39VCJ4Mclr+FBBEZ
         c5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727196104; x=1727800904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKFcq68krKcoUA32HXrqc6ME7X0w/Gnspu3t4IYxZ54=;
        b=lbvxiNVdMPPoopzJMm1dAfYWPm/NHd2xbpdO+tIaoUmgjV74E2NALn31QaAgQqnd2r
         DrWYRBDfLhIStm5yopeSHJL6s8tb2vio6giHjCD2e2sYCGwBOH1981kPiWuZaugNMzel
         Ljfa4PYnBS5yuY+4kRqB5ecv72ZuF/CBCQq/ykd5WGswksyd5bUAY9bLATl7YuSpfW+a
         pc0c+gRbOcP48E4X5epr4r9KUU2tVMKAswi4PHzjntlskKyunOGfXHakPP6H0r9ZvAHj
         wi69vkqvNmPe/cyXRODghnIADYSFtPPJvvMnN95ZG1IP/Tls+rqtUBf/dmcSmAvMakLH
         PIaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhYf0j5POFcpWCi6H62+9e6tGBIhdSItVZToDwqNfHNJhp+ehpNTGfQCgJGVoc6aC49Lf4x2X3LDCTPlz0@vger.kernel.org
X-Gm-Message-State: AOJu0YyP2W/MPbZDSCBU6M0xN9/NmjBes+QE3f4tgzT1eufC9Vucj377
	w6109Fh5V2CbvSzKFsbXJQvahz2flaPzZBS+po/hZpVpHtoUqj5R5UvPzNErLPw=
X-Google-Smtp-Source: AGHT+IEbKvtyjKhabAyEh03JO+iNT62nJhG9gP0ReHnRFsz8uhKocJKHDYfMutFSgoagOKKUmV2zYw==
X-Received: by 2002:a05:6102:e0a:b0:492:876e:6d15 with SMTP id ada2fe7eead31-4a15dc99b01mr152354137.8.1727196103814;
        Tue, 24 Sep 2024 09:41:43 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef80:4518:32:3b61:babd])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a1517c0cacsm1003262137.19.2024.09.24.09.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 09:41:42 -0700 (PDT)
Date: Tue, 24 Sep 2024 18:41:35 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: add NXP PTN3222 eUSB2 to USB2
 redriver
Message-ID: <ZvLrv4rW6vbOws8E@linaro.org>
References: <20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org>
 <20240830-nxp-ptn3222-v2-1-4c6d8535cf6c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830-nxp-ptn3222-v2-1-4c6d8535cf6c@linaro.org>

On Fri, Aug 30, 2024 at 11:20:45AM +0300, Dmitry Baryshkov wrote:
> The NXP PTN3222 is the single-port eUSB2 to USB2 redriver that performs
> translation between eUSB2 and USB2 signalling schemes. It supports all
> three data rates: Low Speed, Full Speed and High Speed.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

FWIW:

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  .../devicetree/bindings/phy/nxp,ptn3222.yaml       | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/nxp,ptn3222.yaml b/Documentation/devicetree/bindings/phy/nxp,ptn3222.yaml
> new file mode 100644
> index 000000000000..acec5bb2391d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/nxp,ptn3222.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/nxp,ptn3222.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP PTN3222 1-port eUSB2 to USB2 redriver
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,ptn3222
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  vdd1v8-supply:
> +    description: power supply (1.8V)
> +
> +  vdd3v3-supply:
> +    description: power supply (3.3V)
> +
> +  reset-gpios: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#phy-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        redriver@4f {
> +            compatible = "nxp,ptn3222";
> +            reg = <0x4f>;
> +            #phy-cells = <0>;
> +            vdd3v3-supply = <&vreg_3p3>;
> +            vdd1v8-supply = <&vreg_1p8>;
> +            reset-gpios = <&gpio_reset GPIO_ACTIVE_LOW>;
> +        };
> +    };
> +...
> 
> -- 
> 2.39.2
> 

