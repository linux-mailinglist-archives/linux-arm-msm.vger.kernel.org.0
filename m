Return-Path: <linux-arm-msm+bounces-22933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C4590BB3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 21:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3BAAB22BDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 19:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C8316E867;
	Mon, 17 Jun 2024 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hZbSvA9z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1176A468E
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 19:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718653084; cv=none; b=h8jpKrCq3zuCZul3ifzcnhuVBupOyjOJn5/Vfku/XoGzpw9KI4ik4+UKnG5tr4yOfFYGXATerOA30dZiazl584F0zxxyUs8cIZBaVfvx4s4iCo8qfrJ37c8cNel3boS32iTtnl1Ic4NxpduR6OyHLUySsqlYjdDupkc2j0DFffc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718653084; c=relaxed/simple;
	bh=wlo+NPQPjkhJDcsoBLXWcznRisfoTBjuU62SEtBO9Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HC/4bbYmO1fFfryHqK/qM3V+CxZeWLlkENCbh8q99+xoiZsn2rx+JOq0Vh0m3niI/i8zDzh6s2maFj8PWcznkl9w65J+wty8XAT9UDyR9mPkvJtq8C2r6zk+vOVmZJnWyOOmYflIP7pel+PwdaXYA1KQC8pTSSFO/yfOj/wVwKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hZbSvA9z; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d361cf5755so1235538b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 12:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718653080; x=1719257880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeWty9541wg5SD9NtVmG1BHrErKfkqRa0zvwO/tO/ls=;
        b=hZbSvA9zbtcPY5dyNGk7eqWZFYlVHnjudkAFTg/FQqYgJtAtxqoc32hv1iR6YlYB/p
         ykR0LiIJc6oDs93r65G0JxmQpT29rpBsDRlAHJ8KdYsfJIGyulBWo1p1zpIuSiPsMrGH
         eSta4Qu4WM2KUw6RVxeGUVk850qO7oSEGOoT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718653080; x=1719257880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeWty9541wg5SD9NtVmG1BHrErKfkqRa0zvwO/tO/ls=;
        b=MMSvlfYfvayh+jCDn0GaWtF/annsbRNMPdo5IgvVBarz5BB90mgkkTgxgaZfmUDlU8
         pX98gtK5N8L5NWi33/ByP+dRWHNMeBPYUghEz+tXy9+OqUnSLf4pGXPSTBxgs3BH02am
         iZL1XVtCPe9wyoOqwd0Z0W+IdzGfTxrfFuJ9+virKJhBTPzDldQGxpaDK4i1CpymyneU
         f8zkqnLmc9sfD1RKuITPvzw2n3OZ16Rk0V99MXD8bUZtzm9Qe2fLaz9/fYkhQc5ub0VY
         4TiDN3Hp/o7iR5Cbd5S1af9u7BGvP5owMUg72VDXOlkH8ZVaoyJOIVjBRwmWJ0PWDtvR
         IjFA==
X-Forwarded-Encrypted: i=1; AJvYcCVcSI1refzYbWAthG+45EIvd9A0L1MljIUXnDnWx/HpxDeBWYGCGPJPoJAzFKu5VADzgS8ikA+36riCbMIXdUzREs6Rren+Gf8+EzkAIQ==
X-Gm-Message-State: AOJu0YxP4BSzr8+J4ylqAwvAAdQ2StqsEZLbXNvOpNfhw/NtuDjpGB9t
	Fy5G/xpSYqQCfxXE46mTuRS4GCkNF1gwKuwiz+zCKDXqEGd8DC82REiYjLbR/5AR8+++MJg68Xg
	=
X-Google-Smtp-Source: AGHT+IHgNxkpEh1PQ00eP9e8mZ/ElLVNSsAlGD2VGmQCkeVR0NutVW0/QsM1N4bkLZv2z4hSJqUmhw==
X-Received: by 2002:a05:6808:10c7:b0:3d2:50c1:b1cb with SMTP id 5614622812f47-3d250c1b7edmr13313283b6e.18.1718653080477;
        Mon, 17 Jun 2024 12:38:00 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aacae6e3sm457057585a.10.2024.06.17.12.37.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 12:37:59 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-443586c2091so91951cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 12:37:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEDOfEFR71xf+TUT7rPW7d7l/SQEmsiaOetIZXEDDu/zPErM9CEaDW2Ef1bHC1FByqpdp9gAPf2F0ZL3F7TnyaN1Wg8d2dmJ25bkvmZg==
X-Received: by 2002:a05:622a:1813:b0:442:172e:4dd2 with SMTP id
 d75a77b69052e-4449c71ad9dmr515541cf.18.1718653078487; Mon, 17 Jun 2024
 12:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.8.I1af05e555c42a9c98435bb7aee0ee60e3dcd015e@changeid> <bc4892b7-7c34-4fcb-b4c0-e383890162f8@linaro.org>
In-Reply-To: <bc4892b7-7c34-4fcb-b4c0-e383890162f8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Jun 2024 12:37:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UuChPf0DH7aYq8r2XLCr7D+mbm4QSfthf-9ezvFeNUbg@mail.gmail.com>
Message-ID: <CAD=FV=UuChPf0DH7aYq8r2XLCr7D+mbm4QSfthf-9ezvFeNUbg@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] serial: qcom-geni: Rework TX in FIFO mode to fix hangs/lockups
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Yicong Yang <yangyicong@hisilicon.com>, Tony Lindgren <tony@atomide.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johan Hovold <johan+linaro@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Stephen Boyd <swboyd@chromium.org>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 17, 2024 at 12:10=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linar=
o.org> wrote:
>
>
>
> On 6/11/24 00:24, Douglas Anderson wrote:
> > The fact that the Qualcomm GENI hardware interface is based around
> > "packets" is really awkward to fit into Linux's UART design.
> > Specifically, in order to send bytes you need to start up a new
> > "command" saying how many bytes you want to send and then you need to
> > send all those bytes. Once you've committed to sending that number of
> > bytes it's very awkward to change your mind and send fewer, especially
> > if you want to do so without dropping bytes on the ground.
>
> [...]
>
>
> > +static void qcom_geni_serial_enable_cmd_done(struct uart_port *uport)
> > +{
> > +     struct qcom_geni_serial_port *port =3D to_dev_port(uport);
> > +
> > +     /* If we're not in FIFO mode we don't use CMD_DONE. */
> > +     if (port->dev_data->mode !=3D GENI_SE_FIFO)
> > +             return;
> > +
> > +     writel(M_CMD_DONE_EN, uport->membase + SE_GENI_M_IRQ_EN_SET);
> > +}
>
> IDK if this is worth of a separate function, instead of checking for the
> FIFO in port_setup and writing it there, but generally this patch looks
> good to me

Sure. Somehow it felt weird to me to put it straight in there, but I
could go either way. Do you think I should spin the series just for
this, or just make this change if I happen to need to spin the series
for something else?


> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Thanks for your reviews, I appreciate it!

-Doug

