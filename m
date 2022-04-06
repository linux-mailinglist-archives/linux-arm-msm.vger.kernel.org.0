Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 638F44F58A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 11:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234615AbiDFJB6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 05:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1452332AbiDFI63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 04:58:29 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6283526B0BC
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 21:03:09 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id q189so1210316oia.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 21:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=OWGK0XSf75E2cBZKiH+umLuz5CYhWcZRVj1UAjEllAY=;
        b=B3Xk0zf30mn3aJ6PALMS1FYblpAC7sg/WWGpfndFeo4pqSCs2E3RWu4wnQ85Ns8Mu7
         tNV9xYLSWizZpyECol/+pTvwoQGHG/8U0IGsK7lxkp1fbLlEZmA4QJtG4PLXdhsH/0ND
         lQzmYdtcR1t/GIkVSGJuOIQ0Qz/M3m2bH4lVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=OWGK0XSf75E2cBZKiH+umLuz5CYhWcZRVj1UAjEllAY=;
        b=wfEcr6e9uvxdnChZZJDWhSo5z4Oh9SHZ2l6h08huhi4IPu3K5sU0GaKejm8xOzO5a3
         EHdcxEMiHra8Oky/Bs4p9LKoj6CY5dlW4dKpXAkV30BkqiOWyqlD/5E2FdURJTuytfKo
         slv9sJxaxbiDvGgM4i3Htq/4wREyR453YxEOdGIfJ9o9ZYCPP/FBbvUb4hJvywlVYIsw
         vXlVU2f7r3hB5voNd4HQR93w0bMdDlQU5evibiW2zfMUAatZa4Oht4b69mI9HaHPE1ES
         wnad1TPP9A3fwdx1ifncVPmLdvWRqztHBTGJf7lROCTOHUhJ8kgMuQsWAsCO9g3GZU3E
         M3pQ==
X-Gm-Message-State: AOAM533EF10ePKpETHeU3ZkThdE8W1WvEE5qm0NZRMemZZsRVEEHS/Xp
        JPgOOec81Rh7aOmgMVRtVnMG8UWe4naFvJnO8F0zvA==
X-Google-Smtp-Source: ABdhPJxM0nn6L84rHUj4Gb+jOZSqgxHoFiOkcE8dNBOJmIDosHNk+ShSDIkEgO2AH7sNO4+MIcnbS/HprQhkcuCb8wY=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr2770219oif.63.1649217788747; Tue, 05
 Apr 2022 21:03:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 21:03:08 -0700
MIME-Version: 1.0
In-Reply-To: <20220405235059.359738-4-dmitry.baryshkov@linaro.org>
References: <20220405235059.359738-1-dmitry.baryshkov@linaro.org> <20220405235059.359738-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Apr 2022 21:03:08 -0700
Message-ID: <CAE-0n501rjepeF3Oc6g05ctyGYdZTPR1+OMC=piQEtUZT+03=w@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: don't store created planes, connectors and encoders
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
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

Quoting Dmitry Baryshkov (2022-04-05 16:50:59)
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index d661debb50f1..ee3093890d97 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -184,23 +184,14 @@ struct msm_drm_private {
>
>         struct workqueue_struct *wq;
>
> -       unsigned int num_planes;
> -       struct drm_plane *planes[MAX_PLANES];

Can we get rid of MAX_PLANES?

> -
>         unsigned int num_crtcs;
>         struct drm_crtc *crtcs[MAX_CRTCS];
>
>         struct msm_drm_thread event_thread[MAX_CRTCS];
>
> -       unsigned int num_encoders;
> -       struct drm_encoder *encoders[MAX_ENCODERS];

And MAX_ENCODERS?

> -
>         unsigned int num_bridges;
>         struct drm_bridge *bridges[MAX_BRIDGES];
>
> -       unsigned int num_connectors;
> -       struct drm_connector *connectors[MAX_CONNECTORS];

And MAX_CONNECTORS?
