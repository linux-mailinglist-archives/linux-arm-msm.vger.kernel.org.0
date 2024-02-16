Return-Path: <linux-arm-msm+bounces-11397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 929F38584CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 19:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E6002817B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 18:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A2313340D;
	Fri, 16 Feb 2024 18:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5RpmDuU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18A112FB3F;
	Fri, 16 Feb 2024 18:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708106705; cv=none; b=VV/VwKhSPGHg/vNhV6Z0WoxYPknwyhRvQuoy5GaVizNUj6qt8jAEKIEaK0TBIxFmbQWKf1EUZ6+6tP496/gQr7yN+QubaBk3w0KXmUDkU4s1zDVHEO7lnSVNExZQ+E5CU1bWAvdrGaW4meYlEQyv1Ubp6MmZSni+aJ79Zid6cuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708106705; c=relaxed/simple;
	bh=vG/RKSRTXzqAUxbAxGsYUW1wn0EAG4siYC+evNc+IOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzS0pbLGGWdsYChyYrmtHF7b7sfke0kR95Gqj1mK3P3Fp+/qfsk3d14JCSmeDkVz4EpAHTzUTfnywGCaKQOtBwcGly+nvysXAa7MXujA7mAZ7AKBLrE7jmuP6WHCkXE4B+DRGr0cNFtlzpqyPbGz2GQmifMqzRrFx3uH7KviFyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5RpmDuU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE75FC433C7;
	Fri, 16 Feb 2024 18:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708106705;
	bh=vG/RKSRTXzqAUxbAxGsYUW1wn0EAG4siYC+evNc+IOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5RpmDuUiTEP2FeBe2JgOBq/D8z+MLtqWSuSNSbCQMoEn1su+PuqgTIsbcKEOfJFl
	 IbBwzFpiRVjZjkTuTWpO4QXHU5F4r1DD7Rly7RvJtLmtCVBJlJXa8PoxfMmh8iYkCs
	 WGRoVikXPBHUT5XIbzQiPihfov+fuxTVlOB6owwytGPd+UPF3GCXKwmj1ilNTuGIfP
	 TwHXvHLlc/fEUCYcVUm9TTjNNMKMgujpUCm1Gz89iu/mgyU82eT9/kq6BsdFKQlqLg
	 HMPVR/Z3ZrOvaW90jqkMc4HFf+mldHcVZLhymeV+cjJSFKVi560NKyu5dbg249S6+d
	 kkwuFi1XAg1Hw==
Date: Fri, 16 Feb 2024 10:05:03 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: chao@kernel.org, quic_stummala@quicinc.com, quic_bjorande@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: doc: Fix bouncing email address for Sahitya Tummala
Message-ID: <Zc-jz93ECAgAbeON@google.com>
References: <20240202165208.4091800-1-quic_jhugo@quicinc.com>
 <ce40205b-25c6-6ba5-23a4-70a51b4e1b21@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce40205b-25c6-6ba5-23a4-70a51b4e1b21@quicinc.com>

On 02/16, Jeffrey Hugo wrote:
> On 2/2/2024 9:52 AM, Jeffrey Hugo wrote:
> > The servers for the @codeaurora domain are long retired and any messages
> > addressed there will bounce.  Sahitya Tummala has a .mailmap entry to an
> > updated address, but the documentation files still list @codeaurora
> > which might be a problem for anyone reading the documentation directly.
> > Update the documentation files to match the .mailmap update.
> > 
> > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Jaegeuk Kim will you apply this?

Thanks for reminding this. Applied.

> 
> -Jeff

