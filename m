Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E89477005DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 12:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbjELKqG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 06:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240338AbjELKqE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 06:46:04 -0400
X-Greylist: delayed 963 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 12 May 2023 03:46:02 PDT
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 176C91FCE
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 03:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=xE6wvptVArBI3zvQgXdoZHztrUTgrAoTNb6oK9pbo4s=;
        b=N0Y9Vk/e/GiSCy7meTXCcDOq8tUId4zZJUd+vs17Ccupm2mzKDi+SnC6xL80Wvwg+NQv8B6vx5/UJ
         L4Q/MptMR38K5tIsnk5UKrxZVB/6/N3HSdJvkmNu4h8A/FBSnIXC9LtedbtujwP8ldwjdWcv9CKBXV
         RcOCkpvkXOpHYUldNc9vAwcjo6Zw6zLfC5/9Kee09YDKN52oC+0Ixm5TGqCmQmVRQjPVUfqd3xkNXq
         Q9sdGlXOJrob2/oRhx4hvhQwG1No4rG0lsU1J9ZPYeJOgZ707CQKVMWjZMg21BqhG1/ZiKB2SiVY7G
         i4Bs1V680oHholiOSV/TnR7oODbj+Lw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=xE6wvptVArBI3zvQgXdoZHztrUTgrAoTNb6oK9pbo4s=;
        b=uYjNnVJG1B9oXLhzlGu0xkxlUVihIRVlz9Zaowl0O01L73yfgKx0+KUURWEkAd2Wwb9t7pT1wwakI
         M74ZniQBA==
X-HalOne-ID: ee959521-f0af-11ed-a9ff-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay3 (Halon) with ESMTPSA
        id ee959521-f0af-11ed-a9ff-b90637070a9d;
        Fri, 12 May 2023 10:29:55 +0000 (UTC)
Date:   Fri, 12 May 2023 12:29:54 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/11] drm/fbdev: Remove DRM's helpers for fbdev I/O
Message-ID: <20230512102954.GA1373384@ravnborg.org>
References: <20230512084152.31233-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512084152.31233-1-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thomas,

On Fri, May 12, 2023 at 10:41:41AM +0200, Thomas Zimmermann wrote:
> DRM provides a number of wrappers around fbdev cfb_() sys_(), fb_io_()
> and fb_sys_() helpers. The DRM functions don't provide any additional
> functionality for most DRM drivers. So remove them and call the fbdev
> I/O helpers directly.
> 
> The DRM fbdev I/O wrappers were originally added because <linux/fb.h>
> does not protect its content with CONFIG_FB. DRM fbdev emulation did
> not build if the the config option had been disabled. This has been
> fixed. For fbdev-generic and i915, the wrappers added support for damage
> handling. But this is better handled within the two callers, as each
> is special in its damage handling.
> 
> Patches 1 to 8 replace the DRM wrappers in a number of fbdev emulations.
> Patch 9 exports two helpers for damage handling. Patches 10 and 11
> update fbdev-generic and i915 with the help of the exported functions.
> The patches also remove DRM's fbdev I/O helpers, which are now unused.
> 
> DRM's fbdev helpers had to select fbdev I/O helpers for I/O and for
> system memory. Each fbdev emulation now selects the correct helpers
> for itself. Depending on the selected DRM drivers, kernel builds will
> now only contain the necessary fbdev I/O helpers and might be slightly
> smaller in size.

Nice cleanup.

From one of the patches:

> +config DRM_ARMADA_FBDEV_EMULATION
> +     bool
> +     depends on DRM_ARMADA
> +     select FB_CFB_COPYAREA
> +     select FB_CFB_FILLRECT
> +     select FB_CFB_IMAGEBLIT

This seems like a hard to maintain way to select a few helper functions.
Today we have LD_DEAD_CODE_DATA_ELIMINATION for the configs that care
about size - and that should work here as well.

I understand where this comes from and I am not against the
solution, but wanted to point at a more modern approach to deal with the
bloat.

Maybe some of the embbedded folks can tell if LD_DEAD_CODE_DATA_ELIMINATION
can be trusted yet or that is something for the future.

In barebox -ffunction-section (what LD_DEAD_CODE_DATA_ELIMINATION
enables) is used with success - there it really helps when generating
different barebox images where size matters a lot.

	Sam
