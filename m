Return-Path: <linux-arm-msm+bounces-12867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2492A86B054
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 14:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D344D28A8AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 13:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4927C14AD2D;
	Wed, 28 Feb 2024 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bErwqjf5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255D114AD28
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709126914; cv=none; b=PdNWC+kgi/er1b3d9A9GdF04xmWw3157IGGa/yOCC9xMpQJxUyIANGGwpgf+ggXsE9hlOAdsNFwzmwc97kfrWeyYfbn+PyZnmfNF0oX9enN+3G3DdB07uFlSiE0kY7rt0bqhMUscqbQ0rZt1ZWCC6mZMm+V8wYzfX48BJPxDvaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709126914; c=relaxed/simple;
	bh=Xa1SqKUN0z8eqErG0+/n6X0+kEVDNZ1yNpqN8ToX29o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HexruFv6jE0bOkIyT1ZKaaDM71xbncVE3aKCmNiAMGToVFlVK/pOZxb1i6B4+7IP8bIBZpmVhUv6t/6/Bq05vXj2qtW2zPD5B/Un69ZP7PPM4WzfHUiSTDf6ACNOFGi1y0cSMzVI0PyhhizAmwq6d7MrsopZtQ/7RSsPAfR1rVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bErwqjf5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D5BC433C7;
	Wed, 28 Feb 2024 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709126913;
	bh=Xa1SqKUN0z8eqErG0+/n6X0+kEVDNZ1yNpqN8ToX29o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bErwqjf5LohU0vJ6fW2sm9DttoZMTGmFS+QzI4lXY7zcPvMyoHtfR9FaDnd+zcBiq
	 fbcc3lZmsbS1xiGLbZzOH5BVBC2YO8w555nQ+H9EVSFwA8ZH8zpAeWYE+B1oKkH+Wn
	 JbJ+nwhzuZGTlfhJg42XpoEyZ5XjRbmQpVSb989xFEV8x6bq+AHqyRB1akK47Vgrqc
	 hL+ke/sqpZJZ26mlR37+3B0D4gCX2Fr/lOMcdppkJIgXIRjrBK+4dJhFnqMkPZxDNf
	 ssQgKwCrc+iv6AVv0iUsvt6PfUCSAGPOMVrkC/TSoK4CRdWI5Hi9xQ+Or3vCugzaur
	 r+JFj9JE1G0og==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rfJzB-000000006VL-3vBo;
	Wed, 28 Feb 2024 14:28:38 +0100
Date: Wed, 28 Feb 2024 14:28:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH] Revert "drm/msm/dp: use drm_bridge_hpd_notify() to
 report HPD status changes"
Message-ID: <Zd81BWaj5zJeDA2Q@hovoldconsulting.com>
References: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
 <46fa8e0a-0af2-2a44-f5f9-70fd49649aa4@quicinc.com>
 <Zd8B6T6ROHFCqEyB@hovoldconsulting.com>
 <CAA8EJppvansib9NxqPcuuAVe+qc1i8HmDqNh6+kaDZn6zFijpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppvansib9NxqPcuuAVe+qc1i8HmDqNh6+kaDZn6zFijpw@mail.gmail.com>

On Wed, Feb 28, 2024 at 01:08:04PM +0200, Dmitry Baryshkov wrote:
> On Wed, 28 Feb 2024 at 11:50, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Tue, Feb 27, 2024 at 02:11:56PM -0800, Abhinav Kumar wrote:
> > > On 2/27/2024 2:08 PM, Dmitry Baryshkov wrote:
> > > > This reverts commit e467e0bde881 ("drm/msm/dp: use
> > > > drm_bridge_hpd_notify() to report HPD status changes").
> > > >
> > > > The commit changed the way how the MSM DP driver communicates
> > > > HPD-related events to the userspace. The mentioned commit made some of
> > > > the HPD events being reported earlier. This way userspace starts poking
> > > > around. It interacts in a bad way with the dp_bridge_detect and the
> > > > driver's state machine, ending up either with the very long delays
> > > > during hotplug detection or even inability of the DP driver to report
> > > > the display as connected.
> > > >
> > > > A proper fix will involve redesigning of the HPD handling in the MSM DP
> > > > driver. It is underway, but it will be intrusive and can not be thought
> > > > about as a simple fix for the issue. Thus, revert the offending commit.
> > >
> > > Yes, for fixing this on 6.9 I am fine with this.
> >
> > Since this is a regression in 6.8-rc1, I hope you meant to say 6.8 here?
> 
> In the worst case it will land to 6.8.x via the stable tree process.

This is a fix for a user-visible regression that was reported formally
two weeks ago and informally (e.g. to you) soon after rc1 came out, and
which now also has an identified cause and an analysis of the problem.
And we're at rc6 so there should be no reason to delay fixing this (e.g.
even if you want to run some more tests for a couple of days).

Johan

