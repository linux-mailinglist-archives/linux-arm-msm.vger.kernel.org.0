Return-Path: <linux-arm-msm+bounces-89706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED65D3AF4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3F15303B7E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C1838B983;
	Mon, 19 Jan 2026 15:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKCL1yJ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E0F2BEC41;
	Mon, 19 Jan 2026 15:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768837174; cv=none; b=M2VWM+m7IQdUi38+SIJ7CFtwy/nApjfurFa/7s6y52uc3JlkGzear4HhvyrmlvBB/7wciwU2Ea8VWj+yZYtW6cYU3c+A0fbiL1vzTxnrx2uK87Ml6AqYdfB01Xa8DluUrfyxqyesGj8VRxDm423WsF8i2aXbs82q1edw0uzC9vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768837174; c=relaxed/simple;
	bh=Z6RSsNUMp63J3RytT+Huq4TSmlNeegd84ZJvwexaTLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OexS7sgJVsgiQUtzMdBVW3ybTzWq9/9JKW3P+U7/x7AvYZTWFF7julTb8yg6AhKJEwoOlQhLaDGSObIR/T1KL2KovfI5asl/XBCDt6FnTpAVNxSxIpKk2WWfezIO0lLAGekV/WnmCAPVZxHCfQlDmBlw5TNV9NB6GXOt675gwKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKCL1yJ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98A7C116C6;
	Mon, 19 Jan 2026 15:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768837173;
	bh=Z6RSsNUMp63J3RytT+Huq4TSmlNeegd84ZJvwexaTLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKCL1yJ/9OH9r38bk7wJYrsP2yXH1TXQGfbSpnhe+kYzlnTph7DFKhyN8rf3MuKxh
	 bPd2ivES2hdoxRDGV0eyZhfzlFhBvJueolK/XoWTqC+7hbfI0YFQBbELpn1RzwaHnA
	 KAyJixdRdjj6Dfamm07eN8mnVcEUbUimLDc/FzzUrdImY1lE7Vqy2JZiRgfJzH52Nf
	 oZyJ58U7F5tttyLbAVkSeQbS3gAWNoMLxVB/KGRimYrKdfDbkwADqvf/C+QN5MqwMv
	 CF5sxNqMNBR2HEyHltId6SOQ2oic2z1IOStq89HtqGoYP1I8op/mpP1VlIEKMZHrix
	 XPu4a/J/ThJUA==
Date: Mon, 19 Jan 2026 09:39:30 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gfx3d: add parent to parent request map
Message-ID: <vlvp4od6ykhneabgtpln7vpyyfpfuilasbmbfu222zgspc2ppl@iuuzldtoejaj>
References: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>

On Sat, Jan 17, 2026 at 05:54:47AM +0200, Dmitry Baryshkov wrote:
> After commit d228ece36345 ("clk: divider: remove round_rate() in favor
> of determine_rate()") determining GFX3D clock rate crashes, because the
> passed parent map doesn't provide the expected best_parent_hw clock
> (with the roundd_rate path before the offending commit the
> best_parent_hw was ignored).
> 
> Set the field in parent_req in addition to setting it in the req,
> fixing the crash.
> 
>  clk_hw_round_rate (drivers/clk/clk.c:1764) (P)
>  clk_divider_bestdiv (drivers/clk/clk-divider.c:336)
>  divider_determine_rate (drivers/clk/clk-divider.c:358)
>  clk_alpha_pll_postdiv_determine_rate (drivers/clk/qcom/clk-alpha-pll.c:1275)
>  clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
>  clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
>  __clk_determine_rate (drivers/clk/clk.c:1741)
>  clk_gfx3d_determine_rate (drivers/clk/qcom/clk-rcg2.c:1268)
>  clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
>  clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
>  clk_core_round_rate_nolock (drivers/clk/clk.c:1710)
>  clk_round_rate (drivers/clk/clk.c:1804)
>  dev_pm_opp_set_rate (drivers/opp/core.c:1440 (discriminator 1))
>  msm_devfreq_target (drivers/gpu/drm/msm/msm_gpu_devfreq.c:51)
>  devfreq_set_target (drivers/devfreq/devfreq.c:360)
>  devfreq_update_target (drivers/devfreq/devfreq.c:426)
>  devfreq_monitor (drivers/devfreq/devfreq.c:458)
>  process_one_work (arch/arm64/include/asm/jump_label.h:36 include/trace/events/workqueue.h:110 kernel/workqueue.c:3284)
>  worker_thread (kernel/workqueue.c:3356 (discriminator 2) kernel/workqueue.c:3443 (discriminator 2))
>  kthread (kernel/kthread.c:467)
>  ret_from_fork (arch/arm64/kernel/entry.S:861)
> 
> Fixes: 55213e1acec9 ("clk: qcom: Add gfx3d ping-pong PLL frequency switching")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Why didn't Brian get Cc'ed on this patch? I'd love to have his input.

Regards,
Bjorn

> ---
>  drivers/clk/qcom/clk-rcg2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 2838d4cb2d58..d0a5847f9111 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1264,6 +1264,7 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>  	if (req->max_rate < parent_req.max_rate)
>  		parent_req.max_rate = req->max_rate;
>  
> +	parent_req.best_parent_hw = req->best_parent_hw;
>  	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
>  	if (ret)
>  		return ret;
> 
> ---
> base-commit: b775e489bec70895b7ef6b66927886bbac79598f
> change-id: 20260117-db820-fix-gfx3d-e61329023c8a
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 
> 

