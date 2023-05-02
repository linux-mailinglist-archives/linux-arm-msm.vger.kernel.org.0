Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1514D6F4BB5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 22:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjEBU7n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 16:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjEBU7l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 16:59:41 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66781734
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 13:59:40 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 342K12Nn022535;
        Tue, 2 May 2023 20:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=U/MrBOoy56LZ0gbCxfsn04ZoYdiD9XnEBlFiPSU9630=;
 b=OyAXfBUHvKEs2y3laP2p36Cvy5QvYn+xwXi/YgNTDjC+ilNZR2m3JIZNo6ycpcZQ3EWQ
 wdvT5sL90OFYpOelfdBTtNC1pAkf7QLSPSNsga566M/qaW2Hy32bGnS1FHdTdSyWPZwk
 9pvyPczuydydsDsT3GNjCrMItpT50oRNRjQ8iQEybCPJtMLvmWuACfvC2XHMUw8BBM8Q
 RZ9WXqKHsmb50V4mkrQXxGtX3PKx1vQsDXXZshSYA/OLVvdrxgt9j1JhG4BllaoNvCv2
 lRpNT1gZ29T5CuiJciYQozysQMAvLQ+jldpG3eJhP9sG4DrL6sRXpusc5K65faZFs+Gb 7g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qawct9vgj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 May 2023 20:59:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 342KxQfJ020659
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 2 May 2023 20:59:26 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 2 May 2023
 13:59:25 -0700
Message-ID: <1953c899-b034-52d7-9ff0-914ca0bb5196@quicinc.com>
Date:   Tue, 2 May 2023 13:59:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/7] drm/msm/dpu: drop dpu_encoder_early_unregister
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-3-dmitry.baryshkov@linaro.org>
 <81d97939-1369-9a2d-01bb-ad8c8a4b7e5c@quicinc.com>
 <CAA8EJprD6biRhcx5pAJvb4Jfz_L-88_=zeySReN2Y5Nrtq+_Lw@mail.gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprD6biRhcx5pAJvb4Jfz_L-88_=zeySReN2Y5Nrtq+_Lw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OCu4jb4THWuk7ZLg6q-Nse2YknKf3j1L
X-Proofpoint-GUID: OCu4jb4THWuk7ZLg6q-Nse2YknKf3j1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_12,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020179
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/2/2023 1:54 PM, Dmitry Baryshkov wrote:
> On Tue, 2 May 2023 at 23:45, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
>>> There is no need to clean up debugfs manually, it will be done by the
>>> DRM core on device deregistration.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> There are two reasons to have the debugfs removed in the early_unregister:
>>
>> 1) Today, registration happens in late_register(), hence to balance the
>> the call in _dpu_encoder_init_debugfs(), this one is present.
>>
>> 2) In drm_modeset_register_all(), if drm_connector_register_all() fails,
>> it calls drm_encoder_unregister_all() first which calls early_unregister().
>>
>> So to balance these out, dont we need to keep it?
> 
> Please correct me if I'm wrong, drm_debugfs_cleanup() should take care of that.
> 

Not from what I am seeing, drm_debugfs_cleanup() is getting called from 
the error handling path of drm_dev_register() and separately from 
drm_dev_unregister() but not from the error handling path of 
drm_modeset_register_all().

So that case will be unbalanced with this change.

>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 8 --------
>>>    1 file changed, 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 32785cb1b079..8c45c949ec39 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -2154,13 +2154,6 @@ static int dpu_encoder_late_register(struct drm_encoder *encoder)
>>>        return _dpu_encoder_init_debugfs(encoder);
>>>    }
>>>
>>> -static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
>>> -{
>>> -     struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
>>> -
>>> -     debugfs_remove_recursive(dpu_enc->debugfs_root);
>>> -}
>>> -
>>>    static int dpu_encoder_virt_add_phys_encs(
>>>                struct msm_display_info *disp_info,
>>>                struct dpu_encoder_virt *dpu_enc,
>>> @@ -2374,7 +2367,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>>>    static const struct drm_encoder_funcs dpu_encoder_funcs = {
>>>                .destroy = dpu_encoder_destroy,
>>>                .late_register = dpu_encoder_late_register,
>>> -             .early_unregister = dpu_encoder_early_unregister,
>>>    };
>>>
>>>    struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
> 
