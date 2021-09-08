Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64824403B6D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 16:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351847AbhIHOXl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 10:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhIHOXk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 10:23:40 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A050CC061575;
        Wed,  8 Sep 2021 07:22:32 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id b10so3443446ioq.9;
        Wed, 08 Sep 2021 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YpdBvQHElQQMTNbuBwkHS1EwYa93WjW1ptFmOObW2Xw=;
        b=IA+yYcV3lrwLM0feMjVIJieiMAU0XNB/HFLzY2A5TzPYgPoXoPsc7hFBlZ1dNFRT+L
         whiebHATH0j5SnEd4lwNEoYYqtnminOZ/+/guARgLywB57EQpYVhAopw3vhc/thO42uL
         zxXSslYCLF1t25LM8VsTYVipsZbuIYFCPsCvsVWF1uyBlA0fiCWpIdry2seOLCEeKWwo
         uXdDZ5dEKM3o736PeLoDhy/NAS7AO85Rzl9HGX6qxp/dANyX+9364yVr1O1dhiRmP0KA
         NXnlFxIXdpWik2j8m3qyG7OkjLL91wEPJT6RiPe5pLfHVZakKi476sTmScQEVf4h3YvY
         +eDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YpdBvQHElQQMTNbuBwkHS1EwYa93WjW1ptFmOObW2Xw=;
        b=bvrkeV5ANtwrenpy9Jgcd+lGEkkpvyu/00QMi2O2dMfDYR42nP6EM98A8/t8c6AlY0
         zCkAMVv5EWm2VMtiQDyXbCZFDEWHKEm0+Rs4ztpQK+0dzK5Fuis2goTAgEjw2S7VcWWr
         RVHuNLMN51V08t1l2Jq2G5S+6B0jTUn1oYJmM8/ODsSy7LSHhOJaEAs3Ypz93k87An1q
         VhU3M28eNu2s7GiLa/xBqh7jdQP2N1sFM3ta26frziGAfIzR8wfG+KAsiqy34nYysPEe
         8jG2KkAuykfBaDsdBCI9+r3cPdRHN1jN481o+ClT6you6g1y62OuVKragcc65BKk9AwK
         M8bA==
X-Gm-Message-State: AOAM532J27/2Qe0kPBVp4vsKsLd1gmtaLjqWsunXto6lJXW3bo7t49co
        sZLXeyo+9ZAFrW3igk3DMuLpl8/aNOEGf6Haqt8=
X-Google-Smtp-Source: ABdhPJyI/7ApcpbBgb+r9bxjYHvbYNE2+8+uKXOYdImqu4lLCliR7ctiq7PlopceQaBnnrce+6hzXGm/HJ9S1fqsSbU=
X-Received: by 2002:a6b:7a03:: with SMTP id h3mr83894iom.39.1631110946133;
 Wed, 08 Sep 2021 07:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
 <20210901181138.1052653-2-angelogioacchino.delregno@somainline.org>
 <CAOCk7NoOdjxp0vxu9XJzYsi7a04kpqpTOZHm42ApAN3MqkqtDw@mail.gmail.com> <CAA8EJpp6tj10A0QUR1E75t7BZf2Y3jHUyVNniYhEUd9rXj8Vrg@mail.gmail.com>
In-Reply-To: <CAA8EJpp6tj10A0QUR1E75t7BZf2Y3jHUyVNniYhEUd9rXj8Vrg@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 8 Sep 2021 08:22:15 -0600
Message-ID: <CAOCk7NqhuCJqh-u6ke=Mn=EPgHnc7C2RS_X1nSCg_Nc8An=yPA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu1: Add MSM8998 to hw catalog
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org, DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 8, 2021 at 2:26 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi,
>
> On Tue, 7 Sept 2021 at 22:13, Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > On Wed, Sep 1, 2021 at 12:11 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@somainline.org> wrote:
> > >
> > > Bringup functionality for MSM8998 in the DPU, driver which is mostly
> > > the same as SDM845 (just a few variations).
> > >
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> >
> > I don't seem to see a cover letter for this series.
> >
> > Eh, there are a fair number of differences between the MDSS versions
> > for 8998 and 845.
> >
> > Probably a bigger question, why extend the DPU driver for 8998, when
> > the MDP5 driver already supports it[1]?  The MDP/DPU split is pretty
> > dumb, but I don't see a valid reason for both drivers supporting the
> > same target/display revision.  IMO, if you want this support in DPU,
> > remove it from MDP5.
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.14&id=d6c7b2284b14c66a268a448a7a8d54f585d38785
>
> I don't think that we should enforce such requirements. Having support
> both in MDP5 and DPU would allow one to compare those two drivers,
> performance, features, etc.
> It might be that all MDP5-supported hardware would be also supported
> by DPU, thus allowing us to remove the former driver. But until that
> time I'd suggest leaving support in place.

Well, then you have a host of problems to solve.

Lets ignore the code duplication for a minute and assume we've gone
with this grand experiment.  Two drivers enter, one leaves the victor.

How are the clients supposed to pick which driver to use in the mean
time?  We already have one DT binding for 8998 (which the MDP5 driver
services).  This series proposes a second.  If we go forward with what
you propose, we'll have two bindings for the same hardware, which IMO
doesn't make sense in the context of DT, and the reason for that is to
select which driver is "better".  Driver selection is not supposed to
be tied to DT like this.

So, some boards think MDP5 is better, and some boards think DPU is
better.  At some point, we decide one of the drivers is the clear
winner (lets assume DPU).  Then what happens to the existing DTs that
were using the MDP5 description?  Are they really compatible with DPU?

From a DT perspective, there should be one description, but then how
do you pick which driver to load?  Both can't bind on the single
description, and while you could argue that the users should build one
driver or the other, but not both (thus picking which one at build
time), that doesn't work for distros that want to build both drivers
so that they can support all platforms with a single build (per arch).

From where I sit, your position starts with a good idea, but isn't
fully thought out and leads to problems.

If there is some reason why DPU is better for 8998, please enumerate
it.  Does DPU support some config that MDP5 doesn't, which is valuable
to you?  I'm ok with ripping out the MDP5 support, the reason I didn't
go with DPU was that the DPU driver was clearly written only for 845
at the time, and needed significant rework to "downgrade" to an
earlier hardware.  However, the "reason" DPU exists separate from MDP5
is the claim that the MDP hardware underwent a significant
rearchitecture, and thus it was too cumbersome to extend MDP5.  While
I disagree with the premise, that "rearch" started with 8998.
