Return-Path: <linux-arm-msm+bounces-82683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 455F3C74535
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 14:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5246A4EC9E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 13:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285CB3358B5;
	Thu, 20 Nov 2025 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGnxieYf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0248E32D443;
	Thu, 20 Nov 2025 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645669; cv=none; b=QI+ti4ke94uYo7MYO3qj6xL88U6OTlqXzHTyr+H0FQ7UjUbYvjrB0BqjY6OUm0kLgsdpru2a5HGixXpdaR+ftzVtb98d8OOOIDSX/O+Ona3Np+2Nn/VcBvfaSCd58sx/wq7vajSpUpCsIkJu+isz/Y9wwRqIBgA5db8wtwJH6vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645669; c=relaxed/simple;
	bh=F0Y/Fr0HVW6PZAhi55Y7GVue35pqN3YdPTw4RfJ0JJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzhPOwniNPLnzTeClHlFlJ2QGRF20iHBUUJ391KSOXJiUu20nlnoIpJlec2d3TworZnEbk1lCkvIB0TbuGzgkQ4yrsJeTihy1e5h3UAziVlBhQDhscz0lbXvjFVzfTytFUQW9OQbzAf65KjtJyAESzIszZPDsNUdtjvI95KvyAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGnxieYf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2485FC4CEF1;
	Thu, 20 Nov 2025 13:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763645668;
	bh=F0Y/Fr0HVW6PZAhi55Y7GVue35pqN3YdPTw4RfJ0JJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGnxieYfuYNSCXR1QiAWE35NSyeKdR6r4TgGtgwiylwvK+PVrn9REbdpvUPDcyytM
	 xlpVWIBvCqqdxn6pPq3DQBX1t5Log40EvpyVqddaKepoOV7nHC5rqnp7za03wZO9l4
	 G2zpXaZWbGYOWxCv9DNuXHU1BYQKaYTBAbLr32iIxfnjvK9XJUFXzLEE/bGCZGWufy
	 3q3MiOxENvLjB28VjIYLGiLjMXvtIaH3arGy3lSDRgedLQC5fKCEbLhjyw/fVE9iJp
	 TSilpp/cjgzqa2B5ziUzFnn5DrkieMtSlivyA/ENTE8lTc+3FkA5+5R3dYdB08uhDl
	 xA3cUPHohZL3A==
Date: Thu, 20 Nov 2025 07:39:27 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ice: Set ICE clk to turbo on probe
Message-ID: <4h2ximhzbwzin5b475uqwf55bb5kqjsvkj7tef3ixdakgvlies@x7li43qrsody>
References: <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com>
 <ep5x4ehq4gcyk67s7fwzcothgqyso4ltt2dd6fi6qdyvodz5mx@gvwmkkslvsw7>
 <aR7qkwX12gJa69ya@hu-arakshit-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR7qkwX12gJa69ya@hu-arakshit-hyd.qualcomm.com>

On Thu, Nov 20, 2025 at 03:46:51PM +0530, Abhinaba Rakshit wrote:
> On Wed, Oct 01, 2025 at 10:13:56PM -0500, Bjorn Andersson wrote:
> > On Wed, Oct 01, 2025 at 05:44:32PM +0530, Abhinaba Rakshit wrote:
> > > Set ICE core clock to turbo (max freq) provided by dt
> > > entry at ice device probe.
> > > 
> > > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > > ---
> > > MMC controller lacks a clock scaling mechanism, unlike the UFS
> > > controller. By default, the MMC controller is set to TURBO mode
> > > during probe, but the ICE clock remains at XO frequency,
> > > leading to read/write performance degradation on eMMC.
> > > 
> > > To address this, set the ICE clock to TURBO during probe to
> > > align it with the controller clock. This ensures consistent
> > > performance and avoids mismatches between the controller
> > > and ICE clock frequencies.
> > 
> > I think this (the snippet between the "---" lines) looks like a quite
> > good commit message; but it's below the first "---" and as such not
> > actually part of the commit message and will be ignored by the tools.
> > 
> > At the same time, the actual commit message ("Set ICE core...") isn't
> > very good at all, it completely lacks the problem description you
> > provide here.
> > 
> > Please use this for your commit message instead.
> 
> Sure, will update this properly in patchset v2.
> 
> > 
> > > ---
> > >  drivers/soc/qcom/ice.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > > index ec8d6bb9f426deee1038616282176bfc8e5b9ec1..eee06c499dc36a6bf380361f27e938331f1fcb10 100644
> > > --- a/drivers/soc/qcom/ice.c
> > > +++ b/drivers/soc/qcom/ice.c
> > > @@ -535,6 +535,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> > >  	struct qcom_ice *engine;
> > >  	const __be32 *prop;
> > >  	int len;
> > > +	int err;
> > >  
> > >  	if (!qcom_scm_is_available())
> > >  		return ERR_PTR(-EPROBE_DEFER);
> > > @@ -577,6 +578,13 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> > >  	if (!qcom_ice_check_supported(engine))
> > >  		return ERR_PTR(-EOPNOTSUPP);
> > >  
> > > +	/* Set the ICE clk rate to TURBO */
> > > +	if (engine->core_clk && engine->max_freq) {
> > > +		err = clk_set_rate(engine->core_clk, engine->max_freq);
> > > +		if (err)
> > > +			dev_err(dev, "Failed setting the clk to TURBO\n");
> > > +	}
> > > +
> > >  	dev_dbg(dev, "Registered Qualcomm Inline Crypto Engine\n");
> > >  
> > >  	return engine;
> > > 
> > > ---
> > > base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
> > > change-id: 20251001-set-ice-clock-to-turbo-ecab9ea46a89
> > > prerequisite-change-id: 20251001-enable-ufs-ice-clock-scaling-9c55598295f6:v1
> > > prerequisite-patch-id: d66f521e5e625b295a1c408cdfce9bd9524ae3ba
> > > prerequisite-patch-id: 23934f3fee5aabe4a2324130ed02909352b5cf61
> > 
> > We do have plenty of platforms that run the upstream kernel without any
> > changes, so please test your patch on a clean upstream kernel tree.
> > 
> > Thanks,
> > Bjorn
> > 
> 
> Sure,
> Most of the scaling operations will be a optional configuration, which should not break
> existing platforms. However, will ensure that in patchset v2.
> 

I meant you can enable this functionality on one of those targets (e.g.
Pakala MTP/QRD boots with defconfig and has UFS support), but perhaps
that's not applicable?

Regards,
Bjorn

> > > 
> > > Best regards,
> > > -- 
> > > Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > > 

