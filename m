Return-Path: <linux-arm-msm+bounces-105048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN/qHuDo8Gn2awEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:05:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D03648992E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4577730B3533
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421303290D9;
	Tue, 28 Apr 2026 16:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="R1sQpZEE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AC93264DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394399; cv=none; b=Th0eiLAzwfczmWc7ROounnxQlcE9BovLZ7SgSvNV4s7pds/T2LDtyKPH3iG3R5WcGTfHcTJH3v8JVtS/teXT0n8/oaY49Sr7t2xSEpNMH/Yu2o0BIAH5o3XeFiX4TOdJU+KLcn9KSipfUDBqbpqUHyj7eiHCeL7+lbptZVg1y18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394399; c=relaxed/simple;
	bh=UGZ5OH13xNNWGffq+mixPjAxeqdRTmGto/YCnxWBxN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJKBnjEIKIQyJ/rzvPiSwlyQLrQ7gX9d+kN0K97Acg9ebGg3+/E81Qr0VpKHD4pTQrQfJMQLWQ5MmguTEbbfNdja1fScUqgAaYY9+zNjMiojSUwIHbG83IwolF7Ct+DHfzPO8iEOBvoRLamMM/ZbmGxQJe3jsH+xlTr5zOmru8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=R1sQpZEE; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43eb05b1875so6797833f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777394395; x=1777999195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UGZ5OH13xNNWGffq+mixPjAxeqdRTmGto/YCnxWBxN8=;
        b=R1sQpZEEfu0RlRHoEN5LhQa7f0oa/YWjyIO4KXdzLp0Tv/xh6VLH0zQjZmGyfKRLp8
         2QaxggocFJW+am4FEsRcEh1O4ZvSs+B0UT6zLUX4lV+3/eJlofMQg4i0Q2SETZBR0LCO
         i9yGij2/CFOiOrCZ6lRuD9C+f1kyR/NoRd8DSDVq8yatGmpOGph0Tg07MAhc++fEao+I
         K7U0KLo2G2oySWmN3s2qx1p+W/gGpLMMTeuRcwcXdrOhDWTz+mK5DG2gS95vGLIqf7xr
         j4sbWoV2SLCGBcKJW8nGki+2iz/dhiUYtElvzIgB6HR13pB71TDqmBI4Lyx2mCE5253D
         efRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394395; x=1777999195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGZ5OH13xNNWGffq+mixPjAxeqdRTmGto/YCnxWBxN8=;
        b=GL94ziaDhuS3a7+YZfY4D3tQgt6BwRSEPk6XhnEi0Y10UPAEYpVNy42/jbR6r96BiD
         pIuAjVxwRXKU+xTOeGvwtKItR1nQsRxozbr3Y2MUBjPeL4zGWE8QLDusQvXNtLJAkC9f
         1wi8P5dHEzPbZs7orNDApIjNGIsmvEjV0LXCPyaUYZC1lrhP3sMNCguUYQqlE2tlFHpj
         tufF6z59NZKNfupDVe5dAih7giObifVfkSyv2QGN2QrSH1qBHBPhiwVidAp4sdLEAUks
         IhGfq5pOW26tHcnbzyWzz80oU9N4mH2CqIeJ7qSuKwAW+Fwf9UyC0j2JX6sQyHd0/Jql
         ZbLw==
X-Forwarded-Encrypted: i=1; AFNElJ/HEiE80AdQggzupSY5xyCPiwFHulQfY7e0pJgfEXZtbg1afx9BKp99aBdq93x6yiicHTaOvbxlMoFBkiGl@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ6fBzSGCJn8yHxe1WRN2vTVDwMeQ+TJbpPvzSdmTzUhhqTX2X
	liBhBUoj+D11+inwEArXHPjmUZybRGOa2NTvNEll6vJMQ//+iFo1WVxvFmP+FnhRKhk=
