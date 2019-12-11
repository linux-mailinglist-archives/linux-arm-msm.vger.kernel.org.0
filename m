Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADD6D11A874
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 11:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728757AbfLKKAo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 05:00:44 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:34043 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbfLKKAo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 05:00:44 -0500
Received: by mail-ua1-f52.google.com with SMTP id w20so8556400uap.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 02:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GPHN1AYuunZqO/oxGQmIHjw9s2N+wk7NQPQ24v17qUM=;
        b=dGrmOjNR7baqiE2L5L/Ybgc7o6d7FBSsYshMAu12KnMmgEXtcHtpUrD/oD+H+OnY+V
         anlCviiva6XzZMibzlxDTK15C+HOkJ3bhkU7BA3GfOob4wcHYNvyKKp2tOO3O1jfaUeI
         0ITFfsHqBYZatXLd5rW3ZRJV8j3zROBpm3VGeIevq58B5D09uGoHw0m0mxiAMUx+7yh4
         sfGnslmsuqyjuJ1MX3/btt3HN8nKWOMy+E33e1/lEHI8HL5KBH+4NXh4aDu81m7BbLIb
         +Qu+QPsgdk/5kKugf3YeogdikHfPlUYM1VL9V02TxyagIg8itcDg0pweUqkbKrQGD3VK
         vDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GPHN1AYuunZqO/oxGQmIHjw9s2N+wk7NQPQ24v17qUM=;
        b=QpHjcdeyxTL45q4H1I5fdfyeW+3MO3sUdbJP9FzQEZJ3n4SgoGtNfxi1liB3UwQt+G
         0jUQS6DJyD7gyTDW9jNwvnefcrrUDJEejlBWNSQef6FS4bTlkejXDfToeR3O2J0g4y6u
         F0z8KZ756ZUEC8/nbak1fyt+3tm0Rh7rORTdk+7UdUzz4pGfuxr6bV09eGEtge+3lILy
         vdN1SJhS9b41rzFGNWb/W1sb4CxC+ig5ZqZ+848uxN605pA5cZAgB7fwAi/4QX9PtNSn
         FtBMwGg0KMqVWSPWTmPLhmt7QXsKByYlZ1adOgOYReDDjux3794m+1zQlqc5ygZ+PPTu
         tW9Q==
X-Gm-Message-State: APjAAAVjeSPVfcZIQmtX7EGIpLNwVMHeHOWhn6UVfqlu00M9hmFtgN0P
        yA1NRLUUSwVOdeiu9wRtkqC3WFdSu7JWJ5dgdICvHg==
X-Google-Smtp-Source: APXvYqwlsnaNq951yteb1PwTdfkJJKYihJ7CwyOE/btAs9WN7+ZCke/5ntTlGoE1GZnJV/cHfBxqmwkKwhXt46MAt+w=
X-Received: by 2002:ab0:7352:: with SMTP id k18mr2032094uap.77.1576058442748;
 Wed, 11 Dec 2019 02:00:42 -0800 (PST)
MIME-Version: 1.0
References: <1573068840-13098-1-git-send-email-agross@kernel.org>
 <1573068840-13098-2-git-send-email-agross@kernel.org> <CAHLCerN7buq82RmmFkoSi_n8g8sSe9VO2utcXuEGM3xG3HcRTg@mail.gmail.com>
 <20191108031854.GA12993@hector.lan> <20191210105737.GB228968@gerhold.net>
 <CAHLCerPs8+Fp1N-x7cQ2ETQ8d+fHN5b08V-jVFyFdQLYDndoBA@mail.gmail.com>
 <20191210181725.GD314059@yoga> <CAOesGMiiMG8kND=ZGv93t525B4L3ogA7py+3fdw2F6XaZspw_w@mail.gmail.com>
In-Reply-To: <CAOesGMiiMG8kND=ZGv93t525B4L3ogA7py+3fdw2F6XaZspw_w@mail.gmail.com>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Wed, 11 Dec 2019 15:30:30 +0530
Message-ID: <CAHLCerPsxhhLTN2bD8J97iQD=DzGzJrb=tV8jZ1t_xohj2PWxg@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.5
To:     Olof Johansson <olof@lixom.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 11, 2019 at 2:31 AM Olof Johansson <olof@lixom.net> wrote:
>
> On Tue, Dec 10, 2019 at 10:17 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 10 Dec 09:36 PST 2019, Amit Kucheria wrote:
> >
> > > On Tue, Dec 10, 2019 at 4:27 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> > > >
> > > > On Thu, Nov 07, 2019 at 09:18:54PM -0600, Andy Gross wrote:
> > > > > On Thu, Nov 07, 2019 at 07:36:03PM +0530, Amit Kucheria wrote:
> > > > > > (Removing arm-soc)
> > > > > >
> > > > > > Hi Andy,
> > > > > >
> > > > > > On Thu, Nov 7, 2019 at 1:04 AM Andy Gross <agross@kernel.org> wrote:
> > > > > > >
> > > > > > > Arnd, Olof, and Kevin,
> > > > > > >
> > > > > > > I have one slight faux paux in this pull request.  A drivers: soc change got
> > > > > > > into my arm64 DTS branch and while it is innocuous, it wasn't easy to fix
> > > > > > > without messing up a lot of people who depend on the SHAs not changing.  So I'm
> > > > > > > sorry for this inclusion.  I'll scrub this better next time.
> > > > > > >
> > > > > > > Andy
> > > > > >
> > > > > > > ----------------------------------------------------------------
> > > > > > > Amit Kucheria (5):
> > > > > > >       arm64: dts: qcs404: thermal: Add interrupt support
> > > > > > >       arm64: dts: msm8998: thermal: Add interrupt support
> > > > > > >       arm64: dts: msm8996: thermal: Add interrupt support
> > > > > > >       arm64: dts: sdm845: thermal: Add interrupt support
> > > > > > >       arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
> > > > > >
> > > > > > One of my patches to add interrupt support to msm8916 tsens is missing
> > > > > > here. Specifically this one:
> > > > > > https://patchwork.kernel.org/patch/11201853/
> > > > > >
> > > > > > Will there be a second PR this cycle?
> > > > >
> > > > > I can work up another and throw it on top.
> > > > >
> > > >
> > > > FYI, the patch seems to be still missing in 5.5-rc1.
> > > > tsens now fails to probe on MSM8916 with:
> > > >
> > > >   qcom-tsens 4a9000.thermal-sensor: IRQ uplow not found
> > > >
> > > > Can you queue up the patch as fix for 5.5?
> > >
> > > Indeed. Andy/Bjorn, let me know if you need anything from me to get
> > > this into -rc2.
> > >
> >
> > I'm pulling in some fixes for a rc-pull, so I could add it there.
> >
> > But why are we breaking backwards compatibility with existing dtbs to
> > add a new (optional) feature? Shouldn't there be a rc-fix in the driver
> > for this regression?
>
> 100% agreed.
>
> Driver shouldn't require the DT update to continue to function. It
> needs to fill in the previous behavior as default.
>
> As a matter of fact, based on that I don't want to see that DT patch
> as a fix, please queue it up for 5.6 instead.

I've posted a fix for -rc2 to allow the driver to continue to work
with old DTBs. Please consider for -rc2.

Regards,
Amit
