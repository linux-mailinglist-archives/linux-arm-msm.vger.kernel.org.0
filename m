Return-Path: <linux-arm-msm+bounces-5303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AD8817EA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 01:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7F5D1C21CE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 00:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1926B388;
	Tue, 19 Dec 2023 00:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F7FHysuA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861877F
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 00:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5533ca9cc00so2600276a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 16:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702945030; x=1703549830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JM5ylgqBLcPuH5x3r6R3EPG/KxNGj71rAVmMmJtjGd0=;
        b=F7FHysuAICM5fNHxeIQdCByittbrsoMzv3zNq5KwuvYLqZMQI0LbtLZznJjSJX6KyQ
         cVRL5nQfT6oyEDgeZUbRvyloBVIc7QDzE+XH3agyMVkwbf9FBrCUp9mQ3MhRZ0a/hnOv
         JWlBLldoj/54wBm0a5VPT5BTO8R1WLwzj3D2ikWEVRf1gTUzR36gQt5JmcxRdByJ4XWw
         vEtifMcpOe0OJjv09USZKXx03h8JPXiVec6l1zx/Z6enfNYKnBDeQLiHjo1ZmzHtelxf
         b6eFNJRep9BBn8JlkmwN99x0LC1NMxrKDjvtOZiHWN37T5MQstzH95HsaMHl7cAynDbx
         SMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702945030; x=1703549830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JM5ylgqBLcPuH5x3r6R3EPG/KxNGj71rAVmMmJtjGd0=;
        b=gfxYxPOK9W/dlKl55xfvL4ttaIECGPAdw9PrVjCbJWBXgZd7PwgzW44oi1XAOH4luN
         eYtdwb9jrebRU2mQpokun+f44EAYLl2Ano0J54+HfacmlodBNLgwZ/rzc3zxLkWt69Fy
         CxTzZpPObVGIY0coi0ciEk7PcWAliTHf6RJUYAZGgCFDOPRutOrFr3FNrzyxaY/BB2By
         Xn7MSx9L4Kc6FppTqt5oXIf6kl6lNFBmR2esIDcloz6gtofySCqTqBv2YAtMIbzkygiD
         2NmDOQVGxPSj7Pj0tbeKivfURI5aMXarSVvdirZC4tTIHb1ERwiWYMZg29+BgAOgwvwK
         GpsQ==
X-Gm-Message-State: AOJu0Yz/mQ2RXUfOYxyU0bd/6vBxEVzPL6VddBqnRlHjNyJfjBWabQtp
	g5DNLNyH+mSS2FHUux1QNQPGDC345C6j2rGKT62Hlg==
X-Google-Smtp-Source: AGHT+IHTkj4wbBJaWsp2RAA9MlsFe5fN5XYNWo0GybVsC2/lxYuAZDSf3ZVS/zQOBZLTUJK49QY1vuDUBa+8TphmpvQ=
X-Received: by 2002:a50:c2ca:0:b0:552:8605:d6d1 with SMTP id
 u10-20020a50c2ca000000b005528605d6d1mr4149710edf.64.1702945029765; Mon, 18
 Dec 2023 16:17:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231215-llvm-decode-stacktrace-v1-1-201cb86f4879@quicinc.com> <CAKwvOdmY=Jysqai3KOYO8+c5idP9JjNGKL2xZn2sDNdj5MjTVA@mail.gmail.com>
In-Reply-To: <CAKwvOdmY=Jysqai3KOYO8+c5idP9JjNGKL2xZn2sDNdj5MjTVA@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 18 Dec 2023 16:16:57 -0800
Message-ID: <CAFhGd8qA8Hh63iZPP33Nsxu61OycP7oqT50mDgUO-HFNUWHZxQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/decode_stacktrace.sh: Use LLVM environment variable
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, Manuel Traut <manut@linutronix.de>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 18, 2023 at 8:37=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Dec 15, 2023 at 10:27=E2=80=AFAM Elliot Berman <quic_eberman@quic=
inc.com> wrote:
>
> This patch looks familiar...
> https://lore.kernel.org/lkml/20230929034836.403735-1-cmllamas@google.com/
>
> Masahiro, can you please pick up that patch?
>
> Elliot, Justin, can you help test/review that patch?
>

Interestingly, I am getting good stack traces on mainline with a
LLVM-built kernel -- both with and without that patch.

It may help others, so I'll go to that patch and add my tested-by.

> >
> > When using LLVM as the compiler, decode_stacktrace should also use
> > llvm-addr2line. Check if LLVM is set and add the appropriate
> > suffix/prefix.
> >
> > Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> > ---
> >  scripts/decode_stacktrace.sh | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/decode_stacktrace.sh b/scripts/decode_stacktrace.s=
h
> > index 564c5632e1a2..189b00f4e120 100755
> > --- a/scripts/decode_stacktrace.sh
> > +++ b/scripts/decode_stacktrace.sh
> > @@ -16,6 +16,16 @@ elif type c++filt >/dev/null 2>&1 ; then
> >         cppfilt_opts=3D-i
> >  fi
> >
> > +if [[ "${LLVM}" =3D=3D "1" ]] ; then
> > +       addr2line=3D"llvm-addr2line"
> > +elif [[ "${LLVM}" =3D=3D */ ]] ; then
> > +       addr2line=3D"${LLVM}llvm-addr2line"
> > +elif [[ "${LLVM}" =3D=3D -* ]] ; then
> > +       addr2line=3D"llvm-addr2line${LLVM}"
> > +else
> > +       addr2line=3D"${CROSS_COMPILE}addr2line"
> > +fi
> > +
> >  if [[ $1 =3D=3D "-r" ]] ; then
> >         vmlinux=3D""
> >         basepath=3D"auto"
> > @@ -169,7 +179,7 @@ parse_symbol() {
> >         if [[ $aarray_support =3D=3D true && "${cache[$module,$address]=
+isset}" =3D=3D "isset" ]]; then
> >                 local code=3D${cache[$module,$address]}
> >         else
> > -               local code=3D$(${CROSS_COMPILE}addr2line -i -e "$objfil=
e" "$address" 2>/dev/null)
> > +               local code=3D$(${addr2line} -i -e "$objfile" "$address"=
 2>/dev/null)
> >                 if [[ $aarray_support =3D=3D true ]]; then
> >                         cache[$module,$address]=3D$code
> >                 fi
> >
> > ---
> > base-commit: 3f7168591ebf7bbdb91797d02b1afaf00a4289b1
> > change-id: 20231214-llvm-decode-stacktrace-09538979006d
> >
> > Best regards,
> > --
> > Elliot Berman <quic_eberman@quicinc.com>
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers

Thanks
Justin

