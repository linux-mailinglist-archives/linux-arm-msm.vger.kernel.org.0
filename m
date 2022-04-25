Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8029950E994
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 21:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244974AbiDYTjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 15:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244972AbiDYTjS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 15:39:18 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB5C11115B
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 12:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1650915373; x=1682451373;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ttkPKv7KBRScQdqSGu+qI/lFMgzvkwKDjLvYQ4ASrfM=;
  b=C5YGMxvzr8/rP0X33C38R+lf0uT0EDyQpH4/vr9uvRN5V+JHX+IL6QIw
   oWePnfyckSzNYCCIS6cIqgDLoFNoGfxvFt97fqSnUbMov7hph4BwRMKFr
   0lfctqHvVT8P+SS0NHp3n1npK4iKpDWKu8MIOe25RR39UVFHZ8ulkCQrE
   w=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Apr 2022 12:36:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 12:36:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Apr 2022 12:36:12 -0700
Received: from [10.111.165.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 25 Apr
 2022 12:36:10 -0700
Message-ID: <041366dc-88a6-bb74-2b69-796988421806@quicinc.com>
Date:   Mon, 25 Apr 2022 12:36:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <quic_vpolimer@quicinc.com>
References: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
 <20220419162030.1287562-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220419162030.1287562-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Vinod

Hi Dmitry

Can we also absorb https://patchwork.freedesktop.org/patch/483255/ into 
this change?

Looks like they are touching the same code and can be absorbed easily.

Thanks

Abhinav


On 4/19/2022 9:20 AM, Dmitry Baryshkov wrote:
> Remove loops over hw_vbif. Instead always VBIF's idx as an index in the
> array. This fixes an error in dpu_kms_hw_init(), where we fill
> dpu_kms->hw_vbif[i], but check for an error pointer at
> dpu_kms->hw_vbif[vbif_idx].
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 10 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 29 +++++++++++-------------
>   2 files changed, 17 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e29796c4f27b..aadf032a190b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -790,11 +790,9 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
>   	_dpu_kms_mmu_destroy(dpu_kms);
>   
>   	if (dpu_kms->catalog) {
> -		for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
> -			u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
> -
> -			if ((vbif_idx < VBIF_MAX) && dpu_kms->hw_vbif[vbif_idx])
> -				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[vbif_idx]);
> +		for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
> +			if (dpu_kms->hw_vbif[i])
> +				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[i]);
>   		}
>   	}
>   
> @@ -1102,7 +1100,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
>   		u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
>   
> -		dpu_kms->hw_vbif[i] = dpu_hw_vbif_init(vbif_idx,
> +		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
>   				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
>   		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
>   			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> index 21d20373eb8b..a18fb649301c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> @@ -11,6 +11,14 @@
>   #include "dpu_hw_vbif.h"
>   #include "dpu_trace.h"
>   
> +static struct dpu_hw_vbif *dpu_get_vbif(struct dpu_kms *dpu_kms, enum dpu_vbif vbif_idx)
> +{
> +	if (vbif_idx < ARRAY_SIZE(dpu_kms->hw_vbif))
> +		return dpu_kms->hw_vbif[vbif_idx];
> +
> +	return NULL;
> +}
> +
>   /**
>    * _dpu_vbif_wait_for_xin_halt - wait for the xin to halt
>    * @vbif:	Pointer to hardware vbif driver
> @@ -148,20 +156,15 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
>   void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
>   		struct dpu_vbif_set_ot_params *params)
>   {
> -	struct dpu_hw_vbif *vbif = NULL;
> +	struct dpu_hw_vbif *vbif;
>   	struct dpu_hw_mdp *mdp;
>   	bool forced_on = false;
>   	u32 ot_lim;
> -	int ret, i;
> +	int ret;
>   
>   	mdp = dpu_kms->hw_mdp;
>   
> -	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
> -		if (dpu_kms->hw_vbif[i] &&
> -				dpu_kms->hw_vbif[i]->idx == params->vbif_idx)
> -			vbif = dpu_kms->hw_vbif[i];
> -	}
> -
> +	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
>   	if (!vbif || !mdp) {
>   		DRM_DEBUG_ATOMIC("invalid arguments vbif %d mdp %d\n",
>   				vbif != NULL, mdp != NULL);
> @@ -204,7 +207,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
>   void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
>   		struct dpu_vbif_set_qos_params *params)
>   {
> -	struct dpu_hw_vbif *vbif = NULL;
> +	struct dpu_hw_vbif *vbif;
>   	struct dpu_hw_mdp *mdp;
>   	bool forced_on = false;
>   	const struct dpu_vbif_qos_tbl *qos_tbl;
> @@ -216,13 +219,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
>   	}
>   	mdp = dpu_kms->hw_mdp;
>   
> -	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
> -		if (dpu_kms->hw_vbif[i] &&
> -				dpu_kms->hw_vbif[i]->idx == params->vbif_idx) {
> -			vbif = dpu_kms->hw_vbif[i];
> -			break;
> -		}
> -	}
> +	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
>   
>   	if (!vbif || !vbif->cap) {
>   		DPU_ERROR("invalid vbif %d\n", params->vbif_idx);
