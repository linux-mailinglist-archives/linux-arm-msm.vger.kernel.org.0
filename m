Return-Path: <linux-arm-msm+bounces-43855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E196FA007E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 11:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 439BB7A1900
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 10:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98ECB59B71;
	Fri,  3 Jan 2025 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LJ1U+Uts"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456641C9DF0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 10:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735900323; cv=none; b=HhitV4eM9jcu36RRmNpFezun7foaE0rCexIGLuITXuCgT8akpF2SYKAElnmYnhqAm/GCXIwxHj8HTP6NPLjq86Hg2ybdw/Anj2Z5W33mGK1Jys7Bjht8EamvHtpwkLCjJrHWxXVZkh1GqQ0p3V65zCWDpVgkAuc14NO7GmifRPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735900323; c=relaxed/simple;
	bh=rn5kI4N2MIQcCJF5+Uys4rQjvhwCCa49RjBo1DUZUEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldNb0SWugF43NBMBFU4Mom+e0twAjsm9q3TJu+zOG9wVntUqCNSklVrTVW7fQJWNA/ZHyrBnAgCmMTccZcfW+LRJBvUzDTdx5IrfJ6eA+S83C+92m1etetEMt9IGFfqhqP2EIMzIHsRYppT60kfna6gO4eOawRReXjGEIklX85M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LJ1U+Uts; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e3a90336eso13168734e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 02:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735900319; x=1736505119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z3hG0LJkxk/b+dIbEjXc2rw/VoRK69ZLUQbHe/N0nf8=;
        b=LJ1U+UtsL/gbxa+j4LJjP3+plyVn0aUMPmu7L/n2pF0/5dp6EXU45bekyqeXYbFHpz
         kFeeuK6+wmvGmexZFfQGW7h184A5URIp+n1nkqfr+EnpsXTAwLtmKbqlcTZaEtBEdSoY
         p5iZVmHmFqMsGcrE4Dgf0kHDwOm7mpiveurKB81uqlmfUDqGthRC7KXF3GvGDtMAAAVE
         4wWRE8KgbN5MAt1QxFMKov/aUDqNG4qUom9k0Lq3wZUJUahAP3rDg2cow3WVB0hbXSs0
         +YYstL4v0Yt0crVu0Q35CAfx6slQvMaXnNhxapXeescUfORtor5dwA9Rupsg+Gc0rbZB
         iKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735900319; x=1736505119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3hG0LJkxk/b+dIbEjXc2rw/VoRK69ZLUQbHe/N0nf8=;
        b=mfwsUswsQ2sGnSNya1W8EGJ8Ju4DyOSk00r/i8rfWPYv8lct0FQOY60RiXO/foBbs5
         NB1jKNrlrGbM0TfLqsq5OUNocvNvJXuyHBVbdJaEr8gwHUiLBIn121NP3EI3H35ztKDq
         Ev0staIyvQAEaO55G8lqaGvcads70SpDi3n5BPYTbKN3xKAw4X/2V+ihwhmSXDX9etfI
         n+uv94rStnA7S9FYLGKnLfuH/9BghO2CHiXCti2oBx94AUSXwu6AqOjX7S/IChWs0tgS
         LFPAfRIE6lE2BjzMMLJErm3r1hVViKNbilh/d3h+ZqZBkxHDRECoSJSGQLRdEBJK1Dqc
         zNPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC30DcXnJ8X0mKsLVppWQNyR2FZJQEuFD///Gin0YSlPn7yssXrJHg8l1aIQU39tjglRoKISxSJKg1onSx@vger.kernel.org
X-Gm-Message-State: AOJu0YwcWuXlDoaeu29W/9vggnkUR4WNwdkBIpbBqHe/flY6pKZRLbD/
	e+wRdcBUio6CBpQ10oKC9jBAC5yWSGm8h8q23+uPqeFG4jzKvCS1cwb/268UNC0=
X-Gm-Gg: ASbGnctasc4ZNJQSXfWotYddyeBMiAgGEidkpE18ZZU1EqWr350ctqFLmLRom7NWfHN
	iOGH2j1HW9IL0kEgY7CtNpXOhg1V6DwTeaVYTl7/xdGtcuWyXdyVpe+SqbtrJVrUFy4dHxisgtb
	CuFb5Auxd4U+OuijOjfB4IFL8lctfStPo2egxyB12EWNIO+BCXvkxCm0InJgSMv2i8+BqkdZq/g
	ei0rv7IIIEWHnBbidRzFnyitrlHxfNHjEIAp5SSONDhaMGhO/idswzGqr8cuSzgMDXRJHuB+B4J
	tzWSFZGIyP0LC0ds2aqeTIUQOsUEIC4MMFMQ
