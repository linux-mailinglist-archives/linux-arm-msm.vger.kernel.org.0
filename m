Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C14694E792C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Mar 2022 17:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376398AbiCYQrP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 12:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344712AbiCYQrP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 12:47:15 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298A6A76D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 09:45:41 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id h4so2142761edr.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 09:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=94PEXMIFvyyJQFPubb1Xaa+0LbyxHkePHlhp9zj/Z+g=;
        b=SjSMuLWWBMRDZCZAYqkZjt8DVD1lMxcnTQ0pRcoYE6pc5KA03fRjaO+NG5JnARI9G0
         FdIxBtqN2SuWVe3DEw0nVislGa6FeRILBe77MlmD72/jA9e8G3JD5rKHwo6BJ0bvdI0A
         HSMzQ+1ZTMcraGaMFyqLA5koHqo6CEQtOaaRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=94PEXMIFvyyJQFPubb1Xaa+0LbyxHkePHlhp9zj/Z+g=;
        b=m2zrQVwl5xhX9FfQqJZ9rsLfy5k010ZeewzX/3tjy3HIyTWNrfJEfUUFdUXRBDqlck
         5kGLjf5OBjNByCKpBVCzuklhhbNuL+QCd6LvI10ScID0QUQq79wf1l938/VXY1CTuo6Z
         NJqhYnxNS+E+rvtxwtkDuWtLSPS9X+V+U3jJP6KiZ25wvFqOBH3qYt8MrSjSjQPZkOVO
         Qe/KDrY6LWXInvxtDFMI6DXB7TLbkeVeROnBsuePBLF1vGZ6BDX3ZqmbbzRLsK7z5P3u
         rCOKZjXWqp273u4PEQ75iMZ7hixokCyogbzoaD7gzK4ywmsfutgLEvSv9fucZXtmANOc
         oeQQ==
X-Gm-Message-State: AOAM5311nxktrnvLo5ZuEZntne40gZy1PFEgj3tr0AsKDZioVKudDsvD
        JhXePUy7BrCGZADRDoGjYPgegOjPSbxnZLfd3OY=
X-Google-Smtp-Source: ABdhPJzcG9EahM5LBTazyWIv/CxxoZ2eKAjg/AOsD144bFyJBYJisXj4qyTqMcYZE1htJrpcl+ghxA==
X-Received: by 2002:a05:6402:2390:b0:419:4ce2:cb86 with SMTP id j16-20020a056402239000b004194ce2cb86mr14078706eda.310.1648226739163;
        Fri, 25 Mar 2022 09:45:39 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id d23-20020aa7d5d7000000b00418f7b2f1dbsm3068724eds.71.2022.03.25.09.45.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Mar 2022 09:45:38 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id h131-20020a1c2189000000b0038ccb70e239so137503wmh.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 09:45:37 -0700 (PDT)
X-Received: by 2002:a05:600c:3c8a:b0:389:cf43:eaf6 with SMTP id
 bg10-20020a05600c3c8a00b00389cf43eaf6mr10706474wmb.199.1648226737471; Fri, 25
 Mar 2022 09:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-6-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n50dmA0ETgNvaBGs+XmGu+r=6RbfbmnHqXAFqUBGjVGDvg@mail.gmail.com> <MW4PR02MB718688EF42698851322BBF6DE11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB718688EF42698851322BBF6DE11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 25 Mar 2022 09:45:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X7yHoC=7Fj24AjkGwgKvTL6qYfW+yPRstF5j6qt1Lw_Q@mail.gmail.com>
Message-ID: <CAD=FV=X7yHoC=7Fj24AjkGwgKvTL6qYfW+yPRstF5j6qt1Lw_Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] drm/msm/dp: Add eDP support via aux_bus
To:     "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "sean@poorly.run" <sean@poorly.run>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "sam@ravnborg.org" <sam@ravnborg.org>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        quic_vproddut <quic_vproddut@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 25, 2022 at 7:11 AM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> > > @@ -114,10 +114,12 @@ struct drm_bridge *dp_bridge_init(struct
> > msm_dp *dp_display, struct drm_device *
> > >         bridge->funcs = &dp_bridge_ops;
> > >         bridge->type = dp_display->connector_type;
> > >
> > > -       bridge->ops =
> > > -               DRM_BRIDGE_OP_DETECT |
> > > -               DRM_BRIDGE_OP_HPD |
> > > -               DRM_BRIDGE_OP_MODES;
> > > +       if (bridge->type == DRM_MODE_CONNECTOR_DisplayPort) {
> >
> > Why can't eDP have bridge ops that are the same?
> >
>
> eDP needs to be reported as always connected. Whichever bridge is setting these ops flags should provide the ops.
> The farthest bridge from the encoder with the ops flag set should implement the ops.
> drm_bridge_connector_detect  reports always connected for eDP. So, we don't need DRM_BRIDGE_OP_DETECT
> eDP panel bridge will add DRM_BRIDGE_OP_MODES in drm_panel_bridge_add_typed and will call panel_edp_get_modes.
> As we are not supporting HPD for EDP, we are not setting the HPD ops flag.

Right. It's Expected that eDP and DP would have different ops. If we
define "detect" and "HPD" as whether the display is _physically_
connected, not the status of the poorly-named eDP "HPD" pin, then eDP
is _supposed_ to be considered always connected and thus would never
support DETECT / HPD.

...and right that the panel is expected to handle the modes.

This matches how things have been progressing in Laurent's patches
(taken over by Kieran) to add full DP support to sn65dsi86. For
instance:

https://lore.kernel.org/r/20220317131250.1481275-3-kieran.bingham+renesas@ideasonboard.com/
https://lore.kernel.org/r/20220317131250.1481275-4-kieran.bingham+renesas@ideasonboard.com/

-Doug
