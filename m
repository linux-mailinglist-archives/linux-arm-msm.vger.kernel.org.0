Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2333F4B91C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 20:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238316AbiBPTwY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 14:52:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238301AbiBPTwX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 14:52:23 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3EDF5430;
        Wed, 16 Feb 2022 11:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645041131; x=1676577131;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=s93+vTrr5XzHX20s9O1Tt6/qzU2nq9cce8yMR5ijcqs=;
  b=sAg7Jf8//MVqmmmNlI+4GiUboKiPGpOOeIu4lYoCCy4noXMEH4IDbIL3
   kFQBN48ynf1Gh4kHj8IqCIYFskPfPYWudg1mkajBZD3s8RuuR1uWd0f6B
   89N+woB6i0BKG+fJjUbH8aNiVGS6E6CL8mQVpnlbu00f09K7lOo9iOxKy
   I=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 16 Feb 2022 11:52:11 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 11:52:10 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 11:52:10 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 16 Feb
 2022 11:52:05 -0800
Message-ID: <12ddd46b-5d7e-03f5-8376-16dc68189257@quicinc.com>
Date:   Wed, 16 Feb 2022 11:52:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Freedreno] [REPOST PATCH v4 06/13] drm/msm/disp/dpu1: Add DSC
 support in hw_ctl
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
CC:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Abhinav Kumar" <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <dri-devel@lists.freedesktop.org>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <freedreno@lists.freedesktop.org>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-7-vkoul@kernel.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220210103423.271016-7-vkoul@kernel.org>
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



On 2/10/2022 2:34 AM, Vinod Koul wrote:
> Later gens of hardware have DSC bits moved to hw_ctl, so configure these
> bits so that DSC would work there as well
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 11 ++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 ++
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 02da9ecf71f1..49659165cea8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -25,6 +25,8 @@
>   #define   CTL_MERGE_3D_ACTIVE           0x0E4
>   #define   CTL_INTF_ACTIVE               0x0F4
>   #define   CTL_MERGE_3D_FLUSH            0x100
> +#define   CTL_DSC_ACTIVE                0x0E8
> +#define   CTL_DSC_FLUSH                0x104
>   #define   CTL_INTF_FLUSH                0x110
>   #define   CTL_INTF_MASTER               0x134
>   #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
> @@ -34,6 +36,7 @@
>   
>   #define DPU_REG_RESET_TIMEOUT_US        2000
>   #define  MERGE_3D_IDX   23
> +#define  DSC_IDX        22
>   #define  INTF_IDX       31
>   #define CTL_INVALID_BIT                 0xffff
>   #define CTL_DEFAULT_GROUP_ID		0xf
> @@ -121,7 +124,6 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
>   
>   static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   {
> -
>   	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>   		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
>   				ctx->pending_merge_3d_flush_mask);
> @@ -506,6 +508,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
>   		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
>   
> +	if (cfg->dsc)
> +		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
> +
>   	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>   		mode_sel |= BIT(17);
>   
> @@ -517,6 +522,10 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if (cfg->merge_3d)
>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>   			      BIT(cfg->merge_3d - MERGE_3D_0));
> +	if (cfg->dsc) {
> +		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, cfg->dsc);
> +		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> +	}
>   }
>   
>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 806c171e5df2..9847c9c46d6f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -40,6 +40,7 @@ struct dpu_hw_stage_cfg {
>    * @merge_3d:              3d merge block used
>    * @intf_mode_sel:         Interface mode, cmd / vid
>    * @stream_sel:            Stream selection for multi-stream interfaces
> + * @dsc:                   DSC BIT masks
>    */
>   struct dpu_hw_intf_cfg {
>   	enum dpu_intf intf;
> @@ -47,6 +48,7 @@ struct dpu_hw_intf_cfg {
>   	enum dpu_merge_3d merge_3d;
>   	enum dpu_ctl_mode_sel intf_mode_sel;
>   	int stream_sel;
> +	unsigned int dsc;
>   };
>   
>   /**
