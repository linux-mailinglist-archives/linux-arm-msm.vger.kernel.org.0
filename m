Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C36F48714E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 04:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345628AbiAGDmu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 22:42:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiAGDmt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 22:42:49 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7307DC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 19:42:49 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id h5-20020a9d6a45000000b005908066fa64so4429614otn.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 19:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=NWwd6X+cONdHPrAA1ssFoRdo6O/Kd5Hv3y1+Epowixk=;
        b=A4vFqWQX/ciKAiD3rBShIXkWQ6We8v4r2Eq9/XAa+FPBuF3IeORe3y2KvbSOTCPnjw
         iAGFljIBOl02LecccSX5kLGEEvuzOT6EpaOm1G18YR1Vmq5Ln/HKIE4UjgNB3yshm7V0
         KZ9ATLayI5c35/38nQyFWM/g3/XMRBmWUHfPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=NWwd6X+cONdHPrAA1ssFoRdo6O/Kd5Hv3y1+Epowixk=;
        b=QqLorYrXU6rqcywOAW8aF2FWSswHEcQyTozmDF17dnwTTTAzpTgKtKXIL9+GyKTLO2
         fyDGIJYCM7swVAdwEP85lZDus7KuiB1JWDshNX+G7bKejp//KrrB8AUsdVH8HQciHsn9
         EpWpg8PQ6mVRcbqJw60QPR7Gs7Q5LqeyOqhvlyrcpcKRq+sqxhxpRwGgYsHvJ4lDRhJL
         CBtoJk7dPwRQLAjqbCHibkuIZ9m9dnPWgY1mfsMVKyydMOLhnLcpabwjZvpkPYO/5Bzb
         c58Wp+BSq+nwVyA+mRJIs77KrEM+yHH8BugdF1Y8xyd8bDJNrZR/1FZ88wnFYCi7bVj/
         SO1g==
X-Gm-Message-State: AOAM532EPScFtQRECoI3QxGk+8+/hDtntaDyewa1U0BaAGUdeIYd/cTG
        Gwz+BPaKgWzR+58w1b9SvhFoRztDEaxfeQi65m4lig==
X-Google-Smtp-Source: ABdhPJzf0n9XHktPj8J7s6+dZI2ZyKcsrJQi3oL20SOcD4s8ZaFysAcZ4/L+0HgoBgdkZi/UIdAlzTNykWoLYPJTt/k=
X-Received: by 2002:a9d:1a6:: with SMTP id e35mr4225674ote.77.1641526968813;
 Thu, 06 Jan 2022 19:42:48 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 19:42:48 -0800
MIME-Version: 1.0
In-Reply-To: <20220107020132.587811-3-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org> <20220107020132.587811-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 6 Jan 2022 19:42:48 -0800
Message-ID: <CAE-0n51XaV1+rh4CZKz7gMZBPkpq+wHcbNbgHFxoC1ikoDLkhQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] drm/msm/dp: support attaching bridges to the DP encoder
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-01-06 18:01:27)
> Currently DP driver will allocate panel bridge for eDP panels.
> Simplify this code to just check if there is any next bridge in the
> chain (be it a panel bridge or regular bridge). Rename panel_bridge
> field to next_bridge accordingly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  4 ++--
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 26 ++++++++------------------
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  2 +-
>  5 files changed, 13 insertions(+), 23 deletions(-)

I like this one, it certainly makes it easier to understand.

> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index a7acc23f742b..5de21f3d0812 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -307,11 +299,9 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
>         if (rc)
>                 return rc;
>
> -       if (connector_type == DRM_MODE_CONNECTOR_eDP) {

It feels like this is on purpose, but I don't see any comment so I have
no idea. I think qcom folks are concerned about changing how not eDP
works. I'll have to test it out locally.

> -               rc = dp_parser_find_panel(parser);
> -               if (rc)
> -                       return rc;
> -       }
> +       rc = dp_parser_find_next_bridge(parser);
> +       if (rc)
> +               return rc;
>
>         /* Map the corresponding regulator information according to
>          * version. Currently, since we only have one supported platform,
