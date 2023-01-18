Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B37C6672C96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 00:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjARXaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 18:30:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjARXaK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 18:30:10 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373AC4AA52
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 15:30:09 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30IMatu4008315;
        Wed, 18 Jan 2023 23:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=suT+BfuPsIxiBMLN9h/qNHf8aeCdZyBgoyNb44c9T7c=;
 b=eOulEh0YC50sK20oJaXAqiuohmH2co9La//DtXLBJ3jfuEVu5YpB+fIMq0rlrRINxtjU
 dSGb6+P5xd7f6+G5k0YblYLs9Mn3f4NsOsGLUnAMyogKeJl9LASeUlOBf1niIkO33Rtb
 Wr3Cq1sudN1BT9Bs6lg4oI2ME9LA1/hVW+HVOSUIau5tDiSr7L9PFa2Nrqj5EmzQnrEd
 9L1SqKhlx6ViBTx/LqQUhvcD3WKUennG368WPuUAbFkPaZFXZ3SZqFuRE0LC9nWzY/qh
 kwfupNCjskrk2LXY7hOF+uL/2y99y9Uy86CnTHIXQfg+kXY8VCYPtu4mBx6Oc6w0F4Pb SQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n6debspk1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Jan 2023 23:30:06 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30INU5xq008268
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Jan 2023 23:30:05 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 18 Jan
 2023 15:30:04 -0800
Message-ID: <c4109940-b2a6-259a-ef27-aa0edb339d88@quicinc.com>
Date:   Wed, 18 Jan 2023 15:30:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] drm/msm/dpu: Reapply CTM if modeset is needed
Content-Language: en-US
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <freedreno@lists.freedesktop.org>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_kalyant@quicinc.com>
References: <20230118164103.325-1-quic_jesszhan@quicinc.com>
 <6f08ad96-8d55-2a46-e5fa-5f4c7f89ec88@quicinc.com>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <6f08ad96-8d55-2a46-e5fa-5f4c7f89ec88@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bnWdmkcNgvRRVhxv57jU_8blYSpgK4xE
X-Proofpoint-ORIG-GUID: bnWdmkcNgvRRVhxv57jU_8blYSpgK4xE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=990 adultscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180194
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/18/2023 11:29 AM, Abhinav Kumar wrote:
> 
> 
> On 1/18/2023 8:41 AM, Jessica Zhang wrote:
>> Add a !drm_atomic_crtc_needs_modeset() check to
>> _dpu_crtc_setup_cp_blocks() so that CTM is reapplied if the LM/DSPP
>> blocks were reallocated during modeset.
> 
> This was in addition to the suspend/resume case.
> 
> So CTM needs to be reapplied in case of suspend/resume OR LM/DSPP block 
> reallocation.
> 
> To cover both of these we are adding the needs_modeset check

Hi Abhinav,

Acked. Will add back mention of suspend/resume case.

Thanks,

Jessica Zhang

> 
>>
>> Changes in V2:
>> - Fixed commit message
>>
>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/23
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 13ce321283ff..aa120a230222 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -748,7 +748,7 @@ static void _dpu_crtc_setup_cp_blocks(struct 
>> drm_crtc *crtc)
>>       int i;
>> -    if (!state->color_mgmt_changed)
>> +    if (!state->color_mgmt_changed && 
>> !drm_atomic_crtc_needs_modeset(state))
>>           return;
>>       for (i = 0; i < cstate->num_mixers; i++) {
