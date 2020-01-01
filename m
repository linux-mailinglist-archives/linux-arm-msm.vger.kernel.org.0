Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76FAD12DD8C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jan 2020 04:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgAADu3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Dec 2019 22:50:29 -0500
Received: from onstation.org ([52.200.56.107]:51212 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727036AbgAADu3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Dec 2019 22:50:29 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 3B7503E9DC;
        Wed,  1 Jan 2020 03:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1577850628;
        bh=YdZrENY31tFEvhQW8UhSRWsAzqFtpPEHXpQaoGS21rM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EkG4ibOllK0kgywN0n/8NaH6a8BDheubrNOhq/75whH1IHzJY54Mw5SHk82evG11l
         aTVH9I4eKcYDROT7ci7UgbQdW+C9SVCZ+cXhGskbp/VJHYRyLLXLbZzaOYym6HmiB+
         JSjANMJ2bp2zluxMATBljglC2M8N0PB9/68nGWdI=
Date:   Tue, 31 Dec 2019 22:50:27 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     jeffrey.l.hugo@gmail.com, robdclark@gmail.com
Cc:     freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        sean@poorly.run
Subject: Re: [PATCH RFC v2] drm/msm/mdp5: enable autorefresh
Message-ID: <20200101035027.GA9348@onstation.org>
References: <20191230020053.26016-1-masneyb@onstation.org>
 <20191230020053.26016-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191230020053.26016-2-masneyb@onstation.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Dec 29, 2019 at 09:00:53PM -0500, Brian Masney wrote:
> Since the introduction of commit 2d99ced787e3 ("drm/msm: async commit
> support"), command-mode panels began throwing the following errors:
> 
>     msm fd900000.mdss: pp done time out, lm=0
> 
> Let's fix this by enabling the autorefresh feature that's available in
> the MDP starting at version 1.0. This will cause the MDP to
> automatically send a frame to the panel every time the panel invokes the
> TE signal, which will trigger the PP_DONE IRQ. This requires only
> sending a single START signal for command-mode panels.
> 
> This gives us a counter for command-mode panels that we can use to
> implement async commit support for the MDP5 in a follow up patch.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Suggested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Fixes: 2d99ced787e3 ("drm/msm: async commit support")
> ---
> Changes since v1:
> - Send a single start command to kick off the pipeline.
> 
> The reason I marked this patch as a RFC is that the display during some
> small percentage of boots will stop updating after a minute or so, and
> the ping pong IRQs stop. Most of the time it works with no issues and I
> haven't been able to find a way to reproduce the issue. I tried
> suspending the phone by toggling /sys/power/state since I thought that
> the issue could potentially be related to power management.

After working to get the IOMMU up on msm8974, I suspect that the issue
that I describe above is caused by a device probe deferral, which
explains the intermittent nature of what I'm seeing. First driver load
sets up the autorefresh registers, sends a single START signal, then a
-EPROBE_DEFER is thrown later on. Second driver load lost the state, and
sends a second START signal and overloads the DSI.

If that's the case, then potentially the solution may be to do
both of the following:

1) Disable autorefresh when the driver is unloaded.
2) Before sending the START signal, check to make sure that autorefresh
   is actually disabled.

I likely won't be able to work on any this until Sunday evening.

Brian

