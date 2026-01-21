Return-Path: <linux-arm-msm+bounces-89936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDAoCrw5cGmgXAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 03:28:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C36204FC4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 03:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B889E5AFE87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E8C33C1B3;
	Wed, 21 Jan 2026 02:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3u8CIt8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A87338907;
	Wed, 21 Jan 2026 02:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962329; cv=none; b=GtEj4FnDnOdF+graRW1pBcoBhSH/rYMR1Siqre4p0PFVYVzFwe/1+Ty+Eb+ZAmnQTGSsNXTwc1x90MTyaGEze67Logvvz97/oQ/5X5dxc7+PtEWTdojUe4s+ds2c+BXeDTCWczFMR6/FsfNwiuag2/xdUgTnEHeR1EaKOT8qh0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962329; c=relaxed/simple;
	bh=V2HTeJVqkwNSJnme9iwz1gelf2rhYXmK44JSnSGuGfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F46/p+1+MikNIeX62gzhI8UMBOMuAr2mbfDdB+B9AFXAhLPsjKUxndl4Xkr8hqDvWE7OKKF9JSf7GZINQon1n9y9bXkSb+PbX2Lr4ttd0iw1p269aio+xhtLy9mWW/ixXYuharS+96KH+kDVYyvrQsssnVH6M7SM1tVw/Z4wbAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3u8CIt8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A667C16AAE;
	Wed, 21 Jan 2026 02:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962329;
	bh=V2HTeJVqkwNSJnme9iwz1gelf2rhYXmK44JSnSGuGfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i3u8CIt8Hsst3zKGX6zOh8NqYYZMwXGUB5b5mzaIqPT7dY2lH8Lg2xDoEjv/3KIfr
	 Bp3CjTQhfUt62b9qUhwrhlIqJii/G4wQeq8Vca9mFtUTB5OHKH50wUEtZhIwgdGBBv
	 bAIZeAaqHf33mlTiC2GvDZkJp//Haq2fnnZ9JAxRtgcc3qRtGcCnVnA99IajpR0lCg
	 fS7d0vENDEtbLvglB4IU026PpCM6yMLLVaAFvddBTq0M7RT7Fk4YPHPlaH0m/JV/sI
	 02Z93xkaZF16Lpdv7fdzbFiHz4d3hp/xS7oo29NGkT9wp2spdn/Ka8doX9UwMeEqk/
	 bur1TF6Q6FJjg==
Date: Tue, 20 Jan 2026 20:25:26 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gfx3d: add parent to parent request map
Message-ID: <fee6fkqhhst6o6rchohp252tzvkfnv7hvro3z7ipv4o3zg5whi@ou6wjcpk74jn>
References: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>
 <vlvp4od6ykhneabgtpln7vpyyfpfuilasbmbfu222zgspc2ppl@iuuzldtoejaj>
 <aW-b2EmynhZlp0mZ@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW-b2EmynhZlp0mZ@redhat.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-89936-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: C36204FC4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 10:14:32AM -0500, Brian Masney wrote:
> On Mon, Jan 19, 2026 at 09:39:30AM -0600, Bjorn Andersson wrote:
> > On Sat, Jan 17, 2026 at 05:54:47AM +0200, Dmitry Baryshkov wrote:
> > > After commit d228ece36345 ("clk: divider: remove round_rate() in favor
> > > of determine_rate()") determining GFX3D clock rate crashes, because the
> > > passed parent map doesn't provide the expected best_parent_hw clock
> > > (with the roundd_rate path before the offending commit the
> > > best_parent_hw was ignored).
> > > 
> > > Set the field in parent_req in addition to setting it in the req,
> > > fixing the crash.
> > > 
> > >  clk_hw_round_rate (drivers/clk/clk.c:1764) (P)
> > >  clk_divider_bestdiv (drivers/clk/clk-divider.c:336)
> > >  divider_determine_rate (drivers/clk/clk-divider.c:358)
> > >  clk_alpha_pll_postdiv_determine_rate (drivers/clk/qcom/clk-alpha-pll.c:1275)
> > >  clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
> > >  clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
> > >  __clk_determine_rate (drivers/clk/clk.c:1741)
> > >  clk_gfx3d_determine_rate (drivers/clk/qcom/clk-rcg2.c:1268)
> > >  clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
> > >  clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
> > >  clk_core_round_rate_nolock (drivers/clk/clk.c:1710)
> > >  clk_round_rate (drivers/clk/clk.c:1804)
> > >  dev_pm_opp_set_rate (drivers/opp/core.c:1440 (discriminator 1))
> > >  msm_devfreq_target (drivers/gpu/drm/msm/msm_gpu_devfreq.c:51)
> > >  devfreq_set_target (drivers/devfreq/devfreq.c:360)
> > >  devfreq_update_target (drivers/devfreq/devfreq.c:426)
> > >  devfreq_monitor (drivers/devfreq/devfreq.c:458)
> > >  process_one_work (arch/arm64/include/asm/jump_label.h:36 include/trace/events/workqueue.h:110 kernel/workqueue.c:3284)
> > >  worker_thread (kernel/workqueue.c:3356 (discriminator 2) kernel/workqueue.c:3443 (discriminator 2))
> > >  kthread (kernel/kthread.c:467)
> > >  ret_from_fork (arch/arm64/kernel/entry.S:861)
> > > 
> > > Fixes: 55213e1acec9 ("clk: qcom: Add gfx3d ping-pong PLL frequency switching")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > Why didn't Brian get Cc'ed on this patch? I'd love to have his input.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> clk_alpha_pll_postdiv_round_rate() previously had this code:
> 
>         return divider_round_rate(hw, rate, prate, table,
>                                   pll->width, CLK_DIVIDER_POWER_OF_TWO);
> 
> divider_round_rate() called divider_round_rate_parent(), which had this
> code that set the best_parent_hw:
> 
> long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
>                                unsigned long rate, unsigned long *prate,
>                                const struct clk_div_table *table,
>                                u8 width, unsigned long flags)
> {
>         struct clk_rate_request req;
>         int ret;
> 
>         clk_hw_init_rate_request(hw, &req, rate);
>         req.best_parent_rate = *prate;
>         req.best_parent_hw = parent;
> 
>         ret = divider_determine_rate(hw, &req, table, width, flags);
>         if (ret)
>                 return ret;
> 
>         *prate = req.best_parent_rate;
> 
>         return req.rate;
> }
> 
> I coverted clk_alpha_pll_postdiv_round_rate() to
> clk_alpha_pll_postdiv_determine_rate(), and that now directly calls
> divider_determine_rate().
> 
> I'll look through the other cases where divider_round_rate_parent() was
> called just to be sure there's no other cases of this.
> 

Thank you, Brian!

> Brian
> 

