Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E93E5D523
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2019 19:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbfGBRXo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 13:23:44 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:45793 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfGBRXo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 13:23:44 -0400
Received: by mail-io1-f65.google.com with SMTP id e3so38779403ioc.12;
        Tue, 02 Jul 2019 10:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9TPe1WZsk5JII2uLTZByej7kWvrQvfzpP+5IqNRqtRY=;
        b=vOcEnw18V4YTII1N0thEq0xS9oHbklSy1elc9OV680vGSJdWoikVhrHgoILnPtEH9f
         YKSjdQGRpAao5qPJP4d+sXuSorYCBgOcY21ov/B+RSj8d41QFWujdByF0nyIw+sBf3Qg
         00ZgBKqVrHOCAK7yPDDU5Qy7gx8v4c8IJnEUzyI8akPsLoNjSPO97sEKhgNUS1g8ELIs
         Plyv3w7jDLRdFpS1hY8mkjG8zREUTq+7gy3nVkhMxPl9MGpiCP8+nddagcDlcuEkJ5hh
         6TDsxcuUgk0LfORGK32UHXx6WOlxr4B0xtmXQZQIPD1WkrFmFYS7tmR8NJ47o71BxDJH
         KFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9TPe1WZsk5JII2uLTZByej7kWvrQvfzpP+5IqNRqtRY=;
        b=P7TPVbZmbp9rcHg1mKRmh2beRvQml1/iuNY08f8+P15qPobL9pdyvQ+C1CAoo6hLkr
         Acqsm0aVjPS1DUlGQY27OnQFXUqStnz3uXcwUR2G/Vq1H1clnWM/BgcfK9eA4DVGQXUA
         QPONiqd8Ej01PQtaSU0eqwgH+Neg0098fxstKWku8jrMhLVEHNmNejByJyrZ/O+CqCC2
         8pX0EUbdvkt5vHfxNC6Glewr2oYsiMsRM//jwQv1cfgcuqZ3vmWjBxGuCY1N6GOVN5yY
         12SjXQci2ubnphurdrfEQchkwHfV7FFJuZzl+a4FpVZ64nmVUaY7LPBwQ9jXyKMRJDWf
         cemw==
X-Gm-Message-State: APjAAAVrMHJ9HAtgEqvqEdtXlkSHgmxmnqb6qIZgm1VWWbgc/tY6fqWo
        7nf/NaA2X2FW0wN9spzN9tqtcSsuBZtshzCVbG4=
X-Google-Smtp-Source: APXvYqz105hEkDA6XCLEt80eTUJ3TwKxaueqvTovVQyU+1ub+0a/WHbeSrXKzUOmhNG5ooVFsfbTaMyWOHQV3/MVkyc=
X-Received: by 2002:a6b:3b89:: with SMTP id i131mr368509ioa.33.1562088223667;
 Tue, 02 Jul 2019 10:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190702154419.20812-1-robdclark@gmail.com> <20190702154419.20812-4-robdclark@gmail.com>
 <CAOCk7NrXko8xR1Ovg6HrP2ZpS83mjZoOWdae-mq_QJMRzeENLQ@mail.gmail.com> <CAF6AEGsUve1NnzF2kEeW0jwgXnxZTgFaHbq-c-+CKru1jS9tWg@mail.gmail.com>
In-Reply-To: <CAF6AEGsUve1NnzF2kEeW0jwgXnxZTgFaHbq-c-+CKru1jS9tWg@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 2 Jul 2019 11:23:33 -0600
Message-ID: <CAOCk7Nq91abTQ02dUNY=8_mgY_kuwU4MFxdO71AjWz1nwUkBGA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: correct dsi mode_flags
To:     Rob Clark <robdclark@gmail.com>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 2, 2019 at 11:12 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Jul 2, 2019 at 10:09 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > On Tue, Jul 2, 2019 at 9:46 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > -       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> > > -                         MIPI_DSI_MODE_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
> > > +       dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
> >
> > Did you check this against the datasheet?  Per my reading, EOT_PACKET
> > and VIDEO_HSE appear valid.  I don't know about VIDEO_SYNC_PULSE.
>
> The EOT flat is badly named:
>
> /* disable EoT packets in HS mode */
> #define MIPI_DSI_MODE_EOT_PACKET    BIT(9)
>
> I can double check out HSE, but this was one of the setting
> differences between bootloader and kernel

Ah yeah, you are right.  My eyes apparently skipped over the "disable".

If the bootloader is not setting the HSE, then I can't think of a
reason why we would be having an issue also not setting it.

Seems good to me

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
