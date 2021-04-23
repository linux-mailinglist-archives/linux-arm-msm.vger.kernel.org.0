Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750273694C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 16:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhDWOc2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 10:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbhDWOc2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 10:32:28 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BD0C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:31:51 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id x7so48591877wrw.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JheyTan8KFlqWP7SazE+KVUMKKdWB8iIOVqGW2BbIXU=;
        b=F/k90vC/4aXBfN5/Ew/LLdecqCc+3OfSDhBf9MSEJURAjNOxlGcXFfzEdahvqlB8TZ
         GOGhYr/YxrM4//7u+SBG+cAPa3ApnojtWQgEDqsT8lcTvlEu62nqb8owz7PN+vM8lN7U
         0A1ob7/ydt/B+Uyg18t4Alk/9dWVrnbWWalFYenoea99/kAo3DN+pAVbehK3M+XZTvtY
         C/5E06dn9lF1hQd7JBnu1MnEsmdLg+FUNh+HXwaRsswoEtXu2nIHz8MYKvuet5O0mvot
         PI0vmfLDzd6SbTt4Ilp0IgCVPuk5J8/7zbwjjtGOSkaPJ3aYD96VlMi2qXGtQPOkdP54
         ot6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JheyTan8KFlqWP7SazE+KVUMKKdWB8iIOVqGW2BbIXU=;
        b=Qai5zQQ3VBSh0y2YcYJuj8rqD6ZmKYlgw8fvpVurJoN1iiBRk7/pcCGIodgDv/wCMk
         s9nnpjqCCDk/ERMMu2CS4XfcbnneMyX4t95YsdpttrWZt3srszRwRLnxTkhNxS5R2WkG
         ouXQJstObDUIKZEj/VbWkfEr0ecaSUqAS4/emiSxwaezdMDjt+pWJPaj2feyklOEHx+6
         8WDAKSgEpAslwjLOFox3CbdGRwGkDoAd4ByIJxPmxkiieU2NRfJ9W2bNKW2ilbZK39/P
         rf0OR+wg3YJ4MUQs5xBu4shek6ZX8azhdoJNevgLABh7ND+/r5yXZv8zHpU7hun8Jv7X
         uQ9g==
X-Gm-Message-State: AOAM5330Zv218qpUqcAUnmhxqQFddZFA5sx9ifMNE//OgSFT4KnJFqAd
        HDkgE7ZGn8jc9mmbRf7tYgAyNNmMz06fIQgO7Jb4Tk4pxxY=
X-Google-Smtp-Source: ABdhPJxad4/leiWcDE99d5Ov5D27iyan6dP3gl3SDiV2Ggmp3oTCdPXVhkE6tOtDHofMTjOCGEsN5oNi5mnmcyTKlOU=
X-Received: by 2002:a5d:4488:: with SMTP id j8mr5192775wrq.83.1619188310364;
 Fri, 23 Apr 2021 07:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAP9ODKpQxxnaX5DVSHmq4HJpCOpp_rOPwtOJ=ADRZgg20R6wPg@mail.gmail.com>
In-Reply-To: <CAP9ODKpQxxnaX5DVSHmq4HJpCOpp_rOPwtOJ=ADRZgg20R6wPg@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 23 Apr 2021 07:35:22 -0700
Message-ID: <CAF6AEGuAMA8vMqTZQA=PCXGR781j4xmv-ahT1cQj92bpiMvvqw@mail.gmail.com>
Subject: Re: i.MX53 error during GPU use
To:     Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 23, 2021 at 4:58 AM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Hello all,
>
> We found this error when using Freedreno driver on an i.MX53 device
> with Wayland. Any idea how to fix this?
>
> [   32.414110] [drm:msm_ioctl_gem_submit] *ERROR* invalid cmdstream size: 0

The invalid cmdstream size is some sort of userspace error

> [   39.177075]
> [   39.178617] ======================================================
> [   39.184804] WARNING: possible circular locking dependency detected
> [   39.190997] 5.10.31+g7ae1de1d2bd3 #1 Not tainted
> [   39.195619] ------------------------------------------------------

But possibly it is triggering the lockdep anger?  It looks like the
gem locking re-work landed in v5.11.. any chance you can try a newer
kernel?

BR,
-R

