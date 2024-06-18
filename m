Return-Path: <linux-arm-msm+bounces-23107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4B690D767
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 17:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F0DA1C227AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 15:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D104437F;
	Tue, 18 Jun 2024 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuegVrQj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5A04120B;
	Tue, 18 Jun 2024 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718724866; cv=none; b=RI/SKej/XIeL/WpIRh8sENrXVIfS3/VaGGNAFhV+WDB73+QmZOunxW2UudoK6KeetltR+mKxZQPXgtDw3IKKAbmJLzpIvvUAPy0MFtUCge1IGMxcvVvjIlAkP38cA1fjGOzaFebuS2GSOT5aNVcdFzY39JJwSuPJvjfMa8z6DFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718724866; c=relaxed/simple;
	bh=+nQiJq6jvTQndJvGZiYobP2khJ0xmO2XzOZLZ/frEfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tN2SkbBgYKyY20SFgybZnBIiV5zDxpk/jE1J6aZSSLjx+UtzmUz8br6dNsZif84ZEsr3wusqKfWVQxI9dT/NTHQIsifA6K9ZqrKRwS9Tecyo+UZ/zfO0PW07AVg8eKyCQIZNG2K+iauW7f4eRGoqbiPDStsoUh9hvmlclH7B/JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuegVrQj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697B8C3277B;
	Tue, 18 Jun 2024 15:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718724866;
	bh=+nQiJq6jvTQndJvGZiYobP2khJ0xmO2XzOZLZ/frEfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CuegVrQjPPoQBzx63RvFc+JE14Y3fYyjgERDi5hBBJZhwf08XwWG8hzJXk8Jsqk3P
	 FgRO2Nlf3+qkTTGXlDf2BiO3B4VwXfGsfLlyQGWEXJzuCiO89yAiwd/NBWB7eR9lbl
	 Zos0HBP5RHSaypeys4SxN0J6luoo3ioCGqNzON9uZK+L7Wu8BV20kq5K9KyDc5vk+/
	 A/Tq6f+OoKE5jpNjAfKo8wuBvNFBUTl/DK9yw1cwSPNE74Ltn6r+37Jo3+dLxYbyiE
	 v2pVmU7kMV3JDlUcWbBNXXVdYoXMk6r02zM7woVfqa7STdTLRomo85Abw9h1og2pdg
	 gekUvQBeyKM0w==
Date: Tue, 18 Jun 2024 16:34:20 +0100
From: Will Deacon <will@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andrew Halaney <ahalaney@redhat.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: De-spaghettify the use of memory barriers
Message-ID: <20240618153419.GC2354@willie-the-truck>
References: <20240508-topic-adreno-v1-1-1babd05c119d@linaro.org>
 <20240514183849.6lpyplifero5u35r@hu-akhilpo-hyd.qualcomm.com>
 <ae4a77wt3kc73ejshptldqx6ugzrqguyq7etbbu54y4avhbdlt@qyt4r6gma7ev>
 <20240516145005.gdksmvxp35m45ifh@hu-akhilpo-hyd.qualcomm.com>
 <5vyrmxvkurdstqfiatxfqcqljwyiswda2vpkea27ighb2eqbav@n24yzdykbc23>
 <20240604144055.GE20384@willie-the-truck>
 <444f6a34-6636-44b0-850b-777c44fd62dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <444f6a34-6636-44b0-850b-777c44fd62dd@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Jun 06, 2024 at 02:03:24PM +0200, Konrad Dybcio wrote:
> On 4.06.2024 4:40 PM, Will Deacon wrote:
> > On Thu, May 16, 2024 at 01:55:26PM -0500, Andrew Halaney wrote:
> >> On Thu, May 16, 2024 at 08:20:05PM GMT, Akhil P Oommen wrote:
> >>> On Thu, May 16, 2024 at 08:15:34AM -0500, Andrew Halaney wrote:
> >>>> If I understand correctly, you don't need any memory barrier.
> >>>> writel()/readl()'s are ordered to the same endpoint. That goes for all
> >>>> the reordering/barrier comments mentioned below too.
> >>>>
> >>>> device-io.rst:
> >>>>
> >>>>     The read and write functions are defined to be ordered. That is the
> >>>>     compiler is not permitted to reorder the I/O sequence. When the ordering
> >>>>     can be compiler optimised, you can use __readb() and friends to
> >>>>     indicate the relaxed ordering. Use this with care.
> >>>>
> >>>> memory-barriers.txt:
> >>>>
> >>>>      (*) readX(), writeX():
> >>>>
> >>>> 	    The readX() and writeX() MMIO accessors take a pointer to the
> >>>> 	    peripheral being accessed as an __iomem * parameter. For pointers
> >>>> 	    mapped with the default I/O attributes (e.g. those returned by
> >>>> 	    ioremap()), the ordering guarantees are as follows:
> >>>>
> >>>> 	    1. All readX() and writeX() accesses to the same peripheral are ordered
> >>>> 	       with respect to each other. This ensures that MMIO register accesses
> >>>> 	       by the same CPU thread to a particular device will arrive in program
> >>>> 	       order.
> >>>>
> >>>
> >>> In arm64, a writel followed by readl translates to roughly the following
> >>> sequence: dmb_wmb(), __raw_writel(), __raw_readl(), dmb_rmb(). I am not
> >>> sure what is stopping compiler from reordering  __raw_writel() and __raw_readl()
> >>> above? I am assuming iomem cookie is ignored during compilation.
> >>
> >> It seems to me that is due to some usage of volatile there in
> >> __raw_writel() etc, but to be honest after reading about volatile and
> >> some threads from gcc mailing lists, I don't have a confident answer :)
> >>
> >>>
> >>> Added Will to this thread if he can throw some light on this.
> >>
> >> Hopefully Will can school us.
> > 
> > The ordering in this case is ensured by the memory attributes used for
> > ioremap(). When an MMIO region is mapped using Device-nGnRE attributes
> > (as it the case for ioremap()), the "nR" part means "no reordering", so
> > readX() and writeX() to that region are ordered wrt each other.
> > 
> > Note that guarantee _doesn't_ apply to other flavours of ioremap(), so
> > e.g. ioremap_wc() won't give you the ordering.
> > 
> > Hope that helps,
> 
> Just to make sure I'm following, would mapping things as nGnRnE effectively
> get rid of write buffering, perhaps being a way of debugging whether that
> in particular is causing issues (at the cost of speed)?

I think the "nE" part is just a hint, so it will depend on how the
hardware has been built. On top of that, you'll still need something
like a DSB to force the CPU to wait for the write response.

Will

