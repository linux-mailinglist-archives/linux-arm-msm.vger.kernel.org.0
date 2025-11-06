Return-Path: <linux-arm-msm+bounces-80541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B71FDC39A22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 09:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CE981A21112
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 08:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11C1308F35;
	Thu,  6 Nov 2025 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmDL8kr5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBBA3002C5;
	Thu,  6 Nov 2025 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762418902; cv=none; b=V5w2A1EGVJbCAXbNv+xo0Mx21Ycuhn+5I5ZyRI7B2oGmrLeKqoe4OQZ4TfEQEtIn3GhBw/OUBAmMaGX0f4FfSsi4lDUDmuUAM55N65gtpx/idA/8BAyYiZzQp63hLauFm+sZTZrV4CPU42NI93wc7llXZ3KDGAGX/lxzDd97Mu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762418902; c=relaxed/simple;
	bh=zckLRNukcp03dx43dCWtDB8En+8nFsNdYJbK7sYTUZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reEWf5nRptwLUhwrLHuBEieiFGJkA/qo4lvWsztjfg0uQeTqXWBQqS+30PMkbsZe+u4hMT9zLEGdUE9WmUj26IM3UU38Wy/mi20iglDsNFUVC4SMljqIlg6i4PXjGeQt8EVcFRb8Qic0NUnfe3aM4OvNwqQhqIabLIuJn84YCQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmDL8kr5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870F6C116C6;
	Thu,  6 Nov 2025 08:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762418902;
	bh=zckLRNukcp03dx43dCWtDB8En+8nFsNdYJbK7sYTUZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmDL8kr51DyTy99fAvpjF42DJxyl9vb9C54R2cbSW/SrQCkL/yd26tEj/EqR5fJUg
	 GBHKPly/rLMv1rz9xGwfnq1EIZGOty1sDFIzq5GJjH3MjsM6mkcgUXLwIK+eGnJimU
	 4L+dI2D4MkmrqmigeBJbKcM1H4D6hs1lapYS61EYLJl2GdkBZjFjOieGcYW4UE+Z8n
	 Jpl7mYbIC9qarWF7+lkGeyNPyAMrIijFJ01JyE23AtC3U+yYD234NQGhEN2j+NLw9W
	 fWIcCkq/IHRZ4HzBSFFu0NwlMBxU38UlyGd0M7bvi36oiBo7EfRitObQbAy04zx329
	 wKfQ72AQCzBww==
Date: Thu, 6 Nov 2025 09:48:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Casey Connolly <casey.connolly@linaro.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: panel: Add Samsung SOFEF00 DDIC with
 panel
Message-ID: <20251106-enlightened-centipede-of-tempering-3cfa50@kuoka>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
 <20251104-sofef00-rebuild-v1-1-dfcfa17eb176@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104-sofef00-rebuild-v1-1-dfcfa17eb176@ixit.cz>

On Tue, Nov 04, 2025 at 11:16:09PM +0100, David Heidelberg wrote:
> Basic description for S6E3FC2X01 DDIC with attached panels
> 
>  - Samsung AMS601NT22 6.01 inch, 1080x2160 pixels, 18:9 ratio
>  - Samsung AMS628NW01 6.28 inch, 1080x2280 pixels, 19:9 ratio
> 
> This panel has three supplies, while panel-simple-dsi is limited to one.
> There is no user of this compatible, nor the compatible make sense.

There are. git grep samsung,sofef00, gives me two users.

> Remove it from simple DSI panel definitions.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

..

>  additionalProperties: false
>  
>  required:
>    - compatible
> +  - power-supply
>    - reg
>  
>  examples:
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
> new file mode 100644
> index 0000000000000..527a10e3b798e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,sofef00.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SOFEF00 AMOLED DDIC
> +
> +description: The SOFEF00 is display driver IC with connected panel.

Description goes below maintainers, see example-schema.

> +
> +maintainers:
> +  - David Heidelberg <david@ixit.cz>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +            # Samsung 6.01 inch, 1080x2160 pixels, 18:9 ratio
> +          - samsung,sofef00-ams601nt22
> +            # Samsung 6.28 inch, 1080x2280 pixels, 19:9 ratio
> +          - samsung,sofef00-ams628nw01

These were not in the old binding, so please explain in the commit msg
reasons for adding new front compatibles.

> +      - const: samsung,sofef00
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios: true

Drop, not needed. It can stay required, though.

> +
> +  port: true

Drop

> +
> +  vddio-supply:
> +    description: VDD regulator
> +
> +  vci-supply:
> +    description: VCI regulator
> +
> +  poc-supply:
> +    description: POC regulator

1st poc, then vci then vddio to keep it more-or-less sorted. Same in
required list.

> +
> +required:
> +  - compatible
> +  - reset-gpios
> +  - vddio-supply
> +  - vci-supply
> +  - poc-supply
> +
> +unevaluatedProperties: false

Best regards,
Krzysztof


