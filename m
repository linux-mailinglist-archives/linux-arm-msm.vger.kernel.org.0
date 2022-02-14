Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6BBC4B5AAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 20:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiBNTpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 14:45:16 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:49402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiBNTpQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 14:45:16 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6B2116D35
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 11:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644867899; x=1676403899;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o399d9ecTHK4e95M+tUkgumsvYPEBP7LORzPvfD9GG0=;
  b=Uk5LB3iSu7K8UX419oBQjhoIwVoz1spdFRYG9gSCQCzwtQIFOpK4JQW+
   6fDqSXma6hdQ5j16oPo1WaxBnj014M/oUa/3rDBC5fRxFQBu6bkQQQ5b6
   jEOMI9TjFV8Wu0UYlJiC+V8DI2/v/LPNuLQ1UhqXiZLUtv7J2xFu/LL6g
   o=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 14 Feb 2022 11:08:23 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 11:08:22 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Feb 2022 11:08:21 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 14 Feb
 2022 11:08:19 -0800
Message-ID: <fe8841b6-1dc5-3126-3bf8-258b61d5ee7e@quicinc.com>
Date:   Mon, 14 Feb 2022 11:08:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 4/6] drm/msm/dpu: stop embedding dpu_hw_blk into
 dpu_hw_intf
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
 <20220121210618.3482550-5-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220121210618.3482550-5-dmitry.baryshkov@linaro.org>
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



On 1/21/2022 1:06 PM, Dmitry Baryshkov wrote:
> Now as dpu_hw_intf is not hanled by dpu_rm_get_assigned_resources, there
> is no point in embedding the (empty) struct dpu_hw_blk into dpu_hw_intf
> (and using typecasts between dpu_hw_blk and dpu_hw_intf). Drop it and
> use dpu_hw_intf directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 11 -----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 17 +++--------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  9 ++++++---
>   3 files changed, 9 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 3568be80dab5..230d122fa43b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -78,7 +78,6 @@ struct dpu_hw_intf_ops {
>   };
>   
>   struct dpu_hw_intf {
> -	struct dpu_hw_blk base;
>   	struct dpu_hw_blk_reg_map hw;
>   
>   	/* intf */
> @@ -90,16 +89,6 @@ struct dpu_hw_intf {
>   	struct dpu_hw_intf_ops ops;
>   };
>   
> -/**
> - * to_dpu_hw_intf - convert base object dpu_hw_base to container
> - * @hw: Pointer to base hardware block
> - * return: Pointer to hardware block container
> - */
> -static inline struct dpu_hw_intf *to_dpu_hw_intf(struct dpu_hw_blk *hw)
> -{
> -	return container_of(hw, struct dpu_hw_intf, base);
> -}
> -
>   /**
>    * dpu_hw_intf_init(): Initializes the intf driver for the passed
>    * interface idx.
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 8df21a46308e..96554e962e38 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -74,14 +74,8 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>   			dpu_hw_ctl_destroy(hw);
>   		}
>   	}
> -	for (i = 0; i < ARRAY_SIZE(rm->intf_blks); i++) {
> -		struct dpu_hw_intf *hw;
> -
> -		if (rm->intf_blks[i]) {
> -			hw = to_dpu_hw_intf(rm->intf_blks[i]);
> -			dpu_hw_intf_destroy(hw);
> -		}
> -	}
> +	for (i = 0; i < ARRAY_SIZE(rm->hw_intf); i++)
> +		dpu_hw_intf_destroy(rm->hw_intf[i]);
>   
>   	return 0;
>   }
> @@ -179,7 +173,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			DPU_ERROR("failed intf object creation: err %d\n", rc);
>   			goto fail;
>   		}
> -		rm->intf_blks[intf->id - INTF_0] = &hw->base;
> +		rm->hw_intf[intf->id - INTF_0] = hw;
>   	}
>   
>   	for (i = 0; i < cat->ctl_count; i++) {
> @@ -593,8 +587,3 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>   
>   	return num_blks;
>   }
> -
> -struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_intf intf_idx)
> -{
> -	return to_dpu_hw_intf(rm->intf_blks[intf_idx - INTF_0]);
> -}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index ee50f6651b6e..9b13200a050a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -18,14 +18,14 @@ struct dpu_global_state;
>    * @pingpong_blks: array of pingpong hardware resources
>    * @mixer_blks: array of layer mixer hardware resources
>    * @ctl_blks: array of ctl hardware resources
> - * @intf_blks: array of intf hardware resources
> + * @hw_intf: array of intf hardware resources
>    * @dspp_blks: array of dspp hardware resources
>    */
>   struct dpu_rm {
>   	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
>   	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
>   	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
> -	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
> +	struct dpu_hw_intf *hw_intf[INTF_MAX - INTF_0];
>   	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
>   	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
>   };
> @@ -90,7 +90,10 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>    * @rm: DPU Resource Manager handle
>    * @intf_idx: INTF's index
>    */
> -struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_intf intf_idx);
> +static inline struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_intf intf_idx)
> +{
> +	return rm->hw_intf[intf_idx - INTF_0];
> +}
>   
>   #endif /* __DPU_RM_H__ */
>   
