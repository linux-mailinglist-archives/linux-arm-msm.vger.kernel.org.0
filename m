Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF6457DA225
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Oct 2023 23:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbjJ0VCj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 17:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbjJ0VCi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 17:02:38 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38E11AA
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 14:02:36 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39RKCJ5F000641;
        Fri, 27 Oct 2023 21:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LcabWClje58kfZlHe90HBop7olDghhGnplGu0JT4ZZQ=;
 b=Ia5a/jp/7Oi1Dl2DElpYgs6absTfR+jMr3iMVCS+olk3VUZuFC0hcma8eLT51g53rwQZ
 gqWYmAO9FT5XfIMiSpaEMq2q1RinWoDufRqGdVeraZiLuarrFcYCcG0ddYGZVYyLB4fR
 753OKX0OyjIfkyGnAN/Icc1w1+xZ6vBkFZp2UbhC/rN7E8Pn1irtvnBhNP79xZOiCqwM
 qBLKvF6Fn0ETKx75nEisAmBJ53COw6i32XmvqnzmekLgG2poxhd05Y/OKmNU1KnmYFy2
 HAV7nqrLuVQ9GGgeF3pb4neMCRKL+9/jRtp7QpADA/KdmXdNCX1ziZxz7W08HeZYvv+D 1Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tyww7349v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Oct 2023 21:02:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39RL2Nbq026012
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Oct 2023 21:02:23 GMT
Received: from [10.110.68.174] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 27 Oct
 2023 14:02:23 -0700
Message-ID: <37b52c67-7abb-d607-dc46-1cde33606997@quicinc.com>
Date:   Fri, 27 Oct 2023 14:02:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] drm/msm/dp: don't touch DP subconnector property
 in eDP case
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, Abel Vesa <abel.vesa@linaro.org>
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
 <20231025092711.851168-2-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231025092711.851168-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4wjctfClbZOyzMFDEiNhzLBC1jOHy0ys
X-Proofpoint-GUID: 4wjctfClbZOyzMFDEiNhzLBC1jOHy0ys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_20,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 clxscore=1011 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310270180
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/25/2023 2:23 AM, Dmitry Baryshkov wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> In case of the eDP connection there is no subconnetor and as such no
> subconnector property. Put drm_dp_set_subconnector_property() calls
> under the !is_edp condition.
> 
> Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 

We still need to unify the calls to drm_dp_set_subconnector_property() 
for the hpd connect/disconnect places preferably in 
dp_display_send_hpd_notification().

That way, we would have had to make this change only in one location.

If you want to pursue that as a separate patch, I am fine as well.

Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