> [   39.201805] kworker/u2:1/68 is trying to acquire lock:
> [   39.206953] c2b952fc (reservation_ww_class_mutex){+.+.}-{3:3}, at:
> dma_buf_detach+0xd0/0x1e0
> [   39.215448]
> [   39.215448] but task is already holding lock:
> [   39.221286] c2b957b0 (&msm_obj->lock){+.+.}-{3:3}, at:
> msm_gem_free_work+0x118/0x1b0
> [   39.229062]
> [   39.229062] which lock already depends on the new lock.
> [   39.229062]
> [   39.237243]
> [   39.237243] the existing dependency chain (in reverse order) is:
> [   39.244729]
> [   39.244729] -> #1 (&msm_obj->lock){+.+.}-{3:3}:
> [   39.250769]        mutex_lock_nested+0x1c/0x24
> [   39.255220]        msm_gem_get_and_pin_iova_range+0x38/0x170
> [   39.260885]        msm_gem_get_and_pin_iova+0x24/0x2c
> [   39.265946]        msm_ioctl_gem_submit+0x12c0/0x1964
> [   39.271008]        drm_ioctl+0x1f0/0x3e0
> [   39.274940]        sys_ioctl+0x3bc/0xbe0
> [   39.278873]        ret_fast_syscall+0x0/0x28
> [   39.283150]        0xbed4deac
> [   39.286122]
> [   39.286122] -> #0 (reservation_ww_class_mutex){+.+.}-{3:3}:
> [   39.293208]        lock_acquire+0x134/0x560
> [   39.297398]        __ww_mutex_lock.constprop.0+0xbc/0x1124
> [   39.302889]        ww_mutex_lock+0x68/0xb4
> [   39.306993]        dma_buf_detach+0xd0/0x1e0
> [   39.311271]        drm_prime_gem_destroy+0x2c/0x38
> [   39.316068]        msm_gem_free_work+0xa0/0x1b0
> [   39.320611]        process_one_work+0x2a8/0x7ec
> [   39.325149]        worker_thread+0x4c/0x554
> [   39.329339]        kthread+0x140/0x154
> [   39.333095]        ret_from_fork+0x14/0x20
> [   39.337196]        0x0
> [   39.339560]
> [   39.339560] other info that might help us debug this:
> [   39.339560]
> [   39.347568]  Possible unsafe locking scenario:
> [   39.347568]
> [   39.353491]        CPU0                    CPU1
> [   39.358025]        ----                    ----
> [   39.362557]   lock(&msm_obj->lock);
> [   39.366061]                                lock(reservation_ww_class_mutex);
> [   39.373123]                                lock(&msm_obj->lock);
> [   39.379143]   lock(reservation_ww_class_mutex);
> [   39.383689]
> [   39.383689]  *** DEADLOCK ***
> [   39.383689]
> [   39.389614] 4 locks held by kworker/u2:1/68:
> [   39.393888]  #0: c24138a8 ((wq_completion)msm){+.+.}-{0:0}, at:
> process_one_work+0x1f4/0x7ec
> [   39.402362]  #1: c26a1f20
> ((work_completion)(&priv->free_work)){+.+.}-{0:0}, at:
> process_one_work+0x1f4/0x7ec
> [   39.412312]  #2: c24188a4 (&dev->struct_mutex){+.+.}-{3:3}, at:
> msm_gem_free_work+0x68/0x1b0
> [   39.420784]  #3: c2b957b0 (&msm_obj->lock){+.+.}-{3:3}, at:
> msm_gem_free_work+0x118/0x1b0
> [   39.428996]
> [   39.428996] stack backtrace:
> [   39.433363] CPU: 0 PID: 68 Comm: kworker/u2:1 Not tainted
> 5.10.31+g7ae1de1d2bd3 #1
> [   39.440937] Hardware name: Freescale i.MX53 (Device Tree Support)
> [   39.447044] Workqueue: msm msm_gem_free_work
> [   39.451346] [<c0111258>] (unwind_backtrace) from [<c010ba00>]
> (show_stack+0x10/0x14)
> [   39.459107] [<c010ba00>] (show_stack) from [<c0e2b560>]
> (dump_stack+0xdc/0x104)
> [   39.466430] [<c0e2b560>] (dump_stack) from [<c01838d8>]
> (check_noncircular+0xf0/0x160)
> [   39.474358] [<c01838d8>] (check_noncircular) from [<c0187060>]
> (__lock_acquire+0x1628/0x2e04)
> [   39.482893] [<c0187060>] (__lock_acquire) from [<c01892e8>]
> (lock_acquire+0x134/0x560)
> [   39.490821] [<c01892e8>] (lock_acquire) from [<c0e3da60>]
> (__ww_mutex_lock.constprop.0+0xbc/0x1124)
> [   39.499877] [<c0e3da60>] (__ww_mutex_lock.constprop.0) from
> [<c0e3ebe4>] (ww_mutex_lock+0x68/0xb4)
> [   39.508844] [<c0e3ebe4>] (ww_mutex_lock) from [<c080e6a8>]
> (dma_buf_detach+0xd0/0x1e0)
> [   39.516771] [<c080e6a8>] (dma_buf_detach) from [<c0701d04>]
> (drm_prime_gem_destroy+0x2c/0x38)
> [   39.525305] [<c0701d04>] (drm_prime_gem_destroy) from [<c077d334>]
> (msm_gem_free_work+0xa0/0x1b0)
> [   39.534188] [<c077d334>] (msm_gem_free_work) from [<c0147588>]
> (process_one_work+0x2a8/0x7ec)
> [   39.542725] [<c0147588>] (process_one_work) from [<c0147b18>]
> (worker_thread+0x4c/0x554)
> [   39.550825] [<c0147b18>] (worker_thread) from [<c014ebb0>]
> (kthread+0x140/0x154)
> [   39.558229] [<c014ebb0>] (kthread) from [<c0100134>]
> (ret_from_fork+0x14/0x20)
> [   39.565457] Exception stack(0xc26a1fb0 to 0xc26a1ff8)
> [   39.570517] 1fa0:                                     00000000
> 00000000 00000000 00000000
> [   39.578703] 1fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [   39.586890] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
>
> This looks like a regression as it used to run fine on 5.4 Linux kernel.
>
> Any idea of patch reference to test is welcome.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
