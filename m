Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5CBF703FCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 23:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245515AbjEOV2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 17:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245351AbjEOV2e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 17:28:34 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C889610E4D;
        Mon, 15 May 2023 14:28:16 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34FKt00D029642;
        Mon, 15 May 2023 21:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TQJEHXi0TLCNkapeCGSQUpsNiWrxDk2PaOR8nncjWPs=;
 b=TbkDjPDFPz0inBneXz4yq4in8WhyfhbxVeaTiIl5+/w6e3OxII/dYpe1cDMKMRW/RsOY
 E48M4n6imyAZIIJFYQ1iYb2gU1IEUr/A/F8hM/iqhwz14ROEILCc8J61ln8ImwYTy/gK
 GsHdEELHn6kZe/Pyvx8LRcWXKMoAuiRu/5HqzwNp/aTvZQZFd72JCQbDwojcfZuI3nZ+
 fXzqcJe4C49d5eIvP4JnALgnvhngDsBXVqapxIW8dcViok6Mvl9hdthhgDVDzLYTGu7N
 cSDb+eMLx8WIT8OwvuagcKUKj3CiaXZo1Thl5v1BdA9GQYlIOqvD0t3WryhFJo+E7sgP 0Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkjr01n2g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 May 2023 21:27:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34FLRWIo016401
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 May 2023 21:27:32 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 15 May
 2023 14:27:31 -0700
Message-ID: <d7d7cc13-25e4-5a8e-e803-e8c3cfbe22a3@quicinc.com>
Date:   Mon, 15 May 2023 14:26:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v8 1/8] drm/msm/dpu: add dsc blocks for remaining chipsets
 in catalog
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
CC:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <andersson@kernel.org>, <quic_jesszhan@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-2-git-send-email-quic_khsieh@quicinc.com>
 <4tmuqrz3du7pwwih3gzp6zveyfvwxj3meeksgxkbg2v5mdtyu3@e5xxuoe64rvv>
 <69538f77-ff08-c3ce-3d4a-9f7250ee2505@quicinc.com>
 <u47xthqfjxpbbzjbvnrz4qa2f2m3aip4iose7cwuhzg4raf7db@qxbos7u55wko>
 <d10da0ce-a22e-24e9-e895-fae4c3a35222@quicinc.com>
 <zkvmqpcdgeg3qjkddopqx2yfipmqjjyva2cnk5bq4npxzxto4v@gfgvp5hkblkm>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <zkvmqpcdgeg3qjkddopqx2yfipmqjjyva2cnk5bq4npxzxto4v@gfgvp5hkblkm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: umyaAh8G_r_m8I5NCpNocSuAqCkYu1IM
X-Proofpoint-GUID: umyaAh8G_r_m8I5NCpNocSuAqCkYu1IM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_19,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=957 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150176
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/15/2023 2:23 PM, Marijn Suijten wrote:
> On 2023-05-15 13:58:35, Abhinav Kumar wrote:
>>
>>
>>
>> On 5/15/2023 1:07 PM, Marijn Suijten wrote:
>>> On 2023-05-15 11:20:02, Abhinav Kumar wrote:
>>>>
>>>>
>>>>
>>>> On 5/14/2023 2:39 PM, Marijn Suijten wrote:
>>>>> DSC*, and mention 1.1 explicitly (since this skips the 1.2 blocks, while
>>>>> the series is clearly aimed at 1.1...).  This was done for the DSC 1.2
>>>>> HW block patch after all.
>>>>>
>>>>> in catalog -> to catalog
>>>>>
>>>>> But it's just two platforms, you can fit MSM8998 and SC8180X in the
>>>>> title.
>>>>>
>>>>> On 2023-05-12 11:00:16, Kuogee Hsieh wrote:
>>>>>>
>>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>
>>>>>> There are some platforms has DSC blocks but it is not declared at catalog.
>>>>>
>>>>> Some platforms have DSC blocks which have not yet been declared in the
>>>>> catalog.*
>>>>>
>>>>>> For completeness, this patch adds DSC blocks for platforms which missed
>>>>>> them.
>>>>>
>>>>> Drop "this patch":
>>>>>
>>>>>        Complete DSC 1.1 support for all platforms by adding the missing
>>>>>        blocks to MSM8998 and SC8180X.
>>>>>
>>>>>>
>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  7 +++++++
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 11 +++++++++++
>>>>>
>>>>> How about SC7180, and any other DPU 6.x revision?
>>>>>
>>>>
>>>> Will let kuogee respond to the other nits. There is no DSC in sc7180 /
>>>> sm6115 / qcm2290. So this patch is complete.
>>>
>>> Thank you for checking as I didn't have the DTS close (and it seems
>>> SC7180 would have supported this, but no).  I did check other SoCs in
>>> the DPU 6.x range that are currently floating in my tree and on the
>>> list, which do need their DSC 1.1 block added (both a single block at
>>> 0x81000 downstream, 0x80000 upstream), if you can in a resend Konrad:
>>>
>>> DPU 6.4 in SM6350: https://lore.kernel.org/linux-arm-msm/20230411-topic-straitlagoon_mdss-v3-6-9837d6b3516d@linaro.org/
>>> DPU 6.9 in SM6375: https://lore.kernel.org/linux-arm-msm/20230411-topic-straitlagoon_mdss-v3-8-9837d6b3516d@linaro.org/
>>>
>>
>> If these are still on the list, can Konrad add them to his change as
>> that way his catalog change will be complete? Otherwise I would prefer
>> to add them in a follow up change because marking this change as
>> dependent on a catalog change which adds a new chipset is not right.
> 
> The question was for Konrad (and I addressed him by name, not you) as
> his series is not merged and the DSC blocks can be added to it directly
> without depending on this series.  DSC 1.1 is after all available for
> some time now.
> 

Thanks for clarifying. Your reply was cut-off "if you can in a resend 
Konrad" so not sure what you were trying to tell.

> - Marijn
