Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38CCB6F23BC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Apr 2023 10:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjD2IqU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Apr 2023 04:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjD2IqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Apr 2023 04:46:19 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343BA19AD
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Apr 2023 01:46:18 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33T8cJJK028761;
        Sat, 29 Apr 2023 08:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hvONotVks+o5PvqFe1e2S4SGR+xR/2T/dU0/0aYp1LE=;
 b=BI+9gHroJQxo2/2j9+NHwFoN5nA5kdc9T8LpcB+SRrp/CCLQLUpdNmmp9SC4beiCdoT0
 7FMnKlvkdw+o8iY7CzJd+SkL1OvikrQwt7zuO2D8z6+dBVCNgmC4cTvuqz+TP7PHgipI
 mFIzQEibX1GvKRl9HlL3eioD9ru4ZhNV14UVo0iN7ydl9Ou7wWzWNUaMBTw97l5kJjkW
 KkCQpzHLMQtaN+EEdG63iXYSwJ/9Sduw/SqVmDvEk43q4pjp24RUQF5y6A6WrSXjqtfB
 AZaZ/UzNNcjbsAbLldLpXA8xZ0yLMXaUdFEG0pUpaP5K3PJEEVLurYkp5CE94f+XagsK Xg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8umg0bvh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 29 Apr 2023 08:46:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33T8k8SK025805
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 29 Apr 2023 08:46:08 GMT
Received: from [10.110.119.27] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Sat, 29 Apr
 2023 01:46:08 -0700
Message-ID: <1c0f5c9d-f38e-a008-b950-e85a5eb94633@quicinc.com>
Date:   Sat, 29 Apr 2023 01:46:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: drop unused SSPP sub-block information
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>
References: <20230429024242.2613957-1-dmitry.baryshkov@linaro.org>
 <085c3b3a-1a29-7082-934d-497be5b050fd@quicinc.com>
 <5fbf2ba1-f8fd-1373-55f2-4eb3789bc5e7@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <5fbf2ba1-f8fd-1373-55f2-4eb3789bc5e7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lTJcxFk4W-xWCAS2RwjA_SbD0e-915vq
X-Proofpoint-ORIG-GUID: lTJcxFk4W-xWCAS2RwjA_SbD0e-915vq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=911 mlxscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304290081
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/28/2023 9:30 PM, Dmitry Baryshkov wrote:
> On 29/04/2023 07:29, Abhinav Kumar wrote:
>>
>>
>> On 4/28/2023 7:42 PM, Dmitry Baryshkov wrote:
>>> The driver  doesn't support hsic/memcolor, pcc and igc SSPP subblocks.
>>> Drop corresponding definitions.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 --------
>>>   1 file changed, 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index 3e92c2c66716..db6488a6929d 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -384,10 +384,6 @@ struct dpu_caps {
>>>    * @qseed_ver: qseed version
>>>    * @scaler_blk:
>>>    * @csc_blk:
>>> - * @hsic:
>>> - * @memcolor:
>>> - * @pcc_blk:
>>> - * @igc_blk:
>>>    * @format_list: Pointer to list of supported formats
>>>    * @num_formats: Number of supported formats
>>>    * @virt_format_list: Pointer to list of supported formats for 
>>> virtual planes
>>> @@ -404,10 +400,6 @@ struct dpu_sspp_sub_blks {
>>>       u32 qseed_ver;
>>>       struct dpu_scaler_blk scaler_blk;
>>>       struct dpu_pp_blk csc_blk;
>>> -    struct dpu_pp_blk hsic_blk;
>>> -    struct dpu_pp_blk memcolor_blk;
>>> -    struct dpu_pp_blk pcc_blk;
>>> -    struct dpu_pp_blk igc_blk;
>>
>> I have included IGC in this patch 
>> https://patchwork.freedesktop.org/patch/534725/?series=117130&rev=1
>>
>> So that one can be dropped from this patch?
> 
> It will get dropped while applying because of the conflict.
> 

Knowing that its going to conflict, why not fix one of the patches now, 
preferably this one since I was handling GC/IGC together in that series.

>>
>> Rest is fine.
>>
>>>       const u32 *format_list;
>>>       u32 num_formats;
> 
