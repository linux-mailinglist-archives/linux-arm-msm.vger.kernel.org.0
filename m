Return-Path: <linux-arm-msm+bounces-34118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5199A65E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 16:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D92D61C219C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 14:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49ED64D8A7;
	Fri, 11 Oct 2024 14:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TdOhQqBH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F67617BCA
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 14:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728657054; cv=none; b=gciJSpLZ/Dqy/hSPaGSOPvAdyGOFAA7UxjYomCouS9mePy0pVP/RwWcZcmQmMirnp07CLPJaG4CtbZSecoUUMgnnQYO0aWNEblkTBM9WEBEVbsb0EBxOrEVqrBj4XAmpP9Bn4Rw0LS6RxULmrtnzTypb7ZPge+GrzaShDD2TalU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728657054; c=relaxed/simple;
	bh=sk7ig4kmzzR0r3yaD+YqQ9AW4S497HPCFTId5lyO/eE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hoIzZOWDswAVjEtZ75q/9MBWjON7JOPRI+Dk6vek5f2SdaGYJVtORi0FHC3y7JRYdbQG1o8nDlNUdHdsIg82sE7XGrxFeuHa9ANlKElfQMU7kA3QvzPlR1LSsWe4ZapvHUgjbkMf8PG+ouY27TlO99TduLe2KdATQaiKrJvDZZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TdOhQqBH; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fad75b46a3so21508031fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 07:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728657049; x=1729261849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BP0XnFYp3SsaSaiTxi9A6dV0XZX880MVcEXNqO2kxM=;
        b=TdOhQqBHKt2sytL66qGiyGg6wG7dvwvvE5/10v/OEs6birrSQFd5v6HYIfHSzhPXK6
         j5Iz8Qz2S7w0lk9D5ZrgjSXGRsZ7ywpYfJMp9cHoLOP0p5SpVSHliwSgslp6/xFdgIYr
         ALP26pMPyDQ3Sgm5eTI/TX5i4zReB+hmZAcPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728657049; x=1729261849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BP0XnFYp3SsaSaiTxi9A6dV0XZX880MVcEXNqO2kxM=;
        b=pjqDhYhhjwHU9hK3kUq8U4xLl1VMBAVobrvvLOriAzoe0NqUCwqW/Bto26x33QvlCi
         ZO2cgHr5WNqzJXnNQ2HUFF+juLWejWaR4IXLSdRCjlLRuJ9CjIdlTe+0iCg/cqOj5El8
         BWLC+uqM66l6eJ1yyPAWS1vUBOYQo/OG1e3KVD5/XBTdja84dA5oYbboIsUKNAm1QLwS
         JQkTLQMM4bKom6FdBCAC94uvL93S681ACchrt61g6AvDwbTO2zVFk/G/cHGc62FGHAqG
         +np6hvNg9tLTPIvxP6WdH3SEMObiCM3FHmqiQBCQNUEsRNIdRazYzlsD5ia+ku9OnOXz
         lFgA==
X-Forwarded-Encrypted: i=1; AJvYcCUY/OFiolJvlP269WEAW0OWMkXg4pbd2l5iyt3whwr9IS3yDYwSWIX3RGzmxKnCPgBok/ig4B9UyiFU1MK+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+dDyb5lvxiVdjpoz1GBZcjDYlMqnqpk1JAm/rtBIbJajTGkxK
	fTYBN/VXKbUX6hJrjQcvUTK61br2Yp64Z8Nti60Ucdjy9iWBC8uIFJIIA48D+1ek5AY53hBpKfy
	L2P4K
X-Google-Smtp-Source: AGHT+IEctzeVaz0FRrzE1bm2Lqax8OhHb2JMf8wMMKdXSHVH8iYSdUNDmd8u6i4uWfWzDuMdkT6p9g==
X-Received: by 2002:a05:651c:19a3:b0:2fa:bba7:2699 with SMTP id 38308e7fff4ca-2fb32715fb8mr14342581fa.16.1728657048769;
        Fri, 11 Oct 2024 07:30:48 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb247063basm5138101fa.92.2024.10.11.07.30.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 07:30:47 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e13375d3so723451e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 07:30:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2jHqA25xmDLGYNNIgUsDO6RCT5blxEZz0Z5g3DSdJlbdCt7EWIrJD/mFaq9s+3LZ5u5DGhwskLbQ7o6Yi@vger.kernel.org
