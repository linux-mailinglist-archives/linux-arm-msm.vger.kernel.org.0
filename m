Return-Path: <linux-arm-msm+bounces-32152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F7A97DED7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 22:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C574A28180A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 20:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62763A268;
	Sat, 21 Sep 2024 20:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="VMweyhgG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A9A1392
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 20:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726951452; cv=none; b=V7s5TxbBNzOFP/EAGLGgYLXkh33NBRr3JvqUWkYhnZ+itiS00eUR7F9WbP0trHMYs1+X44+yo4mtT/6HwYHb6cFxx+mqViP1I92hxRVGj0IhpRfgTe54avS/H5KZo6jPn/iQzTWMoZUraEIgKnRrYcaHuVOifdJR0Eh8gxjthek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726951452; c=relaxed/simple;
	bh=v4KBetdb6AtdZ2ic6A7wa5nRc9Kb1ckYYVYf1Q43Qf8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L6owkm/cmiwPErE1vBx3yDRWk5Mv9PDCiJJZ58MQaXesXK1wEjeCZ3xHLQ7OPG+eN7UPCp+vRXF/zS8R+PhqGB52XdpbLb9+bm2r11TAVWuLbDnLRa09EWms0NRYkqidTMsQznmGdJ+WAL5kHkDegmQROy+ff/PFNAX4BhePZEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=VMweyhgG; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726951448; x=1727210648;
	bh=v4KBetdb6AtdZ2ic6A7wa5nRc9Kb1ckYYVYf1Q43Qf8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VMweyhgG9nbUDAdTE2DkSWxSDlBMPcE56zH2P8t6qVRL0SchZT9H5DS0KbVSA5SdO
	 x/eEFNHanHaTgqxOqv7T4SHr2sde3ZkMoSPRRcY78J7Q7i9N47oVLf4PapqB+RRCn0
	 N2A2ZU03Vg1SNoNe4qKgJ3iR1MhCFcPwLg0m1cJKj+vPXj3+SfFeB1xONG53FYEyk5
	 mvQh9yt6xemQgxwsZG9ksx+nJ9ItAcbB7xHGDvOgta51Edn70an6YAmCz/P5X5Zvex
	 3Q6ZPwWZqADOPRsA5szZMR2XUbcuyTwoC+Cvss35AVeH/lCHP3q7jWelwF/JWHrbvs
	 zwbcr4cc9bYag==
Date: Sat, 21 Sep 2024 20:44:04 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: John Schulz <john.schulz1@protonmail.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/2] Changing Ardreno X185 Check to X1xxx Family Check
Message-ID: <atv82owbRaQefTwm8Zu9eNtRGoFKjx-t1rLO-Ni0cZIc1Xt-rRpUpV46E3eVZB-OOR5Uw1-kpAISiISw0Wpd97thi1klJguazfDqkCVF5d8=@protonmail.com>
In-Reply-To: <vhuac7ac4stqkqq6wfw5lx7ftalphmmfuiytkm4etydoy7nu3m@uxs475wlm4ca>
References: <eXTmCkW-1fFjQPMz9pDuTV6stWYM2-k_vUP8hhFhSQGIVNAITUWcadIMLvtpufgBOIUY4S8RYGU-vSxIEehZknZv9n1tnS2ivaSvUSyQpGQ=@protonmail.com> <vhuac7ac4stqkqq6wfw5lx7ftalphmmfuiytkm4etydoy7nu3m@uxs475wlm4ca>
Feedback-ID: 15150580:user:proton
X-Pm-Message-ID: 4d16f44e3f2157013c03194f4f4f085659992ca1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Thank you for your insight and my apologies on messing up the first one. I =
have submitted a fixed one that uses git and send mail.=20

Thank you,
John Schulz

On Saturday, September 21st, 2024 at 3:27 AM, Dmitry Baryshkov <dmitry.bary=
shkov@linaro.org> wrote:

>=20
>=20
> On Sat, Sep 21, 2024 at 01:03:00AM GMT, John Schulz wrote:
>=20
> > Hello,
> >=20
> > First time submitting a patch. As work is made towards integrating more=
 QCOM X1E and X1P SoCs, using a family identification function seems better=
 fit than checking individual devices.
>=20
>=20
>=20
> Please use git commit and then git format-patch / git send-email to
> format and send patches.
>=20
> Commit message is not an email text but rather a patch description. It
> should explain why you made the change.
>=20
> Patches should be atomic and non-breaking. E.g. if I pick this patch w/o
> picking up 2/2 build will break. We frequently use git bisect, which
> means that (ideally) after each commit the kernel should still build.
>=20
> Last, but not least, your patch misses DCO signature.
>=20
> Please take a glance at Documentation/process, especially
> submitting-patches.rst.
>=20
> > Thanks,
> >=20
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 06cab2c6fd66..34ca8f6d5d99 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1026,7 +1026,7 @@ static int hw_init(struct msm_gpu *gpu)
> > gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
> >=20
> > /* Set weights for bicubic filtering */
> > - if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) =
{
> > + if (adreno_is_a650_family(adreno_gpu) || adreno_is_x1xx_family(adreno=
_gpu)) {
> > gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
> > gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> > 0x3fe05ff4);
>=20
>=20
> --
> With best wishes
> Dmitry

