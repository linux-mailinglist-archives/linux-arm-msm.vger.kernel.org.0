Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7E22D3F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 04:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbfE2Cqu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 22:46:50 -0400
Received: from onstation.org ([52.200.56.107]:41642 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbfE2Cqu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 22:46:50 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id AF6A73E93F;
        Wed, 29 May 2019 02:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1559098009;
        bh=aRBBhy0Kk6XSGsl/Ftb8O8lFKtAxihQWGmXQEY0I06w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C9rPPdfaKmSr7mTVb+0Lk2lfnDbgZbDzftRQhz3hjeRFgTNa0pRlOicd50dvk90EX
         taUjiI1yBvgyypyXxKqtcP+/7WALm3KK7iRwqrpZxCxjplv7JEC7NEX91fCSLCDA4F
         l27G7XLjh2AtIX3DNrY7JEldf2XaU3DKwU7EsExo=
Date:   Tue, 28 May 2019 22:46:48 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5
 display support
Message-ID: <20190529024648.GA13436@basecamp>
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
 <CAOCk7NrRo2=0fPN_Sy1Bhhy+UV7U6uO5aV9uXZc8kc3VpSt71g@mail.gmail.com>
 <20190529013713.GA13245@basecamp>
 <CAOCk7NqfdNkRJkbJY70XWN-XvdtFJ0UVn3_9rbgAsNCdR7q5PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NqfdNkRJkbJY70XWN-XvdtFJ0UVn3_9rbgAsNCdR7q5PQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 28, 2019 at 07:42:19PM -0600, Jeffrey Hugo wrote:
> > > Do you know if the nexus 5 has a video or command mode panel?  There
> > > is some glitchyness with vblanks and command mode panels.
> >
> > Its in command mode. I know this because I see two 'pp done time out'
> > messages, even on 4.17. Based on my understanding, the ping pong code is
> > only applicable for command mode panels.
> 
> Actually, the ping pong element exists in both modes, but 'pp done
> time out' is a good indicator that it is command mode.
> 
> Are you also seeing vblank timeouts?

Yes, here's a snippet of the first one.

[    2.556014] WARNING: CPU: 0 PID: 5 at drivers/gpu/drm/drm_atomic_helper.c:1429 drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290
[    2.556020] [CRTC:49:crtc-0] vblank wait timed out
[    2.556023] Modules linked in:
[    2.556034] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.2.0-rc1-00178-g72c3c1fd5f86-dirty #426
[    2.556038] Hardware name: Generic DT based system
[    2.556056] Workqueue: events deferred_probe_work_func
...

> Do you have busybox?
> 
> Can you run -
> sudo busybox devmem 0xFD900614
> sudo busybox devmem 0xFD900714
> sudo busybox devmem 0xFD900814
> sudo busybox devmem 0xFD900914
> sudo busybox devmem 0xFD900A14

# busybox devmem 0xFD900614
0x00020020
# busybox devmem 0xFD900714
0x00000000
# busybox devmem 0xFD900814
0x00000000
# busybox devmem 0xFD900914
0x00000000
# busybox devmem 0xFD900A14
0x00000000

I get the same values with the mainline kernel and 4.17.

Brian
