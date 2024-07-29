Return-Path: <linux-arm-msm+bounces-27249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C684393F4B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 13:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 797E7282C2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 11:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87853146588;
	Mon, 29 Jul 2024 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sZPfL+x5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC6B13EFEE
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722254323; cv=none; b=MBPvsA1O3inmolHQrYKwio+hXnYSkBKY7IhBJlrfeZcsVzDlPLZBlFZY4xBL0PKWEbDPQ/2gccIXQbliijoBSqGTn1TJmq0I88Mth3x1UkuJGF/tZuMGUC9EUlu2KWdVOlWG17XLHvqPRLPq/3naQLwxhBLnlro+UA+dsW1/COk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722254323; c=relaxed/simple;
	bh=c72EjlqA28dc0cQ+h0l2X7FgfD4mZ+IPBZQ7Qhv91us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0ypYiRPLvoFPRnhZ6D+QWBa5uaTnFmA6pt+6Zu/LkXN48AB35CiVuIVvQjYxyr7DvRSrGHfOYePvCl2yS4kgh6wAdp15wfesFWnLNhkItdbtfAt8pDdJ90a0xYD2+LJhiaQvnTFfDSRJpZYWUrBy3tbfj1/VtqO2mmXBcmLpJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sZPfL+x5; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52f0277daa5so5247967e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 04:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722254320; x=1722859120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5aKXY+rQL013Kd98lZMP0BnWp1j2sIi9Lubv/zV5lc=;
        b=sZPfL+x5CBB7CNCxr1opT0K06MsnJTjIu7R2UJqWqUPr3c08pqx+z7HehfjD0Fjuys
         XwjrCI7HyllyAgmDcUDsBQjNdbyoTgho1V5x+Xv7YXuCVtutIyDNI4k6jqOTDocjo22E
         4iXOqh98MUgDE+TvAfKWOB7B2pH3+/rUcPP1z6u7H/fq13yVkArxZkETbOmXnF+wEPuU
         Mm8Yu7IQOjiXm9fFoq4HZReMjqVyu3Mxf6vZvyffEmXFJ4lAGDLely+jpG14x/AZk6in
         P8x24aLPVCJ/94RC+pyz1dpkYLdbh+JsLAxJlbHa3hm32betvVPt2hhduCHf6T8MyaRb
         Vo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722254320; x=1722859120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5aKXY+rQL013Kd98lZMP0BnWp1j2sIi9Lubv/zV5lc=;
        b=iwZTNN17Xt/jGnhCezhPJ+ixuavCIOuvRZ+qztotdKNso9YeE7/2IKoqx4GKYjV0if
         gWET4yd8+16HSToGDrwRytfGxjtKa6Qab58c8W+AGBbv7GPOEP8qaYau8qXyF/afI1fk
         bjekV7/QgIacsHd0r60Y2/wKW8T53baFbBz8VjENRKe68jQt39bjCY6lM2Vm59WnEeX/
         dnWUnSVkGj1WZRlis5okmT1zJUnmQeusf1PJ/di82i4Jfq5yA6cTVrT73uzwjKbmeI8J
         HE42ynfV0RHi7UC+FG3FlmXnVeVdDnX2TTkBBcyLXQhcL7Y66RuK4nPopGxFBp7Ou7mG
         g8EA==
X-Forwarded-Encrypted: i=1; AJvYcCVWmdFk1KLlCMKL6a+QrB/O5d5//+rkEN0ret4rEhPKfoHlR7eZvmXsDeHELsEcqdowByRflZsN+l/f24TJrUfpOgISkvkqw0yvLTxrBw==
X-Gm-Message-State: AOJu0YyOTQBTJmyCivtIu5VZICDlP6HJFezh0rKhX4aWpx0blRb7ZzoR
	hLpROWmIcB2LoaytNVmyx+uTihfqX9a4lShn7gAIzVUq7XZCMijU0aVLS1w3MsTGdqb9KRDFCQM
	aQM/8F27Xt8zgChkt+NAl2wuHVreCOJ91yItVYA==
