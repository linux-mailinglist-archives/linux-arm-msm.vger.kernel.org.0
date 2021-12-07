Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA4246C3D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 20:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbhLGTr2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 14:47:28 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:42707 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229505AbhLGTr2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 14:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1638906237; x=1670442237;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YTR5C36Iv0NLbFAwWr/Auteyk2sC+GCNuQxQ9IhJNig=;
  b=L7ur2+kN+st0vWhq7B5A32AiDKVkYYaXWIw7ZMvWd3x4zAkbWyO8vn6p
   TT2hIp97a3mWL/i+NXj/myvvyBt0hlNWlnbvhkhaEIKecYgzCEitQke2k
   VM8w14d7wOSRIML1wRXqAp7SOVMTjBZEZaEr/gswdsSdYcRoNLTqZMWo8
   Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Dec 2021 11:43:57 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 11:43:57 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 11:43:56 -0800
Received: from [10.111.164.126] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 7 Dec 2021
 11:43:54 -0800
Message-ID: <1f7b374f-6231-ddde-0518-9f43e12d580f@quicinc.com>
Date:   Tue, 7 Dec 2021 11:43:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 2/4] drm/msm/dpu: drop pe argument from
 _dpu_hw_sspp_setup_scaler3
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
CC:     Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        <freedreno@lists.freedesktop.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
 <20211201225140.2481577-3-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211201225140.2481577-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Dan C for awareness as this is a follow up of our discussion on
https://lore.kernel.org/linux-arm-msm/c1537b326b654f05be247ca61d21e9f0@codeaurora.org/T/

On 12/1/2021 2:51 PM, Dmitry Baryshkov wrote:
> The _dpu_hw_sspp_setup_scaler3 (hw_sspp->setup_scaler) does not use pe
> argument. Let's remove it while we are cleaning scaled configuration.
> 
Thanks for pushing this.

This was originally reported by Dan Carpenter.

Hence, please add the Reported-by tag for Dan on this (Dan Carpenter 
<dan.carpenter@oracle.com> )


Apart from that,
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 2 +-
>   3 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index d77eb7da5daf..7235605bfc9e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -413,13 +413,11 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_pipe *ctx,
>   
>   static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
>   		struct dpu_hw_pipe_cfg *sspp,
> -		struct dpu_hw_pixel_ext *pe,
>   		void *scaler_cfg)
>   {
>   	u32 idx;
>   	struct dpu_hw_scaler3_cfg *scaler3_cfg = scaler_cfg;
>   
> -	(void)pe;
>   	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
>   		|| !scaler3_cfg)
>   		return;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index e8939d7387cb..ad2002d75739 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -334,12 +334,10 @@ struct dpu_hw_sspp_ops {
>   	 * setup_scaler - setup scaler
>   	 * @ctx: Pointer to pipe context
>   	 * @pipe_cfg: Pointer to pipe configuration
> -	 * @pe_cfg: Pointer to pixel extension configuration
>   	 * @scaler_cfg: Pointer to scaler configuration
>   	 */
>   	void (*setup_scaler)(struct dpu_hw_pipe *ctx,
>   		struct dpu_hw_pipe_cfg *pipe_cfg,
> -		struct dpu_hw_pixel_ext *pe_cfg,
>   		void *scaler_cfg);
>   
>   	/**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 4c373abbe89c..c7b065b14c5c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -688,7 +688,7 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>   	if (pdpu->pipe_hw->ops.setup_scaler &&
>   			pstate->multirect_index != DPU_SSPP_RECT_1)
>   		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
> -				pipe_cfg, &pixel_ext,
> +				pipe_cfg,
>   				&scaler3_cfg);
>   }
>   
> 
