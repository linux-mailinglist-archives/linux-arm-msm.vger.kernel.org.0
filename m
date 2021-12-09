Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B4146F5A9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 22:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232631AbhLIVPa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 16:15:30 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:5596 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232400AbhLIVP3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 16:15:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1639084315; x=1670620315;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bxqcNgelakS2Sn/VK9ZIj3BlsM3fX3wAeAOn9QccZzU=;
  b=ZZ5IC0tDpn3/otZ06qHYb7i8Z8AG8S5L9P6+WjYOjTKntk+vgDGBTPNF
   ZkNlkYOU1LVjipqaD4U6fmh7hWR8cwAuVtbWmiBgn6lworKzpp2TY/+gj
   INXJzSL9gtHfqMI7N3ClM5upNwPF2OzcR3NxqNPMzXc4fMuDASXRBFD+K
   o=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Dec 2021 13:11:55 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 13:11:54 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 9 Dec 2021 13:11:54 -0800
Received: from [10.111.171.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 9 Dec 2021
 13:11:52 -0800
Message-ID: <ebb421f7-2f6f-4cd8-3faa-3e2dd4561fc9@quicinc.com>
Date:   Thu, 9 Dec 2021 13:11:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v1 6/8] drm/msm/dpu: stop manually removing
 debugfs files for the DPU CRTC
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
CC:     Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        <freedreno@lists.freedesktop.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
 <20211201222633.2476780-7-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211201222633.2476780-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/1/2021 2:26 PM, Dmitry Baryshkov wrote:
> DRM code handles removing all debugfs recursively. Drop CRTC-specific
> code to perform that.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  3 ---
>   2 files changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index d290809d59bd..9899f7424131 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1424,15 +1424,16 @@ DEFINE_SHOW_ATTRIBUTE(dpu_crtc_debugfs_state);
>   static int _dpu_crtc_init_debugfs(struct drm_crtc *crtc)
>   {
>   	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +	struct dentry *debugfs_root;
>   
> -	dpu_crtc->debugfs_root = debugfs_create_dir(dpu_crtc->name,
> +	debugfs_root = debugfs_create_dir(dpu_crtc->name,
>   			crtc->dev->primary->debugfs_root);
>   
>   	debugfs_create_file("status", 0400,
> -			dpu_crtc->debugfs_root,
> +			debugfs_root,
>   			dpu_crtc, &_dpu_debugfs_status_fops);
>   	debugfs_create_file("state", 0600,
> -			dpu_crtc->debugfs_root,
> +			debugfs_root,
>   			&dpu_crtc->base,
>   			&dpu_crtc_debugfs_state_fops);
>   
> @@ -1450,13 +1451,6 @@ static int dpu_crtc_late_register(struct drm_crtc *crtc)
>   	return _dpu_crtc_init_debugfs(crtc);
>   }
>   
> -static void dpu_crtc_early_unregister(struct drm_crtc *crtc)
> -{
> -	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> -
> -	debugfs_remove_recursive(dpu_crtc->debugfs_root);
> -}
> -
>   static const struct drm_crtc_funcs dpu_crtc_funcs = {
>   	.set_config = drm_atomic_helper_set_config,
>   	.destroy = dpu_crtc_destroy,
> @@ -1465,7 +1459,6 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
>   	.atomic_duplicate_state = dpu_crtc_duplicate_state,
>   	.atomic_destroy_state = dpu_crtc_destroy_state,
>   	.late_register = dpu_crtc_late_register,
> -	.early_unregister = dpu_crtc_early_unregister,
>   	.verify_crc_source = dpu_crtc_verify_crc_source,
>   	.set_crc_source = dpu_crtc_set_crc_source,
>   	.enable_vblank  = msm_crtc_enable_vblank,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 4328e133d71c..b8785c394fcc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -129,7 +129,6 @@ struct dpu_crtc_frame_event {
>    * @drm_requested_vblank : Whether vblanks have been enabled in the encoder
>    * @property_info : Opaque structure for generic property support
>    * @property_defaults : Array of default values for generic property support
> - * @debugfs_root  : Parent of debugfs node
>    * @vblank_cb_count : count of vblank callback since last reset
>    * @play_count    : frame count between crtc enable and disable
>    * @vblank_cb_time  : ktime at vblank count reset
> @@ -160,8 +159,6 @@ struct dpu_crtc {
>   	struct drm_pending_vblank_event *event;
>   	u32 vsync_count;
>   
> -	struct dentry *debugfs_root;
> -
>   	u32 vblank_cb_count;
>   	u64 play_count;
>   	ktime_t vblank_cb_time;
> 
