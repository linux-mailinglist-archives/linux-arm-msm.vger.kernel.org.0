Return-Path: <linux-arm-msm+bounces-21394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8388D73B3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 06:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AC031C20BDD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 04:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67446FCC;
	Sun,  2 Jun 2024 04:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoaA7NAq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86992AD21;
	Sun,  2 Jun 2024 04:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717301326; cv=none; b=WNg4wHFca47wzI7URHcnwTlIrauQZc4HhW6knXP9DI15s5seXPSlmamDX3GISnV1O4lMK8iiYBst3esz0T6u7WgeidDWrBOM76Idz65hP4p0qF8wb093wejijDpVFEVZuyJYAzj9odPY5oP+lpPy+KtKNccvM+jk3NhVWtyT6cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717301326; c=relaxed/simple;
	bh=ruhWwfADPbqcU9FRQvUk8FxZy/x+JYyQFwmMrdX2xDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFVd1UFmnfG+AbGxTTsWIuc0qFnxFWR9sxE7c65zCQeTxvKtcSWVpzkaPMISy2UGL99yC3CuY3/yz/OVylxyeadgqHh1empCJPIjM/512P/5wudWT5Opxvs0+73pyH2x4KH99uzVpGf85g9/DtojSfjyR/2p6OyDxt/Dbd3J2lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NoaA7NAq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA39CC2BBFC;
	Sun,  2 Jun 2024 04:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717301326;
	bh=ruhWwfADPbqcU9FRQvUk8FxZy/x+JYyQFwmMrdX2xDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NoaA7NAqPG65NHAq6aZq73EhLsA03rDvBniukXoq2UAS+Ag4MxxwuZuRtvX9DyC8y
	 zP4OjHOlzyt44gxyghO1dmiuTFveoduCjzoTu8T5V9vpNc71OrjY/cm2pyX981H9jU
	 PY1611Gi/Yny6rH52n7KjzbtHmamosa1KasDuzeHUl1EmUnqAyNIa4mXmJXjssDJkw
	 PGGovzgm03KMlkW1CY9jCfEM1YBVwd5nl952nq/a2p/t0dORBKFjpfUsv8n9HH2AcZ
	 l9Si6SSg/ewFew6q/ZTdS5ysWOHWLbQZeZWUx9FX5z41Ds5999x2aogWQytwzg8BeC
	 rck0vAvXTX/7g==
Date: Sat, 1 Jun 2024 23:08:42 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Trilok Soni <quic_tsoni@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, quic_jkona@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 04/13] clk: qcom: gpucc-sa8775p: Remove the
 CLK_IS_CRITICAL and ALWAYS_ON flags
Message-ID: <drkjvvoxvzfbkvuylwtxbyroxuv7bf7w7cn6lmrovsqe72re57@xspcrygo3pl4>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-5-quic_tdas@quicinc.com>
 <0f56831e-8572-46f5-89cf-d1e990813a02@linaro.org>
 <cb1066a9-d3b2-d921-9af6-01300987d37b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb1066a9-d3b2-d921-9af6-01300987d37b@quicinc.com>

On Fri, May 31, 2024 at 10:46:39AM GMT, Trilok Soni wrote:
> On 5/31/2024 2:59 AM, Krzysztof Kozlowski wrote:
> > On 31/05/2024 11:02, Taniya Das wrote:
> >> The gpu clocks and GDSC have been marked critical from the clock driver
> >> which is not desired for functionality. Hence remove the CLK_IS_CRITICAL
> >> and ALWAYS_ON flags.
> >>
> >> Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
> >> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >> ---
> >>  drivers/clk/qcom/gpucc-sa8775p.c | 27 +++++++++++----------------
> >>  1 file changed, 11 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
> >> index 1167c42da39d..f965babf4330 100644
> >> --- a/drivers/clk/qcom/gpucc-sa8775p.c
> >> +++ b/drivers/clk/qcom/gpucc-sa8775p.c
> >> @@ -1,6 +1,6 @@
> >>  // SPDX-License-Identifier: GPL-2.0-only
> >>  /*
> >> - * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2021-2022, 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > 
> > That's not a fix.
> > 
> >>   * Copyright (c) 2023, Linaro Limited
> >>   */
> >>  
> >> @@ -280,7 +280,7 @@ static struct clk_branch gpu_cc_ahb_clk = {
> >>  				&gpu_cc_hub_ahb_div_clk_src.clkr.hw,
> >>  			},
> >>  			.num_parents = 1,
> >> -			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> >> +			.flags = CLK_SET_RATE_PARENT,
> > 
> > I fail to see why this is a fix. They were marked as critical on
> > purpose. It was needed, wasn't it?
> > 
> > Provide jsutification for commits, not just sprinkle Fixes tag all around.
> 
> Taniya - please separate fixes into another series? 
> 

There's no problem including fixes in a series with other changes, but
keeping them at the beginning of the series is generally preferred - as
this both enable them being picked for some -fixes branch and avoid
potential issues when backporting.

Regards,
Bjorn

