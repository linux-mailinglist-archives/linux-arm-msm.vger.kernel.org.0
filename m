Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1CB8746683
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 02:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjGDAT4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 20:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjGDAT4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 20:19:56 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1544E1
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 17:19:54 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 364060Av027960;
        Tue, 4 Jul 2023 00:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6ipvdvx1u2BLo3Sd8jimXiWjU9K4sFl/VgO3JgkZe2k=;
 b=YqnupMooAdM/OrMSM2V7dpjP1mzG0wdV1u/PwroBk9tgnGZPAQHahue74P2unINcoeip
 8OMMuFSup94UMSBUZ/kDuqpp3f1UuH3H2or72AbWqcQV3RAuEWvhyDP4akmnHfcC0b6V
 4L9R0H7xVgDGXxUnpFwR5lg5/eDkB5oGr8Qt6nVcdv7ivXl6EY7phEN7hmGMtNheAHA9
 ZCoO9V8DsJN9mzDytIX24dSDvuY1ejknHjL7Vdj7Wrtxq0oKY0p8D5tY0ZWiZArdmBv1
 IP6zdeZU8l8DTuEobmao4opMZGNg2CA8EAof014ShOCGsKErU09NbFlt3+VkCOqkKpIf VA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rkwephby8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Jul 2023 00:19:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3640Jgua032018
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 4 Jul 2023 00:19:42 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 17:19:41 -0700
Message-ID: <9c13ecf8-c093-e145-3a79-d0686fc5d6e7@quicinc.com>
Date:   Mon, 3 Jul 2023 17:19:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 7/8] drm/msm/dpu: drop dpu_core_perf_destroy()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-8-dmitry.baryshkov@linaro.org>
 <b2499f3d-46d4-216e-9142-87d73e26781e@quicinc.com>
 <CAA8EJpq43fKi=L11cyfBddcP+n994bhFchHcNprnR=Vu823BiA@mail.gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpq43fKi=L11cyfBddcP+n994bhFchHcNprnR=Vu823BiA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2hxJPOR7efgFGLdD6NMQxL0vaEw4VkN6
X-Proofpoint-GUID: 2hxJPOR7efgFGLdD6NMQxL0vaEw4VkN6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_17,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040000
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/3/2023 3:59 PM, Dmitry Baryshkov wrote:
> On Tue, 4 Jul 2023 at 01:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
>>> This function does nothing, just clears several data pointers. Drop it
>>> now.
>>>
>>
>> This will undo what dpu_core_perf_init() did when an error happens.
>>
>> Why can we drop that?
> 
> Because nothing will use this data in an error case. There is no need
> to clean it.
> 

Usage is one thing for sure but I am still inclined to keep it symmetric 
with dpu_core_perf_init().

>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ------------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
>>>    3 files changed, 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>> index 78a7e3ea27a4..f779ad544347 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>> @@ -394,18 +394,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>>>    }
>>>    #endif
>>>
>>> -void dpu_core_perf_destroy(struct dpu_core_perf *perf)
>>> -{
>>> -     if (!perf) {
>>> -             DPU_ERROR("invalid parameters\n");
>>> -             return;
>>> -     }
>>> -
>>> -     perf->max_core_clk_rate = 0;
>>> -     perf->core_clk = NULL;
>>> -     perf->dev = NULL;
>>> -}
>>> -
>>>    int dpu_core_perf_init(struct dpu_core_perf *perf,
>>>                struct drm_device *dev,
>>>                const struct dpu_perf_cfg *perf_cfg,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>> index e8a7916b6f71..e1198c104b5e 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>> @@ -69,12 +69,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>>>     */
>>>    void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
>>>
>>> -/**
>>> - * dpu_core_perf_destroy - destroy the given core performance context
>>> - * @perf: Pointer to core performance context
>>> - */
>>> -void dpu_core_perf_destroy(struct dpu_core_perf *perf);
>>> -
>>>    /**
>>>     * dpu_core_perf_init - initialize the given core performance context
>>>     * @perf: Pointer to core performance context
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 6e62606e32de..4439147d2c35 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -1162,7 +1162,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>        return 0;
>>>
>>>    drm_obj_init_err:
>>> -     dpu_core_perf_destroy(&dpu_kms->perf);
>>>    hw_intr_init_err:
>>>    perf_err:
>>>    power_error:
> 
> 
> 
