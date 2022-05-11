Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E71C523E66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 22:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbiEKUGh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 16:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiEKUGf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 16:06:35 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C25726126
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 13:06:33 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id l18so6182778ejc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 13:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s+VKxsDNd2Dlk25JXEG0/tKdfNG/XmzW8g0WEIYdC88=;
        b=R7vHakTRampr8OzU3rpFsQDFxOiF/ZYOzyU/LbZPRwC2qoIjA41ST8iUnSy/gzro0B
         jTSxW/5/tKOFtoy6GEXCUuG7WzsuuTRO9uiHlsS2zYy6Q3XcNRZo3IY6AxUvfNLsJgll
         Cp/W/Cf1mJWMPRsE9Ldkye6nOnCYHs/+4rGE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s+VKxsDNd2Dlk25JXEG0/tKdfNG/XmzW8g0WEIYdC88=;
        b=b9XLTQduGQO7evU2vTwhVt9jbpOvbKlT+FeDARh1eyf8u4q91Qc5eflKEkd235dG1/
         NGAGHzpBG207pxw1LbqLkYOaFACoD9z/dZrc1Eq4++8GCNweIOBe79d76yEue5/PWqTF
         j33e8UeYZfqSTjSZk2eh6V212oeuD1IGt0fZJmkQyJ6E1/ToMCczSB3ZHCeYwSlabbO7
         qZ0qI4agS7WhxfcJOSoB6bhXggcqI9yZatPwUlB9s1de+h6wdWp7xia4ygAKk04x6yS5
         qZJzvFJfLn3bAoYmzKHFGnwbWzfLzIQzfkDBz7l5BLCteFVOyVJHNv4YVqIjElmhWMS/
         EvoQ==
X-Gm-Message-State: AOAM533yup3kliIACryHiMcAKgm2L1PxFLDep7d1x+B7Cj+N5/N8PmcU
        /RwnUUmLhySuDEAaUKlAUypUNZbluCM3yk4VNR8=
X-Google-Smtp-Source: ABdhPJzazHyMkX2yjQhAR0rj45OR0qzY0EIFsKYlY6p/Nr/zQ1fZCI27PPF1gwEJzRkG62xvtzs6Wg==
X-Received: by 2002:a17:907:9815:b0:6f9:f5c6:ab01 with SMTP id ji21-20020a170907981500b006f9f5c6ab01mr17345835ejc.163.1652299591931;
        Wed, 11 May 2022 13:06:31 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id m6-20020a170906580600b006f3ef214e0asm1310559ejq.112.2022.05.11.13.06.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 13:06:30 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id m62so1824766wme.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 13:06:30 -0700 (PDT)
X-Received: by 2002:a7b:c4c8:0:b0:394:26c5:b79e with SMTP id
 g8-20020a7bc4c8000000b0039426c5b79emr6580581wmk.15.1652299589792; Wed, 11 May
 2022 13:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211207222901.988484-1-dmitry.baryshkov@linaro.org> <20211207222901.988484-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211207222901.988484-2-dmitry.baryshkov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 May 2022 13:06:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7RyVJKis9e3aoouQyhUppyAhVs9oN9=miKeZcV0t6_g@mail.gmail.com>
Message-ID: <CAD=FV=V7RyVJKis9e3aoouQyhUppyAhVs9oN9=miKeZcV0t6_g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dsi: move DSI host powerup to modeset time
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 7, 2021 at 2:29 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The DSI subsystem does not fully fall into the pre-enable/enable system
> of callbacks, since typically DSI device bridge drivers expect to be
> able to communicate with DSI devices at the pre-enable() callback. The
> reason is that for some DSI hosts enabling the video stream would
> prevent other drivers from sending DSI commands. For example see the
> panel-bridge driver, which does drm_panel_prepare() from the
> pre_enable() callback (which would be called before our pre_enable()
> callback, resulting in panel preparation failures as the link is not yet
> ready).
>
> Therewere several attempts to solve this issue, but currently the best
> approach is to power up the DSI link from the mode_set() callback,
> allowing next bridge/panel to use DSI transfers in the pre_enable()
> time. Follow this approach.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 +++++++++++++++++++--------
>  1 file changed, 31 insertions(+), 12 deletions(-)

I happened to be testing today on one of the sc7180-trogdor variants
that has a parade-ps8640 bridge chip in it and ran into problems. A
bisect pointed to this patch and, sure enough, reverting it fixes me
again.

The Chromebook in question is able to power the screen on at bootup
but things don't work so well in other cases. Specifically, if I leave
the Chromebook idle then it will turn the screen off (but in this
case, not enter S3). Hitting a key should wake the screen up, but it
doesn't.

None of the error prints in dsi_mgr_bridge_power_on() are hitting when
it fails and I even added extra error prints. It's not hitting any of
the early returns.

I did a little bit more debugging and it appears that nothing funny is
going on. It's just the ordering difference that matters. With the
patch reverted, I see this and it all works:

boot:
[    9.653801] DOUG: dsi_mgr_bridge_mode_set
[    9.658687] DOUG: ps8640_pre_enable
[    9.664194] DOUG: dsi_mgr_bridge_pre_enable

screen turns off:
[   82.130038] DOUG: dsi_mgr_bridge_post_disable
[   82.166817] DOUG: ps8640_post_disable

screen turns on:
[   92.611846] DOUG: dsi_mgr_bridge_mode_set
[   92.617875] DOUG: ps8640_pre_enable
[   92.920237] DOUG: dsi_mgr_bridge_pre_enable

Without the patch reverted, I see this and it fails:

boot:
[   10.817810] DOUG: dsi_mgr_bridge_mode_set
[   10.822128] DOUG: dsi_mgr_bridge_power_on
[   10.852131] DOUG: ps8640_pre_enable
[   10.857942] DOUG: dsi_mgr_bridge_pre_enable

screen turns off:
[   34.819953] DOUG: dsi_mgr_bridge_post_disable
[   34.883777] DOUG: ps8640_post_disable

screen should turn on, but doesn't:
[   46.193589] DOUG: dsi_mgr_bridge_mode_set
[   46.197951] DOUG: dsi_mgr_bridge_power_on
[   46.248438] DOUG: ps8640_pre_enable
[   46.541700] DOUG: dsi_mgr_bridge_pre_enable

Unfortunately, ps8640 is a pretty big black box. The Linux kernel
driver does almost nothing at all and the parade bridge chip has a
bunch of magic firmware on it. Though I don't know for sure, I assume
that this magic firmware simply can't handle the fact that the MIPI
side is already setup / running when the bridge is powered on.

Rather than this patch, maybe you can jump on Dave Stevenson's patch
series [1] which I believe would solve this problem in a more dynamic
way? Would you accept a revert of ${SUBJECT} patch to fix my problem?

[1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com


-Doug
