Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45492185CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 13:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbgGHLOf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 07:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728658AbgGHLOe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 07:14:34 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE08C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 04:14:34 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 17so2537264wmo.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DMw4+fPRGMaXG7hndNa1cNxYT36XUGUYTrv9BZ28ww0=;
        b=tmkQJgYxYvMfsw2nQIhiJGMliDc9xePDNklFbCpzEnmfNrhZ3ADzGcnv46CcgNaGG/
         TFKSX37aEse++WZY8OLMvbdmWIUXkjFPWYjU3NHOZPhAiZhYCM7cjrZIREHauaCOfKYF
         XJ46tYARoLKrRH/4EDh7CIXNnMHj49uzV9wISO0wXYU87a7ZWF3NDk0S0stf/JLYNkFx
         jBOOox1kWc21p0taavMn/f6Vxlmh0VDtJ0Vc6nJ6rBfYDzlk+0zXgcAzB+/oTdXZD2/z
         XyPW1myJ/3l1gggzhq14CczQ++YlSc+X2aibaiUkX71E4umV/JkD2MasEar7DSj+mLBH
         qPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DMw4+fPRGMaXG7hndNa1cNxYT36XUGUYTrv9BZ28ww0=;
        b=n4Q/oUwyr8XjDRlH1UYBnHsQ3oaKF6MpRS9X0HbApfjXKFcpyiSfTHM7m7m0+zYDwv
         lupcxDNj0KRwn2IQpwak2WnYb5OCoBJ6mvFt5HDqWLLNRJ35/DzJ20z3GlIBXPV7EmCZ
         OoAdJvztcncmnLydJSjqO3xoUFiQ1sriQJep/V6CeKV2yGxy7Ca1CGUgjP7qXWyqqFFc
         As9CRDVP4gDY+IgHEKRbYSFAjv8UQDxZPzx9CJVsiNNRwkHl235cFgW3vc075SShHig6
         7WwIRddD7p0oURJZxkHDq2oGaTqGMPuGMxpDL6eqrOrnkqUdSRSsX4zJ5XSG3gNXWDMM
         M08g==
X-Gm-Message-State: AOAM533H5kzNZc0qO/LIy0brRrRooms+APR46t2GUcQlnvNto0fVjUbm
        zBNa1HPzJwetjYv5+t4gAl+F5w==
X-Google-Smtp-Source: ABdhPJxjgpOLdK7XXUd4ThbhV82XPTgdLbJairgMJNL7e604Gj2YRDxht52niQkYjRTjIrae1pu8NA==
X-Received: by 2002:a1c:e0c4:: with SMTP id x187mr8535587wmg.153.1594206873106;
        Wed, 08 Jul 2020 04:14:33 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id a3sm5286137wmb.7.2020.07.08.04.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 04:14:32 -0700 (PDT)
Date:   Wed, 8 Jul 2020 12:14:30 +0100
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
Subject: Re: [PATCH v4 17/20] backlight: use backligt_get_brightness()
Message-ID: <20200708111430.rkcnqla77hds6wg2@holly.lan>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-18-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-18-sam@ravnborg.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 03, 2020 at 08:45:43PM +0200, Sam Ravnborg wrote:
> Introduce the backlight_get_brightness() helper in all
> video/backlight/* drivers.
> This simplifies the code and align the implementation of the
> update_status() operation across the different backlight drivers.
> 
> Some of the drivers gains a little extra functionality by the change
> as they now respect the fb_blank() ioctl.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
