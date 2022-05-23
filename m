Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9036E53165B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 22:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239105AbiEWRBE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 13:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239049AbiEWRBD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 13:01:03 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ABC3112
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 10:00:58 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id i27so30114335ejd.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 10:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+yqE1pGHx1x3KKc79e6Yq8sNIx1yXpNzstv/8bzqb5s=;
        b=ZjtsMPgQV6WFMaPsFE5wXrme9HyysqJfDxmCwYeAGbvKIHUWff1Cpyv4vRAIzb2+6g
         CaBM3u9mN7ChwiUoZn0x2jmbmh8Ids9Twb+q9Mx4bev++DIoBHEX+JPi/peV3/cHXpnt
         ki/dDbMZHLrt1JuRTfIjOmj46abGOccIRmJ+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+yqE1pGHx1x3KKc79e6Yq8sNIx1yXpNzstv/8bzqb5s=;
        b=gzXWuogFSsxQ/6k/DrgJCgHR9EaHzFomA+/8p1VrXp2i7u+dyLNZGnFXQ7Hmw3hQj3
         llUBtrV96i9vh3+wnX3Ne7aMYciEqSJuQfl58AQbGaEWqK8+fCggRRu0H5XRqF6ojSAn
         UqZ+Da/VYU7FXWZNUJzxWnUJGwubSiYCmNMnykNweinskqXT1dS2uekO6lKYxatqUa3i
         hD8pIvZDQYd9MVfk5K1Zo1OXkk+mxHBXTIXJlTOfuumM33ZnrSwqaFHXeO0ku40Rhp4R
         yjveTPovCEf30NSjRE3LNqcZfmSVbrb7c3PthFaJldywzCWXNX+5iFu0q3J7x4hwjDVX
         iUmQ==
X-Gm-Message-State: AOAM531fqWMttIzVrPzeVKs8BWD07gyskBI/i+T659zVyjKoGkam6pES
        vfSaZ4ydmO6UnffEynNz14jKG5wlwbuN6aRZVhs=
X-Google-Smtp-Source: ABdhPJyUoz7JoGSVC20XyjSebNuLQEggIxIH6zMKhWUiiVx/o/N42Xa7YcpbFEvXbqSiReacoV+bew==
X-Received: by 2002:a17:906:9b92:b0:6fd:e4ce:e416 with SMTP id dd18-20020a1709069b9200b006fde4cee416mr20768186ejc.394.1653325256896;
        Mon, 23 May 2022 10:00:56 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id p3-20020a056402074300b0042617ba63a5sm8446834edy.47.2022.05.23.10.00.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 10:00:54 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id h5so21140065wrb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 10:00:53 -0700 (PDT)
X-Received: by 2002:a05:6000:1c03:b0:20e:5cac:1eb5 with SMTP id
 ba3-20020a0560001c0300b0020e5cac1eb5mr19994642wrb.422.1653325252721; Mon, 23
 May 2022 10:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid> <20220521091751.opeiqbmc5c2okdq6@houat>
In-Reply-To: <20220521091751.opeiqbmc5c2okdq6@houat>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 23 May 2022 10:00:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
Message-ID: <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Philip Chen <philipchen@chromium.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Robert Foss <robert.foss@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, May 21, 2022 at 2:17 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wrote:
> > This adds a devm managed version of drm_bridge_add(). Like other
> > "devm" function listed in drm_bridge.h, this function takes an
> > explicit "dev" to use for the lifetime management. A few notes:
> > * In general we have a "struct device" for bridges that makes a good
> >   candidate for where the lifetime matches exactly what we want.
> > * The "bridge->dev->dev" device appears to be the encoder
> >   device. That's not the right device to use for lifetime management.
> >
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> If we are to introduce more managed helpers, I think it'd be wiser to
> introduce them as DRM-managed, and not device managed.
>
> Otherwise, you'll end up in a weird state when a device has been removed
> but the DRM device is still around.

I'm kinda confused. In this case there is no DRM device for the bridge
and, as per my CL description, "bridge-dev->dev" appears to be the
encoder device. I wasn't personally involved in discussions about it,
but I was under the impression that this was expected / normal. Thus
we can't make this DRM-managed.

-Doug
