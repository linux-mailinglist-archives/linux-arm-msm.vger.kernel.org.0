Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB2255B05F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 17:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfF3P0C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 11:26:02 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45626 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfF3P0C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 11:26:02 -0400
Received: by mail-ed1-f66.google.com with SMTP id a14so18518128edv.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jun 2019 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gHDuyQyipf6+B4/tN6dPauaHdhnnRjQUM73xUOdIo4Y=;
        b=JLRZSukeG+yRwOttw1L3BnWxitCLcqmur4EOXDxIG1IzDA7QVtWhebBqbRTwt1ClYD
         HE/OZsAycryAGYPJacynE3B2iCj3goyRHRZl7qGK1rvaLQ5cuF9k2pH6CUkkZiZdEsbb
         xtc/yFonh5PK7r0GaA3G22L+BsSbGO+dWDCuEIwB+jIyufhe2uWZn7qNk6BCf34eJ3ey
         BjIJUJFpsll2YFXWvH6Oy8elJIMhdmpx0YlEg9ydydXfCcMF/mrsKkTECG9Tu81P4Y5D
         sKt2/HA45TFFtbsAq8VA0mIIemFtNUHr9n3trpgiVyRwUIuRcvJwC3Z8/qqIYKVLNg2K
         JaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gHDuyQyipf6+B4/tN6dPauaHdhnnRjQUM73xUOdIo4Y=;
        b=GwbRul3bkReVzcriz640ma23l94JSQ9LevrFNN6mqZ88Qs/S4g8JNNHm32bvGqSr1l
         ijpQW/wVFXoHTxQBDluWgGjPF/NWbQ5BynYD8Tlp6E33wL9edqmewEFiWtLnoScV7VSv
         qcn+p6BxQ2Yrtid2BKaI6/7MA+yXOp/nZESRbTh3n5t1LcKelAz1swcFmHlU0xRkmrgw
         Y3qPq8bnjsOp03c8qUNxscTX7BIbB/kN6fOHZrmn/OW4q2U/kg9fvO1KiTpUZyeZ1zaa
         56Y8BfaiXv6k/+oc8qouy3QwlGUd8JX2aMKWqs8rGk40xuqq21gM0+VWUqiqYGGjzEsg
         Arsg==
X-Gm-Message-State: APjAAAWu8+joqYlWjG+YoScTGF5E2cctKvPqM3zVPAVWOsJVDTvwkXoo
        m5fUowQ5ESe0DkSLDqmiL7ndLpAkOJ7uCOAd5xA=
X-Google-Smtp-Source: APXvYqxZ9nP6Qq2+dhZaSf9o86LLcNw3JpZzAZYVZtz/9E9mZvwLSU8JYIAlcm9Ap2Rzd45G312eAPczGSWb4PiCoFo=
X-Received: by 2002:aa7:d888:: with SMTP id u8mr23439480edq.264.1561908360841;
 Sun, 30 Jun 2019 08:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190629125933.679-1-linus.walleij@linaro.org>
 <20190629125933.679-4-linus.walleij@linaro.org> <CAF6AEGun2QEMVyO+L3W0UJubgzVPrFr5jkVoTOwHpy9b4MeJMQ@mail.gmail.com>
 <CACRpkdYAmVSiUQozgCvaNe_X1hcmhAzeApQcSxdhWC_wg0tdsg@mail.gmail.com>
In-Reply-To: <CACRpkdYAmVSiUQozgCvaNe_X1hcmhAzeApQcSxdhWC_wg0tdsg@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 30 Jun 2019 08:25:44 -0700
Message-ID: <CAF6AEGtn+VEHszMeuap9zkPCm4NFc0CskjnF40HprUOzYi=1+Q@mail.gmail.com>
Subject: Re: [PATCH 4/7] gpio: of: Support some legacy Qualcomm HDMI bindings
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 30, 2019 at 8:18 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Jun 30, 2019 at 3:26 PM Rob Clark <robdclark@gmail.com> wrote:
>
> > I'm ok with this.. although I wonder if we need to try this hard for
> > backwards compat?  At least I don't see any upstream dts
> > using the old names.  Maybe it is ok to just look the other way and break them.
>
> I am usually of the opinion that if a tree falls in the forest and noone
> is there to hear it, who cares what sound it makes.
>
> So we can just apply the other patches and not this one, which
> should work just fine. It will support the variants of the
> bindings ending with "-gpios" or "-gpio".

Sounds good.. if the tree falls loud enough that someone does indeed
hear it, we can resurrect this patch :-)

BR,
-R
