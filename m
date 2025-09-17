Return-Path: <linux-arm-msm+bounces-73945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 043BCB7FE95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D791624C1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BA92E974E;
	Wed, 17 Sep 2025 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZKpSI+WP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TbymsR0+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2664296BDE;
	Wed, 17 Sep 2025 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758118212; cv=none; b=EkyqG5oF6dziFrcRncYRELKtaOkFwowLbeaWswwoK3RODzDQHPfVtKxVbEA28Atg5Pc6RqadNLjk/U/rKbYw33JYuImLYUxXcRB+8cEay1yy5tGEmeI3yIS866nA1TwXhRbsAJsnGiwDGjQZEVFW9qytCA9PZiKcA24QTA/lS4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758118212; c=relaxed/simple;
	bh=OsPdev5btX3JT4/2C8Z8laOOG2vZwe7o17n1YeULHOM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g5+rvo3BWECpBk2uJyogW3RAj0x5L6H/tEs07XaXrzHxnwNY3iFd+gmVkPO7UX+fIN6tzLhr+lverINRVgIqfiOdK8iYzo7giqsEjhfHaVP7lpKAA1DQUk8eD1bxughaGhfF5QfRLJ1mbqmGu2rM5NF7HrSrmEV8Kz3H2XFRxEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZKpSI+WP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TbymsR0+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758118208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=75mN+9VZdw4CLEq0UoX/nuXZgFL03Q5pomSFYWw9c2o=;
	b=ZKpSI+WPydnrumYQ7gxnajAs+lz48YaqiNN3+WhYNwWXlUic0xCBsG6f6GfE8taQbHcIgJ
	h7Kh1tpSx++CpIjdk2mOz5C8qrezCvij4Bk8iMJhmpa16eSQBcomARzZeXmkJinMK6glwU
	/UoCFWaheNWZeinES9gkwAgNZHQGwrhZjReOwblCiBhi00hbE5NYnMlrnONnM1S91JYtLJ
	5CckReOcFW3rJ1+heNZD7lLCRl+2mHJx7WPMA6JZ7bGl0gGxnrhAb0Qs6EzKVgYT+Ot1sw
	h1UyJfZDjAyn+2j60JTop8cvG2RTrlkVsVVpCCok6p2oOoIhbLO/tvfT4Jfbiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758118208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=75mN+9VZdw4CLEq0UoX/nuXZgFL03Q5pomSFYWw9c2o=;
	b=TbymsR0+lk/yBTMUwla0JPYo6VaReyftRSNu6ml7UoTThH0F5HVkZGBsfwFUiwKRK5kBjM
	+sfN3Y9Q7FzbGVAw==
To: David Hildenbrand <david@redhat.com>, Eugen Hristev
 <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
In-Reply-To: <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
 <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com>
Date: Wed, 17 Sep 2025 16:10:07 +0200
Message-ID: <87v7lh891c.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 17 2025 at 09:16, David Hildenbrand wrote:
> On 17.09.25 07:43, Eugen Hristev wrote:
>> On 9/17/25 00:16, Thomas Gleixner wrote:
>>> I pointed you to a solution for that and just because David does not
>>> like it means that it's acceptable to fiddle in subsystems and expose
>>> their carefully localized variables.
>
> It would have been great if we could have had that discussion in the 
> previous thread.

Sorry. I was busy with other stuff and did not pay attention to that
discussion.

> Some other subsystem wants to have access to this information. I agree 
> that exposing these variables as r/w globally is not ideal.

It's a nono in this case. We had bugs (long ago) where people fiddled
with this stuff (I assume accidentally for my mental sanity sake) and
caused really nasty to debug issues. C is a horrible language to
encapsulate stuff properly as we all know.

> I raised the alternative of exposing areas or other information through 
> simple helper functions that kmemdump can just use to compose whatever 
> it needs to compose.
>
> Do we really need that .section thingy?

The section thing is simple and straight forward as it just puts the
annotated stuff into the section along with size and id and I definitely
find that more palatable, than sprinkling random functions all over the
place to register stuff.

Sure, you can achieve the same thing with an accessor function. In case
of nr_irqs there is already one: irq_get_nr_irqs(), but for places which
do not expose the information already for real functional reasons adding
such helpers just for this coredump muck is really worse than having a
clearly descriptive and obvious annotation which results in the section
build.

The charm of sections is that they don't neither extra code nor stubs or
ifdeffery when a certain subsystem is disabled and therefore no
information available.

I'm not insisting on sections, but having a table of 2k instead of
hundred functions, stubs and whatever is definitely a win to me.

Thanks,

        tglx

