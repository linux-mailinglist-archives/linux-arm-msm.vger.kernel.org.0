Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDFE6B9BB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 17:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbjCNQgA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 12:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbjCNQft (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 12:35:49 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6C2B53DC
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 09:35:13 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32EEbQM8002392;
        Tue, 14 Mar 2023 16:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=11Uzm9PSmd3aEksMGMbkCqrlnjHKXgzuyJjKVvS8Cy8=;
 b=H2Ox0UNH/Wwy8c84kRYoUNfSc3+U42RYn0+RYukJ8bL3DJmH5cQYFPMufN6V9bA5fqvL
 xpisCp/8gyA1BB8eD2k5HGtf7sAxuMwWtfLNvXKIj8E9HA55uaQhfCMJN4++iL/RCLS2
 aSwd45zXnjJfyAI3E4ui16qPyHFXE5mqVZTG5CUbaFy+2hjX/dFlaKbSBvQ7Q4gpIkW4
 5DCDk3qskQwXhMyzJzZIqcTTvGP6/kO2sGCXwrSaYUvQqFODRkcq0qreUv080C/ccVPn
 wxxRhweuhJN4ZdHyFTpf672eUxwhTrZyVn5b/rx9T8W8L9i+1ypfgroecrClWVx1sRnk sw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3paef8ah40-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Mar 2023 16:35:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32EGZ4QV016097
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Mar 2023 16:35:04 GMT
Received: from [10.110.64.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 14 Mar
 2023 09:35:03 -0700
Message-ID: <6a570e7d-f67e-a95d-4e15-db78a8b4a29d@quicinc.com>
Date:   Tue, 14 Mar 2023 09:35:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 29/32] drm/msm/dpu: enable SmartDMA for the rest of the
 platforms
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
 <20230310005704.1332368-30-dmitry.baryshkov@linaro.org>
 <ec51367b-db01-9922-baeb-3233f56f056f@quicinc.com>
 <b5f6b856-4e15-3476-e5e7-4585641398ac@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <b5f6b856-4e15-3476-e5e7-4585641398ac@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aSRZl03kJ7KPXdE9DlxsphiMxIzSPiaS
X-Proofpoint-GUID: aSRZl03kJ7KPXdE9DlxsphiMxIzSPiaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_10,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140137
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/14/2023 3:58 AM, Dmitry Baryshkov wrote:
> On 14/03/2023 07:08, Abhinav Kumar wrote:
>>
>>
>> On 3/9/2023 4:57 PM, Dmitry Baryshkov wrote:
>>> Enable SmartDMA features for the rest of the platforms where it is
>>> supposed to work.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> I am so glad we split this. Without visual validation check we wouldnt 
>> have caught the issues and would have ended up with a blank half 
>> screen on our sc7280 CBs on DP.
> 
> yes, the r_pipe was indeed mea culpa, when I didn't fully validate the 
> results of a rebase. However this doesn't seem to be an sc7280-specific 
> question. Are there any platform-specific issues with 
> SmartDMA/multirect/planes revealed during testing? In other words, were 
> there any issues which warrant this split?
> 
>>
>> For sc7280, I validated the foll cases:
> 
> Thanks a lot!
> 
>>
>> 1) Basic Chrome UI comes up
>> 2) Validated some browser use-cases and played some youtube videos
>> 3) Validated multiple plug-in/plug-out cases with DP connected
>> 4) IGT test cases with DP connected:
>>      - kms_atomic
>>      - kms_atomic_transition
>>      - kms_pipe_basic_crc
>>
>> Some notes:
>>
>> 1) I wanted to test 4k with this too but my monitor only supports 
>> 4k@60 which is not possible with 24bpp with 2 lanes and due to the 
>> HBR3 black screen issue I could not test that so far. But since I have 
>> that issue even with 1080P and without these changes, it should have 
>> no effect due to this series.
>>
>> 2) I wanted to test some YUV overlay cases but I still cannot find one 
>> on chrome. Its always using RGB. Will check with others.
> 
> Testing YUV would definitely be a must, especially for the SSPP 
> allocation. Can you possibly check whether contemporaty Xv 
> implementation employs YUV planes? You can try that using `mpv -xo xv` 
> or `mplayer -vo xv`
> 

Let me get some feedback from CrOS folks here instead of just trial and 
error to find out.

>>
>> With these two noted, this change and this series has my
>>
>> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>

There is no guarantee we will end up finding the YUV case, you could 
have retained the Tested-by for the efforts which were already put in 
instead of just blatantly removing it.

>> Only for sc7280 device.
>>
>> I still cannot give my R-b on this change till others validate 
>> visually and ensure things arent broken for them.
>>
>> If we don't get enough validation and if only sc7280 remains in this 
>> change, please re-post it with only that and I will give my R-b too.
> 
