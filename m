Return-Path: <linux-arm-msm+bounces-73804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E59B5A3BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 23:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 236B018982A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 21:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18115283FC2;
	Tue, 16 Sep 2025 21:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V22XGrXJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CqWJ884f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAAB31BC9F;
	Tue, 16 Sep 2025 21:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758057398; cv=none; b=XNaaZWWpC00iAH1eHtBeWn71jGK5FpJGIBbLM+/ldg4ZyhdGLYMUUQrrB+65xj/mCmjBg5Z9wCsthp3WOZBtNjmUZ/RoYxXtHicdqA5q8flf81uzZoVC3zrPyq086wun+hVgAKan13g2xmJ0nZReR2cnO9VjqMCnG1csXkHeSPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758057398; c=relaxed/simple;
	bh=DTBneYKEQ1LXUX1rMxvyffo49ndM+WKAW2jsCAZP/J0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XqKXNIn73Mh+IHmOl8F5Msj2uYjpkLTkkM2D8i9tcGe+LgFq7WwMENCEk4YK8IAL8SHqWpXX92Uk5mibugpRZV0l2c1J6yR1o2nF09Yj+p99s2PNUvHhpK48Uaj9JLLkyWMoNv/PdZEgZUFTrqMXnTfykfmO+PdRm2fAU5ouiSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V22XGrXJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CqWJ884f; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758057395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cdBjosARmBSEo7aiSHM+dIdoMHfCZY2WlWe0Fb0A5eI=;
	b=V22XGrXJlCZ5AQ9pe37LMtlOlaa5uG8osxrLsqv/+DC/Jbi/gaOpvLPA0WMtTQxFy0AUdp
	ocZJsSczCxILdgsmO4GMKTUFDP0xpwY6AtIXURDTCI7YBHO2vUnZPIuwtJw2bNKQ43jRR/
	SrnGkYVy74kqALkz23Q9mSMTMN61R3tuGvD3/VSh+ybJMd55BYszvtovTcZU3B8sWL/oxK
	m7Yx3U3wdB0a8EHseRTc6f9n1GflXL/nu61iIYkP98BgbC6HF97j1UXSi1XiE2URbMvERJ
	DzKL9myXEOmPWxsz4yNEbIW3+Ka6Elq8rzhi9TN1pUtrkyuBilYL6aLIOL/JOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758057395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cdBjosARmBSEo7aiSHM+dIdoMHfCZY2WlWe0Fb0A5eI=;
	b=CqWJ884fvJ8/FWHJRwkFwD617d0BLRtMBNrP3oVIvDrTlG1B/A3pQgDgnF+3bJQdmfDYNc
	0I7SSpqMR6U7YOCg==
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
In-Reply-To: <87cy7q9k8y.ffs@tglx>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
Date: Tue, 16 Sep 2025 23:16:34 +0200
Message-ID: <87a52u9jyl.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 16 2025 at 23:10, Thomas Gleixner wrote:
> On Fri, Sep 12 2025 at 18:08, Eugen Hristev wrote:
>> nr_irqs is required for debugging the kernel, and needs to be
>> accessible for kmemdump into vmcoreinfo.
>
> That's a patently bad idea.
>
> Care to grep how many instances of 'nr_irqs' variables are in the
> kernel?
>
> That name is way too generic to be made global.

Aside of that there is _ZERO_ justification to expose variables globaly,
which have been made file local with a lot of effort in the past.

I pointed you to a solution for that and just because David does not
like it means that it's acceptable to fiddle in subsystems and expose
their carefully localized variables.

Thanks

        tglx

