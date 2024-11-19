Return-Path: <linux-arm-msm+bounces-38349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1219D29B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80251281E15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 15:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C588B1CF5CA;
	Tue, 19 Nov 2024 15:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpMQlStU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9742B78C76;
	Tue, 19 Nov 2024 15:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732030489; cv=none; b=OfrjsJICNC7Db8mIx4opuc7sh65VOKEkkB26LoqP6Pk96U+aP/p0EdB2noW4YIE2p4jrF2wHjma5VChu0MtwHOfIsYmNM7KMTLae/x2n7odtTbv9iNR2ZAtTT/d8d0z0nIsSrbhD5xhsFIAcQ1fMx2/D9B0aGI3p/swPK+6Yyfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732030489; c=relaxed/simple;
	bh=ZUgKK0qj7WpgPi6sLUEgNEWHEhny9IMwdKtn1+SCLCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jqp8QgFDSx8qgD78KWAKixhwtijLWshqOohW2QLfSZSNgPPipm2PZY1BSsIiL6QOkeHkC83Pt0dw5/EQotk5jHIe3BdzuvrEJIfSDsdRjEuUGdSpYr6824lHV7IDOPacwQGdrdBIjU3Wqt444s41H0mt8ukOQXlHdZhvNIihA4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpMQlStU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1D7C4CED0;
	Tue, 19 Nov 2024 15:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732030489;
	bh=ZUgKK0qj7WpgPi6sLUEgNEWHEhny9IMwdKtn1+SCLCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dpMQlStUeLRH05cMH6IHPq1Pj4ErgCpmI29QEN9A5mMqn+5IjRl13kp9n1wez7ZKJ
	 8mfOuhT3urfvtbPBwwPwoNcGCohnwUkxif3JuxQ14wV9hqFYFVJrYL/GP/Z+eEeT1a
	 DV8XO2oaaGHUo/VWKF41BQ4x5+uITfO23upp1/RAXClsjFyDGkTcGGLCj0P1n3eNpq
	 aLK70gfbznlek0F6U6CRBNHz8kda0ioFjm8+mmul1fiFGw8ExbFIwF6wddjVhdpf6n
	 aGZUmfxPo0+oZsTMDvoesEeVZ2WlEBz9JgEKGFTz/fNP8Zi57lG6jwcUjekPm6do1v
	 4w1/MmaI3sFrA==
Date: Tue, 19 Nov 2024 09:34:46 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gdsc: Add pm_runtime hooks
Message-ID: <zhhna2wni4yqhnc2tqfc2ugril3h4kzbyr3ix6vpwrgghwytfa@kjfpff5zdl4z>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>

On Mon, Nov 18, 2024 at 02:24:33AM +0000, Bryan O'Donoghue wrote:
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
[..]
> @@ -177,10 +182,14 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
>  	ret = gdsc_poll_status(sc, status);
>  	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
>  
> -	if (!ret && status == GDSC_OFF && sc->rsupply) {
> -		ret = regulator_disable(sc->rsupply);
> -		if (ret < 0)
> -			return ret;
> +	if (!ret && status == GDSC_OFF) {
> +		if (pm_runtime_enabled(sc->dev))
> +			pm_runtime_put_sync(sc->dev);

I already made this mistake, and 4cc47e8add63 ("clk: qcom: gdsc: Remove
direct runtime PM calls") covers the reason why it was a mistake.

What I think you want is two things:
1) When you're accessing the registers, you want the clock controller's
power-domain to be on.
2) When the client vote for a GDSC, you want to have the PM framework
also ensure that parent power-domains are kept on.
For the single case, this is handled by the pm_genpd_add_subdomain()
call below. This, or something along those lines, seems like the
appropriate solution.

Regards,
Bjorn

