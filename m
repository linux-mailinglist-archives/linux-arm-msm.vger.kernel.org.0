Return-Path: <linux-arm-msm+bounces-87523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C1881CF485A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 16:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E8323005F3B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 15:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490B1330D29;
	Mon,  5 Jan 2026 15:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5SkyFAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D32C330B0C;
	Mon,  5 Jan 2026 15:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767628382; cv=none; b=ms+K8KhnaCtBKcppmOuoJlZwXs61yRd6UK58Y0YxcgpBQbjb66BXAlU6pCK57IgHgkUtrNcZXt08anLZoMdIZsocptuQDDFwmnYFvJvATJ9ANhP4EwEXrFBhHPuTEJ55RUrnOKpDFz3Ma7i+iBqU4hKeGXXr15QfxccsdO/Nccg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767628382; c=relaxed/simple;
	bh=XH4zJgWH5veHQLTsLhePKJON+fdEjOykYl28iXm15qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSxah5wx20W1P6Op39u/u0e9VBCJFuoLSHX7+vM6cW/Sbf9U+pL4Mr31qJQOetN8IpZ1GY7Vvkp1JZmvoTSh7bf+QKRvnQJSuI8zLEM0wqgVLexbJdYUG20pO8InvI3b7VJFSqKorMXS/S6pM6qtf8cDV7gdbQbmF1/WUgyN4OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5SkyFAB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96202C116D0;
	Mon,  5 Jan 2026 15:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628381;
	bh=XH4zJgWH5veHQLTsLhePKJON+fdEjOykYl28iXm15qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a5SkyFAB1USW0DlqPI4tcJtb9WApmIUqdwIjq8J92QYj6zbOcvMRTS1T9j5WJajkM
	 gDDrejd0bXGEkb+DxPf4zGcnm0u8n3lvDwD6sbKZKnwGsggCxFz80uUhPaqZ1mvOXj
	 FihyaiaLNmdLRmDwj+z2r0zQJkzqCLOQB1ACx3Ozxnzwua6xzgSYr0+qDiLqqH06A0
	 FIZe1m2TDLFJ9kP2/smu9QWqObO2tp4NEvlJqjq80XY84VyabZTJZdaVjuqQCu1vWi
	 3uXYf2M27VcK04AKcp6fc7SK8CezMFx5nVALW7dyAVZC759FmOGwUJBwfCMsYvGfP5
	 aS5WrFUZMvMiA==
Date: Mon, 5 Jan 2026 09:52:58 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/5] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
Message-ID: <fhkit2bsfwzqpiytjdbg3oawbi3wbhpfcculbiyabe4vnslypr@77jlgmxukrhv>
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-3-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230130227.3503590-3-tessolveupstream@gmail.com>

On Tue, Dec 30, 2025 at 06:32:24PM +0530, Sudarshan Shetty wrote:
> Update the gpio-backlight binding to support configurations that require
> more than one GPIO for enabling/disabling the backlight.
> 

As with the driver change, please provide a better description of what
this means. How can there be multiple enable/disable GPIOs? What is
actually controlled by your two GPIOs? Why is 2 the new maximum?

Regards,
Bjorn

> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  .../bindings/leds/backlight/gpio-backlight.yaml      | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> index 584030b6b0b9..1483ce4a3480 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> @@ -17,7 +17,8 @@ properties:
>  
>    gpios:
>      description: The gpio that is used for enabling/disabling the backlight.
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    default-on:
>      description: enable the backlight at boot.
> @@ -38,4 +39,13 @@ examples:
>          default-on;
>      };
>  
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    backlight {
> +      compatible = "gpio-backlight";
> +      gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>,
> +              <&gpio3 5 GPIO_ACTIVE_HIGH>;
> +      default-on;
> +    };
> +
>  ...
> -- 
> 2.34.1
> 

