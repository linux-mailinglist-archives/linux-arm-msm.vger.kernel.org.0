Return-Path: <linux-arm-msm+bounces-44136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A68A0400D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 13:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C8231660F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 12:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC54E1E1044;
	Tue,  7 Jan 2025 12:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlxkHKkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918586136;
	Tue,  7 Jan 2025 12:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254665; cv=none; b=modUy1KkGy94h8n9rDLAsE4wZb0sP0lgmgXVZhg9iImttQo/4qd1xl5MIndLAwyD7CKM5lTJ3esZ7CKconuRW6Nk9TM0VrATt4a5Yx2dQIm/LiPrJ1VGUl1azDlE5A7PehYaop13gNGom+ZzkOIRqK6wtcdFpqqmLcbrDZg1iV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254665; c=relaxed/simple;
	bh=zvplV8B3BpnXVADmocgfgHIqHLcNMsgpQiKMncNel+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkVb5lfifln04PrxJRBy1w6ilOUb2nnxdtAofCLT0RYun2zbPuqR8R/eYY/vJFbcP/Z0hRraUE5yCIneaAJ5bsxOG7/emrLuyDfQ/l57ZQ+Lms5xSEmivFbIvnGYz0RGbH5oZNCHciiG7lGmXTRK5j+pMKDk8JpJyIAHlk0WC3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlxkHKkZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69313C4CED6;
	Tue,  7 Jan 2025 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736254665;
	bh=zvplV8B3BpnXVADmocgfgHIqHLcNMsgpQiKMncNel+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SlxkHKkZx8Ab4eWY7YLwa6PjymcKGOZYfiYIn/PJPSbJbGuekhDAHf7qAdldVBokC
	 QYc9asuyrlvFmfi8edcliRf1RcW0x5B2s3iIUYYZ6mxVyL6FsQykZb3jfbQ5v1SnVV
	 a/iSJzEr2VJIoaY6rKY0TTUUwM6Kk6Tf8l0Fo0tMlnTc9CPYb8wOs5QXzA9ndOKxi+
	 xl3ii2AFiLPBTs9xXjqnlRhrdqGteh74iLiE7NWemiZoqb1uRrM04thDe7RRnugqXx
	 VQaSnVxwl6Ypuy0ZWfq3Ym8CktsGfBVgWZJm9G8KMnROBmZJ5vQthEqFTe9rwIqIhA
	 5Uj/wBxgKkWMw==
Date: Tue, 7 Jan 2025 12:57:39 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Message-ID: <20250107125738.GA6991@willie-the-truck>
References: <20250102183232.115279-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102183232.115279-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Jan 02, 2025 at 10:32:31AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> On mmu-500, stall-on-fault seems to stall all context banks, causing the
> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> 
> This fixes an issue with an older mesa bug taking outo the system
> because of GMU going off into the weeds.
> 
> What we _think_ is happening is that, if the GPU generates 1000's of
> faults at ~once (which is something that GPUs can be good at), it can
> result in a sufficient number of stalled translations preventing other
> transactions from entering the same TBU.

MMU-500 is an implementation of the SMMUv2 architecture, so this feels
upside-down to me. That is, it should always be valid to probe with
the less specific "SMMUv2" compatible string (modulo hardware errata)
and be limited to the architectural behaviour.

So what is about MMU-500 that means stalling doesn't work when compared
to any other SMMUv2 implementation?

Will

