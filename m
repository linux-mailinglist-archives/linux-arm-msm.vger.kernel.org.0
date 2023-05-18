Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 864807076E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 02:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbjERA0e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 20:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjERA0d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 20:26:33 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B363C01
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 17:26:29 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34I0HRpR022557;
        Thu, 18 May 2023 00:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cU+n8MKA38qcj6TYnxKksojZTHSK5qDOfu+y76UH49I=;
 b=eei7PUm0anLBeft5RaPS8w4lbFZ4/SyA15IYmbvYvVi0/dsimAGhxFH+pUOOouonT7Al
 XErhUnfG9mCp4pT+26sx7GsH84jhmofbOL2NvwM50iWFMTytXiiYk3ma6p77RTKd5UTX
 mool5v9OF0agvc3dPWnOESSeCkbxiEwJuVrWsobrfplXVQdWxADtsxBG1gsg64T7VuDu
 LLx4BWDWmQ1C4wWQuPgD77USMf9IVNtDfupVAEr1Ns303bbygvvNK6a2nyrkvsyuv4s0
 GAxbCze9hnouOh1q8vsRoUeAZ2frEaPMgnY+jDr9UL3AvjNP2+OpzIuDyiI62pl3WWAG GQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qn73ur744-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 May 2023 00:26:22 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34I0QLeP002462
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 May 2023 00:26:21 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 17 May
 2023 17:26:21 -0700
Message-ID: <5413f99a-f2f5-9531-7d74-0b1eaf03b1c0@quicinc.com>
Date:   Wed, 17 May 2023 17:26:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v12 5/9] drm/msm: Add MSM-specific DSC helper methods
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
References: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v12-5-9cdb7401f614@quicinc.com>
 <pzqbkdgpiilcaqm2qezqp6qrmybt2d2wmiqifcq77h3i2uhjzf@pc5aeykhxknh>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <pzqbkdgpiilcaqm2qezqp6qrmybt2d2wmiqifcq77h3i2uhjzf@pc5aeykhxknh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LAyMemwtaKBUiupQJGyYaXMKUdDolQoV
X-Proofpoint-GUID: LAyMemwtaKBUiupQJGyYaXMKUdDolQoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=862 malwarescore=0
 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1015 adultscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180000
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/17/2023 4:01 PM, Marijn Suijten wrote:
> On 2023-05-17 15:27:18, Jessica Zhang wrote:
>> Introduce MSM-specific DSC helper methods, as some calculations are
>> common between DP and DSC.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 38 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
>> new file mode 100644
>> index 000000000000..c7d7ed026368
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
>> + *
>> + * Helper methods for MSM-specific DSC calculations that are common between timing engine,
>> + * DSI, and DP.
>> + */
>> +
>> +#ifndef MSM_DSC_HELPER_H_
>> +#define MSM_DSC_HELPER_H_
>> +
>> +#include <linux/math.h>
>> +#include <drm/display/drm_dsc_helper.h>
>> +
>> +/**
>> + * msm_dsc_calculate_slices_per_intf() - get number of slices per interface
> 
> Oh no, we just went to get to match the function below, and now this is
> back at calculate.  My bad, I wasn't clear enough in previous review: I
> meant the ext after the -, so "get number of" -> "calculate number of".

Hi Marijn,

Got it.

> 
> Sorry!
> 
>> + * @dsc: Pointer to drm dsc config struct
>> + * @intf_width: interface width in pixels
>> + * Returns: Integer representing the number of slices for the given interface
>> + */
>> +static inline u32 msm_dsc_calculate_slices_per_intf(const struct drm_dsc_config *dsc, int intf_width)
> 
> u32... also for intf_width?

Acked.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>> +{
>> +	return DIV_ROUND_UP(intf_width, dsc->slice_width);
>> +}
>> +
>> +/**
>> + * msm_dsc_get_bytes_per_line() - calculate bytes per line
>> + * @dsc: Pointer to drm dsc config struct
>> + * Returns: Integer value representing bytes per line. DSI and DP need
>> + *          to perform further calculations to turn this into pclk_per_intf,
>> + *          such as dividing by different values depending on if widebus is enabled.
>> + */
>> +static inline u32 msm_dsc_get_bytes_per_line(const struct drm_dsc_config *dsc)
>> +{
>> +	return dsc->slice_count * dsc->slice_chunk_size;
>> +}
>> +
>> +#endif /* MSM_DSC_HELPER_H_ */
>>
>> -- 
>> 2.40.1
>>
