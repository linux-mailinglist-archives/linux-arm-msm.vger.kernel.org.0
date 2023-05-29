Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3241C714FE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 21:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjE2Tmm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 15:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjE2Tmm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 15:42:42 -0400
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A869ACD
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
         message-id:subject:cc:to:from:date:from;
        bh=wUfXvnVscNDHokiq7vn1jObWtrFuRJJpIbqINcxXDJE=;
        b=knGLUans50LTZIo5f1iVlVgufTKBN3qIzs+NSf9br/jM5jHjHmYBi5g2/FBkei1b0wJjoFKhxSShV
         QSoZGiUz86hzh4UgxBsuS6euL3xR/ZonuALCFFhA8XiecTqW5AIGdTQoHEMPsH9rkMV1dpB468TCAG
         JoeCW69AvlKmWm0o9tIxIDbln+tJ5/ckfNmXDeJWMVVpyyxlihT0HnD0BJeIZX1SnasSm/RgHLuTIk
         F2e3h8bQ7f830k9spRcCLPbS4DJ9UgZqRFFqnLuzg2A9XlMmULp7Xdre3rmfleaPQthSb5WgHOa1Fe
         EvHZd+/jsf5bfp2smSgvH5E4TzLlwCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
         message-id:subject:cc:to:from:date:from;
        bh=wUfXvnVscNDHokiq7vn1jObWtrFuRJJpIbqINcxXDJE=;
        b=SPkPhAKKpLhNfEwhgL3ZL2sVscqxwpfUw6ze1N9enTq8D4Ch51D8bRwX0xHhLkO4hgMRMxnb09WWw
         5HU9e0GDA==
X-HalOne-ID: c141e50e-fe58-11ed-8a8a-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay4 (Halon) with ESMTPSA
        id c141e50e-fe58-11ed-8a8a-592bb1efe9dc;
        Mon, 29 May 2023 19:41:08 +0000 (UTC)
Date:   Mon, 29 May 2023 21:41:07 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 13/13] drm/i915: Implement dedicated fbdev I/O helpers
Message-ID: <20230529194107.GG1370714@ravnborg.org>
References: <20230524092150.11776-1-tzimmermann@suse.de>
 <20230524092150.11776-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230524092150.11776-14-tzimmermann@suse.de>
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLACK autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thomas,

On Wed, May 24, 2023 at 11:21:50AM +0200, Thomas Zimmermann wrote:
> Implement dedicated fbdev helpers for framebuffer I/O instead
> of using DRM's helpers. Use an fbdev generator macro for
> deferred I/O to create the fbdev callbacks. i915 was the only
> caller of the DRM helpers, so remove them from the helper module.
> 
> i915's fbdev emulation is still incomplete as it doesn't implement
> deferred I/O and damage handling for mmaped pages.
> 
> v4:
> 	* generate deferred-I/O helpers
> 	* use initializer macros for fb_ops
> v2:
> 	* use FB_IO_HELPERS options
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/Kconfig                    |   3 -
>  drivers/gpu/drm/drm_fb_helper.c            | 107 ---------------------
>  drivers/gpu/drm/i915/Kconfig               |   1 +
>  drivers/gpu/drm/i915/display/intel_fbdev.c |  14 +--
>  include/drm/drm_fb_helper.h                |  39 --------
>  5 files changed, 9 insertions(+), 155 deletions(-)

Nice diffstat!
Assuming there is a good explanation on the dirty check:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
