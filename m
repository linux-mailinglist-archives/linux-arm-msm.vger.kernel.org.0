Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102B440B702
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 20:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhINSij (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 14:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbhINSii (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 14:38:38 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670F0C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 11:37:21 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id 18so109192pfh.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 11:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F+vma+/6q1PCLBq1R/pn7+hiAdo2p9TNOImn3v6+f+E=;
        b=Y5lRNVAjSYwSWmKnEik3qpWm/iU4mMYqfkUUEll4nG+hRAlVIuYHtegamdA/04weNL
         icS4WvXXrm3lc4YxAXXc8RBLLVsCKZ9JUDssETyDHfmj3t4cHrKZRDPsAPBiUEDFV87/
         HlR/FVeS1f7Izg2Uv4fZNxKyS2iVszJAByNpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F+vma+/6q1PCLBq1R/pn7+hiAdo2p9TNOImn3v6+f+E=;
        b=ci/IIUKRxxOYI16wAIyipFBfNeVdLYu6A3LC7CqXRFdJs09nk8h5smog+jIvPY9bxm
         4y+RPcs43bmDx3ANBuX1jC11SfQXXrqVa252hWg4w7AvKZKeg+kShCYCPBQjotBcjZAm
         1rU08YY5WnkjvOpyUNGIF+KLorCK02AitZDtMUlVRdqFcOCvpCf2xCdrIvZ2Bk+FnfSt
         i0jvA5kaI+ULlPAfZCZQ2qfV59iFv8ucu935SIo0+zfnxutXfaIDKtNNxKQ470++ehOb
         uB5GhFDcEHI3Eu/g/eH3s/B5F6V9iB8cVMBokm6uJr3aYNIVI0rdJPldpfuz2iFx2d2C
         Lmjw==
X-Gm-Message-State: AOAM532vf720knt6Zyoa6FZ8We+9SvtjcFDfTVgbgqXaL+s3MUxRdpqj
        o8k3nImQPm+qhuHQGzxiEhMGUUc5cPuAIw==
X-Google-Smtp-Source: ABdhPJwD3+hN7bAlO8roZdEuEe3PZOAWafqpOwR7g/2VkkCA1Z6e/HMB/LvRXofW1BKyr9gdIxhwNw==
X-Received: by 2002:a65:40c4:: with SMTP id u4mr16809122pgp.186.1631644640617;
        Tue, 14 Sep 2021 11:37:20 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com. [209.85.210.178])
        by smtp.gmail.com with ESMTPSA id t68sm12346647pgc.59.2021.09.14.11.37.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 11:37:20 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id w19so91715pfn.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 11:37:20 -0700 (PDT)
X-Received: by 2002:a5d:8458:: with SMTP id w24mr14646554ior.168.1631644283448;
 Tue, 14 Sep 2021 11:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210909210032.465570-1-dianders@chromium.org>
 <20210909135838.v4.4.I6103ce2b16e5e5a842b14c7022a034712b434609@changeid> <87ee9r10qw.fsf@intel.com>
In-Reply-To: <87ee9r10qw.fsf@intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 14 Sep 2021 11:31:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgLcOBOOp9kgShE4+T8g8UZcO_Ff3hhAbGTyLkdE7HNA@mail.gmail.com>
Message-ID: <CAD=FV=XgLcOBOOp9kgShE4+T8g8UZcO_Ff3hhAbGTyLkdE7HNA@mail.gmail.com>
Subject: Re: [PATCH v4 04/15] drm/edid: Use new encoded panel id style for
 quirks matching
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Sep 14, 2021 at 11:16 AM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
>
> On Thu, 09 Sep 2021, Douglas Anderson <dianders@chromium.org> wrote:
> > In the patch ("drm/edid: Allow the querying/working with the panel ID
> > from the EDID") we introduced a different way of working with the
> > panel ID stored in the EDID. Let's use this new way for the quirks
> > code.
> >
> > Advantages of the new style:
> > * Smaller data structure size. Saves 4 bytes per panel.
> > * Iterate through quirks structure with just "==" instead of strncmp()
> > * In-kernel storage is more similar to what's stored in the EDID
> >   itself making it easier to grok that they are referring to the same
> >   value.
> >
> > The quirk table itself is arguably a bit less readable in the new
> > style but not a ton less and it feels like the above advantages make
> > up for it.
>
> I suppose you could pass vendor as a string to EDID_QUIRK() to retain
> better readability?

I would love to, but I couldn't figure out how to do this and have it
compile! Notably I need the compiler to be able to do math at compile
time to compute the final u32 to store in the init data. I don't think
the compiler can dereference strings (even constant strings) and do
math on the result at compile time.

I _think_ you could make it work with four-character codes (only
specifying 3 characters), AKA single-quoting something like 'AUO' but
I think four-character codes are not dealt with in a standard enough
way between compilers so they're not allowed in Linux.

If you like it better, I could do something like this:

#define ACR_CODE 'A', 'C', 'R'
#define AUO_CODE 'A', 'U', 'O'
...
...

...then I could refer to the #defines...


> Just bikeshedding, really. ;)

I'll take this comment (without any formal tags) as:

* You've seen this patch (and the previous ones) and wouldn't object
to it merging.

* You're not planning on any deeper review / testing, so I shouldn't
wait for more stuff from you before merging. Please yell if this is
not the case. I'm happy to wait but I don't want to wait if no further
review is planned.


In general I'm still planning to give this series at least another
week for comments before merging. ${SUBJECT} patch also is the only
one lacking any type of Review / Ack tags so I'll see if I can find
someone to give it something before merging, too.


-Doug
