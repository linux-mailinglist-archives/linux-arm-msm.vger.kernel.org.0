Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D70273AD3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 01:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbjFVXh0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 19:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjFVXhZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 19:37:25 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFE52119;
        Thu, 22 Jun 2023 16:37:23 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35MN9DWR032291;
        Thu, 22 Jun 2023 23:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hMaTSe8dxF340DopJi2xJaplYmYoXV2fgsHU39A1BEY=;
 b=D4U1rHSZAdWnrBx7CM7JkGc6aZhrvQBm92yANLwzbjHNYge8DfBODbioeA6oXY81d35N
 pS47W13tm4zDJZmGyX3PbmwpVseN3gfcLuDNTcTpTdWvsllhf9GdwFooMJr72DxTZDuc
 1sGkfXAqqppZlnb3XUjDXZnMjjI+MtLrkP1082VVNgMY/NfWR88mzkQ3mM5m9ZeN4Nqv
 uC3KphkUZO+6De+Gk108I1Oy81qgvcr42ca34hbdtzuOZLx/2Z9WbXA5qvybRSbRyqeU
 WZbg2ZXDuFZr18zQJNWnWuuId4L8flT3YhrUHEWxy+/apXs1KVJA8iuTHrdKbK5aRET6 sw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rc6b2bf7e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Jun 2023 23:37:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35MNbBr9019068
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Jun 2023 23:37:11 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 22 Jun
 2023 16:37:10 -0700
Message-ID: <0f988169-58cb-eccf-9590-f5097e085f22@quicinc.com>
Date:   Thu, 22 Jun 2023 16:37:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu: Set DATABUS_WIDEN on command
 mode encoders
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
CC:     Sean Paul <sean@poorly.run>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, David Airlie <airlied@gmail.com>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-2-c7069f2efca1@quicinc.com>
 <c74c9e0e-d059-f0e3-4350-03089c37131a@linaro.org>
 <cce68370-3fd9-4c9a-258e-af0d5d057fda@quicinc.com>
 <n2c5qlujxhbbj2aqlgj7fetzoteood5h4hmbwt4mapi77xlvmt@bpourzaideti>
 <81a5e241-ec82-7414-8752-4ce3cb084959@linaro.org>
 <f14f2c31-38c2-0600-3a29-17e83afececf@quicinc.com>
 <26tvhvqpxtxz5tqc6jbjixadpae34k7uc7fyec2u5o2ccj4tdq@tjvguzlolc3g>
 <8dcd643f-9644-a4e7-a0d5-eefa28084a88@linaro.org>
 <7d5256cd-c0bd-36e3-9b59-63ad8595f0ce@quicinc.com>
 <b119470d-f656-71d1-8b87-b4b8196f5220@linaro.org>
 <a4688db2-4230-7485-a688-bc6253d2d4b8@quicinc.com>
 <dab90e58-c25a-9b5a-bae0-dfc50de7d363@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <dab90e58-c25a-9b5a-bae0-dfc50de7d363@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pECfRs2Wyl8uLCC2zfr8l3TwxjGo_2sg
