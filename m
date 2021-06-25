Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF1F3B4764
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 18:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhFYQ3e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 12:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36870 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229630AbhFYQ3e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 12:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624638433;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U5o+qfP6GHLfIPfnq02TmNaEHiucEY8RMLS1UO4vZ+s=;
        b=D0zFbwKuAXBltJ0CyDOOPDCLkicehizQLEnbHUBFuHTgAv/L9kRECge7d4CL3q09IMIFtZ
        m19DHtSujYHf1Rgtwnh4bmKWWjmHRZjw0t4Totiasd4yH1iaFKJn8VXx8joY2XE2oDQP+/
        uVY838Uy9i+4A8SfKIZnMBetXMN0u8k=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-Tg7XbgQjPAeatP4cLt2Kpg-1; Fri, 25 Jun 2021 12:27:11 -0400
X-MC-Unique: Tg7XbgQjPAeatP4cLt2Kpg-1
Received: by mail-qv1-f71.google.com with SMTP id ei5-20020ad45a050000b029027c5382c633so9172386qvb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 09:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=U5o+qfP6GHLfIPfnq02TmNaEHiucEY8RMLS1UO4vZ+s=;
        b=mswT5m8jolfV6bzn/Oplc3ezMiai1q3RDjY3RhQiiGNLiMJGUUW/ez/eHuIVnNBQkA
         P9R5K8PX0qOmwJC2UoyT8FyjvBEwnw3sJbJQq3S0sOzoyTso3qcZLbPdNMY3/HlKmi0X
         3obmAGTL2X18KdzpeZrtdmCyc+TfGQfnti6Xc+7Ma/NEvwT3q5+UYOMiWydJLcgCMzSG
         0wY2IBLmjsCFLKDwsPcb6DstTvi0dRXDcAiFfINeKRVf4R1lDTJkidR3BDPh4H2+1V/0
         N015felQAyJGy7nQH/r8D83ed3uLjEaw5WYEWI1EKAy3zu57f8AYtOdTc154/gpaarcx
         uHrg==
X-Gm-Message-State: AOAM533sM+fTikTuyUBV1+9fDlpViZKqzHyTD4ci/rBsNHuAeni/qyA8
        +t8dxADy2z5xjECghdx1Hp2D2sZUcDKl7cEJw3wq7Kz72n3JppVYmrHQtKyrnnZTOLHgJR6kRsT
        J4H4LmMOx+Nqj7D1/f6R3K6w6fw==
X-Received: by 2002:a0c:c3d1:: with SMTP id p17mr11777575qvi.44.1624638431614;
        Fri, 25 Jun 2021 09:27:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNCXBo3wDqEwZBbeZJgLcThoweJoirnmT4pfoxXYsxbDiSqWO1f6DFrN67Lv8a1Xvc6DS5QA==
X-Received: by 2002:a0c:c3d1:: with SMTP id p17mr11777554qvi.44.1624638431416;
        Fri, 25 Jun 2021 09:27:11 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id t62sm5240494qkc.26.2021.06.25.09.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 09:27:11 -0700 (PDT)
Message-ID: <a48763801f0e903a227283a12cf881dc143034ff.camel@redhat.com>
Subject: Re: [PATCH] drm/msm/dp: Add missing drm_device backpointer
From:   Lyude Paul <lyude@redhat.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date:   Fri, 25 Jun 2021 12:27:09 -0400
In-Reply-To: <20210625034721.1287948-1-bjorn.andersson@linaro.org>
References: <20210625034721.1287948-1-bjorn.andersson@linaro.org>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ah - must have missed this when I added this. Thanks for the fix!

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2021-06-24 at 20:47 -0700, Bjorn Andersson wrote:
> '6cba3fe43341 ("drm/dp: Add backpointer to drm_device in drm_dp_aux")'
> introduced a mandator drm_device backpointer in struct drm_dp_aux, but
> missed the msm DP driver. Fix this.
> 
> Fixes: 6cba3fe43341 ("drm/dp: Add backpointer to drm_device in drm_dp_aux")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 3 ++-
>  drivers/gpu/drm/msm/dp/dp_aux.h     | 2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c
> b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 4a3293b590b0..88659ed200b9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -441,7 +441,7 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
>         dp_catalog_aux_enable(aux->catalog, false);
>  }
>  
> -int dp_aux_register(struct drm_dp_aux *dp_aux)
> +int dp_aux_register(struct drm_dp_aux *dp_aux, struct drm_device *drm_dev)
>  {
>         struct dp_aux_private *aux;
>         int ret;
> @@ -455,6 +455,7 @@ int dp_aux_register(struct drm_dp_aux *dp_aux)
>  
>         aux->dp_aux.name = "dpu_dp_aux";
>         aux->dp_aux.dev = aux->dev;
> +       aux->dp_aux.drm_dev = drm_dev;
>         aux->dp_aux.transfer = dp_aux_transfer;
>         ret = drm_dp_aux_register(&aux->dp_aux);
>         if (ret) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h
> b/drivers/gpu/drm/msm/dp/dp_aux.h
> index 0728cc09c9ec..7ef0d83b483a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> @@ -9,7 +9,7 @@
>  #include "dp_catalog.h"
>  #include <drm/drm_dp_helper.h>
>  
> -int dp_aux_register(struct drm_dp_aux *dp_aux);
> +int dp_aux_register(struct drm_dp_aux *dp_aux, struct drm_device *drm_dev);
>  void dp_aux_unregister(struct drm_dp_aux *dp_aux);
>  void dp_aux_isr(struct drm_dp_aux *dp_aux);
>  void dp_aux_init(struct drm_dp_aux *dp_aux);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index c26562bd85fe..2f0a5c13f251 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -259,7 +259,7 @@ static int dp_display_bind(struct device *dev, struct
> device *master,
>                 return rc;
>         }
>  
> -       rc = dp_aux_register(dp->aux);
> +       rc = dp_aux_register(dp->aux, drm);
>         if (rc) {
>                 DRM_ERROR("DRM DP AUX register failed\n");
>                 return rc;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

