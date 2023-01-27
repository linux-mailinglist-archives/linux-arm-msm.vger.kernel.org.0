Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8C667DB1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 02:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjA0BNw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 20:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjA0BNv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 20:13:51 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808034ED0B
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 17:13:49 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id kt14so9882929ejc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 17:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CF01fh/f0hITGD+MQzyiKhCXqnGsvJyZ9uRxx+H98MU=;
        b=dvJ1aGnFt1pS3es/e/WqL8ToqRyNvrS6b+rH6MEGmZD2ICAYISfVAHWE3cpKE8+7AW
         rXDdDtrUF5/yOT3M2hz8YMcS3jrmIIqXTZdHjOHsFunoFUw51j2DqWgQxG4apAXVW7Mm
         c7mQEq8JDpOf+Mwf4us1d/to+qbbqh+uzkQzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CF01fh/f0hITGD+MQzyiKhCXqnGsvJyZ9uRxx+H98MU=;
        b=r+J7+BPQ/H4aYDSqA9Q8mrcbccLRVS720HOdWHfC09XsAvBgGkTR+LQM/P86EmcL/b
         j1oM/Mmu2qPI14avyHrjJ1mrhDmjEV1hp+FEOorl6OUgxol3cjjRVTM0/M8pewMUp1uz
         90ll0pgdnKSBjV0QuaiPR9ZDw1no1JdWv9AHfJRLfhpE3ucaUHC/U7IQ2lcOWxkYvvF8
         GCeL4tZL4iPhMzdlP4qcKQIaloOW8sOSPmz8VBcA/oRwd2K7/vJnHEAtB5zcBHs7Dnk8
         Ztb/55VCAF25rpnlCm/lUNJDrWtkl71fpZZS3LG3H8GllRX2o+vsZhhGw32G2JWrA1gt
         sTXg==
X-Gm-Message-State: AFqh2krGi2pFAn9Xfd3GQx4xNQ5LcPCZkCJVdOxCmQCZtkAYAAwvYrrH
        BcjSxED45xbIb7lECoKkWAd+hBGFOOdQrB7JUXo=
X-Google-Smtp-Source: AMrXdXvQPv/YRRsgVuIyUaPwaOI0R17Ews3+N5O3dFmEUsDIDNDO7QbLiJmehBhoQqHz+1mTGFnfZA==
X-Received: by 2002:a17:907:1a46:b0:84c:e89e:bb4c with SMTP id mf6-20020a1709071a4600b0084ce89ebb4cmr30707988ejc.49.1674782027945;
        Thu, 26 Jan 2023 17:13:47 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id f24-20020a056402161800b0049019b48373sm1498721edv.85.2023.01.26.17.13.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 17:13:46 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id y1so3645885wru.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 17:13:45 -0800 (PST)
X-Received: by 2002:a5d:6b51:0:b0:2bf:c5cc:e1d6 with SMTP id
 x17-20020a5d6b51000000b002bfc5cce1d6mr99974wrw.659.1674782025133; Thu, 26 Jan
 2023 17:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20230113155547.RFT.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230113155547.RFT.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
In-Reply-To: <20230113155547.RFT.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 26 Jan 2023 17:13:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U_FhzyZFiJT3hYnURpuM7VvnR_RDBufCcwXu+H2obxgw@mail.gmail.com>
Message-ID: <CAD=FV=U_FhzyZFiJT3hYnURpuM7VvnR_RDBufCcwXu+H2obxgw@mail.gmail.com>
Subject: Re: [RFT PATCH 2/2] drm/msm/dsi: Stop unconditionally powering up DSI
 hosts at modeset
To:     dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Robert Foss <robert.foss@linaro.org>,
        Sean Paul <sean@poorly.run>, Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        David Airlie <airlied@gmail.com>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ye xingchen <ye.xingchen@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jan 13, 2023 at 3:56 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> time"), we moved powering up DSI hosts to modeset time. This wasn't
> because it was an elegant design, but there were no better options.
>
> That commit actually ended up breaking ps8640, and thus was born
> commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time for
> parade-ps8640") as a temporary hack to un-break ps8640 by moving it to
> the old way of doing things. It turns out that ps8640 _really_ doesn't
> like its pre_enable() function to be called after
> dsi_mgr_bridge_power_on(). Specifically (from experimentation, not
> because I have any inside knowledge), it looks like the assertion of
> "RST#" in the ps8640 runtime resume handler seems like it's not
> allowed to happen after dsi_mgr_bridge_power_on()
>
> Recently, Dave Stevenson's series landed allowing bridges some control
> over pre_enable ordering. The meaty commit for our purposes is commit
> 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter
> bridge init order"). As documented by that series, if a bridge doesn't
> set "pre_enable_prev_first" then we should use the old ordering.
>
> Now that we have the commit ("drm/bridge: tc358762: Set
> pre_enable_prev_first") we can go back to the old ordering, which also
> allows us to remove the ps8640 special case.
>
> One last note is that even without reverting commit 7d8e9a90509f
> ("drm/msm/dsi: move DSI host powerup to modeset time"), if you _just_
> revert the ps8640 special case and try it out then it doesn't seem to
> fail anymore. I spent time bisecting / debugging this and it turns out
> to be mostly luck, so we still want this patch to make sure it's
> solid. Specifically the reason it sorta works these days is because
> we implemented wait_hpd_asserted() in ps8640 now, plus the magic of
> "pm_runtime" autosuspend. The fact that we have wait_hpd_asserted()
> implemented means that we actually power the bridge chip up just a wee
> bit earlier and then the bridge happens to stay on because of
> autosuspend and thus ends up powered before dsi_mgr_bridge_power_on().
>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 68 +++++----------------------
>  1 file changed, 11 insertions(+), 57 deletions(-)

Does anyone have any comments on this patch series? It would probably
make sense to wait to land until early in a kernel's release cycle, so
perhaps there is no hurry. That being said, it would still be good to
know what the plan is.

Abhinav: I think you're the one that was most concerned with removing
the special case for ps8640. Does that mean you'd be willing to review
this patch?

For whether or not the "tc358762" panel works with the MSM display
driver after this series, are the correct people on this thread?

Thanks!

-Doug
