Return-Path: <linux-arm-msm+bounces-112556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8u0yFiPHKWqldAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 22:20:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B1366CBDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 22:20:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZNChPuis;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112556-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112556-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CACF9315F612
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 20:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E000B47A0B2;
	Wed, 10 Jun 2026 20:20:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8776C40BCAC
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 20:20:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781122846; cv=none; b=qe3makF7A3BuGlHSZOYfL+aKnRrG8Wl4BpcJPKe49h9aLA6+Cte/Mqxa4Rg12Waqz7xz9qYJfGYf4bEgPbxjymdzPkYFMJg6gJ77rBaJ7VRmfscBNl4kcy9eAMDpeXrXjL6/JMzZ6D8HQMRoFlPLpaZ+jk4WDGbtgIv9gAUaWRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781122846; c=relaxed/simple;
	bh=w3l3yDnbgm+Zaj+XQNyNJmfkqfafywFr6Cmccn8YRwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZZKQdQtpCywe6vJalb3/H4UbMSl3cLia35SyZySrUhHUojkFN1D0mxvQs1RvVK8rj8CjjrnZ08vapojUJw3ghDReF+JxurIWaJmY0wyXiw4uNDuYIxx3YyXFbHhb65iy1p3+0RoxCyFt9UUpRqYI6Avr5nNZu4fkglsbyTd2zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNChPuis; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C391F00899
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 20:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781122844;
	bh=7MpVecaUgdguCZfjn9ebxCVN59RtMPrEJAnHrmgeaQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZNChPuis+DRqvTb74zzV7UJNQY5CSiP2uU9K9IbZdL07E7PA1aoospdwvIsl5xHEd
	 LpsJNiB15KPwS8Y1qHOsHbckvpCHbuGRCT/fhoLx1XVvVCh762oo2yuohsgd7HIN8T
	 CrLg/RtKeZh669N679G4t0WfjaDwun+ORpp5hf4vjMvqvanUwRJZ38MGpmKT3WDGTi
	 DcGmWEgApgomiDTRxRc4WAo05FpI4MQGFp2X0uukyHF9rVVauOsFPmXZqeRBnPMgOu
	 i21KnUHxXpe3lBNk5Lu+ZfvsWprpVOEWKbiRVfcIBmtKOWTsgs0lgQwJ0g495iRiFV
	 1fPdBKes55kqg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so6940286e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:20:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+VcG0OLjfjX8OY9aDwWXSq505ceZ4Ll1fNsGsXSA+Dn+d2IswDGKVMCFFuKLG+tEH+Uvt+kGqc5vGOVBOr@vger.kernel.org
X-Gm-Message-State: AOJu0YzoeLvtvjGf3jjoDKB+o8o6OlPnnGR01hM44uhRZJaxBeFWd0zB
	7ri9c8lz84qhbu6KDFzsZ/65nHJts/OR3Zn9gLm0i7KHtItS6YkEBcHjPDCLKvv/ELbWOLFZbMw
	2C2v4yVrCEtY/f4fs736DiZOFhGRMW48=
X-Received: by 2002:a05:6512:ba8:b0:5aa:8823:e312 with SMTP id
 2adb3069b0e04-5aa8823e397mr6377779e87.48.1781122843097; Wed, 10 Jun 2026
 13:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780148149.git.github.com@herrie.org> <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
 <a3a6f1a7-5539-48cc-920e-5a555ba04e7f@oss.qualcomm.com> <5umlewznxfu7pmprbvbprsqt5uwjzb666kw5gwdxethpfgur54@mlggwypljii4>
In-Reply-To: <5umlewznxfu7pmprbvbprsqt5uwjzb666kw5gwdxethpfgur54@mlggwypljii4>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 22:20:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLmm6VyFCrxYA14e-Cbj_7dQu1OkkazYiWS_=tSZgCRqyA@mail.gmail.com>
X-Gm-Features: AVVi8CeCLiBaumQSUbgPkZj57tEY-qUT1_X9vl0wjqykeH1ritjqt_KRYleR8XY
Message-ID: <CAD++jLmm6VyFCrxYA14e-Cbj_7dQu1OkkazYiWS_=tSZgCRqyA@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: qcom: add MSM8x60 MMCC driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Herman van Hazendonk <github.com@herrie.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112556-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:github.com@herrie.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3B1366CBDE

On Wed, Jun 10, 2026 at 3:39=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Tue, Jun 09, 2026 at 03:44:39PM +0200, Konrad Dybcio wrote:
> > On 5/30/26 3:58 PM, Herman van Hazendonk wrote:
> > > Add a clock driver for the Multimedia Clock Controller (MMCC) on the
> > > MSM8x60 family (MSM8260/MSM8660/APQ8060) - the Scorpion-class
> > > generation that preceded MSM8960's Krait CPUs.
> > >
> > > The MMCC layout on MSM8x60 differs from MSM8960 in several ways that
> > > make a separate driver cleaner than parameterising mmcc-msm8960.c:
> > >
> > >   - the pix_rdi mux requires a custom set_parent op that temporarily
> > >     enables both parents during the glitch-free transition;
> > >   - the IJPEG GDSC requires releasing AXI, AHB and CORE resets;
> > >   - several rate-source pairs (MDP pixel, GFX2D/3D) only exist on
> > >     8x60 (e.g. PLL2-derived 228571000/266667000 for graphics);
> > >   - the camera CSI / VFE / JPEG / VPE / ROT clock topology lacks the
> > >     later 8960 reorganisation.
> > >
> > > Used on the HP TouchPad (Tenderloin) for graphics (Adreno A220),
> > > display (MDP4), camera (CSI/VFE), JPEG (Gemini), VIDC, VPE and
> > > rotator. Reset IDs are exposed via a separate header so consumers
> > > can reset the GDSCs and individual blocks.
> > >
> > > Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> > > ---
> >
> > [...]
> >
> > > +   .clkr.hw.init =3D &(struct clk_init_data){
> > > +           .name =3D "pll2",
> > > +           .parent_data =3D (const struct clk_parent_data[]){
> > > +                   { .fw_name =3D "pxo", .name =3D "pxo_board" },
> >
> > Please drop .name (the kernel-global clock lookup), this is only a
> > backwards compatiblity measure on existing drivers. For new entries,
> > .index is the best (because well, it's the fastest)
> >
> > [...]
> >
> > > +static struct clk_branch camclk0_clk =3D {
> > > +   .halt_reg =3D 0x01e8,
>
> From msm-3.0:
>
> +#define DBG_BUS_VEC_I_REG                      REG_MM(0x01E8)
>
>
> So, it seems, it is a debug reg, not an actual halt reg (but I might be
> mistaken here, I haven't looked into the details).

I think the define just has a bad name. You have to look
at how it's used.

This define is in msm-3.4 for msm8960, clock-msm8960:
#define DBG_BUS_VEC_I_REG                       REG_MM(0x01E8)
... and then it is used in 10 different places as a halt reg:

$ git grep DBG_BUS_VEC_I_REG *
clock-8960.c:#define DBG_BUS_VEC_I_REG                  REG_MM(0x01E8)
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:                   .halt_reg =3D DBG_BUS_VEC_I_REG, \
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,

and in the mainline msm8960 driver 01e8 is used as a halt reg
in the as well, see drivers/clk/qcom/mmcc-msm8960.c.

Some qualcomm clock registers being named DBG_* has no
semantic meaning, one has to look at the usage. Maybe at
some point some engineer thought it's a debug feature to
be able to halt a clock.

Yours,
Linus Walleij

