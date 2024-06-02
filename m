Return-Path: <linux-arm-msm+bounces-21395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2218D73BB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 06:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9E69281F87
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 04:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346C9BA42;
	Sun,  2 Jun 2024 04:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHDW2pag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A1BA94C;
	Sun,  2 Jun 2024 04:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717301562; cv=none; b=kMWyDn4xA6vNC8ebRXl6bYmhVBelWIzwX/BLivbhSTTOmyekp7+YOboRHOYSdZsZkpihgcDJ2qvRajdQNc0NheEi6EZUnlphvPbvfHODrRJhdUdcDr4PTPBwFs6cWiSaFhjC/1d07D1qwNjCBW/F/DTcevb0sQEYNTT52BMAJW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717301562; c=relaxed/simple;
	bh=sU54eC6NHiXDr/NN9k45qNK6jPMCVgfdE4ghAPwJrKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aeyIZEYFySH4MUEVKOJMgCRTl/Q271Z8deaDEIkxFozesuW2tZWlYtkIgmzFQ9vXKqQZcFsbS5efzV3W2/rV1NZPc56XmVX/5h0wPQM6HQQ8avwDkAom2CW2/BYk26QfFBrcta2AVj1MG8HXsLFDszEvqqI/hoo87uPD2UJUt4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHDW2pag; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8D8C2BBFC;
	Sun,  2 Jun 2024 04:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717301561;
	bh=sU54eC6NHiXDr/NN9k45qNK6jPMCVgfdE4ghAPwJrKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eHDW2pagSA/qS37YtV8NJaoz/sSXpkE4g1RhMawOY9l7CeHlZOdNC382849L9pi/q
	 7upec5iuE2hlTS2EVR1+oz4or0bwQqo7etkcbrpMfR3DwbN6odI93DB1t0Eeu8/1UY
	 rfl25bmBMFfznt0Wne8D6L+4SpDUmyLdt34Wu7vwfynU9ORh1cB0auB0AUUYUqn7XK
	 CBFYAHQaaU+1h16/7vqa+E7mV42oz4L9OKLTxZL+vUA0Zj+djCDxkN86WgEGg2Mj+M
	 sPYKnbkU/YqaS1o/fCI3H/V2DugqRXPwUGkQKajqaN5LAbAlkC6fDXDMfuMO57wHte
	 alR1pt1SyGKYA==
Date: Sat, 1 Jun 2024 23:12:38 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_jkona@quicinc.com, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 04/13] clk: qcom: gpucc-sa8775p: Remove the
 CLK_IS_CRITICAL and ALWAYS_ON flags
Message-ID: <woi4vzsc2mgug26rluvzt6ayoawfsus6ow2kqnmfnnqlwf2lty@sirpsaf2anuz>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-5-quic_tdas@quicinc.com>
 <0f56831e-8572-46f5-89cf-d1e990813a02@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f56831e-8572-46f5-89cf-d1e990813a02@linaro.org>

On Fri, May 31, 2024 at 11:59:04AM GMT, Krzysztof Kozlowski wrote:
> On 31/05/2024 11:02, Taniya Das wrote:
> > The gpu clocks and GDSC have been marked critical from the clock driver
> > which is not desired for functionality. Hence remove the CLK_IS_CRITICAL
> > and ALWAYS_ON flags.
> > 
> > Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
> > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > ---
> >  drivers/clk/qcom/gpucc-sa8775p.c | 27 +++++++++++----------------
> >  1 file changed, 11 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
> > index 1167c42da39d..f965babf4330 100644
> > --- a/drivers/clk/qcom/gpucc-sa8775p.c
> > +++ b/drivers/clk/qcom/gpucc-sa8775p.c
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  /*
> > - * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
> > + * Copyright (c) 2021-2022, 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> 
> That's not a fix.
> 
> >   * Copyright (c) 2023, Linaro Limited
> >   */
> >  
> > @@ -280,7 +280,7 @@ static struct clk_branch gpu_cc_ahb_clk = {
> >  				&gpu_cc_hub_ahb_div_clk_src.clkr.hw,
> >  			},
> >  			.num_parents = 1,
> > -			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> > +			.flags = CLK_SET_RATE_PARENT,
> 
> I fail to see why this is a fix. They were marked as critical on
> purpose. It was needed, wasn't it?
> 
> Provide jsutification for commits, not just sprinkle Fixes tag all around.
> 

This is indeed a fix, as marking clocks CLK_IS_CRITICAL prevents any
power-domain associated with the clock controller from suspending. In
other words, the current behavior is broken.

@Taniya, "not desired for functionality" does not carry any useful
information explaining why this change is made. Please update the commit
message.

Regards,
Bjorn

> 
> Best regards,
> Krzysztof
> 

