Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 219912D336
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 03:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbfE2BTV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 21:19:21 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37873 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbfE2BTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 21:19:21 -0400
Received: by mail-pf1-f195.google.com with SMTP id a23so460563pff.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2019 18:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OGp/SVq1BboOzjtWbeRiaeLK2DoNo5kwnKAHPJUWJC8=;
        b=XTLgE4jLYkcAf82yQJQHOxI2WQlIK+hfyDUZTEh2jv2FfYj/ldEwrrDJpK3RHYALsp
         LAyTiXtweVHY8rrGU+DFxz6PhY/+x4Xg6GSGGPJP7wyPqKjk5AYmBXzElqoeFQglv46h
         EYeAMkxm82GPsYA6Dl3lyEaQa522r0Nk9AHXxq2CLlMMigv5xlubs511c1ikvmUTxI9J
         8YXpD8zIcUXKBpfiVq0vbjWX2GLj3eO1M2YYGfPWnWUtnSY9GtRG8HmwUHuXA7Qdd4V0
         mqcUJAMU7EsOaNn1DLeXveQOG+UPIRa+Om+h3GlSMSuvQomX6/goBig+r2cyhpzCbOmc
         rhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OGp/SVq1BboOzjtWbeRiaeLK2DoNo5kwnKAHPJUWJC8=;
        b=rgtWEA/qk75vjQGVEFqu3GpG/s2vnb6QGDR94rPlLhz5veM/a7VdTVtYnmOorjKB2w
         s9VT9/t0koqPPtOQvWXGHoyGfD7k8Jh9K/rOlQFq71huHQUuohTES84Klru4/860zsl3
         5qY331Gu7YrXAjNuUD+wPKX5mr8fePCifaN4faaniPAaGHh96SQwDhiRtP1C5QNmkm2d
         1XSgAsduvEXknSgX36xH9HFzqUFB9LgEq7R8rAm1aKVBZkEJ1sSIPMTpsBqejzt7iq5O
         C4ueayYTAWvQi01iEGk3rj3tY/py0cDm/A3r2EUZYL/deUceXH2/iKC48eAIvQ4Umk5d
         OS7w==
X-Gm-Message-State: APjAAAW2yPigJJFF5O/lfrpgE4p4xi5lU0O5sJLjeNWHmY8PALii8poU
        QQYZ927PsLxLxYJR7ZzKV3iUjuNJiHj/qnhU8cxgz8KqHqk=
X-Google-Smtp-Source: APXvYqzKBKbh9FlqhV2c4nS78H7i32JyHewq3SARV/q+kmb02iB8x11yvJCrGGI3CHBGRvG0DL5TrZLhFiEgXTxM2BY=
X-Received: by 2002:a63:fc5b:: with SMTP id r27mr37622272pgk.219.1559092760183;
 Tue, 28 May 2019 18:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <5ce71d79.1c69fb81.dd0de.33cf@mx.google.com> <7hv9y01z85.fsf@baylibre.com>
 <20190524012913.D9BB72168B@mail.kernel.org> <CAP245DXkEym=x3vrN2cc2y+uHHx_+z0cW0WsV0dGGXfd+c2mSQ@mail.gmail.com>
 <CAJ=6tTqdvgsoVH+3=_6ucAyuhgSjjVSROBKwtxjYwO1vmFvxfg@mail.gmail.com>
 <CAJ=6tTr4EaLLiavN+aRpU3JnJ5MuAtU-uer_8iLm7QMh6i4rAg@mail.gmail.com> <20190529010627.GA8566@localhost.localdomain>
In-Reply-To: <20190529010627.GA8566@localhost.localdomain>
From:   Andy Gross <andygro@gmail.com>
Date:   Tue, 28 May 2019 20:19:09 -0500
Message-ID: <CAJ=6tTqOW5s_dhEuy3su+R6=tUY_ZiuAuCMG1A8Y-Lz-aHXw2Q@mail.gmail.com>
Subject: Re: next/pending-fixes boot: 227 boots: 6 failed, 198 passed with 20
 offline, 1 untried/unknown, 2 conflicts (v5.2-rc1-375-g3695b18d1e9cd)
To:     Eduardo Valentin <edubezval@gmail.com>
Cc:     Amit Kucheria <amit.kucheria@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>,
        Kevin Hilman <khilman@baylibre.com>,
        kernel-build-reports@lists.linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 28, 2019 at 8:06 PM Eduardo Valentin <edubezval@gmail.com> wrote:
>
> Hello,
>
> On Tue, May 28, 2019 at 04:37:15PM -0500, Andy Gross wrote:
> > +Eduardo
> >
> > On Tue, May 28, 2019 at 1:09 PM Andy Gross <andygro@gmail.com> wrote:
> >
> > > On Sun, May 26, 2019 at 4:51 PM Amit Kucheria <amit.kucheria@linaro.org>
> > > wrote:
> > >
> > > <snip>
> > >
> > > > Sorry for breaking the boot on 8064. That was one of the platforms
> > > > that I didn't convert over to regmap (needs more refactoring). I had
> > > > hoped kernelci would catch any issues but looks like thermal-soc tree
> > > > entered linux-next quite late and didn't catch this.
> > > >
> > > > Does reverting 3e6a8fb33084 ("drivers: thermal: tsens: Add new
> > > > operation to check if a sensor is enabled") fix the issue? If so,
> > > > reverting that commit might be the best course of action since I've
> > > > started vacations and can't fix this for 8064 in a meaningful amount
> > > > of time (until 3rd week of June). cc'ing Bjorn in case this needs more
> > > > investigation, but I think that patch is fairly self contained and
> > > > reverting it shouldn't have any knock-on effects.
> > >
> > > I am ok with this.  I'll check with Bjorn before adding this to a
> > > fixes for -rc2.
> > >
> >
> > Eduardo, we have a situation with the Qcom tsens driver and
> > commit  3e6a8fb33084.  Do you mind if I send in a revert for this through
> > my tree or can you do this for us for -rc2?
>
> I can revert this patch. I can confirm that it is selfcontained and
> reverting seams to work. I am sending the revert to -rc3, as rc2 is
> already out.

Perfect.  Thanks Eduardo!

Andy
