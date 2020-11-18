Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6C12B75E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 06:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgKRF2d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Nov 2020 00:28:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgKRF2d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Nov 2020 00:28:33 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146FEC061A4D
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 21:28:33 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id gv24so444769pjb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 21:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i7NQcmg0sYY8A0xlzCx+NZowN/eNGNUoVY/o8X/i+jY=;
        b=HVHOpkt/qqNt9sE6chv3U7ohVXbszeie0CQi5JUw5PUCYb4Q8G/UdR3X+kkmQ45kKt
         Em/Cnv12xCd9dU5raew3gzyMlRZ1vSpv2v5EJ2ubv3k25i7cQWfuyJojAKDsfus2pQAw
         L07ZygsSRdwZthKV63A0oOgdzRd7y6vebdXXytZPb+YoVKKa/BR8DxngpQTYRcrGLqcm
         6e31dz04CuMnlD9QbqCaMqbWP3aACS5ya1bCz7VeFlQWY/w2/qJXSGX8O7PywPyTB63R
         iM/93VxE9HYXfTZvbaB+w4XthiYuzpDSk/lxJhpdZ/hCCVoxlEYIGf7DocxfiyqduRJI
         PDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i7NQcmg0sYY8A0xlzCx+NZowN/eNGNUoVY/o8X/i+jY=;
        b=eqTHau8zPbBBygjQBpPK48emva1jRCJBgKmmfjsgWaUoNSP40ikPIkjo6EoKeokjME
         +0UUdVHs399J3kjvBE2N9oy92PgImeFzoiRm9EO9+/ozV/T/6vgIiVUzkFmkGeIJSjis
         aKjP9gHPp7PsTl8jhOhC4r5HgNnxK+EnMEToT/Hi4zj+Qlfle05TA7G/kAsJJSd4uGos
         VStbWP2In48ORUGphDRaPiYkPxtLRjLz2MsDTeSe62chufKoj71+3hCaxlRqIhfJmKvA
         Vi8kdoLb1TWl946Uo3Bmpv28c6f7/ArYOa/5QQUCg0xY3klzXOmmQoK6d9wXwmirGwYW
         VRPw==
X-Gm-Message-State: AOAM5326Kb+nLBahSMZOrNo0gDcb+qI8WviqRhTLMUtIjOJbmCs1/b0A
        5lw9AnHhARieIi3ifKr+RDXXAw==
X-Google-Smtp-Source: ABdhPJwE3hBbeNtRV7Zgs+1PM2OnxpXYUaUyaPcW0+rjSjJgGdij1UAnuyebd9b/G+OtrU4TJCHdpA==
X-Received: by 2002:a17:902:8d82:b029:d8:c5e8:9785 with SMTP id v2-20020a1709028d82b02900d8c5e89785mr2704949plo.5.1605677312497;
        Tue, 17 Nov 2020 21:28:32 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id w127sm23328945pfc.172.2020.11.17.21.28.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2020 21:28:31 -0800 (PST)
Date:   Wed, 18 Nov 2020 10:58:29 +0530
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
Message-ID: <20201118052829.ugt7i7ac6eqsj4l6@vireshk-i7>
References: <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
 <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
 <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
 <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
 <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
 <CAF6AEGv215ixcAWmaOWs7UKAqmbMs=aFyTBBYLU-bt8XBnWb7g@mail.gmail.com>
 <20201106071621.j732gt4nqifjrccd@vireshk-i7>
 <CAF6AEGt_wbWuQA7gBw4yn4f2x0SVbfub4eRDX59PCvnd_0uFxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGt_wbWuQA7gBw4yn4f2x0SVbfub4eRDX59PCvnd_0uFxg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-11-20, 09:02, Rob Clark wrote:
> With that on top of the previous patch,

Don't you still have this ? Which fixed the lockdep in the remove path.

https://lore.kernel.org/lkml/20201022080644.2ck4okrxygmkuatn@vireshk-i7/

To make it clear you need these patches to fix the OPP stuff:

//From 5.10-rc3 (the one from the above link).
commit e0df59de670b ("opp: Reduce the size of critical section in _opp_table_kref_release()")

//Below two from linux-next
commit ef43f01ac069 ("opp: Always add entries in dev_list with opp_table->lock held")
commit 27c09484dd3d ("opp: Allocate the OPP table outside of opp_table_lock")

This matches the diff I gave you earlier.

-- 
viresh
