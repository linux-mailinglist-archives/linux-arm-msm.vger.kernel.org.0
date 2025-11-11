Return-Path: <linux-arm-msm+bounces-81278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B719C4E213
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 14:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 64B564E105C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297762F7ABA;
	Tue, 11 Nov 2025 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="ih6ybhPX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0FD32BF20
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762868005; cv=none; b=Rg4uviz4zfq2QBxlVL5LXVz64LnTpxb6U6hd7CZpr14OOcStdr6ljPDpF23mCnTvhx0TcHn+AnYvJT6vywEu0EDtrCR8MyJh1eaK271u3esbQhzKO/UaGwb5MrXa40hNIPOqqchSOlf9LignJpogU3WAp7cbAz1kMT0uM9RCecU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762868005; c=relaxed/simple;
	bh=m/IDcbUYaTlqaJOcWar+0Jl6b6b2/gJXupbjxTarers=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axGY+6hJ2k+qpMC4aPyosrxcv72FzrdesYJCNp8r62CPPu0GUuvA96P/7QmQYzjzhzkE8QAoU67xa2GXfoESBgH/Z28IYOiHQF9KIuxtAhiUU4swmFHWgUGaq5hJm1J5U8pQZCproQOo+g9gBqSfGB+oM5Rym11FlKTY6I8/NeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=ih6ybhPX; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59445ee9738so3257503e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 05:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1762868001; x=1763472801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lY3yD/lWkhxBE38j+dUGeqe89ypJFm7YKL/U6lIARs=;
        b=ih6ybhPXbqtT8us51h/YwWyVZ9wcl99rW3342DSYuZA6MsfWJX/+RTijmuAGgNOgr7
         ZCLbtKuYI2jn8B38r3aHofSHCteMAzdlkJVisOuiy7yxJXiPI+HXxjcMbwG4RwMcclqm
         bn1Wn7GNBYw9cX0I/OfJDZsoayVCsHR0qwVKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762868001; x=1763472801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2lY3yD/lWkhxBE38j+dUGeqe89ypJFm7YKL/U6lIARs=;
        b=kMy1U9hGtu4U+3WpDgW53feZepo7uemr0w8Zfmjf4JtMagX8MMBlg3nT+rVY0Arjqg
         LKFxAucjXF213LEXxaIGdKfqfJYxKpXdEWk6Ra+A+Rtg7A/4JYFWME+gV5blXDKfLmdl
         1ResnD/Xdd6SkbE18UtVeYeFY7sZU33igmWkRsBeiMaveyW+JM3M+2ZyqdHt7a2XrVNh
         CiJwneiWD92rURFVs+SP/aG6n/eTD0jVCP0RQO0v2Pfn+QmesBDaalCCUAjPUSi4NrAz
         9INRBDj1przgeU9qAsLCXr43T1IiEMvrUvBQ8RAaVIMoWHrYaZD0ZMfkNIZOGtvRsx4l
         6nFg==
X-Forwarded-Encrypted: i=1; AJvYcCUzXlGAgGEbb4pn/1mNzATHdfQff7UVbhzdpV4PS4T7kYcGpKg2aXiQGiI66dXJVjoabDlYILoCqVPpcgNN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4zA39PZ/GpUZblcWCmGWqAS7sXF7oVaU5ZE7NW+X+FE+Zy46y
	mUKAVmFF9b0ZZl/stCVNrMymgEMDBleEJ5BDG0DveU4A7sruVBiH+RxiN8BfgZXOH2RVRqTP9/E
	FmNHc9+c6rgliGUxq8Frd2tWt4uQzK3ivuXZb5cGClQ==
X-Gm-Gg: ASbGncsDyfLPv53atMrAmR6wxSzS+HN+5cyPv9U1jTGD/W8kBf5uaffp39Gx8S4yOSL
	aBZC+WI17G5ZrAklrKFOVvD/GJmgqVNW7BTUSXu1FgiHaqbfLfRfOnGm8h2r7fEOfnMwOKgONe9
	+6XMP0/Q1sB25XkUh0BZWzfFi2+hdpmu9h7IX8xTzE2UqGfB5+gJXkMJA04pnO5GRlWvDn/GdmZ
	yIAFwMleG2J0esYXmB1JaD79V+5Z5NorkiwIlAK6J1LO3dOJ6WFf8QvbDq/eg==
X-Google-Smtp-Source: AGHT+IEa2+alpsV7yZo2MQ2zemGQSgaZflRIFnqWJ5eOZ/bg4aVTD1e/Z7u7RDia8HjsH2yeWCn923dhPxhZxjFLNYs=
X-Received: by 2002:a05:6512:61a1:b0:594:51ac:138 with SMTP id
 2adb3069b0e04-5945f165199mr3017960e87.2.1762868001402; Tue, 11 Nov 2025
 05:33:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106153119.266840-1-r.mereu@arduino.cc> <20251106153119.266840-3-r.mereu@arduino.cc>
 <84f0ed2f-bf51-4dd5-93f1-f26e077a2549@kernel.org>
In-Reply-To: <84f0ed2f-bf51-4dd5-93f1-f26e077a2549@kernel.org>
From: Riccardo Mereu Linux Kernel <r.mereu.kernel@arduino.cc>
Date: Tue, 11 Nov 2025 14:33:09 +0100
X-Gm-Features: AWmQ_bl9u7adnSSXNZGOLBBGiNfZ8y3mPpTDmoF7L_YWRx9FeA-avTcHCLCKRGM
Message-ID: <CAKA1JhYTC5p_7Zj9b7g1YKZhjH0=tnnJkdW1rWv39L-SF-SDoA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drivers: spi: spidev: add compatible for arduino spi
 mcu interface
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org, 
	linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net, 
	naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com, 
	chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com, 
	farouk.bouabid@cherry.de, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, Riccardo Mereu <r.mereu@arduino.cc>, 
	Martino Facchin <m.facchin@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 8:13=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> > ---
> >  drivers/spi/spidev.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
> > index 5300c942a2a4..f0dd516c2083 100644
> > --- a/drivers/spi/spidev.c
> > +++ b/drivers/spi/spidev.c
> > @@ -704,6 +704,7 @@ static const struct class spidev_class =3D {
> >   */
> >  static const struct spi_device_id spidev_spi_ids[] =3D {
> >       { .name =3D /* abb */ "spi-sensor" },
> > +     { .name =3D /* arduino */ "mcu" },
> >       { .name =3D /* cisco */ "spi-petra" },
> >       { .name =3D /* dh */ "dhcom-board" },
> >       { .name =3D /* elgin */ "jg10309-01" },
> > @@ -737,6 +738,7 @@ static int spidev_of_check(struct device *dev)
> >
> >  static const struct of_device_id spidev_dt_ids[] =3D {
> >       { .compatible =3D "abb,spi-sensor", .data =3D &spidev_of_check },
> > +     { .compatible =3D "arduino,mcu", .data =3D &spidev_of_check },
>
> That's way too generic, IMO. First, I am not aware of Arduino boards
> mounted on top of regular development boards, so basically you are not
> describing actual hardware setup but what could be potentially plugged
> into box with Linux... and then it is like saying "you can plug
> anything" because MCU covers everything, like calling it "Raspberry
> Pi-clone".

This is used to describe one of the interfaces between the
microcontroller and the microprocessor on the Arduino UnoQ board.
Since this could be used in other layouts in the future, we thought to
keep it generic enough to reuse it.
If this isn't possible, do you have any suggestions?

>
> Best regards,
> Krzysztof

