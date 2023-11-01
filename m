Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33CF97DE47B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Nov 2023 17:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjKAQUA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Nov 2023 12:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbjKAQUA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Nov 2023 12:20:00 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 238E210D
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Nov 2023 09:19:54 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A1FHncX031309;
        Wed, 1 Nov 2023 16:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qIDfRclwmVW4bUQaDgNOX8ntX5drD6pPtwhbsSRtm6c=;
 b=Xf3xxFnsc6dswEsVk/bVhNIIdcCBa6femDh7c1E8rIABrtFTBo2yVBjNjSeuLoxVd+Vm
 KHrlVcPTo31Vy63apPhnSH71285Xo0gL/SPYHEbn8OgjYIpkzNDspFKsMkqoyDmWgfnr
 uZ9bNy7UZh9sBqM3fI0f7hRXl6RSPPUloP0GqsIpTfpB4E0gTo3/91WRM6actt9kKvvg
 J2V9E7rgwjHBJG26vBTrLZMHiKWAVk377M19QsQoFvLLyEYHwtz29tG4LjO/w9zugYId
 IWV8hnRWvNQEdu87to/Ah909bXTs5rl8KVvp1ToqEUCnpOzngEVfKS/aaWf04r3QDV0k hA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u3s6p86fw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Nov 2023 16:19:42 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A1GJfvD018151
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 1 Nov 2023 16:19:41 GMT
Received: from [10.134.69.165] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 1 Nov
 2023 09:19:40 -0700
Message-ID: <755dcf17-200f-4c02-a232-c4388a177d77@quicinc.com>
Date:   Wed, 1 Nov 2023 09:19:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/dp: attach the DP subconnector property
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, Abel Vesa <abel.vesa@linaro.org>
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
 <20231025092711.851168-3-dmitry.baryshkov@linaro.org>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231025092711.851168-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: usyAe6yuW86h8WBgYMSPZMZNH-WMIqFI
X-Proofpoint-ORIG-GUID: usyAe6yuW86h8WBgYMSPZMZNH-WMIqFI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_13,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0
 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311010129
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/25/2023 2:23 AM, Dmitry Baryshkov wrote:
> While developing and testing the commit bfcc3d8f94f4 ("drm/msm/dp:
> support setting the DP subconnector type") I had the patch [1] in my
> tree. I haven't noticed that it was a dependency for the commit in
> question. Mea culpa.
> 
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
> [1] https://patchwork.freedesktop.org/patch/555530/

Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SC7280

> 
> Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
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
> -- 
> 2.42.0
> 
