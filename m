Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00842309F4A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 23:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhAaWyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 Jan 2021 17:54:18 -0500
Received: from onstation.org ([52.200.56.107]:47748 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229481AbhAaWyN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 Jan 2021 17:54:13 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 3A72B3F0B3;
        Sun, 31 Jan 2021 22:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1612133612;
        bh=zBA2yPYI5rqrcZZX1WyKJXmK/xwJfSI0vnhAopp38lQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ii5/ljccGSGrgtlADn5zOAj21GGPnpw4RRDjpazsXOUkwjZaqsawZWC4VsO99bEH3
         ff4Hu+ztI9Z5B3A2/CaZZhFdtWTL4hTA/ixFXpPItkWXJdGdadWUCjh6bUlGU4Byts
         imNHm+yQuGvAEQmsCq0cyIgTRn8YtN/Rphb/MhzA=
Date:   Sun, 31 Jan 2021 17:53:30 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/mdp5: Fix wait-for-commit for cmd panels
Message-ID: <20210131225330.GA7982@onstation.org>
References: <20210127152442.533468-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127152442.533468-1-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 27, 2021 at 05:24:40PM +0200, Iskren Chernev wrote:
> Before the offending commit in msm_atomic_commit_tail wait_flush was
> called once per frame, after the commit was submitted. After it
> wait_flush is also called at the beginning to ensure previous
> potentially async commits are done.
> 
> For cmd panels the source of wait_flush is a ping-pong irq notifying
> a completion. The completion needs to be notified with complete_all so
> multiple waiting parties (new async committers) can proceed.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Fixes: 2d99ced787e3d ("drm/msm: async commit support")

Nice job tracking down this fix!

Reviewed-by: Brian Masney <masneyb@onstation.org>
Tested-by: Brian Masney <masneyb@onstation.org>

