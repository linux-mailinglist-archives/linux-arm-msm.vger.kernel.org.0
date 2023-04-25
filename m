Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36AD86EE9D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Apr 2023 23:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbjDYV5I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Apr 2023 17:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbjDYV5H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Apr 2023 17:57:07 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73A7BB9D;
        Tue, 25 Apr 2023 14:57:05 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33PLeWdn025788;
        Tue, 25 Apr 2023 21:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nlrK40D83ZyJp4acVy2iPl/3j87j1acdqhIsvVREpsg=;
 b=X/80sv3szUzrMvTtsWK086A/qRtJMhAf4DlvzBlazUvLf1Xc8YNiTdnmkeYiFUr+n0tT
 shxi6NUSngdzcl0KbKQaopFT0eFMl8MR3gk8jSvEVp76dJ+VRB6Hw6ndOnww3GknUExF
 dNIW+UGjM5zOjhh3KZtsgxo1X6nJWO42yHaXBTVlSqhl5izc7QlrQYfKxX8dpCoXQfDK
 8Z/BEYLLf+rHrmUthYOOBumg6byuxyv/Sp1F0wEAdzULwAYrL67ZItnf4k2LQiGl/QFE
 WZpgbnKMSbR6LnTgbv9/oBZY4uIZRWjqx+7dQia408H1C9T3iEfMN1Xcol/lw1KZz1l+ aQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6brdsww5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Apr 2023 21:56:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33PLtx6B032268
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Apr 2023 21:55:59 GMT
Received: from [10.110.124.105] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 25 Apr
 2023 14:55:57 -0700
Message-ID: <5661d20d-81e9-61ba-b556-d90b5b8fdb4d@quicinc.com>
Date:   Tue, 25 Apr 2023 14:55:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2 04/17] drm/msm/dpu: Fix PP_BLK_DIPHER ->
 DITHER typo
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
CC:     <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Archit Taneja <architt@codeaurora.org>,
        Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        "Jami Kettunen" <jami.kettunen@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <freedreno@lists.freedesktop.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>
References: <20230411-dpu-intf-te-v2-4-ef76c877eb97@somainline.org>
 <a0a0b8fb-0d6b-d11b-5596-d61c41aabe7f@quicinc.com>
 <bhatfkgdkjt2bih4lcwa5cxcp3w2tkjrqmbdhqhzqa2cizrmxs@py3gr5vifsoc>
 <65bb4d8a-c607-4152-0ae3-bf3134955925@quicinc.com>
 <5td7ikd76obc5bn5sndnt7fbzjuwmyxtu35ma3lykzmmbyfffk@b24jh6imaocy>
 <7541b780-482e-ea92-f788-18c8fbf45d77@quicinc.com>
 <o536qdkbrqob5wux7jvmo7expwn4bdlj7vy7egjfsyydxp5myb@xjhmolci5jzl>
 <cc537736-a555-dc3e-2e53-f1d4479eab21@quicinc.com>
 <6crk3acgxcdfdokpgcfjkojs2wdjoxalkmctqfgtc725wsgoep@kdj4zbavbe62>
 <a8f33707-b9ea-5595-e458-4f56c24c1167@quicinc.com>
 <klrcz6zw4syxllhtbuclo65lo73kdunl5syuuoiv6zzkf3fadl@rgjc7rlgaoxq>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <klrcz6zw4syxllhtbuclo65lo73kdunl5syuuoiv6zzkf3fadl@rgjc7rlgaoxq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KofyRNqa5rmx9udlOQSWKkjL4Kp7AfJ7
