Return-Path: <linux-arm-msm+bounces-19505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCAF8BFFFE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 16:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF865289B12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 14:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C7C86643;
	Wed,  8 May 2024 14:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9QBVdh8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E504277624;
	Wed,  8 May 2024 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715178686; cv=none; b=Ye1wg/NElVaOTzw41FfOiM0rARouwbdtWQC8hlS/tCFNRV+oZDyPzXQNqoaEBq7rOQBggMiG53N5az+5BhHPf+smwNhDxMyhWYJ/L5WqYxYqA2jBNEL6WRItgI1XFrEkGD2eMEzue2x9+Uvak/u6m7vsE2EfwkJnpiBEF/xOyHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715178686; c=relaxed/simple;
	bh=0MSmjGyNwFzrj+obrJbro+oEuYfUkHrqgs88iGFlKes=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=SVkhsLfSTMhdgYgK/D7PKZo6RQcTcv2BVPadbTHOrcZYpJ7RdvaSg4disr+0FFempxCzG3IjoNU2/0S7xsBcv0beKMzw06OoxjO2TbI3wmH3uaPIFIwt6B8LsASsN3upAnSED69fbdvq9yyjljiPrE6T0ZDb7WqDsRpsW2USOrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9QBVdh8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D80C32781;
	Wed,  8 May 2024 14:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715178685;
	bh=0MSmjGyNwFzrj+obrJbro+oEuYfUkHrqgs88iGFlKes=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=g9QBVdh8c34K2qenlSeZ5AWfHLlXvIQaPYzcnxBqz/sYBSv5bKDZgHZdX4V5Gek2w
	 y4s4GQJwTmLyYyJudBHkq6pebBO9FfcfAv7x1vbvbsF43Vjli2Hx2TMLbCHAYig47Z
	 z0mND7RjWIx5OpawfUC12xOFbwUaVf6zuPACoJeYCCM7OmywcWx9y9lXbzyYOlStnT
	 gyyi6DBKhukRM/Cqxt+Wq7WQ1hyFfFUkgi+gFD/sdObew6Xp6C6YBK+XoZNUJ2lQ7i
	 F2b41IW5XqyKy7glB80rQD5vrR2lzAM7KuXSOlMJmwCGb8kLJ/aZ2gfsM8Z1ztfKP8
	 yZ4bSV+Zmj13Q==
Date: Wed, 08 May 2024 09:31:24 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, quic_nankam@quicinc.com, 
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, 
 konrad.dybcio@linaro.org, Prahlad Valluru <quic_vvalluru@quicinc.com>, 
 conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 devicetree@vger.kernel.org
In-Reply-To: <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
References: <171405653305.2527744.3813895380659072690.robh@kernel.org>
 <20240426142442.7769-1-quic_vvalluru@quicinc.com>
 <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
Message-Id: <171517823376.1753082.4070659246393696781.robh@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi
 bridge


On Mon, 06 May 2024 18:14:10 -0500, Bjorn Andersson wrote:
> On Fri, Apr 26, 2024 at 07:54:42PM GMT, Prahlad Valluru wrote:
> > From: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
> >
> 
> Please don't thread new versions off existing version. b4 helps you with
> getting these things right, please check go/upstream for more details.
> 
> > Enable lt9611uxc bridge for qcs6490 rb3 gen2 platform.
> >
> 
> Even if it's clear what this is, I would prefer if you described the
> hardware a little bit in your commit message.
> "Rb3Gen2 has a HDMI connector, connected to DSI via a LT on i2cX.... reset and
> irq pins comes from x and y. Describe this."
> 
> > Signed-off-by: Prahlad Valluru <quic_vvalluru@quicinc.com>
> > ---
> > v2: Addressed dtschema errors
> > 	- Fixed lt9611-irq
> > 	- vdd-supply error to be ignored, as it is connected to
> > 	  input supply directly, on rb3gen2

The choice is either fix the dts or fix the binding. 

> > ---
> >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 86 ++++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > index a085ff5b5fb2..c14d4a4bb3ce 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > @@ -51,6 +51,18 @@
> >  			};
> >  		};
> >  	};
> > +
> 
> There's a stray tab here, please run checkpatch --strict on your
> patches.
> 
> > +	hdmi-connector {
> > +		compatible = "hdmi-connector";
> > +		label = "HDMI";
> > +		type = "a";
> > +
> > +		port {
> > +			hdmi_con: endpoint {
> > +				remote-endpoint = <&lt9611_out>;
> > +			};
> > +		};
> > +	};
> >
> >  	reserved-memory {
> >  		xbl_mem: xbl@80700000 {
> > @@ -530,6 +542,45 @@
> [..]
> > @@ -602,6 +653,21 @@
> >  	status = "okay";
> >  };
> >
> > +&mdss_dsi {
> 
> We want to keep nodes sorted (by address if applicable, otherwise
> alphabetically on node names and on labels). "mdss_dsi" < "mdss_edp".
> 
> So please move this up where it belongs.
> 
> > +        vdda-supply = <&vreg_l6b_1p2>;
> > +        status = "okay";
> > +};
> > +
> > +&mdss_dsi0_out {
> > +        remote-endpoint = <&lt9611_a>;
> > +        data-lanes = <0 1 2 3>;
> > +};
> > +
> > +&mdss_dsi_phy {
> > +        vdds-supply = <&vreg_l10c_0p88>;
> > +        status = "okay";
> > +};
> > +
> >  &qupv3_id_0 {
> >  	status = "okay";
> >  };
> > @@ -711,3 +777,23 @@
> >  	function = "gpio";
> >  	bias-disable;
> >  };
> > +
> > +&pm7250b_gpios {
> > +        lt9611_rst_pin: lt9611-rst-state {
> > +                pins = "gpio2";
> > +                function = "normal";
> > +
> > +                output-high;
> > +                input-disable;
> > +                power-source = <0>;
> > +        };
> > +};
> > +
> > +&tlmm {
> > +        lt9611_irq_pin: lt9611-irq-state {
> > +                pins = "gpio24";
> > +                function = "gpio";
> > +                drive-strength = <8>;
> 
> I'd expect a 2 here, so please document why this is 8.
> 
> Regards,
> Bjorn
> 
> > +                bias-disable;
> > +        };
> > +};
> > --
> > 2.17.1
> >
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/qcs6490-rb3gen2.dtb' for jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc:

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: hdmi-bridge@2b: 'vdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#






