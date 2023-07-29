Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C49767A88
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 03:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237067AbjG2BLX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 21:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235833AbjG2BLW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 21:11:22 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C79435A5
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 18:11:21 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36SNfs52031718;
        Sat, 29 Jul 2023 01:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UWsGmsJb3Fzw/lgOq0BQ3++Iwqp1MJeniobuGbmbC9I=;
 b=iwASIXv16WtByPmXorqpTOQnnLGzPcXVD3TO77w9E4Eci1D59BB4ht73Gz2s12fCPcLt
 wa9poZFK9FxT8BP3PIiwcJsDLyLGLHFAAtwHDBoFJJbZEGKN4ZI50U2zmQ9cgF7NrhKT
 /h6nbwOrw04/AjWUK4gfaxw0iBq2FRLSgNG+Kwh4YW56jgDaaWaDvNaskP894suxV65t
 IHWwVa8Lzq2P/uz4v0hLmBomnuwUWs4QxNEhHTIi8gU8oF9eULsJxK4PPQAG3T8Q4KDe
 80a/SYKzcrZCBcJlviasUtJuS4fJqW9tVM/wPrvSwmI2ZU4XzUeBa+JAmqT0JQBFRPcI dg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s46ttj8ut-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 29 Jul 2023 01:11:12 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36T1BB48029792
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 29 Jul 2023 01:11:11 GMT
Received: from [10.110.51.188] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 28 Jul
 2023 18:11:10 -0700
Message-ID: <4705e582-1fcb-cf5a-a05d-cf2c76c38253@quicinc.com>
Date:   Fri, 28 Jul 2023 18:11:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
 <20230707231251.3849701-13-dmitry.baryshkov@linaro.org>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230707231251.3849701-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jnMUhHDuZRQ4tqd4vA3zoGHE4EWmLIMK
X-Proofpoint-GUID: jnMUhHDuZRQ4tqd4vA3zoGHE4EWmLIMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307290009
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/7/2023 4:12 PM, Dmitry Baryshkov wrote:
> Drop the dpu_encoder_phys_ops' destroy() callback. No phys backend
> implements it anymore, so it is useless.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    | 18 ------------------
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  2 --
>   2 files changed, 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 7c2cd9ce8acd..b42176ce4a3a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -456,24 +456,6 @@ static void dpu_encoder_destroy(struct drm_encoder *drm_enc)
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   	DPU_DEBUG_ENC(dpu_enc, "\n");
>   
> -	mutex_lock(&dpu_enc->enc_lock);
> -
> -	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> -		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> -
> -		if (phys->ops.destroy) {
> -			phys->ops.destroy(phys);
> -			--dpu_enc->num_phys_encs;
> -			dpu_enc->phys_encs[i] = NULL;
> -		}
> -	}
> -
> -	if (dpu_enc->num_phys_encs)
> -		DPU_ERROR_ENC(dpu_enc, "expected 0 num_phys_encs not %d\n",
> -				dpu_enc->num_phys_encs);
> -	dpu_enc->num_phys_encs = 0;
> -	mutex_unlock(&dpu_enc->enc_lock);
> -
>   	drm_encoder_cleanup(drm_enc);
>   	mutex_destroy(&dpu_enc->enc_lock);
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 4fb0d95f3061..757ce58f958b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -72,7 +72,6 @@ struct dpu_encoder_phys;
>    * @enable:			DRM Call. Enable a DRM mode.
>    * @disable:			DRM Call. Disable mode.
>    * @atomic_check:		DRM Call. Atomic check new DRM state.
> - * @destroy:			DRM Call. Destroy and release resources.
>    * @control_vblank_irq		Register/Deregister for VBLANK IRQ
>    * @wait_for_commit_done:	Wait for hardware to have flushed the
>    *				current pending frames to hardware
> @@ -102,7 +101,6 @@ struct dpu_encoder_phys_ops {
>   	int (*atomic_check)(struct dpu_encoder_phys *encoder,
>   			    struct drm_crtc_state *crtc_state,
>   			    struct drm_connector_state *conn_state);
> -	void (*destroy)(struct dpu_encoder_phys *encoder);
>   	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
>   	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
>   	int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);
> -- 
> 2.39.2
> 
