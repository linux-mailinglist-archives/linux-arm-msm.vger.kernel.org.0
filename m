Return-Path: <linux-arm-msm+bounces-9069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5128842BB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 19:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B2A91F2A7E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 18:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA7115AAB4;
	Tue, 30 Jan 2024 18:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cl236y1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A761C15AAAF;
	Tue, 30 Jan 2024 18:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706638911; cv=none; b=YkQspKTM7V0chTjuSmGg4lTTPhWUGX1a5ELCT1y28+FEJD3HpH2zLrwY9VMRECQuUCqgcBffmrXf6ed1y0RiXJa/XPpva2xbN5tSuqRrQdsV9oIY+nlismXT8+Yvu+CXQjQzM4kxOPNdJ/qQfZqqO63OSW2TeUZ9iyvMrukEN0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706638911; c=relaxed/simple;
	bh=f5GRuKFSaZ1KkRgF8Ss0n00WHogOOJ7yng4KR3k6hH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbM/g4mzBH1saMcBN2X3ozhCVNxGUdi8MWZ2gUmGmXlVmBIT333zwAhRhk1vPtg0CYbpZLxA3WMXho/YrC0mKFDheFKaIWII3vNFRcFrFl68eN2b9XnvkyHVfce2dLOtn+koLAEjGGbl3Uyv1vG+OzHO5j5lWbdlDB/deFSUkic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cl236y1F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3626DC43330;
	Tue, 30 Jan 2024 18:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706638911;
	bh=f5GRuKFSaZ1KkRgF8Ss0n00WHogOOJ7yng4KR3k6hH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cl236y1FGXGU2GPkmy/VyZyYN2TiHmME1NwxeJDtxJcOjrTSoqiqxwFPHl+skqbJV
	 xralLqSsjajaEGyiyJBlVsRpX7uT6tJ2xa3JtG0t0v8MsRUsrbzdiigNv9t4qU8BGR
	 3C5KbCLoTTcGOpiqtPYIpP/V6dqx2u8kWVAFvhYjozPrv4pe32bkhOygGxM5vH7ZZ8
	 FU8eRzi4R1kSRmNINQuHsSbjy/V7wuL46wpctER8ZFt/txSkQQ5BQWs/Oe/Ls3jef5
	 dVIM/z1Jjd6QvOQqVD+a8rZ7D7ObiVYu/IS0uIuWaAngolX8bwt9bc12aAoAEsOtKS
	 0IdjU3ssJRhPg==
Date: Tue, 30 Jan 2024 23:51:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, quic_pkanojiy@quicinc.com,
	quic_carlv@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: Read PK HASH dynamically
Message-ID: <20240130182145.GC4218@thinkpad>
References: <20231208165938.1340587-1-quic_jhugo@quicinc.com>
 <20240130082138.GL32821@thinkpad>
 <6966f6a7-9fb0-0766-3b69-af82c723d349@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6966f6a7-9fb0-0766-3b69-af82c723d349@quicinc.com>

On Tue, Jan 30, 2024 at 09:05:06AM -0700, Jeffrey Hugo wrote:
> On 1/30/2024 1:21 AM, Manivannan Sadhasivam wrote:
> > On Fri, Dec 08, 2023 at 09:59:38AM -0700, Jeffrey Hugo wrote:
> > > The OEM PK HASH registers in the BHI region are read once during firmware
> > > load (boot), cached, and displayed on demand via sysfs. This has a few
> > > problems - if firmware load is skipped, the registers will not be read and
> > > if the register values change over the life of the device the local cache
> > > will be out of sync.
> > > 
> > > Qualcomm Cloud AI 100 can expose both these problems. It is possible for
> > > mhi_async_power_up() to be invoked while the device is in AMSS EE, which
> > > would bypass firmware loading. Also, Qualcomm Cloud AI 100 has 5 PK HASH
> > > slots which can be dynamically provisioned while the device is active,
> > > which would result in the values changing and users may want to know what
> > > keys are active.
> > > 
> > > Address these concerns by reading the PK HASH registers on-demand during
> > > the sysfs read. This will result in showing the most current information.
> > > 
> > > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > 
> > Applied to mhi-next!
> > 
> > - Mani
> 
> I hope you applied v2 since this is a reply to v1.  I don't see mhi-next
> with this change published yet, so I can't check.
> 

Sorry, I did apply v2.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

