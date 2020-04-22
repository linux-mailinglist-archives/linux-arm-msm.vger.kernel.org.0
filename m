Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD811B4DA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 21:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgDVTuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 15:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725779AbgDVTuN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 15:50:13 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02238C03C1AA
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 12:50:13 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id c17so3118127uae.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 12:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3SOZ/kuYPJyFAJV3DkFh+WewThK39UItCMPkriQP28k=;
        b=N4XJyGIORMnB7t4xAh0V4FafNe7aQpOGecPfMWtYdZA1QWheksB21HqlyRprFqBNlx
         1WFMRq7wGfLDwgMeBX/p5CovR+swvRXlk7Z/YeQtBbrhcReV/vZ47nhBDqDGNPC3GPPh
         VWul0+ZhqslDhGi2ur2rAQ33vUyHb0HULuIHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3SOZ/kuYPJyFAJV3DkFh+WewThK39UItCMPkriQP28k=;
        b=O9sdWfiLDC49sq0oW8nDWAFZtILzjHeW4fPNpbvvmePsKbYB5Dfhpep0Sq/f0zh7xF
         kcupkukSVYeXGFF1ogn04IahcFBs1K9Xw0qzR00nZHHZPJzp45NwitECWyNseREMO8dx
         zK6xBHOLnhFVZ7Hf0spoAWyYK5eB3hN7pstJgGaRaoA8SQU4CWIhjy7eqmmWj5bYZe2+
         6AEHeP9+M5GBtYEqaBXAycNjUMwvsR8Pj5/05YeeA0PjML1RunKjyD6n1PDxD6giZNCe
         iqKPyx78H4wurRo+Cqy6FHfAlkM5QGxST9B35Qpgf16yCUQ2Oav1zEA/wflNDeEsn96X
         4jfg==
X-Gm-Message-State: AGi0PuZ7vA8iDwaDWsECTyiFzHzSyIU79Oez2zjjfezBfZKIK5HhFg4z
        PzVS/hwiV7mDp0A6ab70AW+WvEhTScY=
X-Google-Smtp-Source: APiQypLmC4h4WNsRcFd/PI1sZRmcORDkh5d6D5vyABuQeGpXp/+obeiG9/NvZw/hWk71SAzHGr+0/w==
X-Received: by 2002:ab0:705:: with SMTP id h5mr223271uah.74.1587585010558;
        Wed, 22 Apr 2020 12:50:10 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id d83sm117384vka.34.2020.04.22.12.50.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 12:50:09 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id y10so3132124uao.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 12:50:09 -0700 (PDT)
X-Received: by 2002:a67:fc46:: with SMTP id p6mr410935vsq.169.1587585008976;
 Wed, 22 Apr 2020 12:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
 <0023bc68-45fb-4e80-00c8-01fd0369243f@arm.com> <37db9a4d524aa4d7529ae47a8065c9e0@codeaurora.org>
 <5858bdac-b7f9-ac26-0c0d-c9653cef841d@arm.com> <d60196b548e1241b8334fadd0e8c2fb5@codeaurora.org>
 <CAD=FV=WXTN6xxqtL6d6MHxG8Epuo6FSQERRPfnoSCskhjh1KeQ@mail.gmail.com>
 <890456524e2df548ba5d44752513a62c@codeaurora.org> <20200331074400.GB25612@willie-the-truck>
 <1bf04938249bcd5b2111c1921facfd25@codeaurora.org>
In-Reply-To: <1bf04938249bcd5b2111c1921facfd25@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 22 Apr 2020 12:49:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VBM6cS1UmWTUJ2vrt0a2zn7xV3C53tpthBx58M2=1JPg@mail.gmail.com>
Message-ID: <CAD=FV=VBM6cS1UmWTUJ2vrt0a2zn7xV3C53tpthBx58M2=1JPg@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu: Demote error messages to debug in
 shutdown callback
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 31, 2020 at 12:53 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Will,
>
> On 2020-03-31 13:14, Will Deacon wrote:
> > On Tue, Mar 31, 2020 at 01:06:11PM +0530, Sai Prakash Ranjan wrote:
> >> On 2020-03-30 23:54, Doug Anderson wrote:
> >> > On Sat, Mar 28, 2020 at 12:35 AM Sai Prakash Ranjan
> >> > <saiprakash.ranjan@codeaurora.org> wrote:
> >> > >
> >> > > > Of course the fact that in practice we'll *always* see the warning
> >> > > > because there's no way to tear down the default DMA domains, and even
> >> > > > if all devices *have* been nicely quiesced there's no way to tell, is
> >> > > > certainly less than ideal. Like I say, it's not entirely clear-cut
> >> > > > either way...
> >> > > >
> >> > >
> >> > > Thanks for these examples, good to know these scenarios in case we
> >> > > come
> >> > > across these.
> >> > > However, if we see these error/warning messages appear everytime then
> >> > > what will be
> >> > > the credibility of these messages? We will just ignore these messages
> >> > > when
> >> > > these issues you mention actually appears because we see them
> >> > > everytime
> >> > > on
> >> > > reboot or shutdown.
> >> >
> >> > I would agree that if these messages are expected to be seen every
> >> > time, there's no way to fix them, and they're not indicative of any
> >> > problem then something should be done.  Seeing something printed at
> >> > "dev_error" level with an exclamation point (!) at the end makes me
> >> > feel like this is something that needs immediate action on my part.
> >> >
> >> > If we really can't do better but feel that the messages need to be
> >> > there, at least make them dev_info and less scary like:
> >> >
> >> >   arm-smmu 15000000.iommu: turning off; DMA should be quiesced before
> >> > now
> >> >
> >> > ...that would still give you a hint in the logs that if you saw a DMA
> >> > transaction after the message that it was a bug but also wouldn't
> >> > sound scary to someone who wasn't seeing any other problems.
> >> >
> >>
> >> We can do this if Robin is OK?
> >
> > It would be nice if you could figure out which domains are still live
> > when
> > the SMMU is being shut down in your case and verify that it *is* infact
> > benign before we start making the message more friendly. As Robin said
> > earlier, rogue DMA is a real nightmare to debug.
> >
>
> I could see this error message for all the clients of apps_smmu.
> I checked manually enabling bypass and removing iommus dt property
> for each client of apps_smmu.

Any update on the status here?  If I'm reading the conversation above,
Robin said: "we'll *always* see the warning because there's no way to
tear down the default DMA domains, and even if all devices *have* been
nicely quiesced there's no way to tell".  Did I understand that
properly?  If so, it seems like it's fully expected to see this
message on every reboot and it doesn't necessarily signify anything
bad.

-Doug
