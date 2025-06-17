Return-Path: <linux-arm-msm+bounces-61548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9709ADC517
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 10:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC4DB1881965
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 08:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D79C28FA93;
	Tue, 17 Jun 2025 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IbNiTkPo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qEiPmGt/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C0D21CC74;
	Tue, 17 Jun 2025 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750149223; cv=none; b=sBs+tvOz0yRqlCCWd/7JIvNxJeTmP1fYI/SLAfTGIBqEo84F3P/LsLVEU0dh1oDrp+nZn1gGNcm/9C1s0ge6jsOtACH5FNPdOc30zom70lsraDDVeU6WBoGJV3lMqSi0WB1fGGVCaQe2S2pq3+EJTh0s0fjQQNJQNbCazaVGb1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750149223; c=relaxed/simple;
	bh=Ja2iMSBc43pbgZ6pp2G6gvZZT6gzTqyX/7QnwMCdDjw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hECdGkClO3zMWh6h57AflLx9rQS/+ROcpz6VvS8jb5VyT1APFiVjrLyZ2TQjSLdxi525THk9zUJ/5/Q8VJsyLKjIJHCqZ0uR/lHgDHmt+OOyYKLjMZ06dauY6FN2d90bgj1Wm1q7lpBrXu8KvT38jBP5pFRtRG8VoF7e/eLLsb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IbNiTkPo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qEiPmGt/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750149219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fM8Ztj0WNgxkUzsl19NDzLnsVejYkQJiIVQdlZc8OI0=;
	b=IbNiTkPof//hfDswjM3UX2HjcxjB219ulL79IxtMk2Surwa52FLITsHiIGdSPG8S8Gsk9B
	vLw+Vy56yeJQZ2CRRB/RCm+QbFGa3zainhEqBBiPrTezwUW3PHMjhAdifdGI2+S1EZyaXs
	8RSy32gZJtQCmeCgaqJnX8iRp9S4wTShk0L70h6ba11fJXoKf8M0MUPAGOpUg7J2D2lnU/
	lC+VF+rl8YCFZHsFyIZXXvlQc4UATj/1l5oe0wSu54ytgsn/7R3Ycz/Pi8RO8uVjHJjojk
	UeQ0zueK4/eI86dw8200fEYtRWMlrscr6O/yh+PSBJbzmEPHMOiIqOaRKo5P5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750149219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fM8Ztj0WNgxkUzsl19NDzLnsVejYkQJiIVQdlZc8OI0=;
	b=qEiPmGt/KG74R8s1cTauPdSKufrbj0ktaax/krGPrsd9BNNZSi6RX15w3NkLphktH5Tr+T
	5QwafYnTNKQcifCg==
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
 rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
 konradybcio@kernel.org, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
 andersson@kernel.org
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
In-Reply-To: <6a493968-744a-4fa2-803c-3f64a8e7225e@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-10-eugen.hristev@linaro.org> <87h61wn2qq.ffs@tglx>
 <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
 <f916cf7f-6d0d-4d31-8e4b-24fc7da13f4d@linaro.org> <87ikkzpcup.ffs@tglx>
 <6a493968-744a-4fa2-803c-3f64a8e7225e@linaro.org>
Date: Tue, 17 Jun 2025 10:33:38 +0200
Message-ID: <87jz5aojh9.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 16 2025 at 13:12, Eugen Hristev wrote:
> On 6/14/25 00:10, Thomas Gleixner wrote:
> #define KMEMDUMP_VAR(sym) \
> 	 static struct entry __UNIQUE_ID(kmemdump_entry_##sym) ...
>
> is when calling it with e.g. `init_mm.pgd` which will make the `.`
> inside the name and that can't happen.
> So I have to figure a way to remove unwanted chars or pass a name to the
> macro.

You can do:

KMEMDUMP_VAR_MEMBER(init_mm, pgd);

and concatenate with a '.' for the symbol
and a '_' for the ID.

or simply

KMEMDUMP_VAR_ID(init_mm.pgg, INIT_MM_PGD);

>> #define kmemdump_alloc(var, id, fn, ...)				\
>> 	({								\
>>         	void *__p = fn(##__VA_ARGS__);				\
>> 									\
>>                 if (__p)						\
>>                 	kmemdump_register(__p, sizeof(*var), id);	\
>> 		__p;
>>         })
>> 
>
> I was thinking into a new variant of kmalloc, like e.g. kdmalloc() which
> would be a wrapper over kmalloc and also register the region into
> kmemdump like you are suggesting.
> It would be like a `dumpable` kmalloc'ed memory.
> And it could take an optional ID , if missing, it could generate one.
>
> However this would mean yet another k*malloc friend, and it would
> default to usual kmalloc if CONFIG_KMEMDUMP=n .
> I am unsure whether this would be welcome by the community

That's definitely more welcome than copying boilerplate code all over
the place. And if you do it the way I suggested, then you only have
_one_ macro for alloc and _one_ for free because you hand in the
allocation function with all of its arguments instead of creating an
ever increasing zoo of dedicated variants. But the MM people might have
different opinions.

Thanks,

        tglx



