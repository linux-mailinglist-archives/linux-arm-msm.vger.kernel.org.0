Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62C145F024C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 03:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiI3BhK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 21:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbiI3BhJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 21:37:09 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77DDB1FE182;
        Thu, 29 Sep 2022 18:37:08 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28TKaSGk012711;
        Fri, 30 Sep 2022 01:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8uskSYXZrC8wCallSBV0TUOAeGS6evy4WyhF7aiBzFc=;
 b=QOkbhHVS6+vX7RljFXCRdQ7S1yPyldL1IwQ9Bi1G5JOKvGYxIvu8OL0aMwj2lYhO7p9i
 lVswuF9Ua+RlcO8PHAPCac0Wb5cnwF/StpWbiRGMkx45NefJ2G+AE1ntmw8yNGJWr/5r
 VWYkeg5fpdltdux4qPLQFEDNtxg7q3PuG5vlPjITmBA3RVONTXNYe5T9pLeCY3QSodXv
 8i3q/RYNAoPndNfG6Q3v4g64WQVCooflpwSqcQOaLCiSAMg29L5irIbfq91f7rt0GuJ6
 t1PT6TMioPdv6jjFpAroGHC3jjGZiJ49KsSJMRcKtEpClzfKUD3rFcAsezOx/6Gt2xjC xg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jw4xqbpm6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Sep 2022 01:36:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28U1axDI018655
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Sep 2022 01:36:59 GMT
Received: from [10.111.171.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 29 Sep
 2022 18:36:55 -0700
Message-ID: <36e191e0-9ddc-80b8-7f59-e002d5d458c1@quicinc.com>
Date:   Thu, 29 Sep 2022 18:36:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 1/3] drm/msm/dp: cleared DP_DOWNSPREAD_CTRL register
 before start link training
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
        <agross@kernel.org>, <bjorn.andersson@linaro.org>
CC:     <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1662999830-13916-1-git-send-email-quic_khsieh@quicinc.com>
 <1662999830-13916-2-git-send-email-quic_khsieh@quicinc.com>
 <0f381285-860f-aaa2-2ae7-834608d0b4e8@linaro.org>
 <e6543dd7-30ac-d210-6bf0-95bb9d22ca0a@quicinc.com>
 <47f661b6-b5b9-9f28-10cf-1e7bbb8b282a@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <47f661b6-b5b9-9f28-10cf-1e7bbb8b282a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RkK_-3mHW8BCHBgGWeQKK1mxBrTba1Ae
X-Proofpoint-ORIG-GUID: RkK_-3mHW8BCHBgGWeQKK1mxBrTba1Ae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_01,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209300008
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/12/2022 12:25 PM, Dmitry Baryshkov wrote:
> On 12/09/2022 22:21, Kuogee Hsieh wrote:
>>
>> On 9/12/2022 11:39 AM, Dmitry Baryshkov wrote:
>>> On 12/09/2022 19:23, Kuogee Hsieh wrote:
>>>> DOWNSPREAD_CTRL (0x107) shall be cleared to 0 upon power-on reset or an
>>>> upstream device disconnect. This patch will enforce this rule by always
>>>> cleared DOWNSPREAD_CTRL register to 0 before start link training. At 
>>>> rare
>>>> case that DP MSA timing parameters may be mis-interpreted by the sink
>>>> which causes audio sampling rate be calculated wrongly and cause audio
>>>> did not work at sink if DOWNSPREAD_CTRL register is not cleared to 0.
>>>>
>>>> Changes in v2:
>>>> 1) fix spelling at commit text
>>>> 2) merge ssc variable into encoding[0]
>>>>
>>>> Changes in v3:
>>>> -- correct spelling of DOWNSPREAD_CTRL
>>>> -- replace err with len of ssize_t
>>>>
>>>> Changes in v4:
>>>> -- split into 2 patches
>>>>
>>>> Fixes: 154b5a7da0fd ("drm/msm/dp: add displayPort driver support")

Fixes tag is wrong here. It should be:

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")

>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 13 +++++--------
>>>>   1 file changed, 5 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>>>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> index ab6aa13..2c74c59 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> @@ -1245,8 +1245,7 @@ static int dp_ctrl_link_train(struct 
>>>> dp_ctrl_private *ctrl,
>>>>   {
>>>>       int ret = 0;
>>>>       const u8 *dpcd = ctrl->panel->dpcd;
>>>> -    u8 encoding = DP_SET_ANSI_8B10B;
>>>> -    u8 ssc;
>>>> +    u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
>>>>       u8 assr;
>>>>       struct dp_link_info link_info = {0};
>>>>   @@ -1258,13 +1257,11 @@ static int dp_ctrl_link_train(struct 
>>>> dp_ctrl_private *ctrl,
>>>>         dp_aux_link_configure(ctrl->aux, &link_info);
>>>>   -    if (drm_dp_max_downspread(dpcd)) {
>>>> -        ssc = DP_SPREAD_AMP_0_5;
>>>> -        drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 1);
>>>> -    }
>>>> +    if (drm_dp_max_downspread(dpcd))
>>>> +        encoding[0] |= DP_SPREAD_AMP_0_5;
>>>
>>> It would be simpler to call drm_dp_dpcd_write(ssc, 
>>> DP_DOWNSPREAD_CTRL, 1) unconditionally here. You won't have to change 
>>> the encoding/DP_MAIN_LINK_CHANNEL_CODING_SET/etc.
>>
>> The difference is one write with 2 bytes against two writes with one 
>> byte each.
>>
>> I think it is more efficient to combine two bytes into one write since 
>> these two bytes are consecutive address.
> 
> I probably wouldn't do so, nevertheless:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>>
>>>
>>>>   -    drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
>>>> -                &encoding, 1);
>>>> +    /* config DOWNSPREAD_CTRL and MAIN_LINK_CHANNEL_CODING_SET */
>>>> +    drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, encoding, 2);
>>>>         if (drm_dp_alternate_scrambler_reset_cap(dpcd)) {
>>>>           assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
>>>
> 
