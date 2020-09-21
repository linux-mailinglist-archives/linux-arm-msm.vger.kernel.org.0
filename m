Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F642726FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 16:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgIUO2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 10:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIUO2f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 10:28:35 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D8EC061755;
        Mon, 21 Sep 2020 07:28:35 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id r8so12401842qtp.13;
        Mon, 21 Sep 2020 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oe0CZjrJ6zi/aJiPSPUN0Nejlr7TC/IFhiMAmlC+lh8=;
        b=WTihZJ9iYxFGsJglF1XEA7R8PkKVeSdLiSku0NxdQ8QcVoYV8a6lhVjKkMjbBPdpZZ
         n4f8TToug8alm9r7oqsyahL7nxpYac2L/y4ncvte3BeHlfIYaNWINrZ5jEeekeS0K/WG
         Mof4EGahfSAmBNfhKPyW2imMscRcTc20TYFgaLILS+W8pY/ow4ie6yHn81EyPQVwQ42e
         X/nVqDBb1hR4B+un46HCj/o5pdDIr00WxcVrUCY2XmLQAodDPfvDIoTpL0HgjKeyNQcw
         +akATxtq/3Ak+MX7uvpgTRKMID03hxFwK2hd1mldH/8Gh75qSVa9fkAhx9fMkZtnF1YG
         9zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=oe0CZjrJ6zi/aJiPSPUN0Nejlr7TC/IFhiMAmlC+lh8=;
        b=tMWLpwgHV0t72CgDzBtLch2j1x07UVQ27kpmfueBFwxk/NZBdDqVO9kUoWukCeQtoN
         V5tKUR8+27q4yrRTvLxBJklOT7ajJ+Hmeshibkuz5kF2wxm3BaXI6hZD51vdGyZUl52+
         MPWbE3Q8cMR8B/T1ngxJjV6SqcvebrvLDJ9hoxdTGZKXSCLVzvY+jX7pZc1kbyOcKvF7
         Bc9RBcdy3ko7n+7f1lN/1P9Tr3KOo5ibkFA2EhE3KNuVTkAcrSIkKTHNVxhKGbewlTYR
         T7Kf/2vkouhj8b7ojqMw7t90iP0kcY+eEk8DPsjg6SlG4tlpxd7FwZR175DDYq6fAF/L
         noZQ==
X-Gm-Message-State: AOAM5321sLW35j/H9orstyN5ZcB4DMYB0xEHEF9gAvJTVT06DOpMBNEI
        h9+sG8TdAHUlWDHb+cAKVHQWhgdAi2vVyw==
X-Google-Smtp-Source: ABdhPJyIYYOF10xsV68170kw3MDKtnBDxIO7NLKB5vT7r3/UtaUa1QquQeO77oAn3R3HaoK3aSB9DA==
X-Received: by 2002:ac8:76d0:: with SMTP id q16mr34274105qtr.164.1600698514768;
        Mon, 21 Sep 2020 07:28:34 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:54a6])
        by smtp.gmail.com with ESMTPSA id i18sm2417375qka.50.2020.09.21.07.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:28:33 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date:   Mon, 21 Sep 2020 10:28:31 -0400
From:   Tejun Heo <tj@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-msm@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, timmurray@google.com
Subject: Re: [PATCH 0/3] drm: commit_work scheduling
Message-ID: <20200921142831.GA4268@mtj.duckdns.org>
References: <20200919193727.2093945-1-robdclark@gmail.com>
 <20200921092154.GJ438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921092154.GJ438822@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Mon, Sep 21, 2020 at 11:21:54AM +0200, Daniel Vetter wrote:
> The part I don't like about this is that it all feels rather hacked
> together, and if we add more stuff (or there's some different thing in the
> system that also needs rt scheduling) then it doesn't compose.
> 
> So question to rt/worker folks: What's the best way to let userspace set
> the scheduling mode and priorities of things the kernel does on its
> behalf? Surely we're not the first ones where if userspace runs with some
> rt priority it'll starve out the kernel workers that it needs. Hardcoding
> something behind a subsystem ioctl (which just means every time userspace
> changes what it does, we need a new such flag or mode) can't be the right
> thing.

Maybe not first but there haven't been many. The main benefit of workqueue
is that the users get to pool the worker threads automatically. I don't
think the existing workqueue design is something suitable for actual RT use
cases. Furthermore, there are inherent conflicts between sharing resources
and RT as this this patchset is already showing w/ needing per-crtc worker
thread. Maybe we can further abstract it if there are more use cases but for
now kthread_worker based implementation sounds about right to me.

Thanks.

-- 
tejun
