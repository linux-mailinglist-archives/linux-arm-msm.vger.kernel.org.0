Return-Path: <linux-arm-msm+bounces-44891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE86A0BB74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 16:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBE5E188D7DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 15:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FCF229811;
	Mon, 13 Jan 2025 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f67kZsSM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9848B22980E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780872; cv=none; b=QurcLc5vdSOmMTpJEy12lqsUL/dbnAY5cFNgJukR1aWXrj1kK2hp9D/oQ6NJf+4xAXJ/zp4D8h+92taJNfgV52H6T7TD6QKUa9RUJvJ2ZfsPlWeRgC2RD+cbDEodnxtKjkJaKmcdgaDtxA8es/jvojiRvA+JJ1Jllrtm3LLq1LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780872; c=relaxed/simple;
	bh=5wK2BGx//zUz/XNuJSSzKnvYT5PA/aXDXBm8lXWbTas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TG0m6e5qTl9nxnbXEBbVPns/DkKYXmq04v2DO0acWxLWJCp7p3f0QbyhgM+Z0u8sw1nM0G0DkZxGPKdzsyPPqJFqudTHRMOgHyggHKbKBEYIJRCDptMn5CLgXmoOxcJCDuuiOBJIrBBdIOeO/neKWPa7n31wxoCDMSIbL+KHB34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f67kZsSM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54024ecc33dso4600211e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 07:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736780869; x=1737385669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wK2BGx//zUz/XNuJSSzKnvYT5PA/aXDXBm8lXWbTas=;
        b=f67kZsSMeaUGBzPvuWbWy+rUDt9VDzT0bCIRLpzkb06jek27R1xEVWNoHrEUhxNX4O
         iC/eHYSJPoWXWxhmmzMeal8EvRwHqcAT38FeKV6xxnA/znKn7nfTjLxxNkom8FvoMg/d
         iCQ3y59w7/EPPi9gLZsn5RUXyztm7lH//6l+BuvUc++w4LRA63kFL9wb+T4cUUSsBVmj
         ykUXnbMTBO25+eJj1FzdOBXWyecFKgXAKpb/FyrkyndXzqnyUnn6+Hy0R+jJhfNn3CTm
         BTOnkz5GRpiBquloplSZJZCnpOfoqWGhNptrNgafTgsB+p47kXkcN9Gg1ADMeUW0ERpf
         SX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780869; x=1737385669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wK2BGx//zUz/XNuJSSzKnvYT5PA/aXDXBm8lXWbTas=;
        b=fZWQ1Re1B2hI+F8H63Sn4vqe7vxQEIXL+OkbPhtxQLazjEV+Q1kULh+OHBKByt47EE
         s2wDParmjtouc3pmfMfsQqZneJniKxwqreggDlNMP/T97qhgLU0bdYbRsLqN04wgiYQv
         0wzhjXdozG39x8uYYboZNNfrzED4U2eg+E+xUfUwQKiiqWFveWEqeg3qELKmRT3IdNcj
         lEAX1z/F6WnNJOCWLxzC208LFgmFRfV4Lm3qUoW0L+Ol0EupT0qrMwK66IZA2mhSsO2K
         YFWpDQ6Xgi3sjEG6HjfsLLtm5ecmymogAzQL8fvhKNlyVfn1a2sDAkJkJ4ZD0VJYBjXX
         tmaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR41SNGcyVNdhksr+rH/Rm8A7M6ykNbdeND1ibklNNUHg7A8WxQ+Xo8B+GSQBwdJk8j1av4Ue/R926CgNo@vger.kernel.org
X-Gm-Message-State: AOJu0YwmbJgzSfo8nVBEXbnGvzJviVZkKfIAWpWM9Yj/kCFFuhQvXRaX
	E+aGB1rLhnYZT8C0CZ+oG6cA6vefur1C0ljt1W2MfTZHZogQY1mQWESJ+cPiNNNIiPfeb+Msnsj
	H64PNsY/RdsY4MgmTDMsNoGbwQZGsbCp79mZFotslk6a0HbFc
X-Gm-Gg: ASbGnct4HrDslSzuhV1lBtn3/rDe+TQ48KCEbLqBhEOwl2z0B6dmzlkvRbuHRF7/IdV
	LcoNuoc9PLhAYvVAmvUCXCZAAkXOCSZMIylkE
X-Google-Smtp-Source: AGHT+IES3tZBy6Xs2c9tlrWY162TnjF3uWtTrphszdVGsSsqqCXRWdJUrRBTJwefuNL0CvDs1zX4DNXrPFBHB8nhuyM=
X-Received: by 2002:a05:6512:a96:b0:540:1f7d:8bce with SMTP id
 2adb3069b0e04-542845b9744mr5354221e87.38.1736780868642; Mon, 13 Jan 2025
 07:07:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
 <CACRpkdbfckBBW5W5sEvz1LwzdOvTKi_fi7tDu+9nPeKumYkPeA@mail.gmail.com>
 <lkxm6m2u25o4qfvpja7qsldqm7zjxejkn6d5qihyxbg2zvntwh@icvun74e6rll> <y74nrynys7srlwmtfzpjwklfkw33vijrnefjm3iyngn2y35mlz@joqsk74rwl2l>
In-Reply-To: <y74nrynys7srlwmtfzpjwklfkw33vijrnefjm3iyngn2y35mlz@joqsk74rwl2l>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Jan 2025 16:07:36 +0100
X-Gm-Features: AbW1kvYQ4bwujBVNetakHufjq4DsT8RTYbJHLkl_N2maIXPBhXD2T0GN-Pxhbsg
Message-ID: <CACRpkdZ1Joi+UW6EQuatx3Z0P0o+HULjwXB9vaAWOJxdBsNO8Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 6:55=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Thu, Nov 07, 2024 at 04:34:36PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Nov 07, 2024 at 02:55:55PM +0100, Linus Walleij wrote:
> > > Hi Dmitry,
> > >
> > > On Mon, Oct 14, 2024 at 3:55=E2=80=AFPM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > > Follow the ARM64 platform and implement simple cache information dr=
iver.
> > > > As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it=
 is
> > > > limited to the ARMv7 / ARMv7M, providing simple fallback or just
> > > > returning -EOPNOTSUPP in case of older platforms.
> > > >
> > > > In theory we should be able to skip CLIDR reading and assume that D=
cache
> > > > and Icache (or unified L1 cache) always exist if CTR is supported a=
nd
> > > > returns sensible value. However I think this better be handled by t=
he
> > > > maintainers of corresponding platforms.
> > > >
> > > > Other than just providing information to the userspace, this patchs=
et is
> > > > required in order to implement L2 cache driver (and in the end CPU
> > > > frequency scaling) on ARMv7-based Qualcomm devices.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > I added my review tags to the v2 patches, can you put them
> > > into Russell's patch tracker?
> >
> > Done, 9432/1 and 9433/1, thank you!
>
> These patches are still in the patch tracker in the "Incoming" state.
>
> Russell, Linus (and Sudeep, Ard, Arnd), is there anything blocking them
> from being accepted?

I added my Reviewed-by, perhaps rebase them on v6.13-rc1 so
Russell knows it applies cleanly? (It's pretty straight-forward to
supercede a patch in the tracker.)

Yours,
Linus Walleij

