Return-Path: <linux-arm-msm+bounces-24772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEEF91D901
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 09:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AFF41F21D11
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 07:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4705028C;
	Mon,  1 Jul 2024 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="J2jRLiee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13187376E6
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 07:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819243; cv=none; b=WnWCt6gqPNuL0iD6RQ92rSMy5DYzc1km1CthbIvsh5sUJ7JLjyZ+DdD9edCx/2jzMd0Gfkuz40qLxWIGUbSkJFY4LxpQmb0rmIINFpGJs+JsrmDy4MxCY4q1SL/wFFEStfOEZVgyNC7d8XlAktUoFjQ1dkF6AeFi6vMMF2GK0Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819243; c=relaxed/simple;
	bh=eZsMjIZhDuPAksSPMbB5+rRUCtL8QcyCA/PNWz9K4Qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q1Gy/UD7a1vTbOJdAJC0MV4WtClDmIcUiTHUBxeYf+gX+caxHr6ZzYv5+FkgXIAdU4BMM2u/pdx8RMUbntiKX+5h+9TywXTJXPoUVWUEYt7/GkA2vaikYQSnD/60VtaGHT6hi16aBu0xh8ju6PYiu+ydhVcFKKUSExZuQQghq6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=J2jRLiee; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec5fad1984so36478691fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719819239; x=1720424039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGnaHuY/UYIawLKptXg5wA64lSgFUEpMdtAJsEUQQL0=;
        b=J2jRLieesVcI/v3IBiJV35yyA3kTNxHQ31yKaA/q+kpq0W6ofXq/2pxYyjECAbObpr
         J7GjnB4nJC2SSYqHGyXKOmuCeJTBWUI43AVkPfGiopdhD8DCE2KsK5toMw3BJAFeokty
         OXOhm58MMUnExd7j/8Qkxitx3qVVpBT+lh5rf9r/RsroMbSrsqDVN67VBVVWvEUtq/oJ
         nWc1fwUrYSfCym1WOKRtRqhXB6rmypLDhP84rrlWeuA2CcMuRAJDc0RTteMXq0i0ySZe
         tFhOy5tv0rsmnLIJjS01T3OW1zRBkbPZUAcsQAYh3cD2PQLX4XvUQ6goVSkbmrTQak2+
         tv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819239; x=1720424039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGnaHuY/UYIawLKptXg5wA64lSgFUEpMdtAJsEUQQL0=;
        b=CnuqlVPNeQoavSyXrO08SlkLUoyyJ0MsI8zv1VzWvg8NhgKpz6apbn6fXuu3uolvpr
         LF3eLArbgwslcIO3H11dFIqpeyWnsXqXekxQi9zDVXK1sUTjKVOfNnc0pSqo5WGq2SGv
         3mCYd1ZIzO7vzNY9WXX7T03WzSVAvhuuadRSCdR0pYqBc4OmYM2gMxK+O2eEu7u6eAeS
         MRRF5RBfBfjQduVpk3ckGfXRrq9q6ac/Ryl3kDd0rlhlujgIxM0BCr56z4IR2kTxObU1
         AqjwQQ8+7RjHRo/tXkiWXCZ5y+RwGE6b54k6HUTd6XW6V6WNHBmW0KorR3YlxwcOxomg
         I/CA==
X-Forwarded-Encrypted: i=1; AJvYcCXIIJmvGtUpDr6We3eosNsPhzUSDsfTUzAcwN8tbwr9MKgDAS5CccUDRw28QSkUEM0SiLeOWnACs+9jlBmdhS0GE1IT1tYlUCJmeds0jg==
X-Gm-Message-State: AOJu0YzS6h4bdtUkfUXvxlozwZHx0flvNVJDzslFXb3KApVKCtBOHSF7
	k06ogXQR3hPc2ABpiPG+2D2cI/16iKqT0pGHIySALUgxU5RQVav/mCJcQ3aVbFN2LyvxdVOasaD
	vYcX8VmuR3Q7czQ4DQ07UZu1XKWfh0FUe4HieQZ8zLqC+w2egGhA=
X-Google-Smtp-Source: AGHT+IFZ3XxeN71lww9NC0DG+IOMdkmXvd+56jLZTVfxUnDmNNaMUdKKc2sk6skBQksAT62FrN/QAiIUHt+mXlr4aWw=
X-Received: by 2002:a2e:a5c4:0:b0:2ee:5ec1:1838 with SMTP id
 38308e7fff4ca-2ee5ec11928mr45421871fa.30.1719819239028; Mon, 01 Jul 2024
 00:33:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9d1156b9-cdf1-44be-b65d-45b17c0b681e@gmail.com>
