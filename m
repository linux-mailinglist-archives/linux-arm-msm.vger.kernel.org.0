Return-Path: <linux-arm-msm+bounces-58042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB22AB81CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 11:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2950B7ACCFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 09:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FF529825A;
	Thu, 15 May 2025 09:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gY5ja/xX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB11298252;
	Thu, 15 May 2025 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299623; cv=none; b=qskWxqtNogMxaG2R/q0EYmI8FQUC/HxWVGCM7n2e4k6r3b+UU4d0JnrCPoV/npRejcfwrk3Hl2YUebP8Q1iGAg0MoKpAgWlyLqTRi6CIVLKHvGPiBfoDzWmr5zMnSmwii7uqxjFBBLIUHeURXZV5mM6NsbyXRT0ZXW8g8ZPCD4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299623; c=relaxed/simple;
	bh=P1m0+sTWHkC72E4lMEa+YpX9d051+utwMYEb3wj5BLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOV/CYyYmGSPFibVC6ApZpIMOqSDRx/SZk1q7Ba59fAt4ccY172bmnTkyWTKN3yHQc6a12g7tM2+N/5Zs7ogE42n2Fqi1X1Z++z5QxmSSO2E9xnLENo9Zy5+UdZDOeBZCDE6duSPXs4cjqx6WVngLfwNgfu41t4YfPyH+y1Covs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gY5ja/xX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA548C4CEE7;
	Thu, 15 May 2025 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299621;
	bh=P1m0+sTWHkC72E4lMEa+YpX9d051+utwMYEb3wj5BLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gY5ja/xXRSOUSOsykU5WDfq0Rwv9FETxU+qGxCPJvIOqIi5P3xwjTiKZ6MmJ2+3tn
	 8yylaUdYb7S6589CGpUP+1NtDHutEY5Bpu6wsGKA1fhwP6BfjP/TMvKQjmN3YfxtgV
	 eQ0Th4ZaXd78cMidIspyBZxn7EuDehh8Q2Kd+7lqEOC/QalolUpIyV7lduNRU+VtDv
	 vxi8kAtYC8DAUZTJHGFnRvyMMTY9w+BzWfCv6odzFPAz2jnQqyAvIm2nnUrLxw7wsB
	 g8IlqX2LQg+rlsLTOnUoPEHxQ3zWL7E4OXgSzik5nc+VdpLngQMxA7Jp2m3PrKAZTM
	 7PIbCsOYexHIA==
Date: Thu, 15 May 2025 11:00:16 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 02/40] drm/gpuvm: Allow VAs to hold soft reference to
 BOs
Message-ID: <aCWtINcOUWciwx8L@pollux>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-3-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514175527.42488-3-robdclark@gmail.com>

On Wed, May 14, 2025 at 10:53:16AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Eases migration for drivers where VAs don't hold hard references to
> their associated BO, avoiding reference loops.
> 
> In particular, msm uses soft references to optimistically keep around
> mappings until the BO is distroyed.  Which obviously won't work if the
> VA (the mapping) is holding a reference to the BO.

Ick! This is all complicated enough. Allow drivers to bypass the proper
reference counting for GEM objects in the context of VM_BO structures seems like
an insane footgun.

I don't understand why MSM would need weak references here. Why does msm need
that, but nouveau, Xe, panthor, PowerVR do not?

