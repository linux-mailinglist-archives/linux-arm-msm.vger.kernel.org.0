Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48BB4501972
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 19:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239725AbiDNREQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 13:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242230AbiDNRDo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 13:03:44 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 002E0A56EF
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 09:40:09 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id c64so7059574edf.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sMT54nF1SMSOMqMYCZmgi8xN7eOCKvvK35fHMg+oHcc=;
        b=HSJ9f0E6ehW76H552h3PgIs14xn6y6HwbJiaJF0oa3iCxtOPhzg/D2glMXnfa5V7zs
         2ydypI+2zeXrr0g9B4UWfLJdZ34Qn5AYYeaah1j314JBM4begDsciAwS3BG0HazrznFc
         uoig8EHfEzKP8qEFJ3HrxOKUff/q+RBzzM2nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sMT54nF1SMSOMqMYCZmgi8xN7eOCKvvK35fHMg+oHcc=;
        b=hRoBIkODrz03siwp6fLqiqo4eeTUYFEtx45kVgY0ccshxVGuicYo9IPKl3TnjEy8jV
         RFWgpgEHlsmBEvOhWPt1JLT921qY7sJ8TpZjaSVMZb2LOuZaXyiwR3Z12mUVPB8IymRo
         gkiD5XxOj0MEqTLQkUg+CTcVq2L4uk6B1MDl97rzwWyEQ8r4GUxYE1OByP8P360DQrjn
         jHDR+Lff2bMgm0Yz9/AlQBrHcDOSm41CWbLN+FDNdNhD6EIT3u9bfMvPS/AXQ+ezAnVP
         9D5/9xYEtQGEdg98Cts5luPBGRaYxE/h7j7F9V77Iv87mvXsIddUrSTBjGc39tQXIbXC
         gjPg==
X-Gm-Message-State: AOAM532GTEOXKuN5Rqm1WiGnulOGdQz/y1VSNB5RQCBRMK7dl/Togz25
        4Pe6r0d7aC4DpdhnH0ei3eYPVF0DxMcGPi8c
X-Google-Smtp-Source: ABdhPJxcoLkDcy/iyKyHEH6ZCINry/vQSxm0530hmLDVznUjzzT4UcO7uMOW6Wp7omp4t/8zuqooww==
X-Received: by 2002:a05:6402:2706:b0:420:d20a:79e5 with SMTP id y6-20020a056402270600b00420d20a79e5mr3849988edd.308.1649954408246;
        Thu, 14 Apr 2022 09:40:08 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id d19-20020a170906c21300b006e7f0730353sm780059ejz.101.2022.04.14.09.40.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 09:40:05 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id e21so7687631wrc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 09:40:05 -0700 (PDT)
X-Received: by 2002:a5d:64ce:0:b0:208:fff6:22cb with SMTP id
 f14-20020a5d64ce000000b00208fff622cbmr2751540wri.301.1649954404806; Thu, 14
 Apr 2022 09:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com> <1649938766-6768-4-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1649938766-6768-4-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Apr 2022 09:39:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wv57p-A=zniSKZYStRSPby7vSE-SqZQ-JVuQsO+MbK+A@mail.gmail.com>
Message-ID: <CAD=FV=Wv57p-A=zniSKZYStRSPby7vSE-SqZQ-JVuQsO+MbK+A@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] drm/msm/dp: wait for hpd high before aux transaction
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

On Thu, Apr 14, 2022 at 5:20 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The source device should ensure the sink is ready before proceeding to
> read the sink capability or perform any aux transactions. The sink
> will indicate its readiness by asserting the HPD line. The controller
> driver needs to wait for the hpd line to be asserted by the sink before
> it performs any aux transactions.
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

It might be worth mentioning "after the cut" that we may eventually
end up changing the rules if people like my proposal [1]. However,
what your code is doing here for eDP is correct as things are
currently intended to work and it would make sense to land it while we
debate about whether we want to add the is_hpd_asserted() callback
like my patch does.

[1] https://lore.kernel.org/r/20220408193536.RFC.3.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid/


> Changes in v7:
>   - add a comment to say why the wait si done for eDP
>   - correct the commit text
>
> Changes in v6:
>   - Wait for hpd high only for eDP
>   - Split into smaller patches
>
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 21 ++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_aux.h     |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  5 files changed, 37 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 6d36f63..cf0739f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -36,6 +36,7 @@ struct dp_aux_private {
>         bool initted;
>         u32 offset;
>         u32 segment;
> +       bool is_edp;

Kinda nitty, but can you put it next to the other booleans? This will
help with structure packing.


>         struct drm_dp_aux dp_aux;
>  };
> @@ -337,6 +338,22 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>                 goto exit;
>         }
>
> +       /*
> +        * For eDP it's important to give a reasonably long wait here for HPD
> +        * to be asserted. This is because the panel driver may have _just_
> +        * turned on the panel and then tried to do an AUX transfer. The panel
> +        * driver has no way of knowing when the panel is ready, so it's up
> +        * to us to wait. For DP we never get into this situation so let's
> +        * avoid ever doing the extra long wait for DP.
> +        */
> +       if (aux->is_edp) {
> +               ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
> +               if (ret) {
> +                       DRM_DEBUG_DP("Panel not ready for aux transactions\n");
> +                       goto exit;
> +               }
> +       }
> +
>         dp_aux_update_offset_and_segment(aux, msg);
>         dp_aux_transfer_helper(aux, msg, true);
>
> @@ -491,7 +508,8 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
>         drm_dp_aux_unregister(dp_aux);
>  }
>
> -struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog)
> +struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
> +                               bool is_edp)

nit: I think indentation rules for this file are that the type of the
argument for the 2nd line should line up right under the 1st. Thus you
should delete one tab character and insert 6 spaces before the "bool".

Similar in other places, like your header file.


Stuff above is all nits and this looks right to me. I'm happy with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