In-Reply-To: <9d1156b9-cdf1-44be-b65d-45b17c0b681e@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Jul 2024 09:33:47 +0200
Message-ID: <CAMRc=MczeH+ptirFQpFi968m+-4RoABa43M5VQUx4guZTZxLSw@mail.gmail.com>
Subject: Re: [PROBLEM linux-next] ERROR: modpost: "devm_qcom_tzmem_pool_new"
 [drivers/firmware/qcom/qcom-scm.ko] undefined!
To: Mirsad Todorovac <mtodorovac69@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Build System <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 8:27=E2=80=AFPM Mirsad Todorovac <mtodorovac69@gmai=
l.com> wrote:
>
> Hi all,
>
> In vanilla linux-next next-20240627 branch, there seems to be a build err=
or with
> KCONFIG_SEED=3D0x44AB31A6.
>
> The error log is:
>
> ~/linux/kernel/linux-next$ time nice make -j 36 bindeb-pkg |& tee ../err-=
6.10-rc5-next-20240627-29.log; date
>   GEN     debian
> dpkg-buildpackage --build=3Dbinary --no-pre-clean --unsigned-changes -R'm=
ake -f debian/rules' -j1 -a$(cat debian/arch)
> dpkg-buildpackage: info: source package linux-upstream
> dpkg-buildpackage: info: source version 6.10.0-rc5-38
> dpkg-buildpackage: info: source distribution jammy
> dpkg-buildpackage: info: source changed by marvin <marvin@defiant>
>  dpkg-source --before-build .
> dpkg-buildpackage: info: host architecture amd64
>  make -f debian/rules binary
> #
> # No change to .config
> #
> mkdir -p /home/marvin/linux/kernel/linux-next/tools/objtool && make O=3D/=
home/marvin/linux/kernel/linux-next subdir=3Dtools/objtool --no-print-direc=
tory -C objtool
> mkdir -p /home/marvin/linux/kernel/linux-next/tools/bpf/resolve_btfids &&=
 make O=3D/home/marvin/linux/kernel/linux-next subdir=3Dtools/bpf/resolve_b=
tfids --no-print-directory -C bpf/resolve_btfids
>   INSTALL libsubcmd_headers
>   INSTALL libsubcmd_headers
>   CALL    scripts/checksyscalls.sh
>   UPD     init/utsversion-tmp.h
>   CC      init/version.o
>   AR      init/built-in.a
>   CHK     kernel/kheaders_data.tar.xz
>   AR      built-in.a
>   AR      vmlinux.a
>   LD      vmlinux.o
>   OBJCOPY modules.builtin.modinfo
>   GEN     modules.builtin
>   MODPOST Module.symvers
> ERROR: modpost: "devm_qcom_tzmem_pool_new" [drivers/firmware/qcom/qcom-sc=
m.ko] undefined!
> make[5]: *** [scripts/Makefile.modpost:145: Module.symvers] Error 1
> make[4]: *** [Makefile:1886: modpost] Error 2
> make[3]: *** [debian/rules:74: build-arch] Error 2
> dpkg-buildpackage: error: make -f debian/rules binary subprocess returned=
 exit status 2
> make[2]: *** [scripts/Makefile.package:121: bindeb-pkg] Error 2
> make[1]: *** [/home/marvin/linux/kernel/linux-next/Makefile:1555: bindeb-=
pkg] Error 2
> make: *** [Makefile:240: __sub-make] Error 2
>
> real    0m5.950s
> user    0m15.971s
> sys     0m10.430s
> Fri Jun 28 20:22:03 CEST 2024
> ~/linux/kernel/linux-next$
>
> Please find attached .config, just to be sure that we are talking about t=
he same thing.
>
> Best regards,
> Mirsad Todorovac

The fix for this is in the qcom tree[1] but I'm not sure why it still
hasn't been pulled into next. I don't see any notifications about
conflicts in next which could be the reason. Cc'ing Mark and Stephen.

Bart

[1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?=
h=3Dfor-next&id=3Dd96377892dd89bd4e7e5ae7293647f6bc7bddf7d

