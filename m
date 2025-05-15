Return-Path: <linux-arm-msm+bounces-58113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E2BAB8DC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CC341BC54DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D0D2594AA;
	Thu, 15 May 2025 17:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzdUMlrW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BCA258CD8;
	Thu, 15 May 2025 17:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747330202; cv=none; b=k1klb7PeN3wp2moPogVirfbBigGGmG7QTASVOJjyVqLY6cIG587PLi0gnUMEHcOj9QvbLe3Ie3CwahY1PQMUO0IlIxThDysjJo4nfi8nJbhwKD2l8vv8Ky6eYT1RHAVZTeFMK9KQ1JK0YvaEl8qRMuZ6fyrUuQsLkc3UeeDYwMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747330202; c=relaxed/simple;
	bh=Hke/yO7FqtLJ+q550xCAf3LK2tczfK5NfvanpWrVDEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atItuC+kwLfax75/lNkIODDt/7ko0KHaqI4+m/sm86kzbAs91WqjSoB/37QGke08Yg+AfKUmrLk/MZaP2P6LlpWtjKMKWfTwgFhVoLRVkqJr60sGiNhk5slRDZUKhwxJAXtEGs+Zq5WqPMA9jJybfLEHOzQTZe6nKVA6aSyCwBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzdUMlrW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E8EC4CEE7;
	Thu, 15 May 2025 17:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747330201;
	bh=Hke/yO7FqtLJ+q550xCAf3LK2tczfK5NfvanpWrVDEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzdUMlrWQQDdNKXyR4zvX+NJwwG/gFkAVpsWJp/MLgoafxNERKr6JdVink1pMfbmF
	 a57ODNtc2ODCxr4TVkOjCSsFApX4b4kDffVvqrsiUox3tWNSe98pvKSiWR5Bpesqtv
	 k0WQGbuCN4wudkR7DwOtCeTt4cqn7H4B5/4tQ67d4l4P1+OJ3w9giBB423Sagm1wiE
	 Mz62LWU1RSkB6Cr/qQjTfdXjKJe/j0Zx4hMgk6M9V/Y2wbac8tWk9pC3hWFY0vZsDc
	 4xzLUcm+FbwL9RCoe11V5SiJBbr1hY+I9WOwPISgVeL+jOSxYeYKZ8DmwIiMC3PjKT
	 KjNFQREF2Iddw==
Date: Thu, 15 May 2025 19:29:55 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, phasta@kernel.org,
	Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
Message-ID: <aCYkk4Y7feltfp79@pollux>
References: <20250514170118.40555-1-robdclark@gmail.com>
 <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>

(Cc: Boris)

On Thu, May 15, 2025 at 12:22:18PM -0400, Connor Abbott wrote:
> For some context, other drivers have the concept of a "synchronous"
> VM_BIND ioctl which completes immediately, and drivers implement it by
> waiting for the whole thing to finish before returning.

Nouveau implements sync by issuing a normal async VM_BIND and subsequently
waits for the out-fence synchronously.

> But this
> doesn't work for native context, where everything has to be
> asynchronous, so we're trying a new approach where we instead submit
> an asynchronous bind for "normal" (non-sparse/driver internal)
> allocations and only attach its out-fence to the in-fence of
> subsequent submits to other queues.

This is what nouveau does and I think other drivers like Xe and panthor do this
as well.

> Once you do this then you need a
> limit like this to prevent memory usage from pending page table
> updates from getting out of control. Other drivers haven't needed this
> yet, but they will when they get native context support.

What are the cases where you did run into this, i.e. which application in
userspace hit this? Was it the CTS, some game, something else?

