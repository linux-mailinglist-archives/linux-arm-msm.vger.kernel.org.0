Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66C51CC506
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2020 00:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728420AbgEIWt7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 18:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgEIWt7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 18:49:59 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48ADFC061A0C
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 May 2020 15:49:59 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id g2so3367375vsb.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2020 15:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TXUBBXmljQ5wXNIAowkwYkd4kb/4nsVYm0GYUwUuYac=;
        b=Tkqv2f5gzC+XAAIPgdH4R2bngWQK+egYnu5AfQSyhmjrOFiaTRmfAv7lxgLnmQRtYh
         NBnfLaEJwQKjW3zaO8N1Ey2h0IUcGByzxK0QPSE9/2kqI0YP0aHCLIuvqeL3qlQkJmgq
         GdgmD/Eytja1TI6YPeB/tQ7b4pxyojrn+yLps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TXUBBXmljQ5wXNIAowkwYkd4kb/4nsVYm0GYUwUuYac=;
        b=c+zgqaM517Awel46NKO5a7LjboKPR+KfPvKaLL/CVnF5+O4E8BNzjQR8GL3eu28Fdy
         DcAW5lHZwxO88buf/mkxFlnhpvZvYXBZU4zaLQzMSu7eHTKSCnLNhcpAAMvqJ2tCBl8t
         F0K5ABITjK+0QfXTazBQmXQRnXnVOiWDhL1pJnSz9YqMDXT4sPdjnC8dDE8hfUdv6zv6
         UFrzo4KWIvVyIyKbAnQefAzyhVdcelUFlrgpDb4oYOXfjuJ2PL0/zv2HPlGp5x/cUNb+
         d5GMjHPiQtVvvGCAjqXDlaBU7gNZPKfsvl/htgsnOaDRCIx+qGZ3TJJckSAqfzSi4kma
         fMiw==
X-Gm-Message-State: AGi0PuZ+qiP7Rf+iPFpOZj3LkoSZn4OFDN/9NCa9UDky9+0heJEPEBfw
        59pROtxJjC53zd3U2heMjZrxNFjNDBU=
X-Google-Smtp-Source: APiQypLbHgv1ixX+qTKGmp7XsSqN8OA8NHtq0R9wZfp8E3RUSyskepfnnNjtBX4e5h8V0tmXXXlp5w==
X-Received: by 2002:a67:d81b:: with SMTP id e27mr7155253vsj.40.1589064598196;
        Sat, 09 May 2020 15:49:58 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id y143sm5341337vky.9.2020.05.09.15.49.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2020 15:49:57 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id 36so2047258uaf.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2020 15:49:57 -0700 (PDT)
X-Received: by 2002:ab0:45c7:: with SMTP id u65mr7022602uau.8.1589064596879;
 Sat, 09 May 2020 15:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
 <20200509200021.GA30802@ravnborg.org>
In-Reply-To: <20200509200021.GA30802@ravnborg.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Sat, 9 May 2020 15:49:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W+sAfu-A0ScE+hzNOd=jxnf+YZgwygPoR-gFqm0b++5A@mail.gmail.com>
Message-ID: <CAD=FV=W+sAfu-A0ScE+hzNOd=jxnf+YZgwygPoR-gFqm0b++5A@mail.gmail.com>
Subject: Re: [PATCH 1/3] panel: simple: Fix size and bpp of BOE NV133FHM-N61
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, May 9, 2020 at 1:00 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Douglas
>
> On Fri, May 08, 2020 at 03:59:00PM -0700, Douglas Anderson wrote:
> > The BOE NV133FHM-N61 is documented in the original commit to be a
> > 13.3" panel, but the size listed in our struct doesn't match.
> > Specifically:
> >
> >   math.sqrt(30.0 * 30.0 + 18.7 * 18.7) / 2.54 ==> 13.92
> >
> > Searching around on the Internet shows that the size that was in the
> > structure was the "Outline Size", not the "Display Area".  Let's fix
> > it.
> >
> > Also the Internet says that this panel supports 262K colors.  That's
> > 6bpp, not 8bpp.
> >
> > Fixes: b0c664cc80e8 ("panel: simple: Add BOE NV133FHM-N61")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Added to drm-misc-next as I did not think this had to be updated in
> mainline right now. Let me know if you expect it to land in mainline
> soonish.

drm-misc-next is perfect, thanks!

-Doug
