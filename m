Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F34D473BF07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 21:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbjFWTnY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 15:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjFWTnX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 15:43:23 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC0E2706
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 12:43:22 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35NJ5IB2001145;
        Fri, 23 Jun 2023 19:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bCMuSVjwVm36WBiqKfnAkht2KjQSuFlLI72pMHc4B0s=;
 b=W/goglAYMn7bSA5FZQPdliPNjmhUe2Jc2Q/JQcemNLpe2Ccht9r2pkJ3vTEbgdeYKJMi
 9AxZjM3uPokNQKeqYK7whjnSxAvrEdVRCyhmiYn4TYpiyw7SIQNGyPsB6bdcrU/0z2HA
 QwPWV4Oywsh76LcWutRnlPXSF68CcPMk6fwJckJyWVArNsgS5MCotpdg2eamapoYMfNw
 BE1cJX14GcJK7oBKi1SZBtcxFK389o7SQ/DM5DIjgJ8LpCIHohoB7RR7GP8DVo19NXPJ
 zV63juLViiTkMz0RhIPN2GnkPV5RbSIs/UzHdWT08aFze5FThtNv6Lueius7rA5i7msi vQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rcw93jg0k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jun 2023 19:42:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35NJgwBD005819
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jun 2023 19:42:58 GMT
Received: from [10.110.61.170] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 23 Jun
 2023 12:42:57 -0700
Message-ID: <de8ce528-3ef3-7f13-dc9e-87a9fc221200@quicinc.com>
Date:   Fri, 23 Jun 2023 12:42:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
 <6b74cb1f-3128-4ebd-8ff9-33cc025d957b@quicinc.com>
 <mwxs3rvemvdizqtsfa7pxms5prgrdq2lue6lvkt2f23nehzhwr@uawaxv5jsnmh>
 <ad1cf803-729f-5ef5-a6cf-667ecde0b282@linaro.org>
 <c22f165a-cc5b-2be1-fed9-420f68dbd8b7@quicinc.com>
 <500e6256-b1bc-35bf-546c-8ed896e3cba7@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <500e6256-b1bc-35bf-546c-8ed896e3cba7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C5wkFMQT6_1pX-H9kV3G2TILWQQP45WC
X-Proofpoint-ORIG-GUID: C5wkFMQT6_1pX-H9kV3G2TILWQQP45WC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_10,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 mlxlogscore=875 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306230176
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/23/2023 12:40 PM, Dmitry Baryshkov wrote:
> On 23/06/2023 22:37, Abhinav Kumar wrote:
>>
>>
>> On 6/23/2023 4:37 AM, Dmitry Baryshkov wrote:
>>> On 23/06/2023 09:54, Marijn Suijten wrote:
>>>> On 2023-06-22 22:47:04, Abhinav Kumar wrote:
>>>>> On 6/22/2023 6:37 PM, Dmitry Baryshkov wrote:
>>>>>> All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block 
>>>>>> length.
>>>>>> This includes the common block itself, enc subblocks and some empty
>>>>>> space around. Change that to pass 0x4 instead, the length of common
>>>>>> register block itself.
>>>>>>
>>>>>> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for 
>>>>>> relevant chipsets")
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>
>>>>> There is no need of a fixes tag for this.
>>>>>
>>>>> This is not a bug but was intentional.
>>>>>
>>>>> Till we added sub-block parsing support we had to dump the whole 
>>>>> block.
>>>>>
>>>>> And hence I would suggest this change should be merged after the
>>>>> sub-block parsing change otherwise we wont have full register dumps 
>>>>> for DSC.
>>>>
>>>> This was indeed intentional, we discussed it in [1].
>>>>
>>>> In fact I asked to make it 0xf00 + 0x10 or 0xf80 + 0x10 to also cover
>>>> the CTL registers, but that change didn't make it through.  0x29c is an
>>>> arbitrary number that I have no clue what it was based on.
>>>
>>> This should have been NAKed. or at least TODOed.
>>>
>>
>> Its is not an arbitrary number. Thats an incorrect comment.
>>
>> Its 4 more than the encoder's last offset which is 0x298 + 0x4 = 0x29c.
>>
>> There was nothing to NAK or TODO here.
> 
> We do not include sub-blocks in the main block area. The SSPP's SRC 
> blocks were cleaned up for this reason. The ENC registers are definitely 
> a sub-block (and are described this way). There should have been a 
> "TODO: reduce block length to 0x4 after adding sub-blocks to dump" comment.
> 

iirc the sub-block dump idea came to me in some other patchset not this 
one. But ack that a comment could have been left.

>>
>>>>
>>>> [1]: 
>>>> https://lore.kernel.org/linux-arm-msm/y2whfntyo2rbrg3taazjdw5sijle6k6swzl4uutcxm6tmuayh4@uxdur74uasua/
>>>>
>>>> - Marijn
>>>
> 
