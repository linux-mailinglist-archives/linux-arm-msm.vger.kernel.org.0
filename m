Return-Path: <linux-arm-msm+bounces-72589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9D7B49226
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 16:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B5741896FD7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 14:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEAB30AD18;
	Mon,  8 Sep 2025 14:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAgBzREe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34081A08A3;
	Mon,  8 Sep 2025 14:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757343340; cv=none; b=i1LuVhDTzU4X4sF0pRo7okyYqo/moxz08DmOyri86WZh+P/WivAOxe3xM2oixHON0lNxj96FShypHDd1vdnCLdEAQUYE0MLxFEiIE9H79F7pEB9miAnvT3/W5H2hoc2yYoYEkRQMhEoiEAGJChm0yAtWlBXPx5ffJ3XLnAMuea8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757343340; c=relaxed/simple;
	bh=t/WnijEqWrI7lfQgdyWMtL7p6iChFqa0atlW2OUfWcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrMgZgY2JVWcihZ0EGrGP3Cq2OCVax0SvicAJF2bFy7ZKeV0iLX7B9iWm7lz81EKV6tpxTJPNLs5tuiILmcBkBvcRWxb6/vVGjkP0QdAHJABM7SMPiehit8uPP0uppEwKSnk21oa0jvaNSQ7K1gkYWhsevyfwv72WrI05rWfR8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAgBzREe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCC1C4CEF1;
	Mon,  8 Sep 2025 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757343340;
	bh=t/WnijEqWrI7lfQgdyWMtL7p6iChFqa0atlW2OUfWcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uAgBzREerh2gt3Dz9L0qIj4PrKiUZ/tIkjtJVRc1+AVYn+dH0KMrKsvBOI/a/pku+
	 raufjerkOA5V7+l1mzV5gKxm+Iz0KSRUFPrSkRNHb3gJQznwTF5SNCbCR3Bb55+qsJ
	 tbM6tuNyYHQE3rtXcuIDbCkuAA1krB0mvDrFg7OKjM3hQiLAZDoVbQIbrWvYK6UERa
	 JrXZAsIBW6tWKWzkjeygFykD8StkWRR18J75UaCdXuBz8HvtEPDPw6nQdDabJUz8Ea
	 uL3SR07pgrGCakj74XQlweg2pEsHiYDw35cSH9MD3QsIB9qthv8BgANe7v3yV4f5we
	 /uRbXR3IHwHfg==
Date: Mon, 8 Sep 2025 09:55:37 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Umang Chheda <umang.chheda@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: monaco-evk: Add sound card
Message-ID: <nphea3rtl3z2tgpyn4g4hf7ticbg4kyhgv4ht25etfxspsgkv6@dm67wp7x4mdt>
References: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
 <20250905192350.1223812-5-umang.chheda@oss.qualcomm.com>
 <7bzlof2wyqqorhh4xck46wd43zlehm4vhej2oaxajo4dxn5p7p@oc3vikzxcwke>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bzlof2wyqqorhh4xck46wd43zlehm4vhej2oaxajo4dxn5p7p@oc3vikzxcwke>

On Sat, Sep 06, 2025 at 10:26:23PM +0300, Dmitry Baryshkov wrote:
> On Sat, Sep 06, 2025 at 12:53:50AM +0530, Umang Chheda wrote:
> > From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > 
> > Add the sound card for monaco-evk board and verified playback
> > functionality using the max98357a I2S speaker amplifier and I2S
> > microphones. The max98357a speaker amplifier is connected via
> > High-Speed MI2S HS0 interface, while the microphones utilize the
> > Secondary MI2S interface and also enable required pin controller
> > gpios for audio.
> > 
> > Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 52 +++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/qcs8300.dtsi   | 37 ++++++++++++++++++
> >  2 files changed, 89 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > index 93e9e5322a39..f3c5d363921e 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > @@ -6,6 +6,7 @@
> >  /dts-v1/;
> > 
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/sound/qcom,q6afe.h>
> >  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > 
> >  #include "qcs8300.dtsi"
> > @@ -24,6 +25,57 @@ aliases {
> >  	chosen {
> >  		stdout-path = "serial0:115200n8";
> >  	};
> > +
> > +	dmic: audio-codec-0 {
> > +		compatible = "dmic-codec";
> > +		#sound-dai-cells = <0>;
> > +		num-channels = <1>;
> > +	};
> > +
> > +	max98357a: audio-codec-1 {
> > +		compatible = "maxim,max98357a";
> > +		#sound-dai-cells = <0>;
> > +	};
> > +
> > +	sound {
> > +		compatible = "qcom,qcs8275-sndcard";
> 
> qcs8300
> 

If the Monaco EVK actually is QCS8300... But, I presume qcs8275 and
qcs8300 are identical when it comes to sound?

@Mohammad, if this is the case can't we just support the
qcom,monaco-sndcard instead to avoid this confusion?

Regards,
Bjorn

> > +		model = "MONACO-EVK";
> > +
> 
> -- 
> With best wishes
> Dmitry

