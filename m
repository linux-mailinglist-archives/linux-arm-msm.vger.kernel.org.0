Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6CD724E20
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 22:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234080AbjFFU1l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 16:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238484AbjFFU1k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 16:27:40 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE803EA
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 13:27:38 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356JMmSp029905;
        Tue, 6 Jun 2023 20:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cFd1H5CzAzRPW3VocmtdJifsDwbMigFaCl9ukT47ExY=;
 b=n2GtH3v9/Yt1PxRvhp2Cf2mVKSraAHiQZTNKRKT7XR1B+O0R2FfC3TjBzMd/4itkouVV
 d3zSgjwnKqhS+LIr2A63fY8i9DHsKpatYrIgwzz60fjPQLFBmK3sNE2rhZepYYJIPR6H
 87NvT7qq5ayEUKZbTPa71CoMhXknAJghnZrm7A2Tix/Yme20wZ+j6vsRrcwrK++9btr0
 M/p2XcEZlnwFARC4RiCBu5HszOO5VNUVn+qLoNgNTqcltQAJCNoXJHY/LquYkOxNmBeP
 1l+hsBXuTE6VOroqn72T1xrmdDXsEpm6KYZuzJ3to2g5qxv9NTHIwnNa43taSnudkFfi dA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r2a9u8669-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Jun 2023 20:27:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356KRWFH024382
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 6 Jun 2023 20:27:32 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 6 Jun 2023
 13:27:30 -0700
Message-ID: <2d96100f-4dab-58a2-3455-6d599284deba@quicinc.com>
Date:   Tue, 6 Jun 2023 13:27:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [RFC PATCH v2 09/13] drm/msm/dpu: move pstate->pipe
 initialization to dpu_plane_atomic_check
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Sean Paul <sean@poorly.run>,
        Bjorn Andersson <andersson@kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-10-dmitry.baryshkov@linaro.org>
 <4af411bf-290c-0818-bdf2-878b2da15146@quicinc.com>
 <f010d346-fdbe-62b9-c403-4928b2e929fc@quicinc.com>
 <CAA8EJprOQdotGKv914khFuhC1UGLLwLp0nngPBORYtbCXJ5Nfg@mail.gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprOQdotGKv914khFuhC1UGLLwLp0nngPBORYtbCXJ5Nfg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C79ux-a5JrXoc1bEl3_KJ35IICXl_oxc
X-Proofpoint-GUID: C79ux-a5JrXoc1bEl3_KJ35IICXl_oxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_15,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306060173
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/24/2023 6:40 PM, Dmitry Baryshkov wrote:
> On Thu, 25 May 2023 at 02:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/24/2023 3:46 PM, Abhinav Kumar wrote:
>>>
>>>
>>> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>>>> In preparation to virtualized planes support, move pstate->pipe
>>>> initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
>>>> case of virtual planes the plane's pipe will not be known up to the
>>>> point of atomic_check() callback.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>
>>> Will legacy paths be broken with this? So lets say there is no
>>> atomic_check we will not have a valid sspp anymore.
>>
>> I think it should still work, even if goes through the modeset crtc, it
>> should still call drm_atomic_commit() internally which should have the
>> call to atomic_check, once you confirm this , i can ack this particular
>> change.
> 
> Can you please describe the scenario you have in mind? If I got you
> correctly, you were asking about the non-commit IOCTLs. Because of the
> atomic helpers being used (e.g. drm_atomic_helper_set_config()), they
> will also result in a call to drm_atomic_commit(), which invokes
> drm_atomic_check_only().
> 

Yes, that was pretty much the scenario I was referring to, thanks for 
confirming.

