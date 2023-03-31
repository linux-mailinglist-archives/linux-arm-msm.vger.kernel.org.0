Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD0B6D1509
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 03:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjCaBbc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 21:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjCaBbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 21:31:32 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF751116F
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 18:31:27 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32V0jRlq010420;
        Fri, 31 Mar 2023 01:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2Ff9NZEhxkhcYbOTl7L5K09pJN9TTiQor1Ut7PTMLHM=;
 b=UAnTfEY5ORr0rC9IPlGVrZapYA9e65xWsi6eIapvcIzz0u26M5b6DW4HvZRvIVKh7vOg
 ChRSMX1Jsnz2v9YknRirE3JhHyY04RPw1IwiZ+SrGc9yUrue2+m7o8xthD+mShjYG2HL
 blQyLSzynxIqS+FczyUV7+9QLjvtzDBPYzCisxJWBHCqxEEj4g2JOZvr/66tZFopIo8i
 JB6LevIJ2E/D9SsbYVGVswRmnhf3CylsS/M3KCHgMlmtd/2lVCxy/VjZUowY1btTTOBB
 g5QV2wRxqtYxcMtOz12dRh0BuJ1ZSrul8648NnrOYmKNJazVFVh1kyrG+Zbjdt9JUZ3n rg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pn7bya9nn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 31 Mar 2023 01:31:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32V1VIs2005154
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 31 Mar 2023 01:31:18 GMT
Received: from [10.110.53.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 30 Mar
 2023 18:31:17 -0700
Message-ID: <a0a08a99-7198-a503-8969-e6a468e1d5f7@quicinc.com>
Date:   Thu, 30 Mar 2023 18:31:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH RFC 5/5] drm/msm/dsi: Use MSM and DRM DSC helper methods
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
CC:     <freedreno@lists.freedesktop.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-5-f3e479f59b6d@quicinc.com>
 <0698ce89-d70c-c3f4-f006-18130858aacf@linaro.org>
 <2c9ac12f-df2f-8576-555b-3d84a6205ee3@quicinc.com>
 <c3ac5c2b-e0e0-5d7c-67d3-4fc2316b68c5@linaro.org>
 <6461a8b8-f620-5f9c-9533-f65ac42c0524@quicinc.com>
 <CAA8EJprriCLXR+P7ZOWLQCOhvi0WCUzNrCu4eyyqegNtPZbBUg@mail.gmail.com>
 <f5c3694f-a890-1087-4a73-34800cb40769@quicinc.com>
 <ba5d1916-2ef6-14c5-eba9-757740f860c2@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ba5d1916-2ef6-14c5-eba9-757740f860c2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ybBqtHST9FErzwSzV9aqGxdEr6O1Pr55
