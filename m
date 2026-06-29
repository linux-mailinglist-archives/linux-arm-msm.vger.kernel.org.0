Return-Path: <linux-arm-msm+bounces-114891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3alKBlQyQmpw1gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:52:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC746D7B21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:52:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=xWVkUXjg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114891-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114891-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D637630073DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B493F8238;
	Mon, 29 Jun 2026 08:52:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FDC3F8230
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:52:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723135; cv=pass; b=PMElRNFyO5eEDLQ8IR+Gto+8iHIhWVb+GMDVSC10ivgAAsEqeOVKQF8p775fti2FsLg+YKkG5jrCDTV8w5P3qqhZSBBeTzVxPj8r1iwB51VL+fa9BoMfQ61zPtemdVUczOb+6mwR/9ZHW9GBa5dMDUVNoHA8AR+gapQ3GgxKGQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723135; c=relaxed/simple;
	bh=7OOZVMptrMgAu2lQ1tnpHGQStWo7RVOPF052l0ofvDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OeQUYeTcQuJZkH3FvdmTWoBinnatBQ2Tk08Wn+32IIUdAjcAyGwepv0XWuWPQ2JYs9xX01SW9YUNNCvAPiYQ2pypMBcOPCHLyaFppcXqAgwucqziKWs7z64ophlmaKbpn8pi1nB4Pa5G3G0dQA8Kuwl/whxTaGCL6kKtWeE9rHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xWVkUXjg; arc=pass smtp.client-ip=209.85.160.52
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-43cce34c881so1823042fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 01:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782723133; cv=none;
        d=google.com; s=arc-20260327;
        b=nAEppIERJOqG0mk9tec03EDVsAL7lc4emmESXmsryEs8KpuskSl4XmltZ6KLtgRo9C
         Z7QBaOQYRjmlm9HbRnv35u88P4APyEj+hNGtu6XIoJlIQGtgHZlzQM7d1ed0yTLuStZE
         ZfR9SDyBBiVBi4nSVGtqAezx2F82VggzpzsSqLnF1U/RiTCrv7HZ06MolmPP4MtPTHIq
         z7PYx5isX1ShZA7hiJ9G1gUbooZiU+8/DupVD+fZOtl31XZDeE3KULJrgbUc+moPjqFz
         e7tHUqgvoeX4ySk3BziSqUCvho5icP2TNq1Xb6KFCLcgMVMUQpUUmB0+Y92hrPZts+wn
         Kkjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y9ZxLhU2U6aTSHaE5FzsqHEIaPLJ2cfQHxau9k3+eoc=;
        fh=HZBgiWel24ZiKO1ewl2AmuzIm38DoH3oWa9nX3K5Cu8=;
        b=AhePFnQ8tqYJJcdH+/pNhm+9Q1Lyfuawjt0Z3pZ98cRXDELmPQ5HBgvyYDxeBzzoAf
         qB/BVsLx03b6nPUzhNWohbWbxRt8xnnOcwogmgghqg7t9U5NWEqP6kVujBtkn24VFsZ6
         GY0bI8XrXGKhZjTxdXz098jEFtnlfQfOxqXqZi7ogMQXNaXhjSKZAPplQtNlXVnDEhD2
         U1lqc45PLR0PzRjJml/4Jv2gSiF4+/rEtLb+f1qi16b1ur2puhuBA10cG01jg05ZR/fu
         bWAgWjEinEPeDqd0XbKi24dZlmpi/He68SGmnWE/g2mpWueQJTKPw41PsBgbM7+wWGg9
         Jb8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782723133; x=1783327933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9ZxLhU2U6aTSHaE5FzsqHEIaPLJ2cfQHxau9k3+eoc=;
        b=xWVkUXjgxKf2aAverf+XzPyBduWUgQXqW63U8xxFUoB27av0Dc3IAw6n5B2xcuSTga
         Nw1f15Pc0Cw49nqfEqkO9hLXfKiRiZhFzu0Qpw5SojstaDxn36Z6xVlfCs8UURx0qxEr
         GjYQi5lfZ83chWyRqzLSlai8FC0wooTc3/cuqQp0TinQT6BlWg/8Db7sd5ENKw1hockZ
         0jrBZ8LvaxNoYBZOYwlZovs8TNFfFIoOkrhNXjeLpwkGHGZz4gtRR26kRJE9IRL8wlkZ
         e597fPXsMiSWKy/Fd7iPCxLJPAntGQkAY2ctJLCoNnTgICNFI5/VaPxYlHvz/hCfoOwi
         OD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723133; x=1783327933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y9ZxLhU2U6aTSHaE5FzsqHEIaPLJ2cfQHxau9k3+eoc=;
        b=UkN57ZoCWIZr92qxDB9rKXPvZ3TPfu8nKUz8HefBGBwMMneEbx6URKPHVIPHLNC4H4
         PwKGJf0LC/q2Vs3HwxL5PtdZCm5fTaIV06AykwJaAWnId/sEudKqhQsvI+YHGd54mHS2
         ZpCZtn86IMoTfSqDw1XG0qfGyS6MY4o4TmIiIokzYMWWSBygh6BaSVMXEx+vd17TFs2Q
         RTnGvkJ2yMYQVTGPStzKuNsNZ4brNROQ2Px1WW4kAKSiGFEjp5FjabfGwsnkVyeR9gEf
         CItj4553l+Klecf8jn5yD8MmGQ1NTgllysQhFAtwIBW2gshAT/IQf26OWLKbCTIK0LQS
         rylA==
