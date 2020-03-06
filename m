Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6767E17C6D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 21:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgCFULL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 15:11:11 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:33859 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgCFULL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 15:11:11 -0500
Received: by mail-yw1-f66.google.com with SMTP id o186so3442120ywc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 12:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cAmN2XomIZLyi4Gd5i7ZRZxhcZeRZofVGY0pFhBeAdk=;
        b=GmNom6vwhKWFaoB9oOCygW9y/53nh42K1Q+7Fa0n5SuOLMZJTaUwTJ5ABWV/QM44f6
         UW3/JwXZfV/jD42MeYLJX4zI/UuJg9NQfI9CXJd7anP66cAqtdL6BsjL7Lewzxz+FWR3
         jgcxRTKpQ3xBO2TTx/T97X9MY3JjOA8a71r0kszuUltC2/u5N1rfkuIqPZ+0v0kIENH6
         zNp6LQxT0vMxIu2o+9Qf3yG/Dx8WE1T1CE3A63eI3JKPGrUTJaqG87ZtdOL8fD29UOO0
         LEl8raxrLdh5NWxtkJMquBsGd2wnrEcL250qvfO7gyZi0NleGYavixhZGXEc768M2vcA
         VKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cAmN2XomIZLyi4Gd5i7ZRZxhcZeRZofVGY0pFhBeAdk=;
        b=PIBFEmp0NNA4GQiSmGLYunG55T9p3cRZs6gL35Ygd5Ac7r8vEyjrqohMfdhrEglJFO
         14WJJcI8UG+NMR1rofBaYd8lV7/+/dODu1y2HytrgPFvPx3SfSW88YcDeEkbFDrJwcRH
         ktYc3WhHsscpH93v2T5fSt2CN6ER/i2SaMfFQ7jJhLKdAgQjjX7BV4mrG0QmtbmmBxZt
         aLaeLf4+JWjcIrlPQ/ywVdtvS5A6fUm9CzmIAS1JjspFlX5yTor3LntCFjBjoUvN7Z2A
         tshliI1Nb4Esp8iPYShhEwIgRwWzVcHnIM9wk1/0tH/YXhC6E/PLaiyLSeVLxcnyh8sk
         hb8Q==
X-Gm-Message-State: ANhLgQ2ZkGAKi+eI6KRGDc/8MJw8DW1Qt8xt2chH3ZsoszKcP0A8cbui
        iRHtYjcRn4vnY3L+DY3HE3iu7dHimHl6jGvz/qZVp8tiTQ==
X-Google-Smtp-Source: ADFU+vsZ/T/ANgJZwUxVSGl1g9UyXYJKjUx+RFdVydzyCgbtEWGW5cCbO/LTCEwWG4zR5zplEPgZICoPLpClK4M+wIs=
X-Received: by 2002:a0d:f305:: with SMTP id c5mr6195972ywf.292.1583525469694;
 Fri, 06 Mar 2020 12:11:09 -0800 (PST)
MIME-Version: 1.0
References: <20200306002321.3344-1-jkardatzke@google.com> <892a0548-df6d-a4db-921f-7f4cfd69dc06@linaro.org>
In-Reply-To: <892a0548-df6d-a4db-921f-7f4cfd69dc06@linaro.org>
From:   Jeffrey Kardatzke <jkardatzke@google.com>
Date:   Fri, 6 Mar 2020 12:10:58 -0800
Message-ID: <CA+ddPcPg_LrxdgxhOjrzkkBBawWoP0+6ijBx6CSy+CpQtP6vbQ@mail.gmail.com>
Subject: Re: [PATCH] media: venus: fix use after free for registeredbufs
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 6, 2020 at 1:03 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi Jeff,
>
> Thanks for the patch!
>
> On 3/6/20 2:23 AM, Jeffrey Kardatzke wrote:
> > In dynamic bufmode we do not manage the buffers in the registeredbufs
> > list, so do not add them there when they are initialized. Adding them
> > there was causing a use after free of the list_head struct in the buffer
> > when new buffers were allocated after existing buffers were freed.
>
> Is this fixing a real issue? How you come to it?
>
In our code we were allocating 64x64 capture queue buffers initially,
then got a resolution change event for the actual video resolution of
320x256 so we freed all the existing capture buffers and allocated new
ones. I had noticed memory poisoning warnings in dmesg and tracked it
down to the patch I created here. This is only a problem when the
capture queue has its buffers freed and reallocated (which would
happen during any resolution change).

> >
> > Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> > ---
> >  drivers/media/platform/qcom/venus/helpers.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> > index bcc603804041..688a3593b49b 100644
> > --- a/drivers/media/platform/qcom/venus/helpers.c
> > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > @@ -1054,8 +1054,10 @@ int venus_helper_vb2_buf_init(struct vb2_buffer *vb)
> >       buf->size = vb2_plane_size(vb, 0);
> >       buf->dma_addr = sg_dma_address(sgt->sgl);
> >
> > -     if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> > +     if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
> > +         !is_dynamic_bufmode(inst)) {
>
> If you add !is_dynamic_bufmode here, we will loose the reference frames
> mechanism (see venus_helper_release_buf_ref()) which is not good.

In my testing, I never see venus_helper_release_buf_ref called.  I
think something is wrong with reference frame management. I'm also
seeing failure in my tests that very much look like reference frames
that were dropped in the decoder (with or without my patch); but they
are not consistent.

>
> Thus, I wonder (depending on when you observe the use-after-free issue)
> does this is the correct resolution of the problem.

I agree this is likely not the right solution to the problem, there's
something deeper that's wrong I think because I never see events
coming back from hfi with the release buffer reference event.
>
> >               list_add_tail(&buf->reg_list, &inst->registeredbufs);
> > +     }
> >
> >       return 0;
> >  }
> >
>
> --
> regards,
> Stan
