Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 423CB53C0C9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jun 2022 00:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239647AbiFBWZs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 18:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234670AbiFBWZr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 18:25:47 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D8F22B08
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 15:25:45 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id x5so2927388edi.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 15:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XcPEK0q3mt1ouHTWeNMQyYJ2QS2WLPCsci1x61vNTCo=;
        b=WrJVHTcfJLoL6zkwaUyGcH/jZkhVT5MYScztQxaxeuqyAXvuQ1DqBnZJlHxOSQwPiE
         C9w6a7IuWkfQ8VQm04IOYyfBadLWtG1DrSjYfzagsmIPc/pUTODWRQvJXcuEwtVg/6/P
         k3tfDSbYDhw0Sv1e+nUPKxMFJoo5OxybVavpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XcPEK0q3mt1ouHTWeNMQyYJ2QS2WLPCsci1x61vNTCo=;
        b=uUWjQ0Go1NdPE2rlNNdUkz6ldsrlfrtSBJxGvd8mVgKA2U0QktZu19kSjIXaRlV9uN
         nOMTSd/2iejt1zCjSu3ZjFqLcf+QVcOGFFK6z/ZfV5UcTTQiJoOIQjLV8StcLmL33ML7
         +oiOloh5fd/8RCAgE5Dt4lZB31nnT3uhggJOVQT9B/OfFjMGyqYPSjeiK8X+8qTTerqz
         cYRMinAkfzmik+On25PYvyLXsZoYU2Q2ir2VewSzSFl2/lS526q1/Pyn1qQ4V4LQjWXh
         qyJ+zptQvbA2Pxp5epOhrWliGwRm4X9/VkTJzmMLBwj4HvJ/tlFr4Nt6Tv9FJLxCDtDW
         vROA==
X-Gm-Message-State: AOAM532RDF66orfBTxsWK61v1dreSZjICsPx8glYWeyM/wo5eMc5ZFO5
        kJwYcgmgJ/DGvu3CfSnlKEbk39/M31X5hd5f3f4=
X-Google-Smtp-Source: ABdhPJzRS20Z5XV937N3aO3THV7uwk4Uwxabyzkojd9R9fhuJMoDxthebwEYZS9AbKxgFt//LLg7Fg==
X-Received: by 2002:a05:6402:1e8b:b0:41c:59f6:2c26 with SMTP id f11-20020a0564021e8b00b0041c59f62c26mr7730532edf.156.1654208743890;
        Thu, 02 Jun 2022 15:25:43 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id j12-20020a170906254c00b0070759e37183sm2130756ejb.59.2022.06.02.15.25.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 15:25:43 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id c2so7992911edf.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 15:25:43 -0700 (PDT)
X-Received: by 2002:a5d:68d2:0:b0:210:31cc:64a6 with SMTP id
 p18-20020a5d68d2000000b0021031cc64a6mr5200892wrw.679.1654208301046; Thu, 02
 Jun 2022 15:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
In-Reply-To: <20220510192944.2408515-1-dianders@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Jun 2022 15:18:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XK5KsR51YnSks8sHy+hzfm6xRqUa7mPkCpRO4XDTzYHg@mail.gmail.com>
Message-ID: <CAD=FV=XK5KsR51YnSks8sHy+hzfm6xRqUa7mPkCpRO4XDTzYHg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] drm/dp: Make DP AUX bus usage easier; use it on ps8640
To:     dri-devel <dri-devel@lists.freedesktop.org>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Philip Chen <philipchen@chromium.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Robert Foss <robert.foss@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 10, 2022 at 12:30 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This patch is v3 of the first 2 patches from my RFC series ("drm/dp: Improvements
> for DP AUX channel") [1]. I've broken the series in two so we can make
> progress on the two halves separately.
>
> v2 of this series tries to incorporate all the feedback from v1. Hopefully
> things are less confusing and simpler this time around. The one thing that got
> slightly more confusing is that the done_probing() callback can't return
> -EPROBE_DEFER in most cases so we have to adjust drivers a little more.
>
> v3 takes Dmitry's advice on v2. This now introduces
> devm_drm_bridge_add() (in an extra patch), splits some fixups into
> their own patch, uses a new name for functions, and requires an
> explicit call to done_probing if you have no children.
>
> The idea for this series came up during the review process of
> Sankeerth's series trying to add eDP for Qualcomm SoCs [2].
>
> This _doesn't_ attempt to fix the Analogix driver. If this works out,
> ideally someone can post a patch up to do that.
>
> NOTE: I don't have any ps8640 devices that _don't_ use the aux panel
> underneath them, so I'm relying on code inspection to make sure I
> didn't break those. If someone sees that I did something wrong for
> that case then please yell!
>
> [1] https://lore.kernel.org/r/20220409023628.2104952-1-dianders@chromium.org/
> [2] https://lore.kernel.org/r/1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com/
>
> Changes in v3:
> - Adapt to v3 changes in aux bus.
> - Don't call done_probing() if there are no children; return -ENODEV.
> - Patch ("drm/bridge: Add devm_drm_bridge_add()") new for v3.
> - Patch ("drm/dp: Export symbol / kerneldoc fixes...") split for v3.
> - Split out EXPORT_SYMBOL and kerneldoc fixes to its own patch.
> - Use devm_drm_bridge_add() to simplify.
> - Used Dmitry's proposed name: of_dp_aux_populate_bus()
>
> Changes in v2:
> - Change to assume exactly one device.
> - Have a probe callback instead of an extra sub device.
> - Rewrote atop new method introduced by patch #1.
>
> Douglas Anderson (4):
>   drm/dp: Export symbol / kerneldoc fixes for DP AUX bus
>   drm/dp: Add callbacks to make using DP AUX bus properly easier
>   drm/bridge: Add devm_drm_bridge_add()
>   drm/bridge: parade-ps8640: Handle DP AUX more properly
>
>  drivers/gpu/drm/bridge/parade-ps8640.c   |  74 +++++---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 211 +++++++++++++++--------
>  drivers/gpu/drm/drm_bridge.c             |  23 +++
>  include/drm/display/drm_dp_aux_bus.h     |  34 +++-
>  include/drm/drm_bridge.h                 |   1 +
>  5 files changed, 238 insertions(+), 105 deletions(-)

I'd previously pushed patch #1. Now I've pushed the rest of the
patches to drm-misc-next with Dmitry's review:

10e619f1f31c drm/bridge: parade-ps8640: Handle DP AUX more properly
50e156bd8a9d drm/bridge: Add devm_drm_bridge_add()
3800b1710946 drm/dp: Add callbacks to make using DP AUX bus properly easier

-Doug
