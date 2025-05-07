Return-Path: <linux-arm-msm+bounces-57133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 713EFAADC5A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 12:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74B9D3BB758
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DE4823DE;
	Wed,  7 May 2025 10:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RLLizDM3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zugGHuED"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEF13398A;
	Wed,  7 May 2025 10:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613089; cv=none; b=fXyqXaj1PRJrn3pgM/7BVxma2rkFOm1jHMKxMoj8ryeKcEs+l1sc1nPyIAC+5ZbUqXQwFaEJJ82FhgulxCLsRKNrdIORo1gz7g0PGqG96sMKdUfeESKUQtZQSTE5KQpgz0g7n5uqaHF5po2yvmi4Iduo1X5Q+4YCFlVnQcACL2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613089; c=relaxed/simple;
	bh=k5uKaHsVJ4ci22JOZlaMw9EXNG61yiyGUNguImjx+z0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L0KzQ0wRuxfVqUa8PGPg7LJ5XlYGAVK0sdBpxNZFANyBBuYLs+lfbGj/Mb6aERyovS2ePTEe03R/YJPAIfwJfE3eZjFd+lau6ATleBsdZcKBDoUhq6bvY3EKJZZ47Esty6jYGQhdkP79umoW4ySUtpQ4QiF6+KSzR2Ix1kbVyU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RLLizDM3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zugGHuED; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746613085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s4pHk17GG+lwu3plctVKrw5RaE0D1NaJ+cJ6i3ORwCA=;
	b=RLLizDM3KF8Jx819fP5VjGo3uoH52hURXbWpFhkI0V4Qh9y53QTVLgovqHIvYb3cZTdGx/
	1ojhUiQeXfz/f3ZKhVBLDUwjCj1yi3K/TphcaBetoq8/4NWIBG1mEqoyvie+1XlINeJPBR
	MeZFvZvBkcuo15444k6ZUnJXAOhzkyULeIrf4/oXIUfxvDZTaW9pmwizmsWq7GoYCnM0Pz
	ogUUEjEmDjvNhBINMlAbR9sQ8QXy9qFpxVclkcAXLWmwXDLtnJtdgzIQ6xNTBJ4L9X1IfN
	TEzkonsssBSkxy13nYrVRdMA5IDqXTqyP8anuXNpdCXFssVDL+uF3WG06Y47RQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746613085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s4pHk17GG+lwu3plctVKrw5RaE0D1NaJ+cJ6i3ORwCA=;
	b=zugGHuEDilWoSa7bJfTmbMcaZCLV2sCx2E6bwjhn7goEfidQ1SvTDYTKvJx7QwSJLFeKsq
	mdE6mDHh+m2nB8Dg==
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
 rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
 konradybcio@kernel.org, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
 eugen.hristev@linaro.org
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
In-Reply-To: <20250422113156.575971-10-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-10-eugen.hristev@linaro.org>
Date: Wed, 07 May 2025 12:18:05 +0200
Message-ID: <87h61wn2qq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


$Subject: ... See

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes

On Tue, Apr 22 2025 at 14:31, Eugen Hristev wrote:
> Add function to register irq info into kmemdump.

What is irq info? Please explain explicitly which information is exposed
and why.

>  
> +void irq_kmemdump_register(void)
> +{
> +	kmemdump_register("irq", (void *)&nr_irqs, sizeof(nr_irqs));
> +}
> +EXPORT_SYMBOL_GPL(irq_kmemdump_register);

Are you going to slap a gazillion of those register a single variable
functions all over the place?

That's a really horrible idea.

The obvious way to deal with that is to annotate the variable:

static unsigned int nr_irqs = NR_IRQS;
KMEMDUMP_VAR(nr_irqs);

Let KMEMDUMP_VAR() store the size and the address of 'nr_irqs' in a
kmemdump specific section and then kmemdump can just walk that section
and dump stuff. No magic register functions and no extra storage
management for static/global variables.

No?

Thanks,

        tglx

