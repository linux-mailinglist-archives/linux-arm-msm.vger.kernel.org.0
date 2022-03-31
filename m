Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8D4C4EE4A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Apr 2022 01:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242992AbiCaXY3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Mar 2022 19:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242990AbiCaXY2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Mar 2022 19:24:28 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B3B24D994
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 16:22:40 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id yy13so2431867ejb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 16:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=avSGMtSz4ymacyl7GdMhd9/3YRX9NuWMZI8WC7CMKV0=;
        b=RB7qN+1nHYmA5Ki3RYQ5cOwMq+8+ec2V05lMPrIjOE0+2UCFYYM2uKN8wEUMfprHJd
         ber657p1Z3CwyukZldarn6sF9qZcZhzTh9Y/Nr6kgjdUGxUXyW3xmTRVYJOBuVfSKLTL
         qWjEu993x0lx2WpR1RPuyTpar5XfsrMV/EV58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=avSGMtSz4ymacyl7GdMhd9/3YRX9NuWMZI8WC7CMKV0=;
        b=Us2IyaswAICY4fu/OF87kYNTFgR03fPwoczYhGQKU6ZLC4hvMnqfql95LXZaP5vxPL
         G2KtUDLsykEVD3v8MwWuJRWYMuFXaKJcGgn0/dBzF9BaVKRaJz1gk69CgfF025XxS8Uz
         OhVJWhmHQWTQL3k1h4Qr9CQ8LJvjPenab5r6Vl2yhzrCJwMuZt0gI9a4sVxwgvNWhaEh
         OlaUok2TZiyO9zuYDxYFahmtQzIZGEpIiQtx+JxbUTuHrCZ/qBYyjKvutQQRii0VXvBJ
         wkWKAXiDoP+qmrlo/hyfIpqLyko4kPyMDUmjRJ0+E6bpO+t5MTOPNe6NBieLYpbDz/aB
         SfOQ==
X-Gm-Message-State: AOAM533l9gGpWXatsUSHQiQUpw9Q+XZXn3COf0apa7FyqnyxYhI+pdR9
        FE6rJVM46DzxJDbMOIcovm9ZGw8ySrpbUuAA
X-Google-Smtp-Source: ABdhPJxU2BRJk3HHbor56lbY+uXpJ93BFK7OpjT+Tu/5APsm4dvbeJ1ObbL1v/ml9NEN1boU0NG0Jw==
X-Received: by 2002:a17:906:99c5:b0:6df:8215:4ccd with SMTP id s5-20020a17090699c500b006df82154ccdmr6977596ejn.684.1648768958553;
        Thu, 31 Mar 2022 16:22:38 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id da19-20020a056402177300b00413583e0996sm371297edb.14.2022.03.31.16.22.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 16:22:37 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id l62-20020a1c2541000000b0038e4570af2fso497221wml.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 16:22:37 -0700 (PDT)
X-Received: by 2002:a05:600c:2e02:b0:38c:8390:d8ca with SMTP id
 o2-20020a05600c2e0200b0038c8390d8camr6452311wmf.15.1648768957118; Thu, 31 Mar
 2022 16:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com> <1648656179-10347-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-3-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 31 Mar 2022 16:22:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UtnNTWmMPYPkSJ5qceWspXtZ+hL6UTgSn=rHzd39Y42g@mail.gmail.com>
Message-ID: <CAD=FV=UtnNTWmMPYPkSJ5qceWspXtZ+hL6UTgSn=rHzd39Y42g@mail.gmail.com>
Subject: Re: [PATCH v6 2/8] drm/msm/dp: wait for hpd high before aux transaction
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
        quic_aravindh@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 30, 2022 at 9:03 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The source device should ensure the sink is ready before proceeding to
> read the sink capability or performing any aux transactions. The sink

s/performing/perform

> will indicate its readiness by asserting the HPD line. The controller
> driver needs to wait for the hpd line to be asserted by the sink before
> performing any aux transactions.
>
> The eDP sink is assumed to be always connected. It needs power from the
> source and its HPD line will be asserted only after the panel is powered
> on. The panel power will be enabled from the panel-edp driver and only
> after that, the hpd line will be asserted.
>
> Whereas for DP, the sink can be hotplugged and unplugged anytime. The hpd
> line gets asserted to indicate the sink is connected and ready. Hence
> there is no need to wait for the hpd line to be asserted for a DP sink.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>
> Changes in v6:
>   - Wait for hpd high only for eDP
>   - Split into smaller patches
>
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 13 ++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_aux.h     |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>  5 files changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 6d36f63..a217c80 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -36,6 +36,7 @@ struct dp_aux_private {
>         bool initted;
>         u32 offset;
>         u32 segment;
> +       bool is_edp;
>
>         struct drm_dp_aux dp_aux;
>  };
> @@ -337,6 +338,14 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>                 goto exit;
>         }
>
> +       if (aux->is_edp) {

Adding a comment about _why_ you're doing this just for eDP would
probably be a good idea. Like maybe:

/*
 * For eDP it's important to give a reasonably long wait here for HPD
 * to be asserted. This is because the panel driver may have _just_
 * turned on the panel and then tried to do an AUX transfer. The panel
 * driver has no way of knowing when the panel is ready, so it's up
 * to us to wait. For DP we never get into this situation so let's
 * avoid ever doing the extra long wait for DP.
 */


> @@ -491,7 +500,8 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
>         drm_dp_aux_unregister(dp_aux);
>  }
>
> -struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog)
> +struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
> +                               bool is_edp)

nit: I think your indentation of the 2nd line isn't quite right.


> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
> index 82afc8d..c99aeec 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> @@ -16,7 +16,8 @@ void dp_aux_init(struct drm_dp_aux *dp_aux);
>  void dp_aux_deinit(struct drm_dp_aux *dp_aux);
>  void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
>
> -struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog);
> +struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
> +                               bool is_edp);

nit: I think your indentation of the 2nd line isn't quite right.


Things are pretty much nits, so FWIW:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