X-Google-Smtp-Source: AGHT+IEXhYs2BRbjKUK4ketp+Junk04OumihDu92SQhDM+pcUhEZGoTGI/D/oI9WqnYFJdPNglC5Ow==
X-Received: by 2002:a05:6512:1055:b0:53e:39e6:a1c1 with SMTP id 2adb3069b0e04-54229560360mr16235941e87.43.1735900319303;
        Fri, 03 Jan 2025 02:31:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c626sm45687951fa.13.2025.01.03.02.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:31:57 -0800 (PST)
Date: Fri, 3 Jan 2025 12:31:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <xuy6tp4dmxiqbjitmoi6x5lngplgcczytnowqjvzvq5hh5zwoa@moipssfsgw3w>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-6-quic_wasimn@quicinc.com>
 <tjrg5zqggupjo36udpyv3vynsij76f4qlus6lkbqotuimusqgq@hosmksp77sif>
 <Z3ZXWxoBtMNPJ9kk@hu-wasimn-hyd.qualcomm.com>
 <4wmxjxcvt7un7wk5v43q3jpxqjs2jbc626mgah2fxbfuouu4q6@ptzibxe2apmx>
 <Z3eMxl1Af8TOAQW/@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3eMxl1Af8TOAQW/@hu-wasimn-hyd.qualcomm.com>

On Fri, Jan 03, 2025 at 12:37:50PM +0530, Wasim Nazir wrote:
> On Fri, Jan 03, 2025 at 07:50:43AM +0200, Dmitry Baryshkov wrote:
> > On Thu, Jan 02, 2025 at 02:37:39PM +0530, Wasim Nazir wrote:
> > > On Mon, Dec 30, 2024 at 05:45:39PM +0200, Dmitry Baryshkov wrote:
> > > > On Sun, Dec 29, 2024 at 08:53:31PM +0530, Wasim Nazir wrote:
> > > > > Add device tree support for QCS9075 Ride & Ride-r3 boards.
> > > > > 
> > > > > QCS9075 lacks the safety monitoring features of Safety-Island (SAIL)
> > > > > subsystem which is available in QCS9100, and it affects thermal
> > > > > management.
> > > > > 
> > > > > Also, between ride and ride-r3 ethernet phy is different.
> > > > > Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.
> > > > 
> > > > Your board files duplicate sa8775p-ride-r3.dts and sa8775p-ride.dts, but
> > > > include them. Existing qcs9100-ride-r3.dts and qcs9100-ride-r3.dts just
> > > > include corresponding SA8775P files.
> > > > 
> > > > This is not ideal for the following reasons:
> > > > - The approach is not uniform (between QCS9100 and QCS9075), which might
> > > >   lead to mistakes.
> > > > - The approach ends up duplicating DT code unnecessarily, which can lead
> > > >   to issues being patches in the one board file, but not in the other
> > > >   file.
> > > > 
> > > > If there are any reasons why you want to follow this approach, they must
> > > > be a part of the commit message.
> > > > 
> > > 
> > > Hi Dmitry,
> > > 
> > > Initially, we included the DTS [1] file to avoid duplication. However,
> > > based on Krzysztof's previous suggestion [2], we change to this format.
> > > 
> > > Please let us know how to proceed further on this.
> > 
> > Krzysztof asked you to include DTSI files instead of including DTS
> > files. Hope this helps.
> 
> Are you suggesting that we should also modify the 9100-ride files to
> include DTSI instead of DTS for consistency between QCS9100 and QCS9075?
> However, this would result in the duplication of Ethernet nodes in all
> the ride board files. Would that be acceptable?

git mv foo.dts foo.dtsi
echo '#include "foo.dtsi"' > foo.dts
git add foo.dts
git commit

