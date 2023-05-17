Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A92EE7072DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 22:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjEQUTF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 16:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjEQUTC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 16:19:02 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AA31FE1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 13:19:01 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34HJKGl4002429;
        Wed, 17 May 2023 20:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cDtBtSPO2m9+QGF6t2wQqLOiOlZIFU0Nj123Ytq4ZaE=;
 b=R37ura42qDsvM4qvFLm7GePbtEaujNoytEYv+GD6TsLgo5+Ks2IxJrAb0giKMKQ9vMO5
 2LjoULPYQjCbKPLS5oYfUJb7nQO/Df5fUtw90OaeXk5wnHcXUj/XMSNTHpNTuozT27QJ
 vENAq0SdX2UmXkbrn4ApY51xEzScdpXAPtUbztDS1FWVr1V6ILGmJdSOacxqYKzt09vp
 EeE3a5ETd/Xh2amTwE/sDL3EvVGwwnmgv3dPhr2IiR8xKhnhLmr5KdQLo+3qNy6sd08u
 e4V2Ssx7ZXcuccP884QgY5dYPJlt7xjy8edM8/Cj8ZPlDi/0AGQkWGxQTcXCQDsOGo1v lw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmnypj871-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 20:18:54 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HKIrtB030404
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 20:18:53 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 17 May
 2023 13:18:53 -0700
Message-ID: <19b52c51-e12c-668a-9f43-6875523628b0@quicinc.com>
Date:   Wed, 17 May 2023 13:18:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v11 8/9] drm/msm/dsi: Use MSM and DRM DSC helper methods
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
CC:     <freedreno@lists.freedesktop.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Daniel Vetter" <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v11-8-30270e1eeac3@quicinc.com>
 <l5caompoxuarl3fxhpv37xmpahprvwn2w6mg2y4tla5uitckmf@ytytt7wivfs7>
 <xpfpp7aiy4i7girzqgvdjsthwwtewn4ffzugqp4xgkcqhgor4x@hlarb2cu5xsr>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <xpfpp7aiy4i7girzqgvdjsthwwtewn4ffzugqp4xgkcqhgor4x@hlarb2cu5xsr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vroVp-SidwajqRLcEyg1HZTrPeprq1GP
X-Proofpoint-ORIG-GUID: vroVp-SidwajqRLcEyg1HZTrPeprq1GP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170168
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/17/2023 12:25 PM, Marijn Suijten wrote:
> On 2023-05-17 21:13:36, Marijn Suijten wrote:
>>
>> On 2023-05-17 11:51:17, Jessica Zhang wrote:
>>>
>>> Use MSM and DRM DSC helper methods to configure DSC for DSI.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++++---
>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 74d38f90398a..b21108948061 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -28,6 +28,7 @@
>>>   #include "dsi.xml.h"
>>>   #include "sfpb.xml.h"
>>>   #include "dsi_cfg.h"
>>> +#include "msm_dsc_helper.h"
>>>   #include "msm_kms.h"
>>>   #include "msm_gem.h"
>>>   #include "phy/dsi_phy.h"
>>> @@ -848,7 +849,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>>>   	/* first calculate dsc parameters and then program
>>>   	 * compress mode registers
>>>   	 */
>>> -	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
>>> +	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>>>   
>>>   	/*
>>>   	 * If slice_count is greater than slice_per_intf
>>> @@ -858,7 +859,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>>>   	if (dsc->slice_count > slice_per_intf)
>>>   		dsc->slice_count = 1;
>>>   
>>> -	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
>>> +	total_bytes_per_intf = dsc->slice_count * slice_per_intf;
>>
>> Oh no, this line shouldn't have changed.  Besides not conforming to the
>> "use MSM and DRM DSC helper methods" title, this is now no longer
>> computing the bytes that we were in v10.  Was this tested?
> 
> Regarding testing, it probably goes unnoticed easily because of only
> being used in eol_byte_num = total_bytes_per_intf % 3: on hdisplay=1096
> and slice_count=slice_per_intf=2 both result in eol_byte_num=1 :)

Hi Marijn,

Acked. Will change this to slice_chunk_size.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>>
>> - Marijn
>>
>>>   
>>>   	eol_byte_num = total_bytes_per_intf % 3;
>>>   	pkt_per_line = slice_per_intf / dsc->slice_count;
>>> @@ -1759,7 +1760,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>>>   		return ret;
>>>   	}
>>>   
>>> -	dsc->initial_scale_value = 32;
>>> +	dsc->initial_scale_value = drm_dsc_initial_scale_value(dsc);
>>>   	dsc->line_buf_depth = dsc->bits_per_component + 1;
>>>   
>>>   	return drm_dsc_compute_rc_parameters(dsc);
>>>
>>> -- 
>>> 2.40.1
>>>
