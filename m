Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B090272177
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 12:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgIUKt5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 06:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgIUKt5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 06:49:57 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4DCBC061755;
        Mon, 21 Sep 2020 03:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=+Ce2j6BK4131uYjorGXmkaktnjo2xDWmD45iu81+eGY=; b=WBss3/+LJn25tf2jl2Kd4BllMI
        We3aM8pS1bHk+lP+j+FgiErzPOP5101rI+iEOmhIiBWuEclNOK8yjXeMc8p2hvO66DyHQqRG+ibdj
        fNxQM2TO9oPahOrflU5CGkUoPhPyktIfZxoWHOY3bCCiIiJip2uorUCAcIJ2/5F4nuohyg/YUHlNc
        d5O5AVK+rnqDUnKxbfw+9B12rKUynM8ObjyYjNOPdklvEWrciu+346Xxd6P1M8ap9VwFZ/Hd4PL88
        Vr3wsnD98TRmaevM03kBW8JZcL8svKW7/HBzjsWyHFHP01ZNBq6xW7/V+e56JiWbSDZ5VukELoex3
        jH5DmECw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kKJOK-0008Ei-4J; Mon, 21 Sep 2020 10:49:52 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4F336301478;
        Mon, 21 Sep 2020 12:49:47 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 89B2A243FFC0F; Mon, 21 Sep 2020 12:49:47 +0200 (CEST)
Date:   Mon, 21 Sep 2020 12:49:47 +0200
From:   peterz@infradead.org
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, timmurray@google.com,
        Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 0/3] drm: commit_work scheduling
Message-ID: <20200921104947.GQ1362448@hirez.programming.kicks-ass.net>
References: <20200919193727.2093945-1-robdclark@gmail.com>
 <20200921092154.GJ438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921092154.GJ438822@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 11:21:54AM +0200, Daniel Vetter wrote:

> So question to rt/worker folks: What's the best way to let userspace set
> the scheduling mode and priorities of things the kernel does on its
> behalf? Surely we're not the first ones where if userspace runs with some
> rt priority it'll starve out the kernel workers that it needs. Hardcoding
> something behind a subsystem ioctl (which just means every time userspace
> changes what it does, we need a new such flag or mode) can't be the right
> thing.
> 
> Peter, Tejun?

So regular workqueues do not support RT priorities, but you can set
their nice value somewhere in /sys.

The kthread_work stuff used in these patches result in a regular kthread
and as such the user interface for changing its scheduling class or
priority is that of any other 'random' task.


