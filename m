Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F4F2782A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Sep 2020 10:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbgIYIXb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Sep 2020 04:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbgIYIXa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Sep 2020 04:23:30 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B2AC0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 01:23:30 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id y15so2296716wmi.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 01:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=/xceJ+nL8CAqEkUgZuOodpMwpUATKDkMiShfUA4n0is=;
        b=IMoy3KPK/HSnt/jGJLKFcr63ejUioDK+hkFhAqQP7ySqv+9NovuKLi4xgoyx8pXGfa
         IPZ061o5pjj1kntDniZySCXHOoeOLddNZxPzj6LRRW15BDvl6eh8gLOTYTwBzf7ziCbN
         kWw1N1bh2re3A8BkK/fMcq5uEaZfyXj/LUp8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=/xceJ+nL8CAqEkUgZuOodpMwpUATKDkMiShfUA4n0is=;
        b=pLw2TCOlaqd6sOn2EBSjnhStIlMFC5l9xXhAcJ+YYRqThErx3Dd8gKO3gLdib/oQ9E
         iFpTy1fN7of4PLHPfnmtEOXzVd9ZBS7wiz37KTjqlysd6QZ+fZfI33MOxPDwS6klnDsA
         weddJomEZ7Z149n5x6cm/3VaAO4JIpvnu6h9MWVYykcTBpJMJFlQ5eJv8dmKqNsQB1cj
         vVFlIIN2ob4MQUOxuyGtjCbEfEcKaWBQTvvFeGroxAI6EPa73Aqx3Og5epkETqVxWq6B
         iC4w/qLV9OmFQXNejsqYF4SaVlsp13wblli6goVFuSGIqKdZBXGcamp7teq7abVQgnVh
         nKfg==
X-Gm-Message-State: AOAM533mQL4abNy+3nFS41D67Wl1xkPxevkY+NBSI3P0SdTykTMOhVAL
        7j/mr2FPeLRWMtpWRvpJnpDbRg==
X-Google-Smtp-Source: ABdhPJx/UOwLevgV8DQL2Dlb2vUO7KMkODvbhcZyU/EorN0L0j6u1I71NTHNWAU21XFJb2gYDUTCIg==
X-Received: by 2002:a7b:c751:: with SMTP id w17mr1783626wmk.97.1601022209259;
        Fri, 25 Sep 2020 01:23:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q12sm1949166wrs.48.2020.09.25.01.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 01:23:28 -0700 (PDT)
Date:   Fri, 25 Sep 2020 10:23:26 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Qais Yousef <qais.yousef@arm.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tim Murray <timmurray@google.com>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 0/3] drm: commit_work scheduling
Message-ID: <20200925082326.GB438822@phenom.ffwll.local>
Mail-Followup-To: Qais Yousef <qais.yousef@arm.com>,
        Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tim Murray <timmurray@google.com>, Tejun Heo <tj@kernel.org>
References: <20200919193727.2093945-1-robdclark@gmail.com>
 <20200921092154.GJ438822@phenom.ffwll.local>
 <CAF6AEGuDRk9D_aqyb6R8N5VHx2rvbZDf4uTqF3gQTrmzno+qtw@mail.gmail.com>
 <CAKMK7uEqDD-oDAQKyA9DQbxkCgEjC5yyjvKR7d8T0Gj0SqEZ4A@mail.gmail.com>
 <CAF6AEGtYAn+W8HxP7SXtxPr5FsEB1hYGU91WrHCtwX89UmUR5w@mail.gmail.com>
 <20200923152545.GQ438822@phenom.ffwll.local>
 <CAF6AEGs9xDOoG3n4E_+6iDaiJXp_hqvSV1VKE=vpvG-twYPoew@mail.gmail.com>
 <20200924084950.GY438822@phenom.ffwll.local>
 <20200924161356.5kezxwiqwtbi3o2p@e107158-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924161356.5kezxwiqwtbi3o2p@e107158-lin.cambridge.arm.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 24, 2020 at 05:15:00PM +0100, Qais Yousef wrote:
> On 09/24/20 10:49, Daniel Vetter wrote:
> 
> [...]
> 
> > > > I also thought kernel threads can be distinguished from others, so
> > > > userspace shouldn't be able to sneak in and get elevated by accident.
> > > 
> > > I guess maybe you could look at the parent?  I still would like to
> > > think that we could come up with something a bit less shaking than
> > > matching thread names by regexp..
> > 
> > ps marks up kernel threads with [], so there is a way. But I haven't
> > looked at what it is exactly that tells kernel threads apart from others.
> > 
> > But aside from that sounds like "match right kernel thread with regex and
> > set its scheduler class" is how this is currently done, if I'm
> > understanding what Tejun and Peter said correctly.
> > 
> > Not pretty, but also *shrug* ...
> 
> Isn't there a real danger that a sneaky application names its threads to match
> this regex and get a free promotion to RT without having the capability to do
> so?

A sneaky application can't fake being a kernel thread, at least that's
what I thought. You need to check for that _and_ that the name matches.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
