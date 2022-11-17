Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E547D62D21F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 05:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234430AbiKQEIC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 23:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234615AbiKQEHd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 23:07:33 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D268C4B987;
        Wed, 16 Nov 2022 20:04:34 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AH1HuMR002667;
        Thu, 17 Nov 2022 04:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=a++KL7xdar/RCqLS/mDi5J1eJ4XJgWkYEqifd2iF3Rw=;
 b=NmdNbQnOvxXy3CB8NNyBGLW1Dk62cVu40WGRTeYR9vNW9j/pSBffkdNGvkNee5sQO2eP
 R2AF50BYGuR3fyrywsG0ZIx6tqvW/LGnzOJz5Qjh3wViDO/jq786m9h8S07PCewmMvGP
 1axFkvF94fIPgYBd6iakzRnRxMnSEvRG46vbsk+BGIojg+tpJN6iye7dtM2eSqctjPAj
 xnAwqf57IGW32UetcbcJQq/qvJNx+w3rR27h6z/DERbSavZWFUkA2m9EQ6UGTFgEck3d
 yx02RhKbSzcFCec3E+HSFcOpclTdNST/QM6kvhMVy4XGW2JVVl2QCCi/yLOrOkg4/utt Tw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kw94q0sk9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Nov 2022 04:04:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AH44O6j020231
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Nov 2022 04:04:24 GMT
Received: from [10.216.25.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 16 Nov
 2022 20:04:19 -0800
Message-ID: <a6e0e71a-c696-57e0-7829-6511578a453b@quicinc.com>
Date:   Wed, 16 Nov 2022 20:04:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/hdmi: remove unnecessary NULL check
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
References: <Y2o0TKZ5WRYnQXna@kili>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <Y2o0TKZ5WRYnQXna@kili>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 53_u3boPsp7LYsw0zoLpVv2lKVRlYKA_
X-Proofpoint-ORIG-GUID: 53_u3boPsp7LYsw0zoLpVv2lKVRlYKA_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170027
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/15/2022 5:03 AM, Dan Carpenter wrote:
> This code was refactored in commit 69a88d8633ec ("drm/msm/hdmi: move
> resource allocation to probe function") and now the "hdmi" pointer can't
> be NULL.  Checking causes a Smatch warning:
> 
>      drivers/gpu/drm/msm/hdmi/hdmi.c:141 msm_hdmi_init()
>      warn: variable dereferenced before check 'hdmi' (see line 119)
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Can you please add the fixes tag to point to the commit you have 
referenced in the commit message?

LTGM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
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
