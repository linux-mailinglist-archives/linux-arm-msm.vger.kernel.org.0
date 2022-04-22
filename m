Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3BD50B9B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 16:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344023AbiDVOPE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 10:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234200AbiDVOPD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 10:15:03 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D3F5A5AB
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 07:12:10 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id f17so10588066edt.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R+w/lFm+gTC9eW9lBYMMnUgARDTN948ashX6/88jSSk=;
        b=ghMiyWVM5DKXsssoViKphQIWceZP/fjd3ty8ZXt7WVjJwP3cN3O9IT7qFAE/Jj/Qdw
         cR9jYLzNJMz5r3gE7L5BLvMguTvA0g7jVmzMc9rN0pTwKYDEQo4/M8O2xgTv2G8CrHaT
         U2LEsQ4bPR/y/gfgsnT9qyWh/kRicE14xKEec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R+w/lFm+gTC9eW9lBYMMnUgARDTN948ashX6/88jSSk=;
        b=IiVdyxk7Sjt6uw4qbsYHIIARCtQ5vSpcSYbU4f6qY+r7W7DYNkeHPX97nE6OZc3WvN
         Yd+w0FLMEaIdlloEZeqqjbXMMJezvQWp58UnSu4QmB5yoa+gj3rU3OIdL/hlS86FdqA+
         zAhOCOM7J9UX9CG2ZWJRABdczW3/LorjiZimPzcKarZCzbigorMB5vUTC8d3Sfbo6BSC
         jfxqXWRL4OGCEnKpU4jnMHon3E6okcosqm/gVMJe7fR3cLbFYekVwjg2NqQ6fBpJfuRx
         H0mGYukdLUJR6BCmGBcjb/1nF/rvKQiXvVRDiEZKCO2O+cLg87kZrGhMZvO04aFuJWN6
         PZDA==
X-Gm-Message-State: AOAM531EiYedHykL92NytY2ixQzVPA6baHei9/ZtHwOGLjIN+xaWSMol
        KwepOOHNieBNlWcc3F2Tq1V3qS0XPYMcFejkTjw=
X-Google-Smtp-Source: ABdhPJy/KIsuvONf/YVnuc2y6PHs0QRNUA7Q0LoIJHn/NCiPfHMee+ARqTNIjwHZtJa5rUJyLwifYg==
X-Received: by 2002:a05:6402:5191:b0:423:fa7f:f4c2 with SMTP id q17-20020a056402519100b00423fa7ff4c2mr5145434edd.9.1650636728678;
        Fri, 22 Apr 2022 07:12:08 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id q2-20020a056402032200b00423d4516387sm934053edw.75.2022.04.22.07.12.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 07:12:08 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id ay11-20020a05600c1e0b00b0038eb92fa965so8049278wmb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 07:12:08 -0700 (PDT)
X-Received: by 2002:a05:600c:502b:b0:38f:f7c6:3609 with SMTP id
 n43-20020a05600c502b00b0038ff7c63609mr4367415wmr.15.1650636228521; Fri, 22
 Apr 2022 07:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com> <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 22 Apr 2022 07:03:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XhznD3Nuiku9mS5YKFVX0GB8qxQZe8m8AgGCQz=a2chQ@mail.gmail.com>
Message-ID: <CAD=FV=XhznD3Nuiku9mS5YKFVX0GB8qxQZe8m8AgGCQz=a2chQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 22, 2022 at 2:11 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The panel-edp enables the eDP panel power during probe, get_modes
> and pre-enable. The eDP connect and disconnect interrupts for the eDP/DP
> controller are directly dependent on panel power. As eDP display can be
> assumed as always connected, the controller driver can skip the eDP
> connect and disconnect interrupts. Any disruption in the link status
> will be indicated via the IRQ_HPD interrupts.
>
> So, the eDP controller driver can just enable the IRQ_HPD and replug
> interrupts. The DP controller driver still needs to enable all the
> interrupts.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> Changes in v9:
>   - add comment explaining the interrupt status register
>
> Changes in v8:
>   - add comment explaining the interrupt status return
>
> Changes in v7:
>   - reordered the patch in the series
>   - modified the return statement for isr
>   - connector check modified to just check for eDP
>
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 16 ++++++++++------
>  drivers/gpu/drm/msm/dp/dp_display.c | 22 +++++++++++++++++++++-
>  2 files changed, 31 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