X-Proofpoint-GUID: ybBqtHST9FErzwSzV9aqGxdEr6O1Pr55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_14,2023-03-30_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310008
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/30/2023 6:25 PM, Dmitry Baryshkov wrote:
> On 31/03/2023 04:12, Jessica Zhang wrote:
>>
>>
>> On 3/30/2023 5:16 PM, Dmitry Baryshkov wrote:
>>> On Fri, 31 Mar 2023 at 03:07, Jessica Zhang 
>>> <quic_jesszhan@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 3/30/2023 4:14 PM, Dmitry Baryshkov wrote:
>>>>> On 31/03/2023 01:49, Jessica Zhang wrote:
>>>>>>
>>>>>>
>>>>>> On 3/29/2023 4:48 PM, Dmitry Baryshkov wrote:
>>>>>>> On 30/03/2023 02:18, Jessica Zhang wrote:
>>>>>>>> Use MSM and DRM DSC helper methods.
>>>>>>>>
>>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 18 ++++++++++++------
>>>>>>>>    1 file changed, 12 insertions(+), 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>>> index 74d38f90398a..7419fe58a941 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>>> @@ -31,6 +31,7 @@
>>>>>>>>    #include "msm_kms.h"
>>>>>>>>    #include "msm_gem.h"
>>>>>>>>    #include "phy/dsi_phy.h"
>>>>>>>> +#include "disp/msm_dsc_helper.h"
>>>>>>>>    #define DSI_RESET_TOGGLE_DELAY_MS 20
>>>>>>>> @@ -841,14 +842,14 @@ static void dsi_update_dsc_timing(struct
>>>>>>>> msm_dsi_host *msm_host, bool is_cmd_mod
>>>>>>>>    {
>>>>>>>>        struct drm_dsc_config *dsc = msm_host->dsc;
>>>>>>>>        u32 reg, reg_ctrl, reg_ctrl2;
>>>>>>>> -    u32 slice_per_intf, total_bytes_per_intf;
>>>>>>>> +    u32 slice_per_intf;
>>>>>>>>        u32 pkt_per_line;
>>>>>>>>        u32 eol_byte_num;
>>>>>>>>        /* first calculate dsc parameters and then program
>>>>>>>>         * compress mode registers
>>>>>>>>         */
>>>>>>>> -    slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
>>>>>>>> +    slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
>>>>>>>
>>>>>>> This looks good
>>>>>>>
>>>>>>>>        /*
>>>>>>>>         * If slice_count is greater than slice_per_intf
>>>>>>>> @@ -858,10 +859,10 @@ static void dsi_update_dsc_timing(struct
>>>>>>>> msm_dsi_host *msm_host, bool is_cmd_mod
>>>>>>>>        if (dsc->slice_count > slice_per_intf)
>>>>>>>>            dsc->slice_count = 1;
>>>>>>>> -    total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
>>>>>>>> +    eol_byte_num = msm_dsc_get_eol_byte_num(msm_host->dsc, 
>>>>>>>> hdisplay,
>>>>>>>> +            dsi_get_bpp(msm_host->format));
>>>>>>>> -    eol_byte_num = total_bytes_per_intf % 3;
>>>>>>>> -    pkt_per_line = slice_per_intf / dsc->slice_count;
>>>>>>>> +    pkt_per_line = slice_per_intf / MSM_DSC_SLICE_PER_PKT;
>>>>>>>
>>>>>>> And for these values the result is definitely changed. Separate 
>>>>>>> patch
>>>>>>> & description please. Just in case, "values per downstream 
>>>>>>> kernel" is
>>>>>>> not a proper description for such changes.
>>>>>>
>>>>>> Hi Dmitry,
>>>>>>
>>>>>> Sure, I can put this into a separate patch.
>>>>>>
>>>>>> The reason this was changed from slice_count to SLICE_PER_PKT was
>>>>>> because slice count and slice per packet aren't always equivalent.
>>>>>> There can be cases where panel configures DSC to have multiple soft
>>>>>> slices per interface, but the panel only specifies 1 slice per 
>>>>>> packet.
>>>>>
>>>>> Please put this nice description into the commit message. It is 
>>>>> exactly
>>>>> what I was looking for!
>>>>>
>>>>> BTW: Do you expect to change MSM_DSC_SLICE_PER_PKT later or it will 
>>>>> stay
>>>>> at "1"? If so, it might be easier to drop it and instead add a 
>>>>> comment.
>>>>
>>>> MSM_DSC_SLICE_PER_PKT is the default value for panels that don't 
>>>> specify
>>>> a slice_per_pkt value. (Now that I think about it, might be better to
>>>> call it MSM_DSC_DEFAULT_SLICE_PER_PKT instead...)
>>>
>>> Note, there is no slice_per_pkt in drm_dsc_config, so we must come up
>>> with another way to pass this data from the panel or to deduce the
>>> value in our driver.
>>
>> AFAIK we aren't developing on any panels that have a non-default 
>> slice-per-packet count right now, so I'm not sure if it would be worth 
>> the effort to add this if there's no panel we can validate it on.
>>
>> FWIW, downstream reads slice_per_pkt from a custom DT entry [1]
> 
> As you might guess, this approach is frowned upon in upstream kernel. 
> This info should come from panel (e.g. extend drm_dsc_config or deduce 
> the value in msm driver).
> 

Yes, I am already aware slice_per_pkt should come from the panel 
otherwise defaults to 1. Today MSM driver or even drm_panels for that 
matter dont support passing this.

We can extend adding it to the drm_panel and coming from there in 
another series. Let this series first add the support for DSC 1.2 for 
existing DSC 1.1 configurations. Even DSC 1.1 doesnt use custom 
slice_per_pkt today. So nothing broken.

>>
>> [1] 
>> https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/dsi-panel-r66451-dsc-fhd-plus-120hz-cmd.dtsi#115 
>>
>>
>>>
>>>>
>>>> I don't expect it to change in the future, but it's a little more
>>>> readable than just dividing by 1 IMO. If you prefer dropping the macro
>>>> and adding a comment, I'm also okay with that.
>>>
>>> There is no need to divide by 1, the value doesn't change. So I'd
>>> probably prefer something like:
>>>
>>> /* Default to 1 slice per packet */
>>> if (panel_slice_per_pkt)
>>>      pkt_per_line = slice_per_intf / panel_slice_per_pkt;
>>> else
>>>      pkt_per_line = slice_per_intf;
>>>
>>> Or:
>>>
>>> /* Default to 1 slice per packet */
>>> slice_per_pkt = 1;
>>> if (panel_slice_per_pkt)
>>>      slice_per_pkt = panel_slice_per_pkt;
>>> pkt_per_line = slice_per_intf / slice_per_pkt;
>>
>> Acked.
>>
> 
> 
