Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12FC010ED75
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2019 17:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbfLBQtL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Dec 2019 11:49:11 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37266 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727435AbfLBQtL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Dec 2019 11:49:11 -0500
Received: by mail-ed1-f67.google.com with SMTP id cy15so25221157edb.4;
        Mon, 02 Dec 2019 08:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JCNF6tgwefhUIMTdjVdbK7yFqIKcfTu3pjPnwJ0a8Uo=;
        b=lk0XviqhK/oQnxW7KxSv6xIA7fuGC1wjpikxD+6lZuj6OxvsoblVOz65xae/1GRzSN
         Da8mMBMC9Vi0tO1p4z7dnjGEdNZFqPOr6FgK9U6Z0rdnx+3ZKep4j/ivuWPpDsko8+eh
         ZBAidPmsZAIQA8cuxKIrCueFM4s8IucnbcWIbyCv+rfQEZF0HZ5zZM/FNQU31jqSxI15
         6NvKe5D80gcGPM2KlO4EdMVeXxHqLVRh6tbPx3GVCxU4c9HHsMHw3uk7nkWajshX/7sm
         cm7nB/kZ3S9y1nef7oTSxYlxPCwM2upuxZdGvfzFLpwknBL/zt9BeAnUHmdfGgCriWFN
         9X5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JCNF6tgwefhUIMTdjVdbK7yFqIKcfTu3pjPnwJ0a8Uo=;
        b=GPJ6e0vmGvLqQf87MOAEXDY+/qlx8ZNG9Ev/5Zd2fGiQGrIyycVnAsig9TP8j1m8wq
         d8IVocai14/QzXMlZ/Qf+26wcJPutspd/kgRFyNk180qz70Y8JSV2hEA9O4JdbfjhV5F
         GBkrmNbUIfHlnYzgvkXYsZom8fSHnDuRQn6sXDUDJkMT5DBe5L74TBrcS313MOEtsLIt
         nAEfyCyC0o69zPqflszmcaCYKtPlCiEs7B7fHsGXlo20gOL3ERS0Xa1JdMuhDrMAHirM
         P6zaSnGa5f8/JdxSCVgu0i8W4F0lPwgRRdd1bptK9ie0SHUx6pimCndXJmEJjtOYQTsJ
         Tz3w==
X-Gm-Message-State: APjAAAUuA5p8jGddCz95EfvM0Tgq9ULOPhGkqLghnsw2JCg438S9+zWt
        ULq/tuUSHS/03Pm3uZ+uOd+a+kl5t7HkmGh/ZN8=
X-Google-Smtp-Source: APXvYqwOkds5zFJUwr1u9M8V2LfokAmaX+ozape5Zik4y2kw1WrjcT4qQdtDQd32rn1gW2vmWsf3uHb2NXG6Oy8/oOQ=
X-Received: by 2002:a50:fc85:: with SMTP id f5mr27812882edq.294.1575305349177;
 Mon, 02 Dec 2019 08:49:09 -0800 (PST)
MIME-Version: 1.0
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org> <0101016ec6df0d33-edb8acfc-a6f1-486e-a8db-38ec498951ed-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ec6df0d33-edb8acfc-a6f1-486e-a8db-38ec498951ed-000000@us-west-2.amazonses.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 2 Dec 2019 08:48:58 -0800
Message-ID: <CAF6AEGtHkPSx8xU+CdomDtOqLr-cC2bgfHngWWZzx=8STAsQtA@mail.gmail.com>
Subject: Re: [DPU PATCH v3 3/5] drm/msm/dp: add displayPort driver support
To:     Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>, nganji@codeaurora.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 2, 2019 at 5:48 AM Chandan Uddaraju <chandanu@codeaurora.org> wrote:
>
> Add the needed displayPort files to enable DP driver
> on msm target.
>
> "dp_display" module is the main module that calls into
> other sub-modules. "dp_drm" file represents the interface
> between DRM framework and DP driver.
>
> changes in v2:
> -- Update copyright markings on all relevant files.
> -- Change pr_err() to DRM_ERROR()
> -- Use APIs directly instead of function pointers.
> -- Use drm_display_mode structure to store link parameters in the driver.
> -- Use macros for register definitions instead of hardcoded values.
> -- Replace writel_relaxed/readl_relaxed with writel/readl
>    and remove memory barriers.
> -- Remove unnecessary NULL checks.
> -- Use drm helper functions for dpcd read/write.
> -- Use DRM_DEBUG_DP for debug msgs.
>
> changes in V3:
> -- Removed changes in dpu_io_util.[ch]
> -- Added locking around "is_connected" flag and removed atomic_set()
> -- Removed the argument validation checks in all the static functions
>    except initialization functions and few API calls across msm/dp files
> -- Removed hardcoded values for register reads/writes
> -- Removed vreg related generic structures.
> -- Added return values where ever necessary.
> -- Updated dp_ctrl_on function.
> -- Calling the ctrl specific catalog functions directly instead of
>    function pointers.
> -- Added seperate change that adds standard value in drm_dp_helper file.
> -- Added separate change in this list that is used to initialize
>    displayport in DPU driver.
> -- Added change to use drm_dp_get_adjust_request_voltage() function.
>
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> ---

[snip]

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f96e142..29ac7d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -967,6 +967,9 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>
>         trace_dpu_enc_mode_set(DRMID(drm_enc));
>
> +       if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp)
> +               msm_dp_display_mode_set(priv->dp, drm_enc, mode, adj_mode);
> +

for better or for worse, DSI and HDMI backends create an internal
drm_bridge object to avoid all of these shunts over from the encoder.
We might be still the only driver to do this, but IMHO it is better
than making each encoder know about each backend, so we might as well
stick with that.

(same goes for the other 'if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS)'s)

BR,
-R


>         list_for_each_entry(conn_iter, connector_list, head)
>                 if (conn_iter->encoder == drm_enc)
>                         conn = conn_iter;
