Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4394B7B2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 00:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243989AbiBOX1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 18:27:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbiBOX1a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 18:27:30 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3B42B27B
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 15:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644967639; x=1676503639;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/DbwMD1GlQmklMwdkj6uakJWR/imPHhcyGhcMbTG7Cg=;
  b=yQ7PPXMnZ8OBCaVb3jvPcMoF8qbZnZn05UW99c2SP/va9oefQ9QgGSsD
   SY5t2jLkcMof8IOPIRl4qCU/TEZB9gxGayHnuULi3VK22nhay2H92Xlh0
   zEY4jeGbsMaT9lnNBUojOeRfi/SKOmB0eT7HHdsB6zAvYh5USUrXnUNVP
   Y=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Feb 2022 15:27:19 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 15:27:18 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 15:27:18 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 15 Feb
 2022 15:27:16 -0800
Message-ID: <8f7ff3b9-c426-8228-8c8d-42eefba95b56@quicinc.com>
Date:   Tue, 15 Feb 2022 15:27:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/6] drm/msm/dpu: remove always-true argument of
 dpu_core_irq_read()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     David Airlie <airlied@linux.ie>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        <freedreno@lists.freedesktop.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
 <20220201151056.2480055-3-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220201151056.2480055-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/1/2022 7:10 AM, Dmitry Baryshkov wrote:
> The argument clear of the function dpu_core_irq_read() is always true.
> Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h      | 4 +---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 4 ++--
>   3 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> index 7023ccb79814..6dce5d89f817 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> @@ -33,13 +33,11 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms);
>    * dpu_core_irq_read - IRQ helper function for reading IRQ status
>    * @dpu_kms:		DPU handle
>    * @irq_idx:		irq index
> - * @clear:		True to clear the irq after read
>    * @return:		non-zero if irq detected; otherwise no irq detected
>    */
>   u32 dpu_core_irq_read(
>   		struct dpu_kms *dpu_kms,
> -		int irq_idx,
> -		bool clear);
> +		int irq_idx);
>   
>   /**
>    * dpu_core_irq_register_callback - For registering callback function on IRQ
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1e648db439f9..5576b8a3e6ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -301,8 +301,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>   			wait_info);
>   
>   	if (ret <= 0) {
> -		irq_status = dpu_core_irq_read(phys_enc->dpu_kms,
> -				irq->irq_idx, true);
> +		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq->irq_idx);
>   		if (irq_status) {
>   			unsigned long flags;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 71882d3fe705..85404c9ab4e1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -357,7 +357,7 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
>   	wmb();
>   }
>   
> -u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
> +u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
>   {
>   	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
>   	int reg_idx;
> @@ -384,7 +384,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
>   	intr_status = DPU_REG_READ(&intr->hw,
>   			dpu_intr_set[reg_idx].status_off) &
>   		DPU_IRQ_MASK(irq_idx);
> -	if (intr_status && clear)
> +	if (intr_status)
>   		DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
>   				intr_status);
>   
