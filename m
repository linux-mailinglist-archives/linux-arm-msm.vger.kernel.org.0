Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 246E612B212
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 07:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfL0GoV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 01:44:21 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37408 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbfL0GoV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 01:44:21 -0500
Received: by mail-ot1-f65.google.com with SMTP id k14so35191870otn.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 22:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mdU0w4gUdMmG5AOoA1TY2dasBZn4XYG6FLZdbgOfXYY=;
        b=Byz1lPZv9ml9+56BjpudDP3VEyrR7s9gNKUMHNcc8SOwcsKFMxlAuy2fZ35LI23ba6
         cxkT8CrcBat62SZCcF+BtUmE1FyLFryX8TiM6rlCTAuPzGOwJDBi5dvNJ1PBbOSotCT7
         G9fSWLBr3+IPY4QyMR8Ek8SDT8yxf5h+itp1KV4SrytVELeLwSN3npJaZn4DTzBAmR/e
         Mb52L3HgLI+6FlyATSM2QT89OTTCnIVbiiIU6BgGOIs54F1S6Rr2gnpZyyMkSZTfoMNH
         /m6mKx8V4M1KmzkFHAqKAUq/FfjyrwgUAXK+LP8v0YJf9Ta0eihcxNarcF1wyscoCgoL
         G82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mdU0w4gUdMmG5AOoA1TY2dasBZn4XYG6FLZdbgOfXYY=;
        b=HZmDufvGPsTsKP7vwiDk7dZ/uLNXW2h4JXY5KeHOnUUYERZkhkq8avbmely5sSpHrI
         CubLsKFu5Ujrfu570Q8H3sGP60wy81PqpiFsaaZyOyN0RahyPa7eUrfcWYuwBm1cV/u6
         QogIkZxJmhiQAnUMX4SsDStpaG8tHZ2AY3wygKBNz8Z+dKpaCRBjWCrUERjyGF2JQGzn
         OHynKGiKYcAEHSyolxTeuV2ZRPi7VBtWmacBDL9FXl9c1zxV33btxBF2vbLuZirxn/zd
         vTWjVKQDEwRyTSTD5LXQoLGirwXONp7qyRhgtDmop6LqUJMoOFX/+Aiado2mvNbA9POv
         sWpQ==
X-Gm-Message-State: APjAAAVKn0QeAiqT9G1MqfMl17m58UJQxyRDanci3LKT2dcXpZWkSPqx
        iZsA47uT40mhlrzOwZcBWZN5nw==
X-Google-Smtp-Source: APXvYqxcH5C3WBfGpiKwCyPXqIco/rrK2Up7fzjmlwdICdDl+NJvkvZ24Lkqp9ErpF1QpXt2Okuzhw==
X-Received: by 2002:a9d:7315:: with SMTP id e21mr43759830otk.255.1577429060090;
        Thu, 26 Dec 2019 22:44:20 -0800 (PST)
Received: from leoy-ThinkPad-X240s (li1058-79.members.linode.com. [45.33.121.79])
        by smtp.gmail.com with ESMTPSA id d11sm6067383otl.20.2019.12.26.22.44.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2019 22:44:19 -0800 (PST)
Date:   Fri, 27 Dec 2019 14:44:13 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] tty: serial: msm_serial: Fix lockup for sysrq and
 oops
Message-ID: <20191227064413.GB4552@leoy-ThinkPad-X240s>
References: <20191127141544.4277-1-leo.yan@linaro.org>
 <20191127141544.4277-2-leo.yan@linaro.org>
 <CAD=FV=W2nENJF0fNpTzjuAVOo_AoZQryThua9vdtt-zsMk82qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=W2nENJF0fNpTzjuAVOo_AoZQryThua9vdtt-zsMk82qg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On Thu, Dec 05, 2019 at 08:40:20AM +0800, Doug Anderson wrote:
> Hi,
> 
> On Wed, Nov 27, 2019 at 10:16 PM Leo Yan <leo.yan@linaro.org> wrote:
> >
> > As the commit 677fe555cbfb ("serial: imx: Fix recursive locking bug")
> > has mentioned the uart driver might cause recursive locking between
> > normal printing and the kernel debugging facilities (e.g. sysrq and
> > oops).  In the commit it gave out suggestion for fixing recursive
> > locking issue: "The solution is to avoid locking in the sysrq case
> > and trylock in the oops_in_progress case."
> >
> > This patch follows the suggestion (also used the exactly same code with
> > other serial drivers, e.g. amba-pl011.c) to fix the recursive locking
> > issue, this can avoid stuck caused by deadlock and print out log for
> > sysrq and oops.
> >
> > Fixes: 04896a77a97b ("msm_serial: serial driver for MSM7K onboard serial peripheral.")
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >  drivers/tty/serial/msm_serial.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> > index 3657a24913fc..889538182e83 100644
> > --- a/drivers/tty/serial/msm_serial.c
> > +++ b/drivers/tty/serial/msm_serial.c
> > @@ -1576,6 +1576,7 @@ static void __msm_console_write(struct uart_port *port, const char *s,
> >         int num_newlines = 0;
> >         bool replaced = false;
> >         void __iomem *tf;
> > +       int locked = 1;
> >
> >         if (is_uartdm)
> >                 tf = port->membase + UARTDM_TF;
> > @@ -1588,7 +1589,13 @@ static void __msm_console_write(struct uart_port *port, const char *s,
> >                         num_newlines++;
> >         count += num_newlines;
> >
> > -       spin_lock(&port->lock);
> > +       if (port->sysrq)
> > +               locked = 0;
> > +       else if (oops_in_progress)
> > +               locked = spin_trylock(&port->lock);
> > +       else
> > +               spin_lock(&port->lock);
> 
> I don't have tons of experience with the "msm" serial driver, but the
> above snippet tickled a memory in my brain for when I was looking at
> the "qcom_geni" serial driver, which is a close cousin.

Good point and thanks for sharing info.

> I seemed to remember that the "if (port->sysrq)" was something you
> didn't want.  ...but maybe that's only if you do something like commit
> 336447b3298c ("serial: qcom_geni_serial: Process sysrq at port unlock
> time")?

The patch you mentioned can allow to read sysrq chars without
acquiring port lock.

> Any way you can try making a similar change to the msm driver
> and see if it allow you to remove the special case for "port->sysrq"?

I was deliberately to add the case for "port->sysrq" in the function
__msm_console_write() when I prepared this patch.

Let's see the issue obersved: when the UART drive is deadlock by any
reason, when sent break + h to test system is alive or not, sysrq
tries to ouput log by calling __msm_console_write(), it tries to
acquire console's spinlock but also run into deadlock; finally it
doesn't have chance to output log for sysrq.

P.s. Sorry my long late and didn't follow good practice to reply
quickly due worked on other works.

Thanks,
Leo Yan
