Return-Path: <linux-arm-msm+bounces-33930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51474999538
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 00:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E46612863EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 22:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647D31A2645;
	Thu, 10 Oct 2024 22:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QfBILxpT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BF91E6DD5
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 22:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728599423; cv=none; b=BrlXpsD/XLtZb9IE0BxM9G18gXz9cw6IjxCHWbfAw/cyHsaDXMxwalER0Mxyh0BcdwBwww3SGHwkgrBWpjxhmqOJeUuZoZe25djtlYr9L0H9h42A4QNJ2mrFX4OoA281AESaDQhXGdlUJlw7M/UoBr8OrojT/ggyYXnh5Gt8QvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728599423; c=relaxed/simple;
	bh=CdmSXbDHAWq8dgUJmRamn05jbHQQT0TVNYOiCJ/xXdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ilm7XUZvKdNzqDA2RA3T5rkRT2siJJsXBoRzl0QypXYK7kYtJ88b2pQ1JyPCqm1/htTUpdXt1tpMUzF61kobgxXB5uTdzkVjt5/+GW5JQFjcjLM2gHJeoecp0/GlESX4HXeUlTcgkFuDWMhFCnXJxyDdLnHWSS03QyilEe2+ZcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QfBILxpT; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a99388e3009so198473666b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 15:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728599419; x=1729204219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tjzEcZp4sdEI4rizDgYHU+pcwb4fTKSCVr7AMb0oZQ=;
        b=QfBILxpTEdAJ/ORX2na6SpwxJ01PydvGCHe7pP6zcj00q2Wj4IgUMoaxdJ4uXhlyMm
         KD4UJSgZY8l94R88BNaiOkiQxWg41lQSpxle3rE1+MBZJiD/5MfBKkE7y/lW36y2UTSj
         +7bMO9EyBeT3viDyKrfRV6aFuoYlWXgR5pHJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728599419; x=1729204219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tjzEcZp4sdEI4rizDgYHU+pcwb4fTKSCVr7AMb0oZQ=;
        b=Q6VjFGCoMyOgpp+tcsaXndvhnJzqtf+jEj4GQHuspNPyaCjRYZglzgZ6nSkUzpZgZo
         UOiL90RKDtoPuGCSlQTFvfQeNJZBW8MAErb2US2rucuA0yxR9UIktgRrXr7JkMEfPiMc
         IZX/0ycyPs035PKPhvhzy+fsUydgAnlSYaNXF6g/ijmJL6GAcyV1ObN9fzg0+AVOql94
         vxxOYeSlAQQW/1OG75T9s3dJWcHF/0bLWFRKw7G8BgYTvluiyghvnlwvbD7bsYWw4PSd
         EeCOUOzV7xOPznpNqLq53ByeKWdfn6a/ZxQRRvwBX6UJjn5n8AKJKLyz236WQmkHA7kK
         PmZA==
X-Forwarded-Encrypted: i=1; AJvYcCUprDQRF6FrRow2xxYL/rM3gi/veGXeaI7R8Xfp6rHZj0ICY/tu2rISHNZw0c2SDZe4Fj+XBR/3BNpjG0WY@vger.kernel.org
X-Gm-Message-State: AOJu0YzEeaVMJfFZiSt5hwolMdbbCOiENcQN4vH3bg+tvuMOoyU3G05l
	kqkcwECwpjfRg1wfECr/+YWMzeYV/ZY+AnWNyLb+2w1jZgk7cxwHwpT2KQXS095b6f5ynrxzeOJ
	uPw==
X-Google-Smtp-Source: AGHT+IG9ALCMLECBbPkuLoRzCc6xIyT8qHxdD4o9yYt0qtawn7QlFAnz80AgIHnQvpB8J8o0rUVp7g==
X-Received: by 2002:a17:907:d5aa:b0:a99:4156:997d with SMTP id a640c23a62f3a-a99b95a14f6mr37103466b.19.1728599419531;
        Thu, 10 Oct 2024 15:30:19 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f06af5sm143854166b.26.2024.10.10.15.30.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:30:18 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d4ec26709so620850f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 15:30:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWES3rMlpRSr7hfDnlX0UZRnVXMsCBTwNJXiqApr3AZ6d11h2d60l8cprWKvWbJmZe8/qU9r8iNL8+5z8x@vger.kernel.org
