Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E379F426D2A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 17:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242715AbhJHPDg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 11:03:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237929AbhJHPDf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 11:03:35 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B1BC061570
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Oct 2021 08:01:40 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id n7so2207005iod.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Oct 2021 08:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3PHGp/IoliwDCxdoVOVUncmgSF/FJQTnGLZNrPyOlwA=;
        b=mkfXRSkvYk7hX2Lcm22WsVUopafbV3eNIv217yFGxzNv+iQnUQ7cVp5CxLzZEB1j9p
         ufOz/xVXo1fZl0wM0hoQHrdirNX4ui7nUg0xXYhz6krBWkM2WXjul7B4gC3NWBnLGVlD
         JgidE1CmT2OG6Yow/Z/orP7HJWvJwFVdoPGpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3PHGp/IoliwDCxdoVOVUncmgSF/FJQTnGLZNrPyOlwA=;
        b=a8GhdYqfDSfNvFMux8IXKRgPGU4BA/Vmw+EYj4ksX9kDAZ7Y5bL+OqUDfeAtHzuPFO
         J+tqlqUEtxxnTFijMaB5ZcqT1fXVcxnR92pBf/KYioXzQm/eQv0Wmh7ewdSMZB2oiJzk
         6KwDDTfE80WfJasUtTzQkjyB34z44k5h4MP85LhqiCL2T7rRAOuBvNtviKVpGbuNRa8i
         iAfhUiL2sa4nGYWI2XEWC7Xeobbo66TJLw0tyW05vv/5j7aNDXF/IL+sQxY6yV36VVYo
         6w9DqVmpZiSzs6SMipY0SHd4PGATiRAYc3LHaJknd4/SNgkkamxkB/RyOGMbRd3rvtC9
         eiIQ==
X-Gm-Message-State: AOAM530cezH2bTqihtCEZePnqzwjRgBDZ4drJusMURcGaO9mdPn9LSyE
        1bY0ZlfFhMJcBFtVq0qmmADmTvBnzFmwLQ==
X-Google-Smtp-Source: ABdhPJxRJTOffvYmeZDP6WHXoFacoqQg3yEMc7b5HHFos/NPej5zAGijZDPqF7NvcbpqoSfwJvtT2Q==
X-Received: by 2002:a05:6602:240d:: with SMTP id s13mr7808914ioa.94.1633705299697;
        Fri, 08 Oct 2021 08:01:39 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id b83sm1054832iof.5.2021.10.08.08.01.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 08:01:39 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id y197so11030670iof.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Oct 2021 08:01:39 -0700 (PDT)
X-Received: by 2002:a6b:f915:: with SMTP id j21mr7947271iog.98.1633705294174;
 Fri, 08 Oct 2021 08:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-5-bjorn.andersson@linaro.org> <28fbd8f5b2d6bae7bedfc7e81e3fddd9@codeaurora.org>
In-Reply-To: <28fbd8f5b2d6bae7bedfc7e81e3fddd9@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 8 Oct 2021 08:01:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XxXGP+JEmi-rtW+sTS6K1fKAV79GQ61fw34QqNRwMT9Q@mail.gmail.com>
Message-ID: <CAD=FV=XxXGP+JEmi-rtW+sTS6K1fKAV79GQ61fw34QqNRwMT9Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v4 4/7] drm/msm/dp: Allow attaching a drm_panel
To:     Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Oct 5, 2021 at 5:35 PM <abhinavk@codeaurora.org> wrote:
>
> > +     parser->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> > +     if (IS_ERR(parser->panel_bridge)) {
> > +             DRM_ERROR("failed to create panel bridge\n");
> > +             return PTR_ERR(parser->panel_bridge);
> > +     }
>
> When we add a bridge using devm_drm_panel_bridge_add(), it will register
> with default bridge functions which is fine
> because we need the panel power to be controlled here.
>
>
> 140 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
> 141     .attach = panel_bridge_attach,
> 142     .detach = panel_bridge_detach,
> 143     .pre_enable = panel_bridge_pre_enable,
> 144     .enable = panel_bridge_enable,
> 145     .disable = panel_bridge_disable,
> 146     .post_disable = panel_bridge_post_disable,
> 147     .get_modes = panel_bridge_get_modes,
>
> But what about the EDID related things, the DP/eDP driver already reads
> the EDID and gets the modes so we need to skip
> that in this case as otherwise it will end up calling the
> panel_get_modes in the eDP panel which will be redundant.
>
> Let me know if I am missing something in this proposal.

I haven't followed all the discussion of this patch series, but I've
been keenly involved in the EDID problem in ti-sn65dsi86. What we
ended up settling on for the TI bridge chip (ti-sn65dsi86.c) is:

1. If you have a panel, the panel driver is in charge of EDID reading.
This allows the panel to power itself up before it tries to read the
EDID.

2. The EDP controller is in charge of providing the DP AUX bus to the
panel driver.

3. If the EDP controller needs to be powered up for DP AUX bus reads
to happen, it should power itself up in the AUX bus transfer function
and use "autosuspend" to keep from turning off and on constantly.


The above not only solves the EDID problem but also allows the generic
eDP-panel code to work and also allows panels with DP AUX backlight
control to work.


For short term "getting something working", though, you could just
rely on a hardcoded mode in the panel driver for now and forget about
trying to read the EDID case for eDP.


NOTE: At the moment I think if you don't have a panel you should
continue to read the EDID in the DP driver. That could always be
changed in the future, but it was what Laurent was pushing for for
ti-sn65dsi86.c.


-Doug
