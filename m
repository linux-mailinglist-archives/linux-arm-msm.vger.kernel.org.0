Return-Path: <linux-arm-msm+bounces-35885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DE79B0508
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 16:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A7AE1C22220
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 14:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C57D145FE5;
	Fri, 25 Oct 2024 14:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lf17I1vr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE59745F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 14:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729865140; cv=none; b=HUuLEZnMJw4ltxyD6bXYdOAjmDjLqsjXht2htYhIwzVT+0dCXev/kJTiBi+eRZ67qHxfuL9QXguWMwoBtU29q6K4LF72SwtN2ij1lfzftdDTzjak0m/wnHHDtnty2pEzgvxhgePXZ6LJfudeiLhhlkInyyKMP6p7IjM+kUEjXZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729865140; c=relaxed/simple;
	bh=mhPDdtyt330mcdM63wrN5tqVH3NzsiWGOIKFvHowOnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glR+6OadoWzlyweMDoWPmFX1WtdFq1p6EidDgCY8y2NGQNDg6wTXQayXzu114ZrMpnEu/Eoj5CyhJoxpZZ+iN5KvMWrjFfmcaT1kNFDkcBWf6H6SL9LwBpSTy/HWhYNmknbahMF7T7Z8Ty+v73Na4WGmy8XfVVSVqKqxqjD6wgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lf17I1vr; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so22889931fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 07:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865136; x=1730469936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn9Pt5hyYOkst6E9UWfygPgyliex/XcNrU8hJHBnOOM=;
        b=lf17I1vrXdqO6F0j2qoezG9jbFtdOSQvx3DnPG1uk0O45aIUYqEhOK4Hp6Q7PYZ/vt
         foXS0PvU/7Uytt1n2bMCCRQhHlNf8upT0k9CmFIyeS1LgFhLSRCO//LmuQS8iJx7DKrq
         1rWJWFP10mNffvj6Nzgnh4wh4qUYfTlncRUh/ispnOH10L+kWYjIqAMusH8HlaV9C7gD
         ovRbN5HRAylRnM2f3IUzKur8R2q86g2uRg4BrWT3SINT5aZeoWMYAt3Kz4YsBPEnf4Hq
         CahBEL++Hgtg21qjtCj1V88F20HPlzqhRWg1oZKchJyxZvNF6yrM7AteTalotjg6u5dZ
         2W8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865136; x=1730469936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rn9Pt5hyYOkst6E9UWfygPgyliex/XcNrU8hJHBnOOM=;
        b=WZ92jayiAd9vPdSDEDjNj1+Zi6FWNVJ9eKbagpdL/2LrYq586sB+1oAIYpepgItrPX
         Z9ozjw/pLt04tSh64nDUpnnO/duJwIshZdCqCbrIzecqo5iytNGOELMsInWfMpeZxR7Q
         qDse+qkV4BgfPYET8x+qG/dJllv8p+vrX/uhjsEwvGi/H4awrCbz3gTY8/y19jhYUq2s
         GQXIbst2gWmYlsprdGc8q1mzHgfrG1ioi+mDr9uVRcL3/sdIPkpHpyqxKHsaSabMKnZ8
         3AP2PCRKv70I3GuxQ9eJ9JyvVc8oEypSFiedlo1U5SHjL2PMXoVsffsO1KWE1g6mkuD1
         5QLg==
X-Forwarded-Encrypted: i=1; AJvYcCW/FoEoOZmU3nYEUH+NveeMyftwYjJoJSQQyWOpHcJ+tFTq7zvRmt6tKZQ1b/fEEeyueEOcGuZUIKsEHXCz@vger.kernel.org
X-Gm-Message-State: AOJu0YzAK7GnBELjwBLNTcUm3ZrzfRjJTDe9J1aQp2pssM/AX4dkU5Vm
	mMUwDjMcDjjg2PQx/zlchAHu+k9SDAlX6Jj08iRGsIsPVr+oisLiK0LAfPjxQgKyZWVVCP5ULsx
	K
