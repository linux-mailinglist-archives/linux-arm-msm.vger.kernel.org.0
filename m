Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33225118F21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2019 18:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbfLJRgP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 12:36:15 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:33517 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbfLJRgP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 12:36:15 -0500
Received: by mail-vs1-f65.google.com with SMTP id n27so13699212vsa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 09:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LF0NUs/gTAbnPh3P7c8Oln5jd1snr+9Etxa+YYjvbv0=;
        b=dl6WuCKFsUS31yk49Inxc+5dHDgOn52SzlNfT/7dg+1I9qaCNTBCwNCCKAKKv5A7Li
         Ay1z4j3MBsFKfYnfh6TAdmG7cTRkUf9somwN+9q44jT3L8VZvZFwd9ybu2MrXOlpkDC3
         IgEEHFW8OOkvaKCoqcV1sdlJeqDsqOUD3JJxESAsE1NzAEN+KIC/kym/qNJlTwFBhEzL
         4FF0JAjwEgxbq3VRnWZI8Yid6QLfbMv1+4jxKRe309K7+fJwHG7ODyEeRnGUHZqiM1VX
         h5+BI8i2v5NH/K5rvCuSU2hBmOW3byyeDXZLSOxPtBwoW5cmbw/WzRHs48GCULg1skiW
         DNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LF0NUs/gTAbnPh3P7c8Oln5jd1snr+9Etxa+YYjvbv0=;
        b=Ms9uDg4mZl+nJUKy3QiBgp6RDaU++BRHCWo6pOEfQWuQ2dKt6Zbcu9zF410T6F+rMZ
         irVtqN0FfouxuRYz6uNwkUhJ8xjMtXBQ/i/feWmlLa+/f37685FOB49nFx6AWp7GsVUG
         ayDbbcvnU2JKrkfv6c+/91Y1ieI13gAyQVbCZ5NFNY78bqrm/XW2r/oRbo4qrDsEbb2s
         QU+f+wfAUGBhyoOYQlcKPb/JT3zHm/S+QAhJzV+7GFHplN4UVvaD+PZb9V+wdbJjA9xS
         hkE7FQSE6p3kJ/AhjfkAMIFa2w8dFUy+X6SvxLzTE83VWag+bFKzjY+Srx8UQ5kNBQMp
         hwzQ==
X-Gm-Message-State: APjAAAUZO39EH5HC5VhBCUxA175ENhFQshJPxV7d+vecBipyQzodzpvG
        boR7NmDU8zkJtPURG5mYJ9SqSIyupp5YYArMe9Ksfw==
X-Google-Smtp-Source: APXvYqzFz6yoFGEfW03gURGMxzSAkxQY/YFTYE5kw7PmONkGWJkCKN3lGIhJ7kLEYxYUXYGbEDxHiBIBu8xebUTWbew=
X-Received: by 2002:a67:fb41:: with SMTP id e1mr18789486vsr.159.1575999374197;
 Tue, 10 Dec 2019 09:36:14 -0800 (PST)
MIME-Version: 1.0
References: <1573068840-13098-1-git-send-email-agross@kernel.org>
 <1573068840-13098-2-git-send-email-agross@kernel.org> <CAHLCerN7buq82RmmFkoSi_n8g8sSe9VO2utcXuEGM3xG3HcRTg@mail.gmail.com>
 <20191108031854.GA12993@hector.lan> <20191210105737.GB228968@gerhold.net>
In-Reply-To: <20191210105737.GB228968@gerhold.net>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Tue, 10 Dec 2019 23:06:03 +0530
Message-ID: <CAHLCerPs8+Fp1N-x7cQ2ETQ8d+fHN5b08V-jVFyFdQLYDndoBA@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.5
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 10, 2019 at 4:27 PM Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Thu, Nov 07, 2019 at 09:18:54PM -0600, Andy Gross wrote:
> > On Thu, Nov 07, 2019 at 07:36:03PM +0530, Amit Kucheria wrote:
> > > (Removing arm-soc)
> > >
> > > Hi Andy,
> > >
> > > On Thu, Nov 7, 2019 at 1:04 AM Andy Gross <agross@kernel.org> wrote:
> > > >
> > > > Arnd, Olof, and Kevin,
> > > >
> > > > I have one slight faux paux in this pull request.  A drivers: soc change got
> > > > into my arm64 DTS branch and while it is innocuous, it wasn't easy to fix
> > > > without messing up a lot of people who depend on the SHAs not changing.  So I'm
> > > > sorry for this inclusion.  I'll scrub this better next time.
> > > >
> > > > Andy
> > >
> > > > ----------------------------------------------------------------
> > > > Amit Kucheria (5):
> > > >       arm64: dts: qcs404: thermal: Add interrupt support
> > > >       arm64: dts: msm8998: thermal: Add interrupt support
> > > >       arm64: dts: msm8996: thermal: Add interrupt support
> > > >       arm64: dts: sdm845: thermal: Add interrupt support
> > > >       arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
> > >
> > > One of my patches to add interrupt support to msm8916 tsens is missing
> > > here. Specifically this one:
> > > https://patchwork.kernel.org/patch/11201853/
> > >
> > > Will there be a second PR this cycle?
> >
> > I can work up another and throw it on top.
> >
>
> FYI, the patch seems to be still missing in 5.5-rc1.
> tsens now fails to probe on MSM8916 with:
>
>   qcom-tsens 4a9000.thermal-sensor: IRQ uplow not found
>
> Can you queue up the patch as fix for 5.5?

Indeed. Andy/Bjorn, let me know if you need anything from me to get
this into -rc2.

Regards,
Amit
