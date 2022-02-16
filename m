Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAE04B916D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 20:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234415AbiBPTkT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 14:40:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237105AbiBPTkQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 14:40:16 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 339DB2B048B
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 11:40:03 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id y17so5706671edd.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 11:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sHRPRD8GP9uQyILnjM88nA04r7VU/nm1fNnZS/rsGL4=;
        b=UvST5o77fKwFHFG2pZIsRAincIR8FLK2tfWrGygYfVo3SU+XKj7dzDp5lwkqJZL8TN
         iw3VY4v5foNzrztjCNaUqRZETXQVngX5qFMYWE3jFZp0vmi9R7d37BWQFuhOml2KgPwd
         xhJQhODJakHrsWZelDfUgrLxyRGMJJ9iz5waI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sHRPRD8GP9uQyILnjM88nA04r7VU/nm1fNnZS/rsGL4=;
        b=wB4D0Wt8jG6AsXP/aBD3z1GxpvxrIM8Wc48/e5zWw8q9Rg4wlTmhDZ26VhCoYbYBnN
         CDvxRmLHWz8zxPBryvk3vHbe6gZcVdAL/bBNKHExq4MDtPFXoVdytxGXx9mdhQlxj2op
         FTULOIf4pDW/Zq+DBkuPXdwN6UGd1JRzM0Qteu0cWc8sEfn9HXAWiEG1YveE32oaqCpn
         7EEyHRWNAxwXfNZKBuMtufDV/OqMcHSlWq3nR52POs40kUCbEvxNR1uQg8w+c2np+eRZ
         Umci6HnrqZC3PSbcra1wi3fLNgwzOSwk5C3uipJKtpTei6kK0xYqwQv/Xc/AHDEGLakG
         oRxg==
X-Gm-Message-State: AOAM532DvPjo8/2zGJkp/i/CrwBXFlR/LbprEpIAfwGAQEMYm26OD0j4
        h1YMjduGQ+DozgGkv9lYV52C1XmFf3yAqYnc9H4=
X-Google-Smtp-Source: ABdhPJwQ+bWy0LVz8GT1l9EdMGZyxqzDVKa/bRVuG9k0hvR3/+FgocTfq11Hw+X9QTyBeKIKiNlKYw==
X-Received: by 2002:a05:6402:50c7:b0:40a:276f:cc78 with SMTP id h7-20020a05640250c700b0040a276fcc78mr4620875edb.349.1645040401504;
        Wed, 16 Feb 2022 11:40:01 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id z22sm2313254edd.45.2022.02.16.11.39.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 11:39:59 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id k127-20020a1ca185000000b0037bc4be8713so4513043wme.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 11:39:59 -0800 (PST)
X-Received: by 2002:a7b:c938:0:b0:37b:fdaa:2749 with SMTP id
 h24-20020a7bc938000000b0037bfdaa2749mr3036535wml.88.1645040398608; Wed, 16
 Feb 2022 11:39:58 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-5-git-send-email-quic_sbillaka@quicinc.com> <CAD=FV=V9vXbvuU5oK6maXKAfzEPzT2Fp5Vf3CUqpJvmM+wrjeg@mail.gmail.com>
In-Reply-To: <CAD=FV=V9vXbvuU5oK6maXKAfzEPzT2Fp5Vf3CUqpJvmM+wrjeg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 16 Feb 2022 11:39:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WWjn+CPSes2y1U=9mKZG9gkj5ubBpJOLTJDwhs4gYbeA@mail.gmail.com>
Message-ID: <CAD=FV=WWjn+CPSes2y1U=9mKZG9gkj5ubBpJOLTJDwhs4gYbeA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm/panel-edp: Add eDP sharp panel support
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, quic_kalyant@quicinc.com,
        quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
        quic_mkrishn@quicinc.com, quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Feb 16, 2022 at 11:29 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Feb 10, 2022 at 3:58 AM Sankeerth Billakanti
> <quic_sbillaka@quicinc.com> wrote:
> >
> > Add support for the 14" sharp,lq140m1jw46 eDP panel.
> >
> > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > ---
> > 00 ff ff ff ff ff ff 00 4d 10 23 15 00 00 00 00
> > 35 1e 01 04 a5 1f 11 78 07 de 50 a3 54 4c 99 26
> > 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 5a 87 80 a0 70 38 4d 40 30 20
> > 35 00 35 ae 10 00 00 18 65 38 80 a0 70 38 4d 40
> > 30 20 35 00 35 ae 10 00 00 18 00 00 00 fd 00 30
> > 90 a7 a7 23 01 00 00 00 00 00 00 00 00 00 00 fc
> > 00 4c 51 31 34 30 4d 31 4a 57 34 39 0a 20 00 77
> >
> > ----------------
> >
> > Block 0, Base EDID:
> >   EDID Structure Version & Revision: 1.4
> >   Vendor & Product Identification:
> >     Manufacturer: SHP
> >     Model: 5411
> >     Made in: week 53 of 2020
> >   Basic Display Parameters & Features:
> >     Digital display
> >     Bits per primary color channel: 8
> >     DisplayPort interface
> >     Maximum image size: 31 cm x 17 cm
> >     Gamma: 2.20
> >     Supported color formats: RGB 4:4:4
> >     Default (sRGB) color space is primary color space
> >     First detailed timing includes the native pixel format and preferred refresh rate
> >     Display is continuous frequency
> >   Color Characteristics:
> >     Red  : 0.6396, 0.3291
> >     Green: 0.2998, 0.5996
> >     Blue : 0.1494, 0.0595
> >     White: 0.3125, 0.3281
> >   Established Timings I & II: none
> >   Standard Timings: none
> >   Detailed Timing Descriptors:
> >     DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 MHz (309 mm x 174 mm)
> >                  Hfront   48 Hsync  32 Hback  80 Hpol N
> >                  Vfront    3 Vsync   5 Vback  69 Vpol N
> >     DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 MHz (309 mm x 174 mm)
> >                  Hfront   48 Hsync  32 Hback  80 Hpol N
> >                  Vfront    3 Vsync   5 Vback  69 Vpol N
> >   Display Range Limits:
> >     Monitor ranges (Bare Limits): 48-144 Hz V, 167-167 kHz H, max dotclock 350 MHz
> >     Display Product Name: 'LQ140M1JW49'
> > Checksum: 0x77
> >
> > Changes in v4:
> >   -Add all modes from EDID
> >   -Provide EDID blob
> >
> > Changes in v3:
> >   None
> >
> >  drivers/gpu/drm/panel/panel-edp.c | 44 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
>
> We want to be moving to the generic edp-panel but even if we move to
> edp-panel there's no harm in supporting things the old way, especially
> as people are transitioning.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and pushed to drm-misc-next:

a874aba8bbc5 drm/panel-edp: Add eDP sharp panel support

So v5 shouldn't include this patch.

-Doug
