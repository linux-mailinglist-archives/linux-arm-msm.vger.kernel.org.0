Return-Path: <linux-arm-msm+bounces-14606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470B880695
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 22:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58DE81C21F84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 21:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E043D0B8;
	Tue, 19 Mar 2024 21:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BrMm7b+p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25D239FD1
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 21:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710882639; cv=none; b=OZ6CQPxykCEf1ok4RkCwFXYEPkgJXjG6pCCJW7knfPO+Gv7cuTJnqJWntuOcM2ZQP0+VSBR+v8srS5bIy12Y1sD5fYBX3YUnaNQHHzliio+xNRliqf6zqq+HqcNqYAxyvEeKz1Mjm2Hb2eC+tgoFX77GfLNW71z80TGjo+/gTvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710882639; c=relaxed/simple;
	bh=Bg5O22U75rqlMnX/ePS1zsGUIyjtYU5uXFU+wKROdF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOqwhCB2HDyAbnA5OboGV+g3qe4PIRDxdIdZZIP5+M+B2zGa3nQcfMBTYI/UwHBhKZjoTjyxh5Qy6nlEdqJ5TzEjQhwJNRdhbphyhCDdhNE+Mb9+90Mz/a0EWXNFhSG/4forCIfWuI8tjDNXZ5Z/lmFBPlu104gTAZw4v3vA7Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BrMm7b+p; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5687e7662a5so7915900a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 14:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710882636; x=1711487436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXyTHdBINJAGv5SDzujCKegsUk6ZlTJU8rXZcTRQcWI=;
        b=BrMm7b+pPY7gBn2+/DxekGmJpA++PAtwN++AgCi4JvZIczPsYFKAkAKMAtHOwsi+OK
         6wzLPFm8J11iRtGyMWdIQ/ZfCH9z9OmT4vhF+VneGjhj36mljoVVYTEpIVazjTTZeqzZ
         ff9buetMPWFk6wRJdyNx5f9acC+TOPXjhgfwP6fiaEklblVk8BBa1hhVhhp9qtyraidE
         O8/RXJWxBuMyqIQm89MsBAMK+jEXEfE6a7oQGNokKbmdiyAbkcYcuwAmR/pkEXFxL+OT
         FjycS8bAMWdA0MX2sApUkQfM01T362u/FY9V4CUysPpHYLJ8YwLNbvLJnlWPJFvRCcps
         1aAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710882636; x=1711487436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXyTHdBINJAGv5SDzujCKegsUk6ZlTJU8rXZcTRQcWI=;
        b=Eza0wzwRrNW2/XAx6AeKfE7pOHt1kP4jjlGG/h9Dkrv3nVDy7g37RQjb0e5eNzp/ze
         j54wylKVV0DvwfIBl3CJy2ED0A09Vq3yxBvBw6n8DH1e2eM2MkKv+KiVFdJZL5SgAFDj
         Vfu2suPO0E4GL569ETap6+LfeNVgykF0w10lniuZi43LNOYxkonlaqFrv8Rpd5fH4S+W
         vRKVW5RcjZB26LlDz7Ql/l4cfnxgBw7AiuqUQfAGfUM6dqJp+ZudDEiwLuBCpz0faUHQ
         UtmREtYrMIKusGbFb1PrMiauvQsOwjzwPlHPPVenVnRlCBzfPTP2cMqBshcFdhfYwshw
         OuYg==
X-Forwarded-Encrypted: i=1; AJvYcCU/EQXoNTK1bEEvJ78/P9mm9k1nZktyXVCwcuBw5PAFgRih0ryN2gOmnTxAe2F73hCy0zwBRGU0OwQyq3wZIlNyzdDyTMCoDlULrMLRZw==
X-Gm-Message-State: AOJu0Yw3XNtqM+yai1PH5SApONgXU4mu9C5l/vMeu4JXoCRd6/5hn9Ff
	KHUeuoZuPD8ogAR9gu26TlVKZoudixN0JIZeszVT8Cg7TmmacchUh0n0uk6IY/tQlhtgRVG91qa
	gJnluACul4D36CcR8YTzQJqOFdsMTxIAc6+Fy