X-Google-Smtp-Source: AGHT+IGPO2N8dVilguOrd+D3mg0S1fdvTrVMbg1ZQKzSI2X+KHFMOXe6V+CSQpm6d8eAH4CXe6TVWw==
X-Received: by 2002:a2e:4c0a:0:b0:2f6:4f17:aeaf with SMTP id 38308e7fff4ca-2fc9d586fc6mr34505861fa.45.1729865135784;
        Fri, 25 Oct 2024 07:05:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4612a5asm1984121fa.122.2024.10.25.07.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:05:34 -0700 (PDT)
Date: Fri, 25 Oct 2024 17:05:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, 
	quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
Message-ID: <g3wh3yjkzgdfwbj4hnabtmziwsmqn3cloffblhshrkgj3tx4h7@2w2ho2mvs5c6>
References: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com>
 <20241015-qcom_ipq_cmnpll-v4-4-27817fbe3505@quicinc.com>
 <abro3enahzbugcwokcyyhwybbokestbigvzhywxhnfrdjihni3@7ej2hkgbgtf6>
 <b336724c-1fea-4e1e-9477-66f53d746f09@quicinc.com>
 <CAA8EJprVNOLO-CoorNhvKrrSD1bNKdFrzth5BL0GHXffPv62jw@mail.gmail.com>
 <32dbf7ee-1190-401c-b6b1-bc8c70a5158c@quicinc.com>
 <cqgkc3qpupbv47rqxiyhe2m466zxcxepyfcgyaieo2sggffprx@mstqi4pqoiqc>
 <a2448df9-9b8b-4b7e-ada5-6f26d7e7da97@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2448df9-9b8b-4b7e-ada5-6f26d7e7da97@quicinc.com>

