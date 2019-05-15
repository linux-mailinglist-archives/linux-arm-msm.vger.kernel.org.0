Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59FEE1FC6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2019 23:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfEOVu1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 17:50:27 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:43078 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbfEOVu0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 17:50:26 -0400
Received: by mail-vs1-f65.google.com with SMTP id d128so935675vsc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2019 14:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AYNYXgU+/PVoj2y5Yn+qCV5g/0Te3hA7zTkDB0qlSMY=;
        b=C2exFM09NZ8pxiHyFzuOnfdw580VmYx8l289M3cy8cfVo3obMrlMZsJt86jH9W5PIl
         WH6tqH/v3LJRZF/a66EsiHG3nOAj84sMOIFcvk6+HrRsWToX1SBV1UyCKehx4R/b6jsK
         UNSSYJ0rLIbL1cM/H9l41ucAvn2nFJR1EjlSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AYNYXgU+/PVoj2y5Yn+qCV5g/0Te3hA7zTkDB0qlSMY=;
        b=UcrQNkZIdFK/6D1pKRKyJczrHDNQSRlz8Om9dxlSGXktGle6NrMoW3NyESXGPHze4E
         lQdmXYvZwrN/js7nV4a450/DcRqsIGf6hTiBxdy38sCBLoPx2nA9a1GS4ErSq31feCPJ
         i/RPM5rmc+t8Xgmh8AezBjFHA0w+Fn8o/Korxpk3HWds4X5ucHjYiMGbAcamIaY92JqV
         r4hdvys4OISnUum3A0dwGb6WiTMVinfVN6PGPplSu/ZdkOHfhfu+NXwyXFYxb8+K7l4m
         kT0MXrX9/irKbo1ZPWFNx8WCczBS11Wq2izCRrXEwtVrMUS8a6J7QVzilpsjwD8UEFz1
         SnpA==
X-Gm-Message-State: APjAAAU3575ddXrj97sM9ZlcUJTa7u1W2MGGGeOGpPae8SCxHQCDedyE
        xwsfYvDpQUuSJflEQUNXw+cqWaw9AHM=
X-Google-Smtp-Source: APXvYqxZzLitPa9Be1Ycr69Iu+GLN1KnB//oFbF7PaSKnQz09sqSJQ4DTh5tGV/frvrhRGZ/SC9zMQ==
X-Received: by 2002:a67:dc94:: with SMTP id g20mr14127242vsk.234.1557957025371;
        Wed, 15 May 2019 14:50:25 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 125sm1222563vkt.11.2019.05.15.14.50.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 14:50:22 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id v9so960537vse.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2019 14:50:22 -0700 (PDT)
X-Received: by 2002:a67:ebd6:: with SMTP id y22mr6664210vso.87.1557957022174;
 Wed, 15 May 2019 14:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190509184415.11592-1-robdclark@gmail.com> <20190509184415.11592-3-robdclark@gmail.com>
 <CAD=FV=WXW3aApS=c7baxhtfr1Nf-UnBN2s=rEBBkjj4=TCdT+g@mail.gmail.com> <CAJs_Fx5PDj+T+DVixzHjun_wCG5fhZsxH8xUqRwmkfwN87UP_A@mail.gmail.com>
In-Reply-To: <CAJs_Fx5PDj+T+DVixzHjun_wCG5fhZsxH8xUqRwmkfwN87UP_A@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 15 May 2019 14:50:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vgiej=+hCZ_Eekoa4FJfpKxhOge8Wy29EEmtjB8JeF9g@mail.gmail.com>
Message-ID: <CAD=FV=Vgiej=+hCZ_Eekoa4FJfpKxhOge8Wy29EEmtjB8JeF9g@mail.gmail.com>
Subject: Re: [RFC 2/3] arm64: dts: qcom: sdm845-cheza: Re-add reserved memory
To:     Rob Clark <robdclark@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 14, 2019 at 9:10 PM Rob Clark <robdclark@chromium.org> wrote:

> On Mon, May 13, 2019 at 3:48 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, May 9, 2019 at 11:44 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > > From: Douglas Anderson <dianders@chromium.org>
> > >
> > > Let's fixup the reserved memory to re-add the things we deleted in
> > > ("CHROMIUM: arm64: dts: qcom: sdm845-cheza: Temporarily delete
> > > reserved-mem changes") in a way that plays nicely with the new
> > > upstream definitions.
> >
> > The message above makes no sense since that commit you reference isn't
> > in upstream.
> >
> > ...but in any case, why not squash this in with the previous commit?
>
> Yeah, I should have mentioned this was my intention, I just left it
> unsquashed since (at the time) it was something I had cherry-picked on
> top of current 4.19 cros kernel..
>
> anyways, I pushed an (unsquashed, converted to fixup!'s) update to:
>
> https://github.com/freedreno/kernel-msm/commits/wip/cheza-dtb-upstreaming
>
> which has updates based on you're review comments (at least assuming I
> understood them correctly).. plus some unrelated to cheza-dt patches
> on top to get things actually working (ie. ignore everything on top of
> the fixup!'s)

Looks OK to me.  Are you going to post this?  Bjorn / Andy: do you
guys have opinions here?


> I didn't see any comments on the 'delete zap-shader' patch, so
> hopefully that means what I did there was a sane (or at least not
> insane) way to handle android/linux tz vs what we have on cheza?

I wasn't CCed, so I assumed you were looking for feedback from others
on that one.  ;-)  Oh, but I guess Jordan and Bjorn also weren't
CCed...  In any case, I replied now.
