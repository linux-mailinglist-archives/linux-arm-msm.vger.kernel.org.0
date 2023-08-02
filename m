Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D08C876D8D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 22:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbjHBUuB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 16:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbjHBUuA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 16:50:00 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4D41FF2
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 13:49:59 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 372DfL5I019235;
        Wed, 2 Aug 2023 20:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LJ3/05DaywZuZ4/vziTgFISmUA89IEZ+tH1Ta7LeZns=;
 b=CnqTmOA9VD48EI8M7D+s/9T0nGUlc1bcL+Tt2vWNAhGALcNiUFN9mRIw7QiT2AhEDL6i
 bsxj9v8Zk7iXP8wU5BdOZumksbabmCVHYjQPGy1qyGGX5FtJjNbEU9cn8yp7C67pvJbc
 wf3ZyLj1aafYVWQUBfMVErTE8xa+fT3tEYDCMDlwG5e8jgiefNe2PjXgkd+wJ349Wzfi
 SH7z6Z9COm9Xc7o9EBqMpZw6Elmpd523+D+1ozR8FCr5NG2kJ382UzoqrUkOh67mr1FF
 umPo7eFwJK+y3CAndVer+buR6+glv58MPti8vueH9WK2UiyOaX7SFdjwpGdt1Lq4hdmr rA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s75dgbgb6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Aug 2023 20:49:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 372Knirg029796
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 2 Aug 2023 20:49:44 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 2 Aug
 2023 13:49:44 -0700
Message-ID: <e97d37d4-77bb-7e7d-073f-290088b63d5f@quicinc.com>
Date:   Wed, 2 Aug 2023 13:49:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: fix DSC 1.2 enc subblock length
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
 <20230802183655.4188640-2-dmitry.baryshkov@linaro.org>
 <qphzjpmmqfhti3tblhtv26xl4erzyi6xi6piyjvdzhji6bdnik@ivsgw364ea5u>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <qphzjpmmqfhti3tblhtv26xl4erzyi6xi6piyjvdzhji6bdnik@ivsgw364ea5u>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zXLl8UJjNikW4vwiwj39MxHcWVqilb_I
X-Proofpoint-ORIG-GUID: zXLl8UJjNikW4vwiwj39MxHcWVqilb_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_18,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020183
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/2/2023 12:46 PM, Marijn Suijten wrote:
> On 2023-08-02 21:36:55, Dmitry Baryshkov wrote:
>> Both struct dpu_dsc_sub_blks instances declare enc subblock length to be
>> 0x100, while the actual length is 0x9c (last register having offset 0x98).
>> Reduce subblock length to remove the empty register space from being
>> dumped.
>>
>> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> Changes since v1:
>>   - Rebased on top of the catalog changes
>>
>> ---
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 3ff07d7cbf4b..f1bac5e88249 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -456,12 +456,12 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>>    * DSC sub blocks config
>>    *************************************************************/
>>   static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
>> -	.enc = {.name = "enc", .base = 0x100, .len = 0x100},
>> +	.enc = {.name = "enc", .base = 0x100, .len = 0x9c},
>>   	.ctl = {.name = "ctl", .base = 0xF00, .len = 0x10},
> 
> For the time being only ctl register 0x00 and 0x04 is touched,
> DATA_IN_SWAP and CLK_CTRL at 0x08 and 0x0c are defined but not used,
> though it might still be useful to see their current value in the dump.
> 
> - Marijn
> 

Yes, we should keep them.

>>   };
>>   
>>   static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
>> -	.enc = {.name = "enc", .base = 0x200, .len = 0x100},
>> +	.enc = {.name = "enc", .base = 0x200, .len = 0x9c},
>>   	.ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
>>   };
>>   
>> -- 
>> 2.39.2
>>
