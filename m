Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F70A7682BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 01:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjG2Xpj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 19:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjG2Xpi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 19:45:38 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E5FD2D61
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 16:45:37 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36TNevCm011920;
        Sat, 29 Jul 2023 23:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ts0t/Mnm8P1Xr0k9TThn434FsJrgUvWS7Ix/Wvcf22k=;
 b=Fh2ZW6dU0IOErYZhxnTqRGwsw1CaWe8AZ0jfgjC0QcZIjKQE2isAnvcVttWN5KCy3LwJ
 aAxy/XKKVuKs/7hthZGVLBvHJq9KwwzOX/GC3ENgtnw2TtQAYmj+ge3/wm8imoURIkrc
 cN6hYC1Hz3gb8G7fSL4Y+5cTF7O+xFVt9lhdc2cGQuPnybchvnLmsWEkqDyf4RYr2hln
 +KYmX1/ulO0s/0F/8UaB23A2aIacySR/rCvEujUTq0+SpmvobsO+ejeIK5TLtTzh/CcE
 lGrJwD0hW2PtD3pR3upb7Sg6Y+KO2UoPws+ehdCRwXBVhvIpFs0PRMBkF0EZ/CxowNWC vQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s4usrh31c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 29 Jul 2023 23:45:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36TNjI6c015791
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 29 Jul 2023 23:45:18 GMT
Received: from [10.110.77.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Sat, 29 Jul
 2023 16:45:17 -0700
Message-ID: <79ff4dce-1dc3-f142-0372-1b0fffa0904d@quicinc.com>
Date:   Sat, 29 Jul 2023 16:45:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 7/7] drm/msm/dpu: drop BWC features from DPU_MDP_foo
 namespace
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
 <20230728213320.97309-8-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230728213320.97309-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: t-VMCwMNAv6hsuJs5NgpjwUhAqszpc_5
X-Proofpoint-ORIG-GUID: t-VMCwMNAv6hsuJs5NgpjwUhAqszpc_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 mlxlogscore=393 malwarescore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307290225
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/28/2023 2:33 PM, Dmitry Baryshkov wrote:
> The feature bits DPU_MDP_BWC, DPU_MDP_UBWC_1_0, and DPU_MDP_UBWC_1_5 are
> not used by the driver, drop them completely as a followup cleanup.
> 

"as a followup cleanup" is meaning you will do it later. But you are 
doing it in this patch. You can stop at "Drop them completely"

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 7 -------
>   1 file changed, 7 deletions(-)
> 

With that fixed,


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