On Wed, Oct 23, 2024 at 09:05:09PM +0800, Jie Luo wrote:
> 
> 
> On 10/18/2024 11:38 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 18, 2024 at 10:03:08PM +0800, Jie Luo wrote:
> > > 
> > > 
> > > On 10/18/2024 4:11 PM, Dmitry Baryshkov wrote:
> > > > On Fri, 18 Oct 2024 at 09:55, Jie Luo <quic_luoj@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 10/18/2024 6:32 AM, Dmitry Baryshkov wrote:
> > > > > > On Tue, Oct 15, 2024 at 10:16:54PM +0800, Luo Jie wrote:
> > > > > > > The CMN PLL clock controller allows selection of an input
> > > > > > > clock rate from a defined set of input clock rates. It in-turn
> > > > > > > supplies fixed rate output clocks to the hardware blocks that
> > > > > > > provide ethernet functions such as PPE (Packet Process Engine)
> > > > > > > and connected switch or PHY, and to GCC.
> > > > > > > 
> > > > > > > Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> > > > > > > ---
> > > > > > >     arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 +++++-
> > > > > > >     arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 20 +++++++++++++++++++-
> > > > > > >     2 files changed, 24 insertions(+), 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > > > > > index 91e104b0f865..77e1e42083f3 100644
> > > > > > > --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > > > > > +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > > > > > @@ -3,7 +3,7 @@
> > > > > > >      * IPQ9574 RDP board common device tree source
> > > > > > >      *
> > > > > > >      * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> > > > > > > - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > > > + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > > >      */
> > > > > > > 
> > > > > > >     /dts-v1/;
> > > > > > > @@ -164,6 +164,10 @@ &usb3 {
> > > > > > >        status = "okay";
> > > > > > >     };
> > > > > > > 
> > > > > > > +&cmn_pll_ref_clk {
> > > > > > > +    clock-frequency = <48000000>;
> > > > > > > +};
> > > > > > > +
> > > > > > >     &xo_board_clk {
> > > > > > >        clock-frequency = <24000000>;
> > > > > > >     };
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > > > > > > index 14c7b3a78442..93f66bb83c5a 100644
> > > > > > > --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > > > > > > +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > > > > > > @@ -3,10 +3,11 @@
> > > > > > >      * IPQ9574 SoC device tree source
> > > > > > >      *
> > > > > > >      * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> > > > > > > - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > > > + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > > >      */
> > > > > > > 
> > > > > > >     #include <dt-bindings/clock/qcom,apss-ipq.h>
> > > > > > > +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
> > > > > > >     #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
> > > > > > >     #include <dt-bindings/interconnect/qcom,ipq9574.h>
> > > > > > >     #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > > > > @@ -19,6 +20,11 @@ / {
> > > > > > >        #size-cells = <2>;
> > > > > > > 
> > > > > > >        clocks {
> > > > > > > +            cmn_pll_ref_clk: cmn-pll-ref-clk {
> > > > > > > +                    compatible = "fixed-clock";
> > > > > > > +                    #clock-cells = <0>;
> > > > > > > +            };
> > > > > > 
> > > > > > Which block provides this clock? If it is provided by the external XO
> > > > > > then it should not be a part of the SoC dtsi.
> > > > > 
> > > > > The on-chip WiFi block supplies this reference clock. So keeping it in
> > > > > the SoC DTSI is perhaps appropriate.
> > > > 
> > > > Then maybe it should be provided by the WiFi device node? At least you
> > > > should document your design decisions in the commit message.
> > > 
> > > This CMN PLL reference clock is fixed rate and is automatically
> > > generated by the SoC's internal Wi-Fi hardware block with no software
> > > configuration required from the Wi-Fi side.
> > > 
> > > Sure, I will enhance the commit message to add the information on the
> > > fixed reference clock from Wi-Fi block. Hope this is ok.
> > 
> > We have other fixed clocks which are provided by hardware blocks.
> > Without additional details it is impossible to answer whether it is fine
> > or not.
> 
> There is an XO on the board which supplies reference clock (48Mhz or
> 96Mhz) to the Wi-Fi block on the SoC. There is a multiplier/divider in
> the Wi-Fi block, which ensures the output reference clock of 48Mhz is
> supplied to CMN PLL block.
> 
> In summary, below is the path to receive the reference clock at CMN PLL:
> The clock path is .XO (48 MHZ/96 MHZ) --> WiFi (multiplier/divider) -->(48
> MHZ) --> CMN PLL.
> 
> There is no software configuration required for the entire path, as it
> is fully controlled by bootstrap pins on the board. There are bootstrap
> pins for selecting the selecting the XO frequency (48Mhz or 96Mhz) and
> based on this, the divider is automatically selected by HW (1 for 48Mhz,
> 2 for 96Mhz), to ensure output clock to CMN PLL is 48Mhz.

If the clock is always fixed to this frequency, then it's ok, thank you.

> 
> > 
> > > 
> > > > 
> > > > Also, I don't think this node passes DT schema validation. Did you check it?
> > > 
> > > Yes, the DT is validated against the schema, I have shared the logs
> > > below. Could you please let me know If anything needs rectification?
> > 
> > I see, you are setting the cmn_pll_ref_clk frequency in the
> > ipq9574-rdp-common.dtsi file. If the PLL is internal to the SoC, why is
> > the frequency set outside of it? Is it generated by multiplying the XO
> > clk? Should you be using fixed-factor clock instead?
> > 
> 
> Since the reference clock is controlled by bootstrap pins on the board,
> it may be appropriate to define the frequency for this reference clock
> in the board DTS. Given the clock tree described above, I will update
> the cmn_pll_ref_clk to define it as a fixed-factor clock as per your
> suggestion, with its frequency and factors configured in board DTSI.
> These values defined in rdp-common.dtsi will be default values that can
> be overridden if necessary by different boards. Hope this approach is
> fine.
> 
> In ipq9574.dtsi:
> cmn_pll_ref_clk: cmn-pll-ref-clk {
> 
>         compatible = "fixed-factor-clock";
> 
>         clocks = <&xo_clk>;
> 
> 	#clock-cells = <0>;
> };
> 
> xo_clk: xo {
> 	compatible = "fixed-clock";
> 	#clock-cells = <0>;
> };
> 
> In ipq9574-rdp-common.dtsi.
> &cmn_pll_ref_clk {
> 	clock-div = <1>;
> 	clock-mult = <1>;
> };
> 
> &xo_clk {
> 	clock-frequency = <48000000>;
> }

Sounds perfect, thank you!


-- 
With best wishes
Dmitry

