Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76A326ED903
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Apr 2023 01:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbjDXXxf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Apr 2023 19:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbjDXXxe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Apr 2023 19:53:34 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E897F3584;
        Mon, 24 Apr 2023 16:53:32 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33ONltPJ030573;
        Mon, 24 Apr 2023 23:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fJtV1tC+xliiI7TK0tA2IHi+7Mh6zQz2nzideO6BEuc=;
 b=GzAOt5U7efUwn/WIlH/hlO54m/GPNfu0ALO6U8eLAa63LqJqKhyotwiNBYO7CXXq6Jlq
 c3NpwxYqc5OTUrmXpOOTiS8f5q2X3+xrE6HYar4Xeeyxpgfr+QIjzMmPQQXH+dSDJQAh
 cfCsEQmkNwGmb3JLpIDnbcaiaI/+iDdwfqXNACPJQYol5W8ED+ehV2etzVTTXakVZ2Jz
 TCDr+y/NMr+urhemc7p8nirQ9v/TMMkznX0wh14SO9pi7nTc7HAhGn/TMShRzl5kVNBQ
 HvHPErTRRaLwl3UcI/xjdMdaSExERP/F5ahZRGweI4R1rDxkwu00N212rF1E4UgBIynB cA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q5qv1sn2p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 24 Apr 2023 23:52:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33ONqMss023434
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 24 Apr 2023 23:52:22 GMT
Received: from [10.110.104.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 24 Apr
 2023 16:52:20 -0700
Message-ID: <1f53b3c1-15b7-1c37-8025-0edab2a68a01@quicinc.com>
Date:   Mon, 24 Apr 2023 16:52:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 03/17] drm/msm/dpu: Move non-MDP_TOP INTF_INTR offsets
 out of hwio header
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
CC:     Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Adam Skladowski <a39.skl@gmail.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        "Neil Armstrong" <neil.armstrong@linaro.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Jordan Crouse" <jordan@cosmicpenguin.net>,
        Archit Taneja <architt@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-3-ef76c877eb97@somainline.org>
 <62d78d23-e191-a64f-5c4c-cd2c26217bdf@quicinc.com>
 <7j6ww6nkplq6adjgpzu3uyswdmid2oxldpwlmis6cyw7tcbkrh@whpmzhsl5rpj>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <7j6ww6nkplq6adjgpzu3uyswdmid2oxldpwlmis6cyw7tcbkrh@whpmzhsl5rpj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: U5ioIC7eklwJBiXBSFllfkQzEaE-ATa6
X-Proofpoint-ORIG-GUID: U5ioIC7eklwJBiXBSFllfkQzEaE-ATa6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_11,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240217
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/24/2023 3:25 PM, Marijn Suijten wrote:
> On 2023-04-24 13:44:55, Abhinav Kumar wrote:
>>
>>
>> On 4/17/2023 1:21 PM, Marijn Suijten wrote:
>>> These offsets do not fall under the MDP TOP block and do not fit the
>>> comment right above.  Move them to dpu_hw_interrupts.c next to the
>>> repsective MDP_INTF_x_OFF interrupt block offsets.
>>>
>>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>
>> This change itself is fine, hence
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> One comment below.
>>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 5 ++++-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h          | 3 ---
>>>    2 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>> index 53326f25e40e..85c0bda3ff90 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>> @@ -15,7 +15,7 @@
>>>    
>>>    /*
>>>     * Register offsets in MDSS register file for the interrupt registers
>>> - * w.r.t. to the MDP base
>>> + * w.r.t. the MDP base
>>>     */
>>>    #define MDP_SSPP_TOP0_OFF		0x0
>>>    #define MDP_INTF_0_OFF			0x6A000
>>> @@ -24,6 +24,9 @@
>>>    #define MDP_INTF_3_OFF			0x6B800
>>>    #define MDP_INTF_4_OFF			0x6C000
>>>    #define MDP_INTF_5_OFF			0x6C800
>>> +#define INTF_INTR_EN			0x1c0
>>> +#define INTF_INTR_STATUS		0x1c4
>>> +#define INTF_INTR_CLEAR			0x1c8
>>>    #define MDP_AD4_0_OFF			0x7C000
>>>    #define MDP_AD4_1_OFF			0x7D000
>>>    #define MDP_AD4_INTR_EN_OFF		0x41c
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
>>> index feb9a729844a..5acd5683d25a 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
>>> @@ -21,9 +21,6 @@
>>>    #define HIST_INTR_EN                    0x01c
>>>    #define HIST_INTR_STATUS                0x020
>>>    #define HIST_INTR_CLEAR                 0x024
>>
>> Even HIST_INTR_*** need to be moved then.
> 
> These are relative to MDP_SSPP_TOP0_OFF too just like
> INTR(2)_{CLEAR,EN,STATUS} so I left them here.  Otherwise, *all* these
> interrupt masks are probably best moved to dpu_hw_interrupts.c for
> clarity, as that's also the only place they are used?
> 
> Let me know which way you prefer.
> 
> - Marijn

Ah okay, understood, this is fine then.

> 
>>> -#define INTF_INTR_EN                    0x1C0
>>> -#define INTF_INTR_STATUS                0x1C4
>>> -#define INTF_INTR_CLEAR                 0x1C8
>>>    #define SPLIT_DISPLAY_EN                0x2F4
>>>    #define SPLIT_DISPLAY_UPPER_PIPE_CTRL   0x2F8
>>>    #define DSPP_IGC_COLOR0_RAM_LUTN        0x300
>>>
