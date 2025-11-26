Return-Path: <linux-arm-msm+bounces-83468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38399C8A5EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 15:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E16DF3A87D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 14:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1138302CD8;
	Wed, 26 Nov 2025 14:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Tf/JRJNR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E154A30276A
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167948; cv=none; b=sxAu9Px36pHKlhMlLgOp+TZxc9tRUaNEIAgmz1+3/29lFPxGbHj+ZU/R7Latqcw/BdvDk1J/H0AoYmAlMXIRY7U9/twA6HeL4+FrQoSiAByrcJZpYO4rsrN1wguXFRXqtNv8tn9mkJUvkjpNG94+nig+J6K5j9j5nBQuxoji9Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167948; c=relaxed/simple;
	bh=yacBvBYaVY4CpdxU2ivpOumvrEreuCR9cSgT0Y23MFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=te/u3HBtQcvawqaKbVNcvpux46Mw/5oLIySUbhpH+QL7VnytcowcNVqX0Iai77beWAIYbgxTezPmIZ4VxkVt2U3iCv8BCXjG3qRjJc9M0rAlcemC6q+2ZGIo91kPRtCCZBhYJozd3HSXfKvCEzMwtjKfgQlBGhXqDdxF6YfhEIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Tf/JRJNR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59428d2d975so7206412e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 06:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764167945; x=1764772745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msBAMbzCaK4P9BYCopufCeh+uY8BrlUveStybrFmxj8=;
        b=Tf/JRJNRdXPW5HiFOnFMm9tk6W6KiDV+cubTpuySsP8E2lbH+kuF9Oh+Sihe0gvciX
         Wxc4PGj8WRr3gtQ2yhu7Ie5k1rzi9etojhLNEmqeWZIlZnReZnozgcVnRuDggAaBr10i
         uUy/YVScj6RO89kxye1qyGWHuDQNvfe/ZB7VAkkZO40P/bqoUiHtorzaRMsBaIbtVssR
         cLbiWyEYhOy1bnmlGCe/70lVNhl8RfAnHnCmuOl+K8ld4WZpbBbLkCwwJ1mw+dzJNFnY
         VEqMjDEstTB4B2+tmt0sUZ/HJWjQLBSEF+zBRV1wPI3Euagn0STQz5BaBF6XTwJLSdrs
         rAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764167945; x=1764772745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=msBAMbzCaK4P9BYCopufCeh+uY8BrlUveStybrFmxj8=;
        b=LA31vfpstkcfdHdz/GHyK9kiSKfHDeySs5g0RfJ2J54uBBzBsl56IIYaSz87njSrNz
         qrReV9Si0K7u70K0Hj9BtohOI/sddBpE9bKsTmOKH6AQ6+4+skrdRPCxGzd/++gNQc7c
         2a0XTZjygiKZEEKCRwzWKHI1Kq8XuxGt5Axm00Tup6P+kKxGvE2k+pyn4Ww/2NrvWHrU
         Ym2+T4sSRzmC1E1fPqZTPN0ce44PHwVxD0UrYTPTQtvzZHuaQHShvAQm965LzJHMACAI
         4YkLe9O6uN5if0c1ptMukHz+7mnFuzawjoyBqKJwidDals9LF5z1VPcCwu1KvJIjbJQD
         FBoA==
X-Forwarded-Encrypted: i=1; AJvYcCXHkEfWz7YbkdFDfNIwZCYpzs9bZMtsO9xZzZ0uvKbhrTFSBLycLh+TbV1lqCk9xdnL+mUMVvSpnbUa4QeX@vger.kernel.org
X-Gm-Message-State: AOJu0YxHlEfGnnv8qk++ifyJlpJgHW4k801HlHRxRMlrV4JNYkRyaxdR
	Pcftky9h1RewcOq/PQrhfyXoSx4z4F2n24x9gAUCiS044g3T8AOkDWIhgxGHrGPM3sRqpYl2HGG
	+ki2Ib2jZMSWSFNQkh7mx3up2UyD3TJ3bAas7XhxN5g==
