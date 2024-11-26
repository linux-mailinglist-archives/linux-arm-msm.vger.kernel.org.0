Return-Path: <linux-arm-msm+bounces-39223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9DA9D9C6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 18:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED5FC167376
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 17:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5B41DB958;
	Tue, 26 Nov 2024 17:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GM3ghPVb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8001DB534;
	Tue, 26 Nov 2024 17:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641807; cv=none; b=m1NaXp6aLrNUtY42R/N+FJzoiy6Hp9rE9g68u0IxyXzWfSHhW7Mkv6U9U4mYH8ezOwMRdWHgXF18SH/+My2wTe7AB6Bp1YPVhGm9/9NS3QQD1hnAevlOQ+VpimdODBlZMet7rSbQo1dqee3IivK4qkEcWxVAbx1uD72f+yzJMt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641807; c=relaxed/simple;
	bh=Qbe4lWMToRkGg8uJP13fqcPkyVngCbNVvjX8AR1hjQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTNsmKLmq5hFB4ngYhwyZShVY4jKwQdOCaktIsHiqkbR3wBZoqvmFdUhkIBzZroeFJzMh7Q5jPBH1xzBqqYbWmKpCtVNfTB7r/loaaox596XaOCMEzK9eZXSocNGD0DkldSXwtNjYCQWZ4QZTeyMcr/xOT72fZ3CaBHCrRpxZv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GM3ghPVb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48864C4CECF;
	Tue, 26 Nov 2024 17:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732641806;
	bh=Qbe4lWMToRkGg8uJP13fqcPkyVngCbNVvjX8AR1hjQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GM3ghPVbFNwv7h/34NeL70hl/EcXP5eJGabKq3GIIzgg+pA/23lEfJa2P44m5SRs6
	 T2Nz56PFdq23mvww8K/dlYcVMg1E5kTZ3qs0Ked3GwdBPUzh8+mTztxygA4X2lcRr5
	 vVUujHnEOWi1ehy13u4Go3BxnswzdYJ4A83puJol/ZHJlD9NqT31UBNJ+AngH0R4ms
	 dJP2Rsay9HQXF7Hd3T3VOgRN9j9FJEU2gy989mmy1nToeiBxxYaFOyhFus8phpC6va
	 sgPFJavoWHq7tf5ecmCh8CVTrvFS+QqhAy8oOJ/OtZQxhIdZ0uuK1OKhsJOmJ9mozt
	 lWYQibOx/1gcQ==
Date: Tue, 26 Nov 2024 11:23:24 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gdsc: Add pm_runtime hooks
Message-ID: <ava6dkmz5g725skafuqyb4rly3qna5z4bhfmrqgogcmdcubzf3@eu4odajw6e6d>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>
 <zhhna2wni4yqhnc2tqfc2ugril3h4kzbyr3ix6vpwrgghwytfa@kjfpff5zdl4z>
 <7a52ca1f-303e-44ae-b750-6aaa521516c3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a52ca1f-303e-44ae-b750-6aaa521516c3@linaro.org>

On Wed, Nov 20, 2024 at 05:09:08PM +0000, Bryan O'Donoghue wrote:
> On 19/11/2024 15:34, Bjorn Andersson wrote:
> > What I think you want is two things:
> > 1) When you're accessing the registers, you want the clock controller's
> > power-domain to be on.
> > 2) When the client vote for a GDSC, you want to have the PM framework
> > also ensure that parent power-domains are kept on.
> > For the single case, this is handled by the pm_genpd_add_subdomain()
> > call below. This, or something along those lines, seems like the
> > appropriate solution.
> 
> Yes.
> 
> I'm finding with this patch reverted but, keeping the first patch that it
> pretty much works as you'd want with the caveat that gdsc_register ->
> gdsc_en -> gdsc_toggle fails the first time.
> 

Can you clarify that call graph for me? The one case I can see where
gdsc_register() leads to gdsc_enable() is if the sc is marked ALWAYS_ON
and I don't think that is your case.

What you describe sounds like we're trying to turn on the power-domain
without first enabling the supplies, or perhaps there are clock
dependencies that are not in order when this is being attempted?

Regards,
Bjorn

> After that I see the GDSCs on/off as excpected
> 
> cat /sys/kernel/debug/pm_genpd/cam_cc_titan_top_gdsc/current_state
> off-0
> 
> cat /sys/kernel/debug/pm_genpd/cam_cc_ife_0_gdsc/current_state
> off-0
> 
> cam -c 1 --capture=10 --file
> 
> cat /sys/kernel/debug/pm_genpd/cam_cc_titan_top_gdsc/current_state
> off-0
> 
> cat /sys/kernel/debug/pm_genpd/cam_cc_ife_0_gdsc/current_state
> off-0
> 
> Perhaps we just need to fix the probe path @ gdsc_register()
> 
> ---
> bod

