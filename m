Return-Path: <linux-arm-msm+bounces-34437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E29899EA42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07A97289157
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 12:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C64C1C07F0;
	Tue, 15 Oct 2024 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWVUQEiv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587831C07E0;
	Tue, 15 Oct 2024 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728996495; cv=none; b=mpD90ZA/UDGkpMxIszY8OyLIYaYpfZgceekzLtla+V+/LA2pquaJULFroilZkKoL3uRHt9WRiOT+4Wkbi1vtVpolxDMVLASj5CZxrQ3VUhKJr+yi9bhtg/20Poy58Dw+l5L3wIv5q+gCMd2ztWZ2A+jlrdDlt68wA1KXl9q9l04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728996495; c=relaxed/simple;
	bh=wsTS2WCqFOpO0DvNwr7sz9CyhmcJQl/xQAKXdzpLRqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4/yH3cy+cXr/jcaa34QUF9F0lErl20gB/T6bndtPmxKfSS+Kb0uFkAgMmIo+Azv1aRSXWTCmbp7bHy9m5UTujZrJIKNdZkFjeTaP+sUEbxmfjMFzba48USKw+vxSauYiJHDgKDqamPU3mxANWPzv/pB9QvXxXi7l5ly/V/5pDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWVUQEiv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2C9C4CED1;
	Tue, 15 Oct 2024 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728996494;
	bh=wsTS2WCqFOpO0DvNwr7sz9CyhmcJQl/xQAKXdzpLRqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VWVUQEiv5lwhjRg9Kk6XU34TBrmeKBVaNSD9I/VAYSlKhXhMavscUFgFmaNQT31RD
	 TPSMxgDSxUqbRgHs1tjTfKUCDHLySZa9m4qQoWmkSNClgIeS5yVG/wMcq/f79d5k1E
	 R2m87bIysPWEC5VyFZI2NK3UIjWPBuC2Ze88U49PbDYMp3N6+SZhm00E5A4QmxA9a/
	 OxHXiztUx0hb0FHg34uI4V16GRdlDzVqkgPRnqTgd3GOV//IIPeyuoF5sf0DQA6RTK
	 NvZdqXff5PSaFgKj2OV77MCC3cIXufZJ+SQL9a1q1nklY8XOgjm6H6wjC5b2EGDP8b
	 Z0rx+NO1xBz9Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t0gyI-000000004da-3YUb;
	Tue, 15 Oct 2024 14:48:19 +0200
Date: Tue, 15 Oct 2024 14:48:18 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Parade PS8830 Type-C
 retimer bindings
Message-ID: <Zw5kkhkT62pDoW8I@hovoldconsulting.com>
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

On Fri, Oct 04, 2024 at 04:57:37PM +0300, Abel Vesa wrote:
> Document bindings for the Parade PS8830 Type-C retimer. This retimer is
> currently found on all boards featuring Qualcomm Snapdragon X Elite SoCs
> and it is needed to provide altmode muxing between DP and USB, but also
> connector orientation handling between.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

> +  clocks:
> +    items:
> +      - description: XO Clock
> +
> +  clock-names:
> +    items:
> +      - const: xo

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

> +required:
> +  - compatible
> +  - reg

Presumably all of the supplies are also required.

Similar for clocks, etc.

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
> +            vdd-supply = <&vreg_rtmr_1p15>;
> +            vdd33-supply = <&vreg_rtmr_3p3>;
> +            vdd33-cap-supply = <&vreg_rtmr_3p3>;
> +            vddar-supply = <&vreg_rtmr_1p15>;
> +            vddat-supply = <&vreg_rtmr_1p15>;
> +            vddio-supply = <&vreg_rtmr_1p8>;
> +
> +            reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_HIGH>;

The reset line is active low.

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

Please add a newline before each child node for readability.

> +                    usb_con_ss: endpoint {

We typically avoid adding unused labels to the examples, but perhaps
here it serves as documentation?

> +                        remote-endpoint = <&typec_con_ss>;
> +                    };
> +                };

Add newline here too, and similar below.

> +                port@1 {
> +                    reg = <1>;
> +                    phy_con_ss: endpoint {
> +                        remote-endpoint = <&usb_phy_ss>;
> +                        data-lanes = <3 2 1 0>;
> +                    };
> +                };
> +                port@2 {
> +                    reg = <2>;
> +                    usb_con_sbu: endpoint {
> +                        remote-endpoint = <&typec_dp_aux>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...

Johan