X-Gm-Gg: ASbGnct0zqN7NLcwduAcVqskNX/2yn3x/yLfQ3vutuoOLQdZ1P1aPJZIK3OZ1ETWqIS
	RcNZgaTES9twmD7CrW5SwxGbnHfCkiEAfIEDtlmbYBfgOitZz1jajAWrZx68TIBifZJqDLhPT9+
	zTVs7M+nxT5XA0li6GhRsU+vIfjAJnCo8uBlVE8cPZ5W/RdmEG3wtdPQ5jRxRIrPud2sfylhxV4
	nIp1ahqrN5MoipMhn5LKw7wyTw2WztMe3r495Vf9d6/YFUEKFQZt6flc41HytBmgUTu2QsUV7ag
	zxuw3XHHuEHeB9849fKZBKH7vK8=
X-Google-Smtp-Source: AGHT+IFDxRVt50Oa/O/Cj0BOmm4XYwCMA0ik9gwSJjdf5XFhmE6eJiaVMJCla8GLSwR5pSXLEUBXG1Du99AsBWpILQY=
X-Received: by 2002:a05:6512:304e:b0:595:8052:110f with SMTP id
 2adb3069b0e04-596b4e529b0mr2876479e87.6.1764167945036; Wed, 26 Nov 2025
 06:39:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126122219.25729-1-brgl@bgdev.pl> <gy6ycgcld2moccjjl7x7h72riwfm4ymhnkhlgau53fl4eu3e6q@qp5lrwx57jin>
In-Reply-To: <gy6ycgcld2moccjjl7x7h72riwfm4ymhnkhlgau53fl4eu3e6q@qp5lrwx57jin>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 15:38:53 +0100
X-Gm-Features: AWmQ_blncx36kZC3fH6WyyuMqAepzKDyy1dWzU4Yz0s9JWV27nROSI0p6FrG_AU
Message-ID: <CAMRc=MdXXNaMVK5q+yNSZcLjjoQLwPmDnMW90gGK+uk77F+3ZQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: mark the GPIO controller as sleeping
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org, 
	Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 3:35=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Wed, Nov 26, 2025 at 01:22:19PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The gpio_chip settings in this driver say the controller can't sleep
> > but it actually uses a mutex for synchronization. This triggers the
> > following BUG():
> >
> > [    9.233659] BUG: sleeping function called from invalid context at ke=
rnel/locking/mutex.c:281
> > [    9.233665] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 5=
54, name: (udev-worker)
> > [    9.233669] preempt_count: 1, expected: 0
> > [    9.233673] RCU nest depth: 0, expected: 0
> > [    9.233688] Tainted: [W]=3DWARN
> > [    9.233690] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 2.10=
.1 05/20/2025
> > [    9.233694] Call trace:
> > [    9.233696]  show_stack+0x24/0x38 (C)
> > [    9.233709]  dump_stack_lvl+0x40/0x88
> > [    9.233716]  dump_stack+0x18/0x24
> > [    9.233722]  __might_resched+0x148/0x160
> > [    9.233731]  __might_sleep+0x38/0x98
> > [    9.233736]  mutex_lock+0x30/0xd8
>
> As far as I can see, this mutex only protects mmio accesses.
>
> Is it preferable to mark the gpio chip can_sleep over replacing the
> mutex with a non-sleep lock?
>

I'd say let's do this as a fix and convert the driver to non-sleeping
with a spinlock next cycle?

Bart

> >
> > Mark the controller as sleeping.
> >
> > Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl drive=
r")
> > Cc: stable@vger.kernel.org
> > Reported-by: Val Packett <val@packett.cool>
> > Closes: https://lore.kernel.org/all/98c0f185-b0e0-49ea-896c-f3972dd011c=
a@packett.cool/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> If we stick to the mutex, the patch LGTM
>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>