X-Google-Smtp-Source: AGHT+IGZHztom/M+JF3mlrAUh1Z4cKu8I7AIhJ/SwhbjcbH/ma1t+dETJuBHN07scTHpDNQJBFnGGFxqx2fwYUfODPE=
X-Received: by 2002:a05:6402:4313:b0:56b:989d:bdce with SMTP id
 m19-20020a056402431300b0056b989dbdcemr2132942edc.24.1710882635868; Tue, 19
 Mar 2024 14:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-strncpy-drivers-soc-qcom-cmd-db-c-v2-1-8f6ebf1bd891@google.com>
 <ag7oslzfcuiyuehxq5n5jth4adrhel4xafby5whxsvyybbm6dc@6rtwaolbmm45>
In-Reply-To: <ag7oslzfcuiyuehxq5n5jth4adrhel4xafby5whxsvyybbm6dc@6rtwaolbmm45>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 19 Mar 2024 14:10:23 -0700
Message-ID: <CAFhGd8rdd=qmAmax27gvExZ5sweC=porkS6dW3RJh7NV1ydjSw@mail.gmail.com>
Subject: Re: [PATCH v2] soc: qcom: cmd-db: replace deprecated strncpy with strtomem
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 18, 2024 at 8:37=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Mon, Mar 18, 2024 at 10:49:23PM +0000, Justin Stitt wrote:
> > strncpy() is deprecated for use on NUL-terminated destination strings
> > [1] and as such we should prefer more robust and less ambiguous string
> > interfaces.
> >
>
> I don't mind changing the strncpy() in this function, but I don't think
> this problem description adequately describes the problem you're
> solving.
>
> If the motivation is that we want 0 users of strncpy() in the kernel,
> then say so.

Fair. You caught me in a bad case of "copy pasting this blurb into all
my patches". You are right though, the true motivation here is to rid
the kernel of strncpy.

>
> > @query is already marked as __nonstring and doesn't need to be
> > NUL-terminated.
>
> You're not wrong, but in the event that strlen(id) < sizeof(ent->id) the
> destination should be NUL-padded - exactly one of the well known,
> normally unwanted, effects of strncpy(). strtomem() does explicitly not
> do this.
>
> > Since @id is a string, we can use the self-describing
> > string API strtomem().
>
> "self-describing"?
>

In the sense that its name matches its functionality:

strncpy    =3D=3D=3D string to string copy, bounded by n

strtomem =3D=3D=3D string to memory buffer

strncpy technically does the latter functionality as well but it may
not be obvious in all cases that the destination buffer is not a
string. Granted, in this case, it is extremely obvious what the
behavior is because query is marked nonstring.

> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#st=
rncpy-on-nul-terminated-strings [1]
> > Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en=
.html [2]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> > Changes in v2:
> > - use strtomem instead of memcpy (thanks Kees)
> > - Link to v1: https://lore.kernel.org/r/20240314-strncpy-drivers-soc-qc=
om-cmd-db-c-v1-1-70f5d5e70732@google.com
> > ---
> > Note: build-tested only.
> >
> > Found with: $ rg "strncpy\("
> > ---
> >  drivers/soc/qcom/cmd-db.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
> > index a5fd68411bed..d05f35d175bd 100644
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
> > +     strtomem(query, id);
>
> query needs to be NUL-padded to sizeof(ent->id) bytes (like strncpy
> does), something you recognized by adding the zero-initialization above.
> But why split this requirement across two non-adjacent lines? Isn't this
> what strtomem_pad() is supposed to do?

Yes, strtomem_pad() will accomplish this task. I'll send a v3 fixing
up the commit log and use the pad version.

>
> Regards,
> Bjorn
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

Thanks
Justin

