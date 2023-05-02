Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04E986F4D8B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 01:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjEBXTf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 19:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjEBXTe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 19:19:34 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD2C02683
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 16:19:32 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 342MOkwg011136;
        Tue, 2 May 2023 23:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jSiJMTWAHtEvbX2A3faOMNrwFiggTq7lI6h+usp1l/o=;
 b=hA2oIPbPcfIDLCd5sAWJOQI/uo28mkBOc02BLMBM1fTNggofd1gnYFjskDm1dKbYNxIX
 TRg28/V8b6EwPmuIu4q2lpifn6QHcZDyhTrfPuVnebM6mGjKJGNCcZ9dK9elF2P2PIrj
 kwp39P9/19CTkmEyJqZz199G3P4IBkJMdCodfBDwUg5gqG+OLt9NDNfFmmlvvqgkqOkr
 yHLmOEpJ0rMYwg+n73UW7uz89YyDpwNGvAMPQLNIRwNym9SkbeZEICfrL9vtC0+Ki6b0
 /6FG24vWW/jQzxMefrn6uod/efqkR3DdG3HuD1tjT1X97Ve+8fxzQqodQvLZBxf/1GeE ug== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qawak24gq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 May 2023 23:19:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 342NJCIF012451
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 2 May 2023 23:19:12 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 2 May 2023
 16:19:12 -0700
Message-ID: <7409245f-fe33-c892-40a8-7a8e8437f0b0@quicinc.com>
Date:   Tue, 2 May 2023 16:19:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 4/7] drm/msm/dpu: drop duplicated intf/wb indices from
 encoder structs
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
 <20230430235732.3341119-5-dmitry.baryshkov@linaro.org>
 <dae23075-b907-48c0-7605-f91589630beb@quicinc.com>
 <CAA8EJppO3GhsRVY-5UjOO-GAw_NZONPaNBigO4P4_axXxNxsaA@mail.gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppO3GhsRVY-5UjOO-GAw_NZONPaNBigO4P4_axXxNxsaA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ayaDcmDxn74kG2uRD6_vz1X1gAmEbVQn
X-Proofpoint-ORIG-GUID: ayaDcmDxn74kG2uRD6_vz1X1gAmEbVQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_12,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020199
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/2/2023 4:15 PM, Dmitry Baryshkov wrote:
> On Wed, 3 May 2023 at 02:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
>>> Remove intf_idx and wb_idx fields from struct dpu_encoder_phys and
>>> struct dpu_enc_phys_init_params. Set the hw_intf and hw_wb directly and
>>> use them to get the instance index.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>>   From whatever I can see, this will not affect functionality of intf or
>> wb and cleans it up well , so I am fine with this. Hence,
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> One minor comment/question.
>>
>> <snipped other parts>
>>
>>> @@ -761,7 +761,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>>>        struct dpu_encoder_phys_cmd *cmd_enc = NULL;
>>>        int ret = 0;
>>>
>>> -     DPU_DEBUG("intf %d\n", p->intf_idx - INTF_0);
>>
>> Was it intentional to drop the index in this log?
> 
> We don't have p->intf_idx at this point. I think we can use
> p->hw_intf->idx instead, I'll fix that for v2.
> 

Yes, I was aware that. In all other logs, intf_idx was replaced with 
hw_intf->idx except this one. So I was not sure if it was intentional or 
just removed accidentally.

>>
>>> +     DPU_DEBUG("intf\n");
>>>
>>>        cmd_enc = kzalloc(sizeof(*cmd_enc), GFP_KERNEL);
> 
> 
> 
