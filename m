Return-Path: <linux-arm-msm+bounces-5458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC21819215
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 22:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 526F81C25140
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 21:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E426A3B198;
	Tue, 19 Dec 2023 21:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EmG88mQE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CB03B18A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 21:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-54bf9a54fe3so6215286a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 13:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703020366; x=1703625166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7lbvJCDJ1XM7ZPTdVewOcxLLbPIBuDKo8DQQNb5RJs=;
        b=EmG88mQEaVlToJsv8oySfUlCstcuErd2hDiAR3rMOdHzsGTm2u8aFS1xzO0mIJp6uj
         uH+c8/Er86pw5qvvQ1bh8p6iE9/bgt0132tQhWWSVSHyLPHR7/mDHKiNFjHT/jA2dUzP
         3Q2U+AJIPctTpKko6kTxVztEnmC+1PnBPkdqlVN+406VEFmAddt0UhPBa3Af/IVc0lAw
         CCDjUa3vgtwkYajThyE2C+y2BdsgyQi5MZ7x9SDXRSQZXUwYAEoXcTzD0GKoldpRAbu5
         lD9uFjOl8arnTfNkv63FDlBeBQeDxwpDNVqF4WaN+PHCHRoANBe0Z9Ph6oD4uuGi+16L
         oy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703020366; x=1703625166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7lbvJCDJ1XM7ZPTdVewOcxLLbPIBuDKo8DQQNb5RJs=;
        b=kHR4O5PANqBn4oibAp02mlsUn4AF5YOw1pOTGktKotjC800GJkKZS7RAipJdLS3oPz
         REamq2RvkrSgSPPSA8X+mG1vXfrYXFkvmG5P2u3KyWXWIBcdFNEWOgRvlzlVi+thIdfE
         RDAjAv/9rW8hliK1ae4ogIH+8Jr6r+tbUYo7JI3HpXLn63yCfzFoLm2vw8KmoUZTwE3w
         qPYTgGdq6Sod0m8Yffo++mfGuZ0CYJe1z50vjF07AY3YlMq/p+CfuOFHYWtkRw2PrpGX
         IGMf5m5Js0pE9O9Ec+h3nBpif+FmMtSfQqn/MH84cr/PnfQjPwT11pob5vYxjrDJ+A7H
         4j7w==
X-Gm-Message-State: AOJu0YyCZZQ3+n2BFj3WFVQCIBW4MjUAwRDwx2zC/rKSTDXr3gLnKSVv
	UCw5MQUB5XWbVAGKOoeN4vX6BmEKv0KJ8TGZikbBYQ==
X-Google-Smtp-Source: AGHT+IGx3h05PGeb3Es3OTmJpYxj0l2+kg87lc3hinLRFIMaFFOHpmYvxSRHlQSv9b2PFZtnDZ8q60mGJ1mZ6DK6CzA=
X-Received: by 2002:a50:c209:0:b0:552:85f4:ed39 with SMTP id
 n9-20020a50c209000000b0055285f4ed39mr4588788edf.38.1703020366584; Tue, 19 Dec
 2023 13:12:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231215-llvm-decode-stacktrace-v1-1-201cb86f4879@quicinc.com>
 <CAKwvOdmY=Jysqai3KOYO8+c5idP9JjNGKL2xZn2sDNdj5MjTVA@mail.gmail.com>
 <CAFhGd8qA8Hh63iZPP33Nsxu61OycP7oqT50mDgUO-HFNUWHZxQ@mail.gmail.com> <CAKwvOdmMCmcHVd7+ymKgVUe5uZrSvUYMaD9Fz5GSBtHBMPTnSQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmMCmcHVd7+ymKgVUe5uZrSvUYMaD9Fz5GSBtHBMPTnSQ@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 19 Dec 2023 13:12:34 -0800
Message-ID: <CAFhGd8q80F8kvigHQ1Njf3=KzPsahjy+oRTS_QRz6E6ujsSU5Q@mail.gmail.com>
Subject: Re: [PATCH] scripts/decode_stacktrace.sh: Use LLVM environment variable
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, Manuel Traut <manut@linutronix.de>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 8:49=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Dec 18, 2023 at 4:17=E2=80=AFPM Justin Stitt <justinstitt@google.=
com> wrote:
> >
> > Interestingly, I am getting good stack traces on mainline with a
> > LLVM-built kernel -- both with and without that patch.
>
> Probably because:
> 1. you have GNU binutils installed.
> 2. you're not testing .o files from an LTO build (which GNU binutils
> cannot decode).
>

Yes, and yes. Makes sense.

> --
> Thanks,
> ~Nick Desaulniers

Cheers

