Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A43EB688751
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 20:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbjBBTEU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 14:04:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbjBBTEN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 14:04:13 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160D86950A
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 11:04:12 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312HN3RO004054;
        Thu, 2 Feb 2023 18:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WuYPy6EhQUi9YZeS3kaynk2EOlY7XZIjjiNx/QT8YVc=;
 b=dwS19j/+bhrZ7uA6CWmiZlcCQbHwiT0UgZrXUbRimHpaZWPl7ZP4kX8BFI7wPn6PaFxJ
 fWaT1L8vthdTFCZDdC2ZsESV8QjiW8MSpgYJYtkYF7A/+FJl63oZm2bXW1bEWSgfAn0/
 vQd1hSL24RxGuMeGCrf6M2/I8s0Nragj8J3tohnbLaHx74o9N/vI1em+kVmRkVhxgL3P
 ZACNkPcau0dA1QmE/yqVWiTJ4F3ElI+JVPFS+hMrTFkNmoOUP1Br/R2ZKy2tdwdI+5Y/
 eI9SmTx5R2wjjhZrZ/hJmMy7G4KNqACXZlLiK0s8fmQzFFnkOLRx/pqheDMDX33+4/cL pg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nfn5j3pa1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Feb 2023 18:41:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 312IfZXO023302
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 2 Feb 2023 18:41:35 GMT
Received: from [10.110.114.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 2 Feb 2023
 10:41:34 -0800
Message-ID: <8a9ae8b1-dc2b-896e-353d-bb237fa0663e@quicinc.com>
Date:   Thu, 2 Feb 2023 10:41:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 11/27] drm/msm/dpu: move stride programming to
 dpu_hw_sspp_setup_sourceaddress
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-12-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221229191856.3508092-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _r9TgniwZuxDuMDacMiQw2iZu06Uvdqz
X-Proofpoint-GUID: _r9TgniwZuxDuMDacMiQw2iZu06Uvdqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_12,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302020167
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
> Move stride programming to dpu_hw_sspp_setup_sourceaddress(), so that
> dpu_hw_sspp_setup_rects() programs only source and destination
> rectangles.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Sorry but once again, I dont see a response to my comment

https://patchwork.freedesktop.org/patch/473166/?series=99909&rev=1#comment_875313

So let me repeat that here:

"This separation is logically correct, but there is another codepath
using this.

_dpu_plane_color_fill() calls pdpu->pipe_hw->ops.setup_rects.

So for solid fill, I presume that stride getting programmed is 0 as
there is no buffer to fetch from.

But with this separation, we will miss re-programming stride and it will
remain at the old value even for solid fil cases?

You might want to add setup_sourceaddress call there? But that wont make
sense either because for solid fill there is nothing to fetch from.

Perhaps, another op for stride programming then?
"

Also, this is the second patch in the series where the previous comments 
were not resolved/responded to.

Hope that this was not just another rebase without looking at the prior 
comments.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 57 +++++++++++----------
>   1 file changed, 29 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 176cd6dc9a69..2bd39c13d54d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -447,7 +447,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>   {
>   	struct dpu_hw_sspp *ctx = pipe->sspp;
>   	struct dpu_hw_blk_reg_map *c;
> -	u32 src_size, src_xy, dst_size, dst_xy, ystride0, ystride1;
> +	u32 src_size, src_xy, dst_size, dst_xy;
>   	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
>   	u32 idx;
>   
> @@ -478,44 +478,18 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>   	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
>   		drm_rect_width(&cfg->dst_rect);
>   
> -	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> -		ystride0 = (cfg->layout.plane_pitch[0]) |
> -			(cfg->layout.plane_pitch[1] << 16);
> -		ystride1 = (cfg->layout.plane_pitch[2]) |
> -			(cfg->layout.plane_pitch[3] << 16);
> -	} else {
> -		ystride0 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE0 + idx);
> -		ystride1 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE1 + idx);
> -
> -		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> -			ystride0 = (ystride0 & 0xFFFF0000) |
> -				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
> -			ystride1 = (ystride1 & 0xFFFF0000)|
> -				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
> -		} else {
> -			ystride0 = (ystride0 & 0x0000FFFF) |
> -				((cfg->layout.plane_pitch[0] << 16) &
> -				 0xFFFF0000);
> -			ystride1 = (ystride1 & 0x0000FFFF) |
> -				((cfg->layout.plane_pitch[2] << 16) &
> -				 0xFFFF0000);
> -		}
> -	}
> -
>   	/* rectangle register programming */
>   	DPU_REG_WRITE(c, src_size_off + idx, src_size);
>   	DPU_REG_WRITE(c, src_xy_off + idx, src_xy);
>   	DPU_REG_WRITE(c, out_size_off + idx, dst_size);
>   	DPU_REG_WRITE(c, out_xy_off + idx, dst_xy);
> -
> -	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE0 + idx, ystride0);
> -	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
>   }
>   
>   static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>   		struct dpu_hw_pipe_cfg *cfg)
>   {
>   	struct dpu_hw_sspp *ctx = pipe->sspp;
> +	u32 ystride0, ystride1;
>   	int i;
>   	u32 idx;
>   
> @@ -537,6 +511,33 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>   		DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
>   				cfg->layout.plane_addr[2]);
>   	}
> +
> +	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> +		ystride0 = (cfg->layout.plane_pitch[0]) |
> +			(cfg->layout.plane_pitch[1] << 16);
> +		ystride1 = (cfg->layout.plane_pitch[2]) |
> +			(cfg->layout.plane_pitch[3] << 16);
> +	} else {
> +		ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
> +		ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
> +
> +		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> +			ystride0 = (ystride0 & 0xFFFF0000) |
> +				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
> +			ystride1 = (ystride1 & 0xFFFF0000)|
> +				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
> +		} else {
> +			ystride0 = (ystride0 & 0x0000FFFF) |
> +				((cfg->layout.plane_pitch[0] << 16) &
> +				 0xFFFF0000);
> +			ystride1 = (ystride1 & 0x0000FFFF) |
> +				((cfg->layout.plane_pitch[2] << 16) &
> +				 0xFFFF0000);
> +		}
> +	}
> +
> +	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx, ystride0);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx, ystride1);
>   }
>   
>   static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
