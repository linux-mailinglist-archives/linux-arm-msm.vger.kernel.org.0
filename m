Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6401F2185E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 13:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbgGHLRV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 07:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728658AbgGHLRU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 07:17:20 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA6CC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 04:17:20 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id j18so2510377wmi.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 04:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H/94gV2OrS1bi9DuK0dvzVPneLIcPLtL1oVf8zR732Y=;
        b=xwgUDhxwt2KM2ltnynRTtK4s26Z+Dzc6vQJoqYm+yLz5udjs/XU0Ca09sOyyHt3uyd
         h9+hshKFErad+yztXINMKdnqPYvx4tzk7w1PvzHKNjo9fs+bOs+ebbqALO4QvLIFtaMy
         AMYI6HGOaDx6vx7pnk8hGpNpXjy0y/9bwLQqFWTFC4fpST4S6MvfeG09Ob/ZXPHV/+zg
         MyI4w1q2gMoEa7avTiNwxap0hmckYsJH5Z8fct34IvyJgQ5+o5u1xoH+ISXqRB4aUBd6
         OKKmchr0SUSu+r8uhD0eRDEMT8n61Z5OL31C3LGo3/l2je30q/eXPWaBYpaf8xNbfYGD
         Hkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H/94gV2OrS1bi9DuK0dvzVPneLIcPLtL1oVf8zR732Y=;
        b=pHEBujgLj3oTuRtXVQA4M12DAPR03RhqVmM07Yu0OpJAsWZNKulhyqWmXOeE+MKbg6
         HO7+8SpKr1AcV2xjrk/1k0jPKGcJ2yUyKD0guMmkrpXeDS8jBIGlg9jM3PBpLXx31cQE
         kBArfytX3tfsvW8dv8yfz/iwZqbGdTCxzwIHsWCO1mZ1FGNjUNceXIMwiQzOQ1ZOF908
         IUkTZ2Q/ehARmO63EAeYiY+SIILnvAwveJuSKC+VTQUHnw4yN8gDmKATI+cNGgXBOFbA
         gGx7ojOe9gdexNwEVdkBLdRqctVvEqeYZWNqb0Bn9xwuznY8Jie8adMsyE1cTVkBlRgn
         bebQ==
X-Gm-Message-State: AOAM532jVgzfarq0vSJnjNotHFqz6EwqQkRJcGuIyMA8OnXZsoV8NxD8
        c2SkVLneBLlxNzM0G8tQrTbIhQ==
X-Google-Smtp-Source: ABdhPJyfBMbOsYoH7aDjs9Mk8g6oLf4qy7y3gaIcEmyUhFmSTE2TW5BO/9XzUpKKcJKtzeHVzdad2A==
X-Received: by 2002:a1c:9a02:: with SMTP id c2mr9671717wme.16.1594207038921;
        Wed, 08 Jul 2020 04:17:18 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id f15sm5088720wrx.91.2020.07.08.04.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 04:17:18 -0700 (PDT)
Date:   Wed, 8 Jul 2020 12:17:16 +0100
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
Subject: Re: [PATCH v4 19/20] backlight: make of_find_backlight static
Message-ID: <20200708111716.rsk2ogutkjpku7kc@holly.lan>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-20-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-20-sam@ravnborg.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 03, 2020 at 08:45:45PM +0200, Sam Ravnborg wrote:
> There are no external users of of_find_backlight,
> as they have all changed to use the managed version.
> Make of_find_backlight static to prevent new external users.
> 
> v3:
>   - Move doc for devm_of_find_backlight out of this patch
> 
> v2:
>   - Editorial corrections (Daniel)
>   - Returns => RETURNS (Daniel)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
