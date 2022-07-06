Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E961569062
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 19:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbiGFRNE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 13:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbiGFRND (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 13:13:03 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49C3286F9
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 10:13:02 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id b24so11534613qkn.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 10:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k571fgeaK+k/31zy+4bBBONuf43p2TWINbGcjpkfNDc=;
        b=gX42jT2AYWNC7cGaOXGMeyQVMtNb6kCasYmmMrL9KFkEIIs2xt5sy2zzchC93vpHTz
         v59M7rdb5HcbOUm/cw6snNW3veLXa9nQ/4OOt25hR9nNGpne0qAyUW8245N7bqaVYfj2
         PssWLrzqWO/ag27nGs2Z0NxMqd7e/UBKiOUmhGkOGZ1vrMLZsmAMIOuACTwc9wOlpuYV
         XP8x0iru35oYUAPSM4qWwDPuYkF0Eeb1acBHz9B33aS8XmHty+Z8hUnQazIdlE9hJLe+
         PQ3ldCY0JGmq3J05OVVxEpsF5Cfqdqdbw1q1BkD3VIyTtrL3YBw/iOcwS5dQ1rULVFkL
         tU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k571fgeaK+k/31zy+4bBBONuf43p2TWINbGcjpkfNDc=;
        b=BtLqJORuSEiD0oF0xATYn92MYoQ2mY+RHGYc0c7KneZvwtSadWEMf6F3cUiTrKnR/0
         U+B//fEEDjJGg9wDAQku000mwmE8xOkWdN3zCqiWBIgutxnRW671MdqtTypy4xoUKncY
         r3tlDBXJN6eoyAfKUCkbjDNzjHnK6X8gC89Xuiv5dgfHgTeQC+1yeJmhTgpePpbXAyPZ
         3f1oeVxF2XUDEqMxnPvSv3lbdOH4oXvO2c1gTfbHChhrgvj8RuqX+V4IGeOMdYgRNqFl
         Al5FFk/xf6/zSOK7y0d2AiOBEX12OMEfKagp+TZL/5OE5d1qai5r2PikN0u9TMn04u6l
         P8BQ==
X-Gm-Message-State: AJIora8F7cN5YCSzkA10yYO8qOKO7URA7mcjibfNwYlC0H/1NyDC/9Va
        4pUQadMQJUxdMeg2Enj+b3hh9pQeaAG/6gcSD50Vpw==
X-Google-Smtp-Source: AGRyM1u3X21Jwan4j95LttRmYI0ORhnnl1BSnKPKeE019vkiDLJpcdFvlA+szPY66CexrkV0lPm7pe6AVsuV3Mi3Ens=
X-Received: by 2002:ae9:ed56:0:b0:6ae:f7cf:7f5c with SMTP id
 c83-20020ae9ed56000000b006aef7cf7f5cmr27970088qkg.59.1657127581718; Wed, 06
 Jul 2022 10:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <1657123936-2459-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1657123936-2459-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Jul 2022 20:12:50 +0300
Message-ID: <CAA8EJpr_u4PEOFE22EkAvDbvECzaY89oGHA+fjvrbZCYYYNK4A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: make eDP panel as the first connected connector
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
        airlied@linux.ie, agross@kernel.org, bjorn.andersson@linaro.org,
        quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 Jul 2022 at 19:12, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Some userspace presumes that the first connected connector is the main
> display, where it's supposed to display e.g. the login screen. For
> laptops, this should be the main panel.
>
> This patch call drm_helper_move_panel_connectors_to_head() after
> drm_bridge_connector_init() to make sure eDP stay at head of
> connected connector list. This fixes unexpected corruption happen
> at eDP panel if eDP is not placed at head of connected connector
> list.
>
> Changes in v2:
> -- move drm_helper_move_panel_connectors_to_head() to
>                 dpu_kms_drm_obj_init()
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Technically this patch was neither  Reviewed, nor Tested. Please
refrain from posting wrong tags.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2b9d931..50ff666 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -763,6 +763,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>         if (ret)
>                 return ret;
>
> +       drm_helper_move_panel_connectors_to_head(dev);
> +
>         num_encoders = 0;
>         drm_for_each_encoder(encoder, dev)
>                 num_encoders++;

-- 
With best wishes
Dmitry
