Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4A454B914D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 20:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234953AbiBPTiD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 14:38:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiBPTiC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 14:38:02 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 525E7C2E49
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 11:37:49 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id u18so5714215edt.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 11:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AI8joxrk1YyY98A4abN1SonGW2lvV7xnuRU9NFCob50=;
        b=OMOMVpSoOJQ54fMEuRukmDdSLLKh6/vsEUaz/TTeA/q0kDcXGMcglN/JS5LBzCX8Lv
         lmpYnb6FTlqbP97L5MeOKH4seXrJJZvQxfiDHYkIdrjRBTduDl/H35RJX8e4JhKcb22j
         8u0V3hJ4O23K2ze9bvRjq6uL7yKhYRpsOymjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AI8joxrk1YyY98A4abN1SonGW2lvV7xnuRU9NFCob50=;
        b=ILkVgH+KZHXRpI1vgFbRheuxfrwhDE5p4gdCMLx+D+EouxpAFEuIxIXw20S0MXt6/Y
         63BQlu7ZMOVU1yr+fEmff2rgQmhoGOIc97ufD6YpY538AJLR+7IYg+Rfet36/YVWeoRk
         wu6wCHmYoEcANnwGw9RQ9Cb4CFZU2uV//bPzwzQb1OlSq/+IaVd8K6ztNvgvIgLFsgT7
         MkZRMbQtHfyObnuh9zNI9AgtNrEdPNhzL4l44JilRvQlYIBRJM+LA5biNnwqZfSndxMf
         IeBvjUKCvntvXjEsFQX6JgCb93CNAxWMzgL2xQ4Lv7NJzPaf64uIgnDRVhZ4AAkiEqam
         XlVg==
X-Gm-Message-State: AOAM533atFSoVZl71HNYH7IszROKYEYFffcxrSLc0PW6W65k+R/W+d76
        N/kCfkj9xQkU5Hn7PFfedJXpfWSbCtpCAQZXzpc=
X-Google-Smtp-Source: ABdhPJyMw1g1LtftdmpXf14WV1LLwgG+1+RaZvATQICGwaH0Hl50Lhh5KUQl+RqRxAUJdTw87VM78g==
X-Received: by 2002:a05:6402:35c1:b0:412:8359:b8ac with SMTP id z1-20020a05640235c100b004128359b8acmr2899298edc.222.1645040267684;
        Wed, 16 Feb 2022 11:37:47 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id ec52sm2072318edb.92.2022.02.16.11.37.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 11:37:47 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id y6-20020a7bc186000000b0037bdc5a531eso3294768wmi.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 11:37:47 -0800 (PST)
X-Received: by 2002:a05:600c:228e:b0:37c:2eef:7bf with SMTP id
 14-20020a05600c228e00b0037c2eef07bfmr2876839wmf.73.1645039773639; Wed, 16 Feb
 2022 11:29:33 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com> <1644494255-6632-5-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1644494255-6632-5-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 16 Feb 2022 11:29:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V9vXbvuU5oK6maXKAfzEPzT2Fp5Vf3CUqpJvmM+wrjeg@mail.gmail.com>
Message-ID: <CAD=FV=V9vXbvuU5oK6maXKAfzEPzT2Fp5Vf3CUqpJvmM+wrjeg@mail.gmail.com>
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

On Thu, Feb 10, 2022 at 3:58 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Add support for the 14" sharp,lq140m1jw46 eDP panel.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> 00 ff ff ff ff ff ff 00 4d 10 23 15 00 00 00 00
> 35 1e 01 04 a5 1f 11 78 07 de 50 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 5a 87 80 a0 70 38 4d 40 30 20
> 35 00 35 ae 10 00 00 18 65 38 80 a0 70 38 4d 40
> 30 20 35 00 35 ae 10 00 00 18 00 00 00 fd 00 30
> 90 a7 a7 23 01 00 00 00 00 00 00 00 00 00 00 fc
> 00 4c 51 31 34 30 4d 31 4a 57 34 39 0a 20 00 77
>
> ----------------
>
> Block 0, Base EDID:
>   EDID Structure Version & Revision: 1.4
>   Vendor & Product Identification:
>     Manufacturer: SHP
>     Model: 5411
>     Made in: week 53 of 2020
>   Basic Display Parameters & Features:
>     Digital display
>     Bits per primary color channel: 8
>     DisplayPort interface
>     Maximum image size: 31 cm x 17 cm
>     Gamma: 2.20
>     Supported color formats: RGB 4:4:4
>     Default (sRGB) color space is primary color space
>     First detailed timing includes the native pixel format and preferred refresh rate
>     Display is continuous frequency
>   Color Characteristics:
>     Red  : 0.6396, 0.3291
>     Green: 0.2998, 0.5996
>     Blue : 0.1494, 0.0595
>     White: 0.3125, 0.3281
>   Established Timings I & II: none
>   Standard Timings: none
>   Detailed Timing Descriptors:
>     DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 MHz (309 mm x 174 mm)
>                  Hfront   48 Hsync  32 Hback  80 Hpol N
>                  Vfront    3 Vsync   5 Vback  69 Vpol N
>     DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 MHz (309 mm x 174 mm)
>                  Hfront   48 Hsync  32 Hback  80 Hpol N
>                  Vfront    3 Vsync   5 Vback  69 Vpol N
>   Display Range Limits:
>     Monitor ranges (Bare Limits): 48-144 Hz V, 167-167 kHz H, max dotclock 350 MHz
>     Display Product Name: 'LQ140M1JW49'
> Checksum: 0x77
>
> Changes in v4:
>   -Add all modes from EDID
>   -Provide EDID blob
>
> Changes in v3:
>   None
>
>  drivers/gpu/drm/panel/panel-edp.c | 44 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)

We want to be moving to the generic edp-panel but even if we move to
edp-panel there's no harm in supporting things the old way, especially
as people are transitioning.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
