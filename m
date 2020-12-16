Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C472DBA63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Dec 2020 06:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbgLPFXd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 00:23:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgLPFXd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 00:23:33 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156EBC061793
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 21:22:53 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id x18so6183339pln.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 21:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WYKEVZawJ7vm+napiANrAzGeTasmgoFDEm5LAhyGxFM=;
        b=XPkJXHkaqQ+LNds9xcRhHOiZ3Iizr63B6iQNeiZ0n09SmRO7C39+/dtzYDGsDy0RTS
         KsFdLDFyAsI7C2CzRqEkH1+l5jEDk/NJdWI2PaIeHk2byBKvpzcUGaVxwRgWHL6+tlVC
         7u3EKJ5M7zI8/2TJv1p89+uRqJ4Bn8nR4XaB7HEQ9uLVLvhAvZXSdmAXuBrjosjKkI2C
         nckAo67Cxysgum8BHLIHPqD8a5/CSaaDoO0dNvGCHWjWsah9Kz5vOp/LATqJJ8r+DbK+
         aIoVGqfIDT8x0WpwuJu+FBTRk2jhkabWe0EQq6dg0x/nW1JnjUPK0lJG4wXBEmHtwENw
         7kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WYKEVZawJ7vm+napiANrAzGeTasmgoFDEm5LAhyGxFM=;
        b=ltMoRrmE9PgQuUTGHg2aYWi57TNfCa1rX6hK0v0edmPgXCJN90SBLi5x3K3+H9xaFd
         2TjGqcv9hfz7ZtUZMBeo/h+eQ9TkPUa8am4w87joX1X9PY203NMMCCKKkAPx16B+KNjW
         wiISxx+swKULvJHqrjBR9gzZGK+WUVNhyH5b5+LNdZzy9qzz4oGy96BhyUpvVo8yvTv7
         AX4pa73UhRlrblQ/L2afemuR0RuUqGrnQ+W9IvViQ5BZm6/H1ayq0KCBU4RbpF2JuDza
         NRHgRSBUPWpYtslGsWu/lYloem7tq/XFlXJOnV0z4T8w3hQeY3zTAnEFUyZj9t0kuPWo
         n1Cg==
X-Gm-Message-State: AOAM530Jh3JYdZTuVsASC7ZlMueAPsVZtvzpquG50+k9hVhMohmS9E7P
        1AMTEklFpa+QiCrhZPjIEjWhMw==
X-Google-Smtp-Source: ABdhPJyD1jRSGwcY6EF73cOOfS9VcklHkc4/nDf4NupmbLV/BMOgfKQcwqBFjSVCoyJpu1WksiQ3cw==
X-Received: by 2002:a17:902:fe95:b029:da:fa53:666 with SMTP id x21-20020a170902fe95b02900dafa530666mr3161164plm.72.1608096172276;
        Tue, 15 Dec 2020 21:22:52 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id y5sm634786pjt.42.2020.12.15.21.22.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Dec 2020 21:22:51 -0800 (PST)
Date:   Wed, 16 Dec 2020 10:52:48 +0530
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
Message-ID: <20201216052248.qi6fbo2dh6shw4rt@vireshk-i7>
References: <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
 <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
 <CAF6AEGv215ixcAWmaOWs7UKAqmbMs=aFyTBBYLU-bt8XBnWb7g@mail.gmail.com>
 <20201106071621.j732gt4nqifjrccd@vireshk-i7>
 <CAF6AEGt_wbWuQA7gBw4yn4f2x0SVbfub4eRDX59PCvnd_0uFxg@mail.gmail.com>
 <20201118052829.ugt7i7ac6eqsj4l6@vireshk-i7>
 <CAF6AEGv=-h7GFj5LR97FkeBBn+gk6TNS5hZkwBwufpE4yO7GyA@mail.gmail.com>
 <20201119060528.qscedvc4jlmxakqo@vireshk-i7>
 <20201207061654.btlgobmsljdqbb2u@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207061654.btlgobmsljdqbb2u@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07-12-20, 11:46, Viresh Kumar wrote:
> On 19-11-20, 11:35, Viresh Kumar wrote:
> > On 18-11-20, 08:53, Rob Clark wrote:
> > > On Tue, Nov 17, 2020 at 9:28 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > >
> > > > On 17-11-20, 09:02, Rob Clark wrote:
> > > > > With that on top of the previous patch,
> > > >
> > > > Don't you still have this ? Which fixed the lockdep in the remove path.
> > > >
> > > > https://lore.kernel.org/lkml/20201022080644.2ck4okrxygmkuatn@vireshk-i7/
> > > >
> > > > To make it clear you need these patches to fix the OPP stuff:
> > > >
> > > > //From 5.10-rc3 (the one from the above link).
> > > > commit e0df59de670b ("opp: Reduce the size of critical section in _opp_table_kref_release()")
> > 
> > This fixes debugfs stuff while the OPP table is removed.
> > 
> > > > //Below two from linux-next
> > > > commit ef43f01ac069 ("opp: Always add entries in dev_list with opp_table->lock held")
> > > > commit 27c09484dd3d ("opp: Allocate the OPP table outside of opp_table_lock")
> > 
> > This fixes debugfs stuff while the OPP table is added.
> > 
> > > > This matches the diff I gave you earlier.
> > > >
> > > 
> > > no, I did not have all three, only "opp: Allocate the OPP table
> > > outside of opp_table_lock" plus the fixup.  But with all three:
> > 
> > And looking at the lockdep you gave now, it looks like we have a
> > problem with OPP table's internal lock (opp_table->lock) as well apart
> > from the global opp_table_lock.
> > 
> > I wish there was a way for me to reproduce the lockdep :(
> > 
> > I know this is exhausting for both of us and I really want to be over
> > with it as soon as possible, this really should be the last patch
> > here, please try this along with other two. This fixes the debugfs
> > thing while the OPPs in the OPP table are removed (they are already
> > added without a lock around debugfs stuff).
> > 
> > AFAIU, there is no further debugfs stuff that happens from within the
> > locks and so this really should be the last patch unless I missed
> > something.
> 
> Rob, were you able to test this patch ?

FWIW, this patch and everything else I had is merged into Linus's
master. You can test 5.11-rc1 to see if you still see a lockdep or
not.

-- 
viresh
