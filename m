Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A53C6694EF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 19:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjBMSMN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 13:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbjBMSMK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 13:12:10 -0500
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F8716326
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 10:12:00 -0800 (PST)
Received: by mail-vk1-xa2a.google.com with SMTP id 9so6664391vkq.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 10:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sb3LshHLxSQgF3w0k9C11QJ/y6qj7sAJ3S8kmCUrATA=;
        b=c2vB7YepOv3IasRmcEsYKNTFXbAREvzH2Jzz9ZqXKc9LKKJN4DwSMLQbFzMk6jRKf7
         wjyW1FMLu6kf+tpkMB4eYPphpxFII5HbWM9MaByn+UIe1U2O+SKvSJp3t7/IPuMpSF6F
         56ECThgLIUwn0lGSUzcCICY6TlEwwarijCqBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sb3LshHLxSQgF3w0k9C11QJ/y6qj7sAJ3S8kmCUrATA=;
        b=uHPL3whNWceojOmsnCkeuQq9p995MepNZiLUygU4R0q8S/2JVDIeGo6SPVmKXBXbuH
         PbId2Fyp+vI+EbON5bgkhcsK7S9nXQVUrwxJnRkcRWoFwS40dP/CEhvyMXbyZ8iwaMcj
         ukSgpZRv1Rt4DKqnNSEpwiLpDEJ+jlDyVyGxgBMxGWExRSWNE6MTJ8dbLa165q7TMQrn
         1q1EJd6UGKQTAPKoTdAaQji9p9B0VAXKkDFcWeFutOID58aZBWttB/DJLYNsHe8nghvy
         L3yS3ic+fdn2R+D0B95mhHPkDgNVFIvYEIUw1dskEo1fpQF8h3sfeL5SaI8y83wAzs41
         RNKQ==
X-Gm-Message-State: AO0yUKVA7nasL5XU5PaVp9lAcseAZARncDzHOLDFyAG4mhG4L9nQk5Hv
        HC5BXo3SBus61yzxMH05YF2LN90MFkub8jDS
X-Google-Smtp-Source: AK7set8iz6to8FZAJC/Qhh0LBEIushpnUeKw9WZ/m0xB5lWRJldv9GjWP3rNyroj42clkxHjy/3Enw==
X-Received: by 2002:ac5:c0c7:0:b0:3f6:b3d5:7c87 with SMTP id b7-20020ac5c0c7000000b003f6b3d57c87mr9512180vkk.6.1676311919327;
        Mon, 13 Feb 2023 10:11:59 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id s185-20020a1fa9c2000000b003ea927899c3sm991638vke.33.2023.02.13.10.11.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 10:11:58 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id p10so13967981vsu.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 10:11:57 -0800 (PST)
X-Received: by 2002:a05:6102:1590:b0:411:c7ae:5b47 with SMTP id
 g16-20020a056102159000b00411c7ae5b47mr2679338vsv.68.1676311917426; Mon, 13
 Feb 2023 10:11:57 -0800 (PST)
MIME-Version: 1.0
References: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Feb 2023 10:11:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WdMtzHryJXxMgYqXkqtFzowqcdvWYOxn4du8mQwYKvcg@mail.gmail.com>
Message-ID: <CAD=FV=WdMtzHryJXxMgYqXkqtFzowqcdvWYOxn4du8mQwYKvcg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Reserve DSPPs based on user request
To:     Kalyan Thota <quic_kalyant@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@chromium.org,
        swboyd@chromium.org, quic_vpolimer@quicinc.com,
        dmitry.baryshkov@linaro.org, quic_abhinavk@quicinc.com,
        marijn.suijten@somainline.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Feb 13, 2023 at 3:11 AM Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> This series will enable color features on sc7280 target which has
> primary panel as eDP
>
> The series removes DSPP allocation based on encoder type and allows
> the DSPP reservation based on user request via CTM.
>
> The series will release/reserve the dpu resources whenever there is
> a CTM enable/disable change so that DSPPs are allocated appropriately.
>
> Kalyan Thota (4):
>   drm/msm/dpu: clear DSPP reservations in rm release
>   drm/msm/dpu: add DSPPs into reservation upon a CTM request
>   drm/msm/dpu: avoid unnecessary check in DPU reservations
>   drm/msm/dpu: manage DPU resources if CTM is requested
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 38 ++++++++++++-----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  2 ++
>  drivers/gpu/drm/msm/msm_atomic.c            | 18 ++++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c               |  2 +-
>  drivers/gpu/drm/msm/msm_drv.h               |  1 +
>  5 files changed, 38 insertions(+), 23 deletions(-)

For whatever reason when I use "b4 shazam" on your series it yells:

Patch failed at 0002 drm/msm/dpu: add DSPPs into reservation upon a CTM request
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: patch failed: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:573
error: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch

...but then I can apply it with `git am --show-current-patch=diff |
patch -p1` and it just applies with fuzz. Presumably Abhniav / Dmitry
can do the same but it would be nice if your patch applied cleanly to
msm-next.

In any case, I tried this patch on both a herobrine (sc7280) and
trogdor (sc7180) based board running msm-next (including the sc7280
patch [1]). In both cases the night light on the internal display
worked fine when using ChromeOS. External night light didn't work on
either of them (as expected) because we don't have the compositor
support yet.

I'm happy enough with:

Tested-by: Douglas Anderson <dianders@chromium.org>


[1] https://lore.kernel.org/r/1674814487-2112-1-git-send-email-quic_kalyant@quicinc.com/