X-Proofpoint-GUID: KofyRNqa5rmx9udlOQSWKkjL4Kp7AfJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_08,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=612 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250195
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/25/2023 2:53 PM, Marijn Suijten wrote:
> On 2023-04-25 14:37:21, Abhinav Kumar wrote:
>>
>>
>> On 4/25/2023 1:43 PM, Marijn Suijten wrote:
>>> On 2023-04-25 09:47:30, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 4/25/2023 9:33 AM, Marijn Suijten wrote:
>>>>> On 2023-04-25 09:18:58, Abhinav Kumar wrote:
>>>>>>
>>>>>>
>>>>>> On 4/24/2023 11:54 PM, Marijn Suijten wrote:
>>>>>>> On 2023-04-24 16:09:45, Abhinav Kumar wrote:
>>>>>>> <snip>
>>>>>>>>>> dither block should be present on many other chipsets too but looks like
>>>>>>>>>> on sm8550 was enabling it. Not sure how it was validated there. But we
>>>>>>>>>> are enabling dither, even other chipsets have this block.
>>>>>>>>>
>>>>>>>>> Correct, they all seem to have it starting at sdm845.  My patch message
>>>>>>>>> seems to lack the word "exclusively" as the PP on sm8550 appears to
>>>>>>>>> exclusively contain a DITHER subblock (unless other blocks are available
>>>>>>>>> that simply aren't supported within this driver yet) and no other
>>>>>>>>> registers.  Hence this aptly named macro exist to emit just the feature
>>>>>>>>> bitflag for that and a .len of zero.
>>>>>>>>>
>>>>>>>>
>>>>>>>> I think after the TE blocks were moved to INTF, dither is the only
>>>>>>>> sub-block for all Ping-Pongs not just in sm8550.
>>>>>>>
>>>>>>> So you are asking / leaving context to make all >= 5.0.0 pingpong blocks
>>>>>>> use this macro with only a single DITHER sblk in PP?
>>>>>>>
>>>>>>> As far as I recall SM8550 is the first SoC to use zero registers in PP,
>>>>>>> which is specifically what this macro takes care of too.  Then, there
>>>>>>> are only a few SoCs downstream still (erroneously?) referencing TE2 as
>>>>>>> the only other sub-blk, those SoCs still use sdm845_pp_sblk_te.
>>>>>>>
>>>>>>
>>>>>> So, what I didnt follow is why should sm8450 use PP_BLK_TE Vs sm8550
>>>>>> should use PP_BLK_DIPHER?
>>>>>>
>>>>>> Atleast for those two, both should be using PP_BLK_DIPHER.
>>>>>>
>>>>>> Thats what I was trying to note here.
>>>>>>
>>>>>> This isnt even right as there is no PP_BLK_TE in sm8450.
>>>>>
>>>>> SM8450 doesn't use PP_BLK_TE (TE2) anymore since the second patch in
>>>>> this series.  If you think it should use the DITHER (not DIPHER!) macro
>>>>> instead of the regular PP_BLK with a size of 0xd4, we can do that in
>>>>> another patch as that's not strictly related to this series.
>>>>>
>>>>
>>>> Yes, thanks for pointing the TE2 was removed in the prev patch of this
>>>> series for sm8450. I was just focusing too much on this patch.
>>>>
>>>> And Yes, I think we should use the DIPHER ..... oh sorry .... DITHER ;)
>>>>
>>>> Yes, it can go as a different series, like I already wrote many times in
>>>> this.
>>>
>>> Thanks, that'd be great.  I wasn't sure at this point what you wanted to
>>> be changed here, after commenting on a typo fix rather than i.e. patch 2
>>> that deals with the TE2 sub-block of PP :)
>>>
>>
>> The reason I commented on this patch is because all the discussion so
>> far was surrounding the PP_BLK_DITHER macro which was being touched in
>> this patch.
>>
>> So even now, we found out about sm8450 and sm8550 because of the
>> question that why sm8550 alone should use PP_BLK_DITHER and not sm8450.
>>
>> This patch led to all the discussion about PP_BLK_DITHER.
>>
>> Even though it was just a typo fix patch, it uncovered deeper issues in
>> catalog about why PP_BLK_DITHER wasnt used more often.
> 
> Indeed: the initial question was for the dither _block_ which is enabled
> on every other platform, just through the original macros which do more
> than exclusively enabling the dither block.
> 
>>>> But atleast now, someone will remember to do it.
> 
> I'll see whether I can include these fixes before sending v3 (got all
> the other changes in and am all-ready to send it): is there any other
> SoC you're seeing this issue on?
> 

Thats alright, you can have it in a separate series not v3 of this one.

I am picking up the fixes from this one now.

I will update the other SOCs on IRC or even better i will take up this 
cleanup.

> - Marijn
> 
>>>>> Note that that's the only difference between these macros.  The size
>>>>> becomes 0 but the .features mask is the same (SM8450 uses
>>>>> PINGPONG_SM8150_MASK).
>>>>>
>>>>> These patches are anyway already distracting from my series, but were
>>>>> easier to do in one go as I was touching the PP and INTF catalog blocks
>>>>> regardless.
>>>>>
>>>>> While at it, perhaps we should check if the version and offset for the
>>>>> DITHER block are correct?  SM8450 uses SDM845 sblk definitions.
>>>>>
>>>>
>>>> Yes I already checked. the version and offset of dither are same between
>>>> sm8450 and sm8550.
>>>
>>> Thanks for checking, so then sm8450 is wrong on multiple occasions.
>>> Let's check all other SoCs that use sdm845_pp_sblk whether they should
>>> have used sc7280_pp_sblk instead.
>>>
>>> - Marijn
