Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA85293A00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 13:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392769AbgJTLYR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 07:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392755AbgJTLYR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 07:24:17 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E519C0613CE
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 04:24:17 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a17so759793pju.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 04:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rTNS0r1ZbZNkLyFUEQ/iIWxtqaA40PYGtHZsuJiDCcM=;
        b=lmdA0vZcj+gZ1N8Z10STVszxUkjLEFOgixTZSc1eGkqCzwK1uhJ84SarFjT733XzT1
         lRIYiuu6c2to5PmKYINoXAr3CZgaHbvvrViof7FKOZVXy16u4Op+zo0G8PQqXnAolNnQ
         Ez4ynljhCkVMP6Z9EgoZ13aV5pDmU8pPr28YUsh8PJDrrPb8sFHBtNuhCUW1Nt+vpTZg
         Avw7ELL7Mo6Nfrp0aTI1LXdUgnv1+p3hRndqOaYdnZ8MDh6xsDiorg6hokf1rGCM4cJh
         bQjjzse/pqj5beP5D0fgow0PbmGCnAekWihGbD/fXvXyjig6FI7LSnOR1SKmYp5b9UMc
         IDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rTNS0r1ZbZNkLyFUEQ/iIWxtqaA40PYGtHZsuJiDCcM=;
        b=E9sU8HxOzsrJwt1XI86gdsrt0qAhDPLhqvBTN1Tx+Q77CytC66LPeFaPn1BMHM48W9
         uS/7dkU/z3pI0DoXmcWrkaAsTcGF3qgGDi5TM0fABOe5KsazGKzFmRornsNptJXjr1tN
         IBbQH+hXTW+gRAWFP/YywXop17POafLlv5NcVt5qpLBJE+q65tntkUbT5IehNFwYMCqw
         IscoAT4fp+PfUHDI9bmLLs82QkgVGRq3PJk3lI3p2nwGK5lp8EpyuG80Y/zPCOucbHyy
         tXdhhvTqKvNnWt5FQIwVbvg/Ga1jqShaWd31WtG4RuEsySR8cSTEHAQ7tTR7eDnU2rX5
         rdYQ==
X-Gm-Message-State: AOAM533PZov1V5O1WO9fOJ5WLEcRZZgCYBsVT7aGA9hPp4LoGj40u3dm
        QVy63dZ1z42KTRDYsiZGMiKBZQ==
X-Google-Smtp-Source: ABdhPJxiKN8vYDR35svXlvXCDZWliSZkknnCW89y9BP+j1N1wNwI4v+gtfsW8+8fhi+ND0fGzlcE+A==
X-Received: by 2002:a17:902:ee8b:b029:d3:f156:eefc with SMTP id a11-20020a170902ee8bb02900d3f156eefcmr703577pld.19.1603193056837;
        Tue, 20 Oct 2020 04:24:16 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id y4sm1714126pjc.53.2020.10.20.04.24.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 04:24:15 -0700 (PDT)
Date:   Tue, 20 Oct 2020 16:54:13 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@gmail.com>,
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
Message-ID: <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-8-robdclark@gmail.com>
 <20201012143555.GA438822@phenom.ffwll.local>
 <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7>
 <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-10-20, 12:56, Daniel Vetter wrote:
> Yeah that's bad practice. Generally you shouldn't need to hold locks
> in setup/teardown code, since there's no other thread which can
> possible hold a reference to anything your touching anymore. Ofc
> excluding quickly grabbing/dropping a lock to insert/remove objects
> into lists and stuff.
> 
> The other reason is that especially with anything related to sysfs or
> debugfs, the locking dependencies you're pulling in are enormous: vfs
> locks pull in mm locks (due to mmap) and at that point there's pretty
> much nothing left you're allowed to hold while acquiring such a lock.
> For simple drivers this is no issue, but for fancy drivers (like gpu
> drivers) which need to interact with core mm) this means your
> subsystem is a major pain to use.
> 
> Usually the correct fix is to only hold your subsystem locks in
> setup/teardown when absolutely required, and fix any data
> inconsistency issues by reordering your setup/teardown code: When you
> register as the last step and unregister as the first step, there's no
> need for any additional locking. And hence no need to call debugfs
> functions while holding your subsystem locks.
> 
> The catch phrase I use for this is "don't solve object lifetime issues
> with locking". Instead use refcounting and careful ordering in
> setup/teardown code.

This is exactly what I have done in the OPP core, the locks were taken
only when really necessary, though as we have seen now I have missed
that at a single place and that should be fixed as well. Will do that,
thanks.

-- 
viresh
