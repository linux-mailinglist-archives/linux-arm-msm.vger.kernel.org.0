Return-Path: <linux-arm-msm+bounces-59171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CBDAC1CF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 08:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00D5C17F542
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 06:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94697224AED;
	Fri, 23 May 2025 06:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuDxQ2Ov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFD32DCBF9;
	Fri, 23 May 2025 06:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747981737; cv=none; b=s8ww3F2U7licUSOoqpoZ8kOe6isikZSBD/kuahHvo3ZJLFpnAEj06rrU/I0ndj+XbdYgo9jGkMhMaXrhp5cVNfUI+lfN9dk8NY9ZsZZT2l4xVk+NzKJ3oeiaHn2FTqVTH3gc4nj6kC57ttrp8QGhjcBKDrPdktp6NlX2MGfXI94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747981737; c=relaxed/simple;
	bh=3tqexcS7D6IOEMJ2g2Hd2+uXohr3B3skFKzTrgnzjeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dg2VqlmiNozIW4W7a0BCaMZJQm3m6rAlnATxEB9NQs2HiTCjj/Vu9zhSxGCzuCjndiDuWN6NgLyOmB7Nj0Y9Y3N5tzwy0iNu/4/ByNyDg17ZX9ObJ3qQA2FPn+wz+QMRTW2j/jYNLyUwWoyKOQJTL7c8yR3/GqGdsCwc8NBc9RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuDxQ2Ov; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729BDC4CEE9;
	Fri, 23 May 2025 06:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747981736;
	bh=3tqexcS7D6IOEMJ2g2Hd2+uXohr3B3skFKzTrgnzjeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JuDxQ2Ov380+IKk6qsxkM74ACiMV8IlKBtx0HuJSsl0m/FGuyD/M4hzcydT7P6V9+
	 4owr+lKIgofUesPXNE7RYHCrTtao5YWPYw+nY9I3tSj/lX13yZ7qAN1gkCJqOByC2A
	 MMklTTusk0J9g2TejR+4CiZ/2zw8vUo0lPu6QqYu8zFf1cfqqvTMbyDcbxvMnF/j9Y
	 i5WBG4PCefDjDfjRzoFSHFRTM0xnY1nYFQ5omqybdO7pZJJKwipMEfj8tYhxzwjOEi
	 W4Nf4krPXbix0cvcCdF8o3SxrwoHOcdIU8pPbIzqv6SjWGuOb7cCEDoz6GK+lkWzZR
	 3TK0L8CAweDbA==
Date: Fri, 23 May 2025 08:28:51 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
Message-ID: <aDAVo-dle3wgFiJb@pollux>
References: <aCWueFzx2QzF7LVg@pollux>
 <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
 <aCYqlvp_T77LyuMa@pollux>
 <CAF6AEGsOTNedZhuBzipSQgNpG0SyVObaeq+g5U1hGUFfRYjw8w@mail.gmail.com>
 <aCb-72KH-NrzvGXy@pollux>
 <CAF6AEGu=KzCnkxuUsYvCHBGwo-e2W16u_cRT1NFAXLphty1_ig@mail.gmail.com>
 <CAPM=9tzcvDVDOM88O8oqDHURR1nbR7KsFStavNnT1CN6C6kGgg@mail.gmail.com>
 <CAF6AEGuv3GXTBcU99sBjAa5gPOSNoxwY+eiPy=Q--cLYHVn+cw@mail.gmail.com>
 <CAPM=9tykCXSKOH0BcMkNLKyCWfEN-kCjs0U7UA+C1pPqFr1jLA@mail.gmail.com>
 <CAF6AEGuK+X4Q=Z-anjQuUBi952eYSs3u9HxVz0GSQM8fokdiiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGuK+X4Q=Z-anjQuUBi952eYSs3u9HxVz0GSQM8fokdiiw@mail.gmail.com>

On Thu, May 22, 2025 at 07:51:50PM -0700, Rob Clark wrote:
> So if you _really_ don't like the WEAK_REF flag, I have a workable alternative
> that addresses the performance problems.

The mode you want to introduce is broken, and I don't understand why you don't
want to accept that.

  1. It obviously breaks some features, which is why you have to add lots of
     WARN_ON() calls to the corresponding code paths, such that drivers won't
     call into them any more.
  2. It requires conditionals based on kref_read(), which is oviously racy, and
     can cause UAF bugs.
  3. I'm sure, if we look closely, we'll find more subtle bugs, because GPUVM
     was designed with a clear ownership and lifetime model, that this mode
     undermines entirely.

The only reason why your MSM implementation does not run into trouble is because
it upholds certain contitions such that the racy kref_read() code does not cause
issues.

So, we would need to document all those extra requirements that drivers would
need to uphold using this mode, which eliminates more perfectly normal use
cases, that people expect to just work, one example for that would be to have
the same GEM object in multiple VMs.

This would be a huge mess and a mode full of footguns for drivers, and hence a
NACK from my side.

