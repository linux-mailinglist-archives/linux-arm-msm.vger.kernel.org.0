Return-Path: <linux-arm-msm+bounces-96592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN5ROy30r2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:36:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 75493249738
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 566513017385
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADFC175A80;
	Tue, 10 Mar 2026 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GHoEAJ83";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SQjltzHC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13FD36EAB1
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773138985; cv=pass; b=pjEpQS9aoNKFrOvmyJyORI4zIMdWo8kHLiQqTqXh3wUOhzlnLJrnvgZyZzB/6TvwgFGnXUop4jAlfnZJmB3Cgc4AJ89LWyBE4TMxjoxgsBxtzwoMCNt4zu+SdwOraxH5AfvE8JBMBYXKKlko8UdnV61a1c88UG7AyXluar1qtUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773138985; c=relaxed/simple;
	bh=BTIDpEfc1+b112+c2kI+TTQpJcYHlX+emjwBSzIoKaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o89AX9byLQaC3NX5uxgOloc2nkaTSUYW5zVyEodQRDaLFhXoNOT8kw3VRGMPhkKz/Q3TgHsoPLN6DMvEDofjrYc1YX/P13M78uJ4ZGIG6aCUX6S64ynK3AZbjY5nk/iVJlBhgu7hyfpr8qys02Y58Gk8SEoSV+GnNgDXsImFpiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GHoEAJ83; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SQjltzHC; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773138983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N5BQkwEpg20oVwTBT/D3t0SfkhqTpfUbHJwJboz9pdc=;
	b=GHoEAJ83xtgY3QC7/mu+yKp0wAWehIdxAIZOte6Di0OCPQcGaIPyWrGID/U6j2sIPlZi1f
	4PVceUI+i7fURQNODs/7FFLRKrSUi2fj2ezXK2qTw7d8XbnBz5ZUkguhUEOLekV1ojrPQU
	Ean9GHg9GzJE/gQXQ+yi7Y0ku4SWEkI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-tBfnsi-GPYyEfHRs-t2VPQ-1; Tue, 10 Mar 2026 06:36:21 -0400
X-MC-Unique: tBfnsi-GPYyEfHRs-t2VPQ-1
X-Mimecast-MFC-AGG-ID: tBfnsi-GPYyEfHRs-t2VPQ_1773138980
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b95c0d77b42so223943666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773138980; cv=none;
        d=google.com; s=arc-20240605;
        b=dt97H2qYVfhP5piwDvA47z9cSluYtRiVDnwAFnFuIkGbfhzDGgFBiFK0Pke6RWAiOm
         0QJKkwpJvEhmx1H6mi54yW8NS7mt9vCY6p8jXV5SdMiEkd4QtfEomMH7fORxvtN/t8XW
         0dgWXKs3RMmi7tYNHHsRlICjId/1lJ8N0N4pgpkSNXoe4+8gZuqDqveREkPtXmCFfurf
         Qnw5yTc0Tdc5lzGYbsrFtB79qnfcJN8VKgzY7ko7uw3Wy6di9jKQbUk56/OCtqbibehw
         ibw884zqVu77XqixIqwAj2DGH6/+iLUPEupXfD94rmRmw452e1yuwykF+gi64QeGfNe9
         /3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5BQkwEpg20oVwTBT/D3t0SfkhqTpfUbHJwJboz9pdc=;
        fh=ltVnkaxYS9yAZnO8DKzVzlo7YDa7wdih3nDwrAQGJMY=;
        b=U7tFtaOXc4iV174MSrgZRrKrfKdPhYiGDdpkpmtsuHO88jQruVr0oz5yhOFDL7fIdS
         7sXSnPL4wYLH1LnFPyN5riRIwTYnxmrBDXR/Y7wUg81F9MGViqKq9LRbhro3hmP07opL
         LlULJ0TWFfRFZde7jprD+sG8UVA4E0WBzoYA6os3cUAA5HXXv9rFv18N5WE2E6DllRd3
         nlG+xf36Zl+VjdipICMGyYLeIptOKeLGd58rPS/4B1TYNTnF+odhgUt+cr1h5TZdX3fs
         KbEYpwiqtxH5xajgVAkshUhR61ILC4vg+Z0j13jw2UqBMyfuZDkNMiQ2JGlQ06dO+nz2
         GqXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773138980; x=1773743780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5BQkwEpg20oVwTBT/D3t0SfkhqTpfUbHJwJboz9pdc=;
        b=SQjltzHC2fXiL7XnXOfRgVXacztjw6lw1dr9Jb35lDfbu/gd7uSm+nIMpLhWYvqS+B
         frSE1fVaUQAx0XQBlUK66yivcTIlY0Nic9N7R9VuDU5Saz5RJYV6P4fB1j53oHF+pVqT
         BX9CuxVthhqNc18QbKMrNj113a//Zmu1J/7dI4U0sTn6a/Zwe6sTdrAX2q3+gkyDOqE7
         2c5Y0hXoUkrCTIJuyR/jJcbPzUAdIrQHt1AG1KXpt4Btxishv62mqd7eYKp+xrwGkoBr
         0jT/mJfg+8lIaZoW6cQvDnjzCy82dFth9T7Xt4WG5qIYrBU5Kx3xcIVXZcSozcY8ehHi
         U9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773138980; x=1773743780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N5BQkwEpg20oVwTBT/D3t0SfkhqTpfUbHJwJboz9pdc=;
        b=dGLCL/Z411uq8cK1npGd/CtbSxWySLvB42u0xbj24HsX3dik4RA5O18O8UmI3YTWG/
         JP7X7OfI9kO5uX2J9N/27ZPdf+AdqzI7Hw7a2FGMraPxIbN5peQXq1L+SZH374E3y7WV
         P1/VknWL5tw3Um2ZOxWU/rfepTptN8qJhgM7zwzOh5JeuKh41xMUi+JssFsY0RCZKD/E
         FDrcD42pvevjM7JlyniqFA5cY2+cvT3suOegDhCgc8zvoU4UjRAzaXjTdyXUllyvKqjE
         6zeg3bFXJN7D7UUCxaXDGquQ5FLWqad9kdondc5KHsCQXHZe8ThKvrW3h38KaWDb/orT
         JlQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4j8T2BoVk6orAAPLn7I+oSvku5H16UQzBMQ9KNYdXNJGOCT1nTZRkJmDraU3JnRBI7FUu8nfiQn+8r/yO@vger.kernel.org
