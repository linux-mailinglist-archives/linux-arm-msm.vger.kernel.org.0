Return-Path: <linux-arm-msm+bounces-48763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE01A3E717
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 22:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B69043B89EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 21:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF825213E80;
	Thu, 20 Feb 2025 21:57:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCEF1F03D8
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 21:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740088675; cv=none; b=DInDdVlVovags9LvYflDswmqST0R1pz4Wxtyde4GupAr9WBCUQTOPXUrD1hlcEd7NUmbEq072PVLGwYc1rmeHvAS+vU+5wwxbNguc/umOmpfzyEoBOLnF6ziosH3jAQ4MWJJR5tAwFy9rpTPi/is89aYe9gShNdJvDxB1xO9eB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740088675; c=relaxed/simple;
	bh=tBiT1zKiECuw9YCaCSN9G/JLtivloNtC5SEjSI7ILFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iR/ckl7jbDzvfD1NfZ4kisFxyxPoLHPkDalHhIXkWZxydIFIu6tqL3fcx/BhG45gUAiI1UaVjLEuHw4bkR4JlkB63DIPbb9RSCNXSCxq0hZJjKjuwvfVkqH31OlCFOPJm7UDIOyU3HlJm4Yu+Zf5G7CCIIdsOrvZDtTMHGP69qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 89B6A3ED61;
	Thu, 20 Feb 2025 22:50:59 +0100 (CET)
Date: Thu, 20 Feb 2025 22:50:57 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm/msm/dsi: Support DSC for dual panel case
Message-ID: <cokgqc6qd26caz63lwoyjcfbewbh3zxagjedzy6o6tfkt7wgmp@fz2gquyxcxbu>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-5-6c0038d5a2ef@linaro.org>
 <iibq3orsb7uf44luz2he2auox43ki42m2z4nnderyqlhypvfgo@pwqpvua6vuyo>
 <CABymUCNajuc8WnWgf2JehFYUY-MqxCYmD=By8nY-JppxYHsyNw@mail.gmail.com>
 <m7brftsrxdikfeumbjkubeeleezka7mwjbchxefqgs4ybtca5n@ge3ay2olagq2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m7brftsrxdikfeumbjkubeeleezka7mwjbchxefqgs4ybtca5n@ge3ay2olagq2>

On 2025-02-20 18:06:01, Dmitry Baryshkov wrote:
> On Thu, Feb 20, 2025 at 11:42:28PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年2月20日周四 18:39写道：
> > >
> > > On Thu, Feb 20, 2025 at 06:07:56PM +0800, Jun Nie wrote:
> > > > There is dual DSI case that every DSI link is connected to an independent

There is a dual-DSI case where every DSI link ...

> > > > panel. In this dual panel case, the frame width for DSC on each link should
> > > > be halved to support the usage case.

use* case.  Also, it shouldn't be "halved" just... because?  It should be
"halved" because apparently hdisplay here is the width of the two panels
together, while the width coded in pic_width should contain that of a single
panel (since they're independent), which is equal to the width of a single
interface.

Tl;dr for below: this needs a *lot* more text to explain the setup and
possibilities.  How is a DSI panel driver supposed to configure this on their
end?  Hint: look at my previous drm/msm patches that explain how we expect to
interface with the parameters set by the panel driver.

> > >
> > > Isn't it the case for the DSI panel utilizing two DSI links?
> > 
> > The added case here is 2 DSI panel utilizing two DSI links, 1 DSI link
> > in each panel.
> > I assume default case is 1 panel with 2 DSI link, such as Marijn's case.
> 
> So it should be halved in your case, but not in Marijn's case? I can
> suspect that if you are describing two DSI panels as a single instance,
> you should also adjust drm_dsc_config accordingly (on the panel's side?)
> 
> Maybe drm_dsc_config.pic_width and drm_dsc_config.pic_height should be
> set on the panel's side? But then, how will that function for the DSI
> panels or bridges which can change the mode?

It appears that these patches are missing a proper description of the setup
or use-case.  I previously NAK'd those "dual DSI" patches because of this, but
reading between the lines I think I came to understand the reason without anyone
else explaining it, unfortunately.  Needless to say that this needs very careful
documentation and wording in both code (DT and/or header structs) and commit
messages.

In my case I have a single high-resolution high-refresh-rate panel that can
simply not be driven over a single DSI link.  A dual-DSI link is used in bonded
mode, most likely to keep the clocks and other things in sync, and to make it
easier to be represented by one virtual encoder in DPU?  All control commands
only need the sent over one DSI link, not over both.

In this case pic_width is equal to the entire width of the panel, hence it is
double the width of a single interface.

Jun seems to have a strangely different use-case for bonded-DSI / dual-DSI that
isn't explained: two "independent" panels.  It is clear to me that pic_width
here has to contain the width of the entire panel, and is hence equal to the
entire width of a single interface.
(And in the future, it seems the quad setup can drive two "bonded" panels with
 two DSI-merge's each)

But what we're missing here is what the **advantages and limitations** are
of this setup: why would one run two DSI links for "independent" panels in
bonded-DSI mode?  Is it more power-optimal?  Will userspace see this as one
panel that's simply twice as wide?  Do these panels have to be "identical"
so that they behave and are clocked the same?  How is the driver expected to
prepare the mode and DSC configuration parameters to make this work?

Perhaps it's possible to scrape this info from [1] and prior commits but I
rather have a more digestible description in the commit message, thanks.

- Marijn

[1]: https://gitlab.com/jun.nie/linux/-/commit/98c0f411a85d68a76be500f8421df467d6cc53f3

