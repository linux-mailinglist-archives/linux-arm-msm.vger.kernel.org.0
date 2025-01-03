Return-Path: <linux-arm-msm+bounces-43816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63646A003C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 06:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A7C71883903
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 05:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1561D14D2A0;
	Fri,  3 Jan 2025 05:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jxLp3ukB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB76256E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 05:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735883451; cv=none; b=h7uYbuvm1a1q/5KlSaed+4fH0f4KuJQ5a41AUKCk4GwL4199p8EVpuHVGojmIC/x/zM3Nb7GibY3pEpaRLPpo73MoVjia5fCBAEuKz7cy/sEh9IdIAhi509JhjAmu15KRT8JaCJ7YrSnebbPnof4tpOrSfrNaw/Jp0sNIfMQ3Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735883451; c=relaxed/simple;
	bh=fXowmKMW5FJGzLXztYyhAeU3RH0a5EXsRUBWBx6n5pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtZ0unWA77g8ES6LhP0figlihVo+MyX7uSMMCVR2P1VIFyz4snqaynQw3vXcYhp6Q4kqTSeHzgI6Eu4wBR8YHp1xbgqm0TEm0YrKUz5TH7jrlST8/F86Vbx+kr5wkiGIVyoKGjXaihT7zgXxwmsRPSZE4d0cmzIY/9eRyBn/pOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jxLp3ukB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54252789365so5217178e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2025 21:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735883447; x=1736488247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FEkYdYcmtixMITLyh3+SG+VW63Pt/UrSIJ1+EOVVUrk=;
        b=jxLp3ukBZxxv9GalHysDVFDp+rW2K7WRADHQK1G/0EH6zsx/zok1VtZP7vfroBuKhH
         yXgS9q/Z2J1OL/TijRQ01w4lzj0QPCuRIlQwwyqoK6R6EZQ/akoTpRnUrYh6B6GepBJZ
         9/rEeqUPvGZVg6tkdYQCFY8bgKtMg5kGkvV5RomUGNFHrA+3whcLJUYlR/jRj39HRQW5
         w33VFSu95HaeUl2uk4d4xKV+dJGyQgY0thN1zOgl1Fz0OLgfuRxq9f4YG6gO1NOXveT6
         GixsbSlKnSbu4AQvgU4Y04+Lp+qFGjAIAo/iBgSsMHQceEt3HU2f0uFjggdtsdTP64Q5
         9f0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735883447; x=1736488247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEkYdYcmtixMITLyh3+SG+VW63Pt/UrSIJ1+EOVVUrk=;
        b=IjhGDUjH9KiKxiqHOBXlDmQWQqC/Eu8jvCixjr79aLEmNiomLmO1kV2FwiFiVXTe0g
         K9UDKW62Zf6JAW+9CkBgbBoSjtFBGLQXIypx0jEqQk4BcOSvLdQD9wiRmZQbhUujJmOk
         8DowqHieiyKlsTWVJxN1pagbIGokidfJ0Q4KKCdlIuLtMeO9ZYZEWqB1tVxvBDTvHT9Y
         Bcx1enuW5ltLm1xdIvwDRgwgJ0d0uWus9djt+VCq+DzHq3DkD+YKALYJnVrga8k4B4oF
         aW+xXdW/d5a3w+DuYywKIK+vV3oUy8Qc/AtccwkHg/WUCTyTPjygZwZD9eQgtOY+xsI4
         9j2g==
X-Forwarded-Encrypted: i=1; AJvYcCWvIE3piX+O6HIE9Cz62TV+IC4KOy4CXDX2l42NB3d6ETcK+0BHmmhTqMQR060ab/EO8Y1+Y7S8EkEE1MeF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxda+VIIgMS6Fa9Ne/KQZ1KjHuEscyZYQ9PI+Bf2/8LrPZMdSk2
	cI9CMmmQ2ooC4MRNeWZORNZ8/Z1dmJKc19gMw+3x/4nFiRnM293AutpWabbnqjI=
X-Gm-Gg: ASbGncuXAYFqaBVXK3nSiNhyVgypw4nvTgNSBr2uUClNWBP9wgL89ejizqH83ZhZ5Xo
	j2x8ybfWjtoR7ZDoAvMcbnCaG2sOgQpHESvZqI7mh/N/20xCL+urBumU6QOYhpnDN2xxqJa88s0
	0cps2UrqDza6OY2wTaX5A+cchWr/G8M2tdmk3pKhkMtp+0HAoNOsmjw2r1isvGB/IdGxqArOBMN
	UeG3IqKP76Sh00ky4oCkUTHXMPpSVyT8FQDmQB+S954vISG1I3YCtP5VBY8qgt1cf82UnjkJcur
	sHRy0/XOpLDJAAD5nrMoY4DJWMezbVzMO0qM
X-Google-Smtp-Source: AGHT+IFHYtpTHlT3k8Ra3JiNFgtC3CZwd5xUPxcQTLH76XONxYDGP3ZLhk4BoKGO51IbGEpw6tJ1ng==
X-Received: by 2002:a05:6512:3e15:b0:53e:1c3e:34 with SMTP id 2adb3069b0e04-542295911b0mr16429269e87.38.1735883447287;
        Thu, 02 Jan 2025 21:50:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422382faa1sm3987436e87.238.2025.01.02.21.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:50:46 -0800 (PST)
Date: Fri, 3 Jan 2025 07:50:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <4wmxjxcvt7un7wk5v43q3jpxqjs2jbc626mgah2fxbfuouu4q6@ptzibxe2apmx>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-6-quic_wasimn@quicinc.com>
 <tjrg5zqggupjo36udpyv3vynsij76f4qlus6lkbqotuimusqgq@hosmksp77sif>
 <Z3ZXWxoBtMNPJ9kk@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3ZXWxoBtMNPJ9kk@hu-wasimn-hyd.qualcomm.com>

