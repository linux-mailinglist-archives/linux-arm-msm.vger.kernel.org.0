Return-Path: <linux-arm-msm+bounces-60854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A45AD40E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26B313A5A05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637842441A0;
	Tue, 10 Jun 2025 17:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7mTbqcV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8D62367CC;
	Tue, 10 Jun 2025 17:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576860; cv=none; b=tvUQ9p9Ufvedf+T/hMIaDk3yXdtfU//HTQx60dDdTf4PWTTCuUsmaSzZ87gSQcSP2Wk8Mb+tSSzX+L5Go3GaztrxkSJV3SXs2H+/bzIAawI8cqpjN+rkbuuNgnDzKxG0kHWSqBBH8rqDEiNt7YsHmIOX8NrwqG9a4i6wrCF8Ilw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576860; c=relaxed/simple;
	bh=r0iZ2Pb8qBk4fg/2LTSgcyfMLeF15guSoN8V+6upqsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIJoe7yi78qFgJc/w12RPu1/4HQAv6iqH1MJ7OjOV6b6qTdggTw0gLGFhwolPzRi5Wtn12prTy2XfiTizUrm6DKtByIbECnYfdGlJ4HNHREFdXeUZ3TuqJhgqWECTl/JsECAffaRKALd7SS2XoAFbPLCj/yHJ5JA3EQviNeoHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7mTbqcV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3CCC4CEF2;
	Tue, 10 Jun 2025 17:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749576859;
	bh=r0iZ2Pb8qBk4fg/2LTSgcyfMLeF15guSoN8V+6upqsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f7mTbqcVRdxIdlDpEjH4CeKNmi/aSrdr/0FOGFF6oAT0oV0t1LATT9qZIpqlJrFcC
	 QKRdoUAbP+pYbLX9a0Y7xzPTsNUmRzJlD58wzyiRnrf4d/5Yv+E1Qmh9suleqhf0Bu
	 3OR98SOWseL0tj9EsXV2F2cRdfEUIFpJdWn1K7aGsOGzgAQSr5KIMf27FxqoT99VWV
	 1K4NnZM8cMNjVeI3bVzi6mCLsdRaDA1dAKA9R91AlHxqf58ai10uTIQAKe2mDY/hdB
	 eI5+Kh+AsAS0DW/RNQe/Swqm+SBqmOYlM0o9b+9a3AK3G6tdZR6SFhJS6MaqlhWIod
	 XogS65rOgY/6g==
Date: Tue, 10 Jun 2025 12:34:17 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, patches@lists.linux.dev, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: Add binding for ChromeOS Pogo
 pin keyboard connector
Message-ID: <bskramnbdsoxdjuqmevt7mtcylottyd4jtwa5svz565ceqzflx@orivp6ypzksk>
References: <20250225223038.879614-1-swboyd@chromium.org>
 <20250225223038.879614-2-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225223038.879614-2-swboyd@chromium.org>

On Tue, Feb 25, 2025 at 02:30:36PM -0800, Stephen Boyd wrote:
> Describe the set of pins used to connect the detachable keyboard on
> detachable ChromeOS devices. The set of pins is called the "pogo pins".
> It's basically USB 2.0 with an extra pin for base detection. We expect
> to find a keyboard on the other side of this connector with a specific
> vid/pid, so describe that as a child device at the port of the usb
> device connected upstream.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Still waiting for the binding (patch 1) to be picked up in the USB
subsystem, or an ack...so that I can pick the dts change.

Binding looks good to me.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  .../usb/google,usb-pogo-keyboard.yaml         | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml b/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml
> new file mode 100644
> index 000000000000..053c1cfed6d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/google,usb-pogo-keyboard.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google USB Pogo Pin Keyboard
> +
> +maintainers:
> +  - Stephen Boyd <swboyd@chromium.org>
> +
> +description:
> +  ChromeOS devices with a detachable keyboard have a set of five pogo pins that
> +  are the typical four pins for USB (D+/D-, VBUS, GND) and an extra pin for
> +  base detection. The detachable keyboard is a USB device that connects to the
> +  four USB pogo pins.
> +
> +properties:
> +  compatible:
> +    const: google,usb-pogo-keyboard
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Connection to USB2 port providing USB HS signals
> +    required:
> +      - endpoint
> +
> +patternProperties:
> +  '^keyboard@[0-9a-f]{1,2}$':
> +    description: The detachable keyboard
> +    type: object
> +    $ref: /schemas/usb/usb-device.yaml
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - '#address-cells'
> +  - '#size-cells'
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    connector {
> +      compatible = "google,usb-pogo-keyboard";
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      keyboard@2 {
> +        compatible = "usb18d1,504c";
> +        reg = <2>;
> +      };
> +
> +      port {
> +        pogo_connector_in: endpoint {
> +          remote-endpoint = <&usb_hub_dsp3_hs>;
> +        };
> +      };
> +    };
> +
> +...
> -- 
> https://chromeos.dev
> 

