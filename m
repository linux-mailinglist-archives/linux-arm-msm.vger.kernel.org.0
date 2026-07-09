Return-Path: <linux-arm-msm+bounces-118070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s1BxC/LbT2oepQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 19:35:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9670733DAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 19:35:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mIIEumld;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118070-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118070-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 074CF303B711
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 17:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C084D9905;
	Thu,  9 Jul 2026 17:35:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DCB4D990A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 17:35:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618534; cv=none; b=TX7ZYuRrcFr8t4eZSqTLw1KUKs/Bg7iAyeqbdqIhHl+0FddMDBR6TR3Ku2g6lPa2dnpeZPUwI0egDPcv/3FhPam1AHAYDWTeULvjtjhhWbqqyR1t5CqbZKyN86k2PoJX0BAlIG98t1sk+0Zc/tNVMbrEYMpxG4VFbTlKyJuszrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618534; c=relaxed/simple;
	bh=lsP6huJ9ct03Z1zKO/sCXP1Yr6xrLwhLc0mSXcIgtsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xx0WPRwLSXas0tA0/E49chevJvIsonQ/sEqARwKT8VB2G8stMxk0XVeTgw41/bFsI9FykC+biGm+yMLV+DGOvdadfguadOgRSFAvkDZu9DdMg52s0ZFNDkczzgWGE5z9no8nMrugWhJO0Qs6T5ohY1DrCY98VjPdRtJjY4sVdoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIIEumld; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB451F00ADE
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 17:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783618532;
	bh=hoLMINlV3QqsEhjkSKeIdqYNPL53JDMS7s0+KJ+FeeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mIIEumldZR6U8Vsyv4uN8iTJ9ynjNG5mE+fXNsti76WpUMH0GHVCrajUR2B8tWP18
	 +YmlR3JZcgl+QesapPEsAJo8jBtRXwQmGlQrZR1Eg0OpTbDGRpbchBJH3jASgL8aeZ
	 1c7BHlV3rBiKYTzP+YdqSYlG99mXe6jrQHtEjujE6WauG1K3k3Zmsz6/DA/4YGQZs8
	 QMpVaQfy1KNwnxSy3fYB0pMTbtvsf96GOdZ5QaFzHoYG52HbiF8OWPeYZIDzQLwLgq
	 wsDt56MqteZPeqUZmEWeqJKLd2CJmLpyXZekYDv8FwHcqr9Ku4GOSEpFkIaz97jChs
	 9n4FinlkBnh8g==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39b2be45e8cso1016311fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 10:35:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr2x/fXgFHLe4N/jEdlq8dlipkPgAhqhK/sgiY957mWvMqpofaLSYZ/3m5/fwjO0wfFDrXAhWfD+KZNKmup@vger.kernel.org
X-Gm-Message-State: AOJu0YzMFMCZzLO9TtQkLvmT0v1r8TVLcnIDsQZZ2NiGiqLBd6BebpbV
	/JmDLMDOvaZM0FLWADDGBLK7LcHCAXCEFLC6KkQNDL6mp/hm67Q6LscOUToB1kP2S2oEmdlj0QJ
	34Zb+Vn0usTzqMn/zi+NwOVxvUV58C6U=
X-Received: by 2002:ac2:5984:0:b0:5ae:b9b3:8ba8 with SMTP id
 2adb3069b0e04-5b011477c4emr1214774e87.57.1783618530978; Thu, 09 Jul 2026
 10:35:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
 <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-1-92feb5a7b926@oss.qualcomm.com>
 <ae915278-2f21-4bd0-8651-d2e02ac04aae@sirena.org.uk>
In-Reply-To: <ae915278-2f21-4bd0-8651-d2e02ac04aae@sirena.org.uk>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 9 Jul 2026 19:35:18 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ga8qqYg79+hQVtO8T=FOCj8XLmTz3HpEKoOykV_K-HSQ@mail.gmail.com>
X-Gm-Features: AUfX_mxSopoNn7_P9sl3mlA1rhOj4sbv78uOl9S8bWEr1uQf2zt3I7w-icfoGgs
Message-ID: <CAJZ5v0ga8qqYg79+hQVtO8T=FOCj8XLmTz3HpEKoOykV_K-HSQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
To: Mark Brown <broonie@kernel.org>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	Girish Mahadevan <girishm@codeaurora.org>, Alok Chauhan <alokc@codeaurora.org>, 
	bjorn.andersson@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, linux-spi@vger.kernel.org, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118070-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:praveen.talari@oss.qualcomm.com,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9670733DAD

On Thu, Jul 9, 2026 at 6:35=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Jul 06, 2026 at 02:23:09PM +0530, Praveen Talari wrote:
> > When a runtime resume callback returns an error, rpm_callback() sets
> > power.runtime_error on the device.  This causes all subsequent calls to
> > rpm_resume() to return -EINVAL immediately at the top of the function
> > without invoking the callback again, making the failure permanent until
> > runtime PM is explicitly re-initialized.
> >
> > Unlike suspend failures, resume failures should be retryable.  If a
> > device's resume callback fails, there is no reason to permanently block
> > future resume attempts on that device and all of its consumers.
>
> runtime_pm.rst still says
>
>   * If the resume callback returns an error code, the PM core regards thi=
s as a
>     fatal error and will refuse to run the helper functions described in =
Section
>     4 for the device, until its status is directly set to either 'active'=
, or
>     'suspended' (by means of special helper functions provided by the PM =
core
>     for this purpose).
>
> which needs an update now?

Yeah, it would be good to update this one.

That can be done in a separate patch though as far as I'm concerned.

