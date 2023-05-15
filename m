Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72324703BEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 20:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245031AbjEOSIb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 14:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245030AbjEOSH6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 14:07:58 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F057319BDD;
        Mon, 15 May 2023 11:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UptWDb0iV+o5z9X0WCR+BXDLg76JezuxOuI+dHBMTFQ=; b=Qy9A1xp6X5B+8V/DvHWTppHAwc
        SKkr6BUxJhjQuZ/c06v/6lU9OZqDrCGxI7X36o4YEMCUubNf4ydxEr5ijBPJx5CwDHgOal8epTBCK
        66yrnn7h56UIpYVNeXkockpA5LcNknYNa991IzYY14MszuY7fsOzvhqZ8bfRTrIbdrQh8g0zTKoVi
        5YzvMrjOahyBDT20+XOvujFnHsK9vY2cwD9XVm5IAgxuzpG8kbhAX6urQEi8uZYTicu5LVsdP1ot5
        mVq/jIgSUHCThI3dQfNKAPIupLSdKt78qRxS2ei1YrXoQh91aJi758yrgkJwOADZWXx265PEIsXF9
        A2F6Zcrw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58784)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1pycZ1-0004Or-Ra; Mon, 15 May 2023 19:04:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1pycYy-0008Oh-U4; Mon, 15 May 2023 19:04:48 +0100
Date:   Mon, 15 May 2023 19:04:48 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, javierm@redhat.com,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 02/12] drm/armada: Use regular fbdev I/O helpers
Message-ID: <ZGJ0QIQrF/a0Wkri@shell.armlinux.org.uk>
References: <20230515094033.2133-1-tzimmermann@suse.de>
 <20230515094033.2133-3-tzimmermann@suse.de>
 <20230515175544.GB1745913@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515175544.GB1745913@ravnborg.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 15, 2023 at 07:55:44PM +0200, Sam Ravnborg wrote:
> Hi Thomas,
> 
> On Mon, May 15, 2023 at 11:40:23AM +0200, Thomas Zimmermann wrote:
> > Use the regular fbdev helpers for framebuffer I/O instead of DRM's
> > helpers. Armada does not use damage handling, so DRM's fbdev helpers
> > are mere wrappers around the fbdev code.
> > 
> > By using fbdev helpers directly within each DRM fbdev emulation,
> > we can eventually remove DRM's wrapper functions entirely.
> > 
> > v2:
> > 	* use FB_IO_HELPERS option
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Russell King <linux@armlinux.org.uk>
> > ---
> >  drivers/gpu/drm/armada/Kconfig        | 1 +
> >  drivers/gpu/drm/armada/armada_fbdev.c | 9 ++++-----
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/armada/Kconfig b/drivers/gpu/drm/armada/Kconfig
> > index f5c66d89ba99..5afade25e217 100644
> > --- a/drivers/gpu/drm/armada/Kconfig
> > +++ b/drivers/gpu/drm/armada/Kconfig
> > @@ -3,6 +3,7 @@ config DRM_ARMADA
> >  	tristate "DRM support for Marvell Armada SoCs"
> >  	depends on DRM && HAVE_CLK && ARM && MMU
> >  	select DRM_KMS_HELPER
> > +	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
> >  	help
> >  	  Support the "LCD" controllers found on the Marvell Armada 510
> >  	  devices.  There are two controllers on the device, each controller
> > diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
> > index 0a5fd1aa86eb..6c3bbaf53569 100644
> > --- a/drivers/gpu/drm/armada/armada_fbdev.c
> > +++ b/drivers/gpu/drm/armada/armada_fbdev.c
> > @@ -5,6 +5,7 @@
> >   */
> >  
> >  #include <linux/errno.h>
> > +#include <linux/fb.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  
> > @@ -34,11 +35,9 @@ static void armada_fbdev_fb_destroy(struct fb_info *info)
> >  static const struct fb_ops armada_fb_ops = {
> >  	.owner		= THIS_MODULE,
> >  	DRM_FB_HELPER_DEFAULT_OPS,
> > -	.fb_read	= drm_fb_helper_cfb_read,
> > -	.fb_write	= drm_fb_helper_cfb_write,
> I had expected to see
> .fb_read = fb_io_read,
> 
> But maybe this only used when using damage handling?
> 
> Likewise for drm_fb_helper_cfb_write.
> 
> ??
> 
> > -	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
> > -	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
> > -	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
> > +	.fb_fillrect	= cfb_fillrect,
> > +	.fb_copyarea	= cfb_copyarea,
> > +	.fb_imageblit	= cfb_imageblit,
> 
> This part is as expected.

Well, to me it looks like this has gone through an entire circular set
of revisions:

commit e8b70e4dd7b5dad7c2379de6e0851587bf86bfd6
Author: Archit Taneja <architt@codeaurora.org>
Date:   Wed Jul 22 14:58:04 2015 +0530

    drm/armada: Use new drm_fb_helper functions

-       .fb_fillrect    = cfb_fillrect,
-       .fb_copyarea    = cfb_copyarea,
-       .fb_imageblit   = cfb_imageblit,
+       .fb_fillrect    = drm_fb_helper_cfb_fillrect,
+       .fb_copyarea    = drm_fb_helper_cfb_copyarea,
+       .fb_imageblit   = drm_fb_helper_cfb_imageblit,

commit 983780918c759fdbbf0bf033e701bbff75d2af23
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Thu Nov 3 16:14:40 2022 +0100

    drm/fb-helper: Perform all fbdev I/O with the same implementation

+       .fb_read        = drm_fb_helper_cfb_read,
+       .fb_write       = drm_fb_helper_cfb_write,

and now effectively those two changes are being reverted, so we'd
now be back to the pre-July 2015 state of affairs. As I believe
the fbdev layer has been stable, this change merely reverts the
driver back to what it once was.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
