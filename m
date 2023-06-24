Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8F673CB48
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jun 2023 16:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbjFXOSL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jun 2023 10:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232459AbjFXOSJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jun 2023 10:18:09 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD84B1BD6;
        Sat, 24 Jun 2023 07:18:05 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35OEGqo3003773;
        Sat, 24 Jun 2023 14:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Lw46R/g/f7pb9OJJkn7Fb2XoGlQ+3XcED4KUXlyqxCE=;
 b=hBSMYTjzGsP0RzijB6fTAY0jWKW/Pw763YiDV4ineuAS2DXwqMFnAEE5G7N2TqZ6rycE
 fCQdkwpfKrGTU+N1CBFYnlUy+RtPbhnyYtZdKvFQhPhLCiwKR0J9elKDpz16AfxFUOol
 UE6NQaof5V2/Y7E4AfDiTzQzhTyOqYC/DXgUEQZzfLUVXPoqXB2yGf745Uq7U2SkVJ1Y
 5/j32PMKZ4U9KokIEcS6uSSA28EEJoRU6A+wHAr67j50xZZ4Nb9cLuDImlCy0hd4bqGK
 QhwW09WzAbcyy0/r+UJCg+lMKEDHqReoaIW9BUKMdeb0UYuKCRKJ0mWntUawIJzjD/p0 MQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rdr360pk5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 24 Jun 2023 14:17:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35OEHrJJ016569
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 24 Jun 2023 14:17:53 GMT
Received: from [10.110.58.66] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Sat, 24 Jun
 2023 07:17:52 -0700
Message-ID: <37c4bde0-0798-7506-ffd3-c8689ab78ba0@quicinc.com>
Date:   Sat, 24 Jun 2023 07:17:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] drm/msm/dpu: Update dev core dump to dump registers
 of sub blocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC:     Rob Clark <robdclark@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <quic_jesszhan@quicinc.com>
References: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
 <20230622-devcoredump_patch-v1-6-3b2cdcc6a576@quicinc.com>
 <114f34dd-e5ce-f878-5b23-4c14dc800547@linaro.org>
 <1e41b909-4886-8392-edbc-78684e52bbf9@quicinc.com>
 <412f68a3-e3cc-f26e-2e3d-59727e5c48d8@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <412f68a3-e3cc-f26e-2e3d-59727e5c48d8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: myRkyTC66X0bYn52PjoWZ0iBz_gUpMNd
X-Proofpoint-GUID: myRkyTC66X0bYn52PjoWZ0iBz_gUpMNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-24_10,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306240134
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/24/2023 5:07 AM, Dmitry Baryshkov wrote:
> On 24/06/2023 03:09, Abhinav Kumar wrote:
>>
>>
>> On 6/22/2023 5:13 PM, Dmitry Baryshkov wrote:
>>> On 23/06/2023 02:48, Ryan McCann wrote:
>>>> Currently, the device core dump mechanism does not dump registers of 
>>>> sub
>>>> blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Add wrapper
>>>> function to dump hardware blocks that contain sub blocks.
>>>>
>>>> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 194 
>>>> +++++++++++++++++++++++++++-----
>>>>   1 file changed, 168 insertions(+), 26 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> index aa8499de1b9f..9b1b1c382269 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> @@ -885,6 +885,154 @@ static int dpu_irq_postinstall(struct msm_kms 
>>>> *kms)
>>>>       return 0;
>>>>   }
>>>> +static void dpu_kms_mdp_snapshot_add_block(struct msm_disp_state 
>>>> *disp_state,
>>>> +                       void __iomem *mmio, void *blk,
>>>> +                       enum dpu_hw_blk_type blk_type)
>>>
>>> No. Such multiplexers add no value to the code. Please inline it.
>>>
>>> Not to mention that this patch is hard to review. You both move 
>>> existing code and add new features. If it were to go, it should have 
>>> been split into two patches: one introducing the multiplexer and 
>>> another one adding subblocks.
>>>
>>
>> Ok. we can split this into:
>>
>> 1) adding the multiplexer
>> 2) adding sub-blk parsing support inside the multiplexer
> 
> I'd say, drop the multiplexer completely. It adds no value here. It is 
> only used from dpu_kms_mdp_snapshot(). If the code there was complex 
> enough, it would have made sense to _split_ the function. But even in 
> such case there would be no point in having multiplexer. We do not 
> enumerate block by type.
> 

