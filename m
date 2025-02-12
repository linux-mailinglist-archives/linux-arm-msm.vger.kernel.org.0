Return-Path: <linux-arm-msm+bounces-47804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3F7A32D6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 18:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 007A03A95E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C041D2586D0;
	Wed, 12 Feb 2025 17:24:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE5A25743B
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739381098; cv=none; b=XFrxngTwZk74UdsXV0KPIECGQQ7y1jDgwANAfmyHtEr9AttlQSkwtr+I+GjMsEdBZkRXhOKrtqjYtNSr1O/iOtukiUoY+I4IRf/Dxd0lPvNPnvU3Br5ha5q+RiIL0UNaat3xLRdCwvLGRIg5fAymL/zgy5/vONO3jPjW/peQg90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739381098; c=relaxed/simple;
	bh=9gCjobiYa/6p9KenXe+D1iIF8xmGMgHGb1ynZLgSv4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Am8eVV5NA/c+hqpztLgZEH2oze465rQ8GWDzy/iCgH5B7d6ltKlRu4xsva6BR1XbpZfkes+5+gkdHQjWly795iGCIFimRO8Ti+wt59dHAhYKjR4hHAQ6DrqYyuEAerkxm7YzurtNWDLa7IbL/ZtiOYDEUiM+jpCGBDGifBNPPCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 553821F974;
	Wed, 12 Feb 2025 18:24:48 +0100 (CET)
Date: Wed, 12 Feb 2025 18:24:47 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robdclark@gmail.com, 
	quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH 0/2] drm/msm/dp: Fix Type-C Timing
Message-ID: <4f2w7yb2f3fvg5t3hyr3ionncqgfgilud4rytotxvmxr675272@oenwx5cf6ltl>
References: <20250212034225.2565069-1-james.a.macinnes@gmail.com>
 <yle4tv3rhxkygvxvq56pls2u4muzmuxlzg5mp6ibckkyhbaycm@mv4hmom2e46c>
 <20250212083424.2bf95a43@jamesmacinnes-VirtualBox>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212083424.2bf95a43@jamesmacinnes-VirtualBox>

On 2025-02-12 08:34:24, James A. MacInnes wrote:
> On Wed, 12 Feb 2025 13:20:01 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On Tue, Feb 11, 2025 at 07:42:23PM -0800, James A. MacInnes wrote:
> > > SDM845 DisplayPort output inop on DP Monitor and tears on HDMI.
> > > 
> > > Fixed
> > >  - SDM845 does not support wide mode.
> > >  - SDM845 does not need porch shift.
> > > 
> > > Verified functionality on SDM845.  
> > 
> > Please use ./scripts/get_maintainer.pl to get the To / Cc lists. Your
> > messages missed several mailing lists and maybe some of maintainers.
> > 
> 
> Will do. The list from get_maintainers.pl was very long and I was
> attempting to not spam everyone. On revision I will include everyone.

May I suggest using b4 for patch handling?  It'll help with tracking revisions,
cover letters, To/Cc, running checkpatch andsoforth:

https://b4.docs.kernel.org/en/latest/

(Another patch of you seemed to have V2 tacked on to the end of the cover letter
title; it's instead supposed to be part of the PREFIX like [PATCH v2 1/2] for
every message.  This tool will automatically handle that for you :D)

- Marijn

