Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B93D6F8779
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 19:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbjEERWQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 13:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjEERWP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 13:22:15 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5C2B2
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 10:22:12 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 345CHTkG021048;
        Fri, 5 May 2023 17:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yYQ2k8ixNSa0jrL4YSbI16DV5cv5/OWNXpSWyKWz9yY=;
 b=NN90+EY9JPZOiWtSaISMIfMGPfqXjNa0efx8DDawX2Y8+tzU4XZ9Gz+F4eJWXcTsO03g
 66agLuMQ4Vyp4Q+QM+ISFS7W7Ev5U1ZzQokQNBhz4IVkfoZQihd7d3L4XHlbAq/oxPyQ
 5BQjuVqdiRU/vaqj+DjJ5gNvLUSE/dT+SJibPSEYi5dZHQe6hzwifVxAhtwaSnCNjtZM
 X8EB6cPeP2k1W7s+Zc2nZ3XWDgVFYrEtJOdJMG705RfQ+7sQj5Mvzh8H/q603DOryzcO
 5gcurZGxF/dg4PM4DzjXvDagKtcnxCt4u85vsti0dlDo0sKx6vMGYXmdhWheOEBO2+J4 Qg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qcf24k0fp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 May 2023 17:22:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 345HM1Ge011719
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 5 May 2023 17:22:01 GMT
Received: from [10.110.37.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 5 May 2023
 10:22:01 -0700
Message-ID: <58f581c0-3e6c-50c4-d0da-c2c3766c3847@quicinc.com>
Date:   Fri, 5 May 2023 10:22:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH v2 9/9] drm/msm/dpu: use common helper for WB
 and SSPP QoS setup
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        "Stephen Boyd" <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
 <20230502150533.3672840-10-dmitry.baryshkov@linaro.org>
