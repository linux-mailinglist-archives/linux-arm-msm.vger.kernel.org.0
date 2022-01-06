Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415D4485DAC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 01:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344313AbiAFAwE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 19:52:04 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:11329 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344027AbiAFAuB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 19:50:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1641430201; x=1672966201;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3mDDWkL02Un8LANUcOp+p+y4tof1LZKh/RxWNRCnb18=;
  b=EZ7vHSvLihffwts88tmnQqhebOuptgBd8YOSjDzrw+OTzdKtVVRkl2lb
   glcZRYFOEecgy3mGWGbtMwXTx1Y/68IzUC7clQuKTyn3TgC89bQT8shKs
   n7MExIH/PL54eFEFlxpd1Ukpy/vGOS92xima3KVd6r3MrBh4AunN5B+hm
   I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 05 Jan 2022 16:50:00 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 16:49:59 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 5 Jan 2022 16:49:59 -0800
Received: from [10.111.171.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 5 Jan 2022
 16:49:57 -0800
Message-ID: <a395313b-5bc8-b980-3b06-c380c0476a87@quicinc.com>
Date:   Wed, 5 Jan 2022 16:45:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: remove extra wrappers around
 dpu_core_irq
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
CC:     Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        <freedreno@lists.freedesktop.org>
References: <20211126021809.1105535-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211126021809.1105535-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/25/2021 6:18 PM, Dmitry Baryshkov wrote:
> Remove extra dpu_irq_* wrappers from dpu_kms.c, merge them directly into
> dpu_core_irq_* functions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  | 12 ++++-----
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  9 ++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 27 +++----------------
>   3 files changed, 15 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> index 90ae6c9ccc95..7023ccb79814 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> @@ -10,24 +10,24 @@
>   
>   /**
>    * dpu_core_irq_preinstall - perform pre-installation of core IRQ handler
> - * @dpu_kms:		DPU handle
> + * @kms:		MSM KMS handle
>    * @return:		none
>    */
> -void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms);
> +void dpu_core_irq_preinstall(struct msm_kms *kms);
>   
>   /**
>    * dpu_core_irq_uninstall - uninstall core IRQ handler
> - * @dpu_kms:		DPU handle
> + * @kms:		MSM KMS handle
>    * @return:		none
>    */
> -void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms);
> +void dpu_core_irq_uninstall(struct msm_kms *kms);
>   
>   /**
>    * dpu_core_irq - core IRQ handler
> - * @dpu_kms:		DPU handle
> + * @kms:		MSM KMS handle
>    * @return:		interrupt handling status
>    */
> -irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms);
> +irqreturn_t dpu_core_irq(struct msm_kms *kms);
>   
>   /**
>    * dpu_core_irq_read - IRQ helper function for reading IRQ status
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index fc1b6c47c93d..d76edf55693a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -144,8 +144,9 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
>   			cb->func(cb->arg, irq_idx);
>   }
>   
> -irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
> +irqreturn_t dpu_core_irq(struct msm_kms *kms)
>   {
> +	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>   	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
>   	int reg_idx;
>   	int irq_idx;
> @@ -551,8 +552,9 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
>   }
>   #endif
>   
> -void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
> +void dpu_core_irq_preinstall(struct msm_kms *kms)
>   {
> +	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>   	int i;
>   
>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> @@ -571,8 +573,9 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
>   	}
>   }
>   
> -void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
> +void dpu_core_irq_uninstall(struct msm_kms *kms)
>   {
> +	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>   	int i;
>   
>   	if (!dpu_kms->hw_intr)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index a15b26428280..704474c4d655 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -784,20 +784,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
>   	msm_kms_destroy(&dpu_kms->base);
>   }
>   
> -static irqreturn_t dpu_irq(struct msm_kms *kms)
> -{
> -	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> -
> -	return dpu_core_irq(dpu_kms);
> -}
> -
> -static void dpu_irq_preinstall(struct msm_kms *kms)
> -{
> -	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> -
> -	dpu_core_irq_preinstall(dpu_kms);
> -}
> -
>   static int dpu_irq_postinstall(struct msm_kms *kms)
>   {
>   	struct msm_drm_private *priv;
> @@ -817,13 +803,6 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
>   	return 0;
>   }
>   
> -static void dpu_irq_uninstall(struct msm_kms *kms)
> -{
> -	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> -
> -	dpu_core_irq_uninstall(dpu_kms);
> -}
> -
>   static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_kms *kms)
>   {
>   	int i;
> @@ -871,10 +850,10 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   
>   static const struct msm_kms_funcs kms_funcs = {
>   	.hw_init         = dpu_kms_hw_init,
> -	.irq_preinstall  = dpu_irq_preinstall,
> +	.irq_preinstall  = dpu_core_irq_preinstall,
>   	.irq_postinstall = dpu_irq_postinstall,
> -	.irq_uninstall   = dpu_irq_uninstall,
> -	.irq             = dpu_irq,
> +	.irq_uninstall   = dpu_core_irq_uninstall,
> +	.irq             = dpu_core_irq,
>   	.enable_commit   = dpu_kms_enable_commit,
>   	.disable_commit  = dpu_kms_disable_commit,
>   	.vsync_time      = dpu_kms_vsync_time,
