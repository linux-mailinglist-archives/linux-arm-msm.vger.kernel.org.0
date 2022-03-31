Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2134ED0ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 02:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233372AbiCaAfm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Mar 2022 20:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350744AbiCaAfm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Mar 2022 20:35:42 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0BB847AED
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 17:33:55 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id c10so26376167ejs.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 17:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DYujwTSODoLsl28pxL/Kco6cVNKp164PEtJvRGhch7g=;
        b=LIfdAANbRqTkPOnpxYpODahOeq58jhaQDCbRX0ewZFvKdXZeAW4AkHth/rY399jQeA
         s29OfqcQ4X/oZAuMTJw1TZ+twD9KjvNly58+Betnq8PEp5NRg2YclK4NhtOUXif3D+OG
         B9DpasiswvJSuUWGNYlmZLBqNlkOp2jMpijmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DYujwTSODoLsl28pxL/Kco6cVNKp164PEtJvRGhch7g=;
        b=XSRoujVIMDKeNYVYNHq+zFJxg+biKJ8jC2dBOGBV7EV443ZJxN3OhXTpSPQ43JAy/A
         J0AorEg6suFkgQdMfHVYQw7ROh22CIC4EAVhqEzonMh1qMTMw2bENccEnhalTu82wHcf
         kV/iwEgoB6+DU+o9KDYPBg5IiUK15E5OaIeg76ig0Nun2aMlBfdz1dEWEhsYnIG6+6ST
         XLC/trL57jwvN96Mg92KND55vsOUG/uMk2Uar99pYpKcViHnAW1O2M5b93D9ZI1DTSf9
         yGJCUJwz4du0/rDoypFBH4PmRmO2d2mDVSK+7YoTQvqJwi8W3rx/uTsoWd/dOeNJlU8h
         tCsw==
X-Gm-Message-State: AOAM530loYCIzVdAeFkY7jlY9fDLUS08a/+mdMUm0TOE4Am/wc7l0DvW
        z8Alc0444wTj6AbXUoxXsU8F6Bt38r6gHx6+
X-Google-Smtp-Source: ABdhPJyvhIV2t94dH7k6VCtwzQ87Hnq2IM5h4vkca4aQzzQhxMbhUzj5EI92AH/5zCxMpTykREASoA==
X-Received: by 2002:a17:906:3101:b0:6d6:5b64:906f with SMTP id 1-20020a170906310100b006d65b64906fmr2460346ejx.513.1648686834576;
        Wed, 30 Mar 2022 17:33:54 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id x17-20020a170906297100b006e49a9535f3sm896031ejd.114.2022.03.30.17.33.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 17:33:54 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id p12-20020a05600c430c00b0038cbdf52227so1038133wme.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 17:33:52 -0700 (PDT)
X-Received: by 2002:a05:600c:19ca:b0:38c:b84f:421a with SMTP id
 u10-20020a05600c19ca00b0038cb84f421amr2260341wmq.118.1648686832035; Wed, 30
 Mar 2022 17:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com> <daec6ea4-abb1-05e6-ad49-b0a418a1f43e@linaro.org>
In-Reply-To: <daec6ea4-abb1-05e6-ad49-b0a418a1f43e@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 30 Mar 2022 17:33:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UTYQXngXmA_civiCMDctZr6tJNjNXynQuCwxvgiJijLg@mail.gmail.com>
Message-ID: <CAD=FV=UTYQXngXmA_civiCMDctZr6tJNjNXynQuCwxvgiJijLg@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        quic_aravindh@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 30, 2022 at 4:19 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> > +             bridge->ops =
> > +                     DRM_BRIDGE_OP_DETECT |
> > +                     DRM_BRIDGE_OP_HPD |
> > +                     DRM_BRIDGE_OP_MODES;
>
> I think OP_MODES should be used for eDP, shouldn't it?

No. It's confusing, but basically to get the power sequencing correct
we end up driving the EDID read from the panel driver in the eDP case.

-Doug
