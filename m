Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F052D4ECF5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 00:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233659AbiC3WKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Mar 2022 18:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233647AbiC3WKB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Mar 2022 18:10:01 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CAFE028
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 15:08:14 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id hu11so18177134qvb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 15:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SZiNG3ufWqPM1a0cTW4jnJgQNElQaGHtkTjo01VQU4I=;
        b=MrMWiYyQdINQwVp4gorVlwJbY2td0hmgU/oFNQE3AX6ulipZQWM3VZfF1PuxnzXbPQ
         s+7n6N9jfFqt9BMx/HsWKed8i1GMk7OS8V/tnboQJnOIRo98PT4ST5wx/yiA9oXvLcyI
         Iz/InO8LqH7YaQJ3Nn904oMAzpYKJbo+CslovCmLznn7W20dOdKBVyZCkTdns5VthPL2
         KTfl/1hI1DkypIk69BYPxS1340Yln2MMx2RB+1wh31OIIteFprSvjDcpvfVpOU864J8p
         RKc8Lx8DlFNrjnh+WIUi8WDsIOrld2ex9L7MzW2ytRTGHK9f9QwA7gKmh14MzcdNku44
         SmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SZiNG3ufWqPM1a0cTW4jnJgQNElQaGHtkTjo01VQU4I=;
        b=BdNXc5+Xxt9WmaoNVr4IWgrjWjtWKgLt3Gi4ptgGNuvPL+ExPAhBQgsF6o8M0wlbbJ
         bzjdgmfDNc/s3I0/Uj4g3uEM67GHeL899hytXlmOZN6agpVbsn5skp+fAL/gFk2DL+W0
         9626tyYScIzlgctFm38R2IcVI1HsXtr/N5ir8mNtWeX28y9kF4qlm5mRBVem7vTpb7iF
         buP/p2GZliiaYWwDOTCxBMWuPhggGsqSGO/nTOoVxWnp9tQ0XY3a5aGD8NNS8Xt3pcWx
         5VF6o36wAZWQbMvt1yNk355gu997WbdUvCPdvD55W/bWAKHCVKdzoVaLOPOkFdE6bx5i
         qNkw==
X-Gm-Message-State: AOAM530uev0n6LAq2Psko4j8mvFn6vLyuDR4mpl2uUHe5vSMPfPof0Qm
        2gqebdBWhc/+sjLMBjiSIAwv6jRTOpb2ajxvkj03aw==
X-Google-Smtp-Source: ABdhPJxCxZBIWsAez7ZkGk/I9bUyMuxaiqD6go4xQEddYN9/PXcWZpTyR5GqlMGXgxMx7oeLUil/KGE0zAAmBV88l9w=
X-Received: by 2002:ad4:53a4:0:b0:430:1d8c:18ea with SMTP id
 j4-20020ad453a4000000b004301d8c18eamr1255162qvv.115.1648678093929; Wed, 30
 Mar 2022 15:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com> <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 31 Mar 2022 01:08:02 +0300
Message-ID: <CAA8EJprvE31ex3fCQHZ-=x+EWHK4UZ0qqHRh+rH4dk5TPhmVyw@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid differently from dp
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_abhinavk@quicinc.com,
        dianders@chromium.org, quic_khsieh@quicinc.com,
        bjorn.andersson@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, quic_vproddut@quicinc.com,
        quic_aravindh@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 30 Mar 2022 at 19:04, Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The panel-edp driver modes needs to be validated differently from DP
> because the link capabilities are not available for EDP by that time.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>

This should not be necessary after
https://patchwork.freedesktop.org/patch/479261/?series=101682&rev=1.
Could you please check?

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 8bafdd0..f9c7d9a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1003,6 +1003,12 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
>                 return -EINVAL;
>         }
>
> +       if (dp->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +               if (mode_pclk_khz > DP_MAX_PIXEL_CLK_KHZ)
> +                       return MODE_CLOCK_HIGH;
> +               return MODE_OK;
> +       }
> +
>         if ((dp->max_pclk_khz <= 0) ||
>                         (dp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
>                         (mode->clock > dp->max_pclk_khz))
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