X-Forwarded-Encrypted: i=1; AHgh+RrmLJRTmSHYKAEn80bzbgs3gW1Ib6Lhsq3W3wGglkmfBVhWCTEYr9XJWCEhej4dtHtTpAqHWlOaCcxKB6ts@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Q1UM9T6amRfO27eB1lDtj7KXbSXmKa9sJ1Yq37UcT1L0yyc8
	Npn6To2HYbJ/RSJAfmbojDZ9SzZOTaHpMwl6oPuhpTosaa2MiDEik1Jn4hHW2H4H2JxktFzjtKn
	7Rl5QKJuD5gTVsl7+NJNo7U8mCzkMocKDjLAswOT0kA==
X-Gm-Gg: AfdE7cmOHwRuDC8VpCb+EZi5aaYj++7C69cAhSB9TV7dxSRQMhW1PiTKwpK0W224qF3
	o6//Lit4/5vNNqZTSmDLHIj9JYoZkLp875JSjNk5V+qOrULtBzF0Svqke9Wsyyk9MdKc1OP82QJ
	LghJ+Q4ACRFxuP+e7mw3uDmZMQEa2exsonOtzyRsvlIStMs16nTrGPWLsnuNtp404faVe/rYqu4
	JBTc0SZd8qt1B8y6tX4EjA8tKx8y2COZoTqYlvbUklO6X0HegoNzTPzQYOMRr6CHoi+Tg8rOO5W
	mLJ8kS5HquZx7AjQtFLK8tuALkc=
X-Received: by 2002:a05:6871:d69b:20b0:448:94d5:4613 with SMTP id
 586e51a60fabf-44894d57d7cmr2016145fac.21.1782723132556; Mon, 29 Jun 2026
 01:52:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c21803b3f2ea1522bb930dc1dcab79c2627f2234.1781620559.git.u.kleine-koenig@baylibre.com>
 <6971c4b5-d091-4fe2-b843-60da8b32d48b@oss.qualcomm.com>
In-Reply-To: <6971c4b5-d091-4fe2-b843-60da8b32d48b@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 29 Jun 2026 10:52:00 +0200
X-Gm-Features: AVVi8Cf9Dg1W2tIxLlKyndn6lwaOcvF8bdsQXMuosnhYqSdzUe5bJ3rxXPwAHhQ
Message-ID: <CAHUa44H-Pu9MMxpFyNPBZHw4gcqczss0AzEXQoaHpLWbetAWJQ@mail.gmail.com>
Subject: Re: [PATCH v1] tee: qcomtee: Drop unused assignment of
 platform_device_id driver data
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amirreza.zarrabi@oss.qualcomm.com,m:u.kleine-koenig@baylibre.com,m:sumit.garg@kernel.org,m:linux-arm-msm@vger.kernel.org,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-114891-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email,linaro.org:dkim,linaro.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DC746D7B21

Hi,

On Wed, Jun 24, 2026 at 5:39=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi,
>
> On 6/17/2026 12:38 AM, Uwe Kleine-K=C3=B6nig (The Capable Hub) wrote:
> > The driver explicitly sets the .driver_data member of struct
> > platform_device_id to zero without relying on that value. Drop this
> > unused assignment.
> >
> > While touching this array unify spacing and usage of commas and use
> > a named initializer for .name for improved readability.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig=
@baylibre.com>
> > ---
> > Hello,
> >
> > while this is a cleanup that can stand on its own, it is also a
> > preparation for a change to struct platform_device_id that requires tha=
t
> > .driver_data isn't assigned by a list initializer.
> >
> > Best regards
> > Uwe
> >
> >  drivers/tee/qcomtee/call.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> > index 0efc5646242a..4a597eeaf174 100644
> > --- a/drivers/tee/qcomtee/call.c
> > +++ b/drivers/tee/qcomtee/call.c
> > @@ -798,7 +798,12 @@ static void qcomtee_remove(struct platform_device =
*pdev)
> >       kfree(qcomtee);
> >  }
> >
> > -static const struct platform_device_id qcomtee_ids[] =3D { { "qcomtee"=
, 0 }, {} };
> > +static const struct platform_device_id qcomtee_ids[] =3D {
> > +     {
> > +             .name =3D "qcomtee",
> > +     },
> > +     { }
> > +};
> >  MODULE_DEVICE_TABLE(platform, qcomtee_ids);
> >
>
> Looks good to me, thanks.
>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

I'm picking up this.

Cheers,
Jens

