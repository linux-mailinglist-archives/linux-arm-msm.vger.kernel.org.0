Return-Path: <linux-arm-msm+bounces-38057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 559049CF31C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 18:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A368B48361
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 16:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D413D1E0E0A;
	Fri, 15 Nov 2024 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2IRgZtw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8681DD0E1;
	Fri, 15 Nov 2024 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731689046; cv=none; b=ohaKoC7FME+dtjEFeGQlZZYWB8GB5eNlug8R3RhVvfkE8L8M68QGjwXfrCxgiY3HrExtKi65/qbSaMCh3lMbyPJ8gV8vs7VlhKncALE9YW3FPzMvBaTZy3QfPUpQDoPufAwHTZFmHU+d3CYHRujeGOGpb5IKMFmUChd26RYyUQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731689046; c=relaxed/simple;
	bh=ilXuJtnxnZEhNToWfBgs1I7VCfwJuxfb17NPHaQCAec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYzS3emPu6Hq9DKcWA6kbBSmR0T8ailW0il+L1oI/7A3MwIT+l404LWvu9BlIbOW+CkeOVje1tthylgvQqya9SGtW8QqSXAtZ0uF/0qCSbXFO/dV5+DIxr6KXoeExBmtDAHYh1zjeqipOIAdLfaWkxosvYt1MP5ubye+tQNFW+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2IRgZtw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9098C4CECF;
	Fri, 15 Nov 2024 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731689046;
	bh=ilXuJtnxnZEhNToWfBgs1I7VCfwJuxfb17NPHaQCAec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2IRgZtwDIp1khkbVp9Wogm68BZ2G6YSydHGCjJL00Uv/uoOR8Tbl+DNGRYfHUZ0H
	 6ze2I2wXzrqy2c38O1PlPpgXiCQS/g/y4XP9gMTaQI4wRuo8urTOdL2ufoK6iZ2wUQ
	 Onbndug6lEtSht7+Iy1yrSECIxUP9K3lZCDZRAih1a+/VcP7xm6a0Aie95oG9Rex4e
	 dEf1xN6x4HuEfzqV7A5/V6V+JTZDFl2fFBS+rO4ZD5MN8MNsOsM1bFUweqARj8b92F
	 UGqCRiVqgeDsksVHE2gVQ+mEhss/NAKkb5H79C3jqfczxhXOy0yj9enQ7d72Xqzh+z
	 XSQVeOLAsVwsg==
Date: Fri, 15 Nov 2024 10:44:04 -0600
From: Rob Herring <robh@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: usb: Add Parade PS8830 Type-C
 retimer bindings
Message-ID: <20241115164404.GA3337792-robh@kernel.org>
References: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
 <20241112-x1e80100-ps8830-v5-1-4ad83af4d162@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-x1e80100-ps8830-v5-1-4ad83af4d162@linaro.org>

On Tue, Nov 12, 2024 at 07:01:10PM +0200, Abel Vesa wrote:
> The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
> controlled over I2C. It usually sits between a USB/DisplayPort PHY and the
> Type-C connector, and provides orientation and altmode handling.
> 
> Currently, it is found on all boards featuring the Qualcomm Snapdragon
> X Elite SoCs.
> 
> Document bindings for its new driver. Future-proof the schema for the
> PS8833 variant, which seems to be similar to PS8830.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../devicetree/bindings/usb/parade,ps8830.yaml     | 119 +++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2f20d20a2bdfe2499588dc621c14cd16ab159002
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Parade PS883x USB and DisplayPort Retimer
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
> +
> +  vddio-supply:
> +    description: power supply (1.2V or 1.8V)
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - reset-gpios
> +  - vdd-supply
> +  - vdd33-supply
> +  - vdd33-cap-supply
> +  - vddat-supply
> +  - vddio-supply
> +  - orientation-switch
> +  - retimer-switch
> +
> +allOf:
> +  - $ref: usb-switch.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        typec-mux@8 {
> +            compatible = "parade,ps8830";
> +            reg = <0x8>;
> +
> +            clocks = <&clk_rtmr_xo>;
> +
> +            vdd-supply = <&vreg_rtmr_1p15>;
> +            vdd33-supply = <&vreg_rtmr_3p3>;
> +            vdd33-cap-supply = <&vreg_rtmr_3p3>;
> +            vddar-supply = <&vreg_rtmr_1p15>;
> +            vddat-supply = <&vreg_rtmr_1p15>;
> +            vddio-supply = <&vreg_rtmr_1p8>;
> +
> +            reset-gpios = <&tlmm 10 GPIO_ACTIVE_LOW>;
> +
> +            retimer-switch;
> +            orientation-switch;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    endpoint {
> +                        remote-endpoint = <&typec_con_ss>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    endpoint {
> +                        remote-endpoint = <&usb_phy_ss>;
> +                    };
> +                };
> +
> +                port@2 {

No such port defined in usb-switch.yaml and you didn't define it here.

> +                    reg = <2>;
> +
> +                    endpoint {
> +                        remote-endpoint = <&typec_dp_aux>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> 
> -- 
> 2.34.1
> 

