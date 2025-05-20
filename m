Return-Path: <linux-arm-msm+bounces-58746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AF2ABE09E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 18:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6581517889C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D356252287;
	Tue, 20 May 2025 16:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gS9PU2qF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046221B6CE3;
	Tue, 20 May 2025 16:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747758128; cv=none; b=t7ACKP408ulTYaE7DAPZnrXKu+vMWPMcHLf75MuQ13CSeB7EV3C7V3ttvxgR9/Evv8IK1+/kVgl3fDvLYLLUEd9L8Smg2nZ7wBSfGFYmF2waJV8qUrV1S/FlhhSyE+MM2oSlWX7LMrcOJah7fef5ebrQJ9l3dNQnJ6KUVpU7Ikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747758128; c=relaxed/simple;
	bh=PwfREHNjD08LoQHQb+2a+oNlUMWRFVPe7Pshx9/+Sd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPSWB7r1U+jV+NYb/MDxuk4tDQ5g/nxvMGEt4tLvUac3ucCIHSg+8d+8gcDOaYr11TOB9XLqhKdeSU9wj2ZuprArNg7/3fPQF4I6I8NX8/O4FDw+9TZlOpQKbK78RrVpGNq/E/sPpCYheHEJPauBCP+kEOrkDAI595slLJr/6gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gS9PU2qF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E5CC4CEE9;
	Tue, 20 May 2025 16:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747758127;
	bh=PwfREHNjD08LoQHQb+2a+oNlUMWRFVPe7Pshx9/+Sd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gS9PU2qFMkHTyXBWHGpMjGBqnmICcI/5UxWYCsftTsMxQJZSbXiHsnyZTkAsmvodx
	 PDnqBphspLZrY1SqdwpDyUyTKeQR1TO/3tFW9tvS2+lG4vQY0Ov7pSCuVolxAVrTPi
	 mi/07FRg6VDuihqB85ocMl3Uo+09+GJd7NNeMFvd3SfFIx3riM4iSyXPAZEoYDUmgt
	 91SteDzb6V0ab6zijrraG+XA0Z01RAbS1eb7rEFFkPKUxmd2dNrqFvul0liYWaKYNl
	 gU5oNX85u7X/IJ9zNNjfeNGI8Igl1eqicTPUnEDc6w6bsZ53DLqQFCMNVM9KWzA8e5
	 mDoNeqPHaWbdA==
Date: Tue, 20 May 2025 18:22:02 +0200
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
Subject: Re: [PATCH v5 02/40] drm/gpuvm: Allow VAs to hold soft reference to
 BOs
Message-ID: <aCysKgGyq5eOXW87@cassiopeiae>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175348.11924-3-robdclark@gmail.com>
 <aCwx_9KIc9QBd7_0@pollux>
 <CAF6AEGs6_ZgBpKwe7weZWUppCZ87Y6wOt9RsF68hsJO-VpeiJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGs6_ZgBpKwe7weZWUppCZ87Y6wOt9RsF68hsJO-VpeiJA@mail.gmail.com>

On Tue, May 20, 2025 at 08:54:53AM -0700, Rob Clark wrote:
> On Tue, May 20, 2025 at 12:40 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > On Mon, May 19, 2025 at 10:51:25AM -0700, Rob Clark wrote:
> > It invalidates the whole design and makes a lot of functions fundamentally
> > invalid to call, which is well demonstrated by all the WARN_ON() calls this
> > patch attempts to add.
> 
> I think of it more as adding a different mode of operation.  One
> where, perhaps some functions of gpuvm are not available, but that is
> fine because they are also unneeded in that mode of operation.  Hence
> the WARN_ON()s to make that clear.

This isn't a different mode of operation. You're breaking the design and
internal guarantees and validity the code relies on. And as a consequence you
have to disable the functions that are obviously broken by scattering it with
WARN_ON() calls.

And for the remaining code that is not disabled we'd have entirely new
requirements on the guarantees the caller must provide in terms of reference
counts.

This is as if I'd try to promote a car with a broken engine control unit and
would tell you "It's just in a different mode of operation, where driving isn't
supported, but you can still heat the cabin and power the radio with the
engine.", hoping that the broken engine control unit has no other side effects.

Sorry, as much as I'd like to help and unblock you, I don't buy it.

