Return-Path: <linux-arm-msm+bounces-116856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NkZjN0a1S2rUYwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:01:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27433711A64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:01:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dlgvWu6d;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116856-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116856-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6652D319B85C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835BA42CAFC;
	Mon,  6 Jul 2026 13:21:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAAB416109;
	Mon,  6 Jul 2026 13:21:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344094; cv=none; b=dqlGTFYuDOmd1BT9AJk7kv34Q0Jo4X8PBcgyXLqLQShy1KKpPwyzyhQ1HpszTqroL2agJi1wzX2J0K1PpqrOEq+fCN531c6u7tX03lCu2NTwMGMTCJsTmD6KrjjfR5DvNn5MICSl1IEnIusf5GY4Gn71uOro2rqqvcAKhhlO+ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344094; c=relaxed/simple;
	bh=l2Ms9idRFunWWcR8o+FwBgnkVacUWkwsC6lm9/hH2FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKl2mzZlvhK079Cjea1JyGSVefGdGCp52cnh3Vh67osr7yhrVCLCmKcSAnFYlFEXq1gp9I/WYiPSHDqaer0hS+tFIMgBiq714fq3h5rMaclGk1M6lxs/Ljv6Xx0dCgibKRqsGtXWoDjp6boDg/mMblquUWiQK6T9wni6LVJ4KRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlgvWu6d; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCB51F00A3A;
	Mon,  6 Jul 2026 13:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783344093;
	bh=fJldbQStjOY9URihIgxJhtt0Q6WiLugt2TW9p49DC4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dlgvWu6dX3bvYR/PzLzMrGcnLbLNzWpI0/c7viswlSFxP1uqN9AxFwJI+O/k+g7eC
	 E2VZWgIpx5p+IJK/LxN0Q8BnTevM0IrhOqQUZZbZn4wxuPgMkEdjazZlq0nUPdIkTP
	 hsBe6OrYMYRakwlrxsbAaZU1pNEsYLWizphE7rO/YsXOM6hwdnmiKc3nC8nOwW3XMz
	 t0tjoUS3VXdTL9POWnLab1Bee/jDwlJW7E690iooC6Mu5XYjuZqjiJjZrM8iB0pLDj
	 NvFn8dv5D+OBAL+BkX7GOsfSs4lGzhfnRqjrC/HLho6iOXBuSCWFUEnHd7Z+blXr5I
	 /ChmOouv4pmEA==
Date: Mon, 6 Jul 2026 14:21:26 +0100
From: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Dilip Kota <dkota@codeaurora.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Girish Mahadevan <girishm@codeaurora.org>,
	Alok Chauhan <alokc@codeaurora.org>,
	bjorn.andersson@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Douglas Anderson <dianders@chromium.org>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com,
	jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v3 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
Message-ID: <9d271393-c500-46a9-8795-f1371585445c@sirena.org.uk>
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
 <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-1-92feb5a7b926@oss.qualcomm.com>
 <CAJZ5v0i4Zc4HNUdgJ_2=4=wv7vRDTugo71qsWnZxVRRqV+W8mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="26PrE7s8gGWJKuvD"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0i4Zc4HNUdgJ_2=4=wv7vRDTugo71qsWnZxVRRqV+W8mw@mail.gmail.com>
X-Cookie: Did I do an INCORRECT THING??
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:praveen.talari@oss.qualcomm.com,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.5.7.0.0.1.0.0.e.5.1.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-116856-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RSPAMD_EMAILBL_FAIL(0.00)[broonie@kernel.org:query timed out];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27433711A64


--26PrE7s8gGWJKuvD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2026 at 01:49:07PM +0200, Rafael J. Wysocki (Intel) wrote:
> On Mon, Jul 6, 2026 at 10:53=E2=80=AFAM Praveen Talari

> >         /*
> >          * On transient errors, if the callback routine failed an autos=
uspend,
> >          * and if the last_busy time has been updated so that there is =
a new
> >
> > --

> This is fine with me and I think that it's a quite significant change
> for runtime PM, so I'd prefer it to go in through my tree.

> I can take the other patch too if it gets ACKed for me.

I've got a bunch of other stuff in flight for that driver - I'll need to
check but just in case perhaps a tag I could pull in?

--26PrE7s8gGWJKuvD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpLq9UACgkQJNaLcl1U
h9D4zgf9EYMicEtJ/deqUwzL8Y94faZjIRrNjzO1Pms6VFFvmNIrMtwtYwStR6k5
IJAjbhfyNqoLy3KSk7DieQKJcOXbk/rThONhmTQ50GI1qX4eqg3W+44nB7+9tlFm
YnmBPz3kOMZN9xJdlzkVCU456XiG7VGQlrlv1rgcFu9Tw47kqWjds0LYJTovkD7v
Dm9mR4pHJhArtS0HppkG+S1Y4jkyauu+xqywkkwdD4yuhzUGZD7tc2SJAzZpqa+1
4WCqO6O+eqx43nffuy76+54pOAvP6Dv3f8L6akTHYsQoTyGvpeldJSJYs9ncfxcJ
xlEnUljuRFZflv++mmQ3JNUIJkMu7g==
=8n3A
-----END PGP SIGNATURE-----

--26PrE7s8gGWJKuvD--

