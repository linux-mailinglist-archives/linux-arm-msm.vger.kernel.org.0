Return-Path: <linux-arm-msm+bounces-58112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FE1AB8DA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69AEB166E0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055022571DF;
	Thu, 15 May 2025 17:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M//QyOR+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BC51DDD1;
	Thu, 15 May 2025 17:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747329796; cv=none; b=VTNIPtzCBPHrJwp54vyp5z2t0IXJP1WNp8i4RuOA6oVPtsyhE8n/fEYSiLqSS2bO8jrR+L62GaqPz4vcKjP3dDmk+p75cki8kUD9cv4vvjje4F6EtICdIJ3+XPw8qvunf0x64Vljl70VhljrA8E9MaoPT7eNAu/Nn/wEMAkgrNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747329796; c=relaxed/simple;
	bh=RvmHfZZ1f0AzI8waiCOB+v4pZfKLdBr4L5DOr1Kq/kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZ/a/R2GcbazAYmgD8dw0Q0leHFItIQC7f7bOQuNsBTXnV4DQ1FeY6oLhqU9+m9r2om5I6s2iTK+nFY1APJCH2ULwxd7Y7wmlikKBBejWpO4aNz5ufXthaMsjeFYEp5A/YqJgwTsN4w+YU9PMkKf/MuPZc7vHRCXUZTKa2/eAnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M//QyOR+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3C3C4CEE7;
	Thu, 15 May 2025 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747329796;
	bh=RvmHfZZ1f0AzI8waiCOB+v4pZfKLdBr4L5DOr1Kq/kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M//QyOR+F8Sa79Y916HbAENQvxd6ibec3oKeleXrm5HLvgWMiCGxH0vs74+Y4K+rw
	 Gb02RgIQ94HfIkYL+eSVzZvAILbxpO5GtsWev2RoegYcrUkxCu14rxRB/g4THAYjjp
	 4nLvZ7nQw9bNYafm0fyEs6RRk5OFnu8hsEn35xRPtzUqIT+lYoIJlctSoK1GPZTWRP
	 kr9tCpJq0UjoQ+JO+DdBT0V1yuCQAG7JN7Flw/e22c2nAN4pU7jeGbm+Voa4ZGkl48
	 O/xVkyWCUhl7kRKC7flJhOF5ZZZjE8vLYQQO5+ZQ2NSBnsf4Pk3bOtk/FqRGFNJQff
	 LSH5KIyi1wzhA==
Date: Thu, 15 May 2025 19:23:10 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@chromium.org>
Cc: phasta@kernel.org, Rob Clark <robdclark@gmail.com>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
Message-ID: <aCYi_mkv47ckB6ox@pollux>
References: <20250514170118.40555-1-robdclark@gmail.com>
 <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>

On Thu, May 15, 2025 at 09:15:08AM -0700, Rob Clark wrote:
> Basically it is a way to throttle userspace to prevent it from OoM'ing
> itself.  (I suppose userspace could throttle itself, but it doesn't
> really know how much pre-allocation will need to be done for pgtable
> updates.)

I assume you mean prevent a single process from OOM'ing itself by queuing up
VM_BIND requests much faster than they can be completed and hence
pre-allocations for page tables get out of control?

