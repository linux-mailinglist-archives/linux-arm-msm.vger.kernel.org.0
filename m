Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A2F3A3C9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 09:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhFKHKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 03:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbhFKHKL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 03:10:11 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D003C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jun 2021 00:07:57 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id z22so8261607ljh.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jun 2021 00:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PxFpUiTBSOnltlTTuoxtE/MZoSbFjI/MZKxUVQgI8q8=;
        b=ZYjT8dDPO05s4Nxd0AQ8STha22n4BnZxWmH2oTD39tbjqjVmK9jaa59HgGtvtx5Xlx
         5A7R9NJgwOVRZfdBStumOB+V94O+S3A5+3grjEPKwKvfCmz8ewwVht8m1wNcETwSW/EE
         UftYmQneWlIOfFdvOmbP4xmNCBHaJXeYbowMINh5elwBKSyjF9T+ahWBHjFSeyMBi8+E
         QyNZDc6j35P9lqWxJm3U3uzCIZozJGZ/cfIWm3o33wVZifwgn5nJt8MJJBAyMftjuUhv
         IEXh1/UetcTm0YviYPJdXQMQuFopSaLSFQmmyBvmWwIB+RIDGh9H6fPyFKQhxmR4qVpQ
         SV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PxFpUiTBSOnltlTTuoxtE/MZoSbFjI/MZKxUVQgI8q8=;
        b=EAC/iRPOifDsv9CJBfBQdVhebe0VCCqNIDDPv3UTmm0WlV043kc3pzTwZxGc0JpSnB
         wpk/6RVEfUYaiDx/8LiEC3nown4STzjC/zUSBBwMYFOPWJQN2p8ctS/m2ahWOv5BpO94
         hvX+AIGJeinkl+92QediXNd/cluDxDs32SggVuaHQB3zngegp8u6Wld/ddJ7VnvBgBE0
         BoQGQmhQC+pVt7Fi6HlDjzsGjtTpHbukXDIYsfttcNCQEHKKdsYLbRfCW37Xrq2ylTqV
         PB6XNAvypkIKjah0RRuR0Y4GzmqkH+TlAtLnZi51cxg30mvqDX9rHlr0hgpyhsES2RDi
         5vuw==
X-Gm-Message-State: AOAM533+PauoP5M4f3KdtwXNfVZaOkcFCIHzUK1CbTxf+q1rO/TeBxUw
        g2TQToHhSeJAeN2KnkDKSWXyZ/sZWbyz7dzZ7oqnaw==
X-Google-Smtp-Source: ABdhPJxFdVSnUksX286DvG4PTdewZfKAGkEQVnOslur2gbzC6wjjtNh1/CxiWSBsTLkGewkmusNA+12IaT8xHtxGgXk=
X-Received: by 2002:a2e:a605:: with SMTP id v5mr1871284ljp.128.1623395273072;
 Fri, 11 Jun 2021 00:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org> <20210331105735.3690009-23-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210331105735.3690009-23-dmitry.baryshkov@linaro.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 11 Jun 2021 00:07:41 -0700
Message-ID: <CALAqxLVwpLOsvjBVi+xb5S2VQNuGKgeOzrSqwZe5FN6RSeEEWA@mail.gmail.com>
Subject: Re: [PATCH v4 22/24] drm/msm/dsi: remove temp data from global pll structure
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org,
        Peter Collingbourne <pcc@google.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 31, 2021 at 3:58 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The 7nm, 10nm and 14nm drivers would store interim data used during
> VCO/PLL rate setting in the global dsi_pll_Nnm structure. Move this data
> structures to the onstack storage. While we are at it, drop
> unused/static 'config' data, unused config fields, etc.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor

Hey Dmitry,
  Just wanted to give you a heads up.  Peter Collingbourne reported
today that his db845c wasn't booting to display for him on his 4k
monitor. It works fine on a 1080p screen, and while 4k isn't supported
(yet?),  normally the board should fall back to 1080p when connected
to a 4k monitor.  I was able to reproduce this myself and I see the
errors below[1].

I dug back and found that things were working ok on v5.12 w/ the
recently merged commit d1a97648ae028 ("drm/bridge: lt9611: Fix
handling of 4k panels"), and started digging around.

Seeing a bunch of changes to the
drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c file, I tried reverting a
chunk of the changes since 5.12 to that, and that got it working
again. I've narrowed it down to this change -
001d8dc33875 ("drm/msm/dsi: remove temp data from global pll
structure") upstream (also reverting following 6e2ad9c3bfca and
36c5dde5fdf0 first - but its reverting this change that actually makes
it work again).

I've not managed to really look into the change to see what might be
going wrong yet (its late and I'm about to crash), but I wanted to
give you a heads up. If you have any ideas for me to try I'm happy to
give them a go.

thanks
-john

[1]:
[   19.846857] msm_dsi_phy ae94400.dsi-phy:
[drm:dsi_pll_10nm_vco_prepare] *ERROR* DSI PLL(0) lock failed,
status=0x00000000
[   19.857925] msm_dsi_phy ae94400.dsi-phy:
[drm:dsi_pll_10nm_vco_prepare] *ERROR* PLL(0) lock failed
[   19.866978] dsi_link_clk_enable_6g: Failed to enable dsi byte clk
[   19.873124] msm_dsi_host_power_on: failed to enable link clocks. ret=-110
[   19.879987] dsi_mgr_bridge_pre_enable: power on host 0 failed, -110
[   19.886309] Turning OFF PHY while PLL is on
[   20.415019] lt9611 10-003b: video check: hactive_a=0, hactive_b=0,
vactive=0, v_total=0, h_total_sysclk=0
[   20.481062] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
[dpu error]vblank timeout
[   20.489306] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
for commit done returned -110
[   20.513031] [drm:dpu_encoder_frame_done_timeout:2161] [dpu
error]enc31 frame done timeout
[   20.553059] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
[dpu error]vblank timeout
[   20.561300] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
for commit done returned -110
[   20.625054] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
[dpu error]vblank timeout
[   20.633299] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
for commit done returned -110
[   20.657033] [drm:dpu_encoder_frame_done_timeout:2161] [dpu
error]enc31 frame done timeout
[   20.697065] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
[dpu error]vblank timeout
[   20.705316] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
for commit done returned -110
[   20.769066] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
[dpu error]vblank timeout
[   20.777330] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
for commit done returned -110
[   20.801035] [drm:dpu_encoder_frame_done_timeout:2161] [dpu
error]enc31 frame done timeout
[   20.845049] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
[dpu error]vblank timeout
...
