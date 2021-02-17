Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F9D31E010
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 21:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233349AbhBQUP5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 15:15:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbhBQUP4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 15:15:56 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A718BC061574;
        Wed, 17 Feb 2021 12:15:15 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id l12so18753793wry.2;
        Wed, 17 Feb 2021 12:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=/SfDLUSdiw9Q0zmXjgq53DuIhtEZQNoVI4O6RzhHV5s=;
        b=RL1PZzFJ8Zfu/C4DugYCVVvJS/urwTb+nyGS57REvMlnC8ygsGGEPLIz/CuZmxVs9h
         1rkXlPTFYfa1sVHKWXhM2IMyvXzX0rdAzR3HaB1jXAW88P04jqjJq1nJtk8L1O+fIuMU
         01AdzJGMnJTaCW78pDhbWXDVAg14icUpLEukHf8m1FZ94SEYKyN2skCTSwAHWcwWWbRl
         gy2zAEk0VqEj8hjp20jS3NK0fD3/zv35CS/oJpjLg+8mWUfMNKQCg8PRtBX+zp5mvUyG
         ImPNQnUXJLRwjlz9Hhhrcj7H0PpBHjm4IK/dwdCM2X7Q/4+4X95hmNWsWvVrxK8c0niF
         sumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=/SfDLUSdiw9Q0zmXjgq53DuIhtEZQNoVI4O6RzhHV5s=;
        b=nw3T7o3JLxGzuJrg4IGp7+TkR4Muv9a6M79SUXq16m5cCq7hdnbzpVGp1+jVzFuSYu
         dEaz7WdSJ0Zo3P88qrN++dWR+ymuaGdW9ziOtdfbqHnWwyp9sat22DPSC2QNoUCZ1EHm
         uTPe2CVvim8wTLPXs3un4D6CYCs4rn821FYZtvyTYdbzTMqAJoZG08EsuuhWtXLBtvh9
         1RhB/wQjHPsD7o+iUawGafhojiq9WinmNHnVuqLghdI+AQ1Mov271E5Z29f+dCdpiGLW
         jOcRLiK0W3pqE/LdZZYeOmQnywLl2A+SpaoMPFCuFbydPCl6z8LgRvF09LFc3QD6sLY1
         pYxQ==
X-Gm-Message-State: AOAM533c0PPoIaZY7m/c0n05wjVtJHofrEmOrbmAGzV/5x6dRwgQMBBD
        HqYimIvxqa4wva/Sa2OYcTM19MTRECHWGXD+D5Q7sEnwS+0=
X-Google-Smtp-Source: ABdhPJyALfdccz8HAiEV1G+Ol8dEXGYdIHVG4KvOrIla3e55eOzDS0TiG77fLq668VEf7TMpr8wtJRnqa8N4/O68KWU=
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr902647wrv.132.1613592914278;
 Wed, 17 Feb 2021 12:15:14 -0800 (PST)
MIME-Version: 1.0
References: <20210216200909.19039-1-jonathan@marek.ca> <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
 <775436ba-c94a-ab22-d65b-b2391047ec65@codeaurora.org> <20210217190820.GA2229@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20210217190820.GA2229@jcrouse1-lnx.qualcomm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 17 Feb 2021 12:18:07 -0800
Message-ID: <CAF6AEGsHws23ozeJ8G23LFQ8J=CVVrx5xvkSgBuE_uSwT4YurQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix for kernels without CONFIG_NVMEM
To:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 17, 2021 at 11:08 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Wed, Feb 17, 2021 at 07:14:16PM +0530, Akhil P Oommen wrote:
> > On 2/17/2021 8:36 AM, Rob Clark wrote:
> > >On Tue, Feb 16, 2021 at 12:10 PM Jonathan Marek <jonathan@marek.ca> wrote:
> > >>
> > >>Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a ENOENT error,
> > >>to fix the case where the kernel was compiled without CONFIG_NVMEM.
> > >>
> > >>Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> > >>Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > >>---
> > >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
> > >>  1 file changed, 3 insertions(+), 3 deletions(-)
> > >>
> > >>diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > >>index ba8e9d3cf0fe..7fe5d97606aa 100644
> > >>--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > >>+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > >>@@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> > >>
> > >>         cell = nvmem_cell_get(dev, "speed_bin");
> > >>         /*
> > >>-        * -ENOENT means that the platform doesn't support speedbin which is
> > >>-        * fine
> > >>+        * -ENOENT means no speed bin in device tree,
> > >>+        * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM
> > >
> > >very minor nit, it would be nice to at least preserve the gist of the
> > >"which is fine" (ie. some variation of "this is an optional thing and
> > >things won't catch fire without it" ;-))
> > >
> > >(which is, I believe, is true, hopefully Akhil could confirm.. if not
> > >we should have a harder dependency on CONFIG_NVMEM..)
> > IIRC, if the gpu opp table in the DT uses the 'opp-supported-hw' property,
> > we will see some error during boot up if we don't call
> > dev_pm_opp_set_supported_hw(). So calling "nvmem_cell_get(dev, "speed_bin")"
> > is a way to test this.
> >
> > If there is no other harm, we can put a hard dependency on CONFIG_NVMEM.
>
> I'm not sure if we want to go this far given the squishiness about module
> dependencies. As far as I know we are the only driver that uses this seriously
> on QCOM SoCs and this is only needed for certain targets. I don't know if we
> want to force every target to build NVMEM and QFPROM on our behalf. But maybe
> I'm just saying that because Kconfig dependencies tend to break my brain (and
> then Arnd has to send a patch to fix it).
>

Hmm, good point.. looks like CONFIG_NVMEM itself doesn't have any
other dependencies, so I suppose it wouldn't be the end of the world
to select that.. but I guess we don't want to require QFPROM

I guess at the end of the day, what is the failure mode if you have a
speed-bin device, but your kernel config misses QFPROM (and possibly
NVMEM)?  If the result is just not having the highest clk rate(s)
available, that isn't the end of the world.  But if it makes things
not-work, that is sub-optimal.  Generally, especially on ARM, kconfig
seems to be way harder than it should be to build a kernel that works,
if we could somehow not add to that problem (for both people with a6xx
and older gens) that would be nice ;-)

BR,
-R
