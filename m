Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D732068DF7F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 18:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbjBGR5d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 12:57:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjBGR5c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 12:57:32 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0A3A5E0
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 09:57:30 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 317Dx4oU023401;
        Tue, 7 Feb 2023 17:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=24DtiErjluzovxrQmpEAP9y1FA+7SkAxzrlpg5wG7/M=;
 b=IFhnO/UWCPXEoDt82aE8vuFkT7EQLrDaiNFwYuVvzFk0NKxpMICCgAOvJVwbnWuWEgxk
 FDvC/t5v0WS8Kk7i+RR+V2RuLDCEU7MqBcB2x8qTCux+o1v92jNCcRg4lNUvDcIiVfbi
 acwpvQiNQIMXfz0fIk0tfcGDmyUUsr/xrv5fyflkkCEDdlsdM/YcEfZTlHMww5bCPPPi
 yMWIoatdmB3xk9nsxqN+VOpE0Kka+xIo9/pye5i5ENhpnG16mt3mPEYmnPmOPLOcgDUB
 bGqy7zMsyq4G0I/AR2jlzboiCZafAxF7KL/TOe/ExHr8vqOdN+lVKh4NZlBEI2rZPrqG 5Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkduna4k9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Feb 2023 17:57:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 317HvNLj022040
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 7 Feb 2023 17:57:23 GMT
Received: from [10.110.44.26] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 09:57:22 -0800
Message-ID: <0381e11f-6266-c5f1-87a0-b3050354a80b@quicinc.com>
Date:   Tue, 7 Feb 2023 09:57:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 23/27] drm/msm/dpu: rework dpu_plane_atomic_check()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-24-dmitry.baryshkov@linaro.org>
 <04ab8d1e-d343-2d6c-c211-2cf0ffc713c2@quicinc.com>
 <fd2e4474-3ecb-91e1-d702-0b2dbb77f458@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <fd2e4474-3ecb-91e1-d702-0b2dbb77f458@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w8ZcFI-OzMj1y1wuZH9HPoMd9HNHWxmN
X-Proofpoint-ORIG-GUID: w8ZcFI-OzMj1y1wuZH9HPoMd9HNHWxmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_09,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070160
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/7/2023 9:51 AM, Dmitry Baryshkov wrote:
> On 07/02/2023 19:49, Abhinav Kumar wrote:
>>
>>
>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>> Split pipe-dependent code from dpu_plane_atomic_check() into the
>>> separate function dpu_plane_atomic_check_pipe(). This is one of
>>
>> Same comment as prev patch, dpu_plane_atomic_check_pipe() ---> 
>> dpu_plane_atomic_check_sspp()
> 
> No, it does what it does: it checks one software pipe configuration.

The concept of software pipe is only to encapsulate the hw_sspp along 
with its params

+struct dpu_sw_pipe {
+	struct dpu_hw_sspp *sspp;
+	enum dpu_sspp_multirect_index multirect_index;
+	enum dpu_sspp_multirect_mode multirect_mode;
+};

So its a very thin differentiation there.

> 
>>
>>> preparational steps to add r_pipe support.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 88 ++++++++++++++---------
>>>   1 file changed, 53 insertions(+), 35 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index f94e132733f3..e69499490d39 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -903,6 +903,51 @@ static int 
>>> dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
>>>       return 0;
>>>   }
>>> +static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>>> +        struct dpu_sw_pipe *pipe,
>>> +        struct dpu_hw_sspp_cfg *pipe_cfg,
>>
>> pipe_cfg --> sspp_cfg
>>
>> Also, had a question. For function parameters spreading across 
>> multiple lines do we want to align to one guideline? Is it going to be 
>> two tabs more than the prev line or aligning it with the opening brace 
>> of prev line?
>>
>> I am seeing a mix in the prev patch of the series and this one.
> 
> I usually tend to keep the existing indent when adding new args and 
> shifting to open brace when adding new functions. Maybe I failed a 
> question in this patch, I'll doublecheck it.
> 
>>
>>> +        const struct dpu_format *fmt)
>>> +{
>>> +    uint32_t min_src_size;
>>> +
>>> +    min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>>> +
>>> +    if (DPU_FORMAT_IS_YUV(fmt) &&
>>> +        (!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
>>> +         !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
>>> +        DPU_DEBUG_PLANE(pdpu,
>>> +                "plane doesn't have scaler/csc for yuv\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /* check src bounds */
>>> +    if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
>>> +           drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
>>> +        DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>>> +                DRM_RECT_ARG(&pipe_cfg->src_rect));
>>> +        return -E2BIG;
>>> +    }
>>> +
>>> +    /* valid yuv image */
>>> +    if (DPU_FORMAT_IS_YUV(fmt) &&
>>> +           (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 
>>> 0x1 ||
>>> +            drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
>>> +            drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
>>> +        DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
>>> +                DRM_RECT_ARG(&pipe_cfg->src_rect));
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /* min dst support */
>>> +    if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || 
>>> drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
>>> +        DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
>>> +                DRM_RECT_ARG(&pipe_cfg->dst_rect));
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static int dpu_plane_atomic_check(struct drm_plane *plane,
>>>                     struct drm_atomic_state *state)
>>>   {
>>> @@ -915,7 +960,7 @@ static int dpu_plane_atomic_check(struct 
>>> drm_plane *plane,
>>>       const struct dpu_format *fmt;
>>>       struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
>>>       struct drm_rect fb_rect = { 0 };
>>> -    uint32_t min_src_size, max_linewidth;
>>> +    uint32_t max_linewidth;
>>>       unsigned int rotation;
>>>       uint32_t supported_rotations;
>>>       const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
>>> @@ -970,46 +1015,19 @@ static int dpu_plane_atomic_check(struct 
>>> drm_plane *plane,
>>>       max_linewidth = pdpu->catalog->caps->max_linewidth;
>>> -    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>>> -
>>> -    min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>>> -
>>> -    if (DPU_FORMAT_IS_YUV(fmt) &&
>>> -        (!(pipe_hw_caps->features & DPU_SSPP_SCALER) ||
>>> -         !(pipe_hw_caps->features & DPU_SSPP_CSC_ANY))) {
>>> -        DPU_DEBUG_PLANE(pdpu,
>>> -                "plane doesn't have scaler/csc for yuv\n");
>>> -        return -EINVAL;
>>> -
>>> -    /* check src bounds */
>>> -    } else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
>>> -           drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
>>> -        DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>>> -                DRM_RECT_ARG(&pipe_cfg->src_rect));
>>> -        return -E2BIG;
>>> -
>>> -    /* valid yuv image */
>>> -    } else if (DPU_FORMAT_IS_YUV(fmt) &&
>>> -           (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 
>>> 0x1 ||
>>> -            drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
>>> -            drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
>>> -        DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
>>> -                DRM_RECT_ARG(&pipe_cfg->src_rect));
>>> -        return -EINVAL;
>>> -
>>> -    /* min dst support */
>>> -    } else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || 
>>> drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
>>> -        DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
>>> -                DRM_RECT_ARG(&pipe_cfg->dst_rect));
>>> -        return -EINVAL;
>>> -
>>>       /* check decimated source width */
>>> -    } else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>>> +    if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>>>           DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " 
>>> line:%u\n",
>>>                   DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
>>>           return -E2BIG;
>>>       }
>>> +    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>>> +
>>> +    ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, pipe_cfg, 
>>> fmt);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>>       supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
>>>       if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> 
