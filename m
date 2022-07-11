Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844E45708D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 19:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiGKRaE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 13:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiGKRaD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 13:30:03 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C2525E81
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 10:30:02 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id eq6so7142851edb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H/a1UbjX73QHDgFxXbe9HW11fDUV6n2EgYdg4XVN7V4=;
        b=WZWXJ+sltlTPlPn/bzKiujziHp3Pw0Ib1/YdW52oCRLfs+CfOw7rN0GttGkL8Xuo2t
         NASR2HFpAsXMEaYS7p8e1Q9LoFni0sLiAniavy8jKkR5/Vr2rN/lt8nuT0PobHZMBpM7
         XvK4J/RA2NVwXKuS8IABLHFzBVV5WrxHEY0t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H/a1UbjX73QHDgFxXbe9HW11fDUV6n2EgYdg4XVN7V4=;
        b=S4YzYLqxEuzMYPTsWOhUjqkb2Qt8gfw6I+upAv08vDD9ZSGpprXcjefjQUhP4xRXTz
         X+VGyEjhEBe68pk89mw+q2Xzpd3fmpm3G8MW5LcFA4e8nsX7CD1UKLQciF5cY9emSGx1
         BOs4jz4v3DswIcYIg6YbSEdAOHChFOi3oi7tGw3OZNm5Oeb7rEzNaLepo6OWOhyEh1ls
         nS++aCrIxvB/bK2qGjf7gbHB/1uoKEQ5At0ILWt/O+7FIKVtNCVfBhjc+0gcHAu9VKfJ
         DgU7m/HQUPz0LrKqMfdF9f2t0R548BD2mHVvPNxLkHDarCA16wQLRF9foA/GNT5yeUma
         Jwkw==
X-Gm-Message-State: AJIora8bj978nAI5t6Mzsubi+1GYKYMRz6pNG3K/Of4iNxEbvFYa55/Z
        dtr9ljtEYtyoUBv4+i7NyTSGeXN6KtHylDNhIQY=
X-Google-Smtp-Source: AGRyM1vCzxFd9AUKIN8gh9DYC16wpw/5zf5d7DKId4SqhHOLG49P65n2pYftxk57iCFFqofOPbUAnQ==
X-Received: by 2002:a05:6402:448e:b0:43a:9d20:a4ec with SMTP id er14-20020a056402448e00b0043a9d20a4ecmr26966945edb.269.1657560600904;
        Mon, 11 Jul 2022 10:30:00 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id f1-20020a17090631c100b00722d5b26ecesm2866428ejf.205.2022.07.11.10.30.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 10:30:00 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id p4so3443606wms.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 10:30:00 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8d:b0:3a1:2e4d:1dd2 with SMTP id
 f13-20020a05600c4e8d00b003a12e4d1dd2mr17363425wmq.85.1657560175521; Mon, 11
 Jul 2022 10:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org> <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jul 2022 10:22:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WQv1Tzm_BZO6-RRPPepgAyB-AYRSxTDaj=AirO9ikG1w@mail.gmail.com>
Message-ID: <CAD=FV=WQv1Tzm_BZO6-RRPPepgAyB-AYRSxTDaj=AirO9ikG1w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/2] drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 11, 2022 at 2:21 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Rather than reading the pdata->connector directly, fetch the connector
> using drm_atomic_state. This allows us to make pdata->connector optional
> (and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I tested this on a google,lazor-rev5-sku6 (your code correctly found
bpc as 6) and a google,coachz-rev2-sku0 (your code correctly found bpc
as 8).

As an extra safety net, I also double-checked that the generic
edp-panel would work. I also hacked the first device to use
"edp-panel" as a compatible string, found the panel to be detected,
and found bpc was properly found as 6.

So from a testing perspective this seems good.

Tested-by: Douglas Anderson <dianders@chromium.org>
