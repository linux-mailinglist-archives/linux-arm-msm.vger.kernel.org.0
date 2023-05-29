Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9C66714FB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 21:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjE2TYv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 15:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjE2TYj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 15:24:39 -0400
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD54ACD
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 12:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=F5LGKOaO0xZd2QJQoDrZQ93hStlQw/BEXPGAVRv9xBI=;
        b=E3BHWy6DSEDzXa3oMsDKl2c4TWz8TrNT0WyjTOSe+XHyDaVgdT5aPg8T5hFaGMlUPeTTq/cLYHLlV
         K64J2Hv2MKaG704p5TTowDdRBBVkqBqZ9kK9Y1lHWwbF8hCE6m0obxp/YOxV+UUbLFXfkYVSMSGUUc
         0nLuy7L1Fl3FyC3AlqMbVyrETI6OmjZzrJXxEvCfr2bFcngJP14FvunK4S7tQx2H2Q9s1OSbxFFiob
         apuajeIfa32NJXM7Q+sYFBeUF5j4nGYUIt0PX6oQox7+Y7q97UrJ0ScYOXBMzx2/mJsdsS6h6DekA6
         0nj1tQdnvvnils3kyvnZM7xho6VMt0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=F5LGKOaO0xZd2QJQoDrZQ93hStlQw/BEXPGAVRv9xBI=;
        b=x0HICKYM9KRbhvWk9S0JD14RS7oybqBEsNGG3i5w8SVdzkzLE9ImA16GyoklTIA3nv0gw+5D2CQ1v
         BSqXCZKCg==
X-HalOne-ID: 70b8da45-fe56-11ed-8520-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay1 (Halon) with ESMTPSA
        id 70b8da45-fe56-11ed-8520-99461c6a3fe8;
        Mon, 29 May 2023 19:24:35 +0000 (UTC)
Date:   Mon, 29 May 2023 21:24:34 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v4 03/13] drm/armada: Use regular fbdev I/O helpers
Message-ID: <20230529192434.GC1370714@ravnborg.org>
References: <20230524092150.11776-1-tzimmermann@suse.de>
 <20230524092150.11776-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524092150.11776-4-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 24, 2023 at 11:21:40AM +0200, Thomas Zimmermann wrote:
> Use the regular fbdev helpers for framebuffer I/O instead of DRM's
> helpers. Armada does not use damage handling, so DRM's fbdev helpers
> are mere wrappers around the fbdev code.
> 
> By using fbdev helpers directly within each DRM fbdev emulation,
> we can eventually remove DRM's wrapper functions entirely.
> 
> v4:
> 	* use initializer macros for struct fb_ops
> v2:
> 	* use FB_IO_HELPERS option
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Russell King <linux@armlinux.org.uk>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
