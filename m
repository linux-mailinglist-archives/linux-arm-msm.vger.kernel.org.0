Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC2B3938CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 00:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235301AbhE0Wvf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 18:51:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:42924 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233203AbhE0Wvd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 18:51:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622155800; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KXjmECHZ9kMYQ0cRGOjb34lhHVhO+2GLmPE1vLYHHXs=;
 b=qkNx0FwN8MB0WUPaZTCkJiGmGFvBoSrcEukRsZrVZoYaOg3kIW0a2PtSrMhM/em5Zo05gru7
 wX2ONY7kY3qgRBjb/jyku5uuGWZ+IGHatOXhF+HAXqc7ck4KwovwAyJktJy65gW2547OhICp
 YoMPRvw2OnhISRmZMz+6OtRbnrk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60b022135eaa81cb1ed64975 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 27 May 2021 22:49:55
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7F15FC4338A; Thu, 27 May 2021 22:49:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CF38FC433D3;
        Thu, 27 May 2021 22:49:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 27 May 2021 15:49:51 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        kernel test robot <lkp@intel.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH] drm/msm: fix display snapshotting if DP or
 DSI is disabled
In-Reply-To: <20210527220330.3364716-1-dmitry.baryshkov@linaro.org>
References: <20210527220330.3364716-1-dmitry.baryshkov@linaro.org>
Message-ID: <ab7f068dacd2b7b0f24ebd747a954d27@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-27 15:03, Dmitry Baryshkov wrote:
> Fix following warnings generated when either DP or DSI support is
> disabled:
> 
> drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:141:3: error:
> implicit declaration of function 'msm_dp_snapshot'; did you mean
> 'msm_dsi_snapshot'? [-Werror=implicit-function-declaration]
> 
> drivers/gpu/drm/msm/msm_kms.h:127:26: warning: 'struct msm_disp_state'
> declared inside parameter list will not be visible outside of this
> definition or declaration
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:867:21: error: initialization
> of 'void (*)(struct msm_disp_state *, struct msm_kms *)' from
> incompatible pointer type 'void (*)(struct msm_disp_state *, struct
> msm_kms *)' [-Werror=incompatible-pointer-types]
> drivers/gpu/drm/msm/dsi/dsi.h:94:30: warning: 'struct msm_disp_state'
> declared inside parameter list will not be visible outside of this
> definition or declaration
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Fixes: 1c3b7ac1a71d ("drm/msm: pass dump state as a function argument")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h |  1 -
>  drivers/gpu/drm/msm/dsi/dsi.h                |  2 --
>  drivers/gpu/drm/msm/msm_drv.h                | 12 +++++++++++-
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> index c6174a366095..c92a9508c8d3 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> @@ -27,7 +27,6 @@
>  #include <linux/devcoredump.h>
>  #include <stdarg.h>
>  #include "msm_kms.h"
> -#include "dsi.h"
> 
>  #define MSM_DISP_SNAPSHOT_MAX_BLKS		10
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index cea73f9c4be9..9b8e9b07eced 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -91,8 +91,6 @@ static inline bool msm_dsi_device_connected(struct
> msm_dsi *msm_dsi)
>  	return msm_dsi->panel || msm_dsi->external_bridge;
>  }
> 
> -void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi *msm_dsi);
> -
>  struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
> 
>  /* dsi host */
> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
> b/drivers/gpu/drm/msm/msm_drv.h
> index c33fc1293789..ba60bf6f124c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -43,6 +43,7 @@ struct msm_gem_submit;
>  struct msm_fence_context;
>  struct msm_gem_address_space;
>  struct msm_gem_vma;
> +struct msm_disp_state;
> 
>  #define MAX_CRTCS      8
>  #define MAX_PLANES     20
> @@ -340,6 +341,8 @@ void __init msm_dsi_register(void);
>  void __exit msm_dsi_unregister(void);
>  int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device 
> *dev,
>  			 struct drm_encoder *encoder);
> +void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi *msm_dsi);
> +
>  #else
>  static inline void __init msm_dsi_register(void)
>  {
> @@ -353,6 +356,10 @@ static inline int msm_dsi_modeset_init(struct
> msm_dsi *msm_dsi,
>  {
>  	return -EINVAL;
>  }
> +static inline void msm_dsi_snapshot(struct msm_disp_state
> *disp_state, struct msm_dsi *msm_dsi)
> +{
> +}
> +
>  #endif
> 
>  #ifdef CONFIG_DRM_MSM_DP
> @@ -367,7 +374,6 @@ void msm_dp_display_mode_set(struct msm_dp *dp,
> struct drm_encoder *encoder,
>  				struct drm_display_mode *mode,
>  				struct drm_display_mode *adjusted_mode);
>  void msm_dp_irq_postinstall(struct msm_dp *dp_display);
> -struct msm_disp_state;
>  void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp
> *dp_display);
> 
>  void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor 
> *minor);
> @@ -412,6 +418,10 @@ static inline void msm_dp_irq_postinstall(struct
> msm_dp *dp_display)
>  {
>  }
> 
> +static inline void msm_dp_snapshot(struct msm_disp_state *disp_state,
> struct msm_dp *dp_display)
> +{
> +}
> +
>  static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
>  		struct drm_minor *minor)
>  {