X-Received: by 2002:a05:6000:181a:b0:37c:cd1d:b87e with SMTP id
 ffacd0b85a97d-37d551d50a7mr437367f8f.18.1728599418059; Thu, 10 Oct 2024
 15:30:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001125033.10625-1-johan+linaro@kernel.org>
 <20241001125033.10625-3-johan+linaro@kernel.org> <CAD=FV=UoU5Nd7sW66cjQzor+BP+W_f7uw0MGRaF6y7PH7KRN_g@mail.gmail.com>
 <ZwaO0hCKdPpojvnn@hovoldconsulting.com>
In-Reply-To: <ZwaO0hCKdPpojvnn@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Oct 2024 15:30:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZtZ1-0SkN2sOMp6YdU02em_RnK85Heg5z0jkH4U30eQ@mail.gmail.com>
Message-ID: <CAD=FV=UZtZ1-0SkN2sOMp6YdU02em_RnK85Heg5z0jkH4U30eQ@mail.gmail.com>
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

On Wed, Oct 9, 2024 at 7:10=E2=80=AFAM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Thu, Oct 03, 2024 at 11:30:08AM -0700, Doug Anderson wrote:
> > On Tue, Oct 1, 2024 at 5:51=E2=80=AFAM Johan Hovold <johan+linaro@kerne=
l.org> wrote:
> > >
> > > A commit adding back the stopping of tx on port shutdown failed to ad=
d
> > > back the locking which had also been removed by commit e83766334f96
> > > ("tty: serial: qcom_geni_serial: No need to stop tx/rx on UART
> > > shutdown").
> >
> > Hmmm, when I look at that commit it makes me think that the problem
> > that commit e83766334f96 ("tty: serial: qcom_geni_serial: No need to
> > stop tx/rx on UART shutdown") was fixing was re-introduced by commit
> > d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in
> > progress at shutdown"). ...and indeed, it was. :(
> >
> > I can't interact with kgdb if I do this:
> >
> > 1. ssh over to DUT
> > 2. Kill the console process (on ChromeOS stop console-ttyMSM0)
> > 3. Drop in the debugger (echo g > /proc/sysrq-trigger)
>
> Yeah, don't do that then. ;)

The problem is, I don't always have a choice. As talked about in the
message of commit e83766334f96 ("tty: serial: qcom_geni_serial: No
need to stop tx/rx on UART shutdown"), the above steps attempt to
simulate what happened organically: a crash in late shutdown. During
shutdown the agetty has been killed by the init system and I don't
have a choice about it. If I get a kernel crash then (which isn't
uncommon since shutdown code tends to trigger seldom-used code paths)
then I can't debug it. :(

We need to fix this.


> Not sure how your "console process" works, but this should only happen
> if you do not enable the serial console (console=3DttyMSM0) and then try
> to use a polled console (as enabling the console will prevent port
> shutdown from being called).

That simply doesn't seem to be the case for me. The port shutdown
seems to be called. To confirm, I put a printout at the start of
qcom_geni_serial_shutdown(). I see in my /proc/cmdline:

console=3DttyMSM0,115200n8

...and I indeed verify that I see console messages on my UART. I then run:

stop console-ttyMSM0

...and I see on the UART:

[   92.916964] DOUG: qcom_geni_serial_shutdown
[   92.922703] init: console-ttyMSM0 main process (611) killed by TERM sign=
al

Console messages keep coming out the UART even though the agetty isn't
there. Now I (via ssh) drop into the debugger:

echo g > /proc/sysrq-trigger

I see the "kgdb" prompt but I can't interact with it because
qcom_geni_serial_shutdown() stopped RX.


-Doug

