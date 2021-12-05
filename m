Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0009468904
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Dec 2021 05:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhLEEIy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Dec 2021 23:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhLEEIy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Dec 2021 23:08:54 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C50C061751
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Dec 2021 20:05:28 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso9071115otr.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Dec 2021 20:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=AXzcZCKOBu/msJYDlg3Y+fzM95FhQ9eIvXKzuLg8CYs=;
        b=AmuNcydbQKjrjST36znuG6aIEps8lr+NEoZm8GTsEJRrucyjgTzlxRG5CWPEAF5zLI
         jQzT0P+RXN+fZz1zyegaxKmqkaob+q9Qx7NFgGzwYqMNNvPNLIv10p44avHxK1L5LOi3
         bygNpdX9oJMohTtI3RY5UtfKzoaa+WypyAjpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=AXzcZCKOBu/msJYDlg3Y+fzM95FhQ9eIvXKzuLg8CYs=;
        b=Dz/6k6gPnxOG5VX8AFGSe2H47v3G4B3hfLgMZWjibnKy7+F26+Ton1nRhx9ErYugmn
         mFMRXw4VRaTnoYlOyzvy6jM/dIgfuedux20JolsHbc0PLFLPd4CxQ6o+oe5XSdRj7Q0S
         dBSZokH+dVfVJtZqib2zrGliiX7Sf+b9rNj5MkNTqv2NguJHvKOC9qAf6dZJ9ZJrfxvm
         w3j/V71d0jkV/kuIy/6mekYdEruIUMFqAThSnVJFW7rdOmueKzCpMhzWt/59ZRfDYo+g
         XDqITxJKS1Kap3N/QSinT8CBGu306kpGiBUnLGffGJaCb2qzuw5tmJebHKBCtAFD2enX
         0MAw==
X-Gm-Message-State: AOAM5304sP5MOlOBjHpHnqh3XG4wzlbSiNcORkvvz6FWMSUDfk1WaJCA
        dGfTA2n8zUKQs12IgTN13QfwfStj/a5Utkc06TeUag==
X-Google-Smtp-Source: ABdhPJxWcPtz+q1YJarR+oJWSUf3FTjY0xDPDQPv8K4vpWyix5KmjKghi6TmOgkMKNZ83F0NU4bIZDFmxzAfdegAiwA=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr23402340ota.126.1638677127497;
 Sat, 04 Dec 2021 20:05:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 4 Dec 2021 20:05:27 -0800
MIME-Version: 1.0
In-Reply-To: <1638568959-7564-1-git-send-email-quic_khsieh@quicinc.com>
References: <1638568959-7564-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Sat, 4 Dec 2021 20:05:26 -0800
Message-ID: <CAE-0n51TZG9SjjOaNmNJPhzOZmQLsywcAT7_Vf4uz4VPga5xhw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Add "qcom,sc7280-dp" to support display port.
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-12-03 14:02:39)
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)

One nit

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d44f18b..91582d3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -146,6 +146,7 @@ static const struct msm_dp_config sc7280_dp_cfg = {
>  static const struct of_device_id dp_dt_match[] = {
>         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>         { .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
> +       { .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },

The letter d comes before e so it would be better to sort this
alphanumerically and avoid conflicts later.
