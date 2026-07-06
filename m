Return-Path: <linux-arm-msm+bounces-116887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bmfCBUnBS2ruZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:52:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A70D1712381
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:52:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FWpN37kn;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116887-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116887-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DFEC30409C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC51379987;
	Mon,  6 Jul 2026 14:10:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EBE378839
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:10:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347049; cv=none; b=oC2Yy83eGtST37AEzCoJNmkuNehhYxWsYfvLIhkItQTMXX3VRRFzk6OM5KsGRi6gcZec8eGuW+RadaHATvn6RYKu2CEu+ZMumRKtb0+DuerRf2OJ7CWoT4512AeH2pRbcTnJeNQq7ba/zZZZYZvxAIauUVMGj4Hjl9/Al+f3cTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347049; c=relaxed/simple;
	bh=aqBHqUvnHvgJQWnufPxhJ0APFMfJweT1QFdea3nbrUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LA0OSbAcgaU3mkan6S3pXPumn79h11ApIOAtRr6oQrfNzdaaWXi94zFJcfFnMYmrKl5IKXCljV+8wqJY4kCrd9PtQk/X4LJE/gD+W9rdlvSMPjFKb37oh2cbplUfrw6EnT/WGN9Z9cjyReJoxXKoXmqO1X3+6Lh34pzQBZQ//RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWpN37kn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E381F00AC4
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783347048;
	bh=R37pHFtaprCoupA5VOyUWUg06+Rz9GF0zUKsfOzMWy8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FWpN37knJaXpEutmCBNj5agZeHBF71nOVbfAoyEeCGLDEpQAD9UXYk7DNMjgPzw7g
	 KNy92GPBBNCPSAW72sEC9epzXiUk9mP8EscnUy02p0EeoiIeGkUk6sPv+o6x9Qiyz7
	 nGjmDdGy4MYUwAOkSajn8wFayfYi6WgsIHKcKzm92Vcx/0vip8nE7Tl6n9uL9yK3C6
	 Omp+qfKE6fQ29+i6X7hWmeWpq+M1wrauAZ3UtPF7IZH4Nvvn278Ht6wx6etoRDVqBL
	 nKnh66hDJ15wVMvu79TN4JmfKV+PRcnC0440jyhFmI8mJXs2roDofu36/1zMUZ+qCK
	 COJcBH6Qze+rA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeba1a36dfso1905657e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:10:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrePe5ucM2F9gsFyBLu6ZSTMlLOCW9aP1aN8xODYvZANo9x57e6WaESw3m8YYF86+KM6v09+M8h6IYXmJHA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd873XScdeBHSBr8C4twVUyUQ7ZydZRPDRzBvhW24pKDgm4j4P
	BJlwkGQKfzoFvQ5TPWsiJloCHzddvyRmU+EnSAokz8AJkjy+NltX/XiezWi/tzJ+tq7AuaZio3F
	prGXq4C6+Z/UK8WygCMk2Dr+rcU3PiY8=
X-Received: by 2002:a05:6512:66c1:10b0:5aa:6cd6:a7f0 with SMTP id
 2adb3069b0e04-5b007baa097mr123245e87.44.1783347046402; Mon, 06 Jul 2026
 07:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
 <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-1-92feb5a7b926@oss.qualcomm.com>
 <CAJZ5v0i4Zc4HNUdgJ_2=4=wv7vRDTugo71qsWnZxVRRqV+W8mw@mail.gmail.com> <9d271393-c500-46a9-8795-f1371585445c@sirena.org.uk>
In-Reply-To: <9d271393-c500-46a9-8795-f1371585445c@sirena.org.uk>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 6 Jul 2026 16:10:34 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g9AxpqUQUQ-vwG2LN3pfT3qXi3_S=So42=VdVtzg-=Dw@mail.gmail.com>
X-Gm-Features: AVVi8CcJAwLOXEDSeEikIg87rWOwRTBY8I54tEwtPnVuwTxyPfLiA_mSuDbP2Dw
Message-ID: <CAJZ5v0g9AxpqUQUQ-vwG2LN3pfT3qXi3_S=So42=VdVtzg-=Dw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
To: Mark Brown <broonie@kernel.org>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Praveen Talari <praveen.talari@oss.qualcomm.com>, 
	Dilip Kota <dkota@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, 
	Girish Mahadevan <girishm@codeaurora.org>, Alok Chauhan <alokc@codeaurora.org>, 
	bjorn.andersson@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Douglas Anderson <dianders@chromium.org>, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, aniket.randive@oss.qualcomm.com, 
	chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116887-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:rafael@kernel.org,m:praveen.talari@oss.qualcomm.com,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[rafael@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A70D1712381

On Mon, Jul 6, 2026 at 3:21=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Jul 06, 2026 at 01:49:07PM +0200, Rafael J. Wysocki (Intel) wrote=
:
> > On Mon, Jul 6, 2026 at 10:53=E2=80=AFAM Praveen Talari
>
> > >         /*
> > >          * On transient errors, if the callback routine failed an aut=
osuspend,
> > >          * and if the last_busy time has been updated so that there i=
s a new
> > >
> > > --
>
> > This is fine with me and I think that it's a quite significant change
> > for runtime PM, so I'd prefer it to go in through my tree.
>
> > I can take the other patch too if it gets ACKed for me.
>
> I've got a bunch of other stuff in flight for that driver - I'll need to
> check but just in case perhaps a tag I could pull in?

I'm wondering though if the patches in the series really depend on each oth=
er.

There doesn't appear to be any code dependency between them.

