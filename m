Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD4864BE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2019 20:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbfGJSIq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jul 2019 14:08:46 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36324 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727315AbfGJSIq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jul 2019 14:08:46 -0400
Received: by mail-io1-f68.google.com with SMTP id o9so6770944iom.3;
        Wed, 10 Jul 2019 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fz3fi7LB0BiFDGV+8+VIRpi9pQLp8pdFvuuAWIAJi68=;
        b=D7kcnPqw3vNj6m+ygFV3r8wUS+Dkb6C1MkFYCjrl+lubL/TqUrmceN7NgqtNnsV5J0
         brPWeXWugL8BzDy3S/KYPulBVG3DTnicywWVUPwHIBK7WW8s/hVZEEL330/IBUECDxw3
         mQ0bhYBmUoHptQmekc/pbMihVX3CWjiXMMK+3/k4G3gZ1GFBSUakOixGvfOlTvyP4+CZ
         3YwnROJOtRZEq/O2FDgvZnozS/TGtTMZR58XWa9OgoPI2Iq/n8M9m8KxTef2WB3nWXoi
         eZmsai7v5/Nzwfv9OPUDFjar9vq4KlTGJuRbGXHc/lxaF5AOkIr9GxnCtHQBR8bYMDxE
         XXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fz3fi7LB0BiFDGV+8+VIRpi9pQLp8pdFvuuAWIAJi68=;
        b=MRaxQNuhHl4A/H31AERdlNE0wCJ9uRpnBjra79+Aq2HC72ki6UiP3wLcceBn9aet9+
         u1+uPsUqILro/ZoQ67AF/srzjwA5NFSREVQO3/mkV2Eg4ODNGEXEPdUOKl9X4tOABLgP
         okBOfANYAOveymTL9b9fZUwwL0CA6/8qjU8IKKd47FHylwbtOmfMucLwITUcRok+Gp5Q
         lMPl2/POC9oGp01vOmiz/kyTl9FGsYwipOAvBQQxsgr3UABiHZFvL3WEevsKlFeJMS/h
         G+7qL/lv6nBvuc55rxVpZnFzBsML2kuguzTlWm0uu2Xt6l3Yah5kPc0UPPp9eQ5jDZqs
         C1mg==
X-Gm-Message-State: APjAAAUocK+atZQWFSgo5Glewz8feLqXHqb7VR1SI3UcCZOrBEPf300j
        m1vC1qh5Al4iQXhC0rKyI/diZIgGeMUtEbOBq0A=
X-Google-Smtp-Source: APXvYqwrWaPVnaCJyvAxYPInwznOn4T9MDdhCibZlw9XeVmn1hF+0dUXkt2lxu/f0Bwqbmx3QTO7mmrXYA+5Dq3ofqA=
X-Received: by 2002:a6b:901:: with SMTP id t1mr8202186ioi.42.1562782124855;
 Wed, 10 Jul 2019 11:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
 <20190703214512.41319-1-jeffrey.l.hugo@gmail.com> <20190706010604.GG20625@sirena.org.uk>
In-Reply-To: <20190706010604.GG20625@sirena.org.uk>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 10 Jul 2019 12:08:34 -0600
Message-ID: <CAOCk7No77CDRE=bnBVGzYw9ixWKO4PMBBWksm4JEeh3ydfOk+g@mail.gmail.com>
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
To:     Mark Brown <broonie@kernel.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 5, 2019 at 7:06 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jul 03, 2019 at 02:45:12PM -0700, Jeffrey Hugo wrote:
> > Add basic support with a simple implementation that utilizes the generic
> > read/write commands to allow device registers to be configured.
>
> This looks good to me but I really don't know anything about DSI,
> I'd appreciate some review from other people who do.  I take it
> there's some spec thing in DSI that says registers and bytes must
> both be 8 bit?

DSI appears to reside under DRM, and the DRM maintainers are copied on
this thread, so hopefully they will chime in.

Context on DSI:
The MIPI (Mobile Industry Processor Interface) Alliance DSI (Display
Serial Interface) spec defines an interface between host processors
and displays for embedded applications (smartphones and the like).
The spec itself is private to MIPI members, although I suspect if you
run some queries on your preferred search engine, you may find some
accessible copies of it floating around somewhere.

The spec defines some specific messages that run over the DSI link.
Most of those are grouped into the purposes of sending pixel data over
to the display, or configuring gamma, etc.  As far as I can tell, DSI
does not require these operations be backed by registers, however the
several implementations I've seen do it that way.  The spec does
mandate that to configure something like gamma, one needs to send a
message with a specific address, and payload.

The addresses for these spec defined messages are 8-bit wide, so 256
valid "destinations".  However, the payload is variable.  Most of the
defined operations take an 8-bit payload, but there are a few that I
see with 16-bit payloads.

The DSI spec defines two mechanisms for implementation specific
configuration (what I'm attempting to do with this series).  You can
use a spec defined message to select a different set of registers
(called a different page), after which point, the addresses of the
messages target implementation specific functionality.  I've seen this
used a lot on the specific panels which can be directly connected to
DSI.  The second mechanism is to use the generic read/write messages,
which the spec says are implementation defined - essentially the spec
defines the message type but the contents of the message are not spec
defined.  This is the mechanism the TI bridge uses.

As the contents of the generic read/write messages are implementation
defined, the answer to your question seems to be no - the spec does
not define that the registers are 8-bit addressable, and 8-bit wide.

In running this series more, I actually found a bug with it.  It turns
out that the TI bridge requires 16-bit addressing (LSB ordering), with
the upper 8-bit reserved for future use, but only on reads.  Writes
are 8-bit addressing.  This is part of that implementation specific
details.

I think perhaps the discussion needs to step back a bit, and decide
how flexible do we want this regmap over DSI to be?  I think its
usefulness comes from when a device can be configured via multiple
interfaces, so I don't expect it to be useful for every DSI interface.
It seems like the DSI panels use DSI directly to craft their
configuration.  As a result, we are probably looking at just devices
which use the generic read/write commands, but sadly the format for
those is not universal per the spec.  From the implementations I've
seen, I suspect 8-bit addressing of 8-bit wide registers to be the
most common, but apparently there is an exception to that already in
the one device that I care about.

Do we want to go forward with this regmap support just for the one TI
device, and see what other usecases come out of it, and attempt to
solve those as we go?

>
> A couple of minor comments, no need to resend just for these:
>
> > +       payload[0] = (char)reg;
> > +       payload[1] = (char)val;
>
> Do you need the casts?

Apparently not.  I was assuming the compiler would complain about
implicit truncation.

>
> > +     ret = mipi_dsi_generic_write(dsi, payload, 2);
> > +     return ret < 0 ? ret : 0;
>
> Please just write an if statement, it helps with legibility.

Uhh, sure.  There appear to be several instances of the trinary
operator in drivers/base/regmap/ but if an explicit if statement here
makes you happy, then I'll do it.

>
> > +struct regmap *__regmap_init_dsi(struct mipi_dsi_device *dsi,
> > +                              const struct regmap_config *config,
> > +                              struct lock_class_key *lock_key,
> > +                              const char *lock_name)
> > +{
> > +     return __regmap_init(&dsi->dev, &dsi_bus, &dsi->dev, config,
> > +                          lock_key, lock_name);
> > +}
> > +EXPORT_SYMBOL_GPL(__regmap_init_dsi);
>
> Perhaps validate that the config is OK (mainly the register/value
> sizes)?  Though I'm not sure it's worth it so perhaps not - up to
> you.

Probably.  Based on the above discussion, should I be making use of
reg_read/reg_write in the config?
