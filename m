Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A28225A50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 10:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgGTIsc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 04:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbgGTIsb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 04:48:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA89C0619D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 01:48:31 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f18so24291450wml.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3Mvv6V7aL0bS8bLhb+v9J48PYxr/jDUQbWZDKJ3of4k=;
        b=GPZr4RzzAiGFrXA4Lc2u8SHFw4nz+8LttAOAp071b1HN8JGHbq8hJeNnFyFnZfQNpI
         wfvmIupf6FmdZMHcWDZ0RGgfmR6/UkXw1Ry9fxlPWa55mXeOllJIylslp/fcTX1P5tpX
         X4PGv9AY4r+UTZ4ZUwjPhWtlHUj2YMSTGaYw/KHK8TwLdyFW4hiMT8Iz731WhgUcs+Rb
         yoVZvTLCdpKiKVYTxaGVMCUqMrf8WZjC1zVmAwKexn5OhhWEN+kFygPDdy0g1OcaX5tg
         Tdc2WARpJx4H5rlw2EUN8LdK4kBj/RkauWc0R3XCvaYw6Oo12LBLFN0aPNKxOJUEsnJ7
         RQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3Mvv6V7aL0bS8bLhb+v9J48PYxr/jDUQbWZDKJ3of4k=;
        b=fPu2sT631EAj7I4iSWVko5Vj2prWD8+f4XWBBUSlcI8W92efu4AF3DpVNub5kU/LYW
         EFhEwnXwJleqFLIqlsh+tdCLRbdPo4ZY1RWw8yKUrVCBKOQh4ZEPJl5i83jberMzHHwA
         nKBic9khdrL1CQKIvRzfRBZY3IsB7BQgT3BYkVxupRd44FNoKFfd94Cr2AcOh5klZJdh
         YWuHqgGyPelPn4w4JUt52UHPTOJpMj3Q69mjfaAH2OJX/r78YhOkOWdFI2C9QZ72Mhqj
         vFUKXAKMLRDA16Ibt1PUXlJYIyfHDxowfNIz4doCFAqpEuoM//UzFmMK5VI6OMYp+nyl
         wtdA==
X-Gm-Message-State: AOAM530koMTmidgeJjj0W82o1jh6H6sd4H1kEPqwII73LCmb3O/JrJz+
        7qwTsZHc8PgvxqfGdocg1G+yLA==
X-Google-Smtp-Source: ABdhPJzE0VX+v4xxb0yfbr3uIHhTnBrDiWh9q2HaxcqnvtD/UybPjPxZBEj8tuo6izQM73ENIq/qcA==
X-Received: by 2002:a1c:a74c:: with SMTP id q73mr19955891wme.96.1595234909650;
        Mon, 20 Jul 2020 01:48:29 -0700 (PDT)
Received: from holly.lan (82-132-214-103.dab.02.net. [82.132.214.103])
        by smtp.gmail.com with ESMTPSA id l15sm30561453wro.33.2020.07.20.01.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 01:48:28 -0700 (PDT)
Date:   Mon, 20 Jul 2020 09:48:22 +0100
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
Subject: Re: [PATCH v5 14/19] backlight: cr_bllcd: introduce gpio-backlight
 semantics
Message-ID: <20200720084822.wt5guzetkrgbgdcc@holly.lan>
References: <20200719080743.8560-1-sam@ravnborg.org>
 <20200719080743.8560-15-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200719080743.8560-15-sam@ravnborg.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jul 19, 2020 at 10:07:38AM +0200, Sam Ravnborg wrote:
> cr_bllcd can turn backlight ON or OFF.
> Fix semantitics so they equals what we know from gpio-backlight.
> brightness == 0   => backlight off
> brightness == 1   => backlight on
> 
> Use the backlight_get_brightness() helper to simplify the code.
> 
> v2:
>   - reworked to introduce gpio-backlight semantics (Daniel)

Wasn't this added for v5? However, I spotted this change amoung the
other patches so no worries...


> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
