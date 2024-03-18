Return-Path: <linux-arm-msm+bounces-14425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3328B87F352
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 23:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB12C281504
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 22:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7095A795;
	Mon, 18 Mar 2024 22:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hGzOtRU/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EA05C8E7
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 22:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710802075; cv=none; b=h1UmuHiAn3mXVR9aZke9RXF+wj39b/GN1nHBrha2ALn2lpICajlSS0FSORuIlUyJWg0CRNQ2YigERkQoAxormwuHv8yty/KevbCgMYbY+M4IJtI0528byYvVISqiSX/MzSmoa2s8CetRrAmAgSzH+yxs0Kmi4FesDu5APyPEmzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710802075; c=relaxed/simple;
	bh=sgJpHUZz2x1AZvyW1EKEo+nb0tE9bx0IKzCXyGwvoTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+KudwAVoDZN0enPzRxYdGQ7wrskRq0Nmvl1mCDgp9e03Fc825OIOfRii6WV/dT4yAXB8R/pP7HqEMSKYQZeb+bbJCawEKnPUKC31wM2P05Zjb2FUsEk2D7AD46Py5pLZiHkVt7BrGBIp1kz6z5FEy82OaCjdUvbx6vjy3Zxp8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hGzOtRU/; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56b92a8f222so181770a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 15:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710802071; x=1711406871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwEDj39erEoMuYqN28dZy8EutQd8hp6VzWoX2fGRLFg=;
        b=hGzOtRU/rALna3nKk9+qelRUyYRNxE5XV5JmiLt41VTnhXymVIGzXRPwV80huSoq6l
         CwLwa4Kah4bLxFk7tqZvIXd/Ot9Y3T8xPuYpSWSLCeXruo1rwjYr4DvZ8E34Diqm7oy4
         fcXn9p/5kzL4ElVYd6XKoPo2L1PUXpwqZPG4jePya3K7jxB0QpqwZ/G3Y8TPB1/HCnKk
         OEcxgCmpfuXqXeWKlK6+x7N8y4gV4lypNHfiw5/EtnvTonaVwDQDg02B4Vsed0GTJqu6
         E5sBmAHkDAJANOmajRW0TXGRNtJrVc4PIwmgtf5q9MYNxcQdz54T+1THuBDj7kWZtxgj
         qYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710802071; x=1711406871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwEDj39erEoMuYqN28dZy8EutQd8hp6VzWoX2fGRLFg=;
        b=sH4umiQSGzRfwKCKH2ErdWOjmZBF/FJH9TRQ6LTCEsiqTu1QvHXMp0XW/j8rLDEd0E
         SPIOC9uu1k6nuIA17BS7jauLA65MJE2PqhejDNm3WBbyOAxXbvUM/0jNsiVLBRpS9qJS
         8Tklqy1+fBVub1n33oNudQ+sJtZZJDfvQE/EyvmMCbzLlkggCWKh9rz8/G7eUw5R24lF
         pw1MXc7fNRGold0Y0Hj5jKSMPnDvw0JHaTVURBLegKADuDo/soaZCVKZfiby7dJP3s3v
         /OlFtGC4JMXg5b8O5wZ6vBQt1irmLqtsZAMkfviemMr1Xd7PaH7r4Z5OLpk1J1yPm8t0
         t3hQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2MqGW3qCzEoGtZcyRc22XQNlXjbT4fLSuTy2fu/7M+j/rgopoe7d/6sutMzsHqjCkEIDDbnr447PX0X7+KeTu4MTU/Vza/DRjXCRC2Q==
X-Gm-Message-State: AOJu0Ywksh5GB5hELjFwsW8HBvSZSItuQsRZC0fCr3awoCibmoJEQiB7
	dZvsuJTzAxbErjAV7LkHLbpqgpG1G0ymwGQ3pFNUf6c8bPiC/gip/iEFvWqH47F5XfbN/VC/lR8
	3M9/P1S/iv3ghmz/IlTg/+ytSUhja08kIHCuj
