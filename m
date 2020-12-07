Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5BFC2D0A9D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 07:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgLGGRj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 01:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgLGGRj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 01:17:39 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB31C0613D1
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Dec 2020 22:16:58 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w6so8770711pfu.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Dec 2020 22:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UEC9Ey1YiH340yAKzQI3EtE+5vtsPcOD/FPejTWMx7w=;
        b=o2XJfSqzzn/rOiBwbGH3UlxuQOAZHr1UBqmeed/0e1fhHWgdPw6g+ghmTazVGrsStv
         xkevCH2AQ7+K/XZLzzcsjSvlO0O7DLennpdrtQrst0GNuG2SDEQzN8OagNsOcQ2iHC7V
         mJcdwfJfIDeOfJ21ncaNFhmUpNXUGGJvMjH00MOIjG1GofWmdRrnx3Q5MwsmYJ7/iY9V
         t7gJLYvSQdLwijIivyfKz2E+YVr2QP0DavK6leUlPvH5LydY+s2kK9SNDVC14Sx4+jja
         gJgaYojnzfDgCp9o7J8KP+Ip67NP1k/O7pj+e1AtktY7/ujymtidRkxNl2Y0sVymBZM/
         qMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UEC9Ey1YiH340yAKzQI3EtE+5vtsPcOD/FPejTWMx7w=;
        b=lJuqXfB++kf9a2Q+oiqn/1M3NVOEa9nzQdSNfNLBqUaD+Gyc0nZUpVtq6BPTqtQOcg
         j/9t+2mQS/+7FUBYWiGidKCi9h6DKkZPn5K6lXzZhUgfSbWE9R5lmx/VFVA709prAU4o
         l6ZPVrK5kGxW27b9EN2NXBcmvHGOwQ6j/2kDZ82U+oHP3tteLM2ZEBojF8Xpsgn04vQv
         sSlqXseIKPquFn0gGr6ERZ67N7iegCMs9JPv6JzC2mnQb2FLjaZI4VxFgLOk3uo6RVWV
         Z+KobDTqUROaitH0FB1F+EBoy6swwClPC1H/DDdepb7HfBOoj7n68Fg3YBBi5p/I2WaQ
         tjFw==
X-Gm-Message-State: AOAM532IxmWlzkTQCcaLMT8SSqWeVe3R1D/1JemWRvMhnkTfZLEhNBay
        VAVJ4JJh5tItpjSGKNG4GFM66g==
X-Google-Smtp-Source: ABdhPJwdp0AMyfk/pmIqlkdR+aP4sWvB2SM7Y4KiUHk4mVRdafw8sT/5YRZ5fNVVa99pp8VKO1yWig==
X-Received: by 2002:a63:b910:: with SMTP id z16mr7549604pge.358.1607321818276;
        Sun, 06 Dec 2020 22:16:58 -0800 (PST)
Received: from localhost ([122.172.136.109])
        by smtp.gmail.com with ESMTPSA id a12sm9089777pjm.44.2020.12.06.22.16.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 22:16:57 -0800 (PST)
Date:   Mon, 7 Dec 2020 11:46:54 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Menon, Nishanth" <nm@ti.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
Message-ID: <20201207061654.btlgobmsljdqbb2u@vireshk-i7>
References: <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
 <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
 <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
 <CAF6AEGv215ixcAWmaOWs7UKAqmbMs=aFyTBBYLU-bt8XBnWb7g@mail.gmail.com>
 <20201106071621.j732gt4nqifjrccd@vireshk-i7>
 <CAF6AEGt_wbWuQA7gBw4yn4f2x0SVbfub4eRDX59PCvnd_0uFxg@mail.gmail.com>
 <20201118052829.ugt7i7ac6eqsj4l6@vireshk-i7>
 <CAF6AEGv=-h7GFj5LR97FkeBBn+gk6TNS5hZkwBwufpE4yO7GyA@mail.gmail.com>
 <20201119060528.qscedvc4jlmxakqo@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119060528.qscedvc4jlmxakqo@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-11-20, 11:35, Viresh Kumar wrote:
> On 18-11-20, 08:53, Rob Clark wrote:
> > On Tue, Nov 17, 2020 at 9:28 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 17-11-20, 09:02, Rob Clark wrote:
> > > > With that on top of the previous patch,
> > >
> > > Don't you still have this ? Which fixed the lockdep in the remove path.
> > >
> > > https://lore.kernel.org/lkml/20201022080644.2ck4okrxygmkuatn@vireshk-i7/
> > >
> > > To make it clear you need these patches to fix the OPP stuff:
> > >
> > > //From 5.10-rc3 (the one from the above link).
> > > commit e0df59de670b ("opp: Reduce the size of critical section in _opp_table_kref_release()")
> 
> This fixes debugfs stuff while the OPP table is removed.
> 
> > > //Below two from linux-next
> > > commit ef43f01ac069 ("opp: Always add entries in dev_list with opp_table->lock held")
> > > commit 27c09484dd3d ("opp: Allocate the OPP table outside of opp_table_lock")
> 
> This fixes debugfs stuff while the OPP table is added.
> 
> > > This matches the diff I gave you earlier.
> > >
> > 
> > no, I did not have all three, only "opp: Allocate the OPP table
> > outside of opp_table_lock" plus the fixup.  But with all three:
> 
> And looking at the lockdep you gave now, it looks like we have a
> problem with OPP table's internal lock (opp_table->lock) as well apart
> from the global opp_table_lock.
> 
> I wish there was a way for me to reproduce the lockdep :(
> 
> I know this is exhausting for both of us and I really want to be over
> with it as soon as possible, this really should be the last patch
> here, please try this along with other two. This fixes the debugfs
> thing while the OPPs in the OPP table are removed (they are already
> added without a lock around debugfs stuff).
> 
> AFAIU, there is no further debugfs stuff that happens from within the
> locks and so this really should be the last patch unless I missed
> something.

Rob, were you able to test this patch ?

-- 
viresh
