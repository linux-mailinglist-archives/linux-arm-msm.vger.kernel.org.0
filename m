Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9362990F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 16:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783836AbgJZP2b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 11:28:31 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50196 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1783835AbgJZP2b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 11:28:31 -0400
Received: by mail-wm1-f66.google.com with SMTP id 13so12078640wmf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2020 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5fixE0Fzxa17/LaNC7f09xiejxOpGyiNSz6J/RfP0Nk=;
        b=iKJOj/M7ENfJnhaI82M3THtzki19jT4wz4VC4GxWYY8cSgG55UbYRaKsGrCrom7MLA
         1aVzJp/N7HJpj2SnQDBTD5gt+4q2p6apsgwoyZbxsIVoutUycFaLtVQ5LHJ5iiTf+EV1
         Kv/QvP+rsxcJpGNfjWrimeSCunnV2uOEDWvqZ+7ZcLH3UFGQvxETzFXYI1GfwtfSYUrF
         9tsGt9Y0HwvkUpDoWFHgL3acDOJNMPu4ieFQsBuyIhutiQAYO1wgNqkP4c4Xf+LHbszK
         5OHrVIiEQhcZ25Tw1Mus2JD/nnL81RUJEOxCRZEQ2aBfREFToc/8cNpa3BnVtKdI3xi6
         l1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5fixE0Fzxa17/LaNC7f09xiejxOpGyiNSz6J/RfP0Nk=;
        b=rMk4MLrKS1WvT4DV6tNldF/y05HJIUcGrZmeaw3ZXLRaI/UU66PE2BHhyxfjC3TBOG
         tRzikFKWaV/qI9eB9T42j/oIgCEuMtbd8oC7jINFTocmaaEBU6emPMSnodt+zcHebPVu
         JEG8onq+CqbbUK/ywlvb616ignMTug6u7tw2qjomSM2EWYleylrqj73Q6LGMrfIQc4Bz
         CMIdIyWOZRe+nOimEfTnA9m0SVZxt+dWL87YNY1W20D4F9CUGG6B35hl11JVaKBOIzxe
         95Mt8HcRodbYgrNRefvj0+P/pO5/O+P5GXiXXkxvk4eJFn/Gb9aBpTVm3efJuvknayni
         Uwvw==
X-Gm-Message-State: AOAM532QEgTdns6h1uYmTVwIPNcSeAqXhnopSb/MF/OaQNKwLDwXDD2m
        FPvC/PTiv/OLY8NePlbq6RaDaQ98NZNeB4tIotc=
X-Google-Smtp-Source: ABdhPJwgQp8TU+rXlS1EmwKGUKBfI0Hn6qEhlIl0U9B6UJQqUib0WcAJ72ToKsIb5ibIajGh4NjUL1IXIZYlQxaJpik=
X-Received: by 2002:a05:600c:2241:: with SMTP id a1mr17556594wmm.49.1603726109285;
 Mon, 26 Oct 2020 08:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <b9117317819c8b63d558231e6b88410ea717065e.1603716447.git.robin.murphy@arm.com>
In-Reply-To: <b9117317819c8b63d558231e6b88410ea717065e.1603716447.git.robin.murphy@arm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 26 Oct 2020 08:28:17 -0700
Message-ID: <CAF6AEGvavr6aGkkK6uhcY8nEYbZ82AiAs4uYwRSkuHfQ5p==Uw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Add missing stub definition
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 26, 2020 at 5:48 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> DRM_MSM fails to build with DRM_MSM_DP=n; add the missing stub.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Thanks..

Reviewed-by: Rob Clark <robdclark@gmail.com>

and looks like,

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on
Snapdragon Chipsets")

> ---
>  drivers/gpu/drm/msm/msm_drv.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index b9dd8f8f4887..0b2686b060c7 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -423,6 +423,11 @@ static inline int msm_dp_display_disable(struct msm_dp *dp,
>  {
>         return -EINVAL;
>  }
> +static inline int msm_dp_display_pre_disable(struct msm_dp *dp,
> +                                       struct drm_encoder *encoder)
> +{
> +       return -EINVAL;
> +}
>  static inline void msm_dp_display_mode_set(struct msm_dp *dp,
>                                 struct drm_encoder *encoder,
>                                 struct drm_display_mode *mode,
> --
> 2.28.0.dirty
>
