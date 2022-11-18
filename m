Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48FAD62F7FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 15:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235247AbiKROp2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 09:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234971AbiKROp2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 09:45:28 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE17D40920;
        Fri, 18 Nov 2022 06:45:26 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIDnVpO003487;
        Fri, 18 Nov 2022 14:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=45szKB9HMCIjJIaxReIAixbIr8tB0OeHjY0Ybc5AIGA=;
 b=lij3t1SQHo50m8fvVqbT1bWDD1n9cUD7mzGjaibWkq24SQdxwsc5q+ZUmIescptPHjk1
 k5LU0bu3BP6OhTodN4aJ20+piv/T+H3lemwz5koJMT+dpAw1VXOXxT9rxEUOjDbmT1/v
 ZYM8dx1yO+uJIJMxisu1AIJVZwckinwEgTmeSVWisTTI5/1cpkp+eUaJwhBvb085HSdZ
 wqqDaGhAmkWZbER3U70tKeZDmXQhKLwIvkvVTz6S47eslG249UqzFh4YLphH+tZsV0T2
 SyWy9ejV762Jn4v3MfHxSs+5FIUX5Wjk0C1jXlkWZHXhUf7EXr0/Z8uh1oSwxcNlZPgb pQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kx0s5hxxr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Nov 2022 14:45:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AIEjHh8028370
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Nov 2022 14:45:17 GMT
Received: from [10.216.25.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 18 Nov
 2022 06:45:13 -0800
Message-ID: <78794d47-8e58-6586-6798-e8ac169a55fa@quicinc.com>
Date:   Fri, 18 Nov 2022 06:45:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] drm/msm/hdmi: remove unnecessary NULL check
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>, Rob Clark <robdclark@gmail.com>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
CC:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        <kernel-janitors@vger.kernel.org>
References: <Y3eCqQ2pm1uQnktV@kadam>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <Y3eCqQ2pm1uQnktV@kadam>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oiMrFxQ69HnT3JqLXuoYKAu4mfcfFEq1
X-Proofpoint-ORIG-GUID: oiMrFxQ69HnT3JqLXuoYKAu4mfcfFEq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180086
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/18/2022 5:03 AM, Dan Carpenter wrote:
> This code was recently refactored in commit and now the "hdmi" pointer
> can't be NULL.  Checking for NULL leads to a Smatch warning:
> 
>      drivers/gpu/drm/msm/hdmi/hdmi.c:141 msm_hdmi_init()
>      warn: variable dereferenced before check 'hdmi' (see line 119)
> 
> Fixes: 69a88d8633ec ("drm/msm/hdmi: move resource allocation to probe function")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> v2: Add a Fixes tag.  Re-work the commit message.
> 
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 7001fabd0977..4d3fdc806bef 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -138,8 +138,7 @@ static int msm_hdmi_init(struct hdmi *hdmi)
>   	return 0;
>   
>   fail:
> -	if (hdmi)
> -		msm_hdmi_destroy(hdmi);
> +	msm_hdmi_destroy(hdmi);
>   
>   	return ret;
>   }
