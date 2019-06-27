Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7036658472
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2019 16:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbfF0O3l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jun 2019 10:29:41 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:42656 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfF0O3l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jun 2019 10:29:41 -0400
Received: by mail-qt1-f194.google.com with SMTP id s15so2611024qtk.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2019 07:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W1pvYoORZqnP8xoBxNR1BOMT3ARKFroxHWTKv5wzgOM=;
        b=JguX5G1DF6CYJFr8wIozLUwn2AUI9H37CGF0uvNTmJ4zKxoZOX3Cp7Pn1MorPfU4a/
         tRcb2qE6EbBs1sGVOktCyiQfYqtGGMaqjYp/z3u5NLz48epn0+9EzUxzL7zzVndwigLj
         mfSYMDzZNv2OSpfw38GUexpL+mwJ2aAKlchbgzq04VXNoMGJbzI2yMi5b5IlXHWAxUAS
         Vzc5RUDlFbILHcUgwVfzou0KlcZa9KnFVQPSYwhUpxVshvZdNPxJu+M6+8unmm/UHO+H
         GhzWgcAYef2/8jou0PhZ0CPSuod1ZWvoMrVD013w+vR727aI2OjGnR9/UR0ZXhKeaGCK
         RLFA==
X-Gm-Message-State: APjAAAXEr6iI5+aeZlid3NIiTGQQUB4zdX1NhUQidh7qqCNVuzRWd/ga
        8koa2J+7Q78nuzhrhjMFLRBcdCjI2Ypvd/G4BzDN1Q==
X-Google-Smtp-Source: APXvYqw4Nu9aKVOvhSyI6nwbZb88GsVpgfbBupkwLNZCD+lEsmbsGQhxPM8V0t9uTwLCqXNVc4fw9xbP+qvO1l5esoc=
X-Received: by 2002:ac8:220a:: with SMTP id o10mr3296213qto.31.1561645780791;
 Thu, 27 Jun 2019 07:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
 <20190621145042.38637-1-jeffrey.l.hugo@gmail.com> <20190623062000.GB204275@dtor-ws>
 <CAOCk7Nr4+Sj9U=qAZTEhPGgZNrZ1VVvNtuUg-9vQzp15xFdCUw@mail.gmail.com>
In-Reply-To: <CAOCk7Nr4+Sj9U=qAZTEhPGgZNrZ1VVvNtuUg-9vQzp15xFdCUw@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 27 Jun 2019 16:29:29 +0200
Message-ID: <CAO-hwJLEDCbMud6dCfvXzwDfauAgfOZmQwkmELEF2e6-4Oe6=g@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] Input: elan_i2c: Export the device id whitelist
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, xnox@ubuntu.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 27, 2019 at 4:02 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Sun, Jun 23, 2019 at 12:20 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Fri, Jun 21, 2019 at 07:50:42AM -0700, Jeffrey Hugo wrote:
> > > Elan_i2c and hid-quirks work in conjunction to decide which devices each
> > > driver will handle.  Elan_i2c has a whitelist of devices that should be
> > > consumed by hid-quirks so that there is one master list of devices to
> > > handoff between the drivers.  Put the ids in a header file so that
> > > hid-quirks can consume it instead of duplicating the list.
> > >
> > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> >
> > Benjamin, are you happy with this version?
>
> Benjamin, ping?
> Sorry to be a bother, but I'm still anxious to get this queued for 5.3.

Ooops, yeah, sorry I missed Dmitry's email.

Fine by me:
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin
