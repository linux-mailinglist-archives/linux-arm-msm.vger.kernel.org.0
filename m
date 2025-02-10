Return-Path: <linux-arm-msm+bounces-47428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6965A2EEBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 14:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BA797A11B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 13:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B0F22F395;
	Mon, 10 Feb 2025 13:49:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4305722F16D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 13:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739195370; cv=none; b=WXtSvFZ1G0H3uFRlxLKCYzUZd9DUSSDk5pi3XkIF+et7ZalTYSiqUqAs07KQ8eVDKGn1y2YMvpaFmAbrbwPHlGX3Ol/WqjKPen6feNKf0zqNGwDHeEy5oH1dMaX0wk0/C2bQkwW490J7wWWWkQyqWVfhhDpUe7GpDKnSXZHfD0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739195370; c=relaxed/simple;
	bh=3TrPeTpYLv/dU4AHk72M1wqH0pYDS+Ib0xu+uGJ+RRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rL2dGWnW1LQ7M/ZBpz54lArIgiGmdmTc3RdRb9M8oFgkfMWnKOLPCQW8HF3mN/Mz34bbCT8bdl2rGvgf7VClqVTrKtbvR2jcoZ5OOwP5peFa1S7qv1GsSktqS4BlisDJgq3Mb8VeDnfvD6EIWsP0YjVxncezRtVg6cqrQSqW4HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 64F123F68F;
	Mon, 10 Feb 2025 13:54:31 +0100 (CET)
Date: Mon, 10 Feb 2025 13:54:29 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jordan Crouse <jordan@cosmicpenguin.net>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] drm/msm/dsi: Set PHY usescase (and mode) before
 registering DSI host
Message-ID: <vsxfi43d7rxh5xxc7ctivjslf6w4yy5iprqpqid3u3diylrtwd@wayafjlgzz7v>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
 <nzm3tokbvho3hxz3e5vblp5ndagfcv5ah3j7gtkqjmt7ynr6f3@v36juvu73i5v>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nzm3tokbvho3hxz3e5vblp5ndagfcv5ah3j7gtkqjmt7ynr6f3@v36juvu73i5v>

On 2025-02-10 01:11:59, Dmitry Baryshkov wrote:
> On Sun, Feb 09, 2025 at 10:42:53PM +0100, Marijn Suijten wrote:
> > Ordering issues here cause an uninitialized (default STANDALONE)
> > usecase to be programmed (which appears to be a MUX) in some cases
> > when msm_dsi_host_register() is called, leading to the slave PLL in
> > bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
> > 
> > This should seemingly not be a problem as the actual dispcc clocks from
> > DSI1 that are muxed in the clock tree of DSI0 are way further down, this
> > bit still seems to have an effect on them somehow and causes the right
> > side of the panel controlled by DSI1 to not function.
> > 
> > In an ideal world this code is refactored to no longer have such
> > error-prone calls "across subsystems", and instead model the "PLL src"
> > register field as a regular mux so that changing the clock parents
> > programmatically or in DTS via `assigned-clock-parents` has the
> > desired effect.
> > But for the avid reader, the clocks that we *are* muxing into DSI0's
> > tree are way further down, so if this bit turns out to be a simple mux
> > between dsiXvco and out_div, that shouldn't have any effect as this
> > whole tree is off anyway.
> > 
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++++++++++++-----------
> >  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> 
> Fixes: 57bf43389337 ("drm/msm/dsi: Pass down use case to PHY")

I'm not exactly confident about that.  Abhinav pointed out in
https://gitlab.freedesktop.org/drm/msm/-/issues/41#note_2375646 that
msm_dsi_host_register() was not supposed to be enabling the PHY, which I
provided a counter-stacktrace for to show that is indeed the case.

Either this was always a problem that's only become visible now (and it's an
issue with that patch), or a different change causes msm_dsi_host_register()
to enable the PHY and program the usecase too early?

What do you think?

- Marijn

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > index a210b7c9e5ca281a46fbdb226e25832719a684ea..b93205c034e4acc73d536deeddce6ebd694b4a80 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -74,17 +74,33 @@ static int dsi_mgr_setup_components(int id)
> >  	int ret;
> >  
> >  	if (!IS_BONDED_DSI()) {
> > +		/* Set the usecase before calling msm_dsi_host_register(), which would
> > +		 * already program the PLL source mux based on a default usecase.
> > +		 */
> > +		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> > +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > +
> >  		ret = msm_dsi_host_register(msm_dsi->host);
> >  		if (ret)
> >  			return ret;
> > -
> > -		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> > -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> >  	} else if (other_dsi) {
> >  		struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
> >  							msm_dsi : other_dsi;
> >  		struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
> >  							other_dsi : msm_dsi;
> > +
> > +		/* PLL0 is to drive both DSI link clocks in bonded DSI mode.
> > +		 *
> > +		/* Set the usecase before calling msm_dsi_host_register(), which would
> > +		 * already program the PLL source mux based on a default usecase.
> > +		 */
> > +		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> > +					MSM_DSI_PHY_MASTER);
> > +		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> > +					MSM_DSI_PHY_SLAVE);
> > +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > +		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
> > +
> >  		/* Register slave host first, so that slave DSI device
> >  		 * has a chance to probe, and do not block the master
> >  		 * DSI device's probe.
> > @@ -98,14 +114,6 @@ static int dsi_mgr_setup_components(int id)
> >  		ret = msm_dsi_host_register(master_link_dsi->host);
> >  		if (ret)
> >  			return ret;
> > -
> > -		/* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode. */
> > -		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> > -					MSM_DSI_PHY_MASTER);
> > -		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> > -					MSM_DSI_PHY_SLAVE);
> > -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > -		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
> >  	}
> >  
> >  	return 0;
> > 
> > -- 
> > 2.48.1
> > 
> 
> -- 
> With best wishes
> Dmitry

