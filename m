Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4EC42351F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 02:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237024AbhJFAib (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 20:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233994AbhJFAib (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 20:38:31 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D228FC06174E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 17:36:39 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id r43-20020a05683044ab00b0054716b40005so1069162otv.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 17:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=34FHsnThWd5cJ2Bu4AZwOiJDWeSTgTUmslcydMZU27I=;
        b=h3+Dekiu7PeXTtrw/wymCYT7cideBYDpY3zS3TTprVL+pZ/JWaEDq0UbstfC69POmj
         BCjmQtm9drcLf1tPYRVACnccuJW2IkEp7c7K2yBKmYv4a7PKHG6clmum+9hszB3Zep+v
         eyeSZ8UgbMQLzlkO1onJyYElAVEA9VIQRdgbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=34FHsnThWd5cJ2Bu4AZwOiJDWeSTgTUmslcydMZU27I=;
        b=0Tl9cOWP7Zn6cJe0n2TD2CxwK8W9B7F3ObMDSH1EknvXoWSmOCHspYUH82QkM6vmkC
         b6wFYVM1OT5E+uRfr0sWyrtri9TdzYsFmkdm/Y6ZvcsIitewdN+zPwFuoLUudbojRG2O
         cO3Gd1WCQug7AzIPUIUgIv/FM2frKDA10FOpxUJbSGAjPcPd310WswmAt8BEeSnXl7W4
         REs3ddjQkHtlR7FL/ZwbBGOegCeFIBuABTqT1kesvYyz62Hy9a+VN6ul4XrHDPQv3MTJ
         bovliN2NSRim71hndeQztkmfegkqBxdcJQu637i22KCdmOpYKvnkvNj0VJGTCygjTwlP
         VWdg==
X-Gm-Message-State: AOAM533ztfNWzoKRqjPwXJiR9VMfTRqFb2E5yzpK1FQbJFUA5fMPggiR
        0cyM0PiOEOtRp5102aFczT8EtzYM7UdJVAK0vXs66w==
X-Google-Smtp-Source: ABdhPJzLtds0BffH3uZEHTiFhq527czugxVx7eDlpHa/6QzckkoMEfbzawgp/QBcet9u1WshjOzIz2lqcbc5Ej7qgYw=
X-Received: by 2002:a05:6830:4116:: with SMTP id w22mr3879148ott.159.1633480599234;
 Tue, 05 Oct 2021 17:36:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 17:36:38 -0700
MIME-Version: 1.0
In-Reply-To: <20211005231323.2663520-8-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org> <20211005231323.2663520-8-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 5 Oct 2021 17:36:38 -0700
Message-ID: <CAE-0n52MhUk_bE23FpDCrrk9errV3CvSAhNV-xm_5eiRyQ1zLw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/msm/dp: Add sc8180x DP controllers
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-10-05 16:13:23)
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> DP driver.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v3:
> - Rebased upon previous patches in series
>
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 674cddfee5b0..29c2c1c52ddb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -135,8 +135,19 @@ static const struct msm_dp_config sc7180_dp_cfg = {
>         .num_descs = 1,
>  };
>
> +static const struct msm_dp_config sc8180x_dp_cfg = {
> +       .descs = (struct msm_dp_desc[]) {

const?

> +               { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +               { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +               { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> +       },
> +       .num_descs = 3,
> +};
> +
>  static const struct of_device_id dp_dt_match[] = {
>         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> +       { .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
> +       { .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },

Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
