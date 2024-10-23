Return-Path: <linux-arm-msm+bounces-35489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA69ABA87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 02:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 500141F23EB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 00:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91141798F;
	Wed, 23 Oct 2024 00:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0mz5ZVx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF784182BD;
	Wed, 23 Oct 2024 00:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729643398; cv=none; b=UHRZNFUeNm8jcVsPMDg4zAwG3YM3NM6YrQx+zQv8qwTMhuNp3VFqgiRks3yK8eCz8hgpI7Qg32LNI9WWpXVesILDeGt8xgHohN1lWjezql2s8OUEW/2U1JbTjAelSzIes/n2M1UCYlaiEpmwT9UjNX6s3xMrQGNiv8zdoIgaIIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729643398; c=relaxed/simple;
	bh=+XwK/JT1w1SNstyTOM386QsOa/SKvwRLAusAM6iF2C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7ViN/rwkcQvAXJ3nmhJZDxzIs/+K2WEj6vXxykcGPYn1+tIzhDlxFPe4WK83dFNEtPQQDsOOT2u0H35UDIBwx4PWjenWZcvFC87qeuIBDP5gpxmQUn8m5/qf5aQUwmjKayvC+57Ed07fYEg9xZQ/8atXboDNnNVPQZT4QTQsEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0mz5ZVx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A1CC4CEC3;
	Wed, 23 Oct 2024 00:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729643398;
	bh=+XwK/JT1w1SNstyTOM386QsOa/SKvwRLAusAM6iF2C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U0mz5ZVxIqzRhWH9B5XTNFAe038PPbVFNZmVEUpZhzyaOAEaAvDsN5k8Kem/KrazV
	 1Or32rxWIUCa63ln9FSKavYR4f3G02ZJJrXzMOM7PJZAHm1HzEgDzMk7ZkvI4+znVv
	 Qn+wUphRHXMxXbfM+i9wKwrCEK3Bm1tl7mWzlzpJuTbLLArLjSWuuFhZkbCGTIZkoL
	 vetMI+3mok9/4HYvNmmVqT0759oa3HkVQiLHusdPL/12OuALBNXt8qg3g8Ods4gngZ
	 ZJVTXAiIEPnoTeRSf3WWipwDjbhVmLjn2JF8CzKwHwzwr4pfYxFnbhpGQmog2+fiCo
	 oQm3kxSp0U78Q==
Date: Tue, 22 Oct 2024 19:29:55 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: Add Parade PS8830 Type-C
 retimer bindings
Message-ID: <2qhd2caujzgvcrqwgwkzuyep67ru5l7acwfqdc4w3e5ikclbhi@uok7y66cgzhw>
References: <20241022-x1e80100-ps8830-v3-0-68a95f351e99@linaro.org>
 <20241022-x1e80100-ps8830-v3-1-68a95f351e99@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-x1e80100-ps8830-v3-1-68a95f351e99@linaro.org>

On Tue, Oct 22, 2024 at 01:26:54PM GMT, Abel Vesa wrote:
> Document bindings for the Parade PS8830 Type-C retimer. This retimer is
> currently found on all boards featuring Qualcomm Snapdragon X Elite SoCs
> and it is needed to provide altmode muxing between DP and USB, but also
> connector orientation handling between.

This sentence ends a bit weird to me, please polish it (although
preferably, rewrite it according to "describe your changes")

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../devicetree/bindings/usb/parade,ps8830.yaml     | 129 +++++++++++++++++++++
>  1 file changed, 129 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ee4c69eca6066e4da0373fad6c25d6e9fff83366
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

Don't know if the guidelines has changed on this, but for a single clock
we used to omit clock-names, as it doesn't add any/much value.

Regards,
Bjorn

> +
> +  ps8830,boot-on:
> +    description: Left enabled at boot, so skip resetting
> +    type: boolean
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
> +  - clock-names
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
> +            clock-names = "xo";
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

