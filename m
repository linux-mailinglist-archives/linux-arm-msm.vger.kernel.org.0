Return-Path: <linux-arm-msm+bounces-68197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18571B1F44F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 13:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF08C3B5CDC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 11:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BC226F478;
	Sat,  9 Aug 2025 11:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZbRBrAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C81263C8E;
	Sat,  9 Aug 2025 11:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754737645; cv=none; b=YMdnTufHrN3vkPtMU3ZJTtV4Xqf1ok4hXvQOf65OwSeXo00V82hUqxX+U3mNX6d90r4RxFm2BNri4ZXx4fyi1GaID/pT12I+NYLfmKgUzU8NO2jFT19j8MoOU1VC480f+YOmMXkJS6R/555enqbbeSYizgBoq8o5fCsySZ5ki2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754737645; c=relaxed/simple;
	bh=Vzcdy7Bmdprjq8PC3M/XGPvgtWnTKOmAgeFWKAdcUiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QuUeAo5FhBIgQCNwi3vV0DciYEuV/IvngzXLazroRiNQk9TEKBp7oh0ig07D/kvQ6ltF7UUf0UUBAYYGxFLRVbhWzJk+ntEuD9knlsJ4qb/eWpjpf8oO06B6xav8u5HI0cqCIP353WJKR6LRBpaSaoMvPD/XnFHD73XHyM8k9Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZbRBrAC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB1DC4CEE7;
	Sat,  9 Aug 2025 11:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754737645;
	bh=Vzcdy7Bmdprjq8PC3M/XGPvgtWnTKOmAgeFWKAdcUiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZbRBrACf+A7SN4Jax2Mez9gcRca9ppiqBx4xniGcOYFRUeZ+lPqmKq/dIKluupjS
	 d5cbMKMmYlHmN2oeYlke5xXxKm83UDGuGcYAUINJb47ofcru3NXVRdU6dVOJjpbQn4
	 byZblDTmCZ07vXp5yVjk7pzi7FNp4+3QLp7yQ1KkcqttJrUn5olI9LgEJAsHEgWp/l
	 s/V8sz56fMT+jgIkGP+G+AoTm5vKxJirczpVBtMGFtkbKfZtaMQn9L0ZY9HTOETowd
	 wnlGGPnkpLQ85jdczZDM3rb9GzF4cgTCJ6fSzye1RrNyi3nZaIzTqEU69D52KE9x4i
	 wsR0lqg/vgZUA==
Date: Sat, 9 Aug 2025 16:37:16 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, vkoul@kernel.org, kishon@kernel.org, conor+dt@kernel.org, 
	bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH V1 2/4] arm64: dts: qcom: sm8750: add max-microamp for
 UFS PHY and PLL supplies
Message-ID: <rh3qxu2rijpjswfash3rpmmh6sw47l3b6j5p5upti6zffknasz@cywwm3fypghd>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-3-quic_nitirawa@quicinc.com>
 <20250808-calm-boa-of-swiftness-a4a7ce@kuoka>
 <9af71063-0629-4ccc-bc76-3fb588677bf4@oss.qualcomm.com>
 <292907f3-25d6-40d9-be6e-b6b83e646d73@kernel.org>
 <5e32be05-0dbd-4d6f-879d-8ce97fb430ba@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e32be05-0dbd-4d6f-879d-8ce97fb430ba@quicinc.com>

On Fri, Aug 08, 2025 at 08:49:45PM GMT, Nitin Rawat wrote:
> 
> 
> On 8/8/2025 3:09 PM, Krzysztof Kozlowski wrote:
> > On 08/08/2025 10:58, Konrad Dybcio wrote:
> > > On 8/8/25 9:29 AM, Krzysztof Kozlowski wrote:
> > > > On Wed, Aug 06, 2025 at 09:13:38PM +0530, Nitin Rawat wrote:
> > > > > Add `vdda-phy-max-microamp` and `vdda-pll-max-microamp` properties to
> > > > > the UFS PHY node in the device tree.
> > > > > 
> > > > > These properties define the maximum current (in microamps) expected
> > > > > from the PHY and PLL regulators. This allows the PHY driver to
> > > > > configure regulator load accurately and ensure proper regulator
> > > > > mode based on load requirements.
> > > > 
> > > > That's not the property of phy, but regulator.
> > > > 
> > > > Also reasoning is here incomplete - you just post downstream code. :/
> > > 
> > > The reason for this change is good, but perhaps not explained clearly
> > > 
> > > All of these values refer to the maximum current draw that needs to be
> > > allocated on a shared voltage supply for this peripheral (because the
> > 
> > 
> > It sounds very different than how much it can be drawn. How much can be
> > drawn is the property of the regulator. The regulator knows how much
> > current it can support.
> 
> Consumers are aware of their dynamic load requirements, which can vary at
> runtime—this awareness is not reciprocal. The power grid is designed based
> on the collective load requirements of all clients sharing the same power
> rail.
> 
> Since regulators can operate in multiple modes for power optimization, each
> consumer is expected to vote for its runtime power needs. These votes help
> the regulator framework maintain the regulator in the appropriate mode,
> ensuring stable and efficient operation across all clients.
> 
> 
> Stability issues can arise if each consumer does not vote for its own load
> requirement.
> For example, consider a scenario where a single regulator is shared by two
> consumers.
> 
> If the first client requests low-power mode by voting for zero or a minimal
> load to regulator framework during its driver's LPM sequence, and the second
> client (e.g., UFS PHY) has not voted for its own load requirement through
> the regulator framework, the regulator may transition to low-power mode.
> This can lead to issues for the second client, which expects a higher power
> state to operate correctly.
> 

I think we all agree on consumers setting the load for shared regulators, but
the naming and description of the DT property is what causing confusion here.
There is no way the consumers can set the *max* current draw for a shared
regulator. They can only request load as per their requirement. But the max
current draw is a regulator constraint.

> 
> > 
> > 
> > > supply's capabilities change depending on the maximum potential load
> > > at any given time, which the regulator driver must be aware of)
> > > 
> > > This is a property of a regulator *consumer*, i.e. if we had a chain
> > > of LEDs hanging off of this supply, we'd need to specify NUM_LEDS *
> > > MAX_CURR under the "led chain" device, to make sure that if the
> > > aggregated current requirements go over a certain threshold (which is
> > > unknown to Linux and hidden in RPMh fw), the regulator can be
> > > reconfigured to allow for a higher current draw (likely at some
> > > downgrade to efficiency)
> > 
> > 
> > The problem is that rationale is downstream. Instead I want to see some
> > reason: e.g. datasheets, spec, type of UFS device (that was the argument
> > in the driver patch discussion).
> 
> 
> The PHY load requirements for consumers such as UFS, USB, PCIe are defined
> by Qualcomm’s PHY IP and are well-documented in Qualcomm’s datasheets and
> power grid documentation. These values can depending on the process or
> technology node, board design, and even the chip foundry used.
> 
> As a result, the load values can differ across SoCs or may be even
> board(unlikely though) due to variations in any of these parameters.
> 

Okay. This goes into the commit message and possibly some part of it to property
description also.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