On Thu, Jan 02, 2025 at 02:37:39PM +0530, Wasim Nazir wrote:
> On Mon, Dec 30, 2024 at 05:45:39PM +0200, Dmitry Baryshkov wrote:
> > On Sun, Dec 29, 2024 at 08:53:31PM +0530, Wasim Nazir wrote:
> > > Add device tree support for QCS9075 Ride & Ride-r3 boards.
> > > 
> > > QCS9075 lacks the safety monitoring features of Safety-Island (SAIL)
> > > subsystem which is available in QCS9100, and it affects thermal
> > > management.
> > > 
> > > Also, between ride and ride-r3 ethernet phy is different.
> > > Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.
> > 
> > Your board files duplicate sa8775p-ride-r3.dts and sa8775p-ride.dts, but
> > include them. Existing qcs9100-ride-r3.dts and qcs9100-ride-r3.dts just
> > include corresponding SA8775P files.
> > 
> > This is not ideal for the following reasons:
> > - The approach is not uniform (between QCS9100 and QCS9075), which might
> >   lead to mistakes.
> > - The approach ends up duplicating DT code unnecessarily, which can lead
> >   to issues being patches in the one board file, but not in the other
> >   file.
> > 
> > If there are any reasons why you want to follow this approach, they must
> > be a part of the commit message.
> > 
> 
> Hi Dmitry,
> 
> Initially, we included the DTS [1] file to avoid duplication. However,
> based on Krzysztof's previous suggestion [2], we change to this format.
> 
> Please let us know how to proceed further on this.

Krzysztof asked you to include DTSI files instead of including DTS
files. Hope this helps.

> 
> [1] https://lore.kernel.org/all/20241119174954.1219002-6-quic_wasimn@quicinc.com/
> [2] https://lore.kernel.org/all/8cf9edc0-a0cb-4fd0-b10e-2138784dfba3@kernel.org/
> 
> > > 
> > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile            |  2 +
> > >  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 46 ++++++++++++++++++++
> > >  arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 46 ++++++++++++++++++++
> > >  3 files changed, 94 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > index 78613a1bd34a..41cb2bbd3472 100644
> > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > @@ -118,6 +118,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
> > > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride.dtb
> > > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride-r3.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > > new file mode 100644
> > > index 000000000000..d9a8956d3a76
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > > @@ -0,0 +1,46 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause
> > > +/*
> > > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > + */
> > > +/dts-v1/;
> > > +
> > > +#include "sa8775p-ride.dtsi"
> > > +
> > > +/ {
> > > +	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
> > > +	compatible = "qcom,qcs9075-ride-r3", "qcom,qcs9075", "qcom,sa8775p";
> > > +};
> > > +
> > > +&ethernet0 {
> > > +	phy-mode = "2500base-x";
> > > +};
> > > +
> > > +&ethernet1 {
> > > +	phy-mode = "2500base-x";
> > > +};
> > > +
> > > +&mdio {
> > > +	compatible = "snps,dwmac-mdio";
> > > +	#address-cells = <1>;
> > > +	#size-cells = <0>;
> > > +
> > > +	sgmii_phy0: phy@8 {
> > > +		compatible = "ethernet-phy-id31c3.1c33";
> > > +		reg = <0x8>;
> > > +		device_type = "ethernet-phy";
> > > +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> > > +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> > > +		reset-assert-us = <11000>;
> > > +		reset-deassert-us = <70000>;
> > > +	};
> > > +
> > > +	sgmii_phy1: phy@0 {
> > > +		compatible = "ethernet-phy-id31c3.1c33";
> > > +		reg = <0x0>;
> > > +		device_type = "ethernet-phy";
> > > +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> > > +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> > > +		reset-assert-us = <11000>;
> > > +		reset-deassert-us = <70000>;
> > > +	};
> > > +};
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > new file mode 100644
> > > index 000000000000..3b524359a72d
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > @@ -0,0 +1,46 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause
> > > +/*
> > > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > + */
> > > +/dts-v1/;
> > > +
> > > +#include "sa8775p-ride.dtsi"
> > > +
> > > +/ {
> > > +	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
> > > +	compatible = "qcom,qcs9075-ride", "qcom,qcs9075", "qcom,sa8775p";
> > > +};
> > > +
> > > +&ethernet0 {
> > > +	phy-mode = "sgmii";
> > > +};
> > > +
> > > +&ethernet1 {
> > > +	phy-mode = "sgmii";
> > > +};
> > > +
> > > +&mdio {
> > > +	compatible = "snps,dwmac-mdio";
> > > +	#address-cells = <1>;
> > > +	#size-cells = <0>;
> > > +
> > > +	sgmii_phy0: phy@8 {
> > > +		compatible = "ethernet-phy-id0141.0dd4";
> > > +		reg = <0x8>;
> > > +		device_type = "ethernet-phy";
> > > +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> > > +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> > > +		reset-assert-us = <11000>;
> > > +		reset-deassert-us = <70000>;
> > > +	};
> > > +
> > > +	sgmii_phy1: phy@a {
> > > +		compatible = "ethernet-phy-id0141.0dd4";
> > > +		reg = <0xa>;
> > > +		device_type = "ethernet-phy";
> > > +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> > > +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> > > +		reset-assert-us = <11000>;
> > > +		reset-deassert-us = <70000>;
> > > +	};
> > > +};
> > > --
> > > 2.47.0
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> 
> Thanks & Regards,
> Wasim

-- 
With best wishes
Dmitry

