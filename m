Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B856174C83A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 22:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjGIUcV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jul 2023 16:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjGIUcU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jul 2023 16:32:20 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BFBFB5;
        Sun,  9 Jul 2023 13:32:19 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 369KW4WO000690;
        Sun, 9 Jul 2023 20:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=677bkrlxeEMwzyB0BuCAEWPllOKMMw5fsejeI/t9/QE=;
 b=L2vEtiKPYlnnk3kHP6spOfBR+NVmzIpRzxoRHSt9ScrVZ8RfF6EOwtvG2jY6oO7BSJ7Y
 UatCi6gu71lLpmfMLXfD3WUPVjQ6S2crFsae8QblCUTd2Lk+qepfjI/g2YNANReRkP4n
 4RKlLtMIo4miRkhH1HpB/TehkqWL+7W67FkeuWCebmZMEeC9z9NmKLfTJssP6MbNN4o4
 4h3ktlDUvCwDXMXk84O7/PUwC9TnR7IBqMNOPfpR3ALeCZ82E7uWRXnLGMlaH9l5NTcg
 thM4xRVczoeeqirJLRi6ZoB0Xb7+/rDE5dFI68rNrxHw8mzSUAnr69zOQ9rWeRl6+0Pz JQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpxry23cw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 09 Jul 2023 20:32:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 369KW3r5003806
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 9 Jul 2023 20:32:03 GMT
Received: from [10.110.47.185] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Sun, 9 Jul
 2023 13:32:02 -0700
Message-ID: <10de9309-19f9-18af-3e01-1cda7d76e73e@quicinc.com>
Date:   Sun, 9 Jul 2023 13:32:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v1 1/5] drm/msm/dp: remove pm_runtime_xxx()
 from dp_power.c
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <quic_sbillaka@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <marijn.suijten@somainline.org>,
        <quic_jesszhan@quicinc.com>, <freedreno@lists.freedesktop.org>
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-2-git-send-email-quic_khsieh@quicinc.com>
 <fc5501cf-c335-81f7-1ad7-26fdc1b6922d@linaro.org>
 <72cb729b-a9d3-3e5b-c70a-0761f47a6779@quicinc.com>
 <CAA8EJpqKVBKRpFs=sS2rwrJpDP22sNrd00kCYm-b_ZB96O=s5g@mail.gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqKVBKRpFs=sS2rwrJpDP22sNrd00kCYm-b_ZB96O=s5g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3EuSfpV-3XZDXMxc-7zr6dJM7WFtm3-Q
X-Proofpoint-GUID: 3EuSfpV-3XZDXMxc-7zr6dJM7WFtm3-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-09_14,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2307090193
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/9/2023 11:00 AM, Dmitry Baryshkov wrote:
> On Sun, 9 Jul 2023 at 20:22, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 7/7/2023 5:06 PM, Dmitry Baryshkov wrote:
>>> On 08/07/2023 02:52, Kuogee Hsieh wrote:
>>>> Since both pm_runtime_resume() and pm_runtime_suspend() are not
>>>> populated at dp_pm_ops. Those pm_runtime_get/put() functions within
>>>> dp_power.c will not have any effects in addition to increase/decrease
>>>> power counter.
>>>
>>> Lie.
>>>
>>
>> Even if the commit text is incorrect, review comments like this are not
>> helping the patch nor the author and will just get ignored anyway.
> 
> The review comment might be overreacting, excuse me. I was really
> impressed by the commit message, which contradicts the basic source
> code. pm_runtime_get() does a lot more than just increasing the power
> counter.
> 

It says within dp_power.c. Nonetheless, please let us know what is 
missing in the context of this patch like Bjorn did to make it an 
effective review and we can correct it. In its current form, the review 
comment is adding no value.

>>>> Also pm_runtime_xxx() should be executed at top
>>>> layer.
>>>
>>> Why?
>>>
>>
>> I guess he meant to centralize this around dp_display.c. Will elaborate
>> while posting the next rev.
>>
>>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_power.c | 9 ---------
>>>>    1 file changed, 9 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c
>>>> b/drivers/gpu/drm/msm/dp/dp_power.c
>>>> index 5cb84ca..ed2f62a 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_power.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
>>>> @@ -152,8 +152,6 @@ int dp_power_client_init(struct dp_power *dp_power)
>>>>        power = container_of(dp_power, struct dp_power_private, dp_power);
>>>> -    pm_runtime_enable(power->dev);
>>>> -
>>>>        return dp_power_clk_init(power);
>>>>    }
>>>> @@ -162,8 +160,6 @@ void dp_power_client_deinit(struct dp_power
>>>> *dp_power)
>>>>        struct dp_power_private *power;
>>>>        power = container_of(dp_power, struct dp_power_private, dp_power);
>>>> -
>>>> -    pm_runtime_disable(power->dev);
>>>>    }
>>>>    int dp_power_init(struct dp_power *dp_power)
>>>> @@ -173,11 +169,7 @@ int dp_power_init(struct dp_power *dp_power)
>>>>        power = container_of(dp_power, struct dp_power_private, dp_power);
>>>> -    pm_runtime_get_sync(power->dev);
>>>> -
>>>>        rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
>>>> -    if (rc)
>>>> -        pm_runtime_put_sync(power->dev);
>>>>        return rc;
>>>>    }
>>>> @@ -189,7 +181,6 @@ int dp_power_deinit(struct dp_power *dp_power)
>>>>        power = container_of(dp_power, struct dp_power_private, dp_power);
>>>>        dp_power_clk_enable(dp_power, DP_CORE_PM, false);
>>>> -    pm_runtime_put_sync(power->dev);
>>>>        return 0;
>>>>    }
>>>
> 
> 
> 