X-Proofpoint-GUID: pECfRs2Wyl8uLCC2zfr8l3TwxjGo_2sg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_17,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306220203
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/22/2023 4:14 PM, Dmitry Baryshkov wrote:
> On 23/06/2023 01:37, Abhinav Kumar wrote:
>>
>>
>> On 6/21/2023 4:46 PM, Dmitry Baryshkov wrote:
>>> On 22/06/2023 02:01, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 6/21/2023 9:36 AM, Dmitry Baryshkov wrote:
>>>>> On 21/06/2023 18:17, Marijn Suijten wrote:
>>>>>> On 2023-06-20 14:38:34, Jessica Zhang wrote:
>>>>>> <snip>
>>>>>>>>>>>> +    if (phys_enc->hw_intf->ops.enable_widebus)
>>>>>>>>>>>> + phys_enc->hw_intf->ops.enable_widebus(phys_enc->hw_intf);
>>>>>>>>>>>
>>>>>>>>>>> No. Please provide a single function which takes necessary
>>>>>>>>>>> configuration, including compression and wide_bus_enable.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> There are two ways to look at this. Your point is coming from the
>>>>>>>>>> perspective that its programming the same register but just a 
>>>>>>>>>> different
>>>>>>>>>> bit. But that will also make it a bit confusing.
>>>>>>>>
>>>>>>>> My point is to have a high-level function that configures the 
>>>>>>>> INTF for
>>>>>>>> the CMD mode. This way it can take a structure with necessary
>>>>>>>> configuration bits.
>>>>>>>
>>>>>>> Hi Dmitry,
>>>>>>>
>>>>>>> After discussing this approach with Abhinav, we still have a few
>>>>>>> questions about it:
>>>>>>>
>>>>>>> Currently, only 3 of the 32 bits for INTF_CONFIG2 are being used 
>>>>>>> (the
>>>>>>> rest are reserved with no plans of being programmed in the 
>>>>>>> future). Does
>>>>>>> this still justify the use of a struct to pass in the necessary
>>>>>>> configuration?
>>>>>>
>>>>>> No.  The point Dmitry is making is **not** about this concidentally
>>>>>> using the same register, but about adding a common codepath to enable
>>>>>> compression on this hw_intf (regardless of the registers it needs to
>>>>>> touch).
>>>>>
>>>>> Actually to setup INTF for CMD stream (which is equal to setting up 
>>>>> compression at this point).
>>>>>
>>>>
>>>> Yes it should be setup intf for cmd and not enable compression.
>>>>
>>>> Widebus and compression are different features and we should be able 
>>>> to control them independently.
>>>>
>>>> We just enable them together for DSI. So a separation is necessary.
>>>>
>>>> But I am still not totally convinced we even need to go down the 
>>>> path for having an op called setup_intf_cmd() which takes in a 
>>>> struct like
>>>>
>>>> struct dpu_cmd_intf_cfg {
>>>>      bool data_compress;
>>>>      bool widebus_en;
>>>> };
>>>>
>>>> As we have agreed that we will not touch the video mode timing 
>>>> engine path, it leaves us with only two bits.
>>>>
>>>> And like I said, its not that these two bits always go together. We 
>>>> want to be able to control them independently which means that its 
>>>> not necessary both bits program the same register one by one. We 
>>>> might just end up programming one of them if we just use widebus.
>>>>
>>>> Thats why I am still leaning on keeping this approach.
>>>
>>> I do not like the idea of having small functions being called between 
>>> modules. So, yes there will a config of two booleans, but it is 
>>> preferable (and more scalable) compared to separate callbacks.
>>>
>>
>> I definitely agree with the scalable part and I even cross checked 
>> that the number of usable bitfields of this register is going up from 
>> one chipset to the other although once again that depends on whether 
>> we will use those features.
>>
>> For that reason I am not opposed to the struct idea.
>>
>> But there is also another pattern i am seeing which worries me. Usable 
>> bitfields sometimes even reduce. For those cases, if we go with a 
>> pre-defined struct it ends up with redundant members as those 
>> bitfields go away.
>>
>> With the function op based approach, we just call the op if the 
>> feature bit / core revision.
>>
>> So I wanted to check once more about the fact that we should consider 
>> not just expansion but also reduction.
> 
> As we have to support all generations, there is no actual reduction. 
> Newer SoCs do not have particular feature/bit, but older ones do. By 
> having multiple optional ops we just move this knowledge from 
> ops->complex_callback() to _setup_block_ops(). But more importantly the 
> caller gets more complicated. Instead of just calling ops->set_me_up(), 
> it has to check all the optional callbacks and call the one by one.
> 

Alright, I am thinking that perhaps because this register is kind of 
unique that its actually controlling a specific setting in the datapath, 
downstream also has separate ops for this.

But thats fine, we can go ahead with the struct based approach.

>>
>>> Not to mention that it allows us to program required registers 
>>> directly (by setting values) rather than using RMW cycles and thus 
>>> depending on the value being previously programmed to these registers.
>>>
>>
>> This will not change. We will still have to use RMW cycles to preserve 
>> the reset values of some of the fields as those are the right values 
>> for the registers and shouldnt be touched.
> 
> I'd like to point to the dpu_hw_intf_setup_timing_engine(), a close 
> rival callback, setting up the INTF for video mode. It does not do RMW 
> cycles, it just writes all the registers.
> 

Yes as it ends up ORing pretty much all the usable bits. So it works fine.

> In the worst case, there will be a single RMW instead of having multiple 
> of them.
> 
> 
>>
>>>>
>>>>>>  Similar to how dpu_hw_intf_setup_timing_engine() programs the
>>>>>> hw_intf - including widebus! - for video-mode.
>>>>>>
>>>>>> Or even more generically, have a struct similar to intf_timing_params
>>>>>> that says how the intf needs to be configured - without the caller
>>>>>> knowing about INTF_CONFIG2.
>>>>>>
>>>>>> struct dpu_hw_intf_cfg is a very good example of how we can use a 
>>>>>> single
>>>>>> struct and a single callback to configure multiple registers at once
>>>>>> based on some input parameters.
>>>>>>
>>>>>>> In addition, it seems that video mode does all its INTF_CONFIG2
>>>>>>> configuration separately in dpu_hw_intf_setup_timing_engine(). If we
>>>>>>> have a generic set_intf_config2() op, it might be good to have it as
>>>>>>> part of a larger cleanup where we have both video and command 
>>>>>>> mode use
>>>>>>> the generic op. What are your thoughts on this?
>>>>>>
>>>>>> Not in that way, but if there is a generic enable_compression() or
>>>>>> configure_compression() callback (or even more generic, similar to
>>>>>> setup_intf_cfg in dpu_hw_ctl) that would work for both video-mode and
>>>>>> command-mode, maybe that is beneficial.
>>>>>
>>>>> I'd rather not do this. Let's just 'setup timing enging' vs 'setup 
>>>>> CMD'. For example, it might also include setting up other INTF 
>>>>> parameters for CMD mode (if anything is required later on).
>>>>>
>>>>
>>>> Agreed on setup CMD but I dont know whether we need a setup CMD at all.
>>>> Seems like an overkill.
>>>>
>>>>>>
>>>>>> - Marijn
>>>>>
>>>
> 