Can you pls elaborate what you mean by enumerate blk by type?

We do have DPU_HW_BLK_***

Did you mean sub-blk?

>>
>>>> +{
>>>> +    u32 base;
>>>> +
>>>> +    switch (blk_type) {
>>>> +    case DPU_HW_BLK_TOP:
>>>> +    {
>>>> +        struct dpu_mdp_cfg *top = (struct dpu_mdp_cfg *)blk;
>>>> +
>>>> +        if (top->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>>> +            msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
>>>> +                            mmio + top->base, "top");
>>>> +            msm_disp_snapshot_add_block(disp_state, top->len - 
>>>> MDP_PERIPH_TOP0_END,
>>>> +                            mmio + top->base + MDP_PERIPH_TOP0_END,
>>>> +                            "top_2");
>>>> +        } else {
>>>> +            msm_disp_snapshot_add_block(disp_state, top->len, mmio 
>>>> + top->base, "top");
>>>> +        }
>>>> +        break;
>>>> +    }
>>>> +    case DPU_HW_BLK_LM:
>>>> +    {
>>>> +        struct dpu_lm_cfg *mixer = (struct dpu_lm_cfg *)blk;
>>>> +
>>>> +        msm_disp_snapshot_add_block(disp_state, mixer->len, mmio + 
>>>> mixer->base, "%s",
>>>> +                        mixer->name);
>>>> +        break;
>>>> +    }
>>>> +    case DPU_HW_BLK_CTL:
>>>> +    {
>>>> +        struct dpu_ctl_cfg *ctl = (struct dpu_ctl_cfg *)blk;
>>>> +
>>>> +        msm_disp_snapshot_add_block(disp_state, ctl->len, mmio + 
>>>> ctl->base, "%s",
>>>> +                        ctl->name);
>>>> +        break;
>>>> +    }
>>>> +    case DPU_HW_BLK_INTF:
>>>> +    {
>>>> +        struct dpu_intf_cfg *intf = (struct dpu_intf_cfg *)blk;
>>>> +
>>>> +        msm_disp_snapshot_add_block(disp_state, intf->len, mmio + 
>>>> intf->base, "%s",
>>>> +                        intf->name);
>>>> +        break;
>>>> +    }
>>>> +    case DPU_HW_BLK_WB:
>>>> +    {
>>>> +        struct dpu_wb_cfg *wb = (struct dpu_wb_cfg *)blk;
>>>> +
>>>> +        msm_disp_snapshot_add_block(disp_state, wb->len, mmio + 
>>>> wb->base, "%s",
>>>> +                        wb->name);
>>>> +        break;
>>>> +    }
>>>> +    case DPU_HW_BLK_SSPP:
>>>> +    {
>>>> +        struct dpu_sspp_cfg *sspp_block = (struct dpu_sspp_cfg *)blk;
>>>> +        const struct dpu_sspp_sub_blks *sblk = sspp_block->sblk;
>>>> +
>>>> +        base = sspp_block->base;
>>>> +
>>>> +        msm_disp_snapshot_add_block(disp_state, sspp_block->len, 
>>>> mmio + base, "%s",
>>>> +                        sspp_block->name);
>>>> +
>>>> +        if (sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
>>>> +            sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
>>>> +            sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED4))
>>>> +            msm_disp_snapshot_add_block(disp_state, 
>>>> sblk->scaler_blk.len,
>>>> +                            mmio + base + sblk->scaler_blk.base, 
>>>> "%s_%s",
>>>> +                            sspp_block->name, sblk->scaler_blk.name);
>>>
>>> Actually, it would be better to:
>>> - drop name from all sblk instances (and use known string instead of 
>>> the sblk name here)
>>> - Use sblk->foo_blk.len to check if it should be printed or not.
>>>
>>
>> No, I dont agree. If we drop the names from the sub_blk in the 
>> catalog, we will end up using "sub_blk_name" string here in the code 
>> to indicate which blk that is in the dump.
>>
>> If we add more sub_blks in the catalog in the future we need to keep 
>> changing the code over here. Thats not how it should be.
>>
>> Leaving the names in the catalog ensures that this code wont change 
>> and only catalog changes when we add a new sub_blk either for an 
>> existing or new chipset.
>>
>> catalog is indicating the new blk, and dumping code just prints it.
>>
>> with your approach, dumping code will or can keep changing with 
>> chipsets or sub_blks. Thats not how it should be.
> 
> Well, we do not enumerate sub-blocks in any way, they are not indexed. 
> So even with sblk->blk.name in place, adding new sub-block would require 
> adding new code here. That's why I wrote that the calling code knows 
> which sub-block it refers to.
> 

Today, unfortunately each sub_blk type is different so we have to do 
this case by case.

Ideally, this should have just been

-> print main blk
-> print all sub-blks of the main blk

Without having to handle each main blk's sub-blks separately.

That way the dumping code would have remained generic without having to 
do even the multiplexer in the first place.

Need to explore if somehow we can come up with a generic sub-blk struct 
and make this possible. Then this code will become much easier and what 
I am saying will make total sense.

Even without that, conceptually these sub-blk names are reflecting whats 
in our software document. So its not a random name but reflects the 
actual sub-blk name from the hardware. So this belongs in the catalog.

Dumping code should not change or know whats the name of each block. It 
should just use whats in the catalog. thats why even conceptually I am 
not okay with your idea.

> Let me extract the relevant code (skipping all the conditions for now):
> 
> msm_disp_snapshot_add_block(disp_state, sspp_block->len, mmio + base, "%s",
>                  sspp_block->name);
> 
> if (have_scaler)
>      msm_disp_snapshot_add_block(disp_state, sblk->scaler_blk.len,
>                      mmio + base + sblk->scaler_blk.base, "%s_%s",
>                      sspp_block->name, sblk->scaler_blk.name);
> 
> if (have_csc)
>      msm_disp_snapshot_add_block(disp_state, sblk->csc_blk.len,
>                      mmio + base + sblk->csc_blk.base, "%s_%s",
>                      sspp_block->name, sblk->csc_blk.name);
> 
> Consider adding new sub-block, "baz". We would still require manual 
> addition of the following code:
> 
>      msm_disp_snapshot_add_block(disp_state, sblk->baz_blk.len,
>                      mmio + base + sblk->baz_blk.base, "%s_%s",
>                      sspp_block->name, sblk->baz_blk.name);
> 
> 
> Compare this with:
> 
>      msm_disp_snapshot_add_block(disp_state, sblk->baz_blk.len,
>                      mmio + base + sblk->baz_blk.base, "%s_baz",
>                      sspp_block->name);
> 

Basically you are saying why not make the one line change here instead 
of using the name from the catalog.

I think it will be better to use from the catalog for the reason I wrote 
above that dumping code should just "use" the catalog's information and 
not become a catalog itself.

You are not saving much by dropping the sub-blk name from catalog anyway.

> Moreover, if we follow the style of dpu_kms_mdp_snapshot() (which 
> doesn't use name), it should be:
> 
>      msm_disp_snapshot_add_block(disp_state, sblk->baz_blk.len,
>                      mmio + base + sblk->baz_blk.base, "sspp%d_baz", idx);
> 
> 
tbh, after looking at this series, it made me think why I didnt use the 
name from the catalog even for the dpu_kms_mdp_snapshot()
> 
>>

<snipped>
