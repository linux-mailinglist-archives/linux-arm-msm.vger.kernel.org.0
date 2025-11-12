Return-Path: <linux-arm-msm+bounces-81473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 543D1C53AEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 18:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 485E854498F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 16:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2823342506;
	Wed, 12 Nov 2025 16:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vD7tEPop"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C23342144;
	Wed, 12 Nov 2025 16:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762966159; cv=none; b=sUOIMzDN9jOWdYjgqER6pElMvRBbaY868s9y95IxDSrQDzJzOyhpvA3S75YnBz7ObbE1BZrwlCbG58UVw1gpxQpa28VGwa4MfuQ7bdR1xKSPzDderajGJ5xajn6mI7PaBxjFXMtCe8wbBw5DOXkZv7IrrP9rbKdrziBvxj2ip3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762966159; c=relaxed/simple;
	bh=0UxzDI5/2OOPFiLuL/ETR5cvUWQJ9noAD30qrtcyp4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlKvcbpJXDD4y3oZkaqZ9rwMOFDhzz38Dp9sxIl9So1uumohQh3RXsvGgDRod7Mw+KXRI2ophuhq/5bCgEucc4XrLQyCiPEygz8O/C0OF56b5+3BRbQE6jRopn6pRrBBakY6DRA+I4v7famOMKHbNYK52Qy2sysdJMPq+AdJEYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vD7tEPop; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F31C4CEF5;
	Wed, 12 Nov 2025 16:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762966159;
	bh=0UxzDI5/2OOPFiLuL/ETR5cvUWQJ9noAD30qrtcyp4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vD7tEPopA8xg0x3lHgCAEMBLbYNDe9Ek7+YnfNqQxcSE7Whx1AkVpTqfc9Oz45jIV
	 9lG/1xebJhOAS6NwBJ/8Oodww/WmwQQjS0gK8O8lTE/4oJTHkdBlx4wIvADVOthqMo
	 +7R0Kx0PRPtNS2c18wtKViAb5IoqV9znoDudUOt8WBg77FAnr6KloLdwkUAENxdppg
	 iZlrR91lUBvCsTG6zr7fu/jm3rh+Xa3FwbAT0+57rB4V+ZzTt+ffYLgtwUi8DVgFZ0
	 Exile5ZYpuKX8kQdOpjuc//MYOvAenDUm6jckTJemEB3NQSiD+zr92Ku8169uNnZOu
	 /A46aVpdm1kUA==
Date: Wed, 12 Nov 2025 10:53:36 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com, 
	Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Enable lvds panel-DV215FHM-R01 for
 rb3gen2 industrial mezzanine
Message-ID: <qps5fkbgdqqvoqa3m5l4naksyc4aoq4xqnciyrpkrbs5qcno7c@aa6ync6sk4ju>
References: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-0-6eab844ec3ac@oss.qualcomm.com>
 <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-1-6eab844ec3ac@oss.qualcomm.com>
 <kosvayxmpbngn56v7t734f4qqrc2rptkjdd7q5q23brg22dvov@cxs7kzzuapim>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kosvayxmpbngn56v7t734f4qqrc2rptkjdd7q5q23brg22dvov@cxs7kzzuapim>

On Wed, Nov 12, 2025 at 05:02:20PM +0200, Dmitry Baryshkov wrote:
> On Wed, Nov 12, 2025 at 08:18:11PM +0530, Gopi Botlagunta wrote:
> > Below is the routing diagram of dsi lanes from qcs6490 soc to
> > mezzanine.
> > 
> > DSI0 --> SW1403.4 --> LT9611uxc --> hdmi port
> >                  |
> >                   --> SW2700.1 --> dsi connector
> >                               |
> >                                --> LT9211c --> LVDS connector
> > 
> > Disable hdmi connector for industrial mezzanine and enable
> > LT9211c bridge and lvds panel node.
> > LT9211c is powered by default with reset gpio connected to 117.
> > 
> > Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> > Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> > ---
> >  .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 106 +++++++++++++++++++++
> >  1 file changed, 106 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > index 619a42b5ef48..cc8ee1643167 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > @@ -8,6 +8,112 @@
> >  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> >  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> >  
> > +/ {
> > +
> > +	hdmi-connector {
> > +		status = "disabled";
> > +	};
> > +
> > +	panel_lvds: panel-lvds@0 {
> > +		compatible = "panel-lvds";
> 
> Please describe the actual panel using compatible, etc. It's not that
> this is some generic uknown LVDS panel.
> 

I presume the mezzanine doesn't have a panel, so how do we provide the
description of the mezzanine such that a developer can quickly get up to
speed with their specific panel connected to it?

Do we leave this node disabled, just for reference, or do we specify a
specific panel and then have the developer copy and adopt this to their
panel?

The benefit of doing it like that is that we provide a complete example
and something we can test. But at the same time, If I presume we might
have users of the mezzanine without an attached LVDS panel?

> > +		data-mapping = "vesa-24";
> > +		width-mm = <476>;
> > +		height-mm = <268>;

The way this patch is written we certainly have some specific panel in
mind...

Regards,
Bjorn

> > +
> > +		status = "okay";
> > +
> > +		panel-timing {
> > +			clock-frequency = <148500000>;
> > +			hactive = <1920>;
> > +			vactive = <1080>;
> > +			hfront-porch = <88>;
> > +			hback-porch = <148>;
> > +			hsync-len = <44>;
> > +			vfront-porch = <4>;
> > +			vback-porch = <36>;
> > +			vsync-len = <5>;
> > +			de-active = <1>;
> > +		};
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				dual-lvds-odd-pixels;
> 
> Add one empty line between properties and subnodes. Drop empty line
> between reg and dual-foo-pixels.
> 
> > +				panel_in_lvds_odd: endpoint {
> > +					remote-endpoint = <&lt9211c_out_odd>;
> > +				};
> > +			};
> > +
> > +			port@1 {
> > +				reg = <1>;
> > +
> > +				dual-lvds-even-pixels;
> > +				panel_in_lvds_even: endpoint {
> > +					remote-endpoint = <&lt9211c_out_even>;
> > +				};
> > +
> > +			};
> > +		};
> > +	};
> > +
> > +};
> > +
> > +&i2c1 {
> > +	status = "okay";
> 
> No clock-frequency?
> 
> > +
> > +	lvds_bridge: lvds-bridge@29 {
> > +		compatible = "lontium,lt9211c";
> 
> Not supported in mainline and not described as a dependency in the cover
> letter.
> 
> > +		reg = <0x29>;
> > +		reset-gpios = <&tlmm 117 1>;
> 
> Use GPIO_ACTIVE_foo
> 
> > +
> > +		status = "okay";
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				lt9211c_in: endpoint {
> > +					data-lanes = <0 1 2 3>;
> > +					remote-endpoint = <&mdss_dsi0_out>;
> > +				};
> > +			};
> > +
> > +			port@2 {
> > +				reg = <2>;
> > +
> > +				lt9211c_out_odd: endpoint {
> > +					remote-endpoint = <&panel_in_lvds_odd>;
> > +				};
> > +			};
> > +
> > +			port@3 {
> > +				reg = <3>;
> > +
> > +				lt9211c_out_even: endpoint {
> > +					remote-endpoint = <&panel_in_lvds_even>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +
> > +};
> > +
> > +&lt9611_codec {
> > +	status = "disabled";
> > +};
> > +
> > +&mdss_dsi0_out {
> > +	remote-endpoint = <&lt9211c_in>;
> > +};
> > +
> >  &spi11 {
> >  	#address-cells = <1>;
> >  	#size-cells = <0>;
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

