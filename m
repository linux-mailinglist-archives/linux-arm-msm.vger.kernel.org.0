Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2CC2519024
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 23:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242914AbiECVii (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 17:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiECVii (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 17:38:38 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62892F03B
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 14:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651613701; x=1683149701;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=b4/Uh/Pw2Zu7mxF1EPADNd1UTadTaPNoZ7cI7q3eRGw=;
  b=yk//w5CJutMbbOEH7rs2Basruuvj8ND1ZOAofB5fgczL0piLGGo1KINE
   cX+EWLrDVMi6jaYOQsx/tqvUL3Pho4vEtSm24GdkdSwhQ85wgxbpapEmf
   wU7k0SjnBaJ9ZupxlI6lE6CPNNAtwq1YVfTbY27XtRwreKhDAD1hokgKr
   8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 03 May 2022 14:35:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 14:35:00 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 3 May 2022 14:34:59 -0700
Received: from [10.38.244.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 3 May 2022
 14:34:57 -0700
Message-ID: <df93e33b-fa5a-af29-1be5-76262a17ce0a@quicinc.com>
Date:   Tue, 3 May 2022 14:34:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 04/25] drm/msm/dpu: move SSPP debugfs creation to
 dpu_kms.c
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-5-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220209172520.3719906-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/9/2022 9:24 AM, Dmitry Baryshkov wrote:
> As SSPP blocks are now visible through dpu_kms->rm.sspp_blocks, move
> SSPP debugfs creation from dpu_plane to dpu_kms.
> 

Change is fine by itself, but is it really needed?
Wouldnt it be better to keep dpu_debugfs_sspp_init in dpu_plane.c?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 19 +++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 16 ----------------
>   3 files changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index f805c30643b1..674f311f99b4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -415,7 +415,6 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
>    */
>   void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx);
>   
> -void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root);
>   int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct dpu_kms *kms, struct dentry *entry);
>   
>   #endif /*_DPU_HW_SSPP_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 4d2b75f3bc89..8196b11fe2f3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -259,6 +259,25 @@ void dpu_debugfs_create_regset32(const char *name, umode_t mode,
>   	debugfs_create_file(name, mode, parent, regset, &dpu_fops_regset32);
>   }
>   
> +static void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
> +{
> +	struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
> +	int i;
> +
> +	if (IS_ERR(entry))
> +		return;
> +
> +	for (i = SSPP_NONE; i < SSPP_MAX; i++) {
> +		struct dpu_hw_pipe *pipe_hw;
> +
> +		if (!dpu_kms->rm.sspp_blks[i - SSPP_NONE])
> +			continue;
> +
> +		pipe_hw = to_dpu_hw_pipe(dpu_kms->rm.sspp_blks[i - SSPP_NONE]);
> +		_dpu_hw_sspp_init_debugfs(pipe_hw, dpu_kms, entry);
> +	}
> +}
> +
>   static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
>   {
>   	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 146dbccd79cd..37742f74a7bf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1359,22 +1359,6 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
>   	_dpu_plane_set_qos_ctrl(plane, enable, DPU_PLANE_QOS_PANIC_CTRL);
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }
> -
> -/* SSPP live inside dpu_plane private data only. Enumerate them here. */
> -void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
> -{
> -	struct drm_plane *plane;
> -	struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
> -
> -	if (IS_ERR(entry))
> -		return;
> -
> -	drm_for_each_plane(plane, dpu_kms->dev) {
> -		struct dpu_plane *pdpu = to_dpu_plane(plane);
> -
> -		_dpu_hw_sspp_init_debugfs(pdpu->pipe_hw, dpu_kms, entry);
> -	}
> -}
>   #endif
>   
>   static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
