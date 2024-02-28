Return-Path: <linux-arm-msm+bounces-12853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6FE86A922
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 08:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BED1FB260CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 07:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B20F25556;
	Wed, 28 Feb 2024 07:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJgQCd62"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DC025573
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 07:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709106072; cv=none; b=OSnwmbSUWCqZERZjhwuQfM/U94o1+IlExmF3vAcFb6MovSceRvOq3G8myLLbC5bWnYaqX65SfECPCnR5pgN6Pdopel8kH+erTR225oLVhc+fFLylcuOk9KXwvSdi4vBFlIwh6P6Q4jD+rjLriPH/HvusbYKKod29JKo7J3euCBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709106072; c=relaxed/simple;
	bh=ArceDPNTsITgy+bVAaByxfv3lQgfKIHA+/Q6fvdP4D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ur0gqow7m/Y3oVEQcrqb1nVgj7g9eVT57OaTwAKPvtu6xBeEZH8anp8IRk4pleh6G8EuOnxGrLYvj7XtAkUtqzDpjMt0kvafjsVbVrKx25jHuBPb8+Q68bTWK7i/zD592/Uw0kPyXkq5Tcg7gOI6sb63ayVCmDIj3QC+fMcWSN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJgQCd62; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689D3C433C7;
	Wed, 28 Feb 2024 07:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709106071;
	bh=ArceDPNTsITgy+bVAaByxfv3lQgfKIHA+/Q6fvdP4D8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nJgQCd62ROjBY+DHdDA0XKDsGIToZUeUgWHvzeahz1qa+eFgz0KFn71DozWFTmJoI
	 CeP9YgVXo31sqqX/M3ZynmkcmfMpuAsjhV9VX8vC+Hx3y1fDHLW0otnLN6sViB2fLW
	 gveGtugTf1LyupDoVMjFmaPkfJNW5KjlP1iAp/VmmxmhgCbMyRf7a+fEeBlYp7NZ30
	 GaBRPY4lTPFTzpCxiZjCnbA7rXs9Wr262hraFIjtpijH+aGg9H/24rMR/6CZYL1kMo
	 ZVeVh1kc3DqRsndAla/Y2Sp24uje/rh/2Ctdad3Gh7mpBMDafgkUpdQtuUewhl8BiY
	 xpqUlt33CiZmQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rfEZ2-000000003re-2Jll;
	Wed, 28 Feb 2024 08:41:16 +0100
Date: Wed, 28 Feb 2024 08:41:16 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
Message-ID: <Zd7jnPTnfjyfAvZ_@hovoldconsulting.com>
References: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>

On Wed, Feb 28, 2024 at 12:08:08AM +0200, Dmitry Baryshkov wrote:
> This reverts commit e467e0bde881 ("drm/msm/dp: use
> drm_bridge_hpd_notify() to report HPD status changes").
> 
> The commit changed the way how the MSM DP driver communicates
> HPD-related events to the userspace. The mentioned commit made some of
> the HPD events being reported earlier. This way userspace starts poking
> around. It interacts in a bad way with the dp_bridge_detect and the
> driver's state machine, ending up either with the very long delays
> during hotplug detection or even inability of the DP driver to report
> the display as connected.
> 
> A proper fix will involve redesigning of the HPD handling in the MSM DP
> driver. It is underway, but it will be intrusive and can not be thought
> about as a simple fix for the issue. Thus, revert the offending commit.
> 
> Fixes: e467e0bde881 ("drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes")
> Link: https://gitlab.freedesktop.org/drm/msm/-/issues/50
> Reported-by: Johan Hovold <johan@kernel.org>
> Link: https://lore.kernel.org/r/Zd3YPGmrprxv-N-O@hovoldconsulting.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested-by: Johan Hovold <johan+linaro@kernel.org>

