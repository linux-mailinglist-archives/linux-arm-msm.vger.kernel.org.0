Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 603BD4B94B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 00:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234911AbiBPXrA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 18:47:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbiBPXq7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 18:46:59 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FAEDE94
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 15:46:45 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id j8-20020a056830014800b005ad00ef6d5dso1582523otp.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 15:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Kwpt2sUL3NJ3srh/WboVkkXpszIC4Q/LDD+d6HlrRIY=;
        b=AUTTrQBHC7mixxUEkiAyUTrlGDju362Lne/nNGvQKLuIbcK//xaWuktOnM1G7jEe0r
         fZflm5jVwEUnMm07DDH+FGTzbyAGA3lnCdUkx3Bve7SskIoGdOV5qqbZAjFrm0xrJWZG
         ScOC3Qo1++xQahNQgIO3enbM/sharIUzhMepw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Kwpt2sUL3NJ3srh/WboVkkXpszIC4Q/LDD+d6HlrRIY=;
        b=kq64Lrh55GwbUO9z7fVgVmeuGyX/FhnE789JnsJnssY4mppIFqAXEcSYC07UB7KQRY
         Lcmm4W5MirwggdXAOvJmySoMB7CEmnf4BdFEM4SJ6AZpwzH2ir0ihkfsquUUsGduQ3sm
         MnFxqx4as5K+r0qrJAi2NOWu3ldKKaJIuJV2L+sJGc1/frgFdWEvKdLiYKKjnHsOA3b3
         v16aBtxrlnGXTXa06yklO1rUs5WZYX3R74Qw+M/jKHfF5AIj2jEhkksElbyrBl111ePJ
         1O994t3UwVqcYUb3SWxuzgMNUWD6Sxd1ZKw4AAMQienIttVLaqe78L6PjYHwwLrJi/vS
         8hdw==
X-Gm-Message-State: AOAM531gdydL+PAyMHDTFHhpuJI1YONt/wHqw7nOVA23v6vl3YA9K+ZX
        kU77iR12b+cK8M/tjIChWV5IehlkQBcHpxFH6JCDNw==
X-Google-Smtp-Source: ABdhPJzvDBotbDuvYSRUTv7F8cbOMwR37rDKbNepWqplPiPt+4QJBmOCl44hw7yykOd5pe0TK555IzBledo4gwXDL1M=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr114110otl.77.1645055204515; Wed, 16 Feb
 2022 15:46:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Feb 2022 15:46:44 -0800
MIME-Version: 1.0
In-Reply-To: <1643828199-8564-4-git-send-email-quic_khsieh@quicinc.com>
References: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com> <1643828199-8564-4-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 16 Feb 2022 15:46:44 -0800
Message-ID: <CAE-0n534MH7ih4nKbjY5EewcZ0J73Zp_A=Q-CJ0M_z3nWoVaVQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/msm/dp: replace DRM_DEBUG_DP marco with drm_dbg_dp
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

Quoting Kuogee Hsieh (2022-02-02 10:56:39)

Please add some commit text

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  49 +++++++++++------
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  34 +++++++-----
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 106 +++++++++++++++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_display.c |  68 +++++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_drm.c     |   4 +-
>  drivers/gpu/drm/msm/dp/dp_link.c    |  99 +++++++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  43 +++++++++------
>  drivers/gpu/drm/msm/dp/dp_parser.c  |   2 +-
>  drivers/gpu/drm/msm/dp/dp_power.c   |  20 ++++---
>  9 files changed, 246 insertions(+), 179 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index d7e4a39..4fbbe0a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -136,7 +136,8 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
>         parity_byte = dp_audio_calculate_parity(new_value);
>         value |= ((new_value << HEADER_BYTE_1_BIT)
>                         | (parity_byte << PARITY_BYTE_1_BIT));
> -       DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> +       drm_dbg_dp((struct drm_device *)NULL,

Why can't we pass the platform device pointer? Surely the cast is not
necessary and in fact harmful.
