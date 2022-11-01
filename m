Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F35B961422A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Nov 2022 01:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiKAAOF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 20:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbiKAAN7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 20:13:59 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8531D1056F
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 17:13:58 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id b2so33452587eja.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 17:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NMxz0liguPdCL2/WpnddOh/DIdPoIOoiIe69SUq/QMU=;
        b=gB9U2D3gVAPbsEs2QsqvPxMyMf8x1k/5bQSKqSqALrJcu5gTx/grfkJRhMMNVvdAXz
         94G6YftLtWqzQmvlZgLUxjEdVSuQNgu6aHwYhULB757WL7ZgxoWzFY16FzRVCvWVm5t/
         S1HMcTK9WED5lfZ3UJpi2+zsCR0xlmfCljJ/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMxz0liguPdCL2/WpnddOh/DIdPoIOoiIe69SUq/QMU=;
        b=LqNzLVsl29rIg+v2rPRfl9lygY2JOKVEn/oUSrjOZO8pAYMzSnfX2/DLQM55B3etPb
         qs4nvI1/tGxVPl9Mei4bvcgkJ4L+r/gMSiIMJPauStHGSIg7XSC4R4iGr07grjUjFUwn
         TxQ/U/isa6I9X17EMtVki/fJL5nza8LkLD5LlQBKj7LxeFySSkbrue2CsQ1ZrKNKTDnM
         mg+SB+/JxezVPd6EMHKgkOftXhFCjYOB7orASEvFSg1HPX2BP1HQ2MElpvOmTR23XgvM
         jhf5axPMrUWYbTg6PUTTefzqSsxSPeA13Ttl2dmDh8hmsEKVDDipkN4ZqJeApdpHOTk8
         +UHg==
X-Gm-Message-State: ACrzQf2C09HeqHCrV2cQ7pcc/9cmCARF0z1e5EfoI4AMFS2mez/R9pn1
        8qkgJTJpVFwdxzfk8l2lShCDQP97VKbdJ2+F
X-Google-Smtp-Source: AMsMyM79TuxgpZcoGTqLsqCVQVnYAMO+2HqkvdXHvG5e7aah0EvJOUxCLWe6gI72CmkI4D4NFka/6w==
X-Received: by 2002:a17:907:744:b0:741:36b9:d2cc with SMTP id xc4-20020a170907074400b0074136b9d2ccmr15132756ejb.613.1667261636662;
        Mon, 31 Oct 2022 17:13:56 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id u2-20020a05640207c200b00457c5637578sm3748744edy.63.2022.10.31.17.13.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 17:13:56 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id j15so18158900wrq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 17:13:56 -0700 (PDT)
X-Received: by 2002:a5d:498f:0:b0:236:55e9:6c16 with SMTP id
 r15-20020a5d498f000000b0023655e96c16mr9928075wrq.331.1667261321638; Mon, 31
 Oct 2022 17:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <1667237245-24988-1-git-send-email-quic_khsieh@quicinc.com>
 <94b507e8-5b94-12ae-4c81-95f5d36279d5@linaro.org> <deb60200-5a37-ec77-9515-0c0c89022174@quicinc.com>
In-Reply-To: <deb60200-5a37-ec77-9515-0c0c89022174@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 31 Oct 2022 17:08:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_fs_4JYcRvAwkU9mAafOten9WdyzPfSVWdAU=ZMo8zg@mail.gmail.com>
Message-ID: <CAD=FV=X_fs_4JYcRvAwkU9mAafOten9WdyzPfSVWdAU=ZMo8zg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: remove limitation of link rate at 5.4G to
 support HBR3
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Oct 31, 2022 at 2:11 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Hi Dmitry,
>
>
> Link rate is advertised by sink, but adjusted (reduced the link rate)
> by host during link training.
>
> Therefore should be fine if host did not support HBR3 rate.
>
> It will reduce to lower link rate during link training procedures.
>
> kuogee
>
> On 10/31/2022 11:46 AM, Dmitry Baryshkov wrote:
> > On 31/10/2022 20:27, Kuogee Hsieh wrote:
> >> An HBR3-capable device shall also support TPS4. Since TPS4 feature
> >> had been implemented already, it is not necessary to limit link
> >> rate at HBR2 (5.4G). This patch remove this limitation to support
> >> HBR3 (8.1G) link rate.
> >
> > The DP driver supports several platforms including sdm845 and can
> > support, if I'm not mistaken, platforms up to msm8998/sdm630/660.
> > Could you please confirm that all these SoCs have support for HBR3?
> >
> > With that fact being confirmed:
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> >
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_panel.c | 4 ----
> >>   1 file changed, 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
> >> b/drivers/gpu/drm/msm/dp/dp_panel.c
> >> index 5149ceb..3344f5a 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> >> @@ -78,10 +78,6 @@ static int dp_panel_read_dpcd(struct dp_panel
> >> *dp_panel)
> >>       if (link_info->num_lanes > dp_panel->max_dp_lanes)
> >>           link_info->num_lanes = dp_panel->max_dp_lanes;
> >>   -    /* Limit support upto HBR2 until HBR3 support is added */
> >> -    if (link_info->rate >=
> >> (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
> >> -        link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
> >> -
> >>       drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
> >>       drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
> >>       drm_dbg_dp(panel->drm_dev, "lane_count=%d\n",
> >> link_info->num_lanes);

Stephen might remember better, but I could have sworn that the problem
was that there might be something in the middle that couldn't support
the higher link rate. In other words, I think we have:

SoC <--> TypeC Port Controller <--> Display

The SoC might support HBR3 and the display might support HBR3, but the
TCPC (Type C Port Controller) might not. I think that the TCPC is a
silent/passive component so it can't really let anyone know about its
limitations.

In theory I guess you could rely on link training to just happen to
fail if you drive the link too fast for the TCPC to handle. Does this
actually work reliably?

I think the other option that was discussed in the past was to add
something in the device tree for this. Either you could somehow model
the TCPC in DRM and thus know that a given model of TCPC limits the
link rate or you could hack in a property in the DP controller to
limit it.

-Doug
