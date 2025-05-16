Return-Path: <linux-arm-msm+bounces-58186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6D3AB9845
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 610291B62E16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 09:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C20223DCA;
	Fri, 16 May 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liq2ix2d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2D51624DD;
	Fri, 16 May 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386101; cv=none; b=Jo/X3wqWgrypW1zPw12nZKYc9/nLRVc9n4+RPSl8ysfNCCqavp+Q2V6umXQDG76hIiRiz0ra8Wwat8ITrvtyWhjg2F7m6yJGKmUQQL5OBZwx6jNnFPdtOL4Xlx7scsUiWReTzO4pfJG/S93bx4907swykLNnmPfqE/AGJnYrBOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386101; c=relaxed/simple;
	bh=rRJdyNOXAmuDrBUcTUaJ4uRJj/d1LuL19Qz9yJugxfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gu9VSWZ2g1DuTex+baG5JLE4c3vahJMLgc9VXNRin8ZsJWY7Y8IOXc8N3nfA8rDoTW+N6IQxKtw/mJQIVkaYDtWsWF3cnz1sYMZx9Ki09zRwe0dGmqHtj8/Pl1owQ6rPblLqTT0BJUVmnsOxkowJU8qB7hTcRw4qsFe3w7aOZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liq2ix2d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A48C4CEE4;
	Fri, 16 May 2025 09:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747386101;
	bh=rRJdyNOXAmuDrBUcTUaJ4uRJj/d1LuL19Qz9yJugxfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=liq2ix2dRUN5sj+My6TL4e/gnjWXAbrbxMGtVvZ1tFTdWe936gXeqZdyZUGm5pQhn
	 CLBxBeqUS3iwGH5duvrCstX6KhOE7z5MKMKyvcKs5rtRzpfUHSFz/GunCBCZ6aYhM9
	 JlhYz93+llD8p75cErYv2bQ2jkeQz8KMQH0O0QaII7qk9KbGKo6f3FA7djsoYwDkZk
	 JZa5NsUNiCuAAtxPS4yN0eHlbElTii4P4EFlIyb7mJNePxtWWc/lR3WYcY0bjCkAGL
	 XlsFHk4BKK3W6cFg7mql4ac3zwq42m7u5Unfm1NLdYvVDemHLkBr9bHjZuYSo/zU6U
	 R0gjSQC55ZZdw==
Date: Fri, 16 May 2025 11:01:35 +0200
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
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
Message-ID: <aCb-72KH-NrzvGXy@pollux>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux>
 <aCWueFzx2QzF7LVg@pollux>
 <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
 <aCYqlvp_T77LyuMa@pollux>
 <CAF6AEGsOTNedZhuBzipSQgNpG0SyVObaeq+g5U1hGUFfRYjw8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsOTNedZhuBzipSQgNpG0SyVObaeq+g5U1hGUFfRYjw8w@mail.gmail.com>

On Thu, May 15, 2025 at 02:57:46PM -0700, Rob Clark wrote:
> On Thu, May 15, 2025 at 10:55 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > Anyways, I don't agree with that. Even if you can tweak your driver to not run
> > into trouble with this, we can't introduce a mode that violates GOUVM's internal
> > lifetimes and subsequently fix it up with WARN_ON() or BUG_ON().
> >
> > I still don't see a real technical reason why msm can't be reworked to follow
> > those lifetime rules.
> 
> The basic issue is that (a) it would be really awkward to have two
> side-by-side VM/VMA management/tracking systems.  But in legacy mode,
> we have the opposite direction of reference holding.  (But at the same
> time, don't need/use most of the features of gpuvm.)

Ok, let's try to move this forward; I see three options (in order of descending
preference):

  1) Rework the legacy code to properly work with GPUVM.
  2) Don't use GPUVM for the legacy mode.
  .
  .
  .
  3) Get an ACK from Dave / Sima to implement those workarounds for MSM in
     GPUVM.

If you go for 3), the code introduced by those two patches should be guarded
with a flag that makes it very clear that this is a workaround specifically
for MSM legacy mode and does not give any guarantees in terms of correctness
regarding lifetimes etc., e.g. DRM_GPUVM_MSM_LEGACY_QUIRK.

- Danilo

