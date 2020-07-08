Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4BAF2184E1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 12:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgGHKXt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 06:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgGHKXs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 06:23:48 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511EAC08E6DC
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 03:23:48 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id w3so2338813wmi.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 03:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z8+r2cqqKhJKYoH9hGRghRj6vIVi2wdr4Y4kgj/xsjY=;
        b=FxaDndhVThqHQeAQ2Ik51rYAKq7WOGd0GnVrsra1PkjPvOt6h7eRoSCYIkGbJ1Ls1j
         SVqBqikrI9JsvQTATOqSx0rLWaMHgYaJAKIN7X1ZRvoQzF4iigpHlJKc40mk4hSsHuHR
         QSzgnzzEHXyIsiH8th/ZY6PA2tAal2gdhFISOQ5x79VHtc22BKOvIeggrDSaSSNlviYl
         +IMrpO4J6SEeA8JUSpCNGv3hLszRXFeJjDTTmujmBpiXcVPoKeALwrb/9QQsK+UGhXi9
         O0HK/XKP7d0jFpADs55NK2P1aOgAe+BBy6jrYeQIaQQd/UQvThQvxNWvTNtK+VaspXci
         mVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z8+r2cqqKhJKYoH9hGRghRj6vIVi2wdr4Y4kgj/xsjY=;
        b=Pyfl6BjEDdpHo4uQIpdKrjvhWDAXGgHtEXwCKXamCUQuhRytH9UmXY7w25v4T4Nook
         UQoBWJu7IUFs1J5vBWLkPYdodbW/slhk+dekh51u7ZBPVll16Hgczg4qm9lygJ5Jrtet
         kupqjfZVBnFVxCwEFhLWWURPwS3xVw/vFPpF2yijcVUpYulVF0TazPDArIDxELKooKhq
         D9ADje2OfukG8mQdom2T5C6/FHVdVCl8bZuPixpTrzJ0QpkPFXYlyVhhI/xxy3x4qSSV
         caOIrPIvd+raKN6nEmHlGK2s+LPXQ+n2K5hOuCqphdLPTR4HhjHUSaYwNnP351q92lGg
         ZcNw==
X-Gm-Message-State: AOAM533oL2rVnw0bltq6HIA1HR2nAgeOY5Y4XjJKCGlJamNP1nrPiWY9
        6Jr5jewCWO8jd8XzceWIRHjzwQ==
X-Google-Smtp-Source: ABdhPJx17kgaBLLSo3ldC/0JUfIhPPXRByUkKLn2LBh2O7xRk4tCviFU6vHXMutiSwjsym1QA6ryeg==
X-Received: by 2002:a1c:7fd7:: with SMTP id a206mr8525032wmd.104.1594203826992;
        Wed, 08 Jul 2020 03:23:46 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id v66sm5669394wme.13.2020.07.08.03.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 03:23:46 -0700 (PDT)
Date:   Wed, 8 Jul 2020 11:23:44 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
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
Message-ID: <20200708102344.4vj5jy773mtbzif6@holly.lan>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-6-sam@ravnborg.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 03, 2020 at 08:45:31PM +0200, Sam Ravnborg wrote:
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

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
