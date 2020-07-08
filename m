Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A162185C2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 13:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbgGHLMi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 07:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728872AbgGHLMh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 07:12:37 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3762FC08E763
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 04:12:37 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f139so2516930wmf.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 04:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KWMYsCIIwxFSG880I4t0GE07CfKjbPZlJ7KIzjiu+UA=;
        b=FlRyf2w3IeuJcSIXaRhEyiB+m1dyETGbjVwWInkoQG8zzP6AIOzw1VvGcKTto7BQId
         i0oztRldanGJbnXrtAhGnGzNA78Qb7acEwIBrg1HxZbDyU+xA0FJWx14yUUgmfe3kAUN
         ozlTiB6YXLFRcfVPJwoXz0Qe4fmlfBY/5hXxMBNDgYOYwuvQ9GGxnT/05LD05pTtRr0B
         MH5glHsvUljRB6XBRqxj8wU3tyURW2JY4ug3/wdTOB6gAo8QR3waseZDSgiFiMf7pGKR
         V2f1HL8APW9sTxoElaVPxGdk34BYPxEDwhO5VHOuEiIjSsE4QDboz+tCRuSmHKtTSPV8
         ePhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KWMYsCIIwxFSG880I4t0GE07CfKjbPZlJ7KIzjiu+UA=;
        b=Ue8Iju3wUHFuhd919tIaWBlGo83U/GIZwdPJ1JbHqpKfvGgt0Qb7fAae50/yezZ8gL
         OVAAj0x6et/UhNNHuzAtAYaPr6Oeh0d24QTRM/DdxOxokmQfBh4R2PEXGGs7XoPRFSNu
         X46DldKPyXe0kKoA27ZlyPM4YFiw5mOCPcuZ1XfJY8mrkX+HckC9yoA+vWzK0cp7d5Gc
         IqlXTNr/pGRcZTR94NQ3Axsh/cUrZxrPS6ECsxkHqnxlryDJER21dYa6+wKCcQOoE5F1
         ELERccjBbBPJCFXFHYPfcjnBZCDYmt3F41rbwY/3p3AJ73U25CsW57avOgJT58XesG3e
         JTWw==
X-Gm-Message-State: AOAM533yjXuiq9NA6/U91z5+iFdsFknRfuoBnBuxR9TEd17274+NTEov
        +ZuQiPONbD/sf/yjvfcvj29vTQ==
X-Google-Smtp-Source: ABdhPJxdNEZSUWxZN120W/Uysct/7lRd/HGK2fWkBPFYCgZ+eyy2mBJwgwJi42FTJzQdl9q4PNhayQ==
X-Received: by 2002:a1c:2982:: with SMTP id p124mr9232454wmp.26.1594206755934;
        Wed, 08 Jul 2020 04:12:35 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id v9sm6410921wri.3.2020.07.08.04.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 04:12:35 -0700 (PDT)
Date:   Wed, 8 Jul 2020 12:12:33 +0100
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
Subject: Re: [PATCH v4 16/20] backlight: jornada720_bl: introduce
 backlight_is_blank()
Message-ID: <20200708111233.ui6r6bvdchj3vboj@holly.lan>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-17-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-17-sam@ravnborg.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 03, 2020 at 08:45:42PM +0200, Sam Ravnborg wrote:
> Use the backlight_is_blank() helper to simplify the code a bit.
> This add support for fb_blank as a side-effect.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

This driver exhibits the "how does userspace know what writing brightness zero to
sysfs actually does" problem so can't use the backlight_get_brightness() helper.

If you respin it would be good to see that in the patch description but
that's such an extreme nitpick It think, either way, this can be:

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
