Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1F710EFA4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2019 19:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbfLBS7Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Dec 2019 13:59:24 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35573 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727417AbfLBS7X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Dec 2019 13:59:23 -0500
Received: by mail-ed1-f66.google.com with SMTP id f8so472357edv.2;
        Mon, 02 Dec 2019 10:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X63MMUhi8DWocLcKUjrI//Lp1UTjsR/8D+ptYNBBx6k=;
        b=Ye3NquvkceMDlPIzVT0BDPeCOPvsuFj5W1hQaEsh8XypvNZDyuDS3awc8/7N1Rc1I0
         Wk753JNnHXZzqXKqOSACQu9iU/X/mlKI96IsD4GsuxigZ3gr0BYHJic3o6c7d6L5QjsR
         p/c9zZnrG+ifziQ/GlJ/dOwuy7TYoP61bfa6RlE2XVBXBG5hAxryxnKNGa7UYE1dz6yn
         EKXJHIb0fU7ci+mmop4dhI/ZyuRPVGcdezClVZSS33n27eoTbDi7UxmHOOTOCWD4b09g
         rLuFNFTPd8KoSRD1ABpsN/czyVLQKmtJ1gn/WRQNPqPKeytkWYXDikSAd9TNzQmIgTOE
         756g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X63MMUhi8DWocLcKUjrI//Lp1UTjsR/8D+ptYNBBx6k=;
        b=dDl0NO8+xWzZ8MZcVPFMPODWzoFdP9oPryYbyiT99MmPgWwrCuSe07Vm0MM36xBUVC
         x2LGTIdgG+uvuHzrAbRn7x177mz3jZ/B8NgdaG2fvXIja7CJ52mza6izR72BYgFmswKO
         Zt0mOS9cGa/9JKLUYwCVvBPQIxBg3u1hDppoWD2hjbCZKCF4R6Szfa6x0vveYHnRkRtt
         3AkqI7Gp0kvK+hyWjkQBKD/ma7jQa0t7XQ50UCgtf4Ynj/R0MFgBSfG7Hhc4yCLATb+V
         Ah09kO0iygiX14WQLKsoFOgTLi0kxwRzNe3Kv8lorY2PpuKfwZWA/LJjIYpo2BOAlSNv
         pUew==
X-Gm-Message-State: APjAAAUB8bAhntSTJA7sAU6pV+ByadLWGeHrowlLeHwmVkNdy11vIn8d
        TiFSDB6Wx9m1R9Pe6Txq0oKNvdsED371w+lGFuQ=
X-Google-Smtp-Source: APXvYqygAygqCx471dTqK0h+aHvSASYR1Fgph/UvNh3OSYFykwZqj+H2txbCq99UlrkFARPz20EXlokAvCmfLh8GXVs=
X-Received: by 2002:aa7:d64f:: with SMTP id v15mr394370edr.71.1575313159548;
 Mon, 02 Dec 2019 10:59:19 -0800 (PST)
MIME-Version: 1.0
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org> <0101016ec6df0d33-edb8acfc-a6f1-486e-a8db-38ec498951ed-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ec6df0d33-edb8acfc-a6f1-486e-a8db-38ec498951ed-000000@us-west-2.amazonses.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 2 Dec 2019 10:59:08 -0800
Message-ID: <CAF6AEGtJT+w3RRdc2=y8T0tOnX9E8T7zpQ7Pdy=biCbDGD9=6Q@mail.gmail.com>
Subject: Re: [DPU PATCH v3 3/5] drm/msm/dp: add displayPort driver support
To:     Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>, nganji@codeaurora.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <sboyd@kernel.org>
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

> +
> +void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
> +                                       u32 rate, u32 stream_rate_khz,
> +                                       bool fixed_nvid)
> +{
> +       u32 pixel_m, pixel_n;
> +       u32 mvid, nvid;
> +       u64 mvid_calc;
> +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> +                               struct dp_catalog_private, dp_catalog);
> +
> +       if (fixed_nvid) {
> +               nvid = DP_LINK_CONSTANT_N_VALUE;
> +               DRM_DEBUG_DP("use fixed NVID=0x%x\n", nvid);
> +
> +               /*
> +                * For intermediate results, use 64 bit arithmetic to avoid
> +                * loss of precision.
> +                */
> +               mvid_calc = (u64) stream_rate_khz * nvid;
> +               mvid_calc = div_u64(mvid_calc, rate);
> +
> +               /*
> +                * truncate back to 32 bits as this final divided value will
> +                * always be within the range of a 32 bit unsigned int.
> +                */
> +               mvid = (u32) mvid_calc;
> +               DRM_DEBUG_DP("link rate=%dkbps, stream_rate_khz=%uKhz",
> +                       rate, stream_rate_khz);
> +       } else {
> +               pixel_m = dp_read_cc(catalog, MMSS_DP_PIXEL_M);
> +               pixel_n = dp_read_cc(catalog, MMSS_DP_PIXEL_N);

Can we just calculate m/n from the rate instead.  That gets rid of
having to ioremap() the dispcc region, which is really ugly.

BR,
-R

> +               DRM_DEBUG_DP("pixel_m=0x%x, pixel_n=0x%x\n", pixel_m, pixel_n);
> +
> +               mvid = (pixel_m & 0xFFFF) * 5;
> +               nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xFFFF);
> +
> +               DRM_DEBUG_DP("rate = %d\n", rate);
> +
> +               switch (drm_dp_link_rate_to_bw_code(rate)) {
> +               case DP_LINK_BW_5_4:
> +                       nvid *= 2;
> +                       break;
> +               case DP_LINK_BW_8_1:
> +                       nvid *= 3;
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +
> +       DRM_DEBUG_DP("mvid=0x%x, nvid=0x%x\n", mvid, nvid);
> +       dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
> +       dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
> +}