From:   Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230502150533.3672840-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bjI0TNGxZXiHTcjdwRRs6bzY-w-wfaSI
X-Proofpoint-GUID: bjI0TNGxZXiHTcjdwRRs6bzY-w-wfaSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_23,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050143
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/2/2023 8:05 AM, Dmitry Baryshkov wrote:
> Rework SSPP and WB code to use common helper for programming QoS
> settings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 31 ++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 19 +----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   | 31 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   | 21 +++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     | 29 +------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     | 16 +---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 85 +++++++------------
>   8 files changed, 100 insertions(+), 136 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index e7b65f6f53d6..023a9c4ad1db 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -102,7 +102,7 @@ static void dpu_encoder_phys_wb_set_qos_remap(
>   static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
>   {
>   	struct dpu_hw_wb *hw_wb;
> -	struct dpu_hw_wb_qos_cfg qos_cfg;
> +	struct dpu_hw_qos_cfg qos_cfg;
>   	const struct dpu_mdss_cfg *catalog;
>   	const struct dpu_qos_lut_tbl *qos_lut_tb;
>   
> @@ -115,7 +115,7 @@ static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
>   
>   	hw_wb = phys_enc->hw_wb;
>   
> -	memset(&qos_cfg, 0, sizeof(struct dpu_hw_wb_qos_cfg));
> +	memset(&qos_cfg, 0, sizeof(struct dpu_hw_qos_cfg));
>   	qos_cfg.danger_safe_en = true;
>   	qos_cfg.danger_lut =
>   		catalog->perf->danger_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 2533c4629021..c35e9faf2460 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -541,30 +541,15 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
>   				color);
>   }
>   
> -static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_sspp *ctx,
> -			u32 danger_lut,
> -			u32 safe_lut)
> +static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
> +				      struct dpu_hw_qos_cfg *cfg)
>   {
> -	if (!ctx)
> -		return;
> -
> -	DPU_REG_WRITE(&ctx->hw, SSPP_DANGER_LUT, danger_lut);
> -	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT, safe_lut);
> -}
> -
> -static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_sspp *ctx,
> -			u64 creq_lut)
> -{
> -	if (!ctx)
> +	if (!ctx || !cfg)
>   		return;
>   
> -	if (ctx->cap && test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features)) {
> -		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_0, creq_lut);
> -		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_1,
> -				creq_lut >> 32);
> -	} else {
> -		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT, creq_lut);
> -	}
> +	_dpu_hw_setup_qos_lut(&ctx->hw, SSPP_DANGER_LUT,
> +			      test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features),
> +			      cfg);
>   }
>   
>   static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
> @@ -606,9 +591,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
>   	c->ops.setup_pe = dpu_hw_sspp_setup_pe_config;
>   
>   	if (test_bit(DPU_SSPP_QOS, &features)) {
> -		c->ops.setup_danger_safe_lut =
> -			dpu_hw_sspp_setup_danger_safe_lut;
> -		c->ops.setup_creq_lut = dpu_hw_sspp_setup_creq_lut;
> +		c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut;
>   		c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl;
>   	}
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 4278c421b6ac..085f34bc6b88 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -254,25 +254,14 @@ struct dpu_hw_sspp_ops {
>   	void (*setup_sharpening)(struct dpu_hw_sspp *ctx,
>   			struct dpu_hw_sharp_cfg *cfg);
>   
> -	/**
> -	 * setup_danger_safe_lut - setup danger safe LUTs
> -	 * @ctx: Pointer to pipe context
> -	 * @danger_lut: LUT for generate danger level based on fill level
> -	 * @safe_lut: LUT for generate safe level based on fill level
> -	 *
> -	 */
> -	void (*setup_danger_safe_lut)(struct dpu_hw_sspp *ctx,
> -			u32 danger_lut,
> -			u32 safe_lut);
>   
>   	/**
> -	 * setup_creq_lut - setup CREQ LUT
> +	 * setup_qos_lut - setup QoS LUTs
>   	 * @ctx: Pointer to pipe context
> -	 * @creq_lut: LUT for generate creq level based on fill level
> -	 *
> +	 * @cfg: LUT configuration
>   	 */
> -	void (*setup_creq_lut)(struct dpu_hw_sspp *ctx,
> -			u64 creq_lut);
> +	void (*setup_qos_lut)(struct dpu_hw_sspp *ctx,
> +			struct dpu_hw_qos_cfg *cfg);
>   
>   	/**
>   	 * setup_qos_ctrl - setup QoS control
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index 95d20b9a3f2f..9d2273fd2fed 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -73,6 +73,19 @@ static u32 dpu_hw_util_log_mask = DPU_DBG_MASK_NONE;
>   #define QSEED3LITE_SEP_LUT_SIZE \
>   	        (QSEED3LITE_LUT_SIZE * QSEED3LITE_SEPARABLE_LUTS * sizeof(u32))
>   
> +/* QOS_LUT */
> +#define QOS_DANGER_LUT                    0x00
> +#define QOS_SAFE_LUT                      0x04
> +#define QOS_CREQ_LUT                      0x08
> +#define QOS_QOS_CTRL                      0x0C
> +#define QOS_CREQ_LUT_0                    0x14
> +#define QOS_CREQ_LUT_1                    0x18
> +
> +/* QOS_QOS_CTRL */
> +#define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> +#define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> +#define QOS_QOS_CTRL_VBLANK_EN            BIT(16)
> +#define QOS_QOS_CTRL_CREQ_VBLANK_MASK     GENMASK(21, 20)
>   
>   void dpu_reg_write(struct dpu_hw_blk_reg_map *c,
>   		u32 reg_off,
> @@ -450,6 +463,24 @@ u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
>   	return 0;
>   }
>   
> +void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> +			   bool qos_8lvl,
> +			   const struct dpu_hw_qos_cfg *cfg)
> +{
> +	DPU_REG_WRITE(c, offset + QOS_DANGER_LUT, cfg->danger_lut);
> +	DPU_REG_WRITE(c, offset + QOS_SAFE_LUT, cfg->safe_lut);
> +
> +	if (qos_8lvl) {
> +		DPU_REG_WRITE(c, offset + QOS_CREQ_LUT_0, cfg->creq_lut);
> +		DPU_REG_WRITE(c, offset + QOS_CREQ_LUT_1, cfg->creq_lut >> 32);
> +	} else {
> +		DPU_REG_WRITE(c, offset + QOS_CREQ_LUT, cfg->creq_lut);
> +	}
> +
> +	DPU_REG_WRITE(c, offset + QOS_QOS_CTRL,
> +		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> +}
> +
>   void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>   		u32 misr_ctrl_offset,
>   		bool enable, u32 frame_count)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index dc6e3b795aef..1f6079f47071 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -305,6 +305,23 @@ struct dpu_drm_scaler_v2 {
>   	struct dpu_drm_de_v1 de;
>   };
>   
> +/**
> + * struct dpu_hw_qos_cfg: pipe QoS configuration
> + * @danger_lut: LUT for generate danger level based on fill level
> + * @safe_lut: LUT for generate safe level based on fill level
> + * @creq_lut: LUT for generate creq level based on fill level
> + * @creq_vblank: creq value generated to vbif during vertical blanking
> + * @danger_vblank: danger value generated during vertical blanking
> + * @vblank_en: enable creq_vblank and danger_vblank during vblank
> + * @danger_safe_en: enable danger safe generation
> + */
> +struct dpu_hw_qos_cfg {
> +	u32 danger_lut;
> +	u32 safe_lut;
> +	u64 creq_lut;
> +	bool danger_safe_en;
> +};
> +
>   u32 *dpu_hw_util_get_log_mask_ptr(void);
>   
>   void dpu_reg_write(struct dpu_hw_blk_reg_map *c,
> @@ -336,6 +353,10 @@ void dpu_setup_cdp(struct dpu_hw_blk_reg_map *c, u32 offset,
>   u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
>   		u32 total_fl);
>   
> +void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> +			   bool qos_8lvl,
> +			   const struct dpu_hw_qos_cfg *cfg);
> +
>   void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>   		u32 misr_ctrl_offset,
>   		bool enable,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index a6de4b82a188..dcffd6cc47fc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -49,9 +49,6 @@
>   #define WB_OUT_IMAGE_SIZE                     0x2C0
>   #define WB_OUT_XY                             0x2C4
>   
> -/* WB_QOS_CTRL */
> -#define WB_QOS_CTRL_DANGER_SAFE_EN            BIT(0)
> -
>   static void dpu_hw_wb_setup_outaddress(struct dpu_hw_wb *ctx,
>   		struct dpu_hw_wb_cfg *data)
>   {
> @@ -135,32 +132,14 @@ static void dpu_hw_wb_roi(struct dpu_hw_wb *ctx, struct dpu_hw_wb_cfg *wb)
>   }
>   
>   static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
> -		struct dpu_hw_wb_qos_cfg *cfg)
> +		struct dpu_hw_qos_cfg *cfg)
>   {
> -	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> -	u32 qos_ctrl = 0;
> -
>   	if (!ctx || !cfg)
>   		return;
>   
> -	DPU_REG_WRITE(c, WB_DANGER_LUT, cfg->danger_lut);
> -	DPU_REG_WRITE(c, WB_SAFE_LUT, cfg->safe_lut);
> -
> -	/*
> -	 * for chipsets not using DPU_WB_QOS_8LVL but still using DPU
> -	 * driver such as msm8998, the reset value of WB_CREQ_LUT is
> -	 * sufficient for writeback to work. SW doesn't need to explicitly
> -	 * program a value.
> -	 */
> -	if (ctx->caps && test_bit(DPU_WB_QOS_8LVL, &ctx->caps->features)) {
> -		DPU_REG_WRITE(c, WB_CREQ_LUT_0, cfg->creq_lut);
> -		DPU_REG_WRITE(c, WB_CREQ_LUT_1, cfg->creq_lut >> 32);
> -	}
> -
> -	if (cfg->danger_safe_en)
> -		qos_ctrl |= WB_QOS_CTRL_DANGER_SAFE_EN;
> -
> -	DPU_REG_WRITE(c, WB_QOS_CTRL, qos_ctrl);
> +	_dpu_hw_setup_qos_lut(&ctx->hw, WB_DANGER_LUT,
> +			      test_bit(DPU_WB_QOS_8LVL, &ctx->caps->features),
> +			      cfg);
>   }
>   
>   static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> index ab3541856258..c7f792eeb55c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> @@ -21,20 +21,6 @@ struct dpu_hw_wb_cfg {
>   	struct drm_rect crop;
>   };
>   
> -/**
> - * struct dpu_hw_wb_qos_cfg : Writeback pipe QoS configuration
> - * @danger_lut: LUT for generate danger level based on fill level
> - * @safe_lut: LUT for generate safe level based on fill level
> - * @creq_lut: LUT for generate creq level based on fill level
> - * @danger_safe_en: enable danger safe generation
> - */
> -struct dpu_hw_wb_qos_cfg {
> -	u32 danger_lut;
> -	u32 safe_lut;
> -	u64 creq_lut;
> -	bool danger_safe_en;
> -};
> -
>   /**
>    *
>    * struct dpu_hw_wb_ops : Interface to the wb hw driver functions
> @@ -56,7 +42,7 @@ struct dpu_hw_wb_ops {
>   			struct dpu_hw_wb_cfg *wb);
>   
>   	void (*setup_qos_lut)(struct dpu_hw_wb *ctx,
> -			struct dpu_hw_wb_qos_cfg *cfg);
> +			struct dpu_hw_qos_cfg *cfg);
>   
>   	void (*setup_cdp)(struct dpu_hw_wb *ctx,
>   			  const struct dpu_format *fmt,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c8837d0aa0c3..d66745115917 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -190,12 +190,14 @@ static u64 _dpu_plane_calc_clk(const struct drm_display_mode *mode,
>    * _dpu_plane_calc_fill_level - calculate fill level of the given source format
>    * @plane:		Pointer to drm plane
>    * @pipe:		Pointer to software pipe
> + * @lut_usage:		LUT usecase
>    * @fmt:		Pointer to source buffer format
>    * @src_width:		width of source buffer
>    * Return: fill level corresponding to the source buffer/format or 0 if error
>    */
>   static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
>   		struct dpu_sw_pipe *pipe,
> +		enum dpu_qos_lut_usage lut_usage,
>   		const struct dpu_format *fmt, u32 src_width)
>   {
>   	struct dpu_plane *pdpu;
> @@ -207,6 +209,9 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
>   		return 0;
>   	}
>   
> +	if (lut_usage == DPU_QOS_LUT_USAGE_NRT)
> +		return 0;
> +
>   	pdpu = to_dpu_plane(plane);
>   	fixed_buff_size = pdpu->catalog->caps->pixel_ram_size;
>   
> @@ -252,83 +257,58 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
>   		const struct dpu_format *fmt, struct dpu_sw_pipe_cfg *pipe_cfg)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> -	u64 qos_lut;
> -	u32 total_fl = 0, lut_usage;
> +	struct dpu_hw_qos_cfg cfg;
> +	u32 total_fl, lut_usage;
>   
>   	if (!pdpu->is_rt_pipe) {
>   		lut_usage = DPU_QOS_LUT_USAGE_NRT;
>   	} else {
> -		total_fl = _dpu_plane_calc_fill_level(plane, pipe, fmt,
> -				drm_rect_width(&pipe_cfg->src_rect));
> -
>   		if (fmt && DPU_FORMAT_IS_LINEAR(fmt))
>   			lut_usage = DPU_QOS_LUT_USAGE_LINEAR;
>   		else
>   			lut_usage = DPU_QOS_LUT_USAGE_MACROTILE;
>   	}
>   
> -	qos_lut = _dpu_hw_get_qos_lut(
> -			&pdpu->catalog->perf->qos_lut_tbl[lut_usage], total_fl);
> +	total_fl = _dpu_plane_calc_fill_level(plane, pipe, lut_usage, fmt,
> +				drm_rect_width(&pipe_cfg->src_rect));
> +
> +	cfg.creq_lut = _dpu_hw_get_qos_lut(&pdpu->catalog->perf->qos_lut_tbl[lut_usage], total_fl);
> +	cfg.danger_lut = pdpu->catalog->perf->danger_lut_tbl[lut_usage];
> +	cfg.safe_lut = pdpu->catalog->perf->safe_lut_tbl[lut_usage];
> +
> +	if (pipe->sspp->idx != SSPP_CURSOR0 &&
> +	    pipe->sspp->idx != SSPP_CURSOR1 &&
> +	    pdpu->is_rt_pipe)
> +		cfg.danger_safe_en = true;
> +
> +	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d is_rt:%d\n",
> +		pdpu->pipe - SSPP_VIG0,
> +		cfg.danger_safe_en,
> +		pdpu->is_rt_pipe);
>   
>   	trace_dpu_perf_set_qos_luts(pipe->sspp->idx - SSPP_VIG0,
>   			(fmt) ? fmt->base.pixel_format : 0,
> -			pdpu->is_rt_pipe, total_fl, qos_lut, lut_usage);
> +			pdpu->is_rt_pipe, total_fl, cfg.creq_lut, lut_usage);
>   
>   	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s rt:%d fl:%u lut:0x%llx\n",
>   			pdpu->pipe - SSPP_VIG0,
>   			fmt ? (char *)&fmt->base.pixel_format : NULL,
> -			pdpu->is_rt_pipe, total_fl, qos_lut);
> -
> -	pipe->sspp->ops.setup_creq_lut(pipe->sspp, qos_lut);
> -}
> -
> -/**
> - * _dpu_plane_set_danger_lut - set danger/safe LUT of the given plane
> - * @plane:		Pointer to drm plane
> - * @pipe:		Pointer to software pipe
> - * @fmt:		Pointer to source buffer format
> - */
> -static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
> -		struct dpu_sw_pipe *pipe,
> -		const struct dpu_format *fmt)
> -{
> -	struct dpu_plane *pdpu = to_dpu_plane(plane);
> -	u32 danger_lut, safe_lut;
> -
> -	if (!pdpu->is_rt_pipe) {
> -		danger_lut = pdpu->catalog->perf->danger_lut_tbl
> -				[DPU_QOS_LUT_USAGE_NRT];
> -		safe_lut = pdpu->catalog->perf->safe_lut_tbl
> -				[DPU_QOS_LUT_USAGE_NRT];
> -	} else {
> -		if (fmt && DPU_FORMAT_IS_LINEAR(fmt)) {
> -			danger_lut = pdpu->catalog->perf->danger_lut_tbl
> -					[DPU_QOS_LUT_USAGE_LINEAR];
> -			safe_lut = pdpu->catalog->perf->safe_lut_tbl
> -					[DPU_QOS_LUT_USAGE_LINEAR];
> -		} else {
> -			danger_lut = pdpu->catalog->perf->danger_lut_tbl
> -					[DPU_QOS_LUT_USAGE_MACROTILE];
> -			safe_lut = pdpu->catalog->perf->safe_lut_tbl
> -					[DPU_QOS_LUT_USAGE_MACROTILE];
> -		}
> -	}
> +			pdpu->is_rt_pipe, total_fl, cfg.creq_lut);
>   
>   	trace_dpu_perf_set_danger_luts(pdpu->pipe - SSPP_VIG0,
>   			(fmt) ? fmt->base.pixel_format : 0,
>   			(fmt) ? fmt->fetch_mode : 0,
> -			danger_lut,
> -			safe_lut);
> +			cfg.danger_lut,
> +			cfg.safe_lut);
>   
>   	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s mode:%d luts[0x%x, 0x%x]\n",
>   		pdpu->pipe - SSPP_VIG0,
>   		fmt ? (char *)&fmt->base.pixel_format : NULL,
>   		fmt ? fmt->fetch_mode : -1,
> -		danger_lut,
> -		safe_lut);
> +		cfg.danger_lut,
> +		cfg.safe_lut);
>   
> -	pipe->sspp->ops.setup_danger_safe_lut(pipe->sspp,
> -			danger_lut, safe_lut);
> +	pipe->sspp->ops.setup_qos_lut(pipe->sspp, &cfg);
>   }
>   
>   /**
> @@ -336,7 +316,6 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
>    * @plane:		Pointer to drm plane
>    * @pipe:		Pointer to software pipe
>    * @enable:		true to enable QoS control
> - * @flags:		QoS control mode (enum dpu_plane_qos)
>    */
>   static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
>   	struct dpu_sw_pipe *pipe,
> @@ -1086,10 +1065,6 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
>   	}
>   
>   	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
> -	_dpu_plane_set_danger_lut(plane, pipe, fmt);
> -	_dpu_plane_set_qos_ctrl(plane, pipe,
> -				pipe->sspp->idx != SSPP_CURSOR0 &&
> -				pipe->sspp->idx != SSPP_CURSOR1);
>   
>   	if (pipe->sspp->idx != SSPP_CURSOR0 &&
>   	    pipe->sspp->idx != SSPP_CURSOR1)
Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