X-Received: by 2002:a05:6512:39ce:b0:52c:8abe:51fb with SMTP id
 2adb3069b0e04-539da3c1e52mr1341517e87.10.1728657045305; Fri, 11 Oct 2024
 07:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001125033.10625-1-johan+linaro@kernel.org>
 <20241001125033.10625-3-johan+linaro@kernel.org> <CAD=FV=UoU5Nd7sW66cjQzor+BP+W_f7uw0MGRaF6y7PH7KRN_g@mail.gmail.com>
 <ZwaO0hCKdPpojvnn@hovoldconsulting.com> <CAD=FV=UZtZ1-0SkN2sOMp6YdU02em_RnK85Heg5z0jkH4U30eQ@mail.gmail.com>
 <ZwjK-s0sMn9HOF04@hovoldconsulting.com>
In-Reply-To: <ZwjK-s0sMn9HOF04@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 11 Oct 2024 07:30:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XuEPGtDCe4ssXPy2avigqviTBAycc0Q_U_Pwi9x6t23g@mail.gmail.com>
Message-ID: <CAD=FV=XuEPGtDCe4ssXPy2avigqviTBAycc0Q_U_Pwi9x6t23g@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] serial: qcom-geni: fix shutdown race
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 10, 2024 at 11:51=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:
>
> > > Not sure how your "console process" works, but this should only happe=
n
> > > if you do not enable the serial console (console=3DttyMSM0) and then =
try
> > > to use a polled console (as enabling the console will prevent port
> > > shutdown from being called).
> >
> > That simply doesn't seem to be the case for me. The port shutdown
> > seems to be called. To confirm, I put a printout at the start of
> > qcom_geni_serial_shutdown(). I see in my /proc/cmdline:
> >
> > console=3DttyMSM0,115200n8
> >
> > ...and I indeed verify that I see console messages on my UART. I then r=
un:
> >
> > stop console-ttyMSM0
> >
> > ...and I see on the UART:
> >
> > [   92.916964] DOUG: qcom_geni_serial_shutdown
> > [   92.922703] init: console-ttyMSM0 main process (611) killed by TERM =
signal
> >
> > Console messages keep coming out the UART even though the agetty isn't
> > there.
>
> And this is with a Chromium kernel, not mainline?

Who do you take me for?!?!  :-P :-P :-P Of course it's with mainline.


> If you take a look at tty_port_shutdown() there's a hack in there for
> consoles that was added back in 2010 and that prevents shutdown() from
> called for console ports.
>
> Put perhaps you manage to hit shutdown() via some other path. Serial
> core is not yet using tty_port_hangup() so a hangup might trigger
> that...
>
> Could you check that with a dump_stack()?

Sure. Typed from the agetty itself, here ya go. Git hash is not a
mainline git hash because I have your patches applied. "dirty" is
because of the printout / dump_stack().

lazor-rev9 ~ # stop console-ttyMSM0
[   68.772828] DOUG: qcom_geni_serial_shutdown
[   68.777365] CPU: 2 UID: 0 PID: 589 Comm: login Not tainted
6.12.0-rc1-g0bde0d120d58-dirty #1
ac8ed1a05abcc73f4fafe0543cbc76768ea594e1
[   68.789737] Hardware name: Google Lazor (rev9) with LTE (DT)
[   68.795581] Call trace:
[   68.798124]  dump_backtrace+0xf8/0x120
[   68.802025]  show_stack+0x24/0x38
[   68.805463]  dump_stack_lvl+0x40/0xc8
[   68.809265]  dump_stack+0x18/0x38
[   68.812702]  qcom_geni_serial_shutdown+0x38/0x110
[   68.817578]  uart_port_shutdown+0x48/0x68
[   68.821736]  uart_shutdown+0xcc/0x170
[   68.825530]  uart_hangup+0x54/0x158
[   68.829154]  __tty_hangup+0x20c/0x318
[   68.832954]  tty_vhangup_session+0x20/0x38
[   68.837195]  disassociate_ctty+0xe8/0x1a8
[   68.841355]  do_exit+0x10c/0x358
[   68.844716]  do_group_exit+0x9c/0xa8
[   68.848441]  get_signal+0x408/0x4d8
[   68.852071]  do_signal+0xa8/0x770
[   68.855526]  do_notify_resume+0x78/0x118
[   68.859605]  el0_svc+0x64/0x68
[   68.862790]  el0t_64_sync_handler+0x20/0x128
[   68.867218]  el0t_64_sync+0x1a8/0x1b0
[   68.872933] init: console-ttyMSM0 main process (589) killed by TERM sign=
al


> > Now I (via ssh) drop into the debugger:
> >
> > echo g > /proc/sysrq-trigger
> >
> > I see the "kgdb" prompt but I can't interact with it because
> > qcom_geni_serial_shutdown() stopped RX.
>
> How about simply amending poll_get_char() so that it enables the
> receiver if it's not already enabled?

Yeah, this would probably work.

-Doug

