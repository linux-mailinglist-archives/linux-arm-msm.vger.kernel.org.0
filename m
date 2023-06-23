Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C824173BEF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 21:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbjFWTg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 15:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbjFWTg1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 15:36:27 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A6F2707
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 12:36:23 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35NDqkBo002013;
        Fri, 23 Jun 2023 19:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zO+PGNmN8a9U+5qGpmMEyYnTntxdbEi/c3pK95BwTPo=;
 b=bHytJRC1b1wg8ghbWyTlwErmtTkd3qY8kKcetht9KDNaBIdx4zCxRCEAC9351B8F75g8
 F/tvhzT1bWDzWjzXXIYjaxAIfjf4Eyu3ZZOJ7czBoG6xiYSP8aIpfOiFVkCm+8LDP4XC
 ysFMRuWqsF7qi4j4HgD/NNU8nkhsgS2zB/K8MiFqlDCksiNB50/APvAu5cRfQQcLs2Yb
 hwdz263ahEYCaw18Ac3drI+zP2MIRUyaQmBcK30gSJXmA8+3VJHZbfrYiusGSqW1Tca0
 jLji4q0r/GQ4NlVsqo0ApRXNBOKa1oR7UIwXofqs+rBAOH/scc4zo/tV+TdidbImLbVa 8w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rcju84cew-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jun 2023 19:36:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35NJa8j2031070
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jun 2023 19:36:08 GMT
Received: from [10.110.61.170] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 23 Jun
 2023 12:36:07 -0700
Message-ID: <6579ad4d-03ce-1320-3751-4b725fe3474e@quicinc.com>
Date:   Fri, 23 Jun 2023 12:36:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
CC:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
 <6b74cb1f-3128-4ebd-8ff9-33cc025d957b@quicinc.com>
 <mwxs3rvemvdizqtsfa7pxms5prgrdq2lue6lvkt2f23nehzhwr@uawaxv5jsnmh>
 <wbeyverizh4644grwtz4r62gb5rypsuufs4ixz4qx5jl4233hr@uexh36futuys>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <wbeyverizh4644grwtz4r62gb5rypsuufs4ixz4qx5jl4233hr@uexh36futuys>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JLVjg7zdDnjN2qoWH2dza96cILk-7zNa
X-Proofpoint-GUID: JLVjg7zdDnjN2qoWH2dza96cILk-7zNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_11,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306230175
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/22/2023 11:57 PM, Marijn Suijten wrote:
> On 2023-06-23 08:54:39, Marijn Suijten wrote:
>> On 2023-06-22 22:47:04, Abhinav Kumar wrote:
>>> On 6/22/2023 6:37 PM, Dmitry Baryshkov wrote:
>>>> All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block length.
>>>> This includes the common block itself, enc subblocks and some empty
>>>> space around. Change that to pass 0x4 instead, the length of common
>>>> register block itself.
>>>>
>>>> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> There is no need of a fixes tag for this.
>>>
>>> This is not a bug but was intentional.
>>>
>>> Till we added sub-block parsing support we had to dump the whole block.
>>>
>>> And hence I would suggest this change should be merged after the
>>> sub-block parsing change otherwise we wont have full register dumps for DSC.
>>
>> This was indeed intentional, we discussed it in [1].
>>
>> In fact I asked to make it 0xf00 + 0x10 or 0xf80 + 0x10 to also cover
>> the CTL registers, but that change didn't make it through.  0x29c is an
>> arbitrary number that I have no clue what it was based on.
> 
> Ah, as expected Dmitry's second commit clarifies that the last register
> in the enc block is at 0x98, and the base of the enc + length of the enc
> then is 0x200 + 0x9c.
> 
> That still excludes the ctl sblk.

0x29c is not an arbitrary number. The last encoder offset is 0x298 so we 
add 4 more to that.

Yes it will still exclude ctl blk as that space is not contiguous and we 
dont want to increase len all the way to 0xf00.

> 
>> [1]: https://lore.kernel.org/linux-arm-msm/y2whfntyo2rbrg3taazjdw5sijle6k6swzl4uutcxm6tmuayh4@uxdur74uasua/
>>
>> - Marijn
