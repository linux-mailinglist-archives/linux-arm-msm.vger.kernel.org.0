Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 749BE372E84
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 19:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbhEDRMr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 13:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhEDRMr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 13:12:47 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A6DC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 May 2021 10:11:51 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id v20so9298244qkv.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 May 2021 10:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2FNgXz1eZgIsAhzPOm44KOmzV2GlF9acNuOloClC5MA=;
        b=O4sGtM2Lhor313MIyDbI4nesXV7pQ7pe7Q8Z3a8PLbSmj92CfS5md+vpVGSWd6RrW6
         MT7MfumRVypMVNITPUaTDqV0wr73OT0pLUacP+/lldQFjKCULvetYjxFqnZxpyoxJw2I
         xKaqMo1wq0slQN4Rcd6rW9rhrw3rUwz68/7Gwa7AU7vJaDW3W1KL4kmaFdum/PfR/jet
         NGB/ltnLoGY5fnKHNJxnhZFokhnDirW2vjtj7CkpZapAfyh80ed10dl51OCMS2TomgAE
         UH0ojwEphlXiyojA7infWSQ408oilrR1T0O206Ho/PEFaTdSwua47vHGH0tBA/MVKlbF
         2jvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2FNgXz1eZgIsAhzPOm44KOmzV2GlF9acNuOloClC5MA=;
        b=RQspDxqDG4+T0MPBsJNfjflGcfndn2M9aOr57wzhtZ86pNy6h4JOmUihiA3s/+7z9Y
         uEp/ZHnW+LWFLRa0MlB0Qxhub7KM1zPBMrB7AJS0S8HTCqY6D6E8JfzPsaZ2Q5FPlicc
         n2YPb3bF/36hYiEeSDBVvNYn/oDayWR9iDB+zusH7C/1xkYZSVldKY9jD/49slDYo3SF
         J6ab6nHKIUR9m/skIgJnNAlc4nlQJnHN4VxAHqQkgJDy15pnGydHZc+x75qbv5RH3rFU
         MOKLyAtViQCDm9ktT7dh7k+Q4KSGEX1gHub86MBfWdUO6bxuqMG3lJmFIcUHMiiGVOCi
         UHRQ==
X-Gm-Message-State: AOAM531gH9DiZepcBtBher+xVJ0Cq6jDwf4YaZGdeayA10d/lqOcY+09
        339GxqiyyH7bC2qFWnmdcipTGwC3pRB6vsIX
X-Google-Smtp-Source: ABdhPJxvQPWTpWy7uhfF+XjaDb3G9KK6Ja35H4aH++FqRBJxHUERotwUhV99vQjMAzC4rZpAumiQ1Q==
X-Received: by 2002:a37:8905:: with SMTP id l5mr26669296qkd.321.1620148310981;
        Tue, 04 May 2021 10:11:50 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id t6sm2048752qkh.29.2021.05.04.10.11.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 10:11:50 -0700 (PDT)
From:   Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f182.google.com with SMTP id t7so1919866qtn.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 May 2021 10:11:50 -0700 (PDT)
X-Received: by 2002:a05:622a:3cc:: with SMTP id k12mr23838908qtx.233.1620148309949;
 Tue, 04 May 2021 10:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAP9ODKpQxxnaX5DVSHmq4HJpCOpp_rOPwtOJ=ADRZgg20R6wPg@mail.gmail.com>
 <CAF6AEGuAMA8vMqTZQA=PCXGR781j4xmv-ahT1cQj92bpiMvvqw@mail.gmail.com>
In-Reply-To: <CAF6AEGuAMA8vMqTZQA=PCXGR781j4xmv-ahT1cQj92bpiMvvqw@mail.gmail.com>
Date:   Tue, 4 May 2021 14:11:38 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp3Zq29cjVaD_pZM2pfDHBcKXeRcgkZUEKA9fVgG+V3rg@mail.gmail.com>
Message-ID: <CAP9ODKp3Zq29cjVaD_pZM2pfDHBcKXeRcgkZUEKA9fVgG+V3rg@mail.gmail.com>
Subject: Re: i.MX53 error during GPU use
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Fabio Estevam <festevam@gmail.com>,
        vinicius.aquino@ossystems.com.br, luan.rafael@ossystems.com.br
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Rob,

Em sex., 23 de abr. de 2021 =C3=A0s 11:35, Rob Clark <robdclark@gmail.com> =
escreveu:
> On Fri, Apr 23, 2021 at 4:58 AM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> > We found this error when using Freedreno driver on an i.MX53 device
> > with Wayland. Any idea how to fix this?
> >
> > [   32.414110] [drm:msm_ioctl_gem_submit] *ERROR* invalid cmdstream siz=
e: 0
>
> The invalid cmdstream size is some sort of userspace error
>
> > [   39.177075]
> > [   39.178617] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [   39.184804] WARNING: possible circular locking dependency detected
> > [   39.190997] 5.10.31+g7ae1de1d2bd3 #1 Not tainted
> > [   39.195619] ------------------------------------------------------
>
> But possibly it is triggering the lockdep anger?  It looks like the
> gem locking re-work landed in v5.11.. any chance you can try a newer
> kernel?

Sure; we tried the 5.12.1 Linux kernel and it "worked". We have used
following versions:

- Linux kernel 5.12.1
- mesa 21.0.3
- libdrm 2.4.105

It improved a lot and it opens. We now have some rendering issues:

https://photos.app.goo.gl/fBKoe5C8tsq4xU556

and an error in serial console:

[  262.319890] schedule_timeout: wrong timeout value bf946f6e
[  262.325845] CPU: 0 PID: 216 Comm: eadedCompositor Not tainted
5.12.1+g1a5fea11bc2f #1
[  262.333727] Hardware name: Freescale i.MX53 (Device Tree Support)
[  262.339854] [<c01114e8>] (unwind_backtrace) from [<c010bb60>]
(show_stack+0x10/0x14)
[  262.347659] [<c010bb60>] (show_stack) from [<c0e446b0>]
(dump_stack+0xdc/0x104)
[  262.355007] [<c0e446b0>] (dump_stack) from [<c0e5928c>]
(schedule_timeout+0xf0/0x128)
[  262.362875] [<c0e5928c>] (schedule_timeout) from [<c0789260>]
(msm_wait_fence+0x1c0/0x320)
[  262.371190] [<c0789260>] (msm_wait_fence) from [<c0788510>]
(msm_ioctl_wait_fence+0xa8/0x154)
[  262.379749] [<c0788510>] (msm_ioctl_wait_fence) from [<c0700064>]
(drm_ioctl+0x1f0/0x3dc)
[  262.387966] [<c0700064>] (drm_ioctl) from [<c02de8ec>]
(sys_ioctl+0x3cc/0xbac)
[  262.395226] [<c02de8ec>] (sys_ioctl) from [<c0100080>]
(ret_fast_syscall+0x0/0x2c)
[  262.402829] Exception stack(0xc315ffa8 to 0xc315fff0)
[  262.407911] ffa0:                   00000000 abc10840 00000010
40206447 abc10840 00000020
[  262.416118] ffc0: 00000000 abc10840 40206447 00000036 afd32cb0
abc108b8 00000000 abc1087c
[  262.424320] ffe0: b075aef0 abc10804 b0740214 b40a11fc

Any idea what might be causing it?




--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