> 
> > 
> > > 
> > > [1] https://lore.kernel.org/all/20241119174954.1219002-6-quic_wasimn@quicinc.com/
> > > [2] https://lore.kernel.org/all/8cf9edc0-a0cb-4fd0-b10e-2138784dfba3@kernel.org/
> > > 
> > > > > 
> > > > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/Makefile            |  2 +
> > > > >  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 46 ++++++++++++++++++++
> > > > >  arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 46 ++++++++++++++++++++
> > > > >  3 files changed, 94 insertions(+)
> > > > >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > > > >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > > > index 78613a1bd34a..41cb2bbd3472 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > > > @@ -118,6 +118,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> > > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
> > > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> > > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
> > > > > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride.dtb
> > > > > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride-r3.dtb
> > > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> > > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> > > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > > > > new file mode 100644
> > > > > index 000000000000..d9a8956d3a76
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > > > > @@ -0,0 +1,46 @@
> > > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > > > +/*
> > > > > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > + */
> > > > > +/dts-v1/;
> > > > > +
> > > > > +#include "sa8775p-ride.dtsi"
> > > > > +
> > > > > +/ {
> > > > > +	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
> > > > > +	compatible = "qcom,qcs9075-ride-r3", "qcom,qcs9075", "qcom,sa8775p";
> > > > > +};
> > > > > +
> > > > > +&ethernet0 {
> > > > > +	phy-mode = "2500base-x";
> > > > > +};
> > > > > +
> > > > > +&ethernet1 {
> > > > > +	phy-mode = "2500base-x";
> > > > > +};
> > > > > +
> > > > > +&mdio {
> > > > > +	compatible = "snps,dwmac-mdio";
> > > > > +	#address-cells = <1>;
> > > > > +	#size-cells = <0>;
> > > > > +
> > > > > +	sgmii_phy0: phy@8 {
> > > > > +		compatible = "ethernet-phy-id31c3.1c33";
> > > > > +		reg = <0x8>;
> > > > > +		device_type = "ethernet-phy";
> > > > > +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> > > > > +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> > > > > +		reset-assert-us = <11000>;
> > > > > +		reset-deassert-us = <70000>;
> > > > > +	};
> > > > > +
> > > > > +	sgmii_phy1: phy@0 {
> > > > > +		compatible = "ethernet-phy-id31c3.1c33";
> > > > > +		reg = <0x0>;
> > > > > +		device_type = "ethernet-phy";
> > > > > +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> > > > > +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> > > > > +		reset-assert-us = <11000>;
> > > > > +		reset-deassert-us = <70000>;
> > > > > +	};
> > > > > +};
> > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > > > new file mode 100644
> > > > > index 000000000000..3b524359a72d
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > > > @@ -0,0 +1,46 @@
> > > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > > > +/*
> > > > > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > + */
> > > > > +/dts-v1/;
> > > > > +
> > > > > +#include "sa8775p-ride.dtsi"
> > > > > +
> > > > > +/ {
> > > > > +	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
> > > > > +	compatible = "qcom,qcs9075-ride", "qcom,qcs9075", "qcom,sa8775p";
> > > > > +};
> > > > > +
> > > > > +&ethernet0 {
> > > > > +	phy-mode = "sgmii";
> > > > > +};
> > > > > +
> > > > > +&ethernet1 {
> > > > > +	phy-mode = "sgmii";
> > > > > +};
> > > > > +
> > > > > +&mdio {
> > > > > +	compatible = "snps,dwmac-mdio";
> > > > > +	#address-cells = <1>;
> > > > > +	#size-cells = <0>;
> > > > > +
> > > > > +	sgmii_phy0: phy@8 {
> > > > > +		compatible = "ethernet-phy-id0141.0dd4";
> > > > > +		reg = <0x8>;
> > > > > +		device_type = "ethernet-phy";
> > > > > +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> > > > > +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> > > > > +		reset-assert-us = <11000>;
> > > > > +		reset-deassert-us = <70000>;
> > > > > +	};
> > > > > +
> > > > > +	sgmii_phy1: phy@a {
> > > > > +		compatible = "ethernet-phy-id0141.0dd4";
> > > > > +		reg = <0xa>;
> > > > > +		device_type = "ethernet-phy";
> > > > > +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> > > > > +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> > > > > +		reset-assert-us = <11000>;
> > > > > +		reset-deassert-us = <70000>;
> > > > > +	};
> > > > > +};
> > > > > --
> > > > > 2.47.0
> > > > > 
> > > > 
> > > > -- 
> > > > With best wishes
> > > > Dmitry
> > > 
> > > 
> > > Thanks & Regards,
> > > Wasim
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