X-Gm-Message-State: AOJu0YxcMrCCcvOWw4HVAzxA6SKYiBMichUQ4VhgbR2i6yskYjI0Moda
	4fx/GABv+fdA5h1dhxvhStW9+Or9THsFB9oDsfCZIuUWdzppBwAIBRORnEtVXjXcrCdSM+QUDMC
	u2qqEbdwVPGadi1Zs6y8NVmlJhSa5a7n9TpgSQdua2rX1EZkvF9Hlkf5dxRvQxQcVVnRhDwRZXf
	thNY8PwaAfYEZhbjrs7m0F0ZQKo/HuOB9xiipFPVqayg==
X-Gm-Gg: ATEYQzxdE/H9xyjbfLBGYwihL7b9Sh0uG+CoZV196r7bllKK+SSZcn4/USh/Qz46/R5
	Bp4jwYc2knFdH8oAWf3eR5P9JhsqpV2ptRUCjZ9NXl1pabcBQtybBCj2RF6fBkfIXyUKS7AUsSN
	mfn7h4X2icXCBc9p1AYAiTF9m4v+X0Pnw5KskZrT7UjodKQYdoD3BRpxFD3s7YQmXeZrjGxe2tE
	vp/8Q==
X-Received: by 2002:a17:907:1c9d:b0:b93:6019:5858 with SMTP id a640c23a62f3a-b942dbced30mr845801866b.7.1773138979829;
        Tue, 10 Mar 2026 03:36:19 -0700 (PDT)
X-Received: by 2002:a17:907:1c9d:b0:b93:6019:5858 with SMTP id
 a640c23a62f3a-b942dbced30mr845800666b.7.1773138979394; Tue, 10 Mar 2026
 03:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
 <20260309-clk-det-rate-fw-managed-v2-10-c48ef5a3100a@redhat.com> <92127112-9d7e-4fc3-ac04-4ec0206d8bd0@oss.qualcomm.com>
In-Reply-To: <92127112-9d7e-4fc3-ac04-4ec0206d8bd0@oss.qualcomm.com>
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 10 Mar 2026 06:36:07 -0400
X-Gm-Features: AaiRm53nmRg1zW7rcERIS61hPt9DKGz3wtfNnQq-tIbfAAlJ6VqxS5q4W5umoOs
Message-ID: <CABx5tq+D4OeApjYv8VkcbMv6-Atc=Ob1e=7f+xqt0k0CUoJbbw@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] clk: qcom: smd-rpm: drop determine_rate op and
 use CLK_ROUNDING_NOOP flag
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 75493249738
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96592-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,baylibre.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 6:17=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 3/9/26 3:38 PM, Brian Masney wrote:
> > This clk driver has a noop determine_rate clk op. Drop this empty
> > function, and enable the CLK_ROUNDING_NOOP flag.
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> > To: Bjorn Andersson <andersson@kernel.org>
> > To: Michael Turquette <mturquette@baylibre.com>
> > To: Stephen Boyd <sboyd@kernel.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: linux-clk@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  drivers/clk/qcom/clk-smd-rpm.c | 15 ++-------------
> >  1 file changed, 2 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-=
rpm.c
> > index 103db984a40b950bd33fba668a292be46af6326e..8c6fc5adf5f50537a4f8d43=
872bf2f9065e5d6d4 100644
> > --- a/drivers/clk/qcom/clk-smd-rpm.c
> > +++ b/drivers/clk/qcom/clk-smd-rpm.c
> > @@ -35,6 +35,7 @@
> >                                       .name =3D "xo_board",            =
       \
> >                       },                                               =
     \
> >                       .num_parents =3D 1,                              =
       \
> > +                     .flags =3D CLK_ROUNDING_NOOP,                   \
> >               },                                                       =
     \
> >       };                                                               =
     \
> >       static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active =3D {   =
       \
> > @@ -52,7 +53,7 @@
> >                                       .name =3D "xo_board",            =
       \
> >                       },                                               =
     \
> >                       .num_parents =3D 1,                              =
       \
> > -                     .flags =3D (ao_flags),                           =
       \
> > +                     .flags =3D (CLK_ROUNDING_NOOP | (ao_flags)),     =
       \
> >               },                                                       =
     \
>
> The other two definitions (using clk_smd_rpm_branch_ops) also need this

Are you sure? clk_smd_rpm_branch_ops doesn't have a set_rate() op, and
it's been like this for years. If I add NOOP flag to this ops
structure, then clk_core_can_round() will return true with this
series, and it'll change the behavior of this driver.

Brian

Brian


