Return-Path: <linux-arm-msm+bounces-65975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD256B0D038
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 05:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 089C13A4DC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 03:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7471C5D6A;
	Tue, 22 Jul 2025 03:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jke8srCC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0BE2E3701;
	Tue, 22 Jul 2025 03:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753154487; cv=none; b=PP5mIR83pT3ciaCTraJVNGmW42Svr1X9/teh0Z9BWR3vA8WIcPxnnUNtdP4vlpU5N1IFFJye6sZsmW8p1i+hV55NfiSgK/VKwCio2jg4gaEoWjvamcS2KNXrSF6RaLQtvXuhAh9vuDLNsEoLqsse1xzRT8QjGXO+Uqw8iAdkzFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753154487; c=relaxed/simple;
	bh=l5nvcoPWvqijod9BzVer5L//kq709mQgNUUoDuY2hbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAXQItNK+wYCutHSmSG+QtJh/DoKlaeAo22VKawToNBvuaoColG5hVAGjJK5dbblSFeMIBJTZC6XT8VggPC2QFVXq3PUaWn3+e6jQELvcfBfeK0TyUf3wHJJ82bI9EoClhfI8EfJlHwaMXqCsTh3HEFqm8zQ79GeU3SvV7BYGGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jke8srCC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A367C4CEEB;
	Tue, 22 Jul 2025 03:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753154486;
	bh=l5nvcoPWvqijod9BzVer5L//kq709mQgNUUoDuY2hbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jke8srCCtAwuFdnsD0+Y3hEYpVrLMZcUNZMoEIhpWxL6h+Tm9XCROW/TTy+yLxEqP
	 YK9AfV7xPrHwpjIf1vMR94hnyvCWrMIApYt51DGd+Knas8TuMmymfutUmEx4JTmQFf
	 aFzOcKI06NukyRq6aW7OcVaH7/I90jslMmuKanv8f5/IdhNBJ7ztYbhwCLIF4aCli6
	 qQ3d7dosDz59P/uhFfMexHH/1DWnqHpzUUhIDlC+5+tE7VMMerGKWOCL6maxBqGzOA
	 HbLR0q0SJI9c869SPzaROkqlaVEgHbmXyNd7k12/x6gIVz756dmmmgI/LfjoCmU75i
	 ueKUZSU1F8kcA==
Date: Mon, 21 Jul 2025 22:21:23 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, sboyd@kernel.org, 
	mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	quic_rjendra@quicinc.com, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
Message-ID: <keb6ljkvjdoi2pcfrgj2nvnytwprw3lmlv72f6zpcbzulzpw6n@vn62zoqlr7vu>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-8-pankaj.patil@oss.qualcomm.com>
 <aHjJG2nrJJZvqxSu@linaro.org>
 <40534488-24f6-4958-b032-d45a177dfd80@kernel.org>
 <2f5b5e6e-5041-453e-b3f7-b10b40bc6f57@oss.qualcomm.com>
 <52ytt5ag5l65hdjjmvjft2l7ofvt4rgdn6r3bytcpjvyqia7ry@uzajn7qjng4a>
 <5b569e5f-066b-4e12-8a05-d77852ce11f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b569e5f-066b-4e12-8a05-d77852ce11f6@oss.qualcomm.com>

On Mon, Jul 21, 2025 at 10:43:05PM +0530, Taniya Das wrote:
> 
> 
> On 7/20/2025 9:30 AM, Bjorn Andersson wrote:
> > On Fri, Jul 18, 2025 at 11:07:23PM +0530, Taniya Das wrote:
> >>
> >>
> >> On 7/17/2025 3:38 PM, Krzysztof Kozlowski wrote:
> >>> On 17/07/2025 11:57, Abel Vesa wrote:
> >>>> On 25-07-16 20:50:17, Pankaj Patil wrote:
> >>>>> From: Taniya Das <taniya.das@oss.qualcomm.com>
> >>>>>
> >>>>> Add support for Global clock controller for Glymur platform.
> >>>>>
> >>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> >>>>> ---
> >>>>>  drivers/clk/qcom/Kconfig      |   10 +
> >>>>>  drivers/clk/qcom/Makefile     |    1 +
> >>>>>  drivers/clk/qcom/gcc-glymur.c | 8623 +++++++++++++++++++++++++++++++++
> >>>>>  3 files changed, 8634 insertions(+)
> >>>>>  create mode 100644 drivers/clk/qcom/gcc-glymur.c
> >>>>>
> >>>>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> >>>>> index 051301007aa6..1d9e8c6aeaed 100644
> >>>>> --- a/drivers/clk/qcom/Kconfig
> >>>>> +++ b/drivers/clk/qcom/Kconfig
> >>>>> @@ -645,6 +645,16 @@ config SAR_GPUCC_2130P
> >>>>>  	  Say Y if you want to support graphics controller devices and
> >>>>>  	  functionality such as 3D graphics.
> >>>>>  
> >>>>> +config SC_GCC_GLYMUR
> >>>>
> >>>> Wait, are we going back to this now?
> >>>>
> >>>> X Elite had CLK_X1E80100_GCC, so maybe this should be CLK_GLYMUR_GCC
> >>>> then.
> >>>
> >>>
> >>> Yeah, the SC is meaningless here, unless you call it CLK_SC8480XP_GCC,
> >>> so the authors need to decide on one naming. Not mixtures..
> >>>
> >>>
> >> Glymur follows the "SC" naming convention, and historically we've
> >> adhered to the format: "SC/SM/SDX/SA_<Clock Controller>_<Target Name or
> >> Chipset>". This structure has helped maintain consistency and clarity
> >> across platforms.
> >>
> > 
> > The platform isn't named SCGLYMUR - which is where the SC prefix would
> > come from.
> > 
> > I'm not sure there's a benefit to quickly be able to know if a clock
> > controller is for a SC, SM, SA, MSM, etc platform. Please let me know if
> > I'm missing something.
> > 
> 
> Bjorn it was more of an alignment for "Compute", "Mobile" and so on and
> such was the definition to be used for the clock controllers as well.
> 

Right and look at e.g. SC7280, which should be SC, MSM, QCM, and QCS.
This is one of the main reasons for my push to use the SoC code names
instead.

> >> The case of X1E80100 appears to be an exception—likely influenced by its
> >> unique naming convention at the time.
> >>
> >> That said, I’d prefer to stay aligned with the established convention
> >> used for earlier chipsets to preserve continuity. I’d appreciate hearing
> >> your thoughts on this as well.
> >>
> > 
> > We're changing the naming model completely, so there is no continuity.
> > In fact the Hamoa "exception" would suite us very well for Glymur.
> > 
> > And look how nicely the CLK_X1E80100_* entries are grouped together in
> > the Kconfig.
> > 
> > Change to CLK_GLYMUR_* please.
> > 
> 
> Sure, will align, but hope we are all good with the clock driver name
> <cc>-<target>.c.
> 

Yeah, let's stick with that format.

Thanks,
Bjorn

