Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D493424CD4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 07:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhJGFjg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 01:39:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:40992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhJGFjf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 01:39:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4291610CC;
        Thu,  7 Oct 2021 05:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633585062;
        bh=P7X92rJwASjEGPDFPTaAzuaKBzZU/P0vLoiJYBnZfng=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GSqoevSTi16VX6+LHcBCTSMvE38UB+InitX3dePN2CnjYbwbS5urG+fBNRCT7CdFm
         c35hM25I6TutA9t7Tt8fxYtK3OSYLZmEGSOcUHuEKp6es96RzJgBDEf6cJwHzClWgu
         uYhm6/bjLYXgeXP5XbjLd3PgiYRafPcYK1RvGXG8=
Date:   Thu, 7 Oct 2021 07:37:40 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v2 02/34] component: Introduce the aggregate bus_type
Message-ID: <YV6HpM8NlO29UjAI@kroah.com>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-3-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006193819.2654854-3-swboyd@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 06, 2021 at 12:37:47PM -0700, Stephen Boyd wrote:
> The component driver only provides 'bind' and 'unbind' callbacks to tell
> the host driver that it is time to assemble the aggregate driver now
> that all the components have probed. The component driver model doesn't
> attempt to resolve runtime PM or suspend/resume ordering, and explicitly
> mentions this in the code. This lack of support leads to some pretty
> gnarly usages of the 'prepare' and 'complete' power management hooks in
> drivers that host the aggregate device, and it fully breaks down when
> faced with ordering shutdown between the various components, the
> aggregate driver, and the host driver that registers the whole thing.
> 
> In a concrete example, the MSM display driver at drivers/gpu/drm/msm is
> using 'prepare' and 'complete' to call the drm helpers
> drm_mode_config_helper_suspend() and drm_mode_config_helper_resume()
> respectively, so that it can move the aggregate driver suspend/resume
> callbacks to be before and after the components that make up the drm
> device call any suspend/resume hooks they have. This only works as long
> as the component devices don't do anything in their own 'prepare' and
> 'complete' callbacks. If they did, then the ordering would be incorrect
> and we would be doing something in the component drivers before the
> aggregate driver could do anything. Yuck!
> 
> Similarly, when trying to add shutdown support to the MSM driver we run
> across a problem where we're trying to shutdown the drm device via
> drm_atomic_helper_shutdown(), but some of the devices in the encoder
> chain have already been shutdown. This time, the component devices
> aren't the problem (although they could be if they did anything in their
> shutdown callbacks), but there's a DSI to eDP bridge in the encoder
> chain that has already been shutdown before the driver hosting the
> aggregate device runs shutdown. The ordering of driver probe is like
> this:
> 
>  1. msm_pdev_probe() (host driver)
>  2. DSI bridge
>  3. aggregate bind
> 
> When it comes to shutdown we have this order:
> 
>  1. DSI bridge
>  2. msm_pdev_shutdown() (host driver)
> 
> and so the bridge is already off, but we want to communicate to it to
> turn things off on the display during msm_pdev_shutdown(). Double yuck!
> Unfortunately, this time we can't split shutdown into multiple phases
> and swap msm_pdev_shutdown() with the DSI bridge.
> 
> Let's make the component driver into an actual device driver that has
> probe/remove/shutdown functions. The driver will only be bound to the
> aggregate device once all component drivers have called component_add()
> to indicate they're ready to assemble the aggregate driver. This allows
> us to attach shutdown logic (and in the future runtime PM logic) to the
> aggregate driver so that it runs the hooks in the correct order.

Why are you creating a new bus type and not using the auxiliary bus
instead?

You have seen Documentation/driver-api/auxiliary_bus.rst, right?

thanks,

greg k-h
