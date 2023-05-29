Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3FA714FCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 21:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjE2TjD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 15:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjE2TjC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 15:39:02 -0400
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B758DCD
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 12:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=hS9C7fWnDSPQZ58CnQCj5SHuhoWrOmFyL9LAfljaHzg=;
        b=TSG6EveYvpoZeDtJvX0S0rh8cPRm68zaX+nLQZziu3IJ5+uTkmDTZTE84nxTAIAY4Ruhg+Lvga8L+
         nkWTGHhBXkJVKW1hYZsulYVf0n7XuweNX+kFho/NbTkVSvPexZGTwVd4gYVHAroCGkFdxtIJe9y/6W
         PuU1/1cSrokjLt9QnsI1cGx4tFmnl0Hrf/BMkHvYuoQ4ikpapge7jFkAHnlH/JydZAYhnQfFjreh2m
         es9wAyzXGp61BLd0/rpX5uKm6rPyaOvuDptojcU9QHBIfQf3rlVH7eI8X19wGLGKAczV7wsyD47kiq
         Lx0ISnID16EndPqNVPNn99VVkrLdiuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=hS9C7fWnDSPQZ58CnQCj5SHuhoWrOmFyL9LAfljaHzg=;
        b=zUwswgSuyFtdlgerXhHDRpVhe/ckMs2wC7vrz/tXGZL8S4IjG9LpJ3SNbcQNrDY5PvQbrrqGEPflI
         rn/gVP4DA==
X-HalOne-ID: 4ec6af59-fe58-11ed-8a77-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay4 (Halon) with ESMTPSA
        id 4ec6af59-fe58-11ed-8a77-592bb1efe9dc;
        Mon, 29 May 2023 19:37:56 +0000 (UTC)
Date:   Mon, 29 May 2023 21:37:55 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 00/13] drm/fbdev: Remove DRM's helpers for fbdev I/O
Message-ID: <20230529193755.GE1370714@ravnborg.org>
References: <20230524092150.11776-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524092150.11776-1-tzimmermann@suse.de>
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLACK autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thomas.

> v4:
> 	* use initializer and generator macros for struct fb_ops
> 	* partially support damage handling in msm (Dmitri)

I like the macros. They make it simpler and we do not spread the _cfb_
misname to more files.


> v3:
> 	* fix Kconfig options (Jingfeng)
> 	* minimize changes to exynos (Sam)
> v2:
> 	* simplify Kconfig handling (Sam)
> 
> Thomas Zimmermann (13):
>   fbdev: Add Kconfig options to select different fb_ops helpers
>   fbdev: Add initializer macros for struct fb_ops


>   drm/armada: Use regular fbdev I/O helpers
>   drm/exynos: Use regular fbdev I/O helpers
>   drm/gma500: Use regular fbdev I/O helpers
>   drm/radeon: Use regular fbdev I/O helpers
>   drm/fbdev-dma: Use regular fbdev I/O helpers
>   drm/msm: Use regular fbdev I/O helpers
>   drm/omapdrm: Use regular fbdev I/O helpers
>   drm/tegra: Use regular fbdev I/O helpers
These are all:
Acked-by: Sam Ravnborg <sam@ravnborg.org>
