Return-Path: <linux-arm-msm+bounces-21615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 220748FB5CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 16:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D030F2848B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 14:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C2313C69C;
	Tue,  4 Jun 2024 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQUvskLU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA54135414;
	Tue,  4 Jun 2024 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512062; cv=none; b=nYfIEkGud8PsXV3/cQgyq7wBPASUNBA06nqOiz2RCW+heklDVYThOe0KWI5u054TlBhbEfB3xTTatgumvnG0cqmL2IxHLN8wTnmkeHuoa9SQGg5BocJ3rAGMiq0B5GpIbgYYYmoARsXNvG72qxKVD0SXlfJFre6BM9GQIZKAmJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512062; c=relaxed/simple;
	bh=mMQkWVSXbYBsdOLYmzi5KmcMzPAUaVKm50X4Xsw56ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANZoE/A87AvWAI/GmTXNOaCJOrYUvj9TfNmG9mBnqlFM8pYMo2u7/kvGHp5qxzSNDIw+BbwS5Tpd2FdbQHo33mBz3nA31GTaPHTOk8j6HXN53OOqFxB+LRZo69gdgJiPW0epjccaZLBIqSAI7DRbJz029XwNJ7zUSefPUUIzGaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQUvskLU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93555C2BBFC;
	Tue,  4 Jun 2024 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717512062;
	bh=mMQkWVSXbYBsdOLYmzi5KmcMzPAUaVKm50X4Xsw56ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQUvskLUvAt55dCN/pmYncolyVzQuWF9dIVGfKa0pBA+K25Oitp9cCR0TaJfjAF1Q
	 tC1lkodyEZ1uKzduXA77TZPeRyAB3dnPXYtZN3GCIR/FjJmK0bp0HrMRFPlgnsliRE
	 9dCqASCJsTU1nWSGRc2BNKXaWuEe0cQX1Skz+Yob3gtgxVqVy8veZPMl0cqlp1taW6
	 gU1Vfna8PrJUGo6Rp9vow6MUPsuQmY+vqC65KgDqr6C0qo5TH3OufTgaxEppC6Ongy
	 XQn2NY3KUcZKI6kYTFIxGMqUP7jPzB+VAvWreSh0jtFha1d+ufyadgliZynsXkmG8f
	 OtoQPMZbd3lng==
Date: Tue, 4 Jun 2024 15:40:56 +0100
From: Will Deacon <will@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: De-spaghettify the use of memory barriers
Message-ID: <20240604144055.GE20384@willie-the-truck>
References: <20240508-topic-adreno-v1-1-1babd05c119d@linaro.org>
 <20240514183849.6lpyplifero5u35r@hu-akhilpo-hyd.qualcomm.com>
 <ae4a77wt3kc73ejshptldqx6ugzrqguyq7etbbu54y4avhbdlt@qyt4r6gma7ev>
 <20240516145005.gdksmvxp35m45ifh@hu-akhilpo-hyd.qualcomm.com>
 <5vyrmxvkurdstqfiatxfqcqljwyiswda2vpkea27ighb2eqbav@n24yzdykbc23>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5vyrmxvkurdstqfiatxfqcqljwyiswda2vpkea27ighb2eqbav@n24yzdykbc23>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, May 16, 2024 at 01:55:26PM -0500, Andrew Halaney wrote:
> On Thu, May 16, 2024 at 08:20:05PM GMT, Akhil P Oommen wrote:
> > On Thu, May 16, 2024 at 08:15:34AM -0500, Andrew Halaney wrote:
> > > If I understand correctly, you don't need any memory barrier.
> > > writel()/readl()'s are ordered to the same endpoint. That goes for all
> > > the reordering/barrier comments mentioned below too.
> > > 
> > > device-io.rst:
> > > 
> > >     The read and write functions are defined to be ordered. That is the
> > >     compiler is not permitted to reorder the I/O sequence. When the ordering
> > >     can be compiler optimised, you can use __readb() and friends to
> > >     indicate the relaxed ordering. Use this with care.
> > > 
> > > memory-barriers.txt:
> > > 
> > >      (*) readX(), writeX():
> > > 
> > > 	    The readX() and writeX() MMIO accessors take a pointer to the
> > > 	    peripheral being accessed as an __iomem * parameter. For pointers
> > > 	    mapped with the default I/O attributes (e.g. those returned by
> > > 	    ioremap()), the ordering guarantees are as follows:
> > > 
> > > 	    1. All readX() and writeX() accesses to the same peripheral are ordered
> > > 	       with respect to each other. This ensures that MMIO register accesses
> > > 	       by the same CPU thread to a particular device will arrive in program
> > > 	       order.
> > > 
> > 
> > In arm64, a writel followed by readl translates to roughly the following
> > sequence: dmb_wmb(), __raw_writel(), __raw_readl(), dmb_rmb(). I am not
> > sure what is stopping compiler from reordering  __raw_writel() and __raw_readl()
> > above? I am assuming iomem cookie is ignored during compilation.
> 
> It seems to me that is due to some usage of volatile there in
> __raw_writel() etc, but to be honest after reading about volatile and
> some threads from gcc mailing lists, I don't have a confident answer :)
> 
> > 
> > Added Will to this thread if he can throw some light on this.
> 
> Hopefully Will can school us.

The ordering in this case is ensured by the memory attributes used for
ioremap(). When an MMIO region is mapped using Device-nGnRE attributes
(as it the case for ioremap()), the "nR" part means "no reordering", so
readX() and writeX() to that region are ordered wrt each other.

Note that guarantee _doesn't_ apply to other flavours of ioremap(), so
e.g. ioremap_wc() won't give you the ordering.

Hope that helps,

Will

