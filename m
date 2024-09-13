Return-Path: <linux-arm-msm+bounces-31775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 861DF9788F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 21:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0780B25E1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 19:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D4B1448DF;
	Fri, 13 Sep 2024 19:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yednq30N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E86413AD03;
	Fri, 13 Sep 2024 19:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726255947; cv=none; b=UlTThsAOpEmr7eASh0WfP0ZOPgTj/uga48V6CKHhzv+7NsRAB2cTG4jafqmF9H7RU/WkrwvavP1AudHSI5ha39kR4oaqwvttgymE3EjjasiZld2k+TZdmWgwFF8LLe3dUIz4UIjCJYgF66HdKRhljAiXjj0/WumjYKifLEYHpFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726255947; c=relaxed/simple;
	bh=CAh7OJCKr+ZZWcKaCK8a8dneJu3h6r5pEUsUumEe//Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b6LMG1qL8zNafOZYNbmu7ivrByDMLMJSQhzCQnfybXGz7GProZWxhjqjclNI5i2NSm6Put1ZV1XTmkWNa2j/UgDoNdpcPJe8Zc8s7yyT3gcSPd4TzbrPgo/gk5phtAVUTOvPeaUVO5bjRqYiEVQVBA7177s/SdhQ/Kyno+5+fxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yednq30N; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E834F60002;
	Fri, 13 Sep 2024 19:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726255942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x2of1BdHGwZAspl/pHlPclrXtKEUjMefV4+slP9HEaE=;
	b=Yednq30NTIRFFSqwaFEEiemih/JhA8Y5QpUO/NJaO7jdAS8ykd/LaJYepppl1vRMGh5Bu3
	5KglUphzYAwMjRSJQoH+XEV6DIJ2Da+phyzUur5iMSwAYes2nj4VNsfsMmjF8Gl/HckJml
	4DXajWu5uj5Q7VU9IkbYsigpcGBPxafH4Ds/RMHYuP0RYYsSNIaZntl4TYBgI+QTxfiN+I
	jZGeTI4aD/dxORLSNAD0gP+9GaYgpk3yNBMWY+Ape+coSlLrilqrzBP3ZsyKCKyxqPIQKD
	0KV3dJBNVEk8f5rUcpOiAGgZVV6iQLNL1fBSq4uuHfNd/Glll+yAyNdQEze0TA==
Date: Fri, 13 Sep 2024 21:32:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 patches@lists.linux.dev, linux-arm-msm@vger.kernel.org, Douglas Anderson
 <dianders@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Taniya Das <quic_tdas@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/5] Fix a deadlock with clk_pm_runtime_get()
Message-ID: <20240913213219.2d5efa2c@xps-13>
In-Reply-To: <20240325054403.592298-1-sboyd@kernel.org>
References: <20240325054403.592298-1-sboyd@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Stephen,

I only discover this thread today, interesting read!

sboyd@kernel.org wrote on Sun, 24 Mar 2024 22:43:57 -0700:

> This patch series fixes a deadlock reported[1] on ChromeOS devices
> (Qualcomm sc7180 Trogdor). To get there, we allow __clk_release() to run

Not only ChromeOS devices are affected, there have been several reports
with similar issues on the mailing list, especially on i.MX8MP, where
the clock and power management domains are tightly connected.

> without the prepare_lock held. Then we add runtime PM enabled clk_core
> structs to a list that we iterate and enable runtime PM for each entry
> before grabbing the prepare_lock to walk the clk tree. The details are
> in patch #4.

I am happy we ended-up leaning to the same solution: runtime PM calls
should no longer happen after acquiring the prepare lock.

> The patch after that is based on the analysis in the disable unused
> patch. We similarly resume devices from runtime suspend when walking the
> clk tree for the debugfs clk_summary.
>=20
> Unfortunately this doesn't fix all problems with the usage of runtime PM
> in the clk framework. We still have a problem if preparing a clk happens
> in parallel to the device providing that clk runtime resuming or
> suspending. In that case, the task will go to sleep waiting for the
> runtime PM state to change, and we'll deadlock. This is primarily a
> problem with the global prepare_lock. I suspect we'll be able to fix
> this by implementing per-clk locking, because then we will be able to
> split up the big prepare_lock into smaller locks that don't deadlock on
> some device runtime PM transitions.

I fear splitting the locks will actually not solve the problems we
encounter on i.MX8.

Let me quote some parts of your commit log in patch 4/5:

---8<---
> This is a classic ABBA deadlock. To properly fix the deadlock, we
> must never runtime PM resume or suspend a device with the clk
> prepare_lock held. Actually doing that is near impossible today
> because the global prepare_lock would have to be dropped in the
> middle of the tree, the device runtime PM resumed/suspended, and then
> the prepare_lock grabbed again to ensure consistency of the clk tree
> topology. If anything changes with the clk tree in the meantime,
> we've lost and will need to start the operation all over again.
>
> Luckily, most of the time we're simply incrementing or decrementing
> the runtime PM count on an active device, so we don't have the chance
> to schedule away with the prepare_lock held. Let's fix this immediate
> problem that can be triggered more easily by simply booting on
> Qualcomm sc7180.
--->8---

Regarding your former statement, I don't think it is impossible, this
is what I've been trying to do recently. It is really impacting, and
must be handled specifically for each situation: I am counting three of
them depending on the action, where either the parents, or the
children or both sides of the tree should be resumed before
continuing (with optionally the new parent, when reparenting explicitly
or doing some rate changes which also involve reparenting). I don't yet
have a working proof-of-concept -I would have loved to before LPC- but
this is promising and I believe doable.

About your second paragraph however, I am asking whether being "most of
the time" incrementing or decrementing the runtime PM count is
acceptable, because if we ever perform a real state change within the
right conditions, we will just deadlock the platform. This is
theoretical and is unlikely to happen in general, I agree. But shall we
consider this situation too unlikely from happening for just ignoring
it? Shall we instead fix it properly and prepare ourselves for future
power-optimized architecture with a lot of dependencies between clocks
and other power-related subsystems? This is an open question.

> I'll start working on that problem in earnest now because I'm worried
> we're going to run into that problem very soon.

Is there any public branch I could look into?

On my side I tried to warn about this but got no feedback. I'd have
loved to be pointed towards this patchset at that time :) Here is the
report if you want to check it out. FYI, I was asking for feedback on
very specific questions, which I consider now solved:
https://lore.kernel.org/all/20240527181928.4fc6b5f0@xps-13/

> Stephen Boyd (5):
>   clk: Remove prepare_lock hold assertion in __clk_release()
>   clk: Don't hold prepare_lock when calling kref_put()
>   clk: Initialize struct clk_core kref earlier
>   clk: Get runtime PM before walking tree during disable_unused
>   clk: Get runtime PM before walking tree for clk_summary
>=20
>  drivers/clk/clk.c | 142 +++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 115 insertions(+), 27 deletions(-)
>=20
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
>=20
> [1] https://lore.kernel.org/all/20220922084322.RFC.2.I375b6b9e0a0a5348962=
f004beb3dafee6a12dfbb@changeid/
>=20
> base-commit: e8f897f4afef0031fe618a8e94127a0934896aba

Thanks,
Miqu=C3=A8l

