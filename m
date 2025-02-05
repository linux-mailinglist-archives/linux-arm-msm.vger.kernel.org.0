Return-Path: <linux-arm-msm+bounces-46986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A45A29C91
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 23:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2F0F3A4734
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 22:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFDB215798;
	Wed,  5 Feb 2025 22:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="gOiTxQ+J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F38D207A18;
	Wed,  5 Feb 2025 22:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794222; cv=none; b=QYzzFBqQgMBUoOtAXs6eQ4ZMRxuT36qw82Ds/6JfqMU9Rw+1iUQLaExFEmZFRaKmftWlpcCO5mfYeTzidWgvrUFh8kGBNvawMf/FUf1ScBeEi7S2FRLLOhRKekfIytmKgEC7WbC6UI/0ZJ9VHuupYHOnu/o+xnwMfRKb9WaCd5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794222; c=relaxed/simple;
	bh=z6eD1FP///AwBHcopqgetq8mUPl1qy7sZPeZfpBTrHo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KUu7A/W77DMC3EzSqZkCX6yn5Cm2WZktZFGjA1qAx7bsOopW4VRYOUpflMlp3CpKLjUCelWJGoIUqg7UxcCWTbuCHLx1yFGvxDZspDyrX05Yi8Zw078eFoSEtP30xc/h9LuUqL5w0LM30cuvvoEvpLDmOzJBKaFKFlXhVI/Bqws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev; spf=pass smtp.mailfrom=oltmanns.dev; dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b=gOiTxQ+J; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oltmanns.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4YpFBJ2WGkz9sdr;
	Wed,  5 Feb 2025 23:23:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1738794216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3A8gIWsEr9yJWnJxL6/MIgQmtdybjtwSXxHXk23OHxc=;
	b=gOiTxQ+JTd3yBcrxaeqqNlL8wZPKmTjD0ErC8yTAtJFh0MGwxBdGqyAPeaRV5JsbRdpr4C
	nrcy8XpEEbaJkbx+stTfxLi0F4JLhX5wtkSn5G6kTFmEu0P3tPu944l29uIg9H74Fo0fRm
	R1qnA1HDUK2vlu8gd+Ej9o9H4nmsoZ14tetw/3WoiLnqPh/fvddhRTmHW/9t3ZlyS0KR6e
	POZjzclH7hzkKKPggUhsCT8ItwlnIPxYhjMsDpchvOoeAvN3JdhElJaot8BbP3hnQObOYl
	6C/h/r5g49hO9f03xyYpjsTAr1yDHg9sos/YthUo2t1LoCEBNWYQMYq8XfT2fQ==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,  Chris Lew
 <quic_clew@quicinc.com>,  Stephan Gerhold <stephan.gerhold@linaro.org>,
  Johan Hovold <johan+linaro@kernel.org>,  Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,  Konrad Dybcio <konradybcio@kernel.org>,
  Abel Vesa <abel.vesa@linaro.org>,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org,  regressions@lists.linux.dev,
  stable@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>, Joel
 Selvaraj <joelselvaraj.oss@gmail.com>, Alexey Minnekhanov
 <alexeymin@postmarketos.org>
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
In-Reply-To: <Z4TXww5rAkMR8OmM@hovoldconsulting.com> (Johan Hovold's message
	of "Mon, 13 Jan 2025 10:07:15 +0100")
References: <20241010074246.15725-1-johan+linaro@kernel.org>
	<Zwj3jDhc9fRoCCn6@linaro.org> <87wmf7ahc3.fsf@oltmanns.dev>
	<Z3z7sHn6yrUvsc6Y@hovoldconsulting.com>
	<Z36Gag6XhOrsIXqK@hovoldconsulting.com> <87wmf18m8g.fsf@oltmanns.dev>
	<Z4TXww5rAkMR8OmM@hovoldconsulting.com>
Date: Wed, 05 Feb 2025 23:23:22 +0100
Message-ID: <874j182fqd.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4YpFBJ2WGkz9sdr

On 2025-01-13 at 10:07:15 +0100, Johan Hovold <johan@kernel.org> wrote:
> On Sat, Jan 11, 2025 at 03:21:35PM +0100, Frank Oltmanns wrote:
>> On 2025-01-08 at 15:06:34 +0100, Johan Hovold <johan@kernel.org> wrote:
>
>> > And today I also hit this on the sc8280xp CRD reference design, so as
>> > expected, there is nothing SoC specific about the audio service
>> > regression either:
>> >
>> > [   11.235564] PDR: avs/audio get domain list txn wait failed: -110
>> > [   11.241976] PDR: service lookup for avs/audio failed: -110
>> >
>> > even if it may be masked by random changes in timing.
>> >
>> > These means it affects also machines like the X13s which already have
>> > audio enabled.
>>
>> I've blocklisted the in-kernel pd-mapper module for now and have
>> switched back to the userspace pd-mapper.
>>
>> I don't know if it's helpful or not, but I don't get these error logs
>> when using to the in-kernel pd-mapper. It's just that the phone's mic
>> only works on approximately every third boot (unless I defer loading the
>> module).
>
> Ok, then it sounds like you're hitting a separate bug that is also
> triggered by the changed timings with the in-kernel pd-mapper.

I worked on finding out what's causing the issue on sdm845 and I've
submitted a patch here: [1]

> Are there any hints in the logs about what goes wrong in your setup?

Unfortunately not, see [1].

> And
> the speakers are still working, it's just affecting the mic?

Yes, it's only affecting the mic in my setup on xiaomi-beryllium, but
there seem to be issues with the speaker on oneplus-enchilada that can
be fixed with the same approach.

Best regards,
  Frank

[1]: https://lore.kernel.org/all/20250205-qcom_pdm_defer-v1-1-a2e9a39ea9b9@oltmanns.dev/

>
> Johan

