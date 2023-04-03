Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 790756D53DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 23:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233314AbjDCVqc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 17:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232619AbjDCVqZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 17:46:25 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF0D10DA
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 14:45:57 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333Jt5K0026134;
        Mon, 3 Apr 2023 21:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=RkBPfHV8emcEFbk+rumA80U4z8KDVjKMtNbOHa3jIXA=;
 b=B5h8cA1MU5Y1eZiFKzagGIADWz+ufBWDkM5YTF0wD9750wnTI4o8DPZKoMfJt1ChGncR
 sakHJojwvORq4rqyIWJtP4BAZdCLoENkF7K0V8LjL+SSyi5oGbg0Hi46Kc9wSoOAqeuH
 pBX2iC4Y3OjCX20ATMDLKEK9S382aBJVvDTjfRrlaB71yQoeyUYEwEUqAo1gZKKxmEce
 tt84v+TyaFnKZ/EOaZN+7zrzuU75/5hdwNvyFQ7wAEAXKILnztr5+wVRHWKRZLmHtGTs
 G6wNcC1KsQd51qivw0bZGpZ3jiVoKbfpzCmgwybLTvcfoyg3vA3qdwrOebhpOyoD7ZD0 oA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqu7f1te1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Apr 2023 21:45:30 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 333LjTTE025345
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 3 Apr 2023 21:45:29 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 3 Apr 2023
 14:45:28 -0700
Message-ID: <b20b78ff-067d-769a-2266-94662d224843@quicinc.com>
Date:   Mon, 3 Apr 2023 14:45:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC v2 4/6] drm/msm/dpu: Fix slice_last_group_size
 calculation
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <freedreno@lists.freedesktop.org>
CC:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-4-3c13ced536b2@quicinc.com>
 <b3a9fecd-0677-482b-7066-03465d5f0dd0@linaro.org>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <b3a9fecd-0677-482b-7066-03465d5f0dd0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x8yY0-yusmJCYXvPjJwPEDW2Bh57KF6Y
X-Proofpoint-ORIG-GUID: x8yY0-yusmJCYXvPjJwPEDW2Bh57KF6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_17,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030171
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/2/2023 4:27 AM, Dmitry Baryshkov wrote:
> On 31/03/2023 21:49, Jessica Zhang wrote:
>> Correct the math for slice_last_group_size so that it matches the
>> calculations downstream.
>>
>> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>> index b952f7d2b7f5..9312a8d7fbd9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>> @@ -56,7 +56,11 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc 
>> *hw_dsc,
>>       if (is_cmd_mode)
>>           initial_lines += 1;
>> -    slice_last_group_size = 3 - (dsc->slice_width % 3);
>> +    slice_last_group_size = dsc->slice_width % 3;
>> +
>> +    if (slice_last_group_size == 0)
>> +        slice_last_group_size = 3;
> 
> Hmm. As I went on checking this against techpack:
> 
> mod = dsc->slice_width % 3
> 
> mod | techpack | old | your_patch
> 0   | 2        | 3   | 3
> 1   | 0        | 2   | 1
> 2   | 1        | 1   | 2
> 
> So, obviously neither old nor new code match the calculations of the 
> techpack. If we assume that sde_dsc_helper code is correct (which I have 
> no reasons to doubt), then the proper code should be:
> 
> slice_last_group_size = (dsc->slice_width + 2) % 3;
> 
> Could you please doublecheck and adjust.

Hi Dmitry,

The calculation should match the techpack calculation (I kept the `data 
|= ((slice_last_group_size - 1) << 18);` a few lines down).

Thanks,

Jessica Zhang

> 
>> +
>>       data = (initial_lines << 20);
>>       data |= ((slice_last_group_size - 1) << 18);
>>       /* bpp is 6.4 format, 4 LSBs bits are for fractional part */
>>
> 
> -- 
> With best wishes
> Dmitry
> 