X-Google-Smtp-Source: AGHT+IHrzcDD4slpLWRRwgUrWX1KwFH+U27AhsbRWWZ/Jqtxr01plt1XfumdAhszv5GSqdbws/3/5gEL+RN+9r6lRXk=
X-Received: by 2002:a05:6402:2483:b0:568:1a8:58b with SMTP id
 q3-20020a056402248300b0056801a8058bmr10681423eda.14.1710802071141; Mon, 18
 Mar 2024 15:47:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314-strncpy-drivers-soc-qcom-cmd-db-c-v1-1-70f5d5e70732@google.com>
 <202403181443.F4021C9F63@keescook>
In-Reply-To: <202403181443.F4021C9F63@keescook>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 18 Mar 2024 15:47:38 -0700
Message-ID: <CAFhGd8qJ+Sks33cgEie_cvj-YrAUUiLrA7wY42eWQ2Xr++C4Pw@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: cmd-db: replace deprecated strncpy with memcpy
To: Kees Cook <keescook@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 2:52=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Thu, Mar 14, 2024 at 10:29:37PM +0000, Justin Stitt wrote:
> > strncpy() is deprecated for use on NUL-terminated destination strings
> > [1] and as such we should prefer more robust and less ambiguous string
> > interfaces.
> >
> > @query is already marked as __nonstring and doesn't need to be
> > NUL-terminated. Due to this, we don't need to use a string API here
> > (especially a deprecated one). Let's have our stack allocation also
> > zero-initialize so that we can just perform a standard memcpy. Since th=
e
> > code now speaks for itself we can drop the comment. A memcpy on a
> > __nonstring buffer explains everything that this comment talks about.
> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#st=
rncpy-on-nul-terminated-strings [1]
> > Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en=
.html [2]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> > Note: build-tested only.
> >
> > Found with: $ rg "strncpy\("
> > ---
> >  drivers/soc/qcom/cmd-db.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
> > index a5fd68411bed..512556366a3e 100644
> > --- a/drivers/soc/qcom/cmd-db.c
> > +++ b/drivers/soc/qcom/cmd-db.c
> > @@ -141,18 +141,13 @@ static int cmd_db_get_header(const char *id, cons=
t struct entry_header **eh,
> >       const struct rsc_hdr *rsc_hdr;
> >       const struct entry_header *ent;
> >       int ret, i, j;
> > -     u8 query[sizeof(ent->id)] __nonstring;
> > +     u8 query[sizeof(ent->id)] __nonstring =3D { 0 };
> >
> >       ret =3D cmd_db_ready();
> >       if (ret)
> >               return ret;
> >
> > -     /*
> > -      * Pad out query string to same length as in DB. NOTE: the output
> > -      * query string is not necessarily '\0' terminated if it bumps up
> > -      * against the max size. That's OK and expected.
> > -      */
> > -     strncpy(query, id, sizeof(query));
> > +     memcpy(query, id, sizeof(query));
>
> Hm, no, this isn't right. We do want to stop copying at the first NUL
> character, but we don't care about truncation. e.g. imagine if "id" was
> a 3 character string followed by other bytes in memory. We'd copy beyond
> the end of "id" into query, and the later memcmp()s would start failing.
> I think what you want here is:
>
>         strtomem(query, id);

Gotcha, I was operating under the assumption that we needed to know
the size of id at compile time. Apparently __builtin_object_size(_, 1)
will return SIZE_T_MAX if we don't know the size of something. Sending
a v2.

>
> -Kees
>
> >
> >       for (i =3D 0; i < MAX_SLV_ID; i++) {
> >               rsc_hdr =3D &cmd_db_header->header[i];
> >
> > ---
> > base-commit: fe46a7dd189e25604716c03576d05ac8a5209743
> > change-id: 20240314-strncpy-drivers-soc-qcom-cmd-db-c-284f3abaabb8
> >
> > Best regards,
> > --
> > Justin Stitt <justinstitt@google.com>
> >
> >
>
> --
> Kees Cook

