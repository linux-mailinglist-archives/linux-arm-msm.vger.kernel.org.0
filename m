Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3556840424A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 02:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348637AbhIIAbT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 20:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235458AbhIIAbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 20:31:19 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12AC0C061575
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Sep 2021 17:30:10 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id a13so101272iol.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Sep 2021 17:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SBJZ+xd67CiFIsbUo5ZILupshCxiGwC5Wpwkm3BLH6k=;
        b=QFvS6izIE+d1GGVRGHR1QEMy4lxOUpUzI8cdpEPvcnmHg6ncVokDncdiZFJpdPUMfv
         a8I1A8s8Vi1L61d1h9JgrEGyy6LFUztBBvesIm5nHaDH6EXFqKtgt5okUQHR7jxF5sC6
         3L1eCO4Ec7roeo/DZl0f2C7fNach3w+CA9UlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SBJZ+xd67CiFIsbUo5ZILupshCxiGwC5Wpwkm3BLH6k=;
        b=OjN9DUavM2AiceZmbmATGZtcoDydI3xj611PdBs/a2nmc3TN3Wb2K3y+AhY62JmdzV
         WpLauvGP1mi14nUY+PMDBfUVUpxOlSZtjOUw8gIXH5nM1bqS/492v4HPMdJfDQ8JLkP+
         yZSKjarRJ53UoyXi6VOCUcDJzFKLfVjvK/iKK0ZBq1GVNQuSzN1Tp3AQxm3s9hDEj+Vd
         VmTxij1CDD4GLU1KDsKllvhqI+Cj1tx0H8sDJGgZ8BJEGsd93+ZtSI/f9nDLIyNUzRjv
         o5SJjpQm7S2fo9l32izVzYxkKrNqzp9enYMZzV9gJOLQ2zw/P5VIijtVgKAF0gRLxa/q
         J/Ww==
X-Gm-Message-State: AOAM533bRmOZJME8UUzlj+i9H9ibNQ53Htl8A+06WRWTF7/GEQMy5Mn5
        wZC+0tDPDVgvnNIHilaB0xb1NgjPwRdeNg==
X-Google-Smtp-Source: ABdhPJyFc3wMX9kk3fFGvmhD0MpQZsLj05ks2sdh9br/EzXrLcsJ5Zm1owQOlpQNgVfRIo+UTzth9A==
X-Received: by 2002:a5e:c802:: with SMTP id y2mr246607iol.162.1631147409273;
        Wed, 08 Sep 2021 17:30:09 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id g8sm88236ild.31.2021.09.08.17.30.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 17:30:09 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id j18so87846ioj.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Sep 2021 17:30:09 -0700 (PDT)
X-Received: by 2002:a92:6b0a:: with SMTP id g10mr141704ilc.27.1631147057200;
 Wed, 08 Sep 2021 17:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.3.I4a672175ba1894294d91d3dbd51da11a8239cf4a@changeid> <87h7ey81e9.fsf@intel.com>
In-Reply-To: <87h7ey81e9.fsf@intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Sep 2021 17:24:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-d8XH5bmcAhDGnbs-DHgQ7D6G9g3gRsjo7RN1xQ1kNA@mail.gmail.com>
Message-ID: <CAD=FV=X-d8XH5bmcAhDGnbs-DHgQ7D6G9g3gRsjo7RN1xQ1kNA@mail.gmail.com>
Subject: Re: [PATCH v3 03/16] drm/edid: Allow the querying/working with the
 panel ID from the EDID
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Sep 6, 2021 at 3:05 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> > +{
> > +     struct edid *edid;
> > +     u32 val;
> > +
> > +     edid = drm_do_get_edid_blk0(drm_do_probe_ddc_edid, adapter, NULL, NULL);
> > +
> > +     /*
> > +      * There are no manufacturer IDs of 0, so if there is a problem reading
> > +      * the EDID then we'll just return 0.
> > +      */
> > +     if (IS_ERR_OR_NULL(edid))
> > +             return 0;
> > +
> > +     /*
> > +      * In theory we could try to de-obfuscate this like edid_get_quirks()
> > +      * does, but it's easier to just deal with a 32-bit number.
>
> Hmm, but is it, really? AFAICT this is just an internal representation
> for a table, where it could just as well be stored in a struct that
> could be just as compact now, but extensible later. You populate the
> table via an encoding macro, then decode the id using a function - while
> it could be in a format that's directly usable without the decode. If
> suitably chosen, the struct could perhaps be reused between the quirks
> code and your code.

I'm not 100% sure, but I think you're suggesting having this function
return a `struct edid_panel_id` or something like that. Is that right?
Maybe that would look something like this?

struct edid_panel_id {
  char vendor[4];
  u16 product_id;
}

...or perhaps this (untested, but I think it works):

struct edid_panel_id {
  u16 vend_c1:5;
  u16 vend_c2:5;
  u16 vend_c3:5;
  u16 product_id;
}

...and then change `struct edid_quirk` to something like this:

static const struct edid_quirk {
  struct edid_panel_id panel_id;
  u32 quirks;
} ...

Is that correct? There are a few downsides that I can see:

a) I think the biggest downside is the inability compare with "==". I
don't believe it's legal to compare structs with "==" in C. Yeah, we
can use memcmp() but that feels more awkward to me.

b) Unless you use the bitfield approach, it takes up more space. I
know it's not a huge deal, but the format in the EDID is pretty much
_forced_ to fit in 32-bits. The bitfield approach seems like it'd be
more awkward than my encoding macros.

-Doug
