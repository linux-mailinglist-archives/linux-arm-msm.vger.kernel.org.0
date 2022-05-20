Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B37952E130
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 02:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234439AbiETA3t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 20:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232460AbiETA3s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 20:29:48 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D853ACEBBF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 17:29:47 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id er5so8841924edb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 17:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+wYJNaePiHcWNH/q3h1ZhNLEV4dJ71MIiiBiHgAmbYA=;
        b=NVM/bktb8CtRk0VgJ75AEtD+l1Etp4dc82+iRcIAsF62UYPJmJUe2sENhNxQGCGQpE
         vCsHBMNUy7vONzvYsBEHm8ej3XihpZ8QIBEoXSsqArdCBjVJF4IByYjx2R35+TnR4FqV
         VDBFu5MpvMXsafQZ0SE+nZWoCjniwY9mA1MNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+wYJNaePiHcWNH/q3h1ZhNLEV4dJ71MIiiBiHgAmbYA=;
        b=QS/kSJpcsPGsPZsxQ82kYz0CPjt5B0ym45mMUA8ITd+bNTJPCmprtdJa5dE5qUDw/y
         nl+QeU0Tlq/kU+nV0H9aQ2g3dDoT8l6wlK40QkQ+csmuk8b8Mk7U15foB2t7Xo4GxPKY
         uVF/lp0Mdt9nSzzYfpzoGi7O5nPhQZiRkXivOsNtkKknszO1wogSmUmadCj6qfpqGVGN
         lsdi/C0t3x/H+RJNJ0Sf2OFPQWgGL8BZ838vA1ZxajJSLK1uvbxJfiAywGkQv0rLGowx
         UCJZrTd/TqmtcXxjjB23r5IzUTIyE4mCs/Nbzt13cNoPJ9mPKtej6l1T1fhtq0sHhCtw
         KFRw==
X-Gm-Message-State: AOAM532fS6BZ1I+qdX/yY0SnfQqjqDF1ccExKGUHvdmVDiKMNfIbKwYK
        Xpl5B6d423JxPb4M2hsD5l2pvjQrzgrX7dpTd8o=
X-Google-Smtp-Source: ABdhPJwh1QvEjfxMA2FYDsvh9PU7gBIWNHf7I2d4Q3wVbptdi4+ZXzPPVlRgLVrCY+LcfTnPK0CR4g==
X-Received: by 2002:a05:6402:3447:b0:42a:a449:ebb with SMTP id l7-20020a056402344700b0042aa4490ebbmr8078469edc.75.1653006586157;
        Thu, 19 May 2022 17:29:46 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id gx5-20020a1709068a4500b006f3ef214de6sm2581437ejc.76.2022.05.19.17.29.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 17:29:45 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id f9so12906576ejc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 17:29:45 -0700 (PDT)
X-Received: by 2002:a5d:5085:0:b0:20d:5f6:63fa with SMTP id
 a5-20020a5d5085000000b0020d05f663famr5861629wrt.679.1653006092752; Thu, 19
 May 2022 17:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220511155749.v3.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
 <20220511155749.v3.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
In-Reply-To: <20220511155749.v3.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 19 May 2022 17:21:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X7cr-=UwV_XbAYovTqeUYXO3LVLTU2bLiwf8wU2kGsLA@mail.gmail.com>
Message-ID: <CAD=FV=X7cr-=UwV_XbAYovTqeUYXO3LVLTU2bLiwf8wU2kGsLA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/probe-helper: For DP, add 640x480 if all other
 modes are bad
To:     dri-devel <dri-devel@lists.freedesktop.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 11, 2022 at 3:58 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> As per Displayport spec section 5.2.1.2 ("Video Timing Format") says
> that all detachable sinks shall support 640x480 @60Hz as a fail safe
> mode.
>
> A DP compliance test expected us to utilize the above fact when all
> modes it presented to the DP source were not achievable. It presented
> only modes that would be achievable with more lanes and/or higher
> speeds than we had available and expected that when we couldn't do
> that then we'd fall back to 640x480 even though it didn't advertise
> this size.
>
> In order to pass the compliance test (and also support any users who
> might fall into a similar situation with their display), we need to
> add 640x480 into the list of modes. However, we don't want to add
> 640x480 all the time. Despite the fact that the DP spec says all sinks
> _shall support_ 640x480, they're not guaranteed to support it
> _well_. Continuing to read the spec you can see that the display is
> not required to really treat 640x480 equal to all the other modes. It
> doesn't need to scale or anything--just display the pixels somehow for
> failsafe purposes. It should also be noted that it's not hard to find
> a display hooked up via DisplayPort that _doesn't_ support 640x480 at
> all. The HP ZR30w screen I'm sitting in front of has a native DP port
> and doesn't work at 640x480. I also plugged in a tiny 800x480 HDMI
> display via a DP to HDMI adapter and that screen definitely doesn't
> support 640x480.
>
> As a compromise solution, let's only add the 640x480 mode if:
> * We're on DP.
> * All other modes have been pruned.
>
> This acknowledges that 640x480 might not be the best mode to use but,
> since sinks are _supposed_ to support it, we will at least fall back
> to it if there's nothing else.
>
> Note that we _don't_ add higher resolution modes like 1024x768 in this
> case. We only add those modes for a failed EDID read where we have no
> idea what's going on. In the case where we've pruned all modes then
> instead we only want 640x480 which is the only defined "Fail Safe"
> resolution.
>
> This patch originated in response to Kuogee Hsieh's patch [1].
>
> [1] https://lore.kernel.org/r/1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>
> Changes in v3:
> - Removed WARN_ON
>
> Changes in v2:
> - Two underscores for __drm_helper_update_and_validate().
> - Return err and use WARN_ON instead of returning a bool.
>
>  drivers/gpu/drm/drm_probe_helper.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)

Pushed to drm-misc-next:

e7c254d75d16 drm/probe-helper: For DP, add 640x480 if all other modes are bad
