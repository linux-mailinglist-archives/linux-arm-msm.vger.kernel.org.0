Return-Path: <linux-arm-msm+bounces-54952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D143AA968ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 14:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2110F189B3B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 12:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4BE27D766;
	Tue, 22 Apr 2025 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eo39yckB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E0F27CCCF;
	Tue, 22 Apr 2025 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324320; cv=none; b=AqUE9vEKei/gmQJsBt93BauW2rr9vOO8km3wuZ4Nqp7fFUM4aUa9rNA8R8QDICHoGQCp2HT1kpkx4DkGfCphIp9iJvSXKHewzwFi7Zs877tK6GCvf9S30kvpQMQIHRN4mTXTAOPXf8IO0i0OjYf14jjW2TyXIk98Rg2INPpZnWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324320; c=relaxed/simple;
	bh=zGIA3giuG78kc+j93vXPJJvT30mzAC2qUyglKlcVYtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wg8z9UDn11CEQfnbQ1YKuZ0HyZo+wAnbfuES5XIbPVaoV58jsZarDc4tZr2s9nrK/SsRFK/vR8Yuv6rZ14UGMRAclNKT+TqS0bQ+hdp+VEviLvbdYVplfHxx2nLtON0R68WAG4O+RIsdssWHyx8g5tVEe9ujj/hWVlHRo5csnVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eo39yckB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E36C4CEEA;
	Tue, 22 Apr 2025 12:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745324319;
	bh=zGIA3giuG78kc+j93vXPJJvT30mzAC2qUyglKlcVYtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eo39yckBjPwIQKtznL+1UvdBuAwI3WYn9qkWSEGBzf/uOatdo1uzcddLl8R/KTPbu
	 Hu6saBCpgnunIaquZiDtlofgwbJO3Rej8YmuzNHdcWMgdQIt0uFRM6lEQZcMK6+7SL
	 n9RUYeOA8njFMuSbjvX8/STWX/1z7rC+xDwOaxxAZYxS1eF1yhs8WPX0CEDqpa2phe
	 07mCC0N6FtdHcxrPQ0aPs3MNsp0EI8tmTOsMI4IB1vtDSAglnbtUVLui7coW4LBFVU
	 UoNulww5GYTMdWOzoCO4AryDvq4s20kLwcqxpWQrnx2mMchmuJEbC8udqFL5D+eeaN
	 iRTYyVO1wgTxQ==
Date: Tue, 22 Apr 2025 07:18:37 -0500
From: Rob Herring <robh@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: Re: [PATCH 5/7] dt-bindings: usb: google,cros-ec-typec: Add ports
 for DP altmode
Message-ID: <20250422121837.GA734359-robh@kernel.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-6-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416000208.3568635-6-swboyd@chromium.org>

On Tue, Apr 15, 2025 at 05:02:05PM -0700, Stephen Boyd wrote:
> Add a DT graph binding to google,cros-ec-typec so that it can combine
> DisplayPort (DP) and USB SuperSpeed (SS) data into a USB type-c endpoint
> that is connected to the usb-c-connector node's SS endpoint. Allow there
> to be multiple 'typec' nodes underneath the EC node so that one DT graph
> exists per DP bridge. The EC is actually controlling TCPCs and redrivers
> that combine the DP and USB signals together so this more accurately
> reflects the hardware design without introducing yet another DT node
> underneath the EC for USB type-c "stuff".
> 
> If the type-c ports are being shared between a single DP controller then
> the ports need to know about each other and determine a policy to drive
> DP to one type-c port or the other. If the type-c ports each have their
> own dedicated DP controller then they're able to operate independently
> and enter/exit DP altmode independently as well. We can't connect the DP
> controller's endpoint to one usb-c-connector port@1 endpoint and the USB
> controller's endpoint to another usb-c-connector port@1 endpoint either
> because the DP muxing case would have DP connected to two
> usb-c-connector endpoints which the graph binding doesn't support.
> 
> Therefore, one typec node is required per the capabilities of the type-c
> port(s) being managed. Add a port to the DisplayPort altmode as well, so
> that we can show the connection between the DP controller and the DP
> altmode. This lets us indicate which type-c ports the DP controller is
> wired to. For example, if DP was connected to ports 0 and 2, while port
> 1 was connected to another DP controller we wouldn't be able to
> implement that without having some other DT property to indicate which
> output ports are connected to the DP endpoint.
> 
> Furthermore, this supports ChromeOS designs like Corsola where a DP
> controller/PHY is split with two lanes going to one connector and the
> other two lanes going to another connector. In this case, we wouldn't
> have the graph binding under the cros-ec-typec node, but we would have
> the graph binding in the DP altmode directly connected to the DP
> controller's two output endpoints.
> 
> Cc: Rob Herring (Arm) <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Acked-by: Lee Jones <lee@kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: Łukasz Bartosik <ukaszb@chromium.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/connector/usb-connector.yaml     |   6 +
>  .../bindings/mfd/google,cros-ec.yaml          |   7 +-
>  .../bindings/usb/google,cros-ec-typec.yaml    | 165 ++++++++++++++++++
>  3 files changed, 175 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 11e40d225b9f..e3d60997c03e 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -179,6 +179,12 @@ properties:
>              $ref: /schemas/types.yaml#/definitions/uint32
>              description: VDO returned by Discover Modes USB PD command.
>  
> +          port:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: OF graph bindings modeling a data bus to the
> +              DisplayPort altmode from the DisplayPort controller. Used when
> +              the altmode switch is part of the port manager.
> +

Why can't this connection be another endpoint on port@1 as that is the 
port for the SS signals.

>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description: OF graph bindings modeling a data bus to the connector, e.g.
> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> index ac89696fa649..63d506e88abb 100644
> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> @@ -98,9 +98,6 @@ properties:
>  
>    gpio-controller: true
>  
> -  typec:
> -    $ref: /schemas/usb/google,cros-ec-typec.yaml#
> -
>    ec-pwm:
>      $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
>      deprecated: true
> @@ -163,6 +160,10 @@ patternProperties:
>      type: object
>      $ref: /schemas/extcon/extcon-usbc-cros-ec.yaml#
>  
> +  "^typec(-[0-9])*$":
> +    type: object
> +    $ref: /schemas/usb/google,cros-ec-typec.yaml#
> +
>  required:
>    - compatible
>  
> diff --git a/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
> index 3272d0e01f7e..611345bbe884 100644
> --- a/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
> @@ -26,6 +26,55 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  mux-gpios:
> +    description: GPIOs indicating which way the DisplayPort mux is steered
> +    minItems: 1
> +    maxItems: 3
> +
> +  no-hpd:
> +    description: Indicates this device doesn't signal HPD for DisplayPort
> +    type: boolean
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Port for DisplayPort (DP) data
> +
> +        properties:
> +          endpoint@0:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description: Input DP port
> +
> +        patternProperties:
> +          '^endpoint@[1-8]$':
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description: Output to the usb-c connector's DP altmode

This is odd. Generally (or always?) a port is 1 direction.

Other bindings IIRC have 3 ports in the device doing the muxing: 1 
output for connector port@1, 1 USB SS input, and 1 DP input.

Rob