X-Gm-Gg: AeBDiesVHon3IAK1ei5a9Ga+6Lupv87D2CE294fhKhxtfxxIXf+pYi52GZ0pVluFiri
	Dxxocs1t2hzQQBJTQjS/6EoSxhn/uVEKYsi7tWcmONZGOdT6RlSqq39cuWeEbXgDGGyeYtLLEeK
	iK4bCMqqUFnLj7uKuM8Vf4h/ftI4+UsdQETmxcxXLZ9rLWFX1vXTeOcti33uAkWhBn6D7A9Ozkm
	aUSaEhxeIOWIt7ZCngRgm2TlZ3k7OaGr7mTwzPuVdtOG0w3klqEj461tY9Kj8DkOTQBXnCD2Ubf
	6fYxarPCgXJz3pRUVG6l5s0Hjq43CsQbDBK9nsj2QB2oU+8ZEeDoQej5qN628LZ6oBa7xQILED/
	gXZqOVTtqiOhfyRgMBkDrX1A1fkYVeQKavt/7zzOSbJzRIlZbwblhXSRYVClkT8k8O/3J6y7XL/
	VHfix35K5PqwsmYPXZL9lanJ5igzPFsBHprEAWZuJO1Awx8ZJ6PnX2IUOAHyS9J7bhh31MzDW00
	80ZgXjTpVM3PkLpGivai/7aOQ==
X-Received: by 2002:a5d:5f85:0:b0:439:fc2c:363e with SMTP id ffacd0b85a97d-44648b51201mr7294713f8f.13.1777394395342;
        Tue, 28 Apr 2026 09:39:55 -0700 (PDT)
Received: from localhost (p200300f65f114e083adbfb3674088b9a.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:3adb:fb36:7408:8b9a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4463fb7e2afsm7393191f8f.28.2026.04.28.09.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 09:39:54 -0700 (PDT)
Date: Tue, 28 Apr 2026 18:39:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Kees Cook <kees@kernel.org>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Don't use UTS_RELEASE directly
Message-ID: <afDiNw30ud7hA4CN@monoceros>
References: <20260428144553.1103785-2-u.kleine-koenig@baylibre.com>
 <afDYn8Uy6PwvOVbH@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5wg4hxtb2iskpprw"
Content-Disposition: inline
In-Reply-To: <afDYn8Uy6PwvOVbH@ashevche-desk.local>
X-Rspamd-Queue-Id: 3D03648992E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-105048-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,baylibre.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre-com.20251104.gappssmtp.com:dkim]


--5wg4hxtb2iskpprw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/msm: Don't use UTS_RELEASE directly
MIME-Version: 1.0

Hello Andy,

On Tue, Apr 28, 2026 at 06:56:15PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 28, 2026 at 04:45:53PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > UTS_RELEASE evaluates to a static string and changes quite easily (e.g.
> > uncommitted changes in the source tree or new commits). So when checking
> > if a patch introduces changes to the resulting binary each usage of
> > UTS_RELEASE is source of annoyance.
> >=20
> > Instead of using UTS_RELEASE directly use init_utsname()->release which
> > evaluates to the same string but with that a change of UTS_RELEASE
> > doesn't affect msm_disp_snapshot_util.o or msm_gpu.o.
>=20
> Would you like to submit similar changes against driver/auxdisplay?

These didn't pollute my build results so far, so my pressure is small.
(Two of the three are not relevant for an allmodconfig build and the
third depends on PLAT_VERSATILE which isn't in my build matrix.)

I assume you ask because if I say no you'd address that? In that case
please go on.

Best regards
Uwe

--5wg4hxtb2iskpprw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnw4tcACgkQj4D7WH0S
/k7N1QgApisEJnKTkOhLymWxlJq5f+uGc07LBKxZRs2Yu4UsC4pfh8kciX5dOl10
yoFQyQpMG35A8DLdGgpW37An6KaLzq0Lpb+4YWso0vcyOBcNd+zhiU9YkTJGPstU
Xk5/dXB+nseXqRku4tb/x85eW8hMUQIONNQeQWvoaeuyxomXlKYoMX4+53dILFnE
x4uIEPyWVe2igixQlgcfYS8Tq2bEM97yzhOCewycVl7iX5OK2EEmCAsC/FV7YLei
O4IYo7YXWDRPdj93wBnHUOYMLfGtnQ0muy8Zinp24ak8Rixqe0yI9jCc2RK0D5AA
uu4Npn9tyrK7tAPEzvTlCS0n7uqDqA==
=iheh
-----END PGP SIGNATURE-----

--5wg4hxtb2iskpprw--