X-Google-Smtp-Source: AGHT+IHHG7LQv3D/QMCXMSd2qTDF+4AQ+9sT9jnNdxu3pbyDekRAZRSxu1fvZL/uwPOmcaZy06nbOqUENU6gObECHpY=
X-Received: by 2002:ac2:5597:0:b0:52e:fa37:f9ca with SMTP id
 2adb3069b0e04-5309b27231cmr5295449e87.22.1722254319298; Mon, 29 Jul 2024
 04:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <su3wp6s44hrxf4ijvsdfzbvv4unu4ycb7kkvwbx6ltdafkldir@4g7ydqm2ap5j>
 <aa9d6aec-ef94-4137-b2ff-0c86d9a92d42@molgen.mpg.de> <CAA8EJpqGXe0A0yDpEP==60k-bPEbDORpLUtsiPvGSi+b_XphAg@mail.gmail.com>
 <CABBYNZJP2c4L-nFHtug0isqnKPR+Q0CE09o_ACsPLobjLpHtcg@mail.gmail.com>
In-Reply-To: <CABBYNZJP2c4L-nFHtug0isqnKPR+Q0CE09o_ACsPLobjLpHtcg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 29 Jul 2024 13:58:27 +0200
Message-ID: <CAMRc=McB1hY+Lad-gBj9-_Ve2OeW+rXaRqHL2xO4zDPMRD41jw@mail.gmail.com>
Subject: Re: btqca: crash with linux-next on bt power down
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Marcel Holtmann <marcel@holtmann.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, regressions@lists.linux.dev, 
	Zijun Hu <quic_zijuhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 1:56=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Dmitry,
>
> On Mon, Jul 29, 2024 at 12:01=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > #regzbot: introduced:
> > 973dd9c4db4746200f88fe46e30eada7054fdbea..84f9288208dfcd955446060a53add=
15b9e01af4e
> >
> > On Mon, 29 Jul 2024 at 13:21, Paul Menzel <pmenzel@molgen.mpg.de> wrote=
:
> > > Am 29.07.24 um 04:11 schrieb Dmitry Baryshkov:
> > >
> > > > On Qualcomm Dragonboard 820c (APQ8096, QCA6174) soon after the boot=
 I
> > > > observe the following crash:
> > > >
> > > > Unable to handle kernel NULL pointer dereference at virtual address=
 0000000000000018
> > > > Mem abort info:
> > > >    ESR =3D 0x0000000096000006
> > > >    EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > > >    SET =3D 0, FnV =3D 0
> > > >    EA =3D 0, S1PTW =3D 0
> > > >    FSC =3D 0x06: level 2 translation fault
> > > > Data abort info:
> > > >    ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D 0x00000000
> > > >    CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> > > >    GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> > > > user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000010da63000
> > > > [0000000000000018] pgd=3D080000010da62003, p4d=3D080000010da62003, =
pud=3D080000010da61003, pmd=3D0000000000000000
> > > > Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> > > > Modules linked in: hci_uart btqca
> > > > CPU: 2 UID: 0 PID: 66 Comm: kworker/u19:0 Not tainted 6.10.0-next-2=
0240726-13923-gd3ce7ebd61f9-dirty #2722
> > >
> > > I am unable to find the commit. Your tree also seems dirty. What is t=
he
> > > last working commit?
> >
> > Checked the commit range on the linux-bluetooth branch, hope this helps=
.
>
> Im currently traveling so it would take some time for me to
> investigate this but I suspect it could be some of the changes
> introduced by Bartosz with power sequence, @Bartosz Golaszewski
> perhaps you can help?
>

Hi!

I just came back from last week's vacation to a bunch of different
regressions. I will get to it but it may be later this week.

Bart

