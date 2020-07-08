Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01A52184EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 12:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbgGHK17 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 06:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbgGHK16 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 06:27:58 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E34EC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 03:27:58 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id b6so48303212wrs.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 03:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IjRLQcB/4vsfzip3HVsy3f1EfgWLrW+oCCHpaSHPM5c=;
        b=cYRbqZVHU+UGIQlbnx2Z5rmgwiAPzRJ5N1+U36opxHfpvlIY3E31tyKInXlALdp3QI
         D5TmwUT1LptThFMNF9zSN1OE3DLhWbhGI6tJPoZHf9PjxtfXK20kXBKr8rfLnEzpwhbB
         r4DuMxt0LWDZEE63w9arcO2g80YOsvUOgTLc9Y/VcHf4L5yXVxJtaJKxqW0lNz1/94VS
         X/hYdJvBhOR8nBwM2XD4LF33Q4bOL/g1uwUVK64widIlTYqUUNU/c/f8Qh8ejW7MOcYu
         3Bv1BzW0q3ZwBaJt5Bo//HpZ0UY1i0WQYQb04QiU8P+e0G6FCUFj9t/DhbXbVuOabf82
         fjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IjRLQcB/4vsfzip3HVsy3f1EfgWLrW+oCCHpaSHPM5c=;
        b=UzH6IseINeWthAMNeZgAMxktraf8aTOQod7YhZsljnhZ7EBeUwF077l6H7aTJfLOH1
         EexL/CJkg/hxrlnMjEWg+iPqWfjoDPmtIE3qOZuae9u8UyKivE5SiK9fS8CPOgvIyQVd
         mEk9g+TeHPjIs7qMwsSVsQ12HlS5zOlWff6YLnsa4ORWhPOJXYIA3pF5+ARGeBGWdn7Y
         0wUX/MpToYpAtJ+WFGieo3pgFlUGl/l/PuhfZ+TnkkY0BDa5w+LhpmVqbIGr05jB0MEO
         Ak/bQcp691lOtTN3ItcyS7euvspcgoViQLzOny9Lc5tPcfViaFg9TNqJe71Qt8yTR1uC
         Aijw==
X-Gm-Message-State: AOAM5325HJQddhvWTMipPPNfX4/5/Lh0LhGMj8ijmnQepTC6U2p8voeO
        rtedWc8/kEBPQSxOckLwsiUIeg==
X-Google-Smtp-Source: ABdhPJz8knJVMMHfdPyGODA0TU0pv+HqKuQmmHYQntVTJaq/7zqxDlg0gT38DnQ+pHOidlry7bhcgA==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr59423071wrt.5.1594204077283;
        Wed, 08 Jul 2020 03:27:57 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id a2sm5179262wrn.68.2020.07.08.03.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 03:27:56 -0700 (PDT)
Date:   Wed, 8 Jul 2020 11:27:54 +0100
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
Subject: Re: [PATCH v4 12/20] backlight: introduce backlight_get_brightness()
Message-ID: <20200708102754.x3afazd7kbldjg2n@holly.lan>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-13-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-13-sam@ravnborg.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 03, 2020 at 08:45:38PM +0200, Sam Ravnborg wrote:
> Based on an idea from Emil Velikov <emil.l.velikov@gmail.com>
> add a helper that checks backlight_is_blank() and return 0 as brightness
> if display is blank or the property value if not.
> 
> This allows us to simplify the update_status() implementation
> in most of the backlight drivers.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
