Return-Path: <linux-arm-msm+bounces-38348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 813019D2999
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 301B41F22E9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 15:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2FAB1CEAB8;
	Tue, 19 Nov 2024 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/Bj2Egs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0111B6D08;
	Tue, 19 Nov 2024 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732030117; cv=none; b=mBnjMCvUCjwc93m5Ix9ui+HmffkTCD0C/yczm4nLwL6f27/YA6OCHMlDSCfIisq2zhCV9tpLuxw6MhpuZ8uCgdqpyp2AHWw6E1LgBNCRKoe/1tvrKPiZvMdV0/XCVxutMeanp7XRFXfthXTMOwPzVruKwqgua5WnbtemSlbamk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732030117; c=relaxed/simple;
	bh=ZpAY/bxDJ17411dyPhLXyzL1AHSYeMaAsW2wBjwJGg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiDWI/CngJPfVGoPujS/96WxD7y2hUSxoaaKOEb5RVNutvzDmcQy4gLpXMG1VFD3O/78N9xXeTFh5swgB+naAdR0sn10ZVG98mrKGjX72QRYdnrVhC0QllIinWUUKkGU462x/CveBFmvrlku0cPejUtTv6Hia78qgH3j/qJ+dpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/Bj2Egs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924F7C4CECF;
	Tue, 19 Nov 2024 15:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732030117;
	bh=ZpAY/bxDJ17411dyPhLXyzL1AHSYeMaAsW2wBjwJGg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/Bj2Egso29FImJySPbVyKE8WJj6GlVaoe2H6CxTmIYhX2etPlzqEDp6XAZoSPMpX
	 utwWFzj7jxMUvt3UtJTmZoC/PxdMWMFhECpBqnfbtLAFJXMsoPH8sskt9pt5/yPz2x
	 CbXUexGB59JTfYVxG9AA+qn2ZfnNsN0UxSW/LnE/YMai9R2XlrtlSf2OLh4Z1wbPi5
	 prfGwJzhR/5VotsHxR5KxdAny3PGqB/USjIOZcfeUUpyn/I0BzpUIUfCtnT9eh+eE8
	 /0xmfJDrDkAbGA2kXk2GZmCbKr5WaEt+Due/uRAw7OwzK5gKz2moZtJyhkNVMTd6Lm
	 j9s9UN7cEDf0w==
Date: Tue, 19 Nov 2024 09:28:34 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: Add support for multiple power-domains
 for a clock controller.
Message-ID: <aoqeorxigpywwx7eg26vxadhctoizczzay3q6tkmjzcduisnpc@l44gwynxvxw7>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <1898ad2e-a6ea-43ef-af1a-25229b4771db@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1898ad2e-a6ea-43ef-af1a-25229b4771db@quicinc.com>

On Tue, Nov 19, 2024 at 11:38:34AM +0530, Taniya Das wrote:
> 
> 
> On 11/18/2024 7:54 AM, Bryan O'Donoghue wrote:
> > On x1e80100 and it's SKUs the Camera Clock Controller - CAMCC has
> > multiple power-domains which power it. Usually with a single power-domain
> > the core platform code will automatically switch on the singleton
> > power-domain for you. If you have multiple power-domains for a device, in
> > this case the clock controller, you need to switch those power-domains
> > on/off yourself.
> > 
> > The clock controllers can also contain Global Distributed
> > Switch Controllers - GDSCs which themselves can be referenced from dtsi
> > nodes ultimately triggering a gdsc_en() in drivers/clk/qcom/gdsc.c.
> > 
> > As an example:
> > 
> > cci0: cci@ac4a000 {
> > 	power-domains = <&camcc TITAN_TOP_GDSC>;
> > };
> > 
> > This series adds the support to attach a power-domain list to the
> > clock-controllers and the GDSCs those controllers provide so that in the
> > case of the above example gdsc_toggle_logic() will trigger the power-domain
> > list with pm_runtime_resume_and_get() and pm_runtime_put_sync()
> > respectively.
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> 
> Bryan, as we were already in discussion with Bjorn to post the patches which
> take care of Multi GDSC and PLL requirements, I would request to kindly hold
> this series posting.

There's no "hold before posting", this series is already posted.
Please review it.

> I am in the final discussions with Bjorn to handle it
> gracefully to post the series.
> 

You may in such discussion (the review) say "you're missing X, Y, Z, and
here is my patches that covers these aspects", but not "I'll ignore this
until we're done preparing our patches".

Regards,
Bjorn

