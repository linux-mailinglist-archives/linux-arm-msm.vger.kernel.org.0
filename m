Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64A7D68A0C4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 18:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbjBCRsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 12:48:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbjBCRsF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 12:48:05 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E52ADB9C
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 09:47:39 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313HH4xf012512;
        Fri, 3 Feb 2023 17:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=X75DpmBpYTRcx0dE2RxeDB3A7gndWxOHdcztvEzZbe8=;
 b=G5QqhiPh2/N0cyqqSMwOmjG710RDojtSSRpLjuh6dJLX5STmgDCxhgkVayCZaMSQPNsW
 hO8lF8TDw8mQBG40ii3Pe2lb9eqj1xCMYdZm7JKP1ean8Q4prO04DMRd8PMC7P7wqPFF
 z+Fyx2QDpz6ZlonPy4PH2MiGZSTuQSqDxsQnM7GMLx1s3gUdYRoQB+P+iR7za2pCp2di
 EKhQtKEzbUVy0BlUROJczeo6MYcWSfY7f23hc0nkrirUrfa5rRdojQCfjyJnKzzKMrZz
 ABx8A8VjWUuLPHxOcWOe3eC8RHb1F3+Ve8HpiKt9GFjpHLw/kNCsg1FCPd6t7C7vK671 FA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngns3275e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Feb 2023 17:47:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313HlFmP015198
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 3 Feb 2023 17:47:15 GMT
Received: from [10.110.99.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 09:47:14 -0800
Message-ID: <3af06272-7d7b-eec5-7cf5-40ad0826f0a8@quicinc.com>
Date:   Fri, 3 Feb 2023 09:47:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 12/27] drm/msm/dpu: remove dpu_hw_fmt_layout from
 struct dpu_hw_pipe_cfg
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-13-dmitry.baryshkov@linaro.org>
 <77764494-8a74-8450-ac75-33d6de0b2f8d@quicinc.com>
 <CAA8EJpq4ybOQg-Mb5RM+dcrBbR+3WrWSgvd4d20C6NKa90C15Q@mail.gmail.com>
 <62ace381-2c59-9096-2b4f-412b329ad78e@quicinc.com>
 <c6eb252e-fdff-8e17-4acb-cdb3ba850887@linaro.org>
 <a4af7146-126f-cd6e-4c65-dbdffe6cca82@quicinc.com>
 <fbdab5e4-4f48-f18f-561d-442d493724e5@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <fbdab5e4-4f48-f18f-561d-442d493724e5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tTdw9aJv5gaMf9LbbD4AfC80DlKPXBxD
X-Proofpoint-GUID: tTdw9aJv5gaMf9LbbD4AfC80DlKPXBxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_17,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030162
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/3/2023 6:09 AM, Dmitry Baryshkov wrote:
> On 02/02/2023 22:14, Abhinav Kumar wrote:
>>
>>
>> On 2/2/2023 12:10 PM, Dmitry Baryshkov wrote:
>>> On 02/02/2023 21:54, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 2/2/2023 11:45 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, 2 Feb 2023 at 21:38, Abhinav Kumar 
>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>>>>>>> Remove dpu_hw_fmt_layout instance from struct dpu_hw_pipe_cfg, 
>>>>>>> leaving
>>>>>>> only src_rect and dst_rect. This way right and left pipes will have
>>>>>>> separate dpu_hw_pipe_cfg isntances, while the layout is common to 
>>>>>>> both
>>>>>>> of them.
>>>>>>>
>>>>>>
>>>>>> Sorry for not responding to this comment earlier.
>>>>>>
>>>>>> https://patchwork.freedesktop.org/patch/473168/?series=99909&rev=1#comment_875370 
>>>>>>
>>>>>>
>>>>>>   From the perspective of wide planes you are right that the 
>>>>>> layout is
>>>>>> common but not true from smart DMA point of view.
>>>>>>
>>>>>> For wide planes, yes, its usually the same buffer with just the src_x
>>>>>> being different but conceptually and even HW wise each rectangle 
>>>>>> of the
>>>>>> smart DMA is capable of fetching from a different buffer.
>>>>>>
>>>>>>   From the pov, this decision of not having the dpu_hw_fmt_layout 
>>>>>> as part
>>>>>> of dpu_hw_pipe_cfg seems incorrect to me.
>>>>>
>>>>> Yes, each rectangle/pipe can fetch from a different buffer. However in
>>>>> our use case the layout is not defined for each pipe. It is defined
>>>>> for a plane, no matter how many pipes are used for the plane, since
>>>>> the buffer is also defined per plane.
>>>>>
>>>> Even if the layout is defined per plane.
>>>>
>>>> So lets say
>>>>
>>>> plane A with layout A maps to rect 1 of DMA0
>>>> plane B with layout B maps to rect 2 of DMA0
>>>>
>>>> How can layout be assumed to be duplicated in this case?
>>>>
>>>> This is not a wide plane use-case but just smartDMA case of two 
>>>> different layers.
>>>>
>>>> Maybe I am missing something but this is the example i am interested 
>>>> about.
>>>
>>> PlaneA has layoutA. So dpu_plane_sspp_update_pipe() will program 
>>> layoutA using (DMA0, rect1)->setup_sourceaddress(layoutA).
>>>
>>> PlaneB has layoutB, so (DMA0, rect2)->setup_sourceaddress(layoutB).
>>>
>>> Maybe the commit message is misleading. The layout is not common to 
>>> rect1 and rect2. It is common to all pipes/rectangles driving a 
>>> single plane.
>>>
>>
>> Ack, Its clear now.
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> I have rephrased the last sentence of the commit message in the 
> following way. Hopefully it will be cleaner now:
> 
> This way all the pipes used by the plane
> will have a common layout instance (as the framebuffer is shared between
> them), while still keeping a separate src/dst rectangle configuration
> for each pipe.
> 

Ack, thanks.
