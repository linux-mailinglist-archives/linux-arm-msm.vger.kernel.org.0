Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCD7A56930E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 22:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbiGFUIk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 16:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233594AbiGFUIj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 16:08:39 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5AF186E1
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 13:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657138117; x=1688674117;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=74hEYs1yke1EZnN5qpWy3hNyPVx8dSgIj31n5h5sLl8=;
  b=E28p9Irs50YCNbAHwQpAORUGnpnvW4FB8FnE4/KaPF4Ni5fmODby0dvg
   RVWt2EBOQJ+wrSWZ2lNhyi4UkCyq1xHnXRAQMwtLC83+c+4l591uLJ8eu
   HciyG1PaOkq2IvmCynTm1VTPEc5QcxnActgSpQeXkKHnFYHtDiN4lUpKY
   Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 06 Jul 2022 13:08:36 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 13:08:36 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Jul 2022 13:08:35 -0700
Received: from [10.111.163.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 6 Jul 2022
 13:08:33 -0700
Message-ID: <2c21491a-dd77-82b6-bf72-1aefaf05684a@quicinc.com>
Date:   Wed, 6 Jul 2022 13:08:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 1/3] drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220615125703.24647-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220615125703.24647-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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



On 6/15/2022 5:57 AM, Dmitry Baryshkov wrote:
> Remove loops over hw_vbif. Instead always VBIF's idx as an index in the
> array. This fixes an error in dpu_kms_hw_init(), where we fill
> dpu_kms->hw_vbif[i], but check for an error pointer at
> dpu_kms->hw_vbif[vbif_idx].
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 12 ++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 29 +++++++++++-------------
>   2 files changed, 18 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2b9d931474e0..1255d00c92cf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -830,12 +830,10 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
>   	_dpu_kms_mmu_destroy(dpu_kms);
>   
>   	if (dpu_kms->catalog) {
> -		for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
> -			u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
> -
> -			if ((vbif_idx < VBIF_MAX) && dpu_kms->hw_vbif[vbif_idx]) {
> -				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[vbif_idx]);
> -				dpu_kms->hw_vbif[vbif_idx] = NULL;
> +		for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
> +			if (dpu_kms->hw_vbif[i]) {
> +				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[i]);
> +				dpu_kms->hw_vbif[i] = NULL;
>   			}
>   		}
>   	}
> @@ -1135,7 +1133,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
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
