Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99F6868FAE4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 00:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjBHXJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 18:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjBHXJV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 18:09:21 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E8E29167
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 15:09:19 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318MFOs1029942;
        Wed, 8 Feb 2023 23:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2o5ZFL2SbDagTJj93K/8pcsCO750VvW3U8zcH081+Ac=;
 b=kC7+BN51+iecrBt6F38l7qk/YdqvViHiJNvDIC1RjJGIeaKF097D3yhM30kl4wOcIGG7
 VZDv6ZXoUWn13A/r/CWj4iUe0G1K1G+H91YcU11OnfW9/ybhkrrglr4hjAtmFlNSo053
 uEyCVpHREtd2H8cfLkxe4JSd/Br6Vro/PQIPfirMFq/c1GO513k9TAbuqu09bMWjPKPC
 RWXnzHukJSYTSxtg9d6kqpj6mssI3jlby768C1Aqx3OqjaPVbjaAaRfsRwVOx8ZRrc3M
 +JzvQZN8b0Ke8HxfUiQz8dBHeiMmY8fLr6mayCZ5c/Yey1fnf0QQ0t/9ebKdPZfDOtuL +Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nm7u8a422-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 08 Feb 2023 23:09:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 318N9B7J014383
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 8 Feb 2023 23:09:11 GMT
Received: from [10.110.17.125] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 8 Feb 2023
 15:09:10 -0800
Message-ID: <e9191a04-4479-6161-c2d4-2d7b04aca869@quicinc.com>
Date:   Wed, 8 Feb 2023 15:09:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 17/27] drm/msm/dpu: rewrite plane's QoS-related
 functions to take dpu_sw_pipe and dpu_format
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-18-dmitry.baryshkov@linaro.org>
 <767e71a1-2041-7b12-ffa6-22568f849e2a@quicinc.com>
 <3b20f4fb-37fa-7fbf-f5fa-d4857ddd56d8@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <3b20f4fb-37fa-7fbf-f5fa-d4857ddd56d8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YDXxn5EiuvNjU3-MWwN1QFOY007oJNSz
X-Proofpoint-ORIG-GUID: YDXxn5EiuvNjU3-MWwN1QFOY007oJNSz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_09,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080196
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/3/2023 3:20 PM, Dmitry Baryshkov wrote:
> On 04/02/2023 01:07, Abhinav Kumar wrote:
>>
>>
>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>> Rewrite dpu_plane's QoS related functions to take struct dpu_sw_pipe and
>>> struct dpu_format as arguments rather than fetching them from the
>>> pstate or drm_framebuffer.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Nothing wrong with the change as such but why is this needed?
>> I looked through tne next patches in the series briefly and unless I 
>> am missing something, I am not able to see how this rewrite is helping 
>> or needed for the remaining patches.
> 
> Having a separate pipe argument eases adding support for r_pipe. After 
> all these changes only upper level functions access pstate->pipe. Then 
> it becomes natural to do:
> 
> dpu_plane_do_something(plane->pipe);
> if (plane->r_pipe)
>      dpu_plane_do_something(plane->r_pipe);

Understood,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
