Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E71EE70E70C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 23:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237713AbjEWVCi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 17:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbjEWVCh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 17:02:37 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBEFFDD
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 14:02:35 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-55db055b412so77507997b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 14:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684875755; x=1687467755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4gNfZIeekSHs7BohS2Orfq0Se0pBECTdaana4cYqBL4=;
        b=tOGPzOTXR3ZwhBy1Ic0ihRryuxQqnniw6YqV0SHZ2xEJbKbV79oNg8iSaUODmLcYpc
         OODVehM/ARBOOUXdzyj94ie3ObrYp2+yDybUY6odfIvlc3vWw4Uu42VIjwf40Qj8jnpv
         /u6BIYptfcGey8tl64SMGH2ekP+e49xLeKTW8DQrLw1PiekWMDf+SVtkboNYCRCGAok6
         r3NGmKXQI7IcDYSXwmcTXA1k8cCjELTw9o7nX5Wa7vfMZ2Cbd4X+B/kwzKnE15M8S45G
         buaYCqxYBK9bQTQOog//pv15RiylJCcZ2FOpBp2rmOQy5OInQOLIQu3TNA64CyDbqbSd
         lTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684875755; x=1687467755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gNfZIeekSHs7BohS2Orfq0Se0pBECTdaana4cYqBL4=;
        b=ZyULGRjVFjmOSzupNmInFaSR7OiQ3UOL9rDSl0BYa28TMe4WZeH9yY4yi3IE+P102+
         s4RjJwTMKJSsmBl/nXXQFVCoP4pEk+FU+60S588aLIyqzEkAxm9LDJvIwN3tAQpmpAPo
         5+gsmDThgAsyhLahzsYadH3CSOkuhDiZC2lX7WxVxDEgeJycGVx0hU3rU6pFum/c5A2W
         D9rjjqcd5NipGzKhr1+4btLtLvOa8SJ3whZZDBwJHAQfbzIWrquUKvM55hC+QRQ10AYN
         qX4WEU8Zk1OeUFUF3sKw++E5P9ynq+PVTmNXUMXO5Sci4Wo3w2etdKqajeX4k4wCc7J2
         xBaQ==
X-Gm-Message-State: AC+VfDwhuWAeIEjJC3rTlrUFWq1Y/aXEB5+BdodZ9lko5UjdT0DiUm1/
        Z8XkFfQaZks/ldii5Fy1WTRD01n4WTW3NUTaIUAPFQ==
X-Google-Smtp-Source: ACHHUZ7UXQzwb1RIpn2+dG8waBFp9bePM9jRJQJFoANyzIIkMfYS8DmloLszmqODJrAwBGg2Stn1tqrkrSUfUH7FmaQ=
X-Received: by 2002:a81:1bc8:0:b0:55a:776e:95f3 with SMTP id
 b191-20020a811bc8000000b0055a776e95f3mr15671135ywb.25.1684875754960; Tue, 23
 May 2023 14:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <1684870754-24906-1-git-send-email-quic_khsieh@quicinc.com> <1684870754-24906-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1684870754-24906-2-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 24 May 2023 00:02:23 +0300
Message-ID: <CAA8EJpq0Gh5Wu5S_9aMytghOer_zPKthCZq9-vf7+vHm+sYH5Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] drm/msm/dp: no need to disable irq after devm_request_irq()
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org, quic_abhinavk@quicinc.com,
        quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
        marijn.suijten@somainline.org, leonard@lausen.nl,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 23 May 2023 at 22:39, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> devm_request_irq() will allocate irq and return with irq enabled.
> At current implementation irq are specified disabled after return from
> devm_request_irq() and re enabled later. It is redundant.

This is not correct. The disable_irq / enable_irq pair is not
redundant. If I understand correctly, it was done so to prevent HPD
IRQs from being delivered before HPD worker is initialized (which was
probably correct at the time of the mentioned commit). So this patch
either can come after the next patch (but then it should not have a
Fixes tag and the commit message should be changed to mention why
disable_irq() call is redundant) or it can be squashed together with
the next patch.

>
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3e13acdf..1af49b6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1094,12 +1094,6 @@ static void dp_display_config_hpd(struct dp_display_private *dp)
>                                 DP_DP_HPD_PLUG_INT_MASK |
>                                 DP_DP_HPD_UNPLUG_INT_MASK,
>                                 true);
> -
> -       /* Enable interrupt first time
> -        * we are leaving dp clocks on during disconnect
> -        * and never disable interrupt
> -        */
> -       enable_irq(dp->irq);
>  }
>
>  void dp_display_set_psr(struct msm_dp *dp_display, bool enter)
> @@ -1282,7 +1276,6 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>                                 dp->irq, rc);
>                 return rc;
>         }
> -       disable_irq(dp->irq);
>
>         return 0;
>  }
> @@ -1570,7 +1563,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>                 dp_display_host_init(dp_priv);
>                 dp_catalog_ctrl_hpd_config(dp_priv->catalog);
>                 dp_display_host_phy_init(dp_priv);
> -               enable_irq(dp_priv->irq);
>
>                 /*
>                  * The code below assumes that the panel will finish probing
> @@ -1612,7 +1604,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>
>  error:
>         if (dp->is_edp) {
> -               disable_irq(dp_priv->irq);
>                 dp_display_host_phy_exit(dp_priv);
>                 dp_display_host_deinit(dp_priv);
>         }
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
