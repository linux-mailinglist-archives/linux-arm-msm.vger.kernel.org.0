Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCAC3B4730
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 18:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhFYQKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 12:10:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10794 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229723AbhFYQKi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 12:10:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624637298; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/KpohStlUJvTiEQ4iqkocQH8jbpoCZ87P2EttCttYgQ=;
 b=YXC/jW36r2aqZb3QJJ7DbgkQ+c8g2hznheDjODDtEWxdQt/gCIvbAFO8y8zZpEMtFq2mS2n8
 MHoqRfxsY0mn3v4MEf5yo7G/WVrq7r/SiPKo1NyroFfGVnxcwWE6Y8zqk9gdCXyRPVKy5Yqj
 Rrw7mMY6k7k4hYbNERyjzFs/324=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60d5ff5cd2559fe392ca54cf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Jun 2021 16:07:56
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C86BCC4338A; Fri, 25 Jun 2021 16:07:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 96F94C433F1;
        Fri, 25 Jun 2021 16:07:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 25 Jun 2021 09:07:54 -0700
From:   abhinavk@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Add missing drm_device
 backpointer
In-Reply-To: <20210625034721.1287948-1-bjorn.andersson@linaro.org>
References: <20210625034721.1287948-1-bjorn.andersson@linaro.org>
Message-ID: <b585ae0c9e2e241f7f0494ae09809392@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-24 20:47, Bjorn Andersson wrote:
> '6cba3fe43341 ("drm/dp: Add backpointer to drm_device in drm_dp_aux")'
> introduced a mandator drm_device backpointer in struct drm_dp_aux, but
mandatory
> missed the msm DP driver. Fix this.
> 
> Fixes: 6cba3fe43341 ("drm/dp: Add backpointer to drm_device in 
> drm_dp_aux")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
apart from that nit,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 3 ++-
>  drivers/gpu/drm/msm/dp/dp_aux.h     | 2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c 
> b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 4a3293b590b0..88659ed200b9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -441,7 +441,7 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
>  	dp_catalog_aux_enable(aux->catalog, false);
>  }
> 
> -int dp_aux_register(struct drm_dp_aux *dp_aux)
> +int dp_aux_register(struct drm_dp_aux *dp_aux, struct drm_device 
> *drm_dev)
>  {
>  	struct dp_aux_private *aux;
>  	int ret;
> @@ -455,6 +455,7 @@ int dp_aux_register(struct drm_dp_aux *dp_aux)
> 
>  	aux->dp_aux.name = "dpu_dp_aux";
>  	aux->dp_aux.dev = aux->dev;
> +	aux->dp_aux.drm_dev = drm_dev;
>  	aux->dp_aux.transfer = dp_aux_transfer;
>  	ret = drm_dp_aux_register(&aux->dp_aux);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h 
> b/drivers/gpu/drm/msm/dp/dp_aux.h
> index 0728cc09c9ec..7ef0d83b483a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> @@ -9,7 +9,7 @@
>  #include "dp_catalog.h"
>  #include <drm/drm_dp_helper.h>
> 
> -int dp_aux_register(struct drm_dp_aux *dp_aux);
> +int dp_aux_register(struct drm_dp_aux *dp_aux, struct drm_device 
> *drm_dev);
>  void dp_aux_unregister(struct drm_dp_aux *dp_aux);
>  void dp_aux_isr(struct drm_dp_aux *dp_aux);
>  void dp_aux_init(struct drm_dp_aux *dp_aux);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index c26562bd85fe..2f0a5c13f251 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -259,7 +259,7 @@ static int dp_display_bind(struct device *dev,
> struct device *master,
>  		return rc;
>  	}
> 
> -	rc = dp_aux_register(dp->aux);
> +	rc = dp_aux_register(dp->aux, drm);
>  	if (rc) {
>  		DRM_ERROR("DRM DP AUX register failed\n");
>  		return rc;
