Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE14B425B07
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 20:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243632AbhJGSmC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 14:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233848AbhJGSmC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 14:42:02 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40677C061570
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 11:40:08 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id o4so10237195oia.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 11:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=guZCAG9/M6PTktkx+p5Y506i79kkw+F0pi1xST3ThjI=;
        b=eoaFzaHrfJm1jzZKszGfYysGFsPkWiLkV42qmUaekj0K6fMN2c0pWhvZv78K/0Ad4h
         B0fmpjHvEEU6jmiaMpLUfTIJNZ8ZO+LbthEG1lvmrkvlipbM6Ca0ExLXeRmTVr00aJRd
         aEUGwgH+rUznkfE9N4jbS5jI3a4+CT93HQVqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=guZCAG9/M6PTktkx+p5Y506i79kkw+F0pi1xST3ThjI=;
        b=lbeGETaLSRufNUHz7Zf9QIb3hGiT17EFhxWdNpuBAzS77nlwNhAr9cA/YYkMYsxpBD
         em1Sc9JJk63uAMK+LwcR3aWZeqWCzhf/NTbK/hSH4mEOGqvHzxAM44StRRm4q0CXXH5k
         6FYl5RP83bFCHZPhrOhPtm3gL7ApesmBffGKbznKdLBRMZ72ZllEDK2x5p8SSb17m6pw
         UzubOWqMIksrZzhbKN05/EUTxYJPVKDvyoFh8x1g6QRXkW9gzjMnWhEpFYZM4k1xP5cD
         sZSqecYoxtHnUxsSA3POXoxqJqdvx63nz7rNN0VC5T9bpDUK4omL0Ivt/dgK5rORXRHc
         W7Pw==
X-Gm-Message-State: AOAM532RlFd3ZI5o8+w8yPAzqTkChJz5A4Hyie3QnK79fsnPNWje4WEJ
        I2l57dYVemsUgx0ubdjuzOgDpgx5Gw2+Mnv1jwUDe5aguq4=
X-Google-Smtp-Source: ABdhPJxpUjFTInikBOthEuo2yMMcPcoUAGKwZEFNquucXrsgJOhNGhmC42pATrvLazjiCWiuJ+9KXCooSjB2ec7opUg=
X-Received: by 2002:aca:f02:: with SMTP id 2mr4508153oip.64.1633632007694;
 Thu, 07 Oct 2021 11:40:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 14:40:07 -0400
MIME-Version: 1.0
In-Reply-To: <CAGETcx9T59dHXodt9MW=tTV_hYhtNOZzYFT=35D--VN7WJ0GqQ@mail.gmail.com>
References: <20211006193819.2654854-1-swboyd@chromium.org> <20211006193819.2654854-3-swboyd@chromium.org>
 <CAGETcx9T59dHXodt9MW=tTV_hYhtNOZzYFT=35D--VN7WJ0GqQ@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 7 Oct 2021 14:40:07 -0400
Message-ID: <CAE-0n50YqKr1nKy-4WaxsfuwPiJ5kZcf46t-U_4i-TpfXzOX1g@mail.gmail.com>
Subject: Re: [PATCH v2 02/34] component: Introduce the aggregate bus_type
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Saravana Kannan (2021-10-06 20:07:11)
> On Wed, Oct 6, 2021 at 12:38 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > diff --git a/drivers/base/component.c b/drivers/base/component.c
> > index 0a41bbe14981..d99e99cabb99 100644
> > --- a/drivers/base/component.c
> > +++ b/drivers/base/component.c
[...]
> > +                       continue;
> > +
> > +               /* Matches put in component_del() */
> > +               get_device(&adev->dev);
> > +               c->link = device_link_add(&adev->dev, c->dev,
> > +                                         DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
>
> Remove the STATELESS flag and you'll get a bunch of other stuff done for free:

I tried that and it didn't work for me. The aggregate device never
probed and I was left with no display. Let me see if I can reproduce it
with logging to provide more details.

> 1. The aggregate device would get force unbound when the component
> devices unbind.
> 2. You don't need to explicitly keep track of and delete the link. If
> either of the devices get deleted, it'll get deleted automatically.
> 3. It will avoid useless probe attempts of the aggregate device before
> all the component devices are probed.
>

I don't think point 3 is happening right now. We only try to probe the
aggregate device once all components probe.
