Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1786E2225EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 16:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbgGPOjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 10:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729064AbgGPOjq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 10:39:46 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC2E6C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 07:39:45 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id w3so11842630wmi.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 07:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=amD6wrTVFFwDbb/9Gfx9BmB+NGg+A9qoz+nxoVL9uN4=;
        b=xRTuTBfasRD7U+3n7RQKolbc3Bc4VHhuoEMK05/P8zvoGyzO5gW8v0aOgRwGxElcyu
         y89eoS5pzHxnGr5bEt0QhudSLUFK8Gup2vFYemqo/fWrMxdjuw5SRyzIAh938yqv2ipN
         gjxH+dr60+qqFEEhsCkw/G5yQ/vcnfsTLZgSu4Z5gmeyRNrY1d1Oa0t8IXw6HIrgcsZi
         GbRAkSFAO10W478H4GClKk84sWLv7J6mbEFZ3hlp3C+i59NmaNLrfnOWJ/rVqzfliV9t
         bXzgj3Y4Bp1CDV9s6TSHLhFgCLIdjDrmCYR1li5djNwJlnra6IxiFU76L2Tpm/rQKti3
         kvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=amD6wrTVFFwDbb/9Gfx9BmB+NGg+A9qoz+nxoVL9uN4=;
        b=mU8wx3N1QhW9TvG28zlSXJKj9SfIwK32AgqaJByllK+8nTq5DhiftwMjsIQbtbWhLg
         yzNq7QArESxc1JimF4CqfxFQT6Bwz9lewTa8rLmtHJbHSPVs9rVmYyEDEUCNIIZovLcu
         zp2EY7FPt8cpfrru4xAcSFspRVXamzJFpgSiVDtP1Wa7P3li8Oi470S/TCnEFm8joiEu
         H1sE63EqKYmaBjlZhx0nVGGtKZyXsWvAO0u7l6acRN8xvVxbSIN9jo5nmzNv0xkXwZuV
         kj2m7yoogwBma6p2vyDc64pE3+gsnQiucGpjM2p9EwBWKroWzwUtD9wCga2nvoCyojcq
         GgIw==
X-Gm-Message-State: AOAM532tFQmVZN2lqnunx3vuPkSqMYRhdH+y4xLpnqDaT0snn+hfzef+
        iSWHFF0IObQPjcTUYHDNo+fF6w==
X-Google-Smtp-Source: ABdhPJx3HKsrJ856ANN56k2CwqUedRnP671Th4Ufr3y+385WVcicQxrWUwEWf8EEiJ2bzYG/c3ZNLQ==
X-Received: by 2002:a1c:a557:: with SMTP id o84mr4698422wme.42.1594910384285;
        Thu, 16 Jul 2020 07:39:44 -0700 (PDT)
Received: from dell ([2.31.163.61])
        by smtp.gmail.com with ESMTPSA id c15sm8830382wme.23.2020.07.16.07.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:39:43 -0700 (PDT)
Date:   Thu, 16 Jul 2020 15:39:41 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        patches@opensource.cirrus.com,
        Support Opensource <support.opensource@diasemi.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 05/20] backlight: improve backlight_device
 documentation
Message-ID: <20200716143941.GS3165313@dell>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200703184546.144664-6-sam@ravnborg.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 03 Jul 2020, Sam Ravnborg wrote:

> Improve the documentation for backlight_device and
> adapt it to kernel-doc style.
> 
> The updated documentation is more strict on how locking is used.
> With the update neither update_lock nor ops_lock may be used
> outside the backlight core.
> This restriction was introduced to keep the locking simple
> by keeping it in the core.
> It was verified that this documents the current state by renaming
> update_lock => bl_update_lock and ops_lock => bl_ops_lock.
> The rename did not reveal any uses outside the backlight core.
> The rename is NOT part of this patch.
> 
> v3:
>   - Update changelog to explain locking details (Daniel)
> 
> v2:
>   - Add short intro to all fields (Daniel)
>   - Updated description of update_lock (Daniel)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  include/linux/backlight.h | 72 ++++++++++++++++++++++++++-------------
>  1 file changed, 49 insertions(+), 23 deletions(-)

Some of these do not apply cleanly.

Please collect the *-bys already received, rebase and resubmit.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
