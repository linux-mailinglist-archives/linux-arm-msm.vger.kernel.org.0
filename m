Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18D287CD7D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Oct 2023 11:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbjJRJYc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Oct 2023 05:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjJRJYb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Oct 2023 05:24:31 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2775F7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 02:24:29 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39I7kfDU028707;
        Wed, 18 Oct 2023 09:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eqUAhgGFfN5evV7dATP9rpPAsRPLoLRHkDNDdhr8sbQ=;
 b=QQlv6xoqIJ0sN+Ags1Z91RMLkULGiXPY8kuLDc92A6VwvMw5QZYqo/lVB0HLxtW+2UNs
 N64YjKjXKp9oD0B/pH7TxP1isf7Slnq56k7cEvJNNukVv+tGZCopfuyIpHSNfRpOXUaA
 kGQzkZ8D21MZGbI+Kbmbnr22Wn1+iqgFawcup9TJPVmgG4OuYJmKVqsAARNVCQjNuvmH
 22CUdNgjlNuq1F8Fal7rLTbGK5sH3trpFdWYltVJYUreW7jfnm+TOIp6/kCZgYNu+iP4
 5GdqPNOuV926RTFvcT396opibHfbczsPE3RY95rzFPGzfIJmcUHcfj6HBssswxQYNg/M Ag== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tsb7xm6np-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Oct 2023 09:24:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39I9OI8X028815
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Oct 2023 09:24:18 GMT
Received: from [10.110.28.170] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 02:24:14 -0700
Message-ID: <883e40de-7d1d-03fb-014f-74db5b6ab406@quicinc.com>
Date:   Wed, 18 Oct 2023 02:24:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dp: attach the DP subconnector property
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
References: <20231018074627.55637-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231018074627.55637-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 56nuk7U11qEA2F_4U_WkGMpi4IYu5Hx8
X-Proofpoint-GUID: 56nuk7U11qEA2F_4U_WkGMpi4IYu5Hx8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_07,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180079
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/18/2023 12:46 AM, Dmitry Baryshkov wrote:
> While developing and testing the commit bfcc3d8f94f4 ("drm/msm/dp:
> support setting the DP subconnector type") I had the patch [1] in my
> tree. I haven't noticed that it was a dependency for the commit in
> question. Mea culpa.
> 

I agree with you that, we should be setting this in the framework is better.

Will review that one on the other patch.

But yes, we need to fix this regression first.

> Since the patch has not landed yet (and even was not reviewed)
> and since one of the bridges erroneously uses USB connector type instead
> of DP, attach the property directly from the MSM DP driver.
> 
> This fixes the following oops on DP HPD event:
> 
>   drm_object_property_set_value (drivers/gpu/drm/drm_mode_object.c:288)
>   dp_display_process_hpd_high (drivers/gpu/drm/msm/dp/dp_display.c:402)
>   dp_hpd_plug_handle.isra.0 (drivers/gpu/drm/msm/dp/dp_display.c:604)
>   hpd_event_thread (drivers/gpu/drm/msm/dp/dp_display.c:1110)
>   kthread (kernel/kthread.c:388)
>   ret_from_fork (arch/arm64/kernel/entry.S:858)
> 
> Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

One question, while reviewing the code, I see you have two calls to 
drm_dp_set_subconnector_property() for the connect and disconnect case.

Why cant we have just one call in dp_display_send_hpd_notification() for 
both cases?


>   drivers/gpu/drm/msm/dp/dp_drm.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 40e7344180e3..e3bdd7dd4cdc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -345,6 +345,9 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
>   	if (IS_ERR(connector))
>   		return connector;
>   
> +	if (!dp_display->is_edp)
> +		drm_connector_attach_dp_subconnector_property(connector);
> +
>   	drm_connector_attach_encoder(connector, encoder);
>   
>   	return connector;
